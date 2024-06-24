@laboratory 4 experiment 
@ An assembly program that converts all lowercase characters in a string to uppercase characters.
@ June 2024 
@ Authour: Bertin Mihigo Sano 
@ ID: 40157663 

.syntax unified 
.cpu cortex-m4 
.thumb 

.word 0x20000400
.word 0x80000ed
.space 0xe4

.data 
message: .ascii "juMping JAck flaSh #1" @ array of size 21
lastchar: .byte 0x00 @ null character

.text 
start:
    mov r10, #122
    mov r9, #97
    @ r9 and r10 are for ascii lower characters bounds
    ldr r0, =message @ load the address of message into r0
    mov r1, #0 @ iterator
loopinmessage:
    ldrb r2, [r0, r1]
    cmp r2, #0 @ check if null
    beq endloop @ r1 iteration reaches null point then end the loop

    cmp r2, r9 @ check if less than 'a'
    blt skip
    
    cmp r2, r10 @ check if greater than 'z'
    bgt skip

    sub r2, r2, #32
    strb r2, [r0, r1]
skip:
    add r1, r1, #1 @ increment
    b loopinmessage

endloop:     .end


