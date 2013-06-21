#-----------------------------------------------------------------------------
# defines \ options
#-----------------------------------------------------------------------------
## Directories
CW_PATH           = C:/Freescale/CodeWarrior
ANSIXB_LIBPATH    = $(CW_PATH)/lib/hc12c/lib/ansixb.lib
ANSIBF_LIBPATH    = $(CW_PATH)/lib/hc12c/lib/ansibf.lib
LIBPATH           = $(CW_PATH)/lib/hc12c/include

## file types
ASS = a
ALS = la
OBJ = o
LST = ls
LNK = inv
LIB = h12
EXE = hex
MAP = map
ERR = err
ABS = abs

## Compiler \ Assembler \ Linker
CC              = $(CW_PATH)/Prog/chc12.exe  ## compile
ASS             = $(CW_PATH)/Prog/ahc12.exe   ## assemble
LD              = $(CW_PATH)/Prog/linker.exe    ## link

CFLAGS_COMMON= -WErrFileOff -WOutFileOff -EnvOBJPATH=$(OUTPUT_PATH)
CFLAGS= -CpuHCS12X -Mb -MapFLASH -D__MAP_FLASH__ -D__FAR_DATA -PSegObj $(CFLAGS_COMMON)

ASS_OPT         = $(ASS) +debug +nowiden -v -l -ax -co$(OUTPUT_PATH)
LD_FLAGS        = -M$(OUTPUT_PATH)/$(ECU).map
LD_FILES        = $(SW_SCRIPT_PATH)/Project.prm