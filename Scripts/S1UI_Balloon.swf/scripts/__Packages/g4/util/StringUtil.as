class g4.util.StringUtil
{
   function StringUtil()
   {
   }
   static function toHTMLColorFormat(color)
   {
      return "#" + color.toString(16);
   }
   static function isNull(text)
   {
      return text == null || text.length == 0;
   }
   static function trim(str)
   {
      if(str == null)
      {
         return "";
      }
      var _loc1_ = 0;
      while(g4.util.StringUtil.isWhitespace(str.charAt(_loc1_)))
      {
         _loc1_ = _loc1_ + 1;
      }
      var _loc2_ = str.length - 1;
      while(g4.util.StringUtil.isWhitespace(str.charAt(_loc2_)))
      {
         _loc2_ = _loc2_ - 1;
      }
      if(_loc2_ >= _loc1_)
      {
         return str.slice(_loc1_,_loc2_ + 1);
      }
      return "";
   }
   static function isWhitespace(character)
   {
      switch(character)
      {
         case " ":
         case "\t":
         case "\r":
         case "\n":
         case "\f":
            return true;
         default:
            return false;
      }
   }
}
