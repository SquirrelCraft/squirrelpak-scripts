#!/bin/bash
#
#     Internal script to re-ready for Export to CF
#
#     v2.0
# 

#     /squrrelpak/bin/redo-ready_for_export.sh
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
echo "  SquirrelPAK CF Re-Export Script v2.0"
echo "  (redo-ready_for_export.sh) - Licnesed under GNU GPLv3"
echo " ----------------------------------------------------------------------------"
echo " | Copyright (C) 2023 The Network Squirrel(SquirrelCraft)                   |"
echo " | https://github.com/SquirrelCraft                                         |"
echo " | This program comes with ABSOLUTELY NO WARRANTY; This is free software,   |"
echo " | and you are welcome to redistribute it under certain conditions          |"
echo " ----------------------------------------------------------------------------"
echo " "

Script_Dir=$PWD 
PAK_ChangeLog=./changelog.txt

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

echo " Local vars Set!"
echo " Script_Dir=$Script_Dir"
echo " PAK_ChangeLog=$PAK_ChangeLog"
echo " PAK_bin_dir=$PAK_bin_dir"
echo " PAK_etc_dir=$PAK_etc_dir"
echo " PAK_versons_dir=$PAK_versons_dir"
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


echo " Config files loaded, loaded config below:"
echo " "
echo " PAK_NAME=$PAK_NAME "
echo " PAK_RELEASE=$PAK_RELEASE "
echo " PAK_VER=$PAK_VER "
echo " PAK_DESC=$PAK_DESC "
echo " PAK_Menu_Beta_Text=$PAK_Menu_Beta_Text "
echo " PAK_Menu_Config_Dir=$PAK_Menu_Config_Dir "
echo " PAK_Current_Version=$PAK_Current_Version "
echo " PAK_Previous_Version=$PAK_Previous_Version "
echo " PAK_Full_Ver_Name=$PAK_Full_Ver_Name "
echo " PAK_Short_Ver_Name=$PAK_Short_Ver_Name "
echo " PAK_Exported_ModListName=$PAK_Exported_ModListName "

echo " "
echo " ----------------------------------------------------------------------------"



echo " "
echo " Getting Ready for Re-Export!!"
echo " $PAK_Full_Ver_Name"


# Remove unneeded dir
echo " Remove un-needed files.."
echo " "

echo " "
echo " Removing fancymenu_setups..."
rm -vR fancymenu_setups

echo " "
echo " Removing crash-reports..."
rm -vR crash-reports

echo " "
echo " Removing local..."
rm -vR local 

echo " "
echo " Removing journeymap files ..."
rm -vR journeymap/data
rm -vR journeymap/server 
rm -v journeymap/journeymap.log
 

echo " "
echo " Removing fancymenu_data..."
rm -vR fancymenu_data

echo " "
echo " Removing fancymenu_setups..."
rm -vR fancymenu_setups

echo " "
echo " Removing fancymenu_instance_data..."
rm -vR fancymenu_instance_data

echo " "
echo " Removing logs..."
rm -vR logs
rm -v hs_err_*

echo " "
echo " Removing backups..."
rm -vR backups

echo " "
echo " Removing patchouli_data.json..."
rm -v patchouli_data.json

echo " "
echo " Removing knownkeys.txt..."
rm -v knownkeys.txt

echo " "
echo " Removing realms_persistence.json..."
rm -v realms_persistence.json

echo " "
echo " Removing usercache.json..."
rm -v usercache.json

echo " "
echo " Removing options.txt..."
rm -v options.txt
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
