#!/bin/bash
echo "Patching scripts for app deployment.."
cp ./EnterpriseHelloWorld10.ear /work/config/app.ear
cp ./install_app.py /work/config/install_app.py
echo "Files Patched!"