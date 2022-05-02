#!/bin/bash

###############################
#  2022-01-27 14:17  UTC+8    #
#  2022 php server,           #
#  All rights reserved.       #
#  Licensed under MIT         #
#  script version: 2.1.4-open #
#  requirements: 7za, bash    #
###############################

#vars
#wld_rootdir example: ~/phpmc/worlds/
wld_rootdir=''
#backup_dir example: ~/phpmc/backups/
backup_dir=${wld_rootdir}
#wld_name example: world
wld_name=''

#code
cd ${wld_rootdir}
runmoment=`date +%Y%m%d%H%M%S`
echo "run time is" ${runmoment}
7za a -t7z -r ${backup_dir}${wld_name}${runmoment}.7z ${wld_rootdir}${wld_name}
echo Done.
exit 0
