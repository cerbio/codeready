PROFILE_NAME=${PROFILE_NAME:-"AppSrv01"}
SERVER_NAME=${SERVER_NAME:-"server1"}
USR=wsadmin

echo 'setting password'
/work/set_password.sh

PSW=`cat /tmp/PASSWORD`

echo "Starting server ..................."
/opt/IBM/WebSphere/AppServer/profiles/$PROFILE_NAME/bin/startServer.sh $SERVER_NAME  -username $USR -password $PSW -timeout 300
