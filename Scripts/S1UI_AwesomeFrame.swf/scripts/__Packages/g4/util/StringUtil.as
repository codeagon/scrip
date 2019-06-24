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
   static function replace(source, oldText, newText)
   {
      return source.split(oldText).join(newText);
   }
   static function addZeroNumber(value)
   {
      var _loc2_ = Number(value) >= 10?String(value):"0" + value;
      return _loc2_;
   }
   static function formatNumber(myNum, precision, keepSigFig, round)
   {
      if(isNaN(myNum))
      {
         return "0";
      }
      if(keepSigFig == undefined)
      {
         keepSigFig = false;
      }
      if(precision == undefined)
      {
         precision = 0;
      }
      precision = Math.abs(precision);
      var _loc4_ = Number(Math.abs(myNum).toString());
      _loc4_ = Math.floor(_loc4_);
      var _loc1_ = myNum >= 0?"":"-";
      var _loc3_ = _loc4_.toString().length;
      var _loc2_ = 0;
      while(_loc2_ < _loc3_)
      {
         if((_loc3_ - _loc2_) % 3 == 0 && _loc2_ != 0)
         {
            _loc1_ = _loc1_ + ",";
         }
         _loc1_ = _loc1_ + _loc4_.toString().charAt(_loc2_);
         _loc2_ = _loc2_ + 1;
      }
      if(precision == 0)
      {
         return _loc1_;
      }
      var _loc5_ = Math.abs(myNum) * Math.pow(10,precision);
      if(_loc5_.toString().indexOf(".") != -1)
      {
         if(round)
         {
            _loc5_ = Math.round(_loc5_);
         }
         else
         {
            _loc5_ = Math.floor(_loc5_);
         }
      }
      _loc1_ = _loc1_ + ("." + ("0000000000000" + _loc5_.toString()).substr(- precision));
      if(_loc1_.substr(-1) == ".")
      {
         _loc1_ = _loc1_.slice(0,-1);
      }
      else if(keepSigFig == false)
      {
         while(_loc1_.substr(-1) == "0")
         {
            _loc1_ = _loc1_.slice(0,-1);
         }
         if(_loc1_.substr(-1) == ".")
         {
            _loc1_ = _loc1_.slice(0,-1);
         }
      }
      if(_loc1_ == "-0")
      {
         _loc1_ = "0";
      }
      return _loc1_;
   }
   static function GetOrdinalNumber(num)
   {
      num = Math.floor(num);
      var _loc3_ = num % 100;
      var _loc2_ = num % 10;
      if(num <= 0)
      {
         return num.toString();
      }
      if(_loc2_ == 1 && _loc3_ != 11)
      {
         return num.toString() + "st";
      }
      if(_loc2_ == 2 && _loc3_ != 12)
      {
         return num.toString() + "nd";
      }
      if(_loc2_ == 3 && _loc3_ != 13)
      {
         return num.toString() + "rd";
      }
      return num.toString() + "th";
   }
   static function reduce(strLen, str, isCheckedByte)
   {
      if(isCheckedByte == undefined)
      {
         isCheckedByte = true;
      }
      var _loc3_ = "";
      if(isCheckedByte)
      {
         var _loc4_ = 0;
         var _loc7_ = "";
         var _loc1_ = 0;
         while(_loc1_ < str.length)
         {
            _loc4_ = _loc4_ + (str.charCodeAt(_loc1_) <= 128?0.5:1);
            if(_loc4_ >= strLen)
            {
               _loc3_ = _loc3_ + "...";
               break;
            }
            _loc3_ = _loc3_ + str.charAt(_loc1_);
            _loc1_ = _loc1_ + 1;
         }
      }
      else if(str.length > strLen)
      {
         _loc3_ = str.substring(0,strLen) + "...";
      }
      else
      {
         _loc3_ = str;
      }
      return _loc3_;
   }
}
