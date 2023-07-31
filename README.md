Use this script to get most P2000 related documentation files :

https://github.com/FollyMaddy/scraper-tools/blob/master/Philips_P2000_documents.sh

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

It downloads the source, patches the sourcefile X.c and compiles the Philips P2000 emulator.

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

# Two posts about how to use the emulator with DosBox (first post) and lr-dosbox (second post)

# My first post info on retropie

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


# My second post info on retropie

12 aug. 2020

This is an update on running Philips P2000 emulator of Marcel de Kogel "M2000.exe" on lr-dosbox.

Philips-P2000 on RPI4 32 bit OS (Buster) with lr-dosbox :

Change a few core-options in /opt/retropie/configs/all/retroarch-core-options.cfg :

dosbox_cpu_cycles = "9"

dosbox_pcspeaker = "true"

Make a bat file for example Lazy-Bug.bat :


@echo off

cls

c:

m2000 -verbose 0 -boot 1 -tape games/Lazy-Bug.cas

exit


Place it in :

/home/pi/Desktop/roms/pc/P2000/Lazy-Bug.bat

Games should be in :

/home/pi/Desktop/roms/pc/P2000/games/Lazy-Bug.cas


Emulator should be in :

/home/pi/Desktop/roms/pc/P2000/M2000.EXE

With these other files :

BASIC.BIN CWSDPR0.EXE M2000.TXT

CWSDPMI.DOC CWSPARAM.DOC P2000ROM.BIN

CWSDPMI.EXE CWSPARAM.EXE

CWSDPMI.ZIP DEFAULT.FNT


Automatically make all .bat files from .cas files in /home/pi/Desktop/roms/pc/P2000/games/*.cas :

open terminal and paste these commands :


cd /home/pi/Desktop/roms/pc/P2000/

for file in $(ls games | cut -d '.' -f 1); do touch $file.bat; echo -ne @echo off '\n'cls'\n'c:'\n'm2000 -verbose 0 -boot 1 -tape games/$file.cas'\n'exit > $file.bat; done

Works pretty good :)

# p2000-xdo.sh

An attempt to use xdotool in linux to simulate keypresses for the emulator m2000.

This way you can automate typing a basic file that exists as a text file on the host computer.

In some basic you find ~ (tilde) or { ("opening bracket").

These are probably mistakes as the p2000 doesn't have these keys or these they represent other ASCII values that are p2000 specific.

Sadly the keys / (slash) and ? (question) don't work correctly.

The program echo's the output for debugging. (bash p2000-xdo.sh)

To execute the output just do something like this :

bash p2000-xdo.sh mybasicfile.bas|while read cmd;do $cmd;done
