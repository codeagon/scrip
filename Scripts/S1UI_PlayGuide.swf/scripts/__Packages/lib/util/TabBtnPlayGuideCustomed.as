class lib.util.TabBtnPlayGuideCustomed extends lib.util.TabBtn
{
   var selectableIndex = [];
   function TabBtnPlayGuideCustomed(btnArray, txtArray, colorArray, selectableIndices)
   {
      super(btnArray,txtArray,colorArray);
      this.selectableIndex = selectableIndices;
   }
   function isNotSelectable(stat)
   {
      var _loc2_ = 0;
      while(_loc2_ < this.selectableIndex.length)
      {
         if(Number(this.selectableIndex[_loc2_]) == stat)
         {
            return true;
         }
         _loc2_ = _loc2_ + 1;
      }
      return false;
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
               if(this.o.isNotSelectable(Number(this.stat)))
               {
                  this.o.btn_array[this.o.activedNum].gotoAndStop(1);
                  this.o.btn_array[this.o.activedNum].txt.textColor = this.o.outColor;
                  this.o.preActivedNum = this.o.activedNum;
                  this.o.activedNum = this.stat;
                  this.gotoAndStop(4);
                  this.txt.textColor = this.o.activeColor;
               }
               if(this.o.pressed)
               {
                  this.txt._y = this.txt._y - 2;
                  this.o.pressed = false;
               }
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
}
