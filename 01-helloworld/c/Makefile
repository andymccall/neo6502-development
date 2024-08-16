# ----------------------------
# Makefile Options
# ----------------------------

CC         = mos-neo6502-clang
NEOEMU     = neo
NEO_HOME   = ~/development/tools/neo6502/

default: all

all:
	@echo "Building project..."
	mkdir -p bin
	mos-neo6502-clang -Os -o bin/helloworld.neo src/main.c
	rm bin/helloworld.neo.elf

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
	cp bin/helloworld.neo storage
	$(NEOEMU) bin/helloworld.neo cold
	rm -rf storage
	rm memory.dump