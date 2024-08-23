### 01-hellochar

This program prints a single character to the console of the NEO6502.

#### Building

Perform the following commands to compile the project:

```
username@host:~$ cd neo6502-development/01-hellochar/asm$
username@host:~$ make
Launching emulator...
mkdir -p storage
cp bin/hellochar.neo storage
neo bin/hellochar.neo cold
neo
bin/hellochar.neo
cold
[bin/hellochar.neo]
Trying to read header for bin/hellochar.neo
Header check 1
Header found.
Execute from $800
Control byte 0
Load to 800 size 18
Comment 
Loading bytes.
[cold]
Cold boot $800
rm -rf storage
rm memory.dump
```

#### Running the program

The newly built program can be run within the neo emulator using the following commands:

```
username@host:~$ make run
```

This will launch the neo emulator.

You should see something similar to the following:

![Screenshot of the neo emulator](https://github.com/andymccall/neo6502-development/blob/main/01-hellochar/assets/01-hellochar_asm.png?raw=true)
