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
@ declare your data here
num: .byte 1,2,3,4,5
sum: .space 0x01
.text
start:
@ assembly code goes here
mov r0, #0
ldr r1, =num
mov r2, #5
@ we make use of register indirect addressing and conditional jumps
@ to setup a loop to add up the 5 numbers
top: 
    ldrb r3, [r1]
    add r0, r0, r3
    subs r2, r2, #1
    add r1, r1, #1
    bne top
    ldr r1, =sum
    strb r0, [r1]
stop: b stop
.end
