#!/bin/bash
ARTIFACTS=/mnt/common/artifacts
WCONFIG=/work/config
echo "Copying files to WAS configuration folders.."
cp "$ARTIFACTS/*" "$WCONFIG"
echo "Files copied!"
echo "Executing configuration for WAS.."
env JVM_EXTRA_CMD_ARGS=-Xnoloa /work/configure.sh
echo "Configuration done!"

