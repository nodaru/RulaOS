.code16
.global _bootst

str_p:
    .ascii "RulaOS\n"

.equ BOOTSEG, 0x07c0

ljmp $BOOTSEG, $_bootst

_bootst:
    mov $0x03,%ah
    int $0x10
    mov $0x13, %ah
    mov $BOOTSEG, %cx
    mov %cx , %es
    mov $str_p, %bp
    mov $0x0003, %bx
    int $0x13

.=510

id:
	.word 0xaa55
