class lib.util.StrByteLen
{
   static var str3 = "";
   function StrByteLen()
   {
   }
   static function getLenth2(str)
   {
      var _loc3_ = str.length;
      var _loc2_ = 0;
      var _loc1_ = 0;
      while(_loc1_ < _loc3_)
      {
         if(lib.util.StrByteLen.is2Bytes(str.charCodeAt(_loc1_)))
         {
            _loc2_ = _loc2_ + 2;
         }
         else
         {
            _loc2_ = _loc2_ + 1;
         }
         _loc1_ = _loc1_ + 1;
      }
      return _loc2_;
   }
   static function getLenth3(mc, lens)
   {
      var _loc3_ = "";
      _loc3_ = mc.text;
      lib.Debuger.trace("str : " + _loc3_);
      lib.Debuger.trace("lens : " + lens);
      var _loc4_ = _loc3_.length;
      var _loc2_ = 0;
      var _loc1_ = 0;
      while(_loc1_ < _loc4_)
      {
         if(lib.util.StrByteLen.is2Bytes(_loc3_.charCodeAt(_loc1_)))
         {
            _loc2_ = _loc2_ + 2;
         }
         else
         {
            _loc2_ = _loc2_ + 1;
         }
         _loc1_ = _loc1_ + 1;
      }
      lib.Debuger.trace("len : " + _loc2_);
      if(_loc2_ <= lens)
      {
         lib.util.StrByteLen.str3 = mc.text;
      }
      if(_loc2_ > lens)
      {
         mc.text = "";
         mc.text = lib.util.StrByteLen.str3;
         Selection.setSelection(lens,lens);
      }
      return _loc2_;
   }
   static function is2Bytes(c)
   {
      lib.Debuger.trace("c :: " + c);
      if(c > 0 && c < 255)
      {
         return false;
      }
      return true;
   }
}
