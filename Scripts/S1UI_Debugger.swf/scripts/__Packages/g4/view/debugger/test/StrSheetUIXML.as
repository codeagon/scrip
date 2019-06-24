class g4.view.debugger.test.StrSheetUIXML
{
   function StrSheetUIXML()
   {
      super();
      this.strSheetMap = {};
   }
   static function getInstance()
   {
      if(g4.view.debugger.test.StrSheetUIXML.instance == null)
      {
         g4.view.debugger.test.StrSheetUIXML.instance = new g4.view.debugger.test.StrSheetUIXML();
      }
      return g4.view.debugger.test.StrSheetUIXML.instance;
   }
   static function load(loadCompletedFunc)
   {
      g4.view.debugger.test.StrSheetUIXML.getInstance()._load(loadCompletedFunc);
   }
   function _load(loadCompletedFunc)
   {
      this.loadCompletedFunc = loadCompletedFunc;
      this.xml = new XML();
      this.xml.onData = gfx.utils.Delegate.create(this,this.xml_onDataHandler);
      this.xml.load("StrSheet_UI.xml");
   }
   function getUIString()
   {
      if(arguments == null || arguments.length == 0)
      {
         return "";
      }
      var _loc4_ = this.strSheetMap[arguments[0]];
      if(_loc4_ == null)
      {
         return "";
      }
      if(arguments.length > 1)
      {
         arguments.shift();
         var _loc3_ = 0;
         var _loc7_ = arguments.length;
         if(_loc7_ % 2 == 1)
         {
            _loc7_ = _loc7_ - 1;
         }
         var _loc6_ = undefined;
         var _loc5_ = undefined;
         _loc3_ = 0;
         while(_loc3_ < _loc7_)
         {
            _loc6_ = arguments[_loc3_];
            _loc5_ = arguments[_loc3_ + 1];
            _loc4_ = _loc4_.split("{" + _loc6_ + "}").join(_loc5_);
            _loc3_ = _loc3_ + 2;
         }
      }
      return _loc4_;
   }
   function xml_onDataHandler(str)
   {
      if(str == null || str.length == 0)
      {
         trace("StrSheet_UI.xml file not found!");
         return undefined;
      }
      this.xml.parseXML(str);
      var _loc4_ = this.xml.childNodes[0].childNodes;
      var _loc3_ = undefined;
      var _loc2_ = undefined;
      var _loc5_ = _loc4_.length;
      _loc2_ = 0;
      while(_loc2_ < _loc5_)
      {
         _loc3_ = _loc4_[_loc2_].attributes;
         this.strSheetMap[_loc3_.stringId] = _loc3_.string;
         _loc2_ = _loc2_ + 1;
      }
      lib.util.UIString.getUIString = gfx.utils.Delegate.create(this,this.getUIString);
      this.loadCompletedFunc();
      this.xml = null;
      this.loadCompletedFunc = null;
   }
}
