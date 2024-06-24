.syntax unified

.arm 
.global _start 
start:    
ldr  R0, =m    @ Load the address of m (dividend) 
ldr  R0, [R0]       @ Load the value of m (dividend) 
ldr  R3, =n     @ Load the address of n (divisor) 
ldr  R3, [R3]       @ Load the value of n (divisor) 
sub  R1, R1, R1     @ Initialize k (quotient) in R1=0 
sub  R2, R2, R2     @ Initialize i (counter) in R2=0 loop:     
add  R1, R1, #1     @ Increment k (quotient) 
add  R2, R2, R3     @ Increment i (counter) 
cmp  R2, R0         @ Compare i and m           
blt  loop           @ Loop if i < m            
ldr  R0, =k  @ Load address of k (quotient)           
str  R1, [R0]       @ Store k (quotient) in memory               
b    .              @ Halt the program 
.align 2   

m:   .word 12   @ dividend = 12 n:    
.word 3   @ divisor = 3 k:   
.space 4   @ quotient (32 bit)
