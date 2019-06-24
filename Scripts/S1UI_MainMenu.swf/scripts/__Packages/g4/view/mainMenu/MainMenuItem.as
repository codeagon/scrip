class g4.view.mainMenu.MainMenuItem extends gfx.core.UIComponent
{
   var SOUND_RELEASE = "1192";
   var index = -1;
   function MainMenuItem()
   {
      super();
   }
   function onLoad()
   {
      super.onLoad();
      this.onRollOver = g4.util.Delegate.create(this,this.coverHandlerOver);
      this.onRollOut = g4.util.Delegate.create(this,this.coverHandlerOut);
      this.onRelease = g4.util.Delegate.create(this,this.coverHandlerRelease);
      this.onPress = g4.util.Delegate.create(this,this.coverHandlerPress);
      this.onReleaseOutside = g4.util.Delegate.create(this,this.coverHandlerOut);
      if(this._data != null)
      {
         this.setData(this._data);
      }
   }
   function getID()
   {
      return this.menuID;
   }
   function setSubMenu($value)
   {
      this.subMenuContain = $value;
   }
   function setMenuDisabled($disabled)
   {
      this.menuDisabled = $disabled;
      if(this.menuDisabled == 2)
      {
         this.__set__visible(false);
      }
      else
      {
         this.__set__visible(true);
         if(this.menuDisabled == 0)
         {
            this.setState("disabled");
         }
         else
         {
            this.setState("up");
         }
      }
   }
   function coverHandlerOver()
   {
      this.dispatchEvent({type:gfx.events.EventTypes.ITEM_ROLL_OVER});
      if(this.menuDisabled == 0 || this._selected)
      {
         return undefined;
      }
      this.setState("over");
   }
   function coverHandlerOut()
   {
      this.dispatchEvent({type:gfx.events.EventTypes.ITEM_ROLL_OUT});
      if(this.menuDisabled == 0 || this._selected)
      {
         return undefined;
      }
      this.setState("up");
   }
   function coverHandlerRelease()
   {
      if(this.menuDisabled == 0)
      {
         this.dispatchEvent({type:"ToGame_MainMenu_RequestDisableUI",id:this.menuID});
         return undefined;
      }
      this.setState("up");
      lib.manager.UISound.play(this.SOUND_RELEASE);
      if(this.subMenuContain)
      {
         this.dispatchEvent({type:gfx.events.EventTypes.ITEM_CLICK,id:this.menuID});
      }
      this.dispatchEvent({type:"ToGame_MainMenu_RequestShowUI",id:this.menuID});
   }
   function coverHandlerPress()
   {
      if(this.menuDisabled == 0 || this._selected)
      {
         return undefined;
      }
      this.setState("down");
   }
   function setState($state)
   {
      this.gotoAndPlay($state);
   }
   function setData($info)
   {
      this.menuID = $info[0];
      if(!this.initialized)
      {
         this._data = $info;
         return undefined;
      }
      this.groupIndex = $info[1];
      this.img = $info[2];
      this.menuText = $info[3];
      this.keyText = $info[4];
      if(this.menuDisabled == null)
      {
         this.menuDisabled = 1;
      }
      if(this.subMenuContain == null)
      {
         this.subMenuContain = false;
      }
      if(this.keyText == "LeftMouseButton")
      {
         this.keyText = "L-Click";
      }
      else if(this.keyText == "RightMouseButton")
      {
         this.keyText = "R-Click";
      }
      else if(this.keyText == undefined)
      {
         this.keyText = "";
      }
      var _loc3_ = "<font size=\'18\'>" + this.menuText + "</font>";
      lib.manager.ToolTip.add(this,_loc3_,1);
   }
   function updateData($info)
   {
      this.img = $info[0];
      this.menuText = $info[1];
      this.keyText = $info[2];
      if(this.keyText == "LeftMouseButton")
      {
         this.keyText = "L-Click";
      }
      else if(this.keyText == "RightMouseButton")
      {
         this.keyText = "R-Click";
      }
      else if(this.keyText == undefined)
      {
         this.keyText = "";
      }
      var _loc3_ = "<font size=\'18\'>" + this.menuText + "</font>";
      lib.manager.ToolTip.remove(this);
      lib.manager.ToolTip.add(this,_loc3_,1);
   }
   function setEffect($type)
   {
      if($type == 0)
      {
         if(this.mEffect != null)
         {
            this.mEffect.gotoAndStop(1);
            this.mEffect._visible = false;
         }
      }
      else if($type == 2)
      {
         if(this.mEffect == null)
         {
            this.mEffect = this.attachMovie("mEffect","mEffect",this.getNextHighestDepth());
            this.mEffect.mc.gotoAndStop(this.menuID);
            this.mEffect.hitTestDisable = true;
            this.mEffect.gotoAndPlay(2);
         }
         else
         {
            this.mEffect._visible = true;
            this.mEffect.gotoAndPlay(2);
         }
      }
   }
   function __get__selected()
   {
      return this._selected;
   }
   function __set__selected(value)
   {
      this._selected = value;
      if(this._selected)
      {
         this.setState("selected");
      }
      else
      {
         this.setState("up");
      }
      return this.__get__selected();
   }
}
