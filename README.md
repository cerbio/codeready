# codeready
A test CodeReady Workspaces devfile to work with [IBM Websphere Traditional server](https://github.com/WASdev/ci.docker.websphere-traditional).

Main steps once created the workspace:
1. Execute the init task to setup the proper scripts.
2. Execute the Build & Publish to simulate a build and the publish of the related application EAR file.
3. Execute the Deploy task to configure the server and deploy the application.
4. Start/Stop server as required.


Note that in order to access the application URL it is required to create a route out of the 'apps' service specifying 'passthrough' as secure configuration option.

Application URL:
<ROUTE_OCP>/HelloWorld/hello