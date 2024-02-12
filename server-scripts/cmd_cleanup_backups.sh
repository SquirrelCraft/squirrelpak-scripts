#!/bin/bash
#
#     Internal Server Script - SquirrelPAK xxxxxx Only
#     Removes backed up files created by cmd_ready_for_upgrade.sh
#     cmd_cleanup_backups.sh
#     v1.1
# 
#     Copyright (C) 2023 The Network Squirrel(SquirrelCraft)
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

# cmd_cleanup_backups.sh

echo " "
echo " ----------------------------------------------------------------------------"
echo "  SquirrelPAK Internal Server Script - SquirrelPAK xxxxxx Only"
echo "  (cmd_cleanup_backups.sh) - v1.1 - Licnesed under GNU GPLv3"
echo "  Removes backed up files created by cmd_ready_for_upgrade.sh "
echo " ----------------------------------------------------------------------------"
echo " | Copyright (C) 2023 The Network Squirrel(SquirrelCraft)                   |"
echo " | https://github.com/SquirrelCraft/squirrelpak-scripts                     |"
echo " | This program comes with ABSOLUTELY NO WARRANTY; This is free software,   |"
echo " | and you are welcome to redistribute it under certain conditions          |"
echo " ----------------------------------------------------------------------------"
echo " "

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



