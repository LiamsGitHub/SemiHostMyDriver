/* Memory configuration for STM32F100C8 */

ENTRY(Reset_Handler)
/*PROVIDE(__stack = ORIGIN(STACK) );  			 __stack required by crt0.o otherwise it assumes 0x8000 */
__stack = ORIGIN(STACK);
heap_size = 0x600;

MEMORY
{
  	SRAM (rwx) 	: ORIGIN = 0x20000000, LENGTH = 8K
  	STACK (rwx)	: ORIGIN = 0x20002000, LENGTH = 0K
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
		*(.data*)				/* Program data */
		__data_end__ = .;
	} >SRAM AT >FLASH

    _start_data_flash = LOADADDR(.data); 

	. = ALIGN(4);

	.bss :						/* Zero-filled run-time data memory */
	{
		__bss_start__ = .;
		*(.bss)	
		__bss_end__ = .;
	} >SRAM
	
	.heap :
	{
		*(.heap*)
	
	/*
		__HeapBase = .; 	 lowest address 
		*(.heap*)
		. = . + heap_size ;
		__HeapLimit = . ; 	 highest address 
		
	*/	
		
	} >SRAM
	
}

