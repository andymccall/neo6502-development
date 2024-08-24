### 00-firstprg

This program does nothing other than start and stop.  It's intended to test your development environment.

#### Building

Perform the following commands to compile the project:

```
username@host:~$ cd neo6502-development/00-firstprg/asm
username@host:~$ make
Building project...
mkdir -p bin
mkdir -p lst
mkdir -p map
cl65 --static-locals -t none -C src/includes/neo6502.cfg -O --cpu 65c02 -l lst/firstprg.lst -m map/firstprg.map -o bin/firstprg.bin src/main.asm src/includes/neo6502.lib
python3 ~/development/tools/neo6502/exec.zip bin/firstprg.bin@800 run@800 -o"bin/firstprg.neo"
rm bin/firstprg.bin
```

#### Running the program

The newly built program can be run within the neo emulator using the following commands:

```
username@host:~$ make run
```

This will launch the neo emulator.

You should see something similar to the following:

![Screenshot of the neo emulator](https://github.com/andymccall/neo6502-development/blob/main/00-firstprg/assets/00-firstprg_asm.png?raw=true)
