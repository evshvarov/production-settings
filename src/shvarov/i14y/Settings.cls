Class shvarov.i14y.Settings
{

ClassMethod SetValue(ProductionName As %String, ItemName As %String, Setting As %String, Value As %String) As %Status
{
    return:$g(ItemName)="" $$$ERROR($$$GeneralError,"The ItemName shouldn't be empty")
    return:$g(Setting)="" $$$ERROR($$$GeneralError,"The Setting shouldn't be empty")

    set production = ##class(Ens.Config.Production).%OpenId(ProductionName)
    return:'$IsObject(production) $$$ERROR($$$GeneralError,"Production with name "_ProductionName_" is not found")
    #dim item As Ens.Config.Item
    #dim sett As Ens.Config.Setting

    for i=1:1:production.Items.Count() {
    s item=production.Items.GetAt(i)
    #; w !,item.Name
    if item.Name=ItemName {
        set itemExists=1
        for s=1:1:item.Settings.Count() {
            set sett=item.Settings.GetAt(s)
            #; w !,sett.Name
            if sett.Name=Setting
                {
                set sett.Value=Value
                Quit
                }
            }
        }

    set st=production.%Save()
    return st
    }
    return:$g(itemExists) $$$ERROR($$$GeneralError,"The setting "_Setting_" for the item "_ItemName_" is not found. Try to introduce it into the production")
    return $$$ERROR($$$GeneralError,"The item "_ItemName_" in Production "_ProductionName_" is not found")
}

ClassMethod GetValue(ProductionName As %String, ItemName As %String, Setting As %String) As %String
{
    return:$g(ItemName)="" $$$ERROR($$$GeneralError,"The ItemName shouldn't be empty")
    return:$g(Setting)="" $$$ERROR($$$GeneralError,"The Setting shouldn't be empty")

    set p = ##class(Ens.Config.Production).%OpenId(ProductionName)
    return:'$IsObject(p) $$$ERROR($$$GeneralError,"Production with name "_ProductionName_" is not found")
    #dim item As Ens.Config.Item
    #dim sett As Ens.Config.Setting

    for i=1:1:p.Items.Count() {
    s item=p.Items.GetAt(i)
        #; w !,item.Name
    if item.Name=ItemName {
        set itemExists=1
        for s=1:1:item.Settings.Count() {

            set sett=item.Settings.GetAt(s)
            #; w !,sett.Name
            if sett.Name=Setting return sett.Value
            }
        }
    }
    return:$g(itemExists) $$$ERROR($$$GeneralError,"The setting "_Setting_" for the item "_ItemName_" is not found. Try to introduce it into the production")
    return $$$ERROR($$$GeneralError,"The item "_ItemName_" in Production "_ProductionName_" is not found")
}

}
