OBJS=src/main.o src/start.o src/uart.o
CFLAGS=-Os -Wall -marm -ffreestanding -fpic -nostdinc -Iinclude
LDFLAGS=-Tlinker.lds -nostdlib
HEADERS=

%.o: %.c $(HEADERS)
	$(CROSS_COMPILE)gcc -o $@ -c $< $(CFLAGS)

%.o: %.s
	$(CROSS_COMPILE)as -o $@ $^

boot.bin: boot.elf mksum
	$(CROSS_COMPILE)objcopy -O binary $< $@
	./mksum $@

boot.elf: $(OBJS) linker.lds
	$(CROSS_COMPILE)ld $(LDFLAGS) $(OBJS) -o $@

mksum: tools/mksum.c
	gcc -o $@ $^ -O2 -Wall

clean:
	rm -f $(OBJS) boot.{elf,bin} mksum
