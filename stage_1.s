.code16

.global stage_1_prelude

stage_1_prelude:
	jmp $0x0000, $(0x7c00 + relocate_stage_1)

relocate_stage_1:
	cld
	movw $0x0060, %ax
	movw %ax, %es
	xorw %di, %di

	movw %di, %ds
	movw $(0x7c00 + stage_1), %si

	movw $(510 - (stage_1 - stage_1_prelude)), %cx
	rep movs

	jmp $0x0060, $0x0000

stage_1:
	movb $0x0e, %ah
	movb $'!', %al
	int $0x10
	jmp stage_1

.org 446

.org 510
.byte 0x55
.byte 0xaa
