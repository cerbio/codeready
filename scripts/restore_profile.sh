#!/bin/bash
SCRIPTS="$CHE_PROJECTS_ROOT"/wasbase/scripts
/opt/IBM/WebSphere/AppServer/bin/manageprofiles.sh -restoreProfile -backupFile "$SCRIPTS"/profile.bck