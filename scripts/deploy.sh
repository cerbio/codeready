#!/bin/bash
SCRIPTS=/mnt/common/scripts
ARTIFACTS=/mnt/common/artifacts
WCONFIG=/work/config
WORK=/work
echo "Copying files to WAS configuration folders.."
cp "$ARTIFACTS/"* "$WCONFIG"
cp "$SCRIPTS/configure.sh" "$WORK"
echo "Files copied!"
echo "Executing configuration for WAS.."
env JVM_EXTRA_CMD_ARGS=-Xnoloa /work/configure.sh "$@"
echo "Configuration done!"


