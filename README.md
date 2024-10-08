# NEO6502 Development Environment Setup

## Intro

![Neo6502 Header](https://github.com/andymccall/neo6502-development/blob/main/assets/header.jpg?raw=true)

W65C02S lives in The Matrix and thinks there is real RAM and other interfaces around it, but the truth is that all this is emulation of the real life. The RP2040 emulates the RAM memory, video, IO and even clock the W65C02S by PWM.

## Features

Neo6502 has these features:

* W65C02S processor
* RP2040 SOC with 2MB Flash
* DVI video on HDMI connector
* USB host for keyboard
* Audio 3.5mm output
* Speaker with enable jumper
* USB-C for power supply
* UEXT connector with I2C, UART and SPI
* 40 pin 6502 bus connector with all W65C02 signals
* Dimensions 80x55mm
* 4 mount holes

The Neo6502 is available as a bare single board computer:

![Neo6502 Single Board Computer](https://github.com/andymccall/neo6502-development/blob/main/assets/neo6502.jpg?raw=true)

Boxed in a nice case:

![Neo6502 Boxed](https://github.com/andymccall/neo6502-development/blob/main/assets/neo6502-boxed.jpg?raw=true)

Or as a standalone PC variant with a built in screen:

![Neo6502pc](https://github.com/andymccall/neo6502-development/blob/main/assets/neo6502pc.jpg?raw=true)

All these variants can be purchased from [Olimex.com](https://www.olimex.com/).

## This Document

This README.md and repository will assist you in setting up a development environment for the Neo6502 using the following tools:

- VSCode as an Integrated Development Environment
- cc65 for programming in assembly language
- LLVM-MOS for programming in C
- Neo6502 emulator for testing

The repository has examples using both 6502 assembly and C. Each example has a README.md file that explains how to compile and run the example.

### Install VSCode

Install VSCode and the following extensions:

- cc65 for 6502/65816 machines : https://marketplace.visualstudio.com/items?itemName=SharpNinja.cc65
- Makefile Tools : https://marketplace.visualstudio.com/items?itemName=ms-vscode.makefile-tools


### Install cc65

```
username@host:~$ cd ~
username@host:~$ mkdir development
username@host:~$ cd development
username@host:~$ git clone git@github.com:cc65/cc65.git
username@host:~$ make install PREFIX=~/development/tools/cc65
```

Add cc65 bin to the path and add CC65_HOME environment variable:

```
username@host:~$ vi ~/.profile
```

Add the following at the bottom of the file:

```
# set PATH so it includes cc65 if it exists
if [ -d "$HOME/development/tools/cc65/bin" ] ; then
   PATH="$HOME/development/tools/cc65/bin:$PATH"
fi

# Add CC65_HOME
if [ -d "$HOME/development/tools/cc65/share/cc65" ] ; then
   CC65_HOME=$HOME/development/tools/cc65/share/cc65
fi
```

Test:

```
username@host:~$ source ~/.profile
username@host:~$ cc65 --version
cc65 V2.19 - Git 0541b65aa
```

### Install LLVM-MOS

Install the LLVM-MOS SDK.

```
username@host:~$ wget https://github.com/llvm-mos/llvm-mos-sdk/releases/download/v19.1.0/llvm-mos-linux.tar.xz
username@host:~$ unxz llvm-mos-linux.tar.xz
username@host:~$ tar xpvf llvm-mos-linux.tar
username@host:~$ rm llvm-mos-llvm.tar
```
Add llvm-mos bin to the path:

```
username@host:~$ vi ~/.profile
```

Add the following at the bottom of the file:

```
# set PATH so it includes llvm-mos if it exists
if [ -d "$HOME/development/tools/llvm-mos/bin" ] ; then
   PATH="$HOME/development/tools/llvm-mos/bin:$PATH"
fi
```

Test:

```
username@host:~/development/neo6502-development/01-helloworld/c$ mos-neo6502-clang --version
clang version 19.0.0git (https://github.com/llvm-mos/llvm-mos 0ec5fec611e127124170707224715983cd45d889)
Target: mos-neo6502
Thread model: posix
InstalledDir: /home/username/development/tools/llvm-mos/bin
Configuration file: /home/username/development/tools/llvm-mos/bin/mos-neo6502.cfg
```

### Install NEO6502 Emulator

```
username@host:~$ mkdir neo6502
username@host:~$ cd neo6502
username@host:~$ wget https://github.com/paulscottrobson/neo6502-firmware/releases/download/v0.99.0/neo6502.zip
username@host:~$ unzip neo6502.zip
username@host:~$ rm neo6502.zip
```

Add the NEO6502 emulator to the path:

```
username@host:~$ vi ~/.profile
```

Add the following at the bottom of the file:

```
# set PATH so it includes neo6502 if it exists
if [ -d "$HOME/development/tools/neo6502" ] ; then
   PATH="$HOME/development/tools/neo6502:$PATH"
fi
```

Test:

```
username@host:~$ source ~/.profile
username@host:~$ neo
```

### Where to get help

You can ask for help in the Neo6502 Community Discord channel, which can be found [here](https://discord.gg/cvhcCpPbbs).

More information on programming the Neo6502 can be found in the community documentation [here](https://neo6502.com/).

### Found this guide useful?

[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/andymccall)

I don't write code, documents or software for profit, I do it for enjoyment and to help others. If you get anything useful from this guide, and only if you can afford it, please let me know by buying me a coffee using my Ko-fi tip page [here](https://ko-fi.com/andymccall).