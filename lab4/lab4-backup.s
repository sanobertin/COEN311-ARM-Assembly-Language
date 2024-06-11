.syntax unified 
.cpu cortex-m4 
.thumb 

.data 
message: .ascii "juMping JAck flaSh #1" @ array of size 21
lastchar: .byte 0
savemessage: .space 22

.text 

start:
    mov R10, #122
    mov R9, #97
    @ R9 and R10 are for ascii lower characters bounds
    ldr R0, =message
    ldr R4, =savemessage
    mov R2, #0
    mov R5, #0
loopinmessage:
        ldrb R1, [R0, R2]
        cmp R5, R1
        beq endloop @ R2 iteration reaches null point then end the loop
        cmp R9, R1 @ check if less than 'a'
        blt donotconvert
        cmp R10, R1 @ check if greater than 'z'
        blt donotconvert
        
        bgt convert
        add R2, R2, #1 @ increment

        b loopinmessage
    convert: 
        sub R1, R1, #32
        str R1, [R4, R2]
        @add R2, R2, #1
    donotconvert:
        str R1, [R4, R2] 
        @add R2, R2, #1


endloop: b .

.end
