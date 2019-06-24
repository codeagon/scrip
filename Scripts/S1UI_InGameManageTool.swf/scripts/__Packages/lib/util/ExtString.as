class lib.util.ExtString extends String
{
   function ExtString(string)
   {
      super(string);
   }
   static function replace(str, search, replace, matchCase)
   {
      if(matchCase == undefined)
      {
         matchCase = false;
      }
      var _loc3_ = "";
      var _loc6_ = str;
      if(!matchCase)
      {
         _loc6_ = str.toLowerCase();
         search = search.toLowerCase();
      }
      var _loc2_ = -1;
      var _loc1_ = 0;
      while((_loc2_ = _loc6_.indexOf(search,_loc1_)) != -1)
      {
         _loc3_ = _loc3_ + str.substring(_loc1_,_loc2_);
         _loc3_ = _loc3_ + replace;
         _loc1_ = _loc2_ + search.length;
      }
      return _loc3_ + str.substring(_loc1_);
   }
   static function trim(str)
   {
      var _loc1_ = str.split("");
      var _loc2_ = 0;
      while(_loc2_ < _loc1_.length)
      {
         if(_loc1_[_loc2_] == "\r" || _loc1_[_loc2_] == "\n" || _loc1_[_loc2_] == "\f" || _loc1_[_loc2_] == "\t" || _loc1_[_loc2_] == " ")
         {
            _loc1_.splice(_loc2_,1);
            _loc2_ = _loc2_ - 1;
            _loc2_ = _loc2_ + 1;
            continue;
         }
         break;
      }
      _loc2_ = _loc1_.length - 1;
      while(_loc2_ >= 0)
      {
         if(_loc1_[_loc2_] == "\r" || _loc1_[_loc2_] == "\n" || _loc1_[_loc2_] == "\f" || _loc1_[_loc2_] == "\t" || _loc1_[_loc2_] == " ")
         {
            _loc1_.splice(_loc2_,1);
            _loc2_ = _loc2_ - 1;
            continue;
         }
         break;
      }
      return _loc1_.join("");
   }
   static function trimChar(str)
   {
      var _loc2_ = str.split("");
      var _loc1_ = 0;
      while(_loc1_ < _loc2_.length)
      {
         if(isNaN(_loc2_[_loc1_]))
         {
            _loc2_.splice(_loc1_,1);
            _loc1_ = _loc1_ - 1;
         }
         _loc1_ = _loc1_ + 1;
      }
      return _loc2_.join("");
   }
   static function textCut(textFd, str)
   {
      textFd.text = str;
      var _loc6_ = textFd._width;
      var _loc5_ = textFd.textHeight;
      var _loc3_ = textFd.getCharIndexAtPoint(_loc6_,_loc5_);
      var _loc7_ = undefined;
      if(_loc3_ < textFd.text.length && _loc3_ != -1)
      {
         textFd.text = str.slice(0,_loc3_ - 1) + "...";
         if(arguments[2] == undefined)
         {
            lib.manager.ToolTip.add(textFd,str,1);
         }
      }
      else
      {
         lib.manager.ToolTip.remove(textFd);
      }
      return undefined;
   }
   static function split(str, sep)
   {
      var _loc1_ = str.split(sep);
      var _loc2_ = _loc1_[_loc1_.length - 1];
      if(_loc2_ == undefined || _loc2_ == "")
      {
         _loc1_.pop();
      }
      return _loc1_;
   }
   static function decimal(str, count)
   {
      var _loc1_ = String(str).split(".");
      var _loc2_ = 0;
      if(_loc1_[0] == "")
      {
         _loc1_[0] = "0";
      }
      if(_loc1_[1] == undefined)
      {
         _loc1_[1] = "";
      }
      while(true)
      {
         _loc2_;
         if(_loc2_++ < count)
         {
            _loc1_[1] = _loc1_[1] + "0";
            continue;
         }
         break;
      }
      _loc1_[1] = _loc1_[1].slice(0,count);
      return _loc1_.join(".");
   }
}
