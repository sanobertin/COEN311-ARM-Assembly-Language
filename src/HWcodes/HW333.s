.syntax unified
.cpu cortex-m4

.thumb @ 16-bit architecture

.data 
a: .word 15 
b: .word 15 
product: .space 4
.text 

.global _start
start: 
   ldr R0, =a
   ldr R0, [R0] @ load a into R0 
   ldr R1, =b
   ldr R1, [R1] @ load b into R1
   mov R4, #0
   cmp R4, R1 @ R4 - R1
   bgt b_greater_than_zero
   blt b_less_than_zero
b_less_than_zero: 
    mov R2, #0
    sub R3, R3, R0
    mov R4, #1
    sub R2, R2, R4 @ R2 - R4 aka  i -1
    ldr R4, =product
    str R3, [R4]
    cmp R2, R1
    beq endforloop
    b b_less_than_zero
b_greater_than_zero:
    mov R2, #0
    add R3, R3, R0
    mov R4, #1
    add R2, R2, R4 @ R2 + 1 aka i +1 
    ldr R4, =product
    str R3, [R4]
    cmp R2, R1
    beq endforloop
    b b_greater_than_zero
endforloop:
stop: b stop

