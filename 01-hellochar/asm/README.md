### 01-hellochar

This program prints a single character to the console of the NEO6502.

#### Building

Perform the following commands to compile the project:

```
username@host:~$ cd neo6502-development/01-hellochar/asm$
username@host:~$ make
Building project...
mkdir -p bin
mkdir -p lst
mkdir -p map
cl65 --static-locals -t none -C src/includes/neo6502.cfg -O --cpu 65c02 -l lst/hellochar.lst -m map/hellochar.map -o bin/hellochar.bin src/main.asm src/includes/neo6502.lib
python3 ~/development/tools/neo6502/exec.zip bin/hellochar.bin@800 run@800 -o"bin/hellochar.neo"
rm bin/hellochar.bin
```

#### Running the program

The newly built program can be run within the neo emulator using the following commands:

```
username@host:~$ make run
```

This will launch the neo emulator.

You should see something similar to the following:

![Screenshot of the neo emulator](https://github.com/andymccall/neo6502-development/blob/main/01-hellochar/assets/01-hellochar_asm.png?raw=true)
