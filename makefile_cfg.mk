## project name ( project directory )
TARGET          = Test.abs
## absolute project root path
PROJECT_PATH = .

## Path to software stack
SW_STACK_PATH         = ../iCORE
SW_COMMUNICATION_PATH = $(SW_STACK_PATH)/communication
SW_DIAGNOSTIC_PATH    = $(SW_STACK_PATH)/diagnostic
SW_MEMORY_PATH        = $(SW_STACK_PATH)/memory
SW_SYSTEM_PATH        = $(SW_STACK_PATH)/system
SW_RTE_PATH           = $(SW_STACK_PATH)/rte
SW_PERIPHERALS_PATH   = $(SW_STACK_PATH)/peripherals
SW_PLATFORM_PATH      = $(SW_STACK_PATH)/platform/kernel
SW_INCLUDE_PATH       = $(SW_STACK_PATH)/include
SW_SCRIPT_PATH        = $(SW_STACK_PATH)/platform/script
SW_PLATFORM_INC_PATH  = $(SW_STACK_PATH)/platform/include

## relative project paths -----------------------------------
TESTENV_PATH 	        = $(PROJECT_PATH)
CONFIG_PATH           = $(TESTENV_PATH)/TestRuntime/config
OUTPUT_PATH  	        = $(TESTENV_PATH)/output/
LOG_PATH 	            = $(TESTENV_PATH)/log


##-----------test switches------------------------------------


##--usage of AUTOSAR modules ---------------------------------

USE_ADC=0
USE_CAN=0
USE_CANIF=0
USE_CANNM=0
USE_CANSM=0
USE_CANTRCV=0
USE_CANTP=0
USE_COM=0
USE_COMM=0
USE_OSEKNM=0
USE_RTE=0
USE_CRC=0
USE_DCM=0
USE_DEM=0
USE_DET=0
USE_DIO=0
USE_EA=0
USE_ECUM=0
USE_IPDUM=0
USE_IOHWAB=0
USE_EEP=0
USE_FLS=0
USE_FBL=0
USE_FIM=0
USE_FR=0
USE_FRIF=0
USE_FRNM=0
USE_FRSM=0
USE_FRTP=0
USE_FRTRCV=0
USE_GPT=0
USE_ICU=0
USE_LIN=0
USE_LINIF=0
USE_MCU=0
USE_MEMIF=0
USE_NM=0
USE_NVM=0
USE_OS=0
USE_OSEKOS=1
USE_PDUR=0
USE_PORT=0
USE_PWM=0
USE_RTE=0
USE_SCHM=0
USE_SPI=0
USE_WDG=0
USE_WDGIF=0
USE_WDGM=0

## AUTOSAR Modules---------------------------------------

ADC_PATH                = $(SW_PERIPHERALS_PATH)/Adc
CAN_PATH		        = $(SW_PERIPHERALS_PATH)/Can
CANIF_PATH              = $(SW_COMMUNICATION_PATH)/CanIf
CANNM_PATH              = $(SW_COMMUNICATION_PATH)/CanNm
CANSM_PATH              = $(SW_COMMUNICATION_PATH)/CanSm
CANTP_PATH              = $(SW_COMMUNICATION_PATH)/CanTp
COM_PATH                = $(SW_COMMUNICATION_PATH)/Com
COMM_PATH               = $(SW_COMMUNICATION_PATH)/ComM
DCM_PATH                = $(SW_DIAGNOSTIC_PATH)/Dcm
DEM_PATH                = $(SW_DIAGNOSTIC_PATH)/Dem
DET_PATH                = $(SW_DIAGNOSTIC_PATH)/Det
DIO_PATH                = $(SW_PERIPHERALS_PATH)/Dio
ECUM_PATH               = $(SW_SYSTEM_PATH)/EcuM
FLS_PATH                = $(SW_PERIPHERALS_PATH)/Fls
GPT_PATH                = $(SW_PERIPHERALS_PATH)/Gpt
ICU_PATH                = $(SW_PERIPHERALS_PATH)/Icu
IOHWAB_PATH             = $(SW_PERIPHERALS_PATH)/IoHwAb
LIN_PATH                = $(SW_PERIPHERALS_PATH)/Lin
LINIF_PATH              = $(SW_COMMUNICATION_PATH)/LinIf
MCU_PATH                = $(SW_PERIPHERALS_PATH)/Mcu
MEMIF_PATH              = $(SW_MEMORY_PATH)/MemIf
NM_PATH                 = $(SW_COMMUNICATION_PATH)/Nm
NVM_PATH                = $(SW_MEMORY_PATH)/Nvm
OS_PATH                 = $(SW_SYSTEM_PATH)/Os
OSEKOS_PATH             = $(SW_SYSTEM_PATH)/OsekOs
PDUR_PATH               = $(SW_COMMUNICATION_PATH)/PduR
PORT_PATH               = $(SW_PERIPHERALS_PATH)/Port
PWM_PATH                = $(SW_PERIPHERALS_PATH)/Pwm
SPI_PATH                = $(SW_PERIPHERALS_PATH)/Spi
SCHM_PATH               = $(SW_SYSTEM_PATH)/SchM
WDG_PATH                = $(SW_PERIPHERALS_PATH)/Wdg
WDGIF_PATH              = $(SW_PERIPHERALS_PATH)/WdgIf
WDGM_PATH               = $(SW_SYSTEM_PATH)/WdgM

ADC_CONFIG_PATH                = $(CONFIG_PATH)/Adc
CAN_CONFIG_PATH		             = $(CONFIG_PATH)/Can
CANIF_CONFIG_PATH              = $(CONFIG_PATH)/CanIf
CANNM_CONFIG_PATH              = $(CONFIG_PATH)/CanNm
CANSM_CONFIG_PATH              = $(CONFIG_PATH)/CanSm
CANTP_CONFIG_PATH              = $(CONFIG_PATH)/CanTp
COM_CONFIG_PATH                = $(CONFIG_PATH)/Com
COMM_CONFIG_PATH               = $(CONFIG_PATH)/ComM
DCM_CONFIG_PATH                = $(CONFIG_PATH)/Dcm
DEM_CONFIG_PATH                = $(CONFIG_PATH)/Dem
DET_CONFIG_PATH                = $(CONFIG_PATH)/Det
DIO_CONFIG_PATH                = $(CONFIG_PATH)/Dio
ECUM_CONFIG_PATH               = $(CONFIG_PATH)/EcuM
FLS_CONFIG_PATH                = $(CONFIG_PATH)/Fls
GPT_CONFIG_PATH                = $(CONFIG_PATH)/Gpt
ICU_CONFIG_PATH                = $(CONFIG_PATH)/Icu
IOHWAB_CONFIG_PATH             = $(CONFIG_PATH)/IoHwAb
LIN_CONFIG_PATH                = $(CONFIG_PATH)/Lin
LINIF_CONFIG_PATH              = $(CONFIG_PATH)/LinIf
MCU_CONFIG_PATH                = $(CONFIG_PATH)/Mcu
MEMIF_CONFIG_PATH              = $(CONFIG_PATH)/MemIf
NM_CONFIG_PATH                 = $(CONFIG_PATH)/Nm
NVM_CONFIG_PATH                = $(CONFIG_PATH)/Nvm
OS_CONFIG_PATH                 = $(CONFIG_PATH)/Os
OSEKOS_CONFIG_PATH             = $(CONFIG_PATH)/OsekOs
PDUR_CONFIG_PATH               = $(CONFIG_PATH)/PduR
PORT_CONFIG_PATH               = $(CONFIG_PATH)/Port
PWM_CONFIG_PATH                = $(CONFIG_PATH)/Pwm
RTE_CONFIG_PATH                = $(CONFIG_PATH)/Rte
SCHM_CONFIG_PATH               = $(CONFIG_PATH)/SchM
SPI_CONFIG_PATH                = $(CONFIG_PATH)/Spi
WDG_CONFIG_PATH                = $(CONFIG_PATH)/Wdg
WDGIF_CONFIG_PATH              = $(CONFIG_PATH)/WdgIf
WDGM_CONFIG_PATH               = $(CONFIG_PATH)/WdgM