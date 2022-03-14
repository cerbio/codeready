#!/bin/bash
SCRIPTS=/mnt/common/scripts
ARTIFACTS=/mnt/common/artifacts
WCONFIG=/work/config
echo "Copying files to WAS configuration folders.."
cp "$ARTIFACTS/"* "$WCONFIG"
echo "Files copied!"
echo "Executing configuration for WAS.."
env JVM_EXTRA_CMD_ARGS=-Xnoloa "$WCONFIG"/configure.sh "$@"
echo "Configuration done!"


