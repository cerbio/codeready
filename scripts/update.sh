#!/bin/bash
SCRIPTS="$CHE_PROJECTS_ROOT"/wasbase/scripts
echo "Updating Websphere app.."
# args[0]: The anme of the script to be executed
/work/run_py_script.sh "$SCRIPTS"/update_app.py "$@"
echo "Update app done!"


