class lib.util.GeneralTabBtn
{
   static var test = "for load at BaseUI";
   var outColor = 13421772;
   var overColor = 16382357;
   var pressColor = 16763904;
   var _autoSize = true;
   var alignMethod = "left";
   var TABMENU_BTN = lib.manager.UISound.TABMENU_BTN;
   function GeneralTabBtn(btnArray, txtArray)
   {
      this.btn_array = btnArray;
      this.txt_array = txtArray;
      this.colorFormat = this.txt_array[0].getTextFormat();
      this.defaultTextWidth = this.txt_array[0]._width;
      this.defaultBtnWidth = this.btn_array[0]._width;
      this.maxNum = this.btn_array.length;
      this.con = this.btn_array[0]._parent;
      this.rightAlignX = this.btn_array[this.maxNum - 1]._x + this.btn_array[this.maxNum - 1]._width;
      var _loc2_ = 0;
      while(_loc2_ < this.maxNum)
      {
         this.btn_array[_loc2_].o = this;
         this.btn_array[_loc2_].txt = this.txt_array[_loc2_];
         this.txt_array[_loc2_].txt = this.txt_array[_loc2_].text;
         this.txt_array[_loc2_].textColor = lib.info.TextColor.TAB_NORMAL;
         _loc2_ = _loc2_ + 1;
      }
      this.workBtn();
   }
   function setActiveNum(num)
   {
      this.activedNum = num;
   }
   function setTextColor(color)
   {
      var _loc2_ = 0;
      while(_loc2_ < this.btn_array.length)
      {
         this.btn_array[_loc2_].o = this;
         this.btn_array[_loc2_].txt = this.txt_array[_loc2_];
         this.txt_array[_loc2_].textColor = color;
         _loc2_ = _loc2_ + 1;
      }
   }
   function workBtn()
   {
      var _loc2_ = 0;
      while(_loc2_ < this.maxNum)
      {
         var _loc3_ = this.btn_array[_loc2_];
         _loc3_.stat = _loc2_;
         _loc3_.hitArea = _loc3_.hit_mc;
         _loc2_ = _loc2_ + 1;
      }
      this.setRollOver();
      this.setRollOut();
      this.setPress();
      this.setRelease();
      this.setReleaseOutside();
   }
   function setRollOver(func)
   {
      var _loc2_ = 0;
      while(_loc2_ < this.maxNum)
      {
         this.btn_array[_loc2_].onRollOver = function()
         {
            if(this.o.activedNum != this.stat)
            {
               this.gotoAndStop(2);
               this.txt.textColor = this.o.overColor;
            }
            func(this.stat);
         };
         _loc2_ = _loc2_ + 1;
      }
   }
   function setRollOut(func)
   {
      var _loc2_ = 0;
      while(_loc2_ < this.maxNum)
      {
         this.btn_array[_loc2_].onRollOut = function()
         {
            if(this.o.activedNum != this.stat)
            {
               this.gotoAndStop(2);
               this.txt.textColor = this.o.outColor;
            }
            func(this.stat);
         };
         _loc2_ = _loc2_ + 1;
      }
   }
   function setPress(func)
   {
      var _loc2_ = 0;
      while(_loc2_ < this.maxNum)
      {
         this.btn_array[_loc2_].onPress = function()
         {
            if(this.o.activedNum != this.stat)
            {
               this.txt._y = this.txt._y + 2;
               this.gotoAndStop(3);
               this.txt.textColor = this.o.pressColor;
            }
            func(this.stat);
         };
         _loc2_ = _loc2_ + 1;
      }
   }
   function setReleaseOutside(func)
   {
      var _loc2_ = 0;
      while(_loc2_ < this.maxNum)
      {
         this.btn_array[_loc2_].onReleaseOutside = function()
         {
            if(this.o.activedNum != this.stat)
            {
               this.txt._y = this.txt._y - 2;
               this.gotoAndStop(1);
               this.txt.textColor = this.o.outColor;
            }
            func(this.stat);
         };
         _loc2_ = _loc2_ + 1;
      }
   }
   function setRelease(func)
   {
      var _loc2_ = 0;
      while(_loc2_ < this.maxNum)
      {
         this.btn_array[_loc2_].onRelease = function(noRequestEvent)
         {
            this.o.preClickNum = this.o.clickNum;
            this.o.clickNum = this.stat;
            if(this.o.activedNum != this.stat)
            {
               this.o.btn_array[this.o.activedNum].gotoAndStop(1);
               this.o.btn_array[this.o.activedNum].txt.textColor = this.o.outColor;
               this.o.preActivedNum = this.o.activedNum;
               this.o.activedNum = this.stat;
               this.txt._y = this.txt._y - 2;
               this.gotoAndStop(4);
               this.txt.textColor = this.o.pressColor;
            }
            if(noRequestEvent == undefined || noRequestEvent == 0 || noRequestEvent == "")
            {
               lib.manager.UISound.play(this.o.TABMENU_BTN);
            }
            func(this.stat,noRequestEvent);
         };
         _loc2_ = _loc2_ + 1;
      }
   }
   function setTab(num, noRequestEvent)
   {
      if(noRequestEvent != undefined && noRequestEvent != 0)
      {
         this.btn_array[num].onRelease(1);
      }
      else
      {
         this.btn_array[num].onRelease();
      }
   }
   function setVisible(orderNum, bTrue)
   {
      this.btn_array[orderNum]._visible = bTrue;
      this.txt_array[orderNum]._visible = bTrue;
   }
   function getVisible(orderNum)
   {
      return this.btn_array[orderNum]._visible;
   }
   function setText(orderNum, t)
   {
      this.txt_array[orderNum].text = t;
      this.txt_array[orderNum].txt = t;
      this.align();
   }
   function __set__autoSize(bTrue)
   {
      this._autoSize = bTrue;
      this.align();
      return this.__get__autoSize();
   }
   function getText(orderNum)
   {
      return this.txt_array[orderNum].text;
   }
   function align()
   {
      var _loc3_ = this.btn_array.length;
      if(this.alignMethod == "left")
      {
         var _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            if(this._autoSize)
            {
               lib.manager.ToolTip.remove(this.txt_array[_loc2_]);
               this.txt_array[_loc2_].text = this.txt_array[_loc2_].txt;
               this.txt_array[_loc2_].autoSize = true;
               if(this.txt_array[_loc2_]._width > this.defaultTextWidth)
               {
                  this.btn_array[_loc2_]._width = this.txt_array[_loc2_]._width + 20;
               }
               else
               {
                  this.btn_array[_loc2_]._width = this.defaultBtnWidth;
               }
               if(_loc2_ != 0)
               {
                  this.btn_array[_loc2_]._x = this.btn_array[_loc2_ - 1]._x + this.btn_array[_loc2_ - 1]._width + 2;
               }
               lib.util.ObjAlign.align(this.btn_array[_loc2_],this.txt_array[_loc2_],"center","center","obj1","obj1");
            }
            else
            {
               this.txt_array[_loc2_].autoSize = false;
               this.txt_array[_loc2_]._width = this.defaultTextWidth;
               this.btn_array[_loc2_]._width = this.defaultBtnWidth;
               if(_loc2_ != 0)
               {
                  this.btn_array[_loc2_]._x = this.btn_array[_loc2_ - 1]._x + this.btn_array[_loc2_ - 1]._width + 2;
               }
               lib.util.ExtString.textCut(this.txt_array[_loc2_],this.txt_array[_loc2_].txt,1);
               lib.util.ObjAlign.align(this.btn_array[_loc2_],this.txt_array[_loc2_],"center","center","obj1","obj1");
            }
            _loc2_ = _loc2_ + 1;
         }
      }
      else if(this.alignMethod == "right")
      {
         _loc2_ = _loc3_ - 1;
         while(_loc2_ >= 0)
         {
            if(this._autoSize)
            {
               lib.manager.ToolTip.remove(this.txt_array[_loc2_]);
               this.txt_array[_loc2_].text = this.txt_array[_loc2_].txt;
               this.txt_array[_loc2_].autoSize = true;
               if(this.txt_array[_loc2_]._width > this.defaultTextWidth)
               {
                  this.btn_array[_loc2_]._width = this.txt_array[_loc2_]._width + 20;
               }
               else
               {
                  this.btn_array[_loc2_]._width = this.defaultBtnWidth;
               }
               if(_loc2_ != _loc3_ - 1)
               {
                  this.btn_array[_loc2_]._x = this.btn_array[_loc2_ + 1]._x - this.btn_array[_loc2_]._width - 2;
               }
               else
               {
                  this.btn_array[_loc2_]._x = this.rightAlignX - this.btn_array[_loc2_]._width;
               }
               lib.util.ObjAlign.align(this.btn_array[_loc2_],this.txt_array[_loc2_],"center","center","obj1","obj1");
            }
            else
            {
               if(_loc2_ == _loc3_ - 1 && this.btn_array[_loc2_]._width > this.defaultBtnWidth)
               {
                  var _loc4_ = this.btn_array[_loc2_]._width - this.defaultBtnWidth;
               }
               this.txt_array[_loc2_].autoSize = false;
               this.txt_array[_loc2_]._width = this.defaultTextWidth;
               this.btn_array[_loc2_]._width = this.defaultBtnWidth;
               if(_loc2_ != _loc3_ - 1)
               {
                  this.btn_array[_loc2_]._x = this.btn_array[_loc2_ + 1]._x - this.btn_array[_loc2_]._width - 2;
               }
               else
               {
                  this.btn_array[_loc2_]._x = this.rightAlignX - this.btn_array[_loc2_]._width;
               }
               lib.util.ExtString.textCut(this.txt_array[_loc2_],this.txt_array[_loc2_].txt,1);
               lib.util.ObjAlign.align(this.btn_array[_loc2_],this.txt_array[_loc2_],"center","center","obj1","obj1");
            }
            _loc2_ = _loc2_ - 1;
         }
      }
   }
}
