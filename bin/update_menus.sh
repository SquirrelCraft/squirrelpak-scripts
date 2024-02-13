#!/bin/bash
#
#     Internal script to update pack menu fancy menus pack version 
#
#     v1.1.1
# 

#     update_menu.sh
#     Copyright (C) 2024 The Network Squirrel(SquirrelCraft)
#     https://github.com/SquirrelCraft/squirrelpak-scripts     
#
#     This program is free software: you can redistribute it and/or modify
#     it under the terms of the GNU General Public License as published by
#     the Free Software Foundation, either version 3 of the License, or
#     (at your option) any later version.
# 
#     This program is distributed in the hope that it will be useful,
#     but WITHOUT ANY WARRANTY; without even the implied warranty of
#     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#     GNU General Public License for more details.
# 
#     You should have received a copy of the GNU General Public License
#     along with this program.  If not, see <https://www.gnu.org/licenses/>.

echo " "
echo " ----------------------------------------------------------------------------"
echo "  SquirrelPAK Menu Update Script v1.1.1"
echo "  (update_menu.sh) - Licnesed under GNU GPLv3"
echo " ----------------------------------------------------------------------------"
echo " | Copyright (C) 2024 The Network Squirrel(SquirrelCraft)                   |"
echo " | https://github.com/SquirrelCraft/squirrelpak-scripts                     |"
echo " | This program comes with ABSOLUTELY NO WARRANTY; This is free software,   |"
echo " | and you are welcome to redistribute it under certain conditions          |"
echo " ----------------------------------------------------------------------------"

Script_Dir=$PWD 

# We should be in the root dir where the changelog is
# located, if not exit
echo " Script: Checking running directory..."
if [ ! -f ./changelog.txt ]; then
    echo " "
    echo " PWD=$PWD"
    echo " Script must run in the root folder!"
    echo " Script exiting!"
    echo " "
    exit 1
fi

echo " PWD=$PWD"
echo " Script: Checking running directory (Ok)"
echo " "

# Set local vars
PAK_bin_dir=./squirrelpak/bin
PAK_etc_dir=./squirrelpak/etc
PAK_versons_dir=./squirrelpak/versions


echo " Local Vars Set!"
echo " PAK_bin_dir=$PAK_bin_dir"
echo " PAK_etc_dir=$PAK_etc_dir"
echo " PAK_versons_dir=$PAK_versons_dir"
echo " "

# Read config files
echo " Reading config files"
source $PAK_etc_dir/version.txt

PAK_Short_Ver_Name="SquirrelPAK $PAK_NAME - v$PAK_VER"

echo " Config files loaded, loaded config below:"
echo " "
echo " PAK_NAME=$PAK_NAME "
echo " PAK_VER=$PAK_VER "
echo " PAK_DESC=$PAK_DESC "
echo " PAK_Menu_Beta_Text=$PAK_Menu_Beta_Text "
echo " PAK_Menu_Config_Dir=$PAK_Menu_Config_Dir "
echo " PAK_Short_Ver_Name=$PAK_Short_Ver_Name"
echo " "

echo " Setting Fancy Menu Version Files"
echo " "
echo " Setting $PAK_Menu_Config_Dir/version.txt to:"
echo " $PAK_Short_Ver_Name"
echo " $PAK_Short_Ver_Name" > $PAK_Menu_Config_Dir/version.txt
echo " done!"
echo " "

echo " Setting $PAK_Menu_Config_Dir/beta-text.txt to:"
echo " $PAK_Menu_Beta_Text"
echo " $PAK_Menu_Beta_Text" > $PAK_Menu_Config_Dir/beta-text.txt
echo " done!"
echo " "

echo " Setting Fancy Menu Version Files - Complete"
echo " "
echo " ----------------------------------------------------------------------------"