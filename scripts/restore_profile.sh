#!/bin/bash
SCRIPTS="$CHE_PROJECTS_ROOT"/wasbase/scripts
PROFILE_SCRIPT="$SCRIPTS"/profile90.bck
if [! -z "$1"] then
    PROFILE_SCRIPT="$1"
fi
/opt/IBM/WebSphere/AppServer/bin/manageprofiles.sh -restoreProfile -backupFile "$PROFILE_SCRIPT"
