#!/bin/bash
ARTIFACTS=/mnt/common/artifacts
SCRIPTS=/mnt/common/scripts
echo "Copying files to common folders.."
[ ! -d "$ARTIFACTS" ] && mkdir -p "$ARTIFACTS"
cp artifacts/* "$ARTIFACTS"
[ ! -d "$SCRIPTS" ] && mkdir -p "$SCRIPTS"
cp scripts/* "$SCRIPTS"
echo "Files copied!"