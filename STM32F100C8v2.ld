/* Memory configuration for STM32F100C8 */

ENTRY(Reset_Handler)

MEMORY
{
  	SRAM (rwx) 	: ORIGIN = 0x20000000, LENGTH = 8K
  	STACK (rwx)	: ORIGIN = 0x20002000, LENGTH = 0K
  	FLASH (rx)  : ORIGIN = 0x00000000, LENGTH = 64K

}

PROVIDE(__stack = ORIGIN(STACK) );  			/* __stack required by crt0.o otherwise it assumes 0x8000 */

SECTIONS {

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
	
	
	.heap :
	{
		__end__ = .;				/* Required by rdimon-crt0 */
		end = . ; 					/* Required for _sbrk */
		*(.heap*)
	} > SRAM


}

