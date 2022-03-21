#!/bin/bash
SCRIPTS="$CHE_PROJECTS_ROOT"/wasbase/scripts
PROFILE_SCRIPT="$SCRIPTS"/profile90.bck
WASPROP_SCRIPT="$SCRIPTS"/server-cfg90.props
WAS_PROP="/workspace/server-cfg.props"

if [ ! -z "$1" ]; then
    echo "Passed param_1: $1"
    PROFILE_SCRIPT="$1"
fi
if [ ! -z "$2" ]; then
    echo "Passed param_2: $2"
    WASPROP_SCRIPT="$2"
fi

echo "Restoring profile: $PROFILE_SCRIPT"
/opt/IBM/WebSphere/AppServer/bin/manageprofiles.sh -restoreProfile -backupFile "$PROFILE_SCRIPT"

echo "Copying configuration: $WASPROP_SCRIPT"
cp -f "$WASPROP_SCRIPT" "$WAS_PROP"
