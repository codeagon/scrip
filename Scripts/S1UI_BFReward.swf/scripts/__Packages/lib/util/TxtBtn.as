class lib.util.TxtBtn
{
   var toggleMode = false;
   var toggle = false;
   var enabledFalseAlpha = 30;
   var MAIN_BTN = lib.manager.UISound.MAIN_BTN;
   function TxtBtn(targetMovie, targetTxt)
   {
      this.btn = targetMovie;
      this.txt = targetTxt;
      this.btn.o = this;
      this.colorFormat = this.txt.getTextFormat();
      this.outColor = lib.info.TextColor.BTN_NORMAL;
      this.overColor = lib.info.TextColor.BTN_OVER;
      this.pressColor = lib.info.TextColor.BTN_PRESS;
      this.disableColor = lib.info.TextColor.BTN_DISABLE;
      targetTxt.textColor = lib.info.TextColor.BTN_NORMAL;
      this.txt.shadowBlurX = 0;
      this.txt.shadowBlurY = 0;
      this.txt.shadowStrength = 0;
      this.txt.shadowDistance = 0;
      this.txt.shadowAngle = 45;
      this.txt.shadowColor = 16777215;
      this.workBtn();
      this.btn._focusrect = false;
      this.btn.focus_mc._visible = false;
      this.btn.onSetFocus = function()
      {
         _global.inputing = true;
         this.focus_mc._visible = true;
         this.focus_mc.gotoAndPlay(2);
         lib.manager.Focus.setFocusGroup(this);
      };
      this.btn.onKillFocus = function()
      {
         _global.inputing = false;
         this.focus_mc._visible = false;
         this.focus_mc.gotoAndStop(1);
         lib.manager.Focus.stop();
      };
   }
   function setTextColor(normalCol, overCol, pressCol, disableCol)
   {
      this.outColor = normalCol;
      this.overColor = overCol;
      this.pressColor = pressCol;
      this.disableColor = disableCol;
      this.colorFormat.color = this.outColor;
      this.txt.setTextFormat(this.colorFormat);
   }
   function setTextDropShadow(blurX, blurY, strenth, distance, angle, color)
   {
      if(blurX != undefined)
      {
         this.txt.shadowBlurX = blurX;
      }
      if(blurY != undefined)
      {
         this.txt.shadowBlurY = blurY;
      }
      if(strenth != undefined)
      {
         this.txt.shadowStrength = strenth;
      }
      if(distance != undefined)
      {
         this.txt.shadowDistance = distance;
      }
      if(angle != undefined)
      {
         this.txt.shadowAngle = angle;
      }
      if(color != undefined)
      {
         this.txt.shadowColor = color;
      }
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
      this.txt._x = this.btn._x + (this.btn._width - this.txt._width) / 2 + plusX;
      this.txt._y = this.btn._y + (this.btn._height - this.txt._height) / 2 + plusY;
   }
   function workBtn()
   {
      this.btn.hitArea = this.btn.hit_mc;
      this.setRollOver();
      this.setRollOut();
      this.setPress();
      this.setRelease();
      this.setReleaseOutside();
   }
   function setRollOver(func)
   {
      this.btn.onRollOver = function()
      {
         if(!this.o.toggleMode)
         {
            this.gotoAndStop(2);
         }
         else if(!this.o.toggle)
         {
            this.gotoAndStop(2);
         }
         this.o.colorFormat.color = this.o.overColor;
         this.o.txt.setTextFormat(this.o.colorFormat);
         func();
         this.onRollOver2();
      };
   }
   function setRollOut(func)
   {
      this.btn.onRollOut = function()
      {
         if(!this.o.toggleMode)
         {
            this.gotoAndStop(1);
         }
         else if(!this.o.toggle)
         {
            this.gotoAndStop(1);
         }
         this.o.colorFormat.color = this.o.outColor;
         this.o.txt.setTextFormat(this.o.colorFormat);
         func();
         this.onRollOut2();
      };
   }
   function setReleaseOutside(func)
   {
      this.btn.onReleaseOutside = function()
      {
         if(!this.o.toggleMode)
         {
            this.gotoAndStop(1);
            this.o.txt._y = this.o.txt._y - 1;
         }
         else
         {
            this.o.txt._y = this.o.txt._y - 1;
            if(!this.o.toggle)
            {
               this.gotoAndStop(1);
            }
         }
         this.o.btn.dnEffectMc.gotoAndStop(1);
         this.o.colorFormat.color = this.o.outColor;
         this.o.txt.setTextFormat(this.o.colorFormat);
         func();
         this.onReleaseOutside2();
      };
   }
   function setPress(func)
   {
      this.btn.onPress = function()
      {
         if(!this.o.toggleMode)
         {
            this.gotoAndStop(3);
            this.o.txt._y = this.o.txt._y + 1;
         }
         else
         {
            this.o.txt._y = this.o.txt._y + 1;
            if(!this.o.toggle)
            {
               this.gotoAndStop(3);
            }
         }
         this.o.colorFormat.color = this.o.pressColor;
         this.o.txt.setTextFormat(this.o.colorFormat);
         func();
         this.onPress2();
      };
   }
   function setRelease(func)
   {
      this.btn.onRelease = function()
      {
         if(!this.o.toggleMode)
         {
            this.gotoAndStop(2);
            this.o.colorFormat.color = this.o.overColor;
            this.o.txt.setTextFormat(this.o.colorFormat);
            this.o.txt._y = this.o.txt._y - 1;
         }
         else
         {
            this.o.txt._y = this.o.txt._y - 1;
            if(!this.o.toggle)
            {
               this.o.toggle = true;
               this.gotoAndStop(3);
               this.o.colorFormat.color = this.o.pressColor;
               this.o.txt.setTextFormat(this.o.colorFormat);
            }
            else
            {
               this.o.toggle = false;
               this.gotoAndStop(2);
               this.o.colorFormat.color = this.o.overColor;
               this.o.txt.setTextFormat(this.o.colorFormat);
            }
         }
         lib.manager.UISound.play(this.o.MAIN_BTN);
         func();
         this.onRelease2();
         this.o.btn.dnEffectMc.gotoAndPlay(2);
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
         this.colorFormat.color = this.pressColor;
         this.txt.setTextFormat(this.colorFormat);
      }
      else
      {
         this.btn.gotoAndStop(1);
         this.colorFormat.color = this.outColor;
         this.txt.setTextFormat(this.colorFormat);
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
      this.colorFormat.color = this.txt.getTextFormat().color;
      this.txt.setText(t);
      this.txt.setTextFormat(this.colorFormat);
   }
   function getText()
   {
      return this.txt.text;
   }
   function setEnabled(bTrue, Alpha)
   {
      if(bTrue)
      {
         this.btn.enabled = true;
         this.btn.gotoAndStop(1);
         this.btn._alpha = 100;
         this.txt._alpha = 100;
         this.colorFormat.color = this.outColor;
         this.txt.setTextFormat(this.colorFormat);
      }
      else
      {
         this.btn.enabled = false;
         this.btn.gotoAndStop(4);
         if(Alpha != undefined && Alpha != null)
         {
            this.txt._alpha = Alpha;
            this.btn._alpha = Alpha;
         }
         this.colorFormat.color = this.disableColor;
         this.txt.setTextFormat(this.colorFormat);
      }
   }
   function onEnterKey()
   {
      this.btn.onPress();
      this.btn.onRelease();
   }
}
