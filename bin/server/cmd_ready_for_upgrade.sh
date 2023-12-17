#!/bin/bash
#
#     Internal Server Script - SquirrelPAK LP20 Only
#     Backups server files and ready the server for a mod update
#     cmd_ready_for_upgrade.sh
#     v1.0
# 
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


# cmd_ready_for_upgrade.sh

echo "Remove old backup files"
echo " "
echo "Remove old backups "
rm -Rv config.bak/
rm -Rv mods.bak/
rm -Rv patchouli_books.bak/
rm -Rv scripts.bak/
rm -Rv journeymap.bak/
rm -Rv resources.bak/
rm -Rv resourcepacks.bak/
rm -Rv defaultconfigs.bak/
rm -Rv auto-backups.bak/
rm -Rv crash-reports.bak/
rm -Rv debug.bak/
rm -Rv logs.bak/
rm -Rv World_Data.bak/
rm -v server.properties.bak
rm -v changelog.txt.bak




echo " "
echo "Backing up files"
mv -v config/ config.bak
mv -v mods/ mods.bak
mv -v patchouli_books/ patchouli_books.bak
mv -v scripts/ scripts.bak
mv -v journeymap/ journeymap.bak
mv -v resources/ resources.bak
mv -v resourcepacks/ resourcepacks.bak
mv -v defaultconfigs/ defaultconfigs.bak
mv -v auto-backups/ auto-backups.bak
mv -v crash-reports/ crash-reports.bak
mv -v debug/ debug.bak
mv -v logs/ logs.bak
cp -Rv World_Data/ World_Data.bak
cp -v server.properties server.properties.bak
mv -v changelog.txt changelog.txt.bak
echo " "

echo "Done!"
echo ""
echo ""
echo "Add Updated Folders, then cmd_post_upgrade.sh command"
echo ""
echo "config"
echo "mods"
echo "patchouli_books"
echo "scripts"
echo "journeymap"
echo "resources"
echo "resourcepacks"
echo "defaultconfigs"
echo "changelog"


