.code16
.global _bootst

.equ BOOTSEG, 0x07c0

ljmp $BOOTSEG, $_bootst

_bootst:
	jmp _bootst

.=510

id:
	.word 0xaa55
