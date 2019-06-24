class lib.util.TabBtn
{
   var pressed = false;
   var TABMENU_BTN = lib.manager.UISound.TABMENU_BTN;
   function TabBtn(btnArray, txtArray, colorArray)
   {
      this.btn_array = btnArray;
      this.txt_array = txtArray;
      this.colorFormat = this.txt_array[0].getTextFormat();
      this.maxNum = this.btn_array.length;
      this.con = this.btn_array[0]._parent;
      if(colorArray != undefined)
      {
         this.outColor = colorArray[0];
         this.overColor = colorArray[1];
         this.pressColor = colorArray[2];
         this.activeColor = colorArray[3];
      }
      else
      {
         this.outColor = lib.info.TextColor.TAB_NORMAL;
         this.overColor = lib.info.TextColor.TAB_OVER;
         this.pressColor = lib.info.TextColor.TAB_PRESS;
         this.activeColor = lib.info.TextColor.TAB_ACTIVE;
      }
      var _loc2_ = 0;
      while(_loc2_ < this.maxNum)
      {
         this.btn_array[_loc2_].o = this;
         this.btn_array[_loc2_].txt.textAutoSize = "shrink";
         this.btn_array[_loc2_].txt.verticalAlign = "center";
         this.btn_array[_loc2_].txt = this.txt_array[_loc2_];
         this.txt_array[_loc2_].textColor = this.outColor;
         _loc2_ = _loc2_ + 1;
      }
      this.workBtn();
   }
   function setActiveNum(num)
   {
      this.activedNum = num;
   }
   function setTextColor(normalCol, overCol, pressCol, activeCol)
   {
      this.outColor = normalCol;
      this.overColor = overCol;
      this.pressColor = pressCol;
      this.activeColor = activeCol;
      this.colorFormat.color = this.outColor;
      var _loc2_ = 0;
      while(_loc2_ < this.btn_array.length)
      {
         this.btn_array[_loc2_].txt.setTextFormat(this.colorFormat);
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
               this.gotoAndStop(1);
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
            this.o.pressed = true;
            this.o.pressedNum = this.stat;
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
               if(this.o.pressed)
               {
                  this.txt._y = this.txt._y - 2;
                  this.o.pressed = false;
               }
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
               if(this.o.pressed)
               {
                  this.txt._y = this.txt._y - 2;
                  this.o.pressed = false;
               }
               this.gotoAndStop(4);
               this.txt.textColor = this.o.activeColor;
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
      this.o.pressed = false;
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
   }
   function getText(orderNum)
   {
      return this.txt_array[orderNum].text;
   }
   function alignText(plusX, plusY)
   {
      if(plusX == undefined || isNaN(plusX))
      {
         plusX = 0;
      }
      if(plusY == undefined || isNaN(plusY))
      {
         plusY = 0;
      }
      var _loc2_ = 0;
      while(_loc2_ < this.maxNum)
      {
         this.txt_array[_loc2_]._x = this.btn_array[_loc2_]._x + (this.btn_array[_loc2_]._width - this.txt_array[_loc2_]._width) / 2 + plusX;
         this.txt_array[_loc2_]._y = this.btn_array[_loc2_]._y + (this.btn_array[_loc2_]._height - this.txt_array[_loc2_]._height) / 2 + plusY;
         _loc2_ = _loc2_ + 1;
      }
   }
}
