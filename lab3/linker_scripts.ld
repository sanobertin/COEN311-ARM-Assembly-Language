/*
@author: Bertin Mihigo Sano
@date: 2024-May-23
@Lab2 - experiment 
*/
MEMORY {
FLASH : ORIGIN = 0x8000000, LENGTH = 64K
SRAM : ORIGIN = 0x20000000, LENGTH = 16K
}
SECTIONS {
.text : {
*(.text)
} >SRAM
.data : {
*(.data)
} >SRAM
}