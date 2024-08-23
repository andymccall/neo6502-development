### 01-hellochar

This program prints a single character to the console of the NEO6502.

#### Building

Perform the following commands to compile the project:

```
username@host:~$ cd neo6502-development/01-hellochar/c
Building project...
mkdir -p bin
mos-neo6502-clang -Os -o bin/hellochar.neo src/main.c
rm bin/hellochar.neo.elf
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
hellochar.neo          142 bytes.
```

Then run the binary using by loading it and issuing the run command:

```
load"hellochar.neo"
N
```

You should see something similar to the following:

![Screenshot of the neo emulator](https://github.com/andymccall/neo6502-development/blob/main/01-hellochar/assets/01-hellochar_c.png?raw=true)
