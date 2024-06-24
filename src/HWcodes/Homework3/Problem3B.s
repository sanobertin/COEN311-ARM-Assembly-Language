.syntax unified 
.arm

.data 
number: .word

.text 

.macro ChkPrime flag, num

        mov r1, #2 
        sdiv r3, \num, r1 @ stop confition of my loop
        mov \flag, #1 
        forloop\@:
                cmp r1, r3
                bgt endforloop @ ends loop if r1 > r2 (inverse of r1 <= r2)

                sdiv r4, \num, r1
                cmp r4, #0
                beq notprime
                adds r1, r1, #1
                b forloop
        notprime\@: 
                mov \flag, #0 @ set flag to 0
        endforloop\@:
 
.endm 
.global _start 
start: 
        ldr r0, =number @ Load the address of number into r0
        ldr r0, [r0] @ Load the value of number into r0
        ChkPrime r5, r0 @ result in r5
endhere: b end

