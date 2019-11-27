//finding the highest number of 1's, leading and trailing 0's in a list of number
//no subroutines were used in this code


	.text
	.global _start
	
_start:
	//initialization
	//register used: r0(address of current word), r1 (storing value for current word), r2(temp variable to see the result of masking) 
	//r5-r7 (counter for current word's ones, leading, trailing)
	//r8-r10 (counter for greatest ones, leading, trailing)
	mov r8,#0
	mov r9,#0
	mov r10,#0
	ldr r0,=LIST
	
	
mainLoop:
	ldr r1,[r0]
	cmp r1,#-1
	beq END
	//counting ones	
	mov r5,#0//this value is greater than the current "max"
	mov r2,#0//temp variable to see the result of masking
ONESLoop:	
	cmp r1,#0//see if this number don't have more 1's
	beq storeOnes
	and r2,r1,#1
	add r5,r2
	lsr r1,#1
	b ONESLoop
storeOnes:
	movlt r8,r5

	
	//counting leading zeros
	mov r6,#0//this value is greater than the current "max"
	mov r2,#0//temp variable to see the result of masking
	ldr r1,[r0]//making sure the value is before any modification
	cmp r1,#0
	beq LdZero
LeadingZerosLoop:
	and r2,r1,#2147483648
	cmp r2,#2147483648
	beq storeLdZeros
	add r6,#1
	lsl r1,#1
	b LeadingZerosLoop
storeLdZeros:
	movle r9,r6
	b JumpLdZero	
LdZero:
	mov r9,#32
JumpLdZero:
	//counting trailing zeros
	mov r7,#0//this value is greater than the current "max"
	mov r2,#0//temp variable to see the result of masking
	ldr r1,[r0]//making sure the value is before any modification
	cmp r1,#0//if the value passed in is 0
	beq TlZero
TrailingZerosLoop:
	and r2,r1,#1
	cmp r2,#1
	beq storeTlZeros
	add r7,#1
	lsr r1,#1
	cmp r1,#0
	beq storeTlZeros
	b TrailingZerosLoop
storeTlZeros:
	movle r10,r7
	b JumpTlZero	
TlZero:
	mov r10,#32
JumpTlZero:
	add r0,#4
	b mainLoop
	
	
END:
	b END
	
LIST: .word 0b00011111111111111100111111111000,0,-1	
	
.end

