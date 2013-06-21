/*
 * TestCtrl.h
 *
 *  Created on: 2013-3-7
 *      Author: Administrator
 */

#ifndef TESTCTRL_H_
#define TESTCTRL_H_

#define IO_BUF_SIZE 256
#define API_SEQUENCE_SIZE 256
#define API_SEQUENCE_END  0xffffffff
extern unsigned char l_u1BufIn[];
extern unsigned char g_u1UserData[];
extern unsigned char g_u1BufOut[];
extern unsigned char g_u1DataOutDLC;
/*extern const unsigned char DataOut_ID;*/
extern unsigned long g_u4CallApiSequence[];

extern void Rs232_RxIndication(unsigned char u1RxData);
extern unsigned char Rs232_Read();
extern void Rs232_Write(unsigned char* pu1Buf,unsigned char u1Dlc);
extern void Test_Main(void);

#endif /* TESTCTRL_H_ */
