CC=arm-none-eabi-gcc
CP=arm-none-eabi-g++
OC=arm-none-eabi-objcopy 
LD=arm-none-eabi-ld

CFLAGS=-c -mcpu=mpcore -march=armv6k -mlittle-endian
# No linker flags yet, but here if you need it
LDFLAGS=

all:
	$(CC) -g source/*.c $(CFLAGS)
	$(CC) -g source/*.s $(CFLAGS)
	cp *.o ./obj
	$(LD) -T 3ds.ld *.o $(LDFLAGS)
	cp a.out ./bin/homebrew.elf
	$(OC) -O binary a.out payload.bin
	python lib/p3ds/3dsploit.py payload.bin

clean:
	echo "Omnomnomnom files"
	rm *.o *.out payload.bin
