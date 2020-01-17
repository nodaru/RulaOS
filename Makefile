all: Image

.PHONY= clean run-qemu

bootsect.o:
	@as --32 boot/boot.s -o boot/bootsect.o

run:
	@qemu-system-i386 -boot a -fda boot/bootsect

bootsect: bootsect.o
	@ld -T script/ld-bootsect.ld bootsect.o -o  bootsect 
	@objcopy -O binary -j .text boot/bootsect

clean:
	@rm -f boot/bootsect boot/*.o 
