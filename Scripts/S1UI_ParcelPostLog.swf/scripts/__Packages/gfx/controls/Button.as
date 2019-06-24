class gfx.controls.Button extends gfx.core.UIComponent
{
   var state = "up";
   var toggle = false;
   var doubleClickEnabled = false;
   var autoRepeat = false;
   var lockDragStateChange = false;
   var _selected = false;
   var _autoSize = false;
   var _disableFocus = false;
   var _disableConstraints = false;
   var doubleClickDuration = 250;
   var buttonRepeatDuration = 100;
   var buttonRepeatDelay = 100;
   var pressedByKeyboard = false;
   var stateMap = {up:["up"],over:["over"],down:["down"],release:["release","over"],out:["out","up"],disabled:["disabled"],selecting:["selecting","over"],kb_selecting:["kb_selecting","up"],kb_release:["kb_release","out","up"],kb_down:["kb_down","down"]};
   function Button()
   {
      super();
      this.focusEnabled = this.tabEnabled = !this._disableFocus?!this._disabled:false;
      if(this.inspectableGroupName != null && this.inspectableGroupName != "")
      {
         this.__set__group(this.inspectableGroupName);
      }
   }
   function __get__labelID()
   {
      return null;
   }
   function __set__labelID(value)
   {
      if(value != "")
      {
         this.__set__label(gfx.utils.Locale.getTranslatedString(value));
      }
      return this.__get__labelID();
   }
   function __get__label()
   {
      return this._label;
   }
   function __set__label(value)
   {
      this._label = value;
      if(this.textField != null)
      {
         this.textField.text = this._label;
      }
      if(this._autoSize && this.textField != null && this.initialized)
      {
         this.__width = this._width = this.calculateWidth();
      }
      this.updateAfterStateChange();
      return this.__get__label();
   }
   function __get__disabled()
   {
      return this._disabled;
   }
   function __set__disabled(value)
   {
      if(this._disabled == value)
      {
         return undefined;
      }
      super.__set__disabled(value);
      this.clearRepeatInterval();
      this.focusEnabled = this.tabEnabled = !this._disableFocus?!this._disabled:false;
      this.setState(!this._disabled?"up":"disabled");
      return this.__get__disabled();
   }
   function __get__selected()
   {
      return this._selected;
   }
   function __set__selected(value)
   {
      if(this._selected == value)
      {
         return undefined;
      }
      this._selected = value;
      if(!this._disabled)
      {
         if(!this._focused)
         {
            this.setState(!(this.__get__displayFocus() && this.focusIndicator == null)?"up":"over");
         }
         else if(this.pressedByKeyboard && this.focusIndicator != null)
         {
            this.setState("kb_selecting");
         }
         else
         {
            this.setState("selecting");
         }
      }
      if(this.dispatchEvent != null)
      {
         this.dispatchEvent({type:"select",selected:this._selected});
      }
      return this.__get__selected();
   }
   function __get__groupName()
   {
      return this._group != null?this._group.name:null;
   }
   function __set__groupName(value)
   {
      this.__set__group(value);
      return this.__get__groupName();
   }
   function __get__group()
   {
      return this._group;
   }
   function __set__group(value)
   {
      var _loc2_ = (gfx.controls.ButtonGroup)value;
      if(typeof value == "string")
      {
         _loc2_ = this._parent["_buttonGroup_" + value];
         if(_loc2_ == null)
         {
            this._parent["_buttonGroup_" + value] = _loc2_ = new gfx.controls.ButtonGroup(value.toString(),this._parent);
         }
      }
      if(this._group == _loc2_)
      {
         return undefined;
      }
      if(this._group != null)
      {
         this._group.removeButton(this);
      }
      this._group = _loc2_;
      if(this._group != null)
      {
         _loc2_.addButton(this);
      }
      return this.__get__group();
   }
   function __get__disableFocus()
   {
      return this._disableFocus;
   }
   function __set__disableFocus(value)
   {
      this._disableFocus = value;
      this.focusEnabled = this.tabEnabled = !this._disableFocus?!this._disabled:false;
      return this.__get__disableFocus();
   }
   function __get__disableConstraints()
   {
      return this._disableConstraints;
   }
   function __set__disableConstraints(value)
   {
      this._disableConstraints = value;
      return this.__get__disableConstraints();
   }
   function __get__autoSize()
   {
      return this._autoSize;
   }
   function __set__autoSize(value)
   {
      this._autoSize = value;
      if(value && this.initialized)
      {
         this.__set__width(this.calculateWidth());
      }
      return this.__get__autoSize();
   }
   function setSize(width, height)
   {
      super.setSize(width,height);
   }
   function handleInput(details, pathToFocus)
   {
      if((var _loc0_ = details.navEquivalent) !== gfx.ui.NavigationCode.ENTER)
      {
         return false;
      }
      if(details.value == "keyDown")
      {
         if(!this.pressedByKeyboard)
         {
            this.handlePress();
         }
      }
      else
      {
         this.handleRelease();
      }
      return true;
   }
   function toString()
   {
      return "[Scaleform Button " + this._name + "]";
   }
   function configUI()
   {
      if(this.bindingEnabled)
      {
         flash.external.ExternalInterface.call("__registerControl",this._name,this,"Button");
         this.addEventListener("click",this,"dispatchEventToGame");
         this.bindingEnabled = false;
      }
      this.constraints = new gfx.utils.Constraints(this,true);
      if(!this._disableConstraints)
      {
         this.constraints.addElement(this.textField,gfx.utils.Constraints.ALL);
      }
      super.configUI();
      if(this._autoSize)
      {
         this.sizeIsInvalid = true;
      }
      this.onRollOver = this.handleMouseRollOver;
      this.onRollOut = this.handleMouseRollOut;
      this.onPress = this.handleMousePress;
      this.onRelease = this.handleMouseRelease;
      this.onDragOver = this.handleDragOver;
      this.onDragOut = this.handleDragOut;
      this.onReleaseOutside = this.handleReleaseOutside;
      if(this.focusIndicator != null && !this._focused && this.focusIndicator._totalFrames == 1)
      {
         this.focusIndicator._visible = false;
      }
      this.updateAfterStateChange();
   }
   function draw()
   {
      if(this.sizeIsInvalid)
      {
         if(this._autoSize && this.textField != null)
         {
            this.__width = this.calculateWidth();
         }
         this._width = this.__width;
         this._height = this.__height;
      }
      this.constraints.update(this.__width,this.__height);
   }
   function updateAfterStateChange()
   {
      if(!this.initialized)
      {
         return undefined;
      }
      this.validateNow();
      if(this.textField != null && this._label != null)
      {
         this.textField.text = this._label;
      }
      if(this.constraints != null)
      {
         this.constraints.update(this.__get__width(),this.__get__height());
      }
      this.dispatchEvent({type:"stateChange",state:this.state});
   }
   function calculateWidth()
   {
      if(this.constraints == null)
      {
         this.invalidate();
         return undefined;
      }
      var _loc2_ = this.constraints.getElement(this.textField).metrics;
      var _loc3_ = this.textField.textWidth + _loc2_.left + _loc2_.right + 5;
      return _loc3_;
   }
   function setState(state)
   {
      this.state = state;
      var _loc5_ = this.getStatePrefixes();
      var _loc3_ = this.stateMap[state];
      if(_loc3_ == null || _loc3_.length == 0)
      {
         return undefined;
      }
      do
      {
         var _loc4_ = _loc5_.pop().toString();
         var _loc2_ = _loc3_.length - 1;
         while(_loc2_ >= 0)
         {
            this.gotoAndPlay(_loc4_ + _loc3_[_loc2_]);
            _loc2_ = _loc2_ - 1;
         }
      }
      while(_loc5_.length > 0);
      
      this.updateAfterStateChange();
   }
   function getStatePrefixes()
   {
      return !this._selected?[""]:["selected_",""];
   }
   function changeFocus()
   {
      if(this._disabled)
      {
         return undefined;
      }
      if(this.focusIndicator == null)
      {
         this.setState(!(this._focused || this._displayFocus)?"out":"over");
      }
      if(this.focusIndicator != null)
      {
         if(this.focusIndicator._totalframes == 1)
         {
            this.focusIndicator._visible = this._focused;
         }
         else
         {
            this.focusIndicator.gotoAndPlay(!this._focused?"hide":"show");
         }
         if(this.pressedByKeyboard && !this._focused)
         {
            this.setState("kb_release");
            this.pressedByKeyboard = false;
         }
      }
   }
   function handleMouseRollOver(mouseIndex)
   {
      if(this._disabled)
      {
         return undefined;
      }
      if(!this._focused && !this._displayFocus || this.focusIndicator != null)
      {
         this.setState("over");
      }
      this.dispatchEvent({type:"rollOver",mouseIndex:mouseIndex});
   }
   function handleMouseRollOut(mouseIndex)
   {
      if(this._disabled)
      {
         return undefined;
      }
      if(!this._focused && !this._displayFocus || this.focusIndicator != null)
      {
         this.setState("out");
      }
      this.dispatchEvent({type:"rollOut",mouseIndex:mouseIndex});
   }
   function handleMousePress(mouseIndex, button)
   {
      if(this._disabled)
      {
         return undefined;
      }
      if(!this._disableFocus)
      {
         Selection.setFocus(this);
      }
      this.setState("down");
      this.dispatchEvent({type:"press",mouseIndex:mouseIndex,button:button});
      if(this.autoRepeat)
      {
         this.buttonRepeatInterval = setInterval(this,"beginButtonRepeat",this.buttonRepeatDelay,mouseIndex,button);
      }
   }
   function handlePress()
   {
      if(this._disabled)
      {
         return undefined;
      }
      this.pressedByKeyboard = true;
      this.setState(this.focusIndicator != null?"kb_down":"down");
      this.dispatchEvent({type:"press"});
   }
   function handleMouseRelease(mouseIndex, button)
   {
      if(this._disabled)
      {
         return undefined;
      }
      clearInterval(this.buttonRepeatInterval);
      delete this.buttonRepeatInterval;
      if(this.doubleClickEnabled)
      {
         if(this.doubleClickInterval == null)
         {
            this.doubleClickInterval = setInterval(this,"doubleClickExpired",this.doubleClickDuration);
         }
         else
         {
            this.doubleClickExpired();
            this.dispatchEvent({type:"doubleClick",mouseIndex:mouseIndex,button:button});
            this.setState("release");
            return undefined;
         }
      }
      this.setState("release");
      this.handleClick(mouseIndex,button);
   }
   function handleRelease()
   {
      if(this._disabled)
      {
         return undefined;
      }
      this.setState(this.focusIndicator != null?"kb_release":"release");
      this.handleClick(null);
      this.pressedByKeyboard = false;
   }
   function handleClick(mouseIndex, button)
   {
      if(this.toggle)
      {
         this.__set__selected(!this._selected);
      }
      this.dispatchEvent({type:"click",mouseIndex:mouseIndex,button:button});
   }
   function handleDragOver(mouseIndex)
   {
      if(this._disabled || this.lockDragStateChange)
      {
         return undefined;
      }
      if(this._focused || this._displayFocus)
      {
         this.setState(this.focusIndicator != null?"kb_down":"down");
      }
      else
      {
         this.setState("over");
      }
      this.dispatchEvent({type:"dragOver",mouseIndex:mouseIndex});
   }
   function handleDragOut(mouseIndex)
   {
      if(this._disabled || this.lockDragStateChange)
      {
         return undefined;
      }
      if(this._focused || this._displayFocus)
      {
         this.setState(this.focusIndicator != null?"kb_release":"release");
      }
      else
      {
         this.setState("out");
      }
      this.dispatchEvent({type:"dragOut",mouseIndex:mouseIndex});
   }
   function handleReleaseOutside(mouseIndex, button)
   {
      this.clearRepeatInterval();
      if(this._disabled)
      {
         return undefined;
      }
      if(this.lockDragStateChange)
      {
         if(this._focused || this._displayFocus)
         {
            this.setState(this.focusIndicator != null?"kb_release":"release");
         }
         else
         {
            this.setState("kb_release");
         }
      }
      this.dispatchEvent({type:"releaseOutside",state:this.state,button:button});
   }
   function doubleClickExpired()
   {
      clearInterval(this.doubleClickInterval);
      delete this.doubleClickInterval;
   }
   function beginButtonRepeat(mouseIndex, button)
   {
      this.clearRepeatInterval();
      this.buttonRepeatInterval = setInterval(this,"handleButtonRepeat",this.buttonRepeatDuration,mouseIndex,button);
   }
   function handleButtonRepeat(mouseIndex, button)
   {
      this.dispatchEvent({type:"click",mouseIndex:mouseIndex,button:button});
   }
   function clearRepeatInterval()
   {
      clearInterval(this.buttonRepeatInterval);
      delete this.buttonRepeatInterval;
   }
}
