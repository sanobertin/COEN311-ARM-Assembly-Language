@lab exam
@ Problem: given a list of arrays, compute the sum of ONLY negative numbers and store the sum to memory
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
number: .byte 1, -2, 3, -4, 5
sum: .space 0x1

.text 

start: 
sub r2, r2, r2
sub r1, r1, r1
sub r0, r0, r0 
sub r3, r3, r3
sub r4, r4, r4
sub r5, r5, r5

mov r2, #0 @ holds the sum 
mov r3, #0 @ keep disp

ldr r0, =number 

loopinarray:
ldrb r4, [r0], #1
add r3, r3, #1

cmp r4, #128 @ see negative numbers in assembly and range of positive numbers in 0-255 byte sized 
ble loopinarray 

add r2, r2, r4 
cmp r3, #4 
blt loopinarray


ldr r5, =sum 
strb r2, [r5]

stop: b .



