all: Image

.PHONY= clean run-qemu

bootsect.o:
	@as --32 boot/boot.s -o boot/bootsect.o

run:
	@qemu-system-i386 -boot a -fda boot/bootsect

bootsect: bootsect.o
	@ld -T ld_script/ld-bootsect.ld boot/bootsect.o -o  boot/bootsect 
	@objcopy -O binary -j .text boot/bootsect

clean:
	@rm -f boot/bootsect boot/*.o 
