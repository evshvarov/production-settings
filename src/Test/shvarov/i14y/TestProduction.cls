Class Test.shvarov.i14y.TestProduction Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="Test.shvarov.i14y.TestProduction" LogGeneralTraceEvents="false">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="InboundService" Category="" ClassName="EnsLib.HTTP.GenericService" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Port">9955</Setting>
  </Item>
  <Item Name="EnsLib.File.PassthroughService" Category="" ClassName="EnsLib.File.PassthroughService" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="FilePath">asdf</Setting>
    <Setting Target="Adapter" Name="ArchivePath">eee</Setting>
    <Setting Target="Adapter" Name="Charset">8859-5</Setting>
    <Setting Target="Adapter" Name="WorkPath">eee/eee</Setting>
  </Item>
  <Item Name="EnsLib.EMail.AlertOperation" Category="" ClassName="EnsLib.EMail.AlertOperation" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="SubjectPrefix">subj</Setting>
  </Item>
</Production>
}

}
