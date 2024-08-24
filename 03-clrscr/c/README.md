### 03-clrscr

This program prints "Hello, World!" to the console of the NEO6502.

#### Building

Perform the following commands to compile the project:

```
username@host:~$ cd neo6502-development/03-clrscr/c
Building project...
mkdir -p bin
mos-neo6502-clang -Os -o bin/clrscr.neo src/main.c
rm bin/clrscr.neo.elf
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
clrscr.neo          84 bytes.
```

Then run the binary using by loading it and issuing the run command:

```
load"clrscr.neo"
Hello, World!
```

You should see something similar to the following:

![Screenshot of the neo emulator](https://github.com/andymccall/neo6502-development/blob/main/03-clrscr/assets/03-clrscr_c.png?raw=true)
