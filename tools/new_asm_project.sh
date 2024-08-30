#!/usr/bin/env bash

echo -n "Creating new Neo6502 assembly project..."
mkdir -p $1
mkdir -p $1/asm
mkdir -p $1/asm/src

cp -r $( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )/asm/includes $1/asm/src

cat > $1/asm/Makefile << 'EOF'
# ----------------------------
# Makefile Options
# ----------------------------

NAME       = ASM_PROGRAM_VARIABLE
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
EOF
sed -i -e s/ASM_PROGRAM_VARIABLE/${1}/g $1/asm/Makefile

cat > $1/asm/src/main.asm << 'EOF'
;
; Title:		       ASM_PROGRAM_VARIABLE
;
; Description:         
;                      
; Author:		       
;
; Created:		       
; Last Updated:	       
;

.include "includes/neo6502.asm"

.org $800
.segment "STARTUP"

start:

    ldx #0                 ; initialize string iteration index
    lda API_FN_WRITE_CHAR  ; console write function        (API::console->write)
    sta API_FUNCTION       ; set API 'Function'            (API::console->write)
print_next_char:
    lda API_COMMAND        ; previous API routine status
    bne print_next_char    ; wait for previous API routine to complete

    lda hello_msg , x      ; next character of 'hello_msg' (API::console->write->char)
    beq end                ; test for string end null byte
    sta API_PARAMETERS + 0 ; set API 'Parameter0'          (API::console->write->char)
    lda #API_GROUP_CONSOLE  ; 'Console' API function group  (API::console)
    sta API_COMMAND        ; trigger 'Console' API routine (API::console)

    inx                    ; increment iteration index
    jmp print_next_char    ; continue 'hello_msg' print loop
end:
    jmp end                ; infinite loop


hello_msg:     .byte "Hello, World!",0
EOF
sed -i -e s/ASM_PROGRAM_VARIABLE/${1}/g $1/asm/src/main.asm


cat > $1/asm/README.md << 'EOF'
### ASM_PROGRAM_VARIABLE

This program prints "Hello, World!" to the console of the Neo6502.

#### Building

Perform the following commands to compile the project:

```
username@host:~$ cd neo6502-development/ASM_PROGRAM_VARIABLE/asm$
username@host:~$ make
Building project...
mkdir -p bin
mkdir -p lst
mkdir -p map
cl65 --static-locals -t none -C src/includes/neo6502.cfg -O --cpu 65c02 -l lst/ASM_PROGRAM_VARIABLE.lst -m map/ASM_PROGRAM_VARIABLE.map -o bin/ASM_PROGRAM_VARIABLE.bin src/main.asm src/includes/neo6502.lib
python3 ~/development/tools/neo6502/exec.zip bin/ASM_PROGRAM_VARIABLE.bin@800 run@800 -o"bin/ASM_PROGRAM_VARIABLE.neo"
rm bin/ASM_PROGRAM_VARIABLE.bin
```

#### Running the program

The newly built program can be run within the neo emulator using the following commands:

```
username@host:~$ make run
```

This will launch the neo emulator.
EOF
sed -i -e s/ASM_PROGRAM_VARIABLE/${1}/g $1/asm/README.md

echo "Done!"
echo ""
echo "Your assembly project is now available in the directory ${1}."
echo "Please follow ${1}/asm/README.md to build and run program."