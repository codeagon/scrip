class gfx.data.DataProvider extends Array
{
   var isDataProvider = true;
   function DataProvider(total)
   {
      super();
      gfx.events.EventDispatcher.initialize(this);
   }
   static function initialize(data)
   {
      if(gfx.data.DataProvider.instance == undefined)
      {
         gfx.data.DataProvider.instance = new gfx.data.DataProvider();
      }
      var _loc3_ = ["indexOf","requestItemAt","requestItemRange","invalidate","toString","cleanUp","isDataProvider"];
      var _loc2_ = 0;
      while(_loc2_ < _loc3_.length)
      {
         data[_loc3_[_loc2_]] = gfx.data.DataProvider.instance[_loc3_[_loc2_]];
         _loc2_ = _loc2_ + 1;
      }
      gfx.events.EventDispatcher.initialize(data);
      _global.ASSetPropFlags(data,_loc3_,1);
      _global.ASSetPropFlags(data,"addEventListener,removeEventListener,hasEventListener,removeAllEventListeners,dispatchEvent,dispatchQueue,cleanUpEvents",1);
   }
   function indexOf(value, scope, callBack)
   {
      var _loc2_ = 0;
      _loc2_ = 0;
      while(_loc2_ < this.length)
      {
         if(this[_loc2_] == value)
         {
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
      var _loc4_ = _loc2_ != this.length?_loc2_:-1;
      if(callBack)
      {
         scope[callBack].call(scope,_loc4_);
      }
      return _loc4_;
   }
   function requestItemAt(index, scope, callBack)
   {
      var _loc2_ = this[index];
      if(callBack)
      {
         scope[callBack].call(scope,_loc2_);
      }
      return _loc2_;
   }
   function requestItemRange(startIndex, endIndex, scope, callBack)
   {
      var _loc2_ = this.slice(startIndex,endIndex + 1);
      if(callBack)
      {
         scope[callBack].call(scope,_loc2_);
      }
      return _loc2_;
   }
   function invalidate(length)
   {
      this.dispatchEvent({type:"change"});
   }
   function cleanUp()
   {
      this.splice(0,this.length);
      this.cleanUpEvents();
   }
   function toString()
   {
      return "[DataProvider (" + this.length + ")]";
   }
}
