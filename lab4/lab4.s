.syntax unified 
.cpu cortex-m4 
.thumb 

.word 0x20000400
.word 0x80000ed
.space 0xe4

.data 
message: .ascii "juMping JAck flaSh #1" @ array of size 21
lastchar: .byte 0

.text 

start:
    mov r10, #122
    mov r9, #97
    @ r9 and r10 are for ascii lower characters bounds
    ldr r4, =message
    @ldr r4, =savemessage
    mov r2, #0
    mov r5, #0
loopinmessage:
    ldrb r1, [r4, r2]
    cmp r1, r9 @ check if less than 'a'
    blt skip
    
    cmp r1, r10 @ check if greater than 'z'
    bgt skip

    cmp r5, r1
    beq stop @ r2 iteration reaches null point then end the loop

    sub r1, r1, #32
    strb r1, [r4, r2]
skip:add r2, r2, #1 @ increment
    b loopinmessage

stop: b stop
