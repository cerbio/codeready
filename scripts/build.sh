#!/bin/bash
ARTIFACTS=/work/config
echo "Copying files to was config folder.."
[ ! -d "$ARTIFACTS" ] && mkdir -p "$ARTIFACTS"
cp artifacts/* "$ARTIFACTS"