PROFILE_NAME=${PROFILE_NAME:-"AppSrv01"}
SERVER_NAME=${SERVER_NAME:-"server1"}
USR=wsadmin
PSW=`cat /tmp/PASSWORD`

echo "Stopping server ..................."
/opt/IBM/WebSphere/AppServer/profiles/$PROFILE_NAME/bin/startServer.sh $SERVER_NAME  -username $USR -password $PSW -timeout 300
