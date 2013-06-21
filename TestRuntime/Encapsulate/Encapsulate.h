/*
 * Encapsulate.h
 *
 *  Created on: 2012-8-6
 *      Author: Administrator
 */

typedef struct  
{
  const unsigned int  id;
  void (*testApiPtr)(void);
}test_t;

#define FCT(n) void Api_##n(void)
#define SET(i) i, Api_##i

typedef enum 
{
	API_CALL = 0x01,
	ECU_RESET 	 = 0x02
	
}Rs232CommandType;

enum ApiRegisterTableIndex 
{
		IT_Api_Plus = 1,
		IT_Api_b = 2
};

extern test_t  g_stApiRegisterTable[];
extern const unsigned char g_u1FunctionNum;



