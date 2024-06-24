# scripting starts here
module load COEN311
arm-none-eabi-as -g exam.s -o exam.o -al=exam.lst
more exam.lst
arm-none-eabi-ld exam.o -o exam.elf -T linkerscript.ld
# arm-none-eabi-objcopy -O binary exam.elf exam.bin # what does this line do ?

# openocd -f board/st_nucleo_f3.cfg 

arm-none-eabi-gdb exam.elf

# scripts below are for gdb

# target extended-remote localhost:3333
# monitor reset halt
# load
# break start 
# continue
# x/3xb &mick ## alternative is the x/3xb 0x2000010c
# stepi 
# dissasemble
# x/4xb 0x20000100
# x/1xb &keith
# x/1xb &result 
# stepi
# stepi
# stepi
# stepi
# info register
# stepi 
# stepi 
# x/1xb &result
# quit 


# gdb script ends here
