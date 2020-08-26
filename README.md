You can find manuals about P2000C P2000T and P2000M computers over here :

http://www.vintagecomputer.net/fjkraan/comp/p2000c/doc/

(not all manuals are there though !)

# Philips-P2000-Emulation

Blow new live in the old Philips P2000 Emulator of Marcel de Kogel

make_M2000.sh is made for compiling the old  

P2000 emulator \(1997\) from Marcel de Kogel

on the raspberry pi or x86 with raspbian.

It has been tested on raspbian stretch.

It should work on debian or ubuntu too, but is untested.

For now, only the UNIX/X version works.


# Program : make_M2000.sh

Version : 1

Use : 

This script is made to bring new live to the old Philips P2000 emulator from Marcel de Kogel.

It Downloads the source, patches the sourcefile X.c and compiles the Philips P2000 emulator.

For now, only the UNIX/X version works.

How to run :

Make the program executable, dubbleclick and choose open in terminal.

Or run it from the terminal with : ./make_M2000.sh

# Program : P2000Xstation.py

Version : 1

Use : 

P2000Xstation is a simple program created to run the emulator with the selected Philips P2000 .cas files from your windows desktop enviroment (X).

Dependencies : 

This program only works if the P2000 emulator is compiled on your computer with make_M2000.sh.

Also make sure you have installed the desired python-modules.

How to run :

Make sure it is in the directory where the P2000 directory and make_M2000.sh is.

Make the program executable, dubbleclick and choose open in terminal.

You can run it also directly from the terminal with : python P2000Xstation.py

Or run it from the terminal with : ./P2000Xstation.py


# My post info on retropie

18 jul. 2019 11:02

Although this post is quite old it seems still relevant and it shoud be nice if it could be added to RetroPie.

I did some investigation about the Philips P2000.

The fastest way of emulating the P2000 is to use DOSbox and the P2000 emulator for DOS.

This is my directory structure :

/home/pi/RetroPie/roms/EmuOnDos/Philips_P2000T/M2000.exe (emulator)

/home/pi/RetroPie/roms/EmuOnDos/Philips_P2000T/games (.cas files)

/home/pi/RetroPie/roms/pc/EmuOnDos/P2000T (all executable .sh starters for .cas files)

An .sh starter contains the following, were as "leeg.cas" can be any .cas file :

/home/pi/RetroPie/roms/pc/EmuOnDos/P2000T/leeg.cas.sh :

#!/bin/bash

/opt/retropie/emulators/dosbox/bin/dosbox -fullscreen -scaler normal3x -c "@echo off" -c "mount c: ~/RetroPie/roms/EmuOnDos/Philips_P2000T" -c "cls" -c "c:" -c "m2000 -verbose 0 -boot 1 -tape games/leeg.cas" -c "exit"

I also tested the source code on raspbian stretch.

The source code is 22 years old but it still works.

I've got the UNIX/X version working again by adding bpp!=24 in X.c.

Compiled with :

make -f Makefile.X


Installed alsa-oss for OSS emulation though alsa :

sudo apt-get install alsa-oss


A proper command, that works from every directory, can be (aoss is for sound):

aoss /your/emulator/dir/m2000 -video 1 -boot 1 -tape /your/emulator/leeg.cas -font /your/emulator/dir/Default.fnt

(Beware, the emulator stops if the window is not active, so click on the emulator window.)


By the way : "I'm not that good in C programming, still learning".

But it seems that for running this code in RetroPie there are a lot of to do's.


To Do's :

make one universal version that can be run in X and also in RetroPie;

if in a window, add more windows scalablility;

add SDL video and audio;

if SDL audio is a problem then add Alsa audio;

remove SVGAlib version.

Who has a good idea of making the source code work in RetroPie ???

