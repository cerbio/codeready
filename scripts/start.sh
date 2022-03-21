PROFILE_NAME=${PROFILE_NAME:-"AppSrv01"}
SERVER_NAME=${SERVER_NAME:-"server1"}
WAS_PROP="/workspace/server-cfg.props"
WAS_FINAL_CFG="/etc/websphereserver-cfg.props"

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

echo "Copying properties to the config folder!"
cp -f "$WAS_PROP" "$WAS_FINAL_CFG"

applyConfigs

start_server
