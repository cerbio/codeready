#!/bin/bash
SCRIPTS="$CHE_PROJECTS_ROOT"/wasbase/scripts
echo "Setting Password"
/work/set_password.sh

#echo starting the Websphere server...
#"$SCRIPTS"/start.sh

echo "Applying configuration"
if [ ! -z "$1" ]; then
    /work/run_py_script.sh "$@"
elif [ ! -z "$(ls /work/config)" ]; then
    echo "+ Found config-files under /work/config. Executing..."
    find /work/config -name "*.py"  -print0 | sort -z | xargs -0 -n 1 -r /work/run_py_script.sh
fi
/work/applyConfig.sh
#stop_server
find /opt/IBM -user was ! -perm -g=w -print0 | xargs -0 -r chmod g+w
find /opt/IBM -type d -user was ! -perm -g=x -print0 | xargs -0 -r chmod g+x