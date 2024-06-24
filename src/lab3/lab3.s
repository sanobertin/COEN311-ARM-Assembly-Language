@author: Bertin Mihigo Sano
@date: 2024-May-23
@Lab3 - experiment 

.syntax unified
.cpu cortex-m4
.thumb

.word 0x20000400
.word 0x800000ed
.space 0xe4

.data
array: .byte 3, 2, 4, 1, 5, 6
@ 3 rows and 2 columns
@ array =   3 2
@           4 1
@           5 6



.text
start:
    ldr r0, =array @ load the address of the array
    mov r4, #2 @ define the number of columns
     @ load array [2][1] 
    mov r1, #2 @ load the number of rows
    mov r2, #1 @ load the number of columns
    mul r3, r1, r4 
    add r3, r3, r2
    ldrb r8, [r0, r3] @ load the value of a[2][1] = 6

    @ load array [1][1]
    mov r1, #1 @ load the number of rows
    mov r2, #1 @ load the number of columns
    mul r3, r1, r4
    add r3, r3, r2
    ldrb r9, [r0, r3] @ load the value of a[1][1] = 1
    
    @ now loading array [0][1]
    mov r1, #0 @ load the number of rows
    mov r2, #1 @ load the number of columns
    mul r3, r1, r4
    add r3, r3, r2
    ldrb r10, [r0, r3] @ load the value of a[0][1] = 2


stop: b stop

.end


