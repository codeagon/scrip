class lib.util.TxtAniBtn
{
   var toggleMode = false;
   var toggle = false;
   var enabledFalseAlpha = lib.info.TextColor.GENERAL_DISABLE_ALPHA;
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
      this.txt._x = this.btn._x + (this.btn._width - this.txt._width) / 2;
      this.txt._y = this.btn._y + (this.btn._height - this.txt._height) / 2 - 2;
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
         getURL("FSCommand:ToGame_PlaySound",1001);
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
      this.txt.text = t;
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
