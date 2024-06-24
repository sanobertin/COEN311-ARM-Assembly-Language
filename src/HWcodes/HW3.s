.syntax unified
.cpu cortex-m4

.thumb @ 16-bit architecture

.global _start
start: 
    ldr R0, =m @ load address of m into R0
    ldr R0, [R0]  @ load 12 into R0
    ldr R3, =n @ load address of n into R3
    ldr R3, [R3] @ load 3 into R3
    sub R1, R1, R1 @ clear R1
    sub R2, R2, R2 @ clear R2
    loop: add R1, R1, #1 
    add R2, R2, R3 @ R2 = R2 + R3
    cmp R2, R0 @ R2 - R0
    blt loop
    ldr R0, =k
    str R1, [R0]
    b .
    .align 2
@ recall that a word is 32-bit in SimARM
m: .word 12 
n: .word 3
k: .space 4 @ reserve space of n=4 bytes
