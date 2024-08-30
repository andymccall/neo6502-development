#!/usr/bin/env bash

echo -n "Creating new C project..."
mkdir -p $1
mkdir -p $1/c
mkdir -p $1/c/src

cat > $1/c/Makefile << 'EOF'
# ----------------------------
# Makefile Options
# ----------------------------

NAME       = C_PROGRAM_VARIABLE
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
	$(NEOEMU) bin/$(NAME).neo cold
	rm -rf storage
	rm memory.dump
EOF
sed -i -e s/C_PROGRAM_VARIABLE/${1}/g $1/c/Makefile

cat > $1/c/src/main.c << EOF
/* 
/ Title:
/
/ Description:
/
/ Author:
/
/ Created:
/ Last Updated:
/
/ Modinfo:
*/

#include <stdio.h>

int main(void) {

   printf("Hello, World!\n");

   return 0;

}
EOF

cat > $1/c/README.md << 'EOF'
### C_PROGRAM_VARIABLE

This program prints "Hello, World!" to the console of the NEO6502.

#### Building

Perform the following commands to compile the project:

```
username@host:~$ cd neo6502-development/C_PROGRAM_VARIABLE/c
Building project...
mkdir -p bin
mos-neo6502-clang -Os -o bin/C_PROGRAM_VARIABLE.neo src/main.c
rm bin/C_PROGRAM_VARIABLE.neo.elf
```

#### Running the program

The newly built program can be run within the neo emulator using the following commands:

```
username@host:~$ make run
```

This will launch the neo emulator.

Once the emulator has started check the binary is accessible to the emulator by using the dir command:

```
cat
C_PROGRAM_VARIABLE.neo          84 bytes.
```

Then run the binary using by loading it and issuing the run command:

```
load"C_PROGRAM_VARIABLE.neo"
Hello, World!
```
EOF
sed -i -e s/C_PROGRAM_VARIABLE/${1}/g $1/c/README.md

echo "Done!"
echo ""
echo "Your C project is now available in the directory ${1}."
echo "Please follow ${1}/c/README.md to build and run program."