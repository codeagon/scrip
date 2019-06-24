class lib.util.ExtString
{
   function ExtString()
   {
   }
   static function replace(str, search, replace, matchCase)
   {
      if(str == undefined)
      {
         return undefined;
      }
      if(matchCase == undefined)
      {
         matchCase = false;
      }
      var _loc1_ = "";
      var _loc6_ = str;
      if(!matchCase)
      {
         _loc6_ = str.toLowerCase();
         search = search.toLowerCase();
      }
      var _loc3_ = -1;
      var _loc2_ = 0;
      while((_loc3_ = _loc6_.indexOf(search,_loc2_)) != -1)
      {
         _loc1_ = _loc1_ + str.substring(_loc2_,_loc3_);
         _loc1_ = _loc1_ + replace;
         lib.Debuger.trace("R:" + _loc1_);
         _loc2_ = _loc3_ + search.length;
      }
      return _loc1_ + str.substring(_loc2_);
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
      var _loc3_ = Number(str);
      if(!isNaN(_loc3_))
      {
         return _loc3_;
      }
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
      textFd.fontScaleFactor = 1;
      textFd.wordWrap = true;
      if(textFd.html)
      {
         textFd.htmlText = str;
      }
      else
      {
         textFd.text = str;
      }
      var _loc11_ = textFd.getLineMetrics(0);
      var _loc14_ = _loc11_.ascent + _loc11_.descent + _loc11_.leading;
      var _loc6_ = int(textFd._height / _loc14_);
      var _loc12_ = String(textFd.text).length;
      var _loc9_ = textFd.getLineLength(_loc6_);
      var _loc3_ = 0;
      textFd.isTextCut = true;
      if(_loc6_ == 0)
      {
         return false;
      }
      var _loc5_ = 0;
      while(_loc5_ < _loc6_)
      {
         _loc3_ = _loc3_ + textFd.getLineLength(_loc5_);
         _loc5_ = _loc5_ + 1;
      }
      lib.manager.ToolTip.remove(textFd);
      var _loc8_ = textFd.getLineMetrics(_loc6_ - 1);
      if(_loc9_ > 0)
      {
         if(_loc9_ > 2)
         {
            var _loc7_ = textFd.getCharBoundaries(_loc3_ + 1).width;
            while(_loc8_.width + _loc7_ < textFd._width - 4)
            {
               _loc3_ = _loc3_ + 1;
               _loc7_ = _loc7_ + textFd.getCharBoundaries(_loc3_ + 1).width;
            }
            textFd.replaceText(_loc3_ - 1,_loc12_,"…");
            var _loc4_ = 0;
            while(textFd.getLineLength(_loc6_) > 0)
            {
               textFd.replaceText(_loc3_ - 1 - _loc4_,_loc3_ + 1 + _loc4_,"…");
               _loc4_ = _loc4_ + 1;
            }
            if(!textFd.multiline)
            {
               textFd.wordWrap = false;
            }
            if(arguments[2])
            {
               if(!textFd.html)
               {
                  str = lib.util.ExtString.replaceBracket(str);
               }
               lib.manager.ToolTip.add(textFd,str,1);
            }
         }
         else
         {
            var _loc13_ = _loc3_ / (_loc3_ + _loc9_);
            textFd.fontScaleFactor = _loc13_;
            if(textFd.html)
            {
               textFd.htmlText = textFd.htmlText + "";
            }
            else
            {
               textFd.text = textFd.text + "";
            }
            if(!textFd.multiline)
            {
               textFd.wordWrap = false;
            }
         }
         return true;
      }
      return false;
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
      var _loc4_ = undefined;
      var _loc5_ = textFd.text.length;
      if(!textFd.multiline)
      {
         _loc3_ = 2;
         var _loc6_ = textFd._width;
         endIndex = textFd.getCharIndexAtPoint(_loc6_,_loc3_);
      }
      else
      {
         _loc3_ = _loc2_.ascent + _loc2_.descent + _loc2_.leading;
         _loc4_ = int(textFd._height / _loc3_);
         var endIndex = textFd.getLineOffset(_loc4_);
      }
      return _loc5_ > endIndex && endIndex != -1;
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
         if(_loc6_ >= 44032 && _loc6_ <= 55203 && _loc2_ >= 0 && _loc8_ != 13)
         {
            textFd.replaceText(_loc2_,_loc2_," ");
         }
         _loc4_ = _loc4_ + 1;
      }
   }
   static function getStringByte(str)
   {
      var _loc4_ = str;
      var _loc2_ = 0;
      var _loc3_ = str.length;
      while(_loc3_ > 0)
      {
         _loc3_;
         var _loc1_ = _loc4_.charCodeAt(_loc3_--);
         _loc2_ = _loc2_ + 1;
         if(_loc1_ < 0 || _loc1_ > 120)
         {
            _loc2_ = _loc2_ + 1;
         }
      }
      return _loc2_;
   }
   static function indexOfTag(htmlString, tagStr)
   {
      htmlString = htmlString.toLowerCase();
      tagStr = tagStr.toLowerCase();
      var _loc10_ = arguments[2] != undefined?arguments[2]:0;
      var _loc6_ = 0;
      var _loc8_ = 0;
      var _loc7_ = htmlString.indexOf("<" + tagStr + " ",_loc10_);
      if(_loc7_ == -1)
      {
         _loc7_ = htmlString.indexOf("<" + tagStr + ">",_loc10_);
      }
      var _loc5_ = 0;
      while(_loc6_ < _loc7_)
      {
         var _loc2_ = htmlString.indexOf("<",_loc6_);
         _loc6_ = htmlString.indexOf(">",_loc2_);
         _loc5_ = _loc6_ - _loc2_ + 1;
         var _loc3_ = htmlString.substring(_loc2_,_loc2_ + 4);
         if(_loc3_.toLowerCase() == "<br>" || _loc3_.toLowerCase() == "</p>")
         {
            _loc5_ = _loc5_ - 1;
         }
         else if(_loc3_.toLowerCase() == "<img")
         {
            _loc3_ = htmlString.substring(_loc2_,_loc2_ + 5);
            if(_loc3_.toLowerCase() == "<img ")
            {
               _loc5_ = _loc5_ - 1;
            }
         }
         _loc8_ = _loc8_ + _loc5_;
      }
      return _loc7_ - (_loc8_ - _loc5_);
   }
   static function toHtmlIndex(fd, index)
   {
      var _loc5_ = fd.htmlText;
      var _loc3_ = _loc5_.indexOf("<",0);
      var _loc4_ = 0;
      var _loc6_ = 0;
      var _loc9_ = _loc5_.length;
      var _loc7_ = 0;
      while(_loc4_ != -1)
      {
         var _loc1_ = _loc5_.indexOf("<",_loc6_);
         _loc6_ = _loc5_.indexOf(">",_loc1_) + 1;
         if(_loc4_ != 0)
         {
            _loc3_ = _loc3_ + (_loc1_ - _loc4_);
         }
         if(_loc3_ >= index)
         {
            if(_loc4_ == 0)
            {
               return _loc3_;
            }
            return _loc1_ - (_loc3_ - index);
         }
         var _loc2_ = _loc5_.substring(_loc1_,_loc1_ + 4);
         if(_loc2_.toLowerCase() == "<br>" || _loc2_.toLowerCase() == "</p>")
         {
            _loc7_ = _loc7_ + 1;
            _loc3_ = _loc3_ + 1;
         }
         else if(_loc2_.toLowerCase() == "<img")
         {
            _loc2_ = _loc5_.substring(_loc1_,_loc1_ + 5);
            if(_loc2_.toLowerCase() == "<img ")
            {
               _loc7_ = _loc7_ + 1;
               _loc3_ = _loc3_ + 1;
            }
         }
         _loc4_ = _loc6_;
      }
      return -1;
   }
   static function findTag(htmlString, tagStr)
   {
      var _loc5_ = htmlString.toLowerCase();
      tagStr = tagStr.toLowerCase();
      var _loc4_ = _loc5_.indexOf("<" + tagStr + " ");
      if(_loc4_ == -1)
      {
         _loc4_ = _loc5_.indexOf("<" + tagStr + ">");
      }
      if(_loc4_ == -1)
      {
         return undefined;
      }
      var _loc15_ = [];
      while(_loc4_ != -1)
      {
         var _loc6_ = {tagindex:lib.util.ExtString.indexOfTag(_loc5_,tagStr,_loc4_)};
         _loc6_.tagendindex = lib.util.ExtString.indexOfTag(_loc5_,"/" + tagStr,_loc4_);
         var _loc12_ = _loc5_.indexOf("<",_loc4_);
         var _loc10_ = _loc5_.indexOf(">",_loc12_);
         var _loc1_ = htmlString.substring(_loc12_,_loc10_);
         var _loc3_ = 0;
         var _loc2_ = _loc1_.indexOf("=\'",_loc3_);
         var _loc13_ = 0;
         while(_loc2_ != -1)
         {
            var _loc9_ = _loc1_.indexOf(" ",_loc3_);
            _loc3_ = _loc1_.indexOf("\'",_loc2_ + 2);
            var _loc7_ = lib.util.ExtString.trim(_loc1_.substring(_loc9_,_loc2_)).toLowerCase();
            var _loc8_ = _loc1_.substring(_loc2_ + 2,_loc3_);
            _loc6_[_loc7_] = _loc8_;
            _loc2_ = _loc1_.indexOf("=\'",_loc3_);
         }
         _loc15_.push(_loc6_);
         _loc4_ = _loc5_.indexOf("<" + tagStr + " ",_loc10_);
         if(_loc4_ == -1)
         {
            _loc4_ = _loc5_.indexOf("<" + tagStr + ">",_loc10_);
         }
      }
      return _loc15_;
   }
   static function replaceHtmlText(fd, finndStartindex, finndEndindex, repalceStr)
   {
      var _loc5_ = fd.htmlText;
      var _loc2_ = fd.text;
      var _loc9_ = _loc2_.charAt(finndStartindex);
      var _loc7_ = _loc2_.charAt(finndEndindex);
      var _loc3_ = lib.util.ExtString.toHtmlIndex(fd,finndStartindex);
      var _loc4_ = lib.util.ExtString.toHtmlIndex(fd,finndEndindex);
      fd.htmlText = lib.util.ExtString.replaceOfIndex(_loc5_,_loc3_,_loc4_,repalceStr);
   }
   static function replaceOfIndex(str, stratIndex, endIndex, replace)
   {
      var _loc1_ = str.substring(0,stratIndex);
      var _loc2_ = str.substring(endIndex);
      return _loc1_ + replace + _loc2_;
   }
   static function replaceBracket(str)
   {
      var _loc1_ = str;
      _loc1_ = lib.util.ExtString.replace(_loc1_,"<","&lt;");
      return lib.util.ExtString.replace(_loc1_,"<","&gt;");
   }
   static function getTimeString(sec)
   {
      var _loc11_ = lib.util.UIString.getUIString("$101090");
      var _loc10_ = lib.util.UIString.getUIString("$101082");
      var _loc12_ = lib.util.UIString.getUIString("$101067");
      var _loc8_ = lib.util.UIString.getUIString("$101068");
      var _loc7_ = Number(sec) / 3600;
      var _loc2_ = int(_loc7_ / 24);
      var _loc3_ = int(_loc7_) % 24;
      var _loc4_ = sec % 3600;
      var _loc6_ = int(_loc4_ / 60);
      var _loc5_ = _loc4_ % 60;
      var _loc1_ = "";
      if(_loc2_ != 0)
      {
         _loc1_ = _loc1_ + (_loc2_ + _loc11_);
      }
      if(_loc3_ != 0)
      {
         _loc1_ = _loc1_ + (_loc3_ + _loc10_);
      }
      if(_loc6_ != 0 && _loc2_ == 0)
      {
         _loc1_ = _loc1_ + (_loc6_ + _loc12_);
      }
      if(_loc5_ != 0 && _loc3_ == 0 && _loc2_ == 0)
      {
         _loc1_ = _loc1_ + (_loc5_ + _loc8_);
      }
      if(sec == 0)
      {
         _loc1_ = 0 + _loc8_;
      }
      return _loc1_;
   }
}
