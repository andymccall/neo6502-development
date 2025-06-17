### 05-sprite

This program does nothing other than start and stop.  It's intended to test your development environment.

#### Building

Perform the following commands to compile the project:

```
username@host:~$ cd neo6502-development/05-sprite/asm
username@host:~$ make
Building project...
mkdir -p bin
mkdir -p lst
mkdir -p map
cl65 --static-locals -t none -C src/includes/neo6502.cfg -O --cpu 65c02 -l lst/sprite.lst -m map/sprite.map -o bin/sprite.bin src/main.asm src/includes/neo6502.lib
python3 ~/development/tools/neo6502/exec.zip bin/sprite.bin@800 run@800 -o"bin/sprite.neo"
rm bin/sprite.bin
```

#### Running the program

The newly built program can be run within the neo emulator using the following commands:

```
username@host:~$ make run
```

This will launch the neo emulator.

You should see something similar to the following:

![Screenshot of the neo emulator](https://github.com/andymccall/neo6502-development/blob/main/05-spriteassets/05-sprite_asm.png?raw=true)
