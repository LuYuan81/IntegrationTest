/*
 * Encapsulate.c
 *
 *  Created on: 2012-8-6
 *      Author: Administrator
 */


#include "Encapsulate.h"
//#include "TestTarget.h"
#include "TestCtrl.h"


FCT(IT_Api_Plus) 
{

	//Api_Plus((int)g_u1UserData[0], (int)g_u1UserData[1]);
	g_u1BufOut[0] = 0x22;g_u1BufOut[1] = 0x55;

	g_u1DataOutDLC = 2;
	
	return;
}

FCT(IT_Api_b) 
{
	g_u1BufOut[0] = 0x66;g_u1BufOut[1] = 0x77;g_u1BufOut[2] = 0x88;

	g_u1DataOutDLC = 3;
	return;
}

test_t g_stApiRegisterTable[] = 
{
	SET(IT_Api_Plus),
	SET(IT_Api_b)
};

const unsigned char g_u1FunctionNum = (unsigned char)(sizeof(g_stApiRegisterTable)/ sizeof(test_t));

