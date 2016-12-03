/* Memory configuration for STM32F100C8 */
/* 8th Sept 2017. Works with NanoLib */

ENTRY(Reset_Handler)

StackSize = 1000;
HeapSize = 5000;

MEMORY
{
  	SRAM (rwx) 	: ORIGIN = 0x20000000, LENGTH = 8K
  	FLASH (rx)  : ORIGIN = 0x00000000, LENGTH = 64K

}

SECTIONS {

	. = ORIGIN(FLASH);

	.text :
	{
		*(.isr_vector)			/* Vector table */
		*(.text*)				/* Program code */
		*(.rodata*)
	} >FLASH

	.data :
	{
		__data_start__ = .;
		*(.data*)
		__data_end__ = .;
	} >SRAM AT >FLASH

    _start_data_flash = LOADADDR(.data);

	.bss :
	{
		__bss_start__ = .;
		*(.bss*)
		__bss_end__ = .;
	} >SRAM
	

	end = . ; 					/* Required for _sbrk */

	__HeapBase = .;
	__HeapLimit = __HeapBase + HeapSize;
		
	__stack_base__ = ORIGIN(SRAM) + LENGTH(SRAM);

}

