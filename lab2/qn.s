.syntax unified
.cpu cortex-m4
.thumb

.word 0x20000400
.word 0x800000ed
.space 0xe4

.data
array1: .byte 2, 3, 4 
array2: .byte 5, 6, 7 
result: .space 0x01 @ reserve 1 byte of RAM without any initialization

sum: .data 0x07
multi: .space 0x04

.text
start:
    ldr r0, =array1 @ load address of mick into r0
    ldrb r1, [r0] @ load 0x01 into r1
    ldr r0, =array1 +1  @ load address of keith into r0
    ldrb r2, [r0] @ load 0x02 into r2
    ldr r0, =array1 +2 
    ldrb r3, [r0] @ load 0x03 into r3
    ldr r0, =array2 @ load address of array2 into r0
    ldrb r4, [r0] @ load 0x04 into r4
    ldr r0, =array2 +1  
    ldrb r5, [r0] @ load 0x05 into r5
    ldr r0, = array2 + 2
    ldrb r6, [r0] @ load 0x06 into r6
    mul r0, r1, r4 @ multiply 0x01 and 0x04
    ldr r0, =sum
    add r7, r0
    mul r0, r2, r5 @ multiply 0x02 and 0x05
    ldr r0, =sum
    add r7, r0
    mul r0, r3, r6 @ multiply 0x03 and 0x06
    ldr r0, =sum
    add r7, r0
stop: b stop
