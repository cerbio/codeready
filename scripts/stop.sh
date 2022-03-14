#!/bin/bash
PROFILE_NAME=${PROFILE_NAME:-"AppSrv01"}
SERVER_NAME=${SERVER_NAME:-"server1"}
USR=wasadmin
PSW=`cat/tmp/PASSWORD`

echo "Stopping server ..................."
/opt/IBM/WebSphere/AppServer/profiles/$PROFILE_NAME/bin/stopServer.sh $SERVER_NAME  -username $USR -password $PSW
