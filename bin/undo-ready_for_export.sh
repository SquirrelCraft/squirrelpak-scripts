# This script is under DEV - DO NOT USE NOT READY

#!/bin/bash
#
#     Internal script to undo the ready for Export to CF
#     Reverts the files: changelog.txt, previous_version.txt
#     current_version.txt, version.txt files to the former versions
#     using files from the undo-files folder
#
#     v1.0
# 

#     /squrrelpak/bin/undo-ready_for_export.sh
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
echo "  SquirrelPAK CF Export Undo Script v1.0"
echo "  (undo-ready_for_export.sh) - Licnesed under GNU GPLv3"
echo " ----------------------------------------------------------------------------"
echo " | Copyright (C) 2024 The Network Squirrel(SquirrelCraft)                   |"
echo " | https://github.com/SquirrelCraft/squirrelpak-scripts                     |"
echo " | This program comes with ABSOLUTELY NO WARRANTY; This is free software,   |"
echo " | and you are welcome to redistribute it under certain conditions          |"
echo " ----------------------------------------------------------------------------"
echo " "

Script_Dir=$PWD 
PAK_ChangeLog=./changelog.txt
PAK_Removed_Files_Base_Dir=./zz-do-not-export
PAK_Export_Timestamp_File=$PAK_Removed_Files_Base_Dir/exported.timestamp

# We should be in the root dir where the changelog is
# located, if not exit
echo " "
echo " Script: Checking running directory..."
if [ ! -f $PAK_ChangeLog ]; then
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
echo " ----------------------------------------------------------------------------"

echo " Script: Checking to see if project is marked to UNDO changes"
if [ ! -f ./undo.export ]; then
    echo " "
    echo "  Project is not marked Undo Export!"
    echo "  File undo.export not found"
    echo "  Script exiting!"
    echo " "
    exit 1
fi
echo " Script: Project marked to UNDO changes"
echo " "
echo " ----------------------------------------------------------------------------"



# Set local vars
echo " Setting local var"
PAK_bin_dir=./squirrelpak/bin
PAK_etc_dir=./squirrelpak/etc
PAK_versons_dir=./squirrelpak/versions
PAK_export_history_base_dir=$PAK_Removed_Files_Base_Dir/0-export-history
PAK_last_export_history=$PAK_export_history_base_dir/last-export
PAK_Timestamp=`date +"%C%y%m%d%H%M"`

if [ -f "$PAK_etc_dir/version.txt.undo" ]; then
	echo " Found version.txt.undo, loading"
	source $PAK_etc_dir/version.txt.undo
	PAK_UNDO_NAME=$PAK_NAME
	PAK_UNDO_RELEASE=$PAK_RELEASE
	PAK_UNDO_VER=$PAK_VER
	PAK_UNDO_DESC=$PAK_DESC
	PAK_UNDO_FORGE_VER=$PAK_FORGE_VER
	PAK_UNDO_Menu_Beta_Text=$PAK_Menu_Beta_Text
	PAK_UNDO_Menu_Config_Dir=$PAK_Menu_Config_Dir
	PAK_UNDO_Full_Ver_Name="SquirrelPAK $PAK_NAME - $PAK_DESC v$PAK_VER"	
	
else
    echo " Error: Could not find undo version file!"
    echo " $PAK_etc_dir/version.txt.undo"
    echo " "
    echo " Script exiting!"
    exit 1
fi

# Check for export stamp
if [ ! -f $PAK_Export_Timestamp_File ]; then
	echo "Error! file not found:"
	echo "$PAK_Export_Timestamp_File"
	echo " "
	echo "Exiting script, nothing was done"
	echo " "
	exit 1
fi 
echo " Found timestamp file, loading"
source $PAK_Export_Timestamp_File
echo " Done!"

# Read config files
echo " "
echo " Reading config files"
source $PAK_etc_dir/version.txt
source $PAK_etc_dir/current_version.txt
source $PAK_etc_dir/previous_version.txt

PAK_Full_Ver_Name="SquirrelPAK $PAK_NAME - $PAK_DESC v$PAK_VER"
PAK_Exported_ModListName=$PAK_NAME-v$PAK_VER-ModsList.txt
PAK_Short_Ver_Name="SquirrelPAK $PAK_NAME - v$PAK_VER"

PAK_Removed_Files_Export_Dir=$PAK_Removed_Files_Base_Dir/$PAK_RELEASE-$PAK_Timestamp

PAK_export_history_prev_dir=$PAK_export_history_base_dir/last-export
PAK_export_history_ver_dir=$PAK_export_history_base_dir/$PAK_RELEASE-$PAK_Timestamp

echo " Config files loaded, loaded config below:"
echo " "
echo "----------"
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
echo "PAK_UNDO_Full_Ver_Name=$PAK_UNDO_Full_Ver_Name"
echo "PAK_UNDO_VER_STAMP=$PAK_UNDO_VER_STAMP"  
echo "----------"
echo "PAK_Current_Version=$PAK_Current_Version "
echo "PAK_Previous_Version=$PAK_Previous_Version "
echo "PAK_CUR_VER=$PAK_CUR_VER"
echo "PAK_PREV_VER=$PAK_PREV_VER"
echo "PAK_Full_Ver_Name=$PAK_Full_Ver_Name "
echo "PAK_Short_Ver_Name=$PAK_Short_Ver_Name "
echo "PAK_Exported_ModListName=$PAK_Exported_ModListName "
echo " ----------------------------------------------------------------------------"
echo " "

echo " Checking for all needed files to run the undo process"
echo " "

echo " "



# Check for change log
echo " Checking for backup changelog file"
if [ ! -f $PAK_last_export_history/changelog.txt ]; then
	echo "Error! file not found:"
	echo "$PAK_last_export_history/changelog.txt"
	echo " "
	echo "Exiting script, nothing was done"
	echo " "
	exit 1
fi 
echo " Checking for backup changelog file (Found)"
echo " "

# Check for change notes
echo " Checking for backup change notes file"
if [ ! -f $PAK_last_export_history/changelog-notes.txt ]; then
	echo "Error! file not found:"
	echo "$PAK_last_export_history/changelog-notes.txt"
	echo " "
	echo "Exiting script, nothing was done"
	echo " "
	exit 1
fi 
echo " Checking for backup change notes file (Found)"
echo " "

# Check for current ver
echo " Checking for backup of current version file"
if [ ! -f $PAK_last_export_history/current_version.txt ]; then
	echo "Error! file not found:"
	echo "$PAK_last_export_history/current_version.txt"
	echo " "
	echo "Exiting script, nothing was done"
	echo " "
	exit 1
fi 
echo " Checking for backup of current version file (Found)"
echo " "


# Check for prev version
echo " Checking for backup of previous version file"
if [ ! -f $PAK_last_export_history/previous_version.txt ]; then
	echo "Error! file not found:"
	echo "$PAK_last_export_history/previous_version.txt"
	echo " "
	echo "Exiting script, nothing was done"
	echo " "
	exit 1
fi 
echo " Checking for backup of previous version file (Found)"
echo " "


# Check for Release file
echo " Checking for release file"
if [ ! -f $PAK_versons_dir/$PAK_Exported_ModListName ]; then
	echo "Error! file not found:"
	echo "$PAK_versons_dir/$PAK_Exported_ModListName"
	echo " "
	echo "Exiting script, nothing was done"
	echo " "
	exit 1
fi 
echo " Checking for release file (Found)"
echo " "
echo " "
echo " All files found, ready to undo export!"
echo " ----------------------------------------------------------------------------"
echo " "

echo " "
echo " Getting Ready to UNDO Last Export"
echo " Revert -> $PAK_Full_Ver_Name"
echo "     To -> $PAK_UNDO_Full_Ver_Name"
echo " ----------------------------------------------------------------------------"
echo " "

# Remove Version file in versions folder
echo " Remove Version file in versions folder"
rm -v $PAK_versons_dir/$PAK_Exported_ModListName
echo "   - Done!"
echo " "

# Remove export stamp
echo " Remove export stamp"
rm -v $PAK_Export_Timestamp_File
echo "   - Done!"
echo " "

# Revert changelog.txt
echo " Revert changelog.txt"
rm -v ./changelog.txt
mv -v $PAK_last_export_history/changelog.txt ./changelog.txt
echo "   - Done!"
echo " "

# Revert changelog-notes.txt
echo " Revert changelog-notes.txt"
rm -v $PAK_etc_dir/changelog-notes.txt
mv -v $PAK_last_export_history/changelog-notes.txt $PAK_etc_dir/changelog-notes.txt
echo "   - Done!"
echo " "

# Revert previous_version.txt
echo " Revert previous_version.txt"
rm -v $PAK_etc_dir/previous_version.txt
mv -v $PAK_last_export_history/previous_version.txt $PAK_etc_dir/previous_version.txt
echo "   - Done!"
echo " "

# Revert current_version.txt
echo " Revert current_version.txt"
rm -v $PAK_etc_dir/current_version.txt
mv -v $PAK_last_export_history/current_version.txt $PAK_etc_dir/current_version.txt
echo "   - Done!"
echo " "

# Revert version.txt 
echo " Revert version.txt"
rm -v $PAK_etc_dir/version.txt
rm -v $PAK_etc_dir/version.txt.undo.backup
mv -v $PAK_etc_dir/version.txt.undo $PAK_etc_dir/version.txt
echo "   - Done!"
echo " "  


# Clean up last-export
echo " Clean up last-export"
rm -vR $PAK_last_export_history
mkdir $PAK_last_export_history
echo "   - Done!"
echo " " 

# Clean up export folder folder
echo " Remove $PAK_UNDO_VER_STAMP folder"
rm -vR $PAK_export_history_base_dir/$PAK_UNDO_VER_STAMP
echo "   - Done!"
echo " " 

echo " Remove undo export file check file"
rm -v ./undo.export
echo "   - Done!"
echo " "
echo " ----------------------------------------------------------------------------"

echo " "
echo " ----------------------------------------------------------------------------"
echo " Script Complete!"
echo " ----------------------------------------------------------------------------"
echo " "
