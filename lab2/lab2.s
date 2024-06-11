@author: Bertin Mihigo Sano
@date: 2024-May-23
@Lab2 - experiment 

.syntax unified
.cpu cortex-m4
.thumb


.word 0x20000400
.word 0x800000ed
.space 0xe4


.data
mick: .byte 2, 3, 4 
keith: .byte 5, 6, 7 @ reserve 1 byte of RAM and initialize it to 02
result: .space 0x01 @ reserve 1 byte of RAM without any initialization
.text
start:
    ldr r0, =mick @ load address of mick into r0
    ldrb r1, [r0] @ load r1 with memory byte contents of mick
    ldr r0, =keith @ load address of keith into r0
    ldrb r2, [r0] @ load r2 with memory byte contents of keith
    add r3, r2, r1 @ r3 = r2 + r1
    mov r4, #0; @ r4 will contain sum 
    
    @ sum for [0][0]
    mul r5, r1, r2 
    add r4, r4, r5

    @ sum for [1][1]
    add r1, r1, #1
    add r2, r2, #1
    mul r5, r1, r2
    add r4, r4, r5

    @ sum for [2][2]
    add r1, r1, #1
    add r2, r2, #1
    mul r5, r1, r2
    add r4, r4, r5
    ldr r0, =result @ load address of result into r0
    strb r4, [r0] @ store sum into memory at location result
stop: b stop

