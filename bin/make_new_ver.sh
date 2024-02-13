#!/bin/bash
#
#     Internal script
#     Creates new version
#     make_new_ver.sh
#     v1.0
# 

#     make_new_ver.sh - Creates a new version
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
echo "  SquirrelPAK Make New Version Script v1.0"
echo "  (ver.sh) - Licnesed under GNU GPLv3"
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

if [ "$PAK_Debug " == "true " ]; then echo "Script: Checking running directory..."; fi

if [ ! -f $PAK_ChangeLog ]; then
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
    echo "PAK_Export_Timestamp_File=$PAK_Export_Timestamp_File"
	echo "PAK_Removed_Files_Base_Dir=$PAK_Removed_Files_Base_Dir"
    echo " "
fi


# Check for undo file
if [ ! -f "$PAK_etc_dir/version.txt.undo" ]; then
	echo "  Error: Undo File not found "
	echo "  Exiting script, nothing done"
	echo " ----------------------------------------------------------------------------"
	exit 1
fi


# Check for undo file
if [ ! -f "$PAK_Export_Timestamp_File" ]; then
	echo "  Error: Export time stamp file not found "
	echo "  $PAK_Export_Timestamp_File"
	echo "  Exiting script, nothing done"
	echo " ----------------------------------------------------------------------------"
	exit 1
fi


echo " - Remove undo backup file"
if [ -f $PAK_etc_dir/version.txt.undo.backup ]; then
	echo "   - Found backup file, removing "
	rm -v $PAK_etc_dir/version.txt.undo.backup 
fi
echo     "done!"
echo " "
echo " - Make backup of current undo file"
mv -v $PAK_etc_dir/version.txt.undo $PAK_etc_dir/version.txt.undo.backup 
echo "   done!"
echo " "
echo " - Create version undo file: $PAK_etc_dir/version.txt.undo"
cp -v $PAK_etc_dir/version.txt $PAK_etc_dir/version.txt.undo
echo "   done!"
echo " "
echo " - Create new version"
echo "# Please change the PAK_RELEASE to new version!" > $PAK_etc_dir/version.txt 
echo "# " >> $PAK_etc_dir/version.txt 
echo "PAK_RELEASE=ChnageMe!" >> $PAK_etc_dir/version.txt
echo "# Remove these new lines!" >> $PAK_etc_dir/version.txt
echo " " >> $PAK_etc_dir/version.txt
cat $PAK_etc_dir/version.txt.undo >> $PAK_etc_dir/version.txt
echo "   done!"
echo " - Update version number via nano/vim"
nano $PAK_etc_dir/version.txt
echo "   done"
echo " "
echo " - Remove time stamp file"
rm -v $PAK_Export_Timestamp_File
echo " done!"
echo " "
echo " Script Complete"
echo " "
echo " ----------------------------------------------------------------------------"
