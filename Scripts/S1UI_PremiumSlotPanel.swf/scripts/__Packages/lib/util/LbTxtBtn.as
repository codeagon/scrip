class lib.util.LbTxtBtn extends lib.util.TxtBtn
{
   var enabledFalseAlpha = 20;
   function LbTxtBtn(targetMovie, targetTxt)
   {
      super();
      this.outColor = 13421772;
      this.overColor = 13421772;
      this.pressColor = 13421772;
      this.disableColor = lib.info.TextColor.BTN_DISABLE;
      this.btn = targetMovie;
      this.txt = targetTxt;
      this.btn.o = this;
      this.colorFormat = this.txt.getTextFormat();
      this.workBtn();
   }
   function setRollOut(func)
   {
      this.btn.onRollOut = this.btn.onReleaseOutside = function()
      {
         if(!this.o.toggleMode)
         {
            this.gotoAndStop(2);
            this.overMc.gotoAndStop(this.overMc._totalframes);
            this.overMc.onEnterFrame = function()
            {
               var _loc2_ = this._currentframe - 1;
               if(_loc2_ == 1)
               {
                  this.gotoAndStop(_loc2_);
                  this._parent.gotoAndStop(1);
                  this.o.colorFormat.color = this.o.outColor;
                  this.o.txt.setTextFormat(this.o.colorFormat);
                  delete this.onEnterFrame;
               }
               this.gotoAndStop(_loc2_);
               updateAfterEvent();
            };
         }
         else if(!this.o.toggle)
         {
            this.gotoAndStop(2);
            this.overMc.gotoAndStop(this.overMc._totalframes);
            this.overMc.onEnterFrame = function()
            {
               var _loc2_ = this._currentframe - 1;
               if(_loc2_ == 1)
               {
                  this.gotoAndStop(_loc2_);
                  this._parent.gotoAndStop(1);
                  this.o.colorFormat.color = this.o.outColor;
                  this.o.txt.setTextFormat(this.o.colorFormat);
                  delete this.onEnterFrame;
               }
               this.gotoAndStop(_loc2_);
               updateAfterEvent();
            };
         }
         func();
         this.onRollOut2();
      };
   }
   function alignText()
   {
   }
   function setEnabled(bTrue)
   {
      if(bTrue)
      {
         this.btn.enabled = true;
         this.btn._alpha = 100;
         this.txt._alpha = 100;
      }
      else
      {
         this.btn.enabled = false;
         this.btn._alpha = this.enabledFalseAlpha;
         this.txt._alpha = 50;
         this.colorFormat.color = this.outColor;
         this.txt.setTextFormat(this.colorFormat);
      }
   }
}
