class g4.util.Converter
{
   function Converter()
   {
   }
   static function toBoolean(value)
   {
      var _loc1_ = Number(value);
      if(!isNaN(_loc1_))
      {
         return _loc1_ != 0;
      }
      return String(value).toLowerCase() == "true";
   }
   static function booleanToNumber(value)
   {
      return !value?0:1;
   }
   static function toNumber(value, defaultValue)
   {
      var _loc1_ = Number(value);
      if(isNaN(_loc1_))
      {
         if(isNaN(defaultValue))
         {
            _loc1_ = 0;
         }
         else
         {
            _loc1_ = defaultValue;
         }
      }
      return _loc1_;
   }
}
