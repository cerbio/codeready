import sys
import os

global  AdminConfig

def getNodeId (prompt):
    nodeList = AdminConfig.list("Node").split("\n")

    if (len(nodeList) == 1):
        node = nodeList[0]
    else:
        print ""
        print "Available Nodes:"

        nodeNameList = []

        for item in nodeList:
            item = item.rstrip()
            name = getName(item) 

            nodeNameList.append(name)
            print "   " + name

        DefaultNode = nodeNameList[0]
        if (prompt == ""):
            prompt = "Select the desired node"

        nodeName = getValidInput(prompt+" ["+DefaultNode+"]:", DefaultNode, nodeNameList )

        index = nodeNameList.index(nodeName)
        node = nodeList[index]

    return node


def getServerId (prompt):
    serverList = AdminConfig.list("Server").split("\n")

    if (len(serverList) == 1):
        server = serverList[0]
    else:
        print ""
        print "Available Servers:"

        serverNameList = []

        for item in serverList:
            item = item.rstrip()
            name = getName(item)

            serverNameList.append(name)
            print "   " + name

        DefaultServer = serverNameList[0]
        if (prompt == ""):
            prompt = "Select the desired server"
        serverName = getValidInput(prompt+" ["+DefaultServer+"]:", DefaultServer, serverNameList )

        index = serverNameList.index(serverName)
        server = serverList[index]

    return server


def getName (objectId):
    endIndex = (objectId.find("(c") - 1)
    stIndex = 0
    if (objectId.find("\"") == 0):
        stIndex = 1
    return objectId[stIndex:endIndex+1]

print 'AdminControl help:'
AdminControl.help()

print 'Starting application configuration...'

node = getName(getNodeId(""))
server = getName(getServerId(""))

try:
    application = sys.argv[0]
    print 'applicationame: ' + application
except IndexError:
    raise SystemExit("Missing required paramater: <applicationame>")
try:
    archpath = sys.argv[1]
    print 'archivepath: ' + archpath
except IndexError:
    raise SystemExit("Missing required paramater: <archivepath>")

apps = AdminApp.list()
if application  in apps:
  print 'Uninstalling application: ' + application
  AdminApp.uninstall(application)
  AdminConfig.save()
  print 'Uninstalled app!'
print 'Done!'

parms  = ' -blaname "WebSphere:blaname=HelloWorld,blaedition=BASE"'
parms += "-appname " + application
parms += ' -nodeployejb  -usedefaultbindings -createMBeansForResources -noreloadEnabled -custom enhancedEarDisableValidation=true'
parms += " -node " + node + " -server " + server
parms += " -nouseMetaDataFromBinary"
app = AdminApp.install('/work/config/'+archpath, [parms])

AdminTask.setGenericJVMArguments('[-nodeName ' + node + ' -serverName ' + server + ' -genericJvmArguments "-Xnoloa"]')
AdminConfig.save()

appManager = AdminControl.queryNames('node='+node+',type=ApplicationManager,process='+server+',*')
AdminControl.invoke(appManager, 'startApplication', application)
AdminConfig.save()