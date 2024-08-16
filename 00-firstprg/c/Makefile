# ----------------------------
# Makefile Options
# ----------------------------

CA65       = ca65
CA65_FLAGS =
AR65       = ar65
AR65_FLAGS = a
CL65       = cl65
CL65_FLAGS = -t cx16
RM         = rm -f
NEOEMU     = neo

default: all

all:
	@echo "Building project..."
	mkdir -p bin
	mkdir -p lst
	$(CA65) $(AR65_FLAGS) crt0.s
    $(AR65) $(AR65_FLAGS) neo6502.lib crt0.o
    $(CL65) --static-locals -t none -C neo6502.cfg -O --cpu 65c02 -l lst/firstprg.lst -m main.map -o bin/main.neo src/firstprg.c neo6502.lib

clean:
	@echo "Cleaning project..."
	rm -rf bin
	rm -rf lst
	rm -rf *.bin

run:
	@echo "Launching emulator..."
	$(NEOEMU) bin/firstprg.neo@800 cold