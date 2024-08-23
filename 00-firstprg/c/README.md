### 00-firstprg

This program does nothing other than start and stop.  It's intended to test your development environment.

#### Building

Perform the following commands to compile the project:

```
username@host:~$ cd neo6502-development/00-firstprg/c
Building project...
mkdir -p bin
mos-neo6502-clang -Os -o bin/firstprg.neo src/main.c
rm bin/firstprg.neo.elf
```

#### Running the program

The newly built program can be run within the neo emulator using the following commands:

```
username@host:~$ make run
```

This will launch the neo emulator.

You should see something similar to the following:

![Screenshot of the neo emulator](https://github.com/andymccall/neo6502-development/blob/main/00-firstprg/assets/00-firstprg_c.png?raw=true)
