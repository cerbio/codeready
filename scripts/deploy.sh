#!/bin/bash
SCRIPTS=/mnt/common/scripts
echo "Executing configuration for WAS.."
env JVM_EXTRA_CMD_ARGS=-Xnoloa "$SCRIPTS"/configure.sh "$@"
echo "Configuration done!"


