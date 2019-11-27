
	.text
	.global _start
_start:
	ldr r3,=Test_NUM//current address
	ldr r1,[r3] //current value
	mov r0,#0 //counter
	mov r2,#0 //largest count
ones:
	cmp r1,#-1
	beq END
loop: 
	cmp r1, #0
	beq next
	lsr r4,r1,#1
	and r1,r1,r4
	add r0,#1
	b loop
next:
	movle r2,r0
	mov r0,#0
	add r3,#4
	ldr r1,[r3]
	b ones
END: 
	b END

Test_NUM: .word 0x1,0x3,0x103fe00f,-1

.end
