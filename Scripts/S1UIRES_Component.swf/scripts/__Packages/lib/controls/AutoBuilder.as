class lib.controls.AutoBuilder extends MovieClip
{
   static var test = "for load at BaseUI";
   var maxLines = 10;
   function AutoBuilder()
   {
      super();
      var _loc3_ = this.listFd.getLineMetrics(0);
      this.instExtFd = new lib.util.ExtTextField(this.inputFd,0,this.focus);
      this.inputFd.verticalAlign = "center";
      this.lineH = _loc3_.height + _loc3_.leading;
      this.lineMc.gotoAndStop("over");
      this.componentH = this._height;
      this.componentW = this._width;
      this._yscale = 100;
      this._xscale = 100;
      this.bgMc._width = this.componentW - 8;
      this.bgMc._height = this.componentH - 8;
      this.bgMc._x = 0;
      this.inputFd._width = this.componentW - 8;
      this.inputFd._height = this.componentH - 8;
      this.inputFd._x = 4;
      this.listFd._width = this.componentW - 8;
      this.listFd._height = this.lineH * this.maxLines;
      this.lineMc._width = this.componentW - 8;
      this.lineMc._height = this.lineH;
      this.listBg._width = this.componentW - 8 + 8;
      this.listBg._height = this.lineH * this.maxLines + 10;
      this.listBg._x = -2;
      this.focus._width = this.componentW;
      this.focus._height = this.componentH;
      this.focus._x = -4;
      this.focus._y = -4;
      this.lineMc._x = this.bgMc._x;
      this.lineMcY = this.bgMc._y + this.bgMc._height;
      this.listFd._y = this.lineMcY;
      this.listBg._y = this.lineMcY;
      this.listBg.onPress = function()
      {
      };
      this.listBg.useHandCursor = false;
      this.inputFd.textColor = lib.info.TextColor.INPUT_ACTIVE;
      this.listFd.textColor = lib.info.TextColor.LIST_NORMAL;
      this.lineNumber = 0;
      this.fdListener = {};
      this.inputFd.addListener(this.fdListener);
      var _this = this;
      this.fdListener.onChanged = function(fd)
      {
         var _loc1_ = fd.text;
         _this.onChanged(_loc1_);
      };
      this.instExtFd.onSetFocusEvent = function()
      {
         Key.addListener(_this);
      };
      this.instExtFd.onKillFocusEvent = function()
      {
         Key.removeListener(_this);
      };
      this.showList(false);
   }
   function __get__extTextFd()
   {
      return this.instExtFd;
   }
   function onChanged(str)
   {
   }
   function searchResult(searchdata)
   {
      var _loc3_ = this;
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
      if(Selection.getFocus() != String(this.inputFd))
      {
         return undefined;
      }
      if(this.searchList.length == 0 || this.searchList.length == undefined)
      {
         this.showList(false);
         this.lineNumber = 0;
         return undefined;
      }
      this.key = Key.getCode();
   }
   function onKeyUp()
   {
      if(this.searchList.length == 0 || this.searchList.length == undefined)
      {
         this.showList(false);
         this.key = undefined;
         this.lineNumber = 0;
         return undefined;
      }
      if(this.key == 13)
      {
         if(this.lineNumber > 0)
         {
            this.inputFd.text = this.searchList[this.listFd.scroll + this.lineNumber - 2];
            Selection.setSelection(this.inputFd.text.length,this.inputFd.text.length);
         }
         this.showList(false);
      }
      else if(this.key == 27)
      {
         this.showList(false);
      }
      if(this.key == undefined)
      {
         return undefined;
      }
      if(this.key == 40)
      {
         this.showList(true);
         this.lineNumber = this.lineNumber + 1;
      }
      else if(this.key == 38 && this.listFd._visible)
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
            if(this.listFd.scroll < this.listFd.maxscroll - 1)
            {
               this.listFd.scroll = this.listFd.scroll + 1;
               this.lineMc._y = this.lineMcY + this.lineH * (this.maxLines - 1);
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
      this.key = undefined;
   }
   function onMouseDown()
   {
      var _loc2_ = Mouse.getTopMostEntity();
      var _loc4_ = Mouse.getButtonsState();
      if(_loc2_ != this.inputFd && _loc4_ == 1)
      {
         if(_loc2_ == this.listFd && _loc4_ == 1)
         {
            var _loc3_ = this.listFd.getLineIndexAtPoint(this._xmouse - this.listFd._x,this._ymouse - this.listFd._y);
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
            if(_loc4_ >= 0)
            {
               this.inputFd.text = this.searchList[_loc4_];
            }
         }
      }
   }
   function showList(b)
   {
      if(this.listFd._visible == false)
      {
         this.lineNumber = 0;
         this.listFd.scroll = 0;
         this.lineMc._y = this.listFd._y - this.lineMc._height;
      }
      this.listFd._visible = b;
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
   function onUnload()
   {
      this.inputFd.removeListener(this.fdListener);
   }
}
