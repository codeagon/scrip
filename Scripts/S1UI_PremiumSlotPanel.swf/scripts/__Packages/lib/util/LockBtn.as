class lib.util.LockBtn extends MovieClip
{
   static var test = "LockBtn";
   var locked = false;
   var MAIN_BTN = lib.manager.UISound.MAIN_BTN;
   function LockBtn()
   {
      super();
      var ui = this._parent._parent;
      this.onRollOver = this.onDragOut = function()
      {
         if(this.locked == false)
         {
            this.gotoAndStop(1);
            this.mc.gotoAndStop(2);
         }
         else
         {
            this.gotoAndStop(2);
            this.mc.gotoAndStop(2);
         }
         this.onRollOver2();
      };
      this.onRollOut = this.onReleaseOutside = function()
      {
         if(this.locked == false)
         {
            this.gotoAndStop(1);
            this.mc.gotoAndStop(1);
         }
         else
         {
            this.gotoAndStop(2);
            this.mc.gotoAndStop(1);
         }
         this.onRollOut2();
      };
      this.onPress = this.onDragOver = function()
      {
         if(this.locked == false)
         {
            this.gotoAndStop(2);
            this.mc.gotoAndStop(3);
         }
         else
         {
            this.gotoAndStop(1);
            this.mc.gotoAndStop(3);
         }
         this.onPress2();
      };
      this.onRelease = function()
      {
         if(this.locked == false)
         {
            this.gotoAndStop(2);
            this.mc.gotoAndStop(2);
            this.lock(true);
            lib.info.AlignInfo.savePos(ui,this._currentframe - 1);
            _root.removeUIInAlignGroup(ui._name,0);
            _root.resetUIALign(2);
         }
         else
         {
            this.gotoAndStop(1);
            this.mc.gotoAndStop(2);
            this.lock(false);
            ui.container_mc.UIDrager.moved = false;
            lib.info.AlignInfo.savePos(ui,this._currentframe - 1);
            _root.ToGame_RequestSetUIPosition(ui._name);
         }
         _root.lockRegisterUI(ui._name,this.locked);
         this.onRelease2();
         lib.manager.UISound.play(this.MAIN_BTN);
      };
      lib.manager.ToolTip.add(this,lib.util.UIString.getUIString("$102148"),1);
   }
   function setEnabled(bTrue)
   {
      if(bTrue)
      {
         this.enabled = true;
         this._alpha = 100;
      }
      else
      {
         this.enabled = false;
         this._alpha = 25;
      }
   }
   function lock(bTrue)
   {
      this.locked = bTrue;
      this.setEnabled(bTrue);
      if(bTrue)
      {
         this.gotoAndStop(2);
      }
      else
      {
         this.gotoAndStop(1);
      }
   }
   function onPress2()
   {
   }
   function onRelease2()
   {
   }
   function onRollOver2()
   {
   }
   function onRollOut2()
   {
   }
}
