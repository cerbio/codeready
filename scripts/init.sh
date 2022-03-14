#!/bin/bash
SCRIPTS=/mnt/common/scripts
echo "Copying scripts to common folder.."
[ ! -d "$SCRIPTS" ] && mkdir -p "$SCRIPTS"
cp scripts/* "$SCRIPTS"
rm -f "$SCRIPTS"/build.sh "$SCRIPTS"/init.sh
echo "Files copied!"