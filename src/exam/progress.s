@lab exam
@ 
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
sub r6, r6, r6
mov r2, #0 @ holds the sum 
mov r3, #0 @ keep disp
mov r9, #255

ldr r0, =number 

loopinarray:
ldrb r4, [r0], #1
add r3, r3, #1
cmp r4, r9 
bge loopinarray 

add r2, r2, r4 
cmp r3, #5 
blt loopinarray


ldr r5, =sum 
strb r2, [r5]

stop: .end 



