# ----------------------------
# Makefile Options
# ----------------------------

CA65       = ca65
AR65       = ar65
CL65       = cl65
RM         = rm -f
NEOEMU     = neo

default: all

all:
	@echo "Building project..."
	mkdir -p bin
	mkdir -p lst
	mkdir -p map
	$(CA65) includes/crt0.s
	$(AR65) a includes/neo6502.lib includes/crt0.o
	$(CL65) --static-locals -t none -C includes/neo6502.cfg -O --cpu 65c02 -l lst/helloworld.lst -m map/helloworld.map -o bin/helloworld.neo src/main.asm includes/neo6502.lib

clean:
	@echo "Cleaning project..."
	rm -rf bin
	rm -rf lst
	rm -rf map
	rm -rf *.bin
	rm -rf storage
	rm memory.dump

run:
	@echo "Launching emulator..."
	$(NEOEMU) bin/helloworld.neo@800 cold
	rm -rf storage
	rm memory.dump