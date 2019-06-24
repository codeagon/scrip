class lib.Debuger
{
   function Debuger()
   {
   }
   static function init(_debugerModuel)
   {
      if(_debugerModuel != undefined)
      {
         lib.Debuger.debugerModuel = _debugerModuel;
         var _loc2_ = new Object();
         _global.EventBroadCaster.addListener(_loc2_);
      }
   }
   static function trace(str)
   {
      trace(str);
      lib.Debuger.debugerModuel.inputText(1,str);
   }
}
