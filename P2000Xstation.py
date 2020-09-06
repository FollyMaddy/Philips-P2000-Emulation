#!/usr/bin/python
#
# Program : P2000Xstation.py
# Version : 1
# Use : 
# P2000Xstation is a simple program created to run the emulator with the selected Philips P2000 .cas files from your windows desktop enviroment (X).
# Dependencies : 
# This program only works if the P2000 emulator is compiled on your computer with make_M2000.sh.
# Also make sure you have installed the desired python-modules.
# How to run :
# Make sure it is in the directory where the P2000 directory and make_M2000.sh is.
# Make the program executable, dubbleclick and choose open in terminal.
# You can run it also directly from the terminal with : python P2000Xstation.py
# Or run it from the terminal with : ./P2000Xstation.py
#
# Author : Folkert van der Meulen
# Date   : 12/07/2019
#
# Copyright 2019 Folkert van der Meulen
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
#
#--------------------------------------

import Tkinter as tk
import tkFileDialog
import os
import time

# get current work directory
cwd = os.getcwd()
# get filename for use in commandline
root = tk.Tk()
root.withdraw()
ROM = tkFileDialog.askopenfilename(initialdir = '%s/P2000/games' %(cwd) , title='Load P2000 Game') 
# cut system type from directory structure for use in commandline
SYSTEM = ROM.split("/", ROM.count("/"))[5]
# create commandline as string (insert system type and filename to run)
# Default.fnt has to be in the same directory otherwise it will not work
cmd_run_emu = 'aoss %s/P2000/m2000 -video 1 -boot 1 -tape "%s" -font %s/P2000/Default.fnt' %(cwd,ROM,cwd)
print cmd_run_emu
# run command cmd will only work from program directory
os.system(cmd_run_emu)

#read variable exit, after input the program stops 
#print "\n"
#exit = raw_input("enter to exit :")


