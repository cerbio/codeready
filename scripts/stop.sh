#!/bin/bash
PROFILE_NAME=${PROFILE_NAME:-"AppSrv01"}
SERVER_NAME=${SERVER_NAME:-"server1"}

echo "Stopping server ..................."
/opt/IBM/WebSphere/AppServer/profiles/$PROFILE_NAME/bin/stoptServer.sh $SERVER_NAME
