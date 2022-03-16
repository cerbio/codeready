#!/bin/bash
SCRIPTS="$CHE_PROJECTS_ROOT"/wasbase/scripts
echo "Deploying configuration to Websphere.."
env JVM_EXTRA_CMD_ARGS=-Xnoloa "$SCRIPTS"/configure.sh "$@"
echo "Configuration done!"


