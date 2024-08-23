### 02-helloworld

This program prints "Hello, World!" to the console of the NEO6502.

#### Building

Perform the following commands to compile the project:

```
username@host:~$ cd neo6502-development/02-helloworld/asm$
username@host:~$ make
Launching emulator...
mkdir -p storage
cp bin/helloworld.neo storage
neo bin/helloworld.neo cold
neo
bin/helloworld.neo
cold
[bin/helloworld.neo]
Trying to read header for bin/helloworld.neo
Header check 1
Header found.
Execute from $800
Control byte 0
Load to 800 size 2e
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

![Screenshot of the neo emulator](https://github.com/andymccall/neo6502-development/blob/main/02-helloworld/assets/02-helloworld_asm.png?raw=true)
