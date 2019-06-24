class lib.util.CurrencyFormat
{
   static var currencySeparater = "$005006";
   function CurrencyFormat()
   {
   }
   static function makeComma(strData)
   {
      strData = String(strData);
      var _loc6_ = false;
      if(strData.substr(0,1) == "-")
      {
         _loc6_ = true;
         strData = strData.substr(1);
      }
      var _loc3_ = strData.length;
      var _loc2_ = "";
      if(_loc3_ > 3)
      {
         var _loc5_ = _loc3_ % 3;
         _loc2_ = strData.substr(0,_loc5_);
         if(_loc5_ != 0)
         {
            _loc2_ = _loc2_ + lib.util.UIString.getUIString(lib.util.CurrencyFormat.currencySeparater);
         }
         var _loc1_ = _loc5_;
         while(_loc1_ < _loc3_)
         {
            _loc2_ = _loc2_ + strData.substr(_loc1_,3);
            if(_loc1_ + 3 < _loc3_)
            {
               _loc2_ = _loc2_ + lib.util.UIString.getUIString(lib.util.CurrencyFormat.currencySeparater);
            }
            _loc1_ = _loc1_ + 3;
         }
         if(_loc6_)
         {
            _loc2_ = "-" + _loc2_;
         }
         return _loc2_;
      }
      if(_loc6_)
      {
         strData = "-" + strData;
      }
      return strData;
   }
}
