class lib.util.TabBtn
{
   var outColor = 13421772;
   var overColor = 16382357;
   var pressColor = 16763904;
   function TabBtn(btnArray, txtArray)
   {
      this.btn_array = btnArray;
      this.txt_array = txtArray;
      this.colorFormat = this.txt_array[0].getTextFormat();
      this.maxNum = this.btn_array.length;
      this.con = this.btn_array[0]._parent;
      var _loc2_ = 0;
      while(_loc2_ < this.maxNum)
      {
         this.btn_array[_loc2_].o = this;
         this.btn_array[_loc2_].txt = this.txt_array[_loc2_];
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
   }
   function setRollOver(func)
   {
      var _loc2_ = 0;
      while(_loc2_ < this.maxNum)
      {
         this.btn_array[_loc2_].onRollOver = function()
         {
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
            if(noRequestEvent == undefined)
            {
               getURL("FSCommand:ToGame_PlaySound",1001);
               trace(" 탭 사운드 재생");
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
      trace("순서=" + orderNum + " ," + "글자 = " + t);
   }
   function getText(orderNum)
   {
      return this.txt_array[orderNum].text;
   }
}
