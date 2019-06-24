class lib.util.TxtBtn
{
   var toggleMode = false;
   var toggle = false;
   var outColor = 13421772;
   var overColor = 16382357;
   var pressColor = 16763904;
   var enabledFalseAlpha = 30;
   function TxtBtn(targetMovie, targetTxt)
   {
      this.btn = targetMovie;
      this.txt = targetTxt;
      this.btn.o = this;
      this.colorFormat = this.txt.getTextFormat();
      this.alignText();
      this.workBtn();
   }
   function alignText()
   {
      this.txt._x = this.btn._x + (this.btn._width - this.txt._width) / 2;
      this.txt._y = this.btn._y + (this.btn._height - this.txt._height) / 2;
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
            this.o.colorFormat.color = this.o.overColor;
            this.o.txt.setTextFormat(this.o.colorFormat);
         }
         else if(!this.o.toggle)
         {
            this.gotoAndStop(2);
            this.o.colorFormat.color = this.o.overColor;
            this.o.txt.setTextFormat(this.o.colorFormat);
         }
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
            this.o.colorFormat.color = this.o.outColor;
            this.o.txt.setTextFormat(this.o.colorFormat);
         }
         else if(!this.o.toggle)
         {
            this.gotoAndStop(1);
            this.o.colorFormat.color = this.o.outColor;
            this.o.txt.setTextFormat(this.o.colorFormat);
         }
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
            this.o.colorFormat.color = this.o.outColor;
            this.o.txt.setTextFormat(this.o.colorFormat);
            this.o.txt._y = this.o.txt._y - 2;
         }
         else
         {
            this.o.btn._y = this.o.btn._y - 2;
            this.o.txt._y = this.o.txt._y - 2;
            if(!this.o.toggle)
            {
               this.gotoAndStop(1);
               this.o.colorFormat.color = this.o.outColor;
               this.o.txt.setTextFormat(this.o.colorFormat);
            }
         }
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
            this.o.colorFormat.color = this.o.pressColor;
            this.o.txt.setTextFormat(this.o.colorFormat);
            this.o.txt._y = this.o.txt._y + 2;
         }
         else
         {
            this.o.btn._y = this.o.btn._y + 2;
            this.o.txt._y = this.o.txt._y + 2;
            if(!this.o.toggle)
            {
               this.gotoAndStop(3);
               this.o.colorFormat.color = this.o.pressColor;
               this.o.txt.setTextFormat(this.o.colorFormat);
            }
         }
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
            this.o.txt._y = this.o.txt._y - 2;
         }
         else
         {
            this.o.btn._y = this.o.btn._y - 2;
            this.o.txt._y = this.o.txt._y - 2;
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
         getURL("FSCommand:ToGame_PlaySound",1001);
         func();
         this.onRelease2();
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
      this.txt.text = t;
   }
   function setEnabled(bTrue)
   {
      if(bTrue)
      {
         this.btn.enabled = true;
         this.btn.gotoAndStop(1);
         this.btn._alpha = 100;
         this.txt._alpha = 100;
      }
      else
      {
         this.btn.enabled = false;
         this.btn.gotoAndStop(4);
         this.btn._alpha = this.enabledFalseAlpha;
         this.txt._alpha = 50;
         this.colorFormat.color = this.outColor;
         this.txt.setTextFormat(this.colorFormat);
      }
   }
   function help()
   {
      trace("################################################### TxtBtn클래스 - 공용텍스트버튼으로 설정클래스######################################################");
      trace("-----------------------------------------------------------------------------------------------------------------------------------------------------");
      trace("new TxtBtn(targetMovie:MovieClip, targetTxt:TextField)");
      trace("-> 생성자(버튼으로 만들 무비클립, 글자로 만들 텍스트)");
      trace("-----------------------------------------------------------------------------------------------------------------------------------------------------");
      trace("setRollOver(func:Function)");
      trace("-> 롤오버함수로 지정(롤오버함수)");
      trace("-----------------------------------------------------------------------------------------------------------------------------------------------------");
      trace("setRollOut(func:Function)");
      trace("-> 롤아웃함수로 지정(롤아웃함수)");
      trace("-----------------------------------------------------------------------------------------------------------------------------------------------------");
      trace("setPress(func:Function)");
      trace("-> 프레스함수로 지정(프레스함수)");
      trace("-----------------------------------------------------------------------------------------------------------------------------------------------------");
      trace("setRelease(func:Function)");
      trace("-> 릴리즈함수로 지정(릴리즈함수)");
      trace("-----------------------------------------------------------------------------------------------------------------------------------------------------");
      trace("setEnabled(bTrue:Boolean)");
      trace("--> 버튼의 사용가능여부 지정");
      trace("-----------------------------------------------------------------------------------------------------------------------------------------------------");
      trace("setVisible(bTrue:Boolean)");
      trace("--> 버튼의 보임여부 지정");
      trace("######################################################################################################################################################");
   }
}
