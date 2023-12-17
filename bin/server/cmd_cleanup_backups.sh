#!/bin/bash
#
#     Internal Server Script - SquirrelPAK LP20 Only
#     Removes backed up files created by cmd_ready_for_upgrade.sh
#     cmd_cleanup_backups.sh
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

# cmd_cleanup_backups.sh

echo "Cleanup old backup files"
echo " "
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



echo "Done!"
echo ""
echo ""



