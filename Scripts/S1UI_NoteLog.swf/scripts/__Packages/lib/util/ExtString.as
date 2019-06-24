class lib.util.ExtString
{
   function ExtString()
   {
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
      var _loc1_ = str.split("");
      var _loc2_ = 0;
      while(_loc2_ < _loc1_.length)
      {
         if(isNaN(_loc1_[_loc2_]))
         {
            _loc1_.splice(_loc2_,1);
            _loc2_ = _loc2_ - 1;
         }
         _loc2_ = _loc2_ + 1;
      }
      var _loc3_ = 0;
      while(_loc1_.length > _loc3_ && _loc1_.length > 1)
      {
         if(_loc1_[0] == "0")
         {
            _loc1_.shift();
         }
         else
         {
            _loc3_ = _loc3_ + 1;
         }
      }
      return _loc1_.join("");
   }
   static function textCut(textFd, str)
   {
      if(textFd.html)
      {
         textFd.htmlText = str;
      }
      else
      {
         textFd.text = str;
      }
      var _loc3_ = textFd.getLineMetrics(0);
      var _loc4_ = undefined;
      var _loc7_ = undefined;
      var _loc5_ = textFd.text.length;
      if(!textFd.multiline)
      {
         _loc4_ = 2;
         var _loc8_ = textFd._width - 2;
         endIndex = textFd.getCharIndexAtPoint(_loc8_,_loc4_);
      }
      else
      {
         _loc4_ = _loc3_.ascent + _loc3_.descent + _loc3_.leading;
         _loc7_ = int(textFd._height / _loc4_);
         var endIndex = textFd.getLineOffset(_loc7_);
      }
      if(_loc5_ > endIndex && endIndex != -1)
      {
         textFd.replaceText(endIndex - 2,_loc5_,"...");
         if(arguments[2])
         {
            lib.manager.ToolTip.add(textFd,str,1);
         }
      }
      else if(arguments[2])
      {
         lib.manager.ToolTip.remove(textFd);
      }
   }
   static function isOverLenght(textFd, str)
   {
      if(textFd.html)
      {
         textFd.htmlText = str;
      }
      else
      {
         textFd.text = str;
      }
      var _loc2_ = textFd.getLineMetrics(0);
      var _loc3_ = undefined;
      var _loc5_ = undefined;
      var _loc4_ = textFd.text.length;
      if(!textFd.multiline)
      {
         _loc3_ = 2;
         var _loc6_ = textFd._width - 2;
         endIndex = textFd.getCharIndexAtPoint(_loc6_,_loc3_);
      }
      else
      {
         _loc3_ = _loc2_.ascent + _loc2_.descent + _loc2_.leading;
         _loc5_ = int(textFd._height / _loc3_);
         var endIndex = textFd.getLineOffset(_loc5_);
      }
      trace("stringIndex  " + _loc4_);
      trace("endIndex  " + endIndex);
      return _loc4_ > endIndex && endIndex != -1;
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
   static function alignJoint(textFd, str)
   {
      var _loc4_ = 0;
      var _loc10_ = 2;
      var _loc11_ = textFd._width - 4;
      var _loc12_ = 0;
      while(textFd.numLines > _loc4_)
      {
         var _loc3_ = textFd.getLineMetrics(_loc4_);
         _loc10_ = _loc10_ + (_loc3_.ascent + _loc3_.descent + _loc3_.leading);
         var _loc7_ = 0;
         var _loc9_ = _loc11_ - _loc3_.width;
         var _loc2_ = textFd.getCharIndexAtPoint(_loc7_ + _loc9_,_loc10_);
         var _loc5_ = textFd.getLineText(_loc4_);
         var _loc8_ = _loc5_.charCodeAt(_loc5_.length - 1);
         var _loc6_ = Number(textFd.text.charCodeAt(_loc2_));
         if(!(_loc6_ >= 65 && _loc6_ <= 122) && _loc8_ != 13 && _loc2_ >= 0)
         {
            textFd.replaceText(_loc2_,_loc2_," ");
         }
         _loc4_ = _loc4_ + 1;
      }
   }
}
