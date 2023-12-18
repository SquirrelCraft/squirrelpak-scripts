#!/bin/bash
#
#     Internal Server Script - SquirrelPAK xxxxx Only
#     Post install script for server
#     cmd_post_upgrade.sh
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


# cmd_post_upgrade.sh

echo " "
echo " ----------------------------------------------------------------------------"
echo "  SquirrelPAK Internal Server Script - SquirrelPAK xxxxxx Only"
echo "  (cmd_post_upgrade.sh) - v1.1 - Licnesed under GNU GPLv3"
echo "  Post install script for server "
echo " ----------------------------------------------------------------------------"
echo " | Copyright (C) 2023 The Network Squirrel(SquirrelCraft)                   |"
echo " | https://github.com/SquirrelCraft/squirrelpak-scripts                     |"
echo " | This program comes with ABSOLUTELY NO WARRANTY; This is free software,   |"
echo " | and you are welcome to redistribute it under certain conditions          |"
echo " ----------------------------------------------------------------------------"
echo " "

echo "Edit Server file"
nano server.properties

