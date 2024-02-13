#!/bin/bash
#
#     Internal script to re-ready for Export to CF
#
#     v3.0
# 

#     /squrrelpak/bin/redo-ready_for_export.sh
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
echo "  SquirrelPAK CF Re-Export Script v2.2"
echo "  (redo-ready_for_export.sh) - Licnesed under GNU GPLv3"
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


echo " Script: Checking for exported time stamp file"
if [ ! -f $PAK_Export_Timestamp_File ]; then
    echo " "
    echo "  Project has not been exported!"
    echo "  File $PAK_Export_Timestamp_File is missing!"
    echo " "
    echo "  The script exiting! We did nothing!"
    echo " "
    exit 1
fi
echo " Script: Exported time stamp file found"
echo " "
echo " ----------------------------------------------------------------------------"



echo " Script: Checking to see if project is marked Ready to Export"
if [ ! -f ./re-ready2.export ]; then
    echo " "
    echo "  Project is not marked Ready to Re-Export!"
    echo "  File re-ready2.export not found"
    echo "  Script exiting!"
    echo " "
    exit 1
fi
echo " Script: Project marked Ready to Re-Export"
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

echo " Local vars Set!"
echo " Script_Dir=$Script_Dir"
echo " PAK_ChangeLog=$PAK_ChangeLog"
echo " PAK_bin_dir=$PAK_bin_dir"
echo " PAK_etc_dir=$PAK_etc_dir"
echo " PAK_versons_dir=$PAK_versons_dir"
echo " PAK_export_history_base_dir=$PAK_export_history_base_dir"
echo " PAK_last_export_history=$PAK_last_export_history"
echo " PAK_Timestamp=$PAK_Timestamp"
echo " PAK_Export_Timestamp_File=$PAK_Export_Timestamp_File"
echo " PAK_Removed_Files_Base_Dir=$PAK_Removed_Files_Base_Dir"
echo " "
echo " ----------------------------------------------------------------------------"

# Read config files
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
echo " PAK_NAME=$PAK_NAME "
echo " PAK_RELEASE=$PAK_RELEASE "
echo " PAK_VER=$PAK_VER "
echo " PAK_FORGE_VER=$PAK_FORGE_VER"
echo " PAK_DESC=$PAK_DESC "
echo " PAK_Menu_Beta_Text=$PAK_Menu_Beta_Text "
echo " PAK_Menu_Config_Dir=$PAK_Menu_Config_Dir "
echo " PAK_Current_Version=$PAK_Current_Version "
echo " PAK_Previous_Version=$PAK_Previous_Version "
echo " PAK_Full_Ver_Name=$PAK_Full_Ver_Name "
echo " PAK_Short_Ver_Name=$PAK_Short_Ver_Name "
echo " PAK_Exported_ModListName=$PAK_Exported_ModListName "
echo " PAK_Removed_Files_Export_Dir=$PAK_Removed_Files_Export_Dir"
echo " PAK_CUR_VER=$PAK_CUR_VER"
echo " PAK_PREV_VER=$PAK_PREV_VER"
echo " PAK_export_history_base_dir=$PAK_export_history_base_dir"
echo " PAK_export_history_prev_dir=$PAK_export_history_prev_dir"
echo " PAK_export_history_ver_dir=$PAK_export_history_ver_dir"
echo " "
echo " ----------------------------------------------------------------------------"



echo " "
echo " Getting Ready for Re-Export!!"
echo " $PAK_Full_Ver_Name"


# Move unneeded dir
echo " Move un-needed files to:"
echo " $PAK_Removed_Files_Export_Dir"
echo " "

echo " "
echo " Moving fancymenu_setups..."
mv -v fancymenu_setups $PAK_Removed_Files_Export_Dir/

echo " "
echo " Moving crash-reports..."
mv -v crash-reports $PAK_Removed_Files_Export_Dir/

echo " "
echo " Moving local..."
mv -v local $PAK_Removed_Files_Export_Dir/

echo " "
echo " Moving journeymap files ..."
mv -v journeymap/data $PAK_Removed_Files_Export_Dir/journeymap/
mv -v journeymap/server $PAK_Removed_Files_Export_Dir/journeymap/
mv -v journeymap/journeymap.log $PAK_Removed_Files_Export_Dir/journeymap/
 

echo " "
echo " Moving fancymenu_data..."
mv -v fancymenu_data $PAK_Removed_Files_Export_Dir/

echo " "
echo " Moving fancymenu_setups..."
mv -v fancymenu_setups $PAK_Removed_Files_Export_Dir/

echo " "
echo " Moving fancymenu_instance_data..."
mv -v fancymenu_instance_data $PAK_Removed_Files_Export_Dir/

echo " "
echo " Moving logs..."
mv -v logs $PAK_Removed_Files_Export_Dir/
mv -v hs_err_* $PAK_Removed_Files_Export_Dir/

echo " "
echo " Moving backups..."
mv -v backups $PAK_Removed_Files_Export_Dir/

echo " "
echo " Moving patchouli_data.json..."
mv -v patchouli_data.json $PAK_Removed_Files_Export_Dir/

echo " "
echo " Moving knownkeys.txt..."
mv -v knownkeys.txt $PAK_Removed_Files_Export_Dir/

echo " "
echo " Moving realms_persistence.json..."
mv -v realms_persistence.json $PAK_Removed_Files_Export_Dir/

echo " "
echo " Moving usercache.json..."
mv -v usercache.json $PAK_Removed_Files_Export_Dir/

echo " "
echo " Moving options.txt..."
mv -v options.txt $PAK_Removed_Files_Export_Dir/
echo " "
echo " "

echo " "
echo " Moving servers.dat..."
mv -v servers.dat* $PAK_Removed_Files_Export_Dir/
echo " "
echo " "

# Remove DS_Store files
echo " Removing DS_Store files..."
find . -name '.DS_Store' -type f -delete
echo " "

echo " Remove un-needed files complete!"
echo " "
echo " ----------------------------------------------------------------------------"



echo " Remove ready to export file check file"
rm -v ./re-ready2.export
echo " done"
echo " "
echo " ----------------------------------------------------------------------------"
echo " "
echo " ----------------------------------------------------------------------------"
echo " Script Complete!"
echo " ----------------------------------------------------------------------------"
echo " "
