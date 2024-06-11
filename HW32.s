.syntax unified
.cpu cortex-m4

.thumb 

.data 

x: .word 0xFF
y: .word 0xBB
f: .space 4 

.text
.global _start
start: 
    ldr R0, =x
    ldr R0, [R0]
    ldr R1, =y
    ldr R1, [R1]
    @ f = x*x  + x*y - 4*y^2
    mul R2, R0, R1 @ hold x*y
    mul R0, R0, R0 @ hold x^2 
    mul R1, R1, R1 @ hold y^2 
    mov R3, #-4
    mul R1, R3, R1 @ hold -4*y*y
    add R3, R2, R0 @ hold  x*x  + x*y
    add R3, R3, R1 @ hold f = x*x  + x*y - 4*y^2
    ldr R2, =f 
    str R3, [R2]
stop: b stop

end: b .end
