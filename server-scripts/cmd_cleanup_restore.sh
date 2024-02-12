#!/bin/bash
#
#     Internal Server Script - SquirrelPAK xxxxxx Only
#     Removes restore files created by cmd_restore_from_backup.sh
#     cmd_cleanup_restore.sh
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


# cmd_cleanup_restore.sh

echo " "
echo " ----------------------------------------------------------------------------"
echo "  SquirrelPAK Internal Server Script - SquirrelPAK xxxxxx Only"
echo "  (cmd_cleanup_restore.sh) - v1.1 - Licnesed under GNU GPLv3"
echo "  Removes restore files created by cmd_restore_from_backup.sh "
echo " ----------------------------------------------------------------------------"
echo " | Copyright (C) 2023 The Network Squirrel(SquirrelCraft)                   |"
echo " | https://github.com/SquirrelCraft/squirrelpak-scripts                     |"
echo " | This program comes with ABSOLUTELY NO WARRANTY; This is free software,   |"
echo " | and you are welcome to redistribute it under certain conditions          |"
echo " ----------------------------------------------------------------------------"
echo " "

echo "Cleaning up .restore files"
echo " "
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
echo "Done"

