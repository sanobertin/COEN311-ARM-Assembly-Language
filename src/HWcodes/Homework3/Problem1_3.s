.syntax unified 

.arm
.global _start 
start: 
ldr  R0, =a  @ Get the address of a 
ldr  R0, [R0]  @ Load the value of a 
ldr  R1, =b  @ Get the address of b 
ldr  R1, [R1]  @ Load the value of b 
mul  R0, R1  @ Compute the product (R0 = a x b) 
ldr  R2, =product @ Get the address of product 
str  R0, [R2]  @ Store the value 
b .   @ Halt the program 

a:  .space 4 
b:  .space 4 
product: .space 4 