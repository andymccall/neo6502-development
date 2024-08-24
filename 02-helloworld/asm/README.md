### 02-helloworld

This program prints "Hello, World!" to the console of the NEO6502.

#### Building

Perform the following commands to compile the project:

```
username@host:~$ cd neo6502-development/02-helloworld/asm$
username@host:~$ make
Building project...
mkdir -p bin
mkdir -p lst
mkdir -p map
cl65 --static-locals -t none -C src/includes/neo6502.cfg -O --cpu 65c02 -l lst/helloworld.lst -m map/helloworld.map -o bin/helloworld.bin src/main.asm src/includes/neo6502.lib
python3 ~/development/tools/neo6502/exec.zip bin/helloworld.bin@800 run@800 -o"bin/helloworld.neo"
rm bin/helloworld.bin
```

#### Running the program

The newly built program can be run within the neo emulator using the following commands:

```
username@host:~$ make run
```

This will launch the neo emulator.

You should see something similar to the following:

![Screenshot of the neo emulator](https://github.com/andymccall/neo6502-development/blob/main/02-helloworld/assets/02-helloworld_asm.png?raw=true)
