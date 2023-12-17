# SquirrelCraft SquirrelPAK script files - 3.0
#
# This folder is used for the creation and maintenance	
# of our SquirrelPAKs. All files under the squirrelpak 
# folder is licensed under the GNU GPLv3
# 
# See the LICENSE file for full details
#
#
# bin - scripts
#    L create_server_pack.sh - Creates a zip file for install on server
#      ready_for_export.sh - Gets the project ready for CF Export
#      update_menus.sh - Updates menu version text for fancy menu
#      ver.sh - Shows the current version set in version.txt vs current_version.txt
#      wtd_current_vs_previous - Displays diff between current version and previous
#      wtd_current_vs_other - Displays diff between current version and other
#      wtd_current_vs_state - Displays diff between current version mod directory
#      wtd_state_vs_other - Displays diff between current version mod directory
#      wtd.sh - Displays diff between versions
#
# bin
#    L server - Customized to each pack for server maintenance
#          L cmd_cleanup_backups.sh - Removes backup files
#            cmd_cleanup_restore.sh - Remove restore files
#            cmd_post_upgrade.sh - Things to do post upgrade
#            cmd_ready_for_upgrade.sh - Create backup files before upgrade
#            cmd_restore_from_backup.sh - Restore from backup
#            readme.txt - Readme File
#            
#
#
# etc - Config Files
#    L changelog-end-template.txt - Will be put at the end of the changelog on export
#      changelog-notes.txt - Working notes, will be added to change log on export
#      client_mod_remove_list.txt - Auto generated
#      client_mods.txt - List of client only mods to be removed from server pack
#      current_version.txt - Current version of the pack, used for scripts
#      previous_version.txt - Previous version of the pack, used for scripts
#      version.txt - Version and name of pack, used for scripts
#
# versions - Folder with list of mods for that specific version
#
# LICENSE - The license file
# readme.txt - This file
