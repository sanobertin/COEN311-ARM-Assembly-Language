.syntax unified

.arm
.global _start 
start: 
ldr  R0, =x  @ Get the address of x 
ldr  R1, [R0]  @ Load the value of x 
ldr  R0, [R0]  @ Load Another copy of x 
ldr  R2, =y  @ Get the address of y 
ldr  R2, [R2]  @ Load the value of y 
sub  R3, R3, R3 @ Clear R2 
add  R3, R3, #4 @ R3 = 4 
mul  R5, R0, R0  @ R0 = x2 
mul  R6, R1, R2  @ R1 = xy 
mul  R7, R2, R2  @ R2 = y2 
mul  R8, R2, R3  @ R2 = 4y2 
sub  R0, R5, R8 @ R0 = x2 - 4y2 
add  R0, R0, R6 @ R0 = x2 - 4y2 + xy 
ldr  R0, =f  @ get the address of f 
str  R3, [R0]  @ Store the value of f  
b   .   @ Halt the program 
 
x:  .space 4 
y:  .space 4 
f:  .space 4 
