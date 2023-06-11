 [![Gitter](https://img.shields.io/badge/Available%20on-Intersystems%20Open%20Exchange-00b2a9.svg)](https://openexchange.intersystems.com/package/intersystems-iris-dev-template)
 [![Quality Gate Status](https://community.objectscriptquality.com/api/project_badges/measure?project=intersystems_iris_community%2Fintersystems-iris-dev-template&metric=alert_status)](https://community.objectscriptquality.com/dashboard?id=intersystems_iris_community%2Fintersystems-iris-dev-template)
 [![Reliability Rating](https://community.objectscriptquality.com/api/project_badges/measure?project=intersystems_iris_community%2Fintersystems-iris-dev-template&metric=reliability_rating)](https://community.objectscriptquality.com/dashboard?id=intersystems_iris_community%2Fintersystems-iris-dev-template)

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg?style=flat&logo=AdGuard)](LICENSE)
# production settings helper
This util helps to init InterSystems Interoperability production with certain values. It can let you init the value for a given production, production item (business service, operation, etc) and a given setting.
## Description
Sometimes we need to init the production before start. It could be different API keys, secrets, tokens, etc.
This utility will help to simplify the process.


## Installation

```
zpm "install production-settings"
```

## Usage
Consider you have a production where you want to change the port for the HTTP Inbound Service. This is the line you can use:
```
do ##class(shvarov.i14y.Settings).SetValue("ProductionName","ServiceOrOperationName","Setting",Value)
```

For example:
```
do ##class(shvarov.i14y.Settings).SetValue("Test.shvarov.i14y.TestProduction","InboundService","Port",8888)

```

Similar if you want to obtain the current setting from the production element you can use:

```
w ##class(shvarov.i14y.Settings).GetValue("Test.shvarov.i14y.TestProduction","InboundService","Port")
```

## known issues
The utility works only for the settings that were preinitialized in the production. E.g. in the production below the setting **Port** could be altered:
```
<Production Name="Test.shvarov.i14y.TestProduction" LogGeneralTraceEvents="false">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="InboundService" Category="" ClassName="EnsLib.HTTP.GenericService" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Port">2222</Setting>
  </Item>
</Production>

```

