#!/bin/bash
PROFILE_NAME=${PROFILE_NAME:-"AppSrv01"}
SERVER_NAME=${SERVER_NAME:-"server1"}
APP_NAME=${APP_CONFIG_DIR_NAME:-"mia-app"}
BACKUP_FILE_NAME=/tmp/${APP_NAME}_$(date --iso).bck

./stop.sh

if [ -f $BACKUP_FILE_NAME ]; then
    DATE=$(date +%Y-%m-%d_%H-%M-%S)
    echo "Moving $BACKUP_FILE_NAME to ${BACKUP_FILE_NAME}_$DATE"
    mv $BACKUP_FILE_NAME ${BACKUP_FILE_NAME}_$DATE
fi

echo -e "Clean temp directory...\n"
rm -rf  /opt/IBM/WebSphere/AppServer/profiles/${PROFILE_NAME}/wstemp/*

echo -e "Create backup profile...\n"
/opt/IBM/WebSphere/AppServer/bin/manageprofiles.sh -backupProfile -profileName $PROFILE_NAME -backupFile $BACKUP_FILE_NAME

echo -e "INFO BACKUP FILE:\n\n"
ls -lth ${BACKUP_FILE_NAME}*