PROFILE_NAME=${PROFILE_NAME:-"AppSrv01"}
SERVER_NAME=${SERVER_NAME:-"server1"}
SCRIPTS="$CHE_PROJECTS_ROOT"/wasbase/scripts
PROFILE_SCRIPT="$SCRIPTS"/server-cfg90.props
if [ ! -z "$1" ]; then
    PROFILE_SCRIPT="$1"
fi

echo 'setting password'
/work/set_password.sh

start_server()
{
  echo "Starting server ..................."
  /opt/IBM/WebSphere/AppServer/profiles/$PROFILE_NAME/bin/startServer.sh $SERVER_NAME
}
applyConfigs(){
  if [ ! -z "$(ls /etc/websphere)" ]; then
    echo "+ Found config-files under /etc/websphere. Executing..."
    find /etc/websphere -type f \( -name \*.props -o -name \*.conf \) -print0 | sort -z | xargs -0 -n 1 -r /work/applyConfig.sh
  fi
}

cp "$PROFILE_SCRIPT" /etc/websphere/server-cfg.props

applyConfigs

start_server
