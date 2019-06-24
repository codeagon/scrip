class lib.controls.AutoBuilder extends MovieClip
{
   var maxLines = 9;
   function AutoBuilder()
   {
      super();
      var _loc5_ = this.listFd.getLineMetrics(0);
      this.lineH = _loc5_.height + _loc5_.leading;
      this.lineMcY = this.listBg._y + 10;
      var _loc6_ = this.listBg._y;
      this.lineMc._x = this.listFd._x;
      this.lineMc._height = this.lineH;
      this.lineMc._width = this.listFd._width;
      this.lineMc.gotoAndStop("over");
      this.listBg._yscale = this.listFd._yscale = 100;
      this.listBg.onPress = function()
      {
      };
      this.listBg.useHandCursor = false;
      this.listFd._height = this.listBg._height;
      this.inputFd.textColor = lib.info.TextColor.INPUT_ACTIVE;
      this.listFd.textColor = lib.info.TextColor.LIST_NORMAL;
      this.listFd._y = this.lineMcY;
      this.listBg._y = _loc6_;
      this.lineNumber = 0;
      this.fdListener = {};
      Key.addListener(this);
      this.inputFd.addListener(this.fdListener);
      var _this = this;
      this.fdListener.onChanged = function(fd)
      {
         var _loc1_ = fd.text;
         _this.onChanged(_loc1_);
      };
      this.inputFd.onSetFocus = function(oldFocus)
      {
         var _loc3_ = this.text;
         _global.inputing = true;
         if(_loc3_ != "" && _loc3_ != undefined && _this.key == undefined)
         {
            _this.onChanged(_loc3_);
         }
      };
      this.showList(false);
   }
   function onChanged(str)
   {
   }
   function searchResult(searchdata)
   {
      lib.Debuger.trace("searchResult  " + searchdata);
      this.showList(false);
      this.searchList = [];
      this.listFd.text = "";
      if(searchdata == undefined || searchdata.length == 0)
      {
         return undefined;
      }
      this.showList(true);
      this.lineNumber = 0;
      this.searchList = searchdata;
      this.listFd.text = this.searchList.join("\n");
   }
   function onKeyDown()
   {
      lib.Debuger.trace(">onKeyDown  " + Key.getCode());
      lib.Debuger.trace(">searchList.length  " + this.searchList.length);
      if(Selection.getFocus() != String(this.inputFd) || this.searchList.length == 0 || this.searchList.length == undefined)
      {
         return undefined;
      }
      this.key = Key.getCode();
      if(this.key == 40 || this.key == 38)
      {
         Selection.setFocus(null);
      }
      if(this.key == 13 && this.lineNumber > 0)
      {
         this.showList(false);
      }
   }
   function onKeyUp()
   {
      lib.Debuger.trace(">onKeyUp  ");
      if(this.key == undefined)
      {
         return undefined;
      }
      if(this.key == 40)
      {
         this.showList(true);
         this.lineNumber = this.lineNumber + 1;
      }
      else if(this.key == 38)
      {
         this.lineNumber = this.lineNumber - 1;
      }
      else
      {
         this.key = undefined;
         return undefined;
      }
      this.lineMc._visible = true;
      this.lineNumber = Math.min(this.lineNumber,this.searchList.length);
      this.lineNumber = Math.max(this.lineNumber,0);
      if(this.lineNumber > this.maxLines)
      {
         this.lineNumber = this.maxLines;
         if(this.key == 40)
         {
            if(this.listFd.scroll < this.listFd.maxscroll)
            {
               this.listFd.scroll = this.listFd.scroll + 1;
            }
         }
         else if(this.key == 38)
         {
            this.lineMc._y = this.lineMcY + this.lineH * (this.lineNumber - 1);
         }
      }
      else if(this.lineNumber == 0)
      {
         this.lineNumber = 1;
         if(this.key == 38)
         {
            this.listFd.scroll = this.listFd.scroll - 1;
         }
         else if(this.key == 40)
         {
            this.lineMc._y = this.lineMcY + this.lineH * (this.lineNumber - 1);
         }
      }
      else
      {
         this.lineMc._y = this.lineMcY + this.lineH * (this.lineNumber - 1);
      }
      Key.removeListener(this);
      this.inputFd.text = this.searchList[this.listFd.scroll + this.lineNumber - 2];
      Selection.setFocus(this.inputFd);
      Key.addListener(this);
      Selection.setSelection(this.inputFd.text.length,this.inputFd.text.length);
      this.key = undefined;
   }
   function onMouseDown()
   {
      var _loc2_ = Mouse.getTopMostEntity();
      var _loc4_ = Mouse.getButtonsState();
      lib.Debuger.trace(" >onMouseDown  " + _loc2_ + "  " + _loc4_);
      if(_loc2_ != this.inputFd && _loc4_ == 1)
      {
         if(_loc2_ == this.listFd && _loc4_ == 1)
         {
            var _loc3_ = this.listFd.getLineIndexAtPoint(this._xmouse - this.listFd._x,this._ymouse - this.listFd._y);
            lib.Debuger.trace(" >getLineIndexAtPoint index :  " + _loc3_);
            if(_loc3_ >= 0)
            {
               this.lineMc._visible = true;
               this.lineMc._y = this.lineMcY + this.lineH * _loc3_;
            }
         }
      }
   }
   function onMouseUp()
   {
      var _loc3_ = Mouse.getTopMostEntity();
      lib.Debuger.trace(">onMouseUp  " + _loc3_);
      if(_loc3_ != this.inputFd)
      {
         this.lineNumber = 0;
         this.showList(false);
         if(Selection.getFocus() == null)
         {
            _global.inputing = false;
         }
         if(_loc3_ == this.listFd)
         {
            var _loc4_ = this.listFd.getLineIndexAtPoint(this._xmouse - this.listFd._x,this._ymouse - this.listFd._y);
            lib.Debuger.trace("> >getLineIndexAtPoint index :  " + _loc4_);
            if(_loc4_ >= 0)
            {
               this.inputFd.text = this.searchList[this.listFd.scroll + _loc4_ - 1];
            }
         }
      }
   }
   function showList(b)
   {
      this.lineMc._y = this.listFd._y - this.lineMc._height;
      this.listFd._visible = b;
      this.listFd.scroll = 1;
      this.listBg._visible = b;
      this.lineMc._visible = false;
   }
   function __get__text()
   {
      return this.inputFd.text;
   }
   function __set__text(str)
   {
      this.inputFd.text = str;
      return this.__get__text();
   }
}
