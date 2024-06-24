.syntax unified
.arm 

.data 
memword: .ascii "IKEA" 
endofmemword: .byte 0x0
.global _start
start: 
    ldr r9, =memword @ Load the address of memword into r0
    ldrb r1, [r9, #0] @ Load the first byte of memword into r1
    ldrb r2, [r9, #1] @ Load the second byte of memword into r2
    ldrb r3, [r9, #2] @ Load the third byte of memword into r3
    ldrb r4, [r9, #3] @ Load the fourth byte of memword into r4
    lsl r1, r1, #24 @ Shift the first byte of memword to the left by 24 bits
    lsl r2, r2, #16 @ Shift the second byte of memword to the left by 16 bits
    lsl r3, r3, #8 @ Shift the third byte of memword to the left by 8 bits
    lsl r4, r4, #0 @ Shift the fourth byte of memword to the left by 0 bits
    orr r0, r1, r2 @ Combine the first and second bytes of memword
    orr r0, r0, r3 @ Combine the first, second, and third bytes of memword
    orr r0, r0, r4 @ Combine all four bytes of memword
    @now r0 contains the ASCII value of "IKEA" in a single word
    ror r0, r0, #24 @ Rotate right by 24 bits. now r0 = KEAI 
    mov r1, #0b11111111 @ r1 = 0xFF
    lsl r1, r1, #24 @ r1 = 0xFF000000
    and r0, r0, r1 @ clear other bits of r0 except the first byte
    ldrb r1, [r9, #3] @ load 'A'
    lsl r1, r1, #16 
    orr r0, r0, r1
    ldrb r1, [r9, #0] @ load 'I'
    lsl r1, r1, #8
    orr r0, r0, r1
    ldrb r1, [r9, #2] @ load 'E'
    orr r0, r0, r1
end: 
    b end 




