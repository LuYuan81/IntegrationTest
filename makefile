#########################################################################################
# makefile for Star12 Projects                                                          #
# projects use makefile.cfg to configure                                                #
#                                                                                       #
# NAME     makefile                                                                     #
# PURPOSE  build test projects in AUTOSAR environments                                  #
# COMPILER GCC                                                                          #
#                                                                                       #
# Version, Date,    Name, Changes                                                       #
#---------------------------------------------------------------------------------------#
#    makefile inherited in V1.4 from previous projects (BS,OG,RT)                       #
#    1.0   04.02.09 BS    Initial revison                                               #
#########################################################################################

#-----------------------------------------------------------------------------
# include files
#-----------------------------------------------------------------------------

include makefile_cfg.mk
include build_cfg.mk

#-----------------------------------------------------------------------------
# include paths
#-----------------------------------------------------------------------------

INC_PATH = .
INC_PATH += $(SW_PLATFORM_PATH)
INC_PATH += $(SW_INCLUDE_PATH)
INC_PATH += $(SW_PLATFORM_INC_PATH)
INC_PATH += $(LIBPATH)

INC_PATH += ./TestRuntime/FrameWork
INC_PATH += ./TestRuntime/Encapsulate

ifeq ($(USE_OS), 1)
INC_PATH += $(OS_PATH)
INC_PATH += $(OS_CONFIG_PATH)
endif
ifeq ($(USE_OSEKOS), 1)
INC_PATH += $(OSEKOS_PATH)
INC_PATH += $(OSEKOS_CONFIG_PATH)
endif
ifeq ($(USE_ADC), 1)
INC_PATH += $(ADC_PATH)
INC_PATH += $(ADC_CONFIG_PATH)
endif
ifeq ($(USE_CAN), 1)
INC_PATH += $(CAN_PATH)
INC_PATH += $(CAN_CONFIG_PATH)
endif
ifeq ($(USE_CANIF), 1)
INC_PATH += $(CANIF_PATH)
INC_PATH += $(CANIF_CONFIG_PATH)
endif
ifeq ($(USE_CANNM), 1)
INC_PATH += $(CANNM_PATH)
INC_PATH += $(CANNM_CONFIG_PATH)
endif
ifeq ($(USE_CANSM), 1)
INC_PATH += $(CANSM_PATH)
INC_PATH += $(CANSM_CONFIG_PATH)
endif
ifeq ($(USE_CANTP), 1)
INC_PATH += $(CANTP_PATH)
INC_PATH += $(CANTP_CONFIG_PATH)
endif
ifeq ($(USE_COM), 1)
INC_PATH += $(COM_PATH)
INC_PATH += $(COM_CONFIG_PATH)
endif
ifeq ($(USE_COMM), 1)
INC_PATH += $(COMM_PATH)
INC_PATH += $(COMM_CONFIG_PATH)
endif
ifeq ($(USE_DCM), 1)
INC_PATH += $(DCM_PATH)
INC_PATH += $(DCM_CONFIG_PATH)
endif
ifeq ($(USE_DEM), 1)
INC_PATH += $(DEM_PATH)
INC_PATH += $(DEM_CONFIG_PATH)
endif
ifeq ($(USE_DET), 1)
INC_PATH += $(DET_PATH)
INC_PATH += $(DET_CONFIG_PATH)
endif
ifeq ($(USE_DIO), 1)
INC_PATH += $(DIO_PATH)
INC_PATH += $(DIO_CONFIG_PATH)
endif
ifeq ($(USE_ECUM), 1)
INC_PATH += $(ECUM_PATH)
INC_PATH += $(ECUM_CONFIG_PATH)
endif
ifeq ($(USE_EEP), 1)
INC_PATH += $(EEP_PATH)
INC_PATH += $(EEP_CONFIG_PATH)
endif
ifeq ($(USE_GPT), 1)
INC_PATH += $(GPT_PATH)
INC_PATH += $(GPT_CONFIG_PATH)
endif
ifeq ($(USE_ICU), 1)
INC_PATH += $(ICU_PATH)
INC_PATH += $(ICU_PATH)
endif
ifeq ($(USE_IPDUM), 1)
INC_PATH += $(IPDUM_CONFIG_PATH)
endif
ifeq ($(USE_IOHWAB), 1)
INC_PATH += $(IOHWAB_PATH)
INC_PATH += $(IOHWAB_CONFIG_PATH)
endif
ifeq ($(USE_LIN), 1)
INC_PATH += $(LIN_PATH)
INC_PATH += $(LIN_CONFIG_PATH)
endif
ifeq ($(USE_LINIF), 1)
INC_PATH += $(LINIF_PATH)
INC_PATH += $(LINIF_CONFIG_PATH)
endif
ifeq ($(USE_LINSM), 1)
INC_PATH += $(LINSM_PATH)
INC_PATH += $(LINSM_CONFIG_PATH)
endif
ifeq ($(USE_MCU), 1)
INC_PATH += $(MCU_PATH)
INC_PATH += $(MCU_CONFIG_PATH)
endif
ifeq ($(USE_MEMIF), 1)
INC_PATH += $(MEMIF_PATH)
INC_PATH += $(MEMIF_CONFIG_PATH)
endif
ifeq ($(USE_NM), 1)
INC_PATH += $(NM_PATH)
INC_PATH += $(NM_CONFIG_PATH)
endif
ifeq ($(USE_NVM), 1)
INC_PATH += $(NVM_PATH)
INC_PATH += $(NVM_CONFIG_PATH)
endif
ifeq ($(USE_PDUR), 1)
INC_PATH += $(PDUR_PATH)
INC_PATH += $(PDUR_CONFIG_PATH)
endif
ifeq ($(USE_PORT), 1)
INC_PATH += $(PORT_PATH)
INC_PATH += $(PORT_CONFIG_PATH)
endif
ifeq ($(USE_PWM), 1)
INC_PATH += $(PWM_PATH)
INC_PATH += $(PWM_CONFIG_PATH)
endif
ifeq ($(USE_RTE), 1)
INC_PATH += $(SW_RTE_PATH)
INC_PATH += $(RTE_CONFIG_PATH)
endif
ifeq ($(USE_SPI), 1)
INC_PATH += $(SPI_PATH)
INC_PATH += $(SPI_CONFIG_PATH)
endif
ifeq ($(USE_WDG), 1)
INC_PATH += $(WDG_PATH)
INC_PATH += $(WDG_CONFIG_PATH)
endif
ifeq ($(USE_WDGIF), 1)
INC_PATH += $(WDGIF_PATH)
INC_PATH += $(WDGIF_CONFIG_PATH)
endif

ifeq ($(USE_SCHM), 1)
INC_PATH += $(SCHM_PATH)
INC_PATH += $(SCHM_CONFIG_PATH)
endif

#-----------------------------------------------------------------------------
# objects
#-----------------------------------------------------------------------------

INTEGRATION_TEST_OBJ = Encapsulate.o TestCtrl.o userapp.o main.o Sci.o hc9s12x.o Start12.o mc9s12xep100.o

ifneq ($(SW_PLATFORM_PATH),)
plarform_find_dir_prj = $(filter %:, $(shell ls -R -F $(SW_PLATFORM_PATH)))
plarform_dir_prj = $(plarform_find_dir_prj:%:=%)
plarform_file_src = $(foreach dir,$(plarform_dir_prj),$(wildcard $(dir)\*.c))
plarform_file_src_name = $(notdir $(plarform_file_src))
plarform_file_obj = $(plarform_file_src_name:.c=.o)
INC_PATH += $(plarform_dir_prj)
PLATFORM_OBJ += $(plarform_file_obj)
endif

ifeq ($(USE_ADC), 1)
ADC_OBJ = Adc.o Adc_Irq.o
endif

ifeq ($(USE_CAN), 1)
CAN_OBJ = Can.o Can_Irq.o Can_Cfg.o
endif

ifeq ($(USE_CANIF), 1)
CANIF_OBJ = CanIf.o  CanIf_Cfg.o
endif

ifeq ($(USE_CANNM), 1)
CANNM_OBJ = CanNm.o CanNm_cfg.o CanNm_Lcfg.o CanNm_PBcfg.o
endif

ifeq ($(USE_CANSM), 1)
CANSM_OBJ = CanSm.o CanSm_Lcfg.o CanSm_PBcfg.o
endif

ifeq ($(USE_CANTP), 1)
CANTP_OBJ = CanTp.o CanTp_Cfg.o CanTp_Lcfg.o CanTp_PBcfg.o
endif

ifeq ($(USE_COM), 1)
COM_OBJ = Com.o Com_Cfg.o
endif

ifeq ($(USE_COMM), 1)
COMM_OBJ = ComM.o 
COMM_OBJ += ComM_Lcfg.o
COMM_OBJ += ComM_PBcfg.o
endif


ifeq ($(USE_DCM), 1)
DCM_OBJ = Dcm.o Dcm_Lcfg.o
endif

ifeq ($(USE_DEM), 1)
DEM_OBJ = Dem.o Dem_PBcfg.o Dem_Lcfg.o
endif

ifeq ($(USE_DET), 1)
DET_OBJ = Det.o
endif

ifeq ($(USE_DIO), 1)
DIO_OBJ = Dio.o Dio_Cfg.o
endif

ifeq ($(USE_ECUM), 1)
ECUM_OBJ = EcuM.o EcuM_Cfg.o EcuM_Callout_Stubs.o
endif

ifeq ($(USE_EEP), 1)
EEP_OBJ = Eep.o Eep_Irq.o
endif

ifeq ($(USE_FLS),1)
FLS_OBJ = Fls.o Fls_AC.o Fls_Irq.o
endif

ifeq ($(USE_GPT), 1)
GPT_OBJ = Gpt.o Gpt_Irq.o Gpt_PBcfg.o
endif

ifeq ($(USE_ICU), 1)
ICU_OBJ = Icu.o Icu_Irq.o
endif

ifeq ($(USE_IOHWAB), 1)
IOHWAB_OBJ = IoHwAb.o
endif

ifeq ($(USE_LIN), 1)
LIN_OBJ = Lin.o
LIN_OBJ += Lin_Irq.o
LIN_OBJ += Lin_Cfg.o
endif

ifeq ($(USE_LINIF), 1)
LINIF_OBJ = LinIf.o
LINIF_OBJ += LinIf_Cfg.o
LINIF_OBJ += LinIf_Cbk.o
endif

ifeq ($(USE_LINSM), 1)
LINSM_OBJ = LinSM.o
LINSM_OBJ += LinSM_Cfg.o
LINSM_OBJ += LinSM_Lcfg.o
endif

ifeq ($(USE_LINTP), 1)
LINTP_OBJ = LinTp_Lcfg.o
LINTP_OBJ += LinTp_PBcfg.o
endif

ifeq ($(USE_MCU), 1)
MCU_OBJ = Mcu.o Mcu_Irq.o Mcu_Cfg.o
endif

ifeq ($(USE_MEMIF), 1)
MEMIF_OBJ = MemIf.o
endif

ifeq ($(USE_NM), 1)
NM_OBJ = Nm.o Nm_Lcfg.o  Nm_Cfg.o
endif

ifeq ($(USE_NVM), 1)
NVM_OBJ = Nvm.o
endif

ifeq ($(USE_OSEKOS), 1)
OSEKOS_OBJ = cfgobj.o hooks.o vector.o alarm.o counter.o event.o interrupt.o kernel.o main.o osexectrl.o resource.o task.o
endif

# LY: why 
ifeq ($(USE_PDUR), 1)
PDUR_OBJ += PduR.o
PDUR_OBJ += PduR_CanIf.o
PDUR_OBJ += PduR_CanTp.o
PDUR_OBJ += PduR_Com.o
PDUR_OBJ += PduR_Dcm.o
PDUR_OBJ += PduR_FrIf.o
PDUR_OBJ += PduR_FrTp.o
PDUR_OBJ += PduR_If.o
PDUR_OBJ += PduR_IPduM.o
PDUR_OBJ += PduR_LinIf.o
PDUR_OBJ += PduR_LinTp.o
PDUR_OBJ += PduR_Tp.o
PDUR_OBJ += PduR_Up.o
endif

ifeq ($(USE_PORT), 1)
PORT_OBJ = Port.o Port_Cfg.o Port_Irq.o
endif

ifeq ($(USE_PWM), 1)
PWM_OBJ = Pwm.o Pwm_Irq.o
endif

ifeq ($(USE_RTE), 1)
RTE_OBJ  = Rte_SWC_InteriorLampControl.o
RTE_OBJ += Rte_Cbk.o
RTE_OBJ += Rte_SWC_StateDisplay.o
RTE_OBJ += Rte_SWC_BeamLampControl.o
RTE_OBJ += Rte.o
RTE_OBJ += Rte_Ecu_IoHwAbComponentType.o
RTE_OBJ += Rte_SWC_TurnLampControl.o
RTE_OBJ += Rte_SWC_GetCalData.o
RTE_OBJ += Rte_SWC_FogLampControl.o
RTE_OBJ += Rte_Data.o
endif

ifeq ($(USE_SPI), 1)
SPI_OBJ = Spi.o Spi_Irq.o
endif

ifeq ($(USE_WDG), 1)
WDG_OBJ = Wdg.o
endif

ifeq ($(USE_WDGIF), 1)
WDGIF_OBJ = WdgIf.o
endif

ifeq ($(USE_WDGM), 1)
WDGM_OBJ = WdgM.o
endif

ifneq ($(TESTENV_PATH),)
test_find_dir_prj = $(filter %:,$(shell ls -R  $(TESTENV_PATH)))
test_dir_prj = $(filter-out $(TESTENV_PATH)\config%, $(test_find_dir_prj:%:=%))
test_file_src = $(foreach dir,$(test_dir_prj),$(wildcard $(dir)\*.c))
DIR_OBJS = $(patsubst %.c,%.o,$(foreach dir,$(test_dir_prj),$(wildcard $(dir)\*.c)))
test_file_src_name = $(notdir $(patsubst %.c,%.o,$(foreach dir,$(test_dir_prj),$(wildcard $(dir)\*.c))))

INC_PATH += $(test_dir_prj)
TEST_OBJ += $(notdir $(patsubst %.c,%.o,$(foreach dir,$(test_dir_prj),$(wildcard $(dir)\*.c))))
endif

VPATH = $(INC_PATH)

OBJECTS = \
	$(INTEGRATION_TEST_OBJ) \
	$(PLATFORM_OBJ)   \
	$(TEST_OBJ)   \
	$(ADC_OBJ)   \
	$(CAN_OBJ)   \
	$(CANIF_OBJ)   \
	$(CANNM_OBJ)   \
	$(CANSM_OBJ)   \
	$(CANTP_OBJ)   \
	$(COM_OBJ)   \
	$(COMM_OBJ)   \
	$(DCM_OBJ)   \
	$(DEM_OBJ)   \
	$(DET_OBJ)   \
	$(DIO_OBJ)   \
	$(ECUM_OBJ)   \
	$(EEP_OBJ)   \
	$(FLS_OBJ)   \
	$(GPT_OBJ)   \
	$(ICU_OBJ)   \
	$(IOHWAB_OBJ) \
	$(LIN_OBJ)   \
	$(LINIF_OBJ)   \
	$(LINSM_OBJ)   \
	$(LINTP_OBJ)   \
	$(MCU_OBJ)   \
	$(MEMIF_OBJ)   \
	$(NM_OBJ)   \
	$(NVM_OBJ)   \
	$(OSEKOS_OBJ)   \
	$(PDUR_OBJ)   \
	$(PORT_OBJ)   \
	$(PWM_OBJ)   \
	$(RTE_OBJ)   \
	$(SPI_OBJ)   \
	$(WDG_OBJ)   \
	$(WDGIF_OBJ)   \
	$(WDGM_OBJ)

OBJECTS_LINK = $(addprefix $(OUTPUT_PATH)\,$(OBJECTS))

#-----------------------------------------------------------------------------
# compile files
#----------------------------------------------------------------------------- 

%.o : %.c
	@echo "  >> CC $@ $^"
	$(CC) -F2 $(CFLAGS) $(addprefix -I,$(INC_PATH)) $^ 


#-----------------------------------------------------------------------------
# Target Rules
#-----------------------------------------------------------------------------

.PHONY all:

all: file_structure ecu 

file_structure : makefile_cfg.mk
	@echo "** generating file structure    **"
# @if not exist $(OUTPUT_PATH) mkdir $(OUTPUT_PATH)
# @if not exist $(LOG_PATH) mkdir $(LOG_PATH)
	@echo "** generating file structure OK **"
	@echo "** OBJECTS : $(OBJECTS) **"
	@echo "** VPATH : $(VPATH) **"
	
ecu : start $(OBJECTS) end_build linking $(TARGET) end_linking done
	
start :
	@echo "---------------------- start of compilation ----------------------------"
end_build :
	@echo "---------------------- end of compilation  -----------------------------"

linking :
	@echo "---------------------- start of linkprocess ----------------------------"
end_linking :
	@echo "----------------------  end of linkprocess  ----------------------------"
$(TARGET) : $(OBJECTS_LINK)
	@echo "  >> LD $@ Link_Object : $(OBJECTS_LINK)"
	$(LD) -M $(LD_FILES) -Add{$(OBJECTS_LINK)} -Add$(ANSIBF_LIBPATH) -o$@
	
done:
	@echo
	@echo "  >>>>>>>  DONE  !!!<<<<<<<<<"
	@echo

.PHONY: clean
clean :
	@echo "Clean: $(CURDIR)"
	@find . -type f -name *.o | xargs rm -rf
	@find . -type f -name *.abs | xargs rm -rf
	@find . -type f -name *.map | xargs rm -rf
	@echo "Removing object files and libs for $(PLATFORM)"
	@echo Done!