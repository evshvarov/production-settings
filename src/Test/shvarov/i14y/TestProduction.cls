Class Test.shvarov.i14y.TestProduction Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="Test.shvarov.i14y.TestProduction" LogGeneralTraceEvents="false">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="InboundService" Category="" ClassName="EnsLib.HTTP.GenericService" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Port">2222</Setting>
  </Item>
</Production>
}

}
