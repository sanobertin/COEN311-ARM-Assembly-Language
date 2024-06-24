.syntax unified 
.cpu cortex-m4
.thumb

.word 0x20000400
.word 0x800000ed
.space 0xe4

start:
	mov r0, #4
	mov r1, #5
	add r2, r1, r0

stop: b stop
