######################################
# For STM32F100C8 on Mars Eclipse using the ARM GNU toolchain
# Supports both the assembler and C startup code stubs
# Liam Goudge August 2016
#
# This is a more extensible Makefile than SignOfLife1 to enable
# larger future projects
#
################### Project name and sources #####################

NAME=SemiHostMyDriver

#MBP
#FOUNDATION = /Users/Liam/Eclipse/WorkspaceJan16/Foundation

#MM
FOUNDATION = /Users/Liam/Documents/LiamsDox/Personal/GeekingOut/SoftDvt/Embedded/EclipseMarsFeb2016/WorkspaceJan16/Foundation

C_SOURCES = semihost.c 	# Enter list of all the C source files here
S_SOURCES = $(FOUNDATION)/startup_SHMD.S $(FOUNDATION)/semihostDriver.S 	# Enter list of all the assembler source files here

OBJECTS = $(C_SOURCES:.c=.o) $(S_SOURCES:.S=.o)

include $(FOUNDATION)/GenericMakefilev1


################### GNU Flags #####################
# Compiler Flags
CFLAGS = -mcpu=cortex-m3 -mthumb -Wall -g -c

# Assembler Flags
ASFLAGS = -mcpu=cortex-m3 -mthumb

# Linker Flags 

#LINKER_SCRIPT = STM32F100C8_full.ld
LINKER_SCRIPT = $(FOUNDATION)/STM32F100C8v2.ld
LDFLAGS=-mthumb -mcpu=cortex-m3 $(NO_SEMIHOST) -T $(LINKER_SCRIPT) # Use std libraries

# Other Stuff
ODFLAGS = -h --syms -S
REMOVE = rm -f


	

