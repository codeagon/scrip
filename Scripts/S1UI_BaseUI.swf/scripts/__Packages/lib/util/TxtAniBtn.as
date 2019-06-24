class lib.util.TxtAniBtn
{
   var toggleMode = false;
   var toggle = false;
   var enabledFalseAlpha = lib.info.TextColor.GENERAL_DISABLE_ALPHA;
   var MAIN_BTN = lib.manager.UISound.MAIN_BTN;
   function TxtAniBtn(targetMovie, targetTxt, firstFrame, overEndPoint, pressEndPoint, releaseEndPoint)
   {
      this.btn = targetMovie;
      this.txt = targetTxt;
      this.btn.hit.o = this;
      this.txt.textColor = lib.info.TextColor.BTN_NORMAL;
      this.alignText();
      this.setEffectPoint(20,27,34,40);
      this.workBtn();
   }
   function alignText()
   {
      this.txt._x = this.btn._x + (this.btn.hit._width - this.txt._width) / 2;
      this.txt._y = this.btn._y + (this.btn.hit._height - this.txt._height) / 2;
   }
   function workBtn()
   {
      this.setRollOver();
      this.setRollOut();
      this.setPress();
      this.setRelease();
      this.setDragOver();
      this.setDragOut();
   }
   function setEffectPoint(firstFrame, overEndPoint, pressEndPoint, releaseEndPoint)
   {
      this.firstEndP = firstFrame;
      this.overEndP = overEndPoint;
      this.pressEndP = pressEndPoint;
      this.releaseEndP = releaseEndPoint;
   }
   function setRollOver(func)
   {
      this.btn.hit.onRollOver = function()
      {
         if(!this.o.toggleMode)
         {
            lib.util.FrameSeeker.seek(this.o.btn,this.o.firstEndP,this.o.overEndP);
            this.o.txt.textColor = lib.info.TextColor.BTN_OVER;
         }
         else if(!this.o.toggle)
         {
            this.gotoAndStop(2);
            this.o.txt.textColor = lib.info.TextColor.BTN_OVER;
         }
         func();
         this._parent.onRollOver2();
      };
   }
   function setRollOut(func)
   {
      this.btn.hit.onRollOut = function()
      {
         if(!this.o.toggleMode)
         {
            lib.util.FrameSeeker.seek(this.o.btn,this.o.overEndP,this.o.firstEndP);
            this.o.txt.textColor = lib.info.TextColor.BTN_NORMAL;
         }
         else if(!this.o.toggle)
         {
            this.gotoAndStop(1);
            this.o.txt.textColor = lib.info.TextColor.BTN_NORMAL;
         }
         func();
         this._parent.onRollOut2();
      };
      this.btn.hit.onReleaseOutside = function()
      {
         if(!this.o.toggleMode)
         {
            lib.util.FrameSeeker.seek(this.o.btn,this.o.pressEndP,this.o.firstEndP);
            this.o.txt.textColor = lib.info.TextColor.BTN_NORMAL;
         }
         else
         {
            this.o.btn._y = this.o.btn._y - 2;
            this.o.txt._y = this.o.txt._y - 2;
            if(!this.o.toggle)
            {
               this.gotoAndStop(1);
               this.o.txt.textColor = lib.info.TextColor.BTN_NORMAL;
            }
         }
         func();
         this._parent.onReleaseOutside2();
      };
   }
   function setPress(func)
   {
      this.btn.hit.onPress = function()
      {
         if(!this.o.toggleMode)
         {
            lib.util.FrameSeeker.seek(this.o.btn,this.o.overEndP,this.o.pressEndP);
            this.o.txt.textColor = lib.info.TextColor.BTN_PRESS;
         }
         else
         {
            this.o.btn._y = this.o.btn._y + 2;
            this.o.txt._y = this.o.txt._y + 2;
            if(!this.o.toggle)
            {
               this.gotoAndStop(3);
               this.o.txt.textColor = lib.info.TextColor.BTN_PRESS;
            }
         }
         func();
         this._parent.onPress2();
      };
   }
   function setRelease(func)
   {
      this.btn.hit.onRelease = function()
      {
         if(!this.o.toggleMode)
         {
            lib.util.FrameSeeker.seek(this.o.btn,this.o.pressEndP,this.o.releaseEndP);
            this.o.txt.textColor = lib.info.TextColor.BTN_OVER;
         }
         else
         {
            this.o.btn._y = this.o.btn._y - 2;
            this.o.txt._y = this.o.txt._y - 2;
            if(!this.o.toggle)
            {
               this.o.toggle = true;
               this.gotoAndStop(3);
               this.o.txt.textColor = lib.info.TextColor.BTN_PRESS;
            }
            else
            {
               this.o.toggle = false;
               this.gotoAndStop(2);
               this.o.txt.textColor = lib.info.TextColor.BTN_OVER;
            }
         }
         lib.manager.UISound.play(this.o.MAIN_BTN);
         func();
         this._parent.onRelease2();
      };
   }
   function setDragOut(func)
   {
      this.btn.hit.onDragOut = function()
      {
         if(!this.o.toggleMode)
         {
            lib.util.FrameSeeker.seek(this.o.btn,this.o.pressEndP,this.o.overEndP);
            this.o.txt.textColor = lib.info.TextColor.BTN_OVER;
         }
         func();
         this._parent.onDragOut2();
      };
   }
   function setDragOver(func)
   {
      this.btn.hit.onDragOver = function()
      {
         if(!this.o.toggleMode)
         {
            lib.util.FrameSeeker.seek(this.o.btn,this.o.overEndP,this.o.pressEndP);
            this.o.txt.textColor = lib.info.TextColor.BTN_PRESS;
         }
         func();
         this._parent.onDragOut2();
      };
   }
   function setToggleMode(mode)
   {
      this.toggleMode = mode;
   }
   function setToggle(bTrue)
   {
      this.toggle = bTrue;
      if(bTrue)
      {
         this.btn.gotoAndStop(3);
         this.o.txt.textColor = lib.info.TextColor.BTN_PRESS;
      }
      else
      {
         this.btn.gotoAndStop(1);
         this.o.txt.textColor = lib.info.TextColor.BTN_NORMAL;
      }
   }
   function setVisible(True)
   {
      if(True)
      {
         this.btn._visible = true;
         this.txt._visible = true;
      }
      else
      {
         this.btn._visible = false;
         this.txt._visible = false;
      }
   }
   function setText(t)
   {
      this.txt.setText(t);
   }
   function setEnabled(bTrue)
   {
      if(bTrue)
      {
         this.btn.hit.enabled = true;
         this.btn._alpha = 100;
         this.txt._alpha = 100;
         this.txt.textColor = lib.info.TextColor.BTN_NORMAL;
      }
      else
      {
         this.btn.hit.enabled = false;
         this.btn._alpha = this.enabledFalseAlpha;
         this.txt._alpha = 50;
         this.txt.textColor = lib.info.TextColor.BTN_DISABLE;
      }
   }
   function help()
   {
   }
}
