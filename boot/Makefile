all: Image

.PHONY= clean run-qemu

bootsect.o:
	@as --32 boot.s -o bootsect.o

run-qemu:
	@qemu-system-i386 -boot a -fda bootsect

bootsect: bootsect.o
	@ld -T ld-bootsect.ld bootsect.o -o  bootsect 
	@objcopy -O binary -j .text bootsect

clean:
	@rm -f *.o bootsect
