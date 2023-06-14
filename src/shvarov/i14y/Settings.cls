Class shvarov.i14y.Settings
{

ClassMethod SetValue(ProductionName As %String, ItemName As %String, Setting As %String, Value As %String) As %Status
{
    return:$g(ItemName)="" $$$ERROR($$$GeneralError,"The ItemName shouldn't be empty")
    return:$g(Setting)="" $$$ERROR($$$GeneralError,"The Setting shouldn't be empty")

    set tProduction = ##class(Ens.Config.Production).%OpenId(ProductionName)
    return:'$IsObject(tProduction) $$$ERROR($$$GeneralError,"Production with name "_ProductionName_" is not found")
    #dim tItem As Ens.Config.Item
    #dim tSetting As Ens.Config.Setting

    set tItem = tProduction.FindItemByConfigName(ItemName, .tSC, 1)
    if ('$isobject(tItem)) {
        return $$$ERROR($$$GeneralError,"The item "_ItemName_" in Production "_ProductionName_" is not found")
    }
    set tSetting = tItem.FindSettingByName(Setting)
    if ($isobject(tSetting)) {
        set tSetting.Value = Value
        set tSC = tProduction.%Save()
        return:$$$ISERR(tSC) tSC
        return tProduction.SaveToClass()
    } else {
        Set tSC = ##class(EnsPortal.Utils).ItemSettings(ProductionName_"||"_ItemName, .pData, .pMetaData)
        return:$$$ISERR(tSC) tSC
        set key = ""
        for {
            set key = $order(pData(key))
            quit:(key = "")
            set sName = $listget(pData(key),2)
            set sTarget = $listget(pData(key),1)
            if (Setting = sName) {
                if (sTarget = "Core") {
                    // skip, core settings like Enabled shouldn't be modified from here
                } else {
                    set ecs = ##class(Ens.Config.Setting).%New()
                    set ecs.Name = sName
                    set ecs.Target = sTarget
                    set ecs.Value = Value
                    do tItem.Settings.Insert(ecs)
                    set tSC = tItem.%Save()
                    return:$$$ISERR(tSC) tSC
                    return tProduction.SaveToClass()
                }
            }
        }
    }
    return $$$ERROR($$$GeneralError,"The setting "_Setting_" for the item "_ItemName_" is not found.")
}

/// search only in defined settings
ClassMethod GetValue(ProductionName As %String, ItemName As %String, Setting As %String, Output tSC As %Status) As %String
{
    return:$g(ItemName)="" $$$ERROR($$$GeneralError,"The ItemName shouldn't be empty")
    return:$g(Setting)="" $$$ERROR($$$GeneralError,"The Setting shouldn't be empty")

    set tProduction = ##class(Ens.Config.Production).%OpenId(ProductionName)
    return:'$IsObject(tProduction) $$$ERROR($$$GeneralError,"Production with name "_ProductionName_" is not found")
    #dim tItem As Ens.Config.Item
    #dim tSetting As Ens.Config.Setting

    set tItem = tProduction.FindItemByConfigName(ItemName, .tSC, 1)
    if ('$isobject(tItem)) {
        set tSC = $$$ERROR($$$GeneralError,"The item "_ItemName_" in Production "_ProductionName_" is not found")
        return ""
    }
    set tSetting = tItem.FindSettingByName(Setting)
    if ('$isobject(tSetting)) {
        set tSC = $$$ERROR($$$GeneralError,"The setting "_Setting_" for the item "_ItemName_" is not found. Try to introduce it into the production")
        return ""
    }
    return tSetting.Value
}

}
