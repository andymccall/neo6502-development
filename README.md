# NEO6502 Development Environment Setup

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

### Install NEO6502 Emulator

```
username@host:~$ mkdir neo6502
username@host:~$ cd neo6502
username@host:~$ wget https://github.com/paulscottrobson/neo6502-firmware/releases/download/v0.99.0/neo6502.zip
username@host:~$ unzip neo6502.zip
username@host:~$ rm neo6502.zip
```

Add the NE6502 to the path:

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