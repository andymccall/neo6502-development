# ----------------------------
# Makefile Options
# ----------------------------

NAME	   = hellochar
CC         = mos-neo6502-clang
NEOEMU     = neo
NEO_HOME   = ~/development/tools/neo6502/

default: all

all:
	@echo "Building project..."
	mkdir -p bin
	mos-neo6502-clang -Os -o bin/$(NAME).neo src/main.c
	rm bin/$(NAME).neo.elf

clean:
	@echo "Cleaning project..."
	rm -rf bin
	rm -rf storage
	rm -rf src/*.o
	rm -rf includes/*.o
	if [ -f memory.dump ]; then rm memory.dump; fi

run:
	@echo "Launching emulator..."
	mkdir -p storage
	cp bin/$(NAME).neo storage
	$(NEOEMU) bin/$(NAME).neo@800 cold
	rm -rf storage
	rm memory.dump