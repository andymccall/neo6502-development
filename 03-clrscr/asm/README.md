### 03-clrscr

This program clears the console of the NEO6502.

#### Building

Perform the following commands to compile the project:

```
username@host:~$ cd neo6502-development/03-clrscr/asm$
username@host:~$ make
Building project...
mkdir -p bin
mkdir -p lst
mkdir -p map
cl65 --static-locals -t none -C src/includes/neo6502.cfg -O --cpu 65c02 -l lst/clrscr.lst -m map/clrscr.map -o bin/clrscr.bin src/main.asm src/includes/neo6502.lib
python3 ~/development/tools/neo6502/exec.zip bin/clrscr.bin@800 run@800 -o"bin/clrscr.neo"
rm bin/clrscr.bin
```

#### Running the program

The newly built program can be run within the neo emulator using the following commands:

```
username@host:~$ make run
```

This will launch the neo emulator.

You should see something similar to the following:

![Screenshot of the neo emulator](https://github.com/andymccall/neo6502-development/blob/main/03-clrscr/assets/03-clrscr_asm.png?raw=true)
