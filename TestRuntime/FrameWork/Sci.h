/*============================================================================*/
/** Copyright (C) 2009-2011, iSOFT INFRASTRUCTURE SOFTWARE CO.,LTD.
 *  
 *  All rights reserved. This software is iSOFT property. Duplication 
 *  or disclosure without iSOFT written authorization is prohibited.
 *  
 *  
 *  @file       <Sci.h>
 *  @brief      <>
 *  
 *  <>
 *  
 *  @author     <ISOFT>
 *  @date       <2012-09-14>
 */
/*============================================================================*/
#ifndef SCI_H_
#define SCI_H_

/*=======[I N C L U D E S]====================================================*/
#include "Std_Types.h"
#include "Time.h"

/*=======[E X T E R N A L   F U N C T I O N   D E C L A R A T I O N S]========*/
void Sci_Init(void);
void Put_String(unsigned char data[]);
void Put_Data(uint16 val);
void putdata(unsigned char data);


extern unsigned char RecData;

#endif

/*=======[R E V I S I O N   H I S T O R Y]====================================*/
/** <VERSION>  <DATE>  <AUTHOR>     <REVISION LOG>
 *             V1.0    20120919    ISOFT             Initial version
 */
/*=======[E N D   O F   F I L E]==============================================*/