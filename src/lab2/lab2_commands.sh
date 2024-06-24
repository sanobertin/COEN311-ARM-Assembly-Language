

module load COEN311

arm-none-eabi-as -g lab2.s -o lab2.o -al lab2.lst


arm-none-eabi-ld lab2.ld lab2.o -o lab2.elf -T stm32f334r8_ALL_IN_RAM.ld

# arm-none-eabi-objcopy -O binary lab2.elf lab2.bin # what does this line do ?

openocd -f board/st_nucleo_f3.cfg 

arm-none-eabi-gdb lab2.elf

# scripts below are for gdb

target extended-remote localhost:3333
monitor reset halt
load
break start 
continue
x/3xb &mick ## alternative is the x/3xb 0x2000010c
stepi 
dissasemble
x/4xb 0x20000100
x/1xb &keith
x/1xb &result 

stepi
stepi
stepi
stepi

info register

stepi 
stepi 

x/1xb &result

quit 

# gdb script ends here