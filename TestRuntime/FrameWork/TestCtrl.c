/*
 * TestCtrl.c
 *
 *  Created on: 2013-3-7
 *      Author: Administrator
 */
 
#include "TestCtrl.h"
#include "Sci.h"
#include "Encapsulate.h"

unsigned char l_u1Rs232NewCommand = 0;
unsigned char l_u1Rs232CommandRecv = 0;
unsigned char l_u1Rx232DataNum = 0;			/* data counter*/
unsigned char l_u1Rx232CommLen = 0;			/* the length of the command except the ":" and id*/
unsigned char l_u1Rx232CommCS = 0;			/* command checksum*/

unsigned char l_u1BufIn[IO_BUF_SIZE];		/* all the data of rs232*/
unsigned char g_u1UserData[IO_BUF_SIZE];	/* user data of Rs232 */
unsigned char g_u1BufOut[IO_BUF_SIZE];
const unsigned char l_u1DataOutID = 0x55;	/* configure the tx id of the rs232 msg*/
unsigned char  g_u1DataOutDLC;				/* tx data length */

unsigned long g_u4CallApiSequence[API_SEQUENCE_SIZE];

/*
 * get the rs232 command type
 */
static void CommandTypeReceived(unsigned char *u1CommandType)
{
	switch(l_u1BufIn[3])
	{
		case 0x01:
		*u1CommandType = API_CALL;
			break;

		case 0x02:
		*u1CommandType = ECU_RESET;
			break;
			
		default:
			break;
	}

	return;
}

/*
 * get the user data from rs232 data
 */
static void GetUserData(unsigned char u1CommandType)
{
	unsigned char t_u1_Index;
	
	switch(u1CommandType)
	{
		case API_CALL:
			for(t_u1_Index = 0; t_u1_Index < l_u1Rx232CommLen - 2; t_u1_Index++)
			{
				g_u1UserData[t_u1_Index] = l_u1BufIn[t_u1_Index + 5];
			}
			break;

		case ECU_RESET:
		
			break;
			
		default:
			break;
	}

	return;
}

/*
 * get the receive data from SCI ISR
 */
void Rs232_RxIndication(unsigned char u1RxData)
{
	
	if(0x3a == u1RxData)
	{
		l_u1Rs232NewCommand = 1;
		l_u1Rx232DataNum = 0;
		l_u1Rx232CommCS = 0;
	}
	
	if(1 == l_u1Rs232NewCommand)
	{
		l_u1BufIn[l_u1Rx232DataNum] = u1RxData;
		
		if(0x02 == l_u1Rx232DataNum)
		{
			l_u1Rx232CommLen = l_u1BufIn[l_u1Rx232DataNum];
		}

		if((l_u1Rx232DataNum > 0) && (l_u1Rx232DataNum < l_u1Rx232CommLen + 3))
		{
			l_u1Rx232CommCS += l_u1BufIn[l_u1Rx232DataNum];
		}

		if((l_u1Rx232DataNum == l_u1Rx232CommLen + 3) &&
			 (l_u1Rx232CommCS == l_u1BufIn[l_u1Rx232DataNum]))
		{
			l_u1Rs232NewCommand = 0;
			l_u1Rs232CommandRecv = 1;
			l_u1Rx232CommCS = 0;
		}

		l_u1Rx232DataNum ++;
	}
}

/*
 * get the receive data
 */
unsigned char getchar(void)
{
	ReceiveData();

	return(RecData);
}

/*
 * Parse the RS232 Message, get API's index and inputs
 */
unsigned char Rs232_Read() 
{
	unsigned char t_u1_C;
	unsigned char t_u1_ID;
	unsigned char t_u1_DLC;
	unsigned char t_u1_i;
	unsigned char t_u1_Sum;
	  
	if(':' == getchar())
	{
		t_u1_ID  = getchar(); 
		t_u1_Sum  = t_u1_ID;
		t_u1_DLC = getchar(); 
		t_u1_Sum += t_u1_DLC;

		for(t_u1_i = 0;t_u1_i < t_u1_DLC;t_u1_i++)
		{

			t_u1_C = getchar();
			t_u1_Sum += t_u1_C;
			l_u1BufIn[t_u1_i] = t_u1_C;
		}

		if(t_u1_Sum == getchar())
		{
			return (1);
		}
		else
		{
			return (0);
		}
		
	}
	return 0;

}

/*
 * Send the content in Buf onto RS232
 */
void Rs232_Write(unsigned char* pu1Buf,unsigned char u1Dlc)
{
	unsigned char t_u1_Sum;
	
	putdata(':');
	putdata(l_u1DataOutID);  
	t_u1_Sum  = l_u1DataOutID;
	
	putdata(u1Dlc); 
	t_u1_Sum += u1Dlc;

	while(u1Dlc--)
	{
		putdata(*pu1Buf); 
		t_u1_Sum += *pu1Buf;
		pu1Buf++;
	}
	putdata(t_u1_Sum);
	
	return;

}

/*
 * Return the system timer value directly
 * Goal: To calculate the API's running time.
 */
unsigned long GetTimer() 
{
	unsigned long t_u4_SysTimer = 0x12345678;
	return t_u4_SysTimer;
}

/*
 * test run execute API call
 */
static void testrun_ApiCall(void)
{
	unsigned long t_u4_i = 0;
	unsigned char t_u1_FunctionID;
	unsigned char t_u1_IDFind = 0;

	t_u1_FunctionID = l_u1BufIn[4];							// Api index

	for(t_u4_i = 0; ((t_u4_i < g_u1FunctionNum) && (t_u1_IDFind == 0)); t_u4_i++)
	{
		if(g_stApiRegisterTable[t_u4_i].id == t_u1_FunctionID)
		{
			g_stApiRegisterTable[t_u4_i].testApiPtr();
			t_u1_IDFind = 1;
		}
	}

	Rs232_Write(g_u1BufOut,g_u1DataOutDLC);	

	return;
}

/*
 * test run execute ECU Reset
 */
static void testrun_EcuReset()
{
	
	g_stApiRegisterTable[1].testApiPtr();
	
	Rs232_Write(g_u1BufOut,g_u1DataOutDLC);	
}

/*
 * test control mian function
 */
void Test_Main(void) 
{
	unsigned char *t_pu1_Rs232Command;
	unsigned char t_u1_Sdu[8];

	t_pu1_Rs232Command = t_u1_Sdu;
	if(1 == l_u1Rs232CommandRecv)
	{
		l_u1Rs232CommandRecv = 0;
		
		CommandTypeReceived(t_pu1_Rs232Command);
		GetUserData(*t_pu1_Rs232Command);
		
		switch (*t_pu1_Rs232Command)
		{
			case API_CALL:
				testrun_ApiCall();
				break;

			case ECU_RESET:
				testrun_EcuReset();
				break;
				
			default:
				/* command type not supported	*/	
				putdata(0xaa);
				break;
		}
	
	}


	return;

}
