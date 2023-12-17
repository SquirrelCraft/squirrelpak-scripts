#!/bin/bash
#
#     Internal Server Script - SquirrelPAK LP20 Only
#     Shows the current version set in version.txt vs current_version.txt
#     cmd_restore_from_backup
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


# cmd_restore_from_backup.sh

echo " "
echo "Removing old restore files"
rm -Rv config.restore/
rm -Rv mods.restore/
rm -Rv patchouli_books.restore/
rm -Rv scripts.restore/
rm -Rv journeymap.restore/
rm -Rv resources.restore/
rm -Rv resourcepacks.restore/
rm -Rv defaultconfigs.restore/
rm -Rv auto-backups.restore/
rm -Rv crash-reports.restore/
rm -Rv debug.restore/
rm -Rv logs.restore/
rm -Rv World_Data.restore/
rm -v server.properties.restore
rm -v changelog.txt.restore


echo " "
echo "Backing up current files to .restore"

mv -v config/ config.restore
mv -v mods/ mods.restore
mv -v patchouli_books/ patchouli_books.restore
mv -v scripts/ scripts.restore
mv -v journeymap/ journeymap.restore
mv -v resources/ resources.restore
mv -v resourcepacks/ resourcepacks.restore
mv -v defaultconfigs defaultconfigs.restore
mv -v auto-backups/ auto-backups.restore
mv -v crash-reports/ crash-reports.restore
mv -v debug/ debug.restore
mv -v logs/ logs.restore
mv -v World_Data/ World_Data.restore
mv -v server.properties server.properties.restore
mv -v changelog.txt changelog.txt.restore

echo " "
echo "Restore .bak files..."
mv -v config.bak/ config
mv -v mods.bak/ mods
mv -v patchouli_books.bak/ patchouli_books
mv -v scripts.bak/ scripts
mv -v journeymap.bak/ journeymap
mv -v resources.bak/ resources
mv -v resourcepacks.bak resourcepacks
mv -v defaultconfigs.bak defaultconfigs
mv -v auto-backups.bak/ auto-backups
mv -v crash-reports.bak/ crash-reports
mv -v debug.bak/ debug
mv -v logs.bak/ logs
mv -v World_Data.bak/ World_Data
mv -v server.properties.bak server.properties
mv -v changelog.txt.bak changelog.txt




echo "Done!"

