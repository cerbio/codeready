# codeready workspace for Websphere traditional
A RH CodeReady Workspaces environment to work with [IBM Websphere Traditional server](https://github.com/WASdev/ci.docker.websphere-traditional).

## Description of the repository
The repository has three main folders.

__[devfiles](./devfiles/)__

The folder contains a sample [devfile](./devfiles/devfile_WAS.yaml) used to create the workspace for Websphere traditional environemnt.

__[scripts](./scripts/)__

The folder contains the scripts used to implement the commands in the [devfile](./devfiles/devfile_WAS.yaml).

__[artifacts](./artifacts/)__

A set of sample artifacts demonstrating how the workspace can be used.

The [devfile](./devfiles/devfile_WAS.yaml) will use the [scripts](./scripts/) to deploy the [artifacts](./artifacts/).

## Description of the [devfile](./devfiles/devfile_WAS.yaml)

The devfile includes a single project: https://github.com/cerbio/codeready.git.

The devfile has two main components: maven and wasbase.

The two components share a common directory _'work/config'_ used by the build (maven) to produce the application artifacts and used by the Websphere application server (wasbase component) to deploy the same artifacts.

__Maven component__

This component is intended to host the code and execute the build.

- It is defined from the official RH image 'registry.redhat.io/codeready-workspaces/plugin-java8-rhel8:2.15'.
- Copies the project code locally (mountSources = true) to support development and build processes.
- Defines a _Build & Publish_ command executing the sample [build script](./scripts/build.sh) to copy the [artifacts](./artifacts/) to the  _'work/config'_ for use by the Websphere application server (wasbase component).

 
__Wasbase component__

This component runs the Websphere application server and implements the deployment tasks.

- It is defined from the official IBM image [websphere-traditional](https://hub.docker.com/r/ibmcom/websphere-traditional/).
- Copies the project code locally (mountSources = true) to access the scripts used to control the Websphere server and deploy the application artifacts.
- Defines a _Init Environment_ command configuring and starting the server in debug mode (port 7777).
- Defines a _Deploy_ command to deploy the artifacts published by the build in the _'work/config'_ folder into the Websphere application server.
- Defines a _Start_ command to start the Websphere application server.
- Define a _Stop_ command to stop the Websphere application server.


## How the _Deploy_ command works

The _Deploy_ command is executed on the wasbase component and reads the artifatcs in the _'work/config'_ to execute the application deployment and the server configuration.

The command, defined in the devfile, includes three main parameters that can be customized:
- The absolute pathname of the python script used to configure WAS: the script implements the deployment of the application and of the configuration of the server (a default implementation is provided).
- The name of the application (WAS application name)
- The absolute pathname of the archive to be deployed.

______

## Sample implementation

The workpace is functional out of the box using a sample application and artifatcs defined in the [artifacts](./artifacts/) folder: the build simply copies them to the deployment folder ( _'work/config'_).

Main steps to work with Websphere:
- In order to initialize the workspace execute the _Init Environment_ command on the _wasbase_ component (this command will be added as postStart when available in the current RH CodeReady Workspaces implementation, see devfiles spec 2.0).
- Execute the _Build & Publish_ command.
- Execute the _Deploy_ command.
- Execute the Debugger to attach to the WAS java process.


__Note__ that in order to access the application URL it is required to create a route based on the 'apps' service specifying 'passthrough' as secure configuration option.

Application URL:
<ROUTE_OCP>/HelloWorld/hello

______

__Note that once the workspace is stopped the Websphere (wasbase) container is stopped too and it does loose the configuration applied.__

The configuration must be done again: 
- Execute the _Init Environment_ command to enable debug mode on  the server.
- Execute the _Deploy_  command to redeploy the application: the  _'work/config'_ is maintined in a persisted volume and maintains the artifacts produced before the workspace has been stopped.