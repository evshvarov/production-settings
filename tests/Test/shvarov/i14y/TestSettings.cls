Class Test.shvarov.i14y.TestSettings Extends %UnitTest.TestCase
{

Method OnBeforeAllTests() As %Status
{
   Return $$$OK
}

Method TestSetValue() As %Status
{
    set production="Test.shvarov.i14y.TestProduction"
    set item="InboundService"
    set setting="Port"
    set value=8888
    Set tExpected=value
	set st=##class(shvarov.i14y.Settings).SetValue(production,item,setting,value)
	set tResults=##class(shvarov.i14y.Settings).GetValue(production,item,setting)
	Do $$$AssertEquals(tResults,tExpected,tExpected_" = "_tResults)
}

Method TestWrongProduction() As %Status
{
    set production="NotExistingProduction"
    set item="InboundService"
    set setting="Port"
    set value=8888
    Set tExpected=value
	set st=##class(shvarov.i14y.Settings).SetValue(production,item,setting,value)
	set tResults=##class(shvarov.i14y.Settings).GetValue(production,item,setting)
	Do $$$AssertNotEquals(tResults,tExpected,tExpected_" = "_tResults)
}

Method TestWrongItem() As %Status
{
    set production="Test.shvarov.i14y.TestProduction"
    set item="NotExistingItem"
    set setting="Port"
    set value=8888
    Set tExpected=value
	set st=##class(shvarov.i14y.Settings).SetValue(production,item,setting,value)
	set tResults=##class(shvarov.i14y.Settings).GetValue(production,item,setting)
	Do $$$AssertNotEquals(tResults,tExpected,tExpected_" = "_tResults)
}

Method TestWrongSetting() As %Status
{
    set production="Test.shvarov.i14y.TestProduction"
    set item="InboundService"
    set setting="WhateverSetting"
    set value=8888
    Set tExpected=value
	set st=##class(shvarov.i14y.Settings).SetValue(production,item,setting,value)
	set tResults=##class(shvarov.i14y.Settings).GetValue(production,item,setting)
	Do $$$AssertNotEquals(tResults,tExpected,tExpected_" = "_tResults)
}

}
