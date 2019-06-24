class g4.view.debugger.test.testData.UITestDataModel extends g4.view.debugger.test.testData.TestDataModel
{
   function UITestDataModel(uiName, name, testDatas)
   {
      super(this.getNameFinal(uiName,name),null,null,null,this.getTestDatasFinal(testDatas));
   }
   function __get__uiName()
   {
      return this._uiName;
   }
   function getNameFinal(uiName, name)
   {
      this._uiName = uiName;
      var _loc2_ = uiName;
      if(name != null && name.length > 0)
      {
         _loc2_ = _loc2_ + (" (" + name + ")");
      }
      return _loc2_;
   }
   function getTestDatasFinal(testDatas)
   {
      var _loc2_ = [new g4.view.debugger.test.testData.TestDataModel("UI 표시 O",this,this.openUI),new g4.view.debugger.test.testData.TestDataModel("UI 표시 X",this,this.closeUI)];
      if(testDatas != null && testDatas.length > 0)
      {
         _loc2_ = _loc2_.concat(testDatas);
      }
      return _loc2_;
   }
   function openUI()
   {
      g4.view.debugger.test.GameInterfaceProxy.openUI(this.__get__uiName(),mx.utils.Delegate.create(this,this.uiLoadComplete));
   }
   function closeUI()
   {
      g4.view.debugger.test.GameInterfaceProxy.closeUI(this.__get__uiName());
   }
   function uiLoadComplete()
   {
   }
}
