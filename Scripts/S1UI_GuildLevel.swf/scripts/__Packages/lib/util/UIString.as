class lib.util.UIString
{
   function UIString()
   {
   }
   static function getUIString()
   {
      var _loc5_ = undefined;
      var _loc4_ = "";
      var _loc2_ = String(arguments.shift());
      var _loc3_ = _loc2_.indexOf("$");
      trace(_loc3_);
      if(_loc3_ >= 0)
      {
         _loc2_ = _loc2_.substr(_loc3_ + 1,_loc2_.length);
      }
      if(arguments.length > 1)
      {
         _loc4_ = "\\v" + arguments.join("\\v");
      }
      _loc5_ = "@ui:" + _loc2_ + _loc4_;
      return flash.external.ExternalInterface.call("GetUIString",_loc5_);
   }
}
