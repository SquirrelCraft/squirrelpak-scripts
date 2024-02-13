#!/bin/bash
#     Script creates server pack zip file for server install
#     This script was designed for MacOS
#     Run in terminal in the directory of the mod pack
#
#
#     Internal Script 
#     v1.6.1


#     squirrelpak/bin/create_server_pack.sh
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
echo "  SquirrelPAK Server Export Script v1.6.1"
echo "  (create_server_pack.sh) - Licnesed under GNU GPLv3"
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
if [ ! -f $PAK_ChangeLog ]; then
    echo " "
    echo "  Script must run in the root folder!"
    echo "  Script exiting!"
    echo " "
    exit 1
fi

# Must be in export state to run
if [ ! -f "$PAK_Export_Timestamp_File" ]; then
    echo " "
    echo "  Missing Export Time Stamp!!"
    echo "  Can not find file $PAK_Export_Timestamp_File"
    echo "  Project must be in Exported State!"
    echo " "
    echo "  Script is exiting!"
    echo " "
    exit 1
fi


# Ensure the remove list exists
if [ ! -f "$Script_Dir/squirrelpak/etc/client_mod_remove_list.txt" ]; then
    echo " "
    echo "  Missing remove list!"
    echo "  Can not find file $Script_Dir/squirrelpak/etc/client_mod_remove_list.txt"
    echo "  You need to run the ready export script first!"
    echo " "
    echo "  Script is exiting!"
    echo " "
    exit 1
fi


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
echo " PAK_FORGE_VER=$PAK_FORGE_VER"
echo " PAK_Menu_Beta_Text=$PAK_Menu_Beta_Text "
echo " PAK_Menu_Config_Dir=$PAK_Menu_Config_Dir "
echo " PAK_Current_Version=$PAK_Current_Version "
echo " PAK_Previous_Version=$PAK_Previous_Version "
echo " PAK_Full_Ver_Name=$PAK_Full_Ver_Name "
echo " PAK_Short_Ver_Name=$PAK_Short_Ver_Name "
echo " PAK_Exported_ModListName=$PAK_Exported_ModListName "

echo " "
echo " ----------------------------------------------------------------------------"


SCSP_Server_Dir="/tmp/Server-SquirrelPAK-$PAK_NAME-v$PAK_VER"
SCSP_Server_File="$Script_Dir/Server-SquirrelPAK-$PAK_NAME-v$PAK_VER.zip"
SCSP_Server_ChangeLog_File="$Script_Dir/Server-SquirrelPAK-$PAK_NAME-v$PAK_VER-ChangeLog.txt"

echo " "
echo "Creating Server File for SquirrelPAK $PAK_NAME - $PAK_DESC v$PAK_VER"
echo " "

# Cleanup old files
rm -vR $SCSP_Server_Dir


# Create tmp dir
echo " Setting up build dir"
mkdir $SCSP_Server_Dir


# Copy files over to temp
echo " Copy files to build dir"
echo " Copy config..."
cp -R ./config $SCSP_Server_Dir

echo " Copy defaultconfigs..."
cp -R ./defaultconfigs $SCSP_Server_Dir

echo " Copy mods..."
cp -R ./mods $SCSP_Server_Dir

echo " Copy patchouli_books..."
cp -R ./patchouli_books $SCSP_Server_Dir

echo " Copy resourcepacks..."
cp -R ./resourcepacks $SCSP_Server_Dir

echo " Copy resources..."
cp -R ./resources $SCSP_Server_Dir

echo " Copy journeymap..."
cp -R ./journeymap $SCSP_Server_Dir

echo " Copy scripts..."
cp -R ./scripts $SCSP_Server_Dir

echo " Copy server scripts..."
mkdir $SCSP_Server_Dir/srv-maint
cp -R ./squirrelpak/server-scripts/* $SCSP_Server_Dir/srv-maint

echo " Copy changelog..."
cp ./changelog.txt $SCSP_Server_Dir

echo " Copy credits.txt..."
cp ./credits.txt $SCSP_Server_Dir

echo " "
echo " Remove client only mods..."
# Remove client only mods from list
input="$Script_Dir/squirrelpak/etc/client_mod_remove_list.txt"

cd $SCSP_Server_Dir

while IFS= read -r file; do

	if [[ $file = \#* ]]
	then
		echo "$file"
	else
		echo " delete file $file"
		pwd
		rm -v $file
		echo " "
	fi

done < "$input"

cd $Script_Dir

echo " Create Server Mod List File"
echo "SquirrelPAK $PAK_NAME - $PAK_DESC v$PAK_VER - Server" > $SCSP_Server_Dir/$PAK_NAME-v$PAK_VER-Server-ModsList.txt
ls -y $SCSP_Server_Dir/mods >> $SCSP_Server_Dir/$PAK_NAME-v$PAK_VER-Server-ModsList.txt
echo " File $PAK_NAME-v$PAK_VER-Server-ModsList.txt created"
echo " "

echo " Create Server PAK Change Log File at $SCSP_Server_ChangeLog_File"
cat <<EOF > "$SCSP_Server_ChangeLog_File"

Server PAK for SquirrelPAK $PAK_NAME - $PAK_DESC v$PAK_VER

=====================================================
Server PAK - SquirrelPAK $PAK_NAME
Release Version $PAK_VER

Forge Version: $PAK_FORGE_VER
=====================================================
 
This is the Server PAK for our $PAK_NAME Mod PAK 
for version v$PAK_VER of $PAK_NAME

Requires forge version $PAK_FORGE_VER
 
For Mod PAK change log see the change log in the zip file.
 
 
 
How to Setup MineOS server using this PAK
https://youtu.be/NWExGuf30mE
 

How to Update Your MineOS server using this PAK
https://youtu.be/u02JrGBAdLk

EOF
echo " "

echo " "
echo " Create zip file..."
# Make zip file
zip -r -9 "$SCSP_Server_File" $SCSP_Server_Dir/*
echo " "

cd $Script_Dir
echo " ----------------------------------------------------------------------------"
echo " Script Complete!"
echo " Zip file $SCSP_Server_File created"
echo " ----------------------------------------------------------------------------"


