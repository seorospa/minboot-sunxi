.section ".stub"
.global _start
_start:
    b 1f
    .ascii "eGON.BT09l\n_"
    .word _size_

1:
	mrs r0,cpsr
	orr r0,r0,#0xFF
	bic r0,r0,#0x22
	msr cpsr_c,r0
	mrc p15,0,r0,c1,c0
	bic r0,r0,#0x07
	bic r0,r0,#0x1800
	mcr p15,0,r0,c1,c0

    adr r0,_start
    ldr r1,=_bss_start_
    ldr r2,=_bss_size_
    add r0,r0,r1
    add r1,r0,r2
    mov sp,r0
    mov r2,#0
2:
    cmp r0,r1
    beq main
    stmia r0!,{r2}
    b 2b
