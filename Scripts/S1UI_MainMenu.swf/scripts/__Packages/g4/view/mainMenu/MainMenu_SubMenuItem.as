class g4.view.mainMenu.MainMenu_SubMenuItem extends gfx.core.UIComponent
{
   var sClamp = "";
   function MainMenu_SubMenuItem()
   {
      super();
   }
   function onLoad()
   {
      super.onLoad();
      this.mCount._visible = false;
      this.mMatching._visible = false;
      this.onRollOver = g4.util.Delegate.create(this,this.itemHandlerOver);
      this.onRollOut = g4.util.Delegate.create(this,this.itemHandlerOut);
      this.onPress = g4.util.Delegate.create(this,this.itemHandlerPress);
      this.onRelease = g4.util.Delegate.create(this,this.itemHandlerRelease);
      this.onReleaseOutside = g4.util.Delegate.create(this,this.itemHandlerOut);
      if(this._data != null)
      {
         this.setData(this._data);
      }
   }
   function configUI()
   {
      this.constraints = new gfx.utils.Constraints(this,true);
      this.constraints.addElement(this.textField,gfx.utils.Constraints.LEFT | gfx.utils.Constraints.RIGHT);
      this.constraints.addElement(this.mCount,gfx.utils.Constraints.RIGHT);
      super.configUI();
   }
   function draw()
   {
      if(this.sizeIsInvalid)
      {
         this._width = this.__width;
         this._height = this.__height;
      }
      if(this.initialized)
      {
         this.constraints.update(this.__width,this.__height);
      }
   }
   function itemHandlerOver()
   {
      this.dispatchEvent({type:gfx.events.EventTypes.ITEM_ROLL_OVER,id:this._data.SubID});
      if(this._data.MenuDisabled == 0)
      {
         return undefined;
      }
      this.setState("over");
   }
   function itemHandlerOut()
   {
      this.dispatchEvent({type:gfx.events.EventTypes.ITEM_ROLL_OUT});
      if(this._data.MenuDisabled == 0)
      {
         return undefined;
      }
      this.setState("up");
   }
   function itemHandlerPress()
   {
      if(this._data.MenuDisabled == 0)
      {
         return undefined;
      }
      this.setState("down");
   }
   function itemHandlerRelease()
   {
      if(this._data.MenuDisabled == 0)
      {
         this.dispatchEvent({type:"ToGame_MainMenu_RequestDisableUI",id:this._data.SubID});
         return undefined;
      }
      this.setState("over");
      this.dispatchEvent({type:"ToGame_MainMenu_RequestShowUI",id:this._data.SubID});
      lib.manager.UISound.play("3023");
   }
   function setState($state)
   {
      this.gotoAndPlay($state);
      this.mMatching.gotoAndPlay($state);
      var _loc2_ = 0;
      if(this.mCount._visible)
      {
         _loc2_ = _loc2_ + 23;
      }
      if(this.mMatching._visible)
      {
         _loc2_ = _loc2_ + 20;
      }
      this.textField._width = 169 - _loc2_;
      if(this.sClamp != "")
      {
         this.textField.text = this.sClamp;
      }
      else
      {
         this.textField.text = this._label;
      }
   }
   function setData($data)
   {
      this._data = $data;
      if(!this.initialized)
      {
         return undefined;
      }
      if(this._data.MenuDisabled == 0)
      {
         this.gotoAndStop(31);
      }
      else
      {
         this.gotoAndStop(1);
      }
      this._label = this._data.MenuName;
      if(this._data.KeyName != "" && this._data.KeyName != null)
      {
         this._label = this._label + ("(" + this._data.KeyName + ")");
      }
      this.textField.text = this._label;
      var _loc2_ = 0;
      if(this._data.Tag != "" && this._data.Tag != "0")
      {
         this.mCount._visible = true;
         this.mCount.textField.text = this._data.Tag;
         _loc2_ = _loc2_ + 23;
      }
      else
      {
         this.mCount._visible = false;
      }
      if(this._data.Effect == 1)
      {
         this.mMatching._visible = true;
         _loc2_ = _loc2_ + 20;
         if(this.mCount._visible)
         {
            this.mMatching._x = 138;
         }
         else
         {
            this.mMatching._x = 157;
         }
      }
      else if(this._data.Effect == 0)
      {
         this.mMatching._visible = false;
      }
      this.textField._width = 169 - _loc2_;
      lib.manager.ToolTip.remove(this.cover);
      if(this.textField._width < this.textField.textWidth + 4)
      {
         lib.manager.ToolTip.add(this.cover,this._label,1);
         var _loc4_ = this.textField.getCharIndexAtPoint(this.textField._width - 15,10);
         var _loc3_ = this._label.substr(0,_loc4_);
         this.sClamp = _loc3_ + "...";
         this.textField.text = this.sClamp;
      }
      else
      {
         this.sClamp = "";
      }
   }
   function getData()
   {
      return this._data;
   }
}
