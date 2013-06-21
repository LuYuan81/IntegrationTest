/*============================================================================*/
/** Copyright (C) 2009-2011, iSOFT INFRASTRUCTURE SOFTWARE CO.,LTD.
 *  
 *  All rights reserved. This software is iSOFT property. Duplication 
 *  or disclosure without iSOFT written authorization is prohibited.
 *  
 *  @file       <Sci.c>
 *  @brief      <>
 *  
 *  <>
 *  
 *  @author     <ISOFT >
 *  @date       <2013-05-13>
 */
/*============================================================================*/

/*=======[I N C L U D E S]====================================================*/
#include "Sci.h"
#include <ctype.h>
#include <string.h>
#include <stdarg.h>
#include <mc9s12xep100.h>
#include "TestCtrl.h"

unsigned char RecData;

/*=======[F U N C T I O N   I M P L E M E N T A T I O N S]====================*/

/******************************************************************************/
/**
 * @brief               <>
 * 
 * <> .
 * Service ID   :       <None>
 * Sync/Async   :       <Synchronous/Asynchronous>
 * Reentrancy           <Reentrant/Non Reentrant>
 * @param[in]           <None>
 * @param[out]          <None>
 * @param[in/out]       <None>
 * @return              <None>    
 */
 /******************************************************************************/
void Sci_InitESCI_0 (void)
{
   	SCI0CR2 = 0x2c; //enable Receive Full Interrupt,RX enable,Tx enable
    SCI0BDH = 0x00; //busclk  8MHz,19200bps,SCI0BDL=0x1a
    SCI0BDL = 0x68; //SCI0BDL=busclk/(16*SCI0BDL)
                  	//busclk  8MHz, 9600bps,SCI0BDL=0x34
                  	//busclk 16MHz, 9600bps,SCI0BDL=0x68
                  	//busclk 24MHz, 9600bps,SCI0BDL=0x9C
                  	//busclk 32MHz, 9600bps,SCI0BDL=0xD0

}

/******************************************************************************/
/**
 * @brief               <>
 * 
 * <> .
 * Service ID   :       <None>
 * Sync/Async   :       <Synchronous/Asynchronous>
 * Reentrancy           <Reentrant/Non Reentrant>
 * @param[in]           <None>
 * @param[out]          <None>
 * @param[in/out]       <None>
 * @return              <None>    
 */
 /******************************************************************************/
 void Sci_Init(void)
{
	Sci_InitESCI_0();       /* Enable Tx/Rx for 9600 baud, 8 bits, no parity */
}

/******************************************************************************/
/**
 * @brief               <>
 * 
 * <> .
 * Service ID   :       <None>
 * Sync/Async   :       <Synchronous/Asynchronous>
 * Reentrancy           <Reentrant/Non Reentrant>
 * @param[in]           <data>
 * @param[out]          <None>
 * @param[in/out]       <None>
 * @return              <None>    
 */
/******************************************************************************/
void putdata(unsigned char data)
{
    while(!(SCI0SR1 & 0x80)) ; 		    /*keep waiting when not empty*/  
    SCI0DRL = data;

}

/******************************************************************************/
/**
 * @brief               <>
 * 
 * <> .
 * Service ID   :       <None>
 * Sync/Async   :       <Synchronous/Asynchronous>
 * Reentrancy           <Reentrant/Non Reentrant>
 * @param[in]           <data[]>
 * @param[out]          <None>
 * @param[in/out]       <None>
 * @return              <None>    
 */
/******************************************************************************/
void Put_String(unsigned char data[])
{
    unsigned char i;
    for(i = 0; i< strlen(data); i++)
    {
        while(!(SCI0SR1&0x80)) ; 		    /*keep waiting when not empty*/  
        SCI0DRL = data[i];
    }
}

 /******************************************************************************/
/**
 * @brief               <>
 * 
 * <> .
 * Service ID   :       <None>
 * Sync/Async   :       <Synchronous/Asynchronous>
 * Reentrancy           <Reentrant/Non Reentrant>
 * @param[in]           <val>
 * @param[out]          <None>
 * @param[in/out]       <None>
 * @return              <None>    
 */
/******************************************************************************/
void Put_Data(uint16 val)
{

#if (PLATFORM==MPC5634_PLATFORM)/*mpc5634*/ 
 
    char a[11];
    
    a[10] = '\0';
    a[9] = '0' + val%10;
    val = val/10;
    a[8] = '0' + val%10;
    val = val/10;
    a[7] = '0' + val%10;
    val = val/10;
    a[6] = '0' + val%10;
    val = val/10;
    a[5] = '0' + val%10;
    val = val/10;
    a[4] = '0' + val%10;
    val = val/10;
    a[3] = '0' + val%10;
    val = val/10;
    a[2] = '0' + val%10;
    val = val/10;
    a[1] = '0' + val%10;
    a[0] = '0' + val/10;
    
#else     /*9s12*/

    char a[6];
    
    a[5] = '\0' ;
    a[4] = '0' + val%10;
    val = val/10;
    a[3] = '0' + val%10;
    val = val/10;
    a[2] = '0' + val%10;
    val = val/10;
    a[1] = '0' + val%10;
    a[0] = '0' + val/10;
    
 #endif 
 
  Put_String(a);
}

/******************************************************************************/
/**
 * @brief               <>
 * 
 * <> .
 * Service ID   :       <None>
 * Sync/Async   :       <Synchronous/Asynchronous>
 * Reentrancy           <Reentrant/Non Reentrant>
 * @param[in]           <None>
 * @param[out]          <None>
 * @param[in/out]       <None>
 * @return              <None>    
 */
/******************************************************************************/
void ReceiveData (void) 
{
	while(!(SCI0SR1_RDRF)) ; 		    /*keep waiting when not empty*/  
    RecData = SCI0DRL;
}
/******************************************************************************/
/**
 * @brief               <>
 * 
 * <> .
 * Service ID   :       <None>
 * Sync/Async   :       <Synchronous/Asynchronous>
 * Reentrancy           <Reentrant/Non Reentrant>
 * @param[in]           <None>
 * @param[out]          <None>
 * @param[in/out]       <None>
 * @return              <None>    
 */
/******************************************************************************/
__interrupt void Sci_Rx_ISR(void)
{
	unsigned char Rx_Data; 

		
	while(!(SCI0SR1_RDRF)) ; 		    /*keep waiting when not empty*/  
    Rx_Data = SCI0DRL;
	Rs232_RxIndication(Rx_Data);

	/*while(!(SCI0SR1 & 0x80)) ;*/ 		    /*keep waiting when not empty*/  
    /*SCI0DRL = Rx_Data;*/
    
}

/*==========================================================================*/
/*		E N D   O F   F I L E
/*==========================================================================*/