#!/bin/bash
# Program : make_M2000.sh
# Version : 1
# Use : 
# This script is made to bring new live to the old Philips P2000 emulator from Marcel de Kogel.
# It Downloads the source, patches the sourcefile X.c and compiles the Philips P2000 emulator.
# For now, only the UNIX/X version works.
# How to run :
# Make the program executable, dubbleclick and choose open in terminal.
# Or run it from the terminal with : ./make_M2000.sh
# Author : Folkert van der Meulen
# Date   : 12/07/2019 
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

# get pwd for directory you are in.
privateworkdir=$(pwd)

echo This script is made for compiling the old  
echo P2000 emulator \(1997\) from Marcel de Kogel
echo on the raspberry pi or x86 with raspbian.
echo It has been tested on raspbian stretch.
echo It should work on debian or ubuntu too, but is untested.
echo For now, only the UNIX/X version works.
echo 
echo This script does the following :
echo 1\-\>Download sourcecode of M2000 0.6 to this script directory ,
echo \(www.komkon.org/~dekogel/files/p2000\)
echo 2\-\>Unzip and remove M2000.tar.gz
echo 3\-\>Goto the P2000 directory
echo 4\-\>Add 24 Bits Per Pixel to the file X.c
echo 5\-\>Make a games directory
echo 6\-\>Install alsa-oss as sudo
echo \(For emulating OSS-sound through alsa\)
echo 7\-\>Compile the UNIX\/X version
echo \(I assume you have gcc and make installed\)
echo 8\-\>Remove the sourcecode
echo Press enter to accept or press q to quit.
read -p '> ' var
if [[ "$var" =~ ^([qQ]|[qQ])+$ ]]
then 
    exit
else
    wget http://www.komkon.org/~dekogel/files/p2000/M2000.tar.gz -P $privateworkdir
    tar -xf M2000.tar.gz
    rm M2000.tar.gz
    cd $privateworkdir/P2000
    sed -i 's/bpp!=16 \&\& bpp!=32/bpp!=16 \&\& bpp!=24 \&\& bpp!=32/g' X.c
    sed -i 's/16 and/16,24 and/g' X.c
    mkdir -p $privateworkdir/P2000/games
    sudo apt-get install alsa-oss
    make -f Makefile.X
    rm *.c *.h *.o *.S Make*.* Make*
    echo done
    echo
fi

echo Start emulator with alsa-oss emulation from the terminal with :
echo aoss ./m2000
echo This is a full example :
echo aoss \~\/yourdirectory\/m2000 \-video 1 \-boot 1 \-tape \~\/yourdirectory\/P2000\/games\/Lazy\-Bug.cas \-font \~\/yourdirectory\/P2000\/Default.fnt
echo See M2000.txt for more information .
echo or :
echo Start emulator with my script P2000Xstation.py by selecting a .cas file
echo See for more information readme.md
echo Press enter to quit .
read -p '> ' var