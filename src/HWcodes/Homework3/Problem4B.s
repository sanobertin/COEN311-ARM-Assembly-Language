.syntax unified 
.arm

.data 
array1: .word 
endofarray1: .word 0xFFFFFFFF
array2: .word
sigma: .space 4
.text 

.globl _start
_start:
    ldr r0, =array1
    ldr r4, =array2
    ldr r1, =endofarray1
    ldr r1, [r1]
    mov r9, #0
    myloop:
        ldr r3, [r0, r9]
        add r2, r9, #4
        cmp r3, r1 @ compare the value of r3 with the end of array
        beq endmyloop
    endmyloop:
        push {r0, r4, r9  }
        bl mean
        pop {r10}
        ldr r0, =sigma
        str r10, [r0]
    endhere: b . @ end program here


mean: 
pop { r5, r6, r7} @ r5 = address of array1, r6 = address array2, r7 = size of both arrays
mov r8, r7 @ make a copy of r7 in r8
sub r8, r8, #1 @ ensure consistency with the loop
mov r11, #0  @ to be used for absolute value 
mov r10, #0 @ sigma
mov r3, #0 
loop:
    cmp r8, #0 
    blt endloop @ terminates if r8 < 0
    ldr r0, [r5, r8] @ load the value of array1 into r0
    ldr r1, [r6, r8] @ load the value of array2 into r1
    subs r2, r0, r1 @ r2 = array1 - array2 & update the flags
    submis r2, r11, r2 @ executes only if N==1 from the op above
    add r3, r3, r2 @ r3 = r3 + r2 
    sub r8, r8, #1 @ decrement the counter
endloop:
    udiv r10, r3, r7 @ calculate the mean
    push {r10} @ store the mean in the stack
    bx lr @ end subroutine here
    

