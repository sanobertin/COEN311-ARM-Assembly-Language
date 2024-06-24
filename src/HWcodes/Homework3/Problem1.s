.syntax unified

.arm 
.global _start 
start:   
    ldr r0, =a
    ldr r0, [r0]
    ldr r1, =b
    ldr r1, [r1]
    muls r2, r1, r0
    ldr r3, =product
    str r2, [r3]
end: b .

a:  .space 4 
b:  .space 4 
i:  .word 0 
product:  .space 4 
