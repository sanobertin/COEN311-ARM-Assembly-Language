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
   mul R3, R0, R1
   ldr R4, =product
   str R3, [R4]
stop: b stop

