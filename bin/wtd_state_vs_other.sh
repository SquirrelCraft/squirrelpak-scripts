#!/bin/bash
#
#     Internal script
#     Shows the diff between current directory and other version
#     wtd_state_vs_other.sh [OtherModList]
#     v1.0
# 

#     wtd_state_vs_other.sh - Shows the diff between current directory and other version
#     Copyright (C) 2023 The Network Squirrel(SquirrelCraft)
#     https://github.com/SquirrelCraft     
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
echo "  SquirrelPAK Release Diff Tool (State vs Other) v1.0"
echo "  (wtd_state_vs_other.sh) - Licnesed under GNU GPLv3"
echo " ----------------------------------------------------------------------------"
echo " | Copyright (C) 2023 The Network Squirrel(SquirrelCraft)                   |"
echo " | https://github.com/SquirrelCraft                                         |"
echo " | This program comes with ABSOLUTELY NO WARRANTY; This is free software,   |"
echo " | and you are welcome to redistribute it under certain conditions          |"
echo " ----------------------------------------------------------------------------"
echo " "

Script_Dir=$PWD 

# We should be in the root dir where the changelog is
# located, if not exit

if [ "$PAK_Debug " == "true " ]; then echo "Script: Checking running directory..."; fi

if [ ! -f ./changelog.txt ]; then
    echo " "
    echo "PWD=$PWD"
    echo "Script must run in the root folder!"
    echo "Script exiting!"
    echo " "
    exit 1
fi


# Debug output
if [ "$PAK_Debug " == "true " ]; then
    echo "PWD=$PWD"
    echo "Script: Checking running directory (Ok)"
    echo " "
fi


# Set local vars
PAK_bin_dir=./squirrelpak/bin
PAK_etc_dir=./squirrelpak/etc
PAK_versons_dir=./squirrelpak/versions


# Debug output

if [ "$PAK_Debug " == "true " ]; then
    echo "Local Vars Set!"
    echo "PAK_bin_dir=$PAK_bin_dir"
    echo "PAK_etc_dir=$PAK_etc_dir"
    echo "PAK_versons_dir=$PAK_versons_dir"
    echo " "
fi



# Read config files
if [ "$PAK_Debug " == "true " ]; then echo "Reading config files"; fi

source $PAK_etc_dir/version.txt
source $PAK_etc_dir/current_version.txt
source $PAK_etc_dir/previous_version.txt

PAK_Full_Ver_Name="SquirrelPAK $PAK_NAME - $PAK_DESC v$PAK_VER"
PAK_Exported_ModListName=$PAK_NAME-v$PAK_VER-ModsList.txt
PAK_Short_Ver_Name="SquirrelPAK $PAK_NAME - v$PAK_VER"
PAK_Current_State_ModListName=$PAK_NAME-CurrentState-ModsList.txt


# Debug output
if [ "$PAK_Debug " == "true " ]; then
    echo "Config files loaded, loaded config below:"
    echo " "
    echo "PAK_NAME=$PAK_NAME "
    echo "PAK_RELEASE=$PAK_RELEASE "
    echo "PAK_VER=$PAK_VER "
    echo "PAK_DESC=$PAK_DESC "
    echo "PAK_Menu_Beta_Text=$PAK_Menu_Beta_Text "
    echo "PAK_Menu_Config_Dir=$PAK_Menu_Config_Dir "
    echo "PAK_Current_Version=$PAK_Current_Version "
    echo "PAK_Previous_Version=$PAK_Previous_Version "
    echo "PAK_Full_Ver_Name=$PAK_Full_Ver_Name "
    echo "PAK_Short_Ver_Name=$PAK_Short_Ver_Name "
    echo "PAK_Exported_ModListName=$PAK_Exported_ModListName "
fi

# Make sure you specified an actual other file
if [ ! -f "$1" ]; then
    echo " "
    echo "You must speciify a vaild mob pack list file"
    echo "Example: wtd_state_vs_other.sh some-mod-vx.xxx-ModsList.txt"
    echo " "
    exit 1
fi


echo " "
echo "= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = ="
echo " Whats The Diff between directory state vs other"
echo "= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = ="    
echo "    [Key Codes]"
echo "|  = Mod Updated"
echo "<  = Mod Added"
echo ">  = Mod Removed"
echo "= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = ="
echo " "

# Create current state file
if [ "$PAK_Debug " == "true " ]; then echo "Create Mod List File"; fi
echo "Current Directory State" > $PAK_versons_dir/$PAK_Current_State_ModListName
ls -y ./mods >> $PAK_versons_dir/$PAK_Current_State_ModListName
if [ "$PAK_Debug " == "true " ]; then echo "Temp File $PAK_Current_State_ModListName created"; fi


$PAK_bin_dir/wtd.sh $PAK_versons_dir/$PAK_Current_State_ModListName $1 true

echo " "
echo "= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = ="
echo " "


# Remove temp file
if [ "$PAK_Debug " == "true " ]; then echo "Remove Temp File $PAK_Current_State_ModListName "; fi
if [ "$PAK_Debug " == "true " ]; then
	rm -v $PAK_versons_dir/$PAK_Current_State_ModListName
else
	rm $PAK_versons_dir/$PAK_Current_State_ModListName
fi
