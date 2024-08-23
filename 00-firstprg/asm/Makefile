# ----------------------------
# Makefile Options
# ----------------------------

NAME       = firstprg
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
	$(CL65) --static-locals -t none -C src/includes/neo6502.cfg -O --cpu 65c02 -l lst/$(NAME).lst -m map/$(NAME).map -o bin/$(NAME).bin src/main.asm src/includes/neo6502.lib
	python3 $(NEO_HOME)exec.zip bin/$(NAME).bin@800 run@800 -o"bin/$(NAME).neo"
	rm bin/$(NAME).bin

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
	cp bin/$(NAME).neo storage
	$(NEOEMU) bin/$(NAME).neo cold
	rm -rf storage
	rm memory.dump