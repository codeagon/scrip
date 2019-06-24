class lib.util.UIString
{
   function UIString()
   {
   }
   static function getUIString()
   {
      lib.Debuger.trace("GetUIString>>>>>>> " + arguments);
      var _loc5_ = undefined;
      var _loc3_ = "";
      var _loc2_ = String(arguments.shift());
      var _loc4_ = _loc2_.indexOf("$");
      trace(_loc4_);
      if(_loc4_ >= 0)
      {
         _loc2_ = _loc2_.substr(_loc4_ + 1,_loc2_.length);
      }
      if(arguments.length > 1)
      {
         _loc3_ = "\\v" + arguments.join("\\v");
      }
      _loc5_ = "@ui:" + _loc2_ + _loc3_;
      lib.Debuger.trace("id : " + _loc2_);
      lib.Debuger.trace("values : " + _loc3_);
      lib.Debuger.trace("arg : " + _loc5_);
      return flash.external.ExternalInterface.call("GetUIString",_loc5_);
   }
}
