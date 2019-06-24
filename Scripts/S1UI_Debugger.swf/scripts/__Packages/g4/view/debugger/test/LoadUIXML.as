class g4.view.debugger.test.LoadUIXML
{
   function LoadUIXML()
   {
      super();
      this.uiDataMap = {};
   }
   static function getInstance()
   {
      if(g4.view.debugger.test.LoadUIXML.instance == null)
      {
         g4.view.debugger.test.LoadUIXML.instance = new g4.view.debugger.test.LoadUIXML();
      }
      return g4.view.debugger.test.LoadUIXML.instance;
   }
   static function load(loadCompletedFunc)
   {
      g4.view.debugger.test.LoadUIXML.getInstance()._load(loadCompletedFunc);
   }
   static function getUIData(name)
   {
      return g4.view.debugger.test.LoadUIXML.getInstance()._getUIData(name);
   }
   function _load(loadCompletedFunc)
   {
      this.loadCompletedFunc = loadCompletedFunc;
      this.xml = new XML();
      this.xml.onData = mx.utils.Delegate.create(this,this.xml_onDataHandler);
      this.xml.load("LoadUI.xml");
   }
   function _getUIData(name)
   {
      return this.uiDataMap[name];
   }
   function xml_onDataHandler(str)
   {
      if(str == null || str.length == 0)
      {
         trace("LoadUI.xml file not found!");
         return undefined;
      }
      this.xml.parseXML(str);
      var _loc6_ = this.xml.childNodes[0].childNodes;
      var _loc5_ = undefined;
      var _loc2_ = undefined;
      var _loc4_ = undefined;
      var _loc7_ = _loc6_.length;
      _loc4_ = 0;
      while(_loc4_ < _loc7_)
      {
         _loc2_ = _loc6_[_loc4_].attributes;
         var _loc3_ = _loc2_.fileName;
         _loc3_ = _loc3_.substr(_loc3_.indexOf("/") + 1);
         _loc5_ = new g4.view.debugger.test.UIData(_loc2_.name,_loc3_,Number(_loc2_.x),Number(_loc2_.y),g4.util.Converter.toBoolean(_loc2_.alwaysloaded),Number(_loc2_.group),g4.util.Converter.toBoolean(_loc2_.logoutclose),_loc2_.sound,_loc2_.arguments);
         this.uiDataMap[_loc2_.name] = _loc5_;
         _loc4_ = _loc4_ + 1;
      }
      this.loadCompletedFunc();
      this.xml = null;
      this.loadCompletedFunc = null;
   }
}
