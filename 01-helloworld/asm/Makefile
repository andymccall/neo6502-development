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
	$(CL65) --static-locals -t none -C includes/neo6502.cfg -O --cpu 65c02 -l lst/helloworld.lst -m map/helloworld.map -o bin/helloworld.bin src/main.asm includes/neo6502.lib
	python3 $(NEO_HOME)exec.zip bin/helloworld.bin@800 run@800 -o"bin/helloworld.neo"
	rm bin/helloworld.bin

clean:
	@echo "Cleaning project..."
	rm -rf bin
	rm -rf lst
	rm -rf map
	rm -rf *.bin
	rm -rf storage
	if [ -f memory.dump ]; then rm memory.dump; fi

run:
	@echo "Launching emulator..."
	mkdir -p storage
	cp bin/helloworld.neo storage
	$(NEOEMU) bin/helloworld.neo@800 cold
	rm -rf storage
	rm memory.dump