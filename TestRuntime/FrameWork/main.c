#include "Os.h"
#include <mc9s12xep100.h> 
#include "cfgobj.h"
#include "config.h"
#include "Sci.h"

//extern void SetBusCLK_16M(void);

//extern void initIntPrio(void);
void main(void)
{
	uint8 i = 0;

	// Entrance to OS domain
	StartOS(AppMode);
    
	while(1)
	{
		i++;
	


	/* loop forever */
	}
  /* please make sure that you never leave main */
}
