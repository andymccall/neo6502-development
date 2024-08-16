# ----------------------------
# Makefile Options
# ----------------------------

CA65       = ca65
AR65       = ar65
CL65       = cl65
RM         = rm -f
NEOEMU     = neo
NEO_HOME   = ~/development/tools/neo6502/

default: all

all:
	@echo "Building project..."
	mkdir -p bin
	mkdir -p lst
	mkdir -p map
	$(CA65) includes/crt0.s
	$(AR65) a includes/neo6502.lib includes/crt0.o
	$(CL65) --static-locals -t none -C includes/neo6502.cfg -O --cpu 65c02 -l lst/hello.lst -m map/hello.map -o bin/hello.bin src/main.c includes/neo6502.lib
	python3 $(NEO_HOME)/exec.zip bin/hello.bin@800 run@800 -o"bin/hello.neo"

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
	mkdir -p storage
	cp bin/hello.neo storage
	$(NEOEMU) bin/hello.neo@800 cold
	rm -rf storage
	rm memory.dump