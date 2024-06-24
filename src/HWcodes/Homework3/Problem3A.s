.syntax unified 

.arm

.data 
number: .word

.text 
.global _start
start: 
ldr r0, =number @ Load the address of number into r0
ldr r0, [r0] @ Load the value of number into r0
mov r1, #2 
sdiv r2, r0, r1 @ r2 hold stop condition of my loop
mov r3, #1 @ my flag to check if the number is prime
forloop:
        cmp r1, r2
        bgt endforloop @ ends loop if r1 > r2 (inverse of r1 <= r2)
        
        sdiv r4, r0, r1
        cmp r4, #0
        beq notprime
        adds r1, r1, #1
        b forloop
notprime: 
        mov r3, #0 @ set flag to 0
endforloop:
        b end

