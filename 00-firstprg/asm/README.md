### 00-firstprg

This program does nothing other than start and stop.  It's intended to test your development environment.

#### Building

Perform the following commands to compile the project:

```
username@host:~$ cd neo6502-development/00-firstprg/asm
username@host:~$ make
Launching emulator...
mkdir -p storage
cp bin/firstprg.neo storage
neo bin/firstprg.neo cold
neo
bin/firstprg.neo
cold
[bin/firstprg.neo]
Trying to read header for bin/firstprg.neo
Header check 1
Header found.
Execute from $800
Control byte 0
Load to 800 size 6
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
```

You should see something similar to the following:

![Screenshot of the neo emulator](https://github.com/andymccall/neo6502-development/blob/main/00-firstprg/assets/00-firstprg_asm.png?raw=true)
