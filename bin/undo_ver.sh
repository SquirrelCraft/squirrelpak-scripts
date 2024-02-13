#!/bin/bash
#
#     Internal script
#     Shows the undo version info if set
#     undo_ver.sh
#     v1.0
# 

#     undo_ver.sh - Shows the undo version info if set
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
echo "  SquirrelPAK UNDO Version Info Script v1.0"
echo "  (undo_ver.sh) - Licnesed under GNU GPLv3"
echo " ----------------------------------------------------------------------------"
echo " | Copyright (C) 2024 The Network Squirrel(SquirrelCraft)                   |"
echo " | https://github.com/SquirrelCraft/squirrelpak-scripts                     |"
echo " | This program comes with ABSOLUTELY NO WARRANTY; This is free software,   |"
echo " | and you are welcome to redistribute it under certain conditions          |"
echo " ----------------------------------------------------------------------------"
echo " "

Script_Dir=$PWD 
PAK_Removed_Files_Base_Dir=./zz-do-not-export
PAK_Export_Timestamp_File=$PAK_Removed_Files_Base_Dir/exported.timestamp

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

if [ "$PAK_Debug " == "true " ]; then echo "Reading undo file"; fi

if [ -f "$PAK_etc_dir/version.txt.undo" ]; then
	if [ "$PAK_Debug " == "true " ]; then echo "Sourcing file $PAK_etc_dir/version.txt.undo"; fi
	source $PAK_etc_dir/version.txt.undo 
	  
	# set undo version vars 
	if [ "$PAK_Debug " == "true " ]; then echo "Setting undo vars"; fi
	PAK_UNDO_NAME=$PAK_NAME
	PAK_UNDO_RELEASE=$PAK_RELEASE
	PAK_UNDO_VER=$PAK_VER
	PAK_UNDO_DESC=$PAK_DESC
	PAK_UNDO_FORGE_VER=$PAK_FORGE_VER
	PAK_UNDO_Menu_Beta_Text=$PAK_Menu_Beta_Text
	PAK_UNDO_Menu_Config_Dir=$PAK_Menu_Config_Dir

	# Read config files
	if [ "$PAK_Debug " == "true " ]; then echo "Reading config files"; fi

	source $PAK_etc_dir/version.txt
	source $PAK_etc_dir/current_version.txt
	source $PAK_etc_dir/previous_version.txt

	PAK_Full_Ver_Name="SquirrelPAK $PAK_NAME - $PAK_DESC v$PAK_VER"
	PAK_Exported_ModListName=$PAK_NAME-v$PAK_VER-ModsList.txt
	PAK_Short_Ver_Name="SquirrelPAK $PAK_NAME - v$PAK_VER"

	# Debug output
	if [ "$PAK_Debug " == "true " ]; then
		echo "Config files loaded, loaded config below:"
		echo " "
		echo "PAK_NAME=$PAK_NAME"
		echo "PAK_RELEASE=$PAK_RELEASE"
		echo "PAK_VER=$PAK_VER"
		echo "PAK_DESC=$PAK_DESC"
		echo "PAK_FORGE_VER=$PAK_FORGE_VER"
		echo "PAK_Menu_Beta_Text=$PAK_Menu_Beta_Text"
		echo "PAK_Menu_Config_Dir=$PAK_Menu_Config_Dir"
		echo "PAK_Export_Timestamp_File=$PAK_Export_Timestamp_File"
		echo "----------"
		echo "PAK_UNDO_NAME=$PAK_UNDO_NAME"
		echo "PAK_UNDO_RELEASE=$PAK_UNDO_RELEASE"
		echo "PAK_UNDO_VER=$PAK_UNDO_VER"
		echo "PAK_UNDO_DESC=$PAK_UNDO_DESC"
		echo "PAK_UNDO_FORGE_VER=$PAK_UNDO_FORGE_VER"
		echo "PAK_UNDO_Menu_Beta_Text=$PAK_UNDO_Menu_Beta_Text"
		echo "PAK_UNDO_Menu_Config_Dir=$PAK_UNDO_Menu_Config_Dir"   
		echo "----------"
		echo "PAK_Current_Version=$PAK_Current_Version "
		echo "PAK_Previous_Version=$PAK_Previous_Version "
		echo "PAK_CUR_VER=$PAK_CUR_VER"
		echo "PAK_PREV_VER=$PAK_PREV_VER"
		echo "PAK_Full_Ver_Name=$PAK_Full_Ver_Name "
		echo "PAK_Short_Ver_Name=$PAK_Short_Ver_Name "
		echo "PAK_Exported_ModListName=$PAK_Exported_ModListName "
	
	fi

	echo "  PAK Name: SquirrelPAK $PAK_NAME, $PAK_DESC"
	echo " "
	echo "  Current Release Version:"
	echo "  v$PAK_Current_Version" | sed "s/$PAK_NAME-v//" | sed 's/-ModsList.txt//'
	echo " "
	echo "  Current Working Version:"
	echo "  v$PAK_VER"
	echo " ----------------------------------------------------------------------------"
	echo " Standard Ver Info:"
	echo "   Name: $PAK_NAME"
	echo "   Release: $PAK_RELEASE"
	echo "   Version: $PAK_VER"
	echo "   Desc: $PAK_DESC"	
	echo "   Forge Ver: $PAK_FORGE_VER"
	echo "   Beta Text: $PAK_Menu_Beta_Text"
	echo "   Menu Dir: $PAK_Menu_Config_Dir"	
	echo " ----------------------------------------------------------------------------"	
	echo " Undo Version Info"
	echo "   Name: $PAK_UNDO_NAME"
	echo "   Release: $PAK_UNDO_RELEASE"
	echo "   Version: $PAK_UNDO_VER"
	echo "   Desc: $PAK_UNDO_DESC"	
	echo "   Forge Ver: $PAK_UNDO_FORGE_VER"
	echo "   Beta Text: $PAK_UNDO_Menu_Beta_Text"
	echo "   Menu Dir: $PAK_UNDO_Menu_Config_Dir"
	echo " ----------------------------------------------------------------------------"
	if [ -f $PAK_Export_Timestamp_File ]; then
		echo "  Export Timestamp Found - Contents below:"
		cat $PAK_Export_Timestamp_File
		echo " ----------------------------------------------------------------------------"
	else
		echo " !!! - Error! Export Timestamp Missing!"
	fi
	echo " ----------------------------------------------------------------------------"
	echo " "	
	exit 0

else
	if [ "$PAK_Debug " == "true " ]; then echo "No undo file found"; fi
	echo " "
	echo " Error: No version.txt.undo file found!"
	echo " "
	exit 1
fi