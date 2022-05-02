#!/bin/bash

###############################
#  2022-04-30 20:46  UTC+8    #
#  2022 php server,           #
#  All rights reserved.       #
#  licensed under MIT         #
#  script version: 2.1.3-open #
#  requirements: bash, screen #
###############################

#vars
screen_name="my_screen"
cmd1="./start.sh"
wld_name="PHP_s3\!/"

echo "WARRNING! THIS SCRIPT WAS NOT TESTED! TO MAKE IT WORK BE SURE TO READ AND MODIFY THE SCRIPT BEFORE RUN THIS SCRIPT."
exit 0

echo "DID YOU READ RELEASE-NOTES AND PROPERTIES? (y/n)"
read continue_var
case $continue_var in
    [yY][eE][sS]|[yY])
        echo "continue..."
        ;;
    [nN][oO]|[nN])
        echo "Abort."
        exit 1
        ;;
    *)
        echo "Abort."
        exit 1
        ;;
esac
echo "INPUT MOVING VERSION:"
read p_ver
echo "NOW MOVE OFFICAL FILES..."
mkdir bak
mv allowlist.json bedrock_server_how_to.html permissions.json release-notes.txt server.properties bak
mv ../$p_ver ../old/
mv ../old/$p_ver/allowlist.json ../old/$p_ver/permissions.json ../old/$p_ver/server.properties ../old/$p_ver/pkgwds.sh ../old/$p_ver/start.sh ./
screen -dmS $screen_name
screen -x -S $screen_name -p 0 -X stuff "$cmd"
screen -x -S $screen_name -p 0 -X stuff $'\n'
echo "WAITING FOR SESSION..."
sleep 10
killall bedrock_server
echo "KILLED."
screen -x -S $screen_name -p 0 -X stuff $'exit'
cd worlds && rm -r *
cd ..
cp -r ../old/$p_ver/worlds/$wld_name ./worlds
echo "DONE. PLEASE MOVE PACKS NOW!"
exit 0
