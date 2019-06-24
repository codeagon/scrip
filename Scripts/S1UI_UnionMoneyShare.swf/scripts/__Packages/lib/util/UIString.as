class lib.util.UIString
{
   function UIString()
   {
   }
   static function getUIString()
   {
      var _loc5_ = undefined;
      var _loc3_ = "";
      var _loc2_ = String(arguments.shift());
      var _loc4_ = _loc2_.indexOf("$");
      if(_loc4_ >= 0)
      {
         _loc2_ = _loc2_.substr(_loc4_ + 1,_loc2_.length);
      }
      if(arguments.length > 1)
      {
         _loc3_ = "\\v" + arguments.join("\\v");
      }
      _loc5_ = "@ui:" + _loc2_ + _loc3_;
      return flash.external.ExternalInterface.call("GetUIString",_loc5_);
   }
}
