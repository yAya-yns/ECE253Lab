	.text
	.global _start
	
_start:
	//initialization
	//register used: r0(address of current word), r1 (storing value for current word), r2(temp) 
	//r5-r7 (counter for current word's ones, leading, trailing)
	//r8-r10 (counter for greatest ones, leading, trailing)
	mov r8,#0
	mov r9,#0
	mov r10,#0
	ldr r0,=LIST
	ldr r1,[r0]
	
mainLoop:
	cmp r1,#-1
	beq END
	
ONES:
	mov r5,#0//this value is greater than the current "max"
	mov r3,#0
	ldr r1,[r0]//restore the value for the next process (Leading)
	cmp r1,#0//see if this number don't have more 1's
	beq storeOnes
	and r3,r1,#1
	add r5,r3
storeOnes:
	movle r8,r5
	
	
	
	
	
	
	
END:
	b end
	
LIST: .word 0b0011100,0b111,0b11001,0b01100,-1	
	
.end

