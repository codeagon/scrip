class g4.view.chat.ChatTab extends g4.core.SimpleView
{
   var buttonFrameUp = 1;
   var buttonFrameOver = 2;
   var buttonFrameDown = 3;
   var buttonFrameSelectedUp = 4;
   var origTextFieldY = 0;
   var origTextFieldHeight = 0;
   var textFieldOffsetYDown = 0;
   var origFontSize = 0;
   var tabID = -2;
   var glowVisible = true;
   var _selected = false;
   function ChatTab(targetMovieClip)
   {
      super(targetMovieClip);
      this.configUI();
   }
   function __get__selected()
   {
      return this._selected;
   }
   function __set__selected(value)
   {
      if(value == this._selected)
      {
         return undefined;
      }
      this._selected = value;
      this.updateBySelected();
      return this.__get__selected();
   }
   function configUI()
   {
      this.textField = this.__get__targetMovieClip().textField;
      this.mc_button = this.__get__targetMovieClip().mc_button;
      this.origTextFieldY = this.textField._y;
      this.origTextFieldHeight = this.textField._height;
      var _loc2_ = this.textField.getNewTextFormat();
      this.origFontSize = _loc2_.size;
      this.tempTextFormat = new TextFormat();
      this.textField.verticalAlign = "center";
      this.textField.wordWrap = true;
      this.textField.multiline = true;
      this.textField.html = false;
      g4.util.UIUtil.setMouseEnabled(this.textField,false);
      g4.util.UIUtil.setTextFieldStyle(this.textField,g4.util.UIUtil.TEXT_FIELD_STYLE_1);
      this.mc_button.onRollOver = gfx.utils.Delegate.create(this,function(mouseIndex)
      {
         this.setState("over");
      }
      );
      this.mc_button.onRollOut = gfx.utils.Delegate.create(this,function(mouseIndex)
      {
         this.setState("up");
      }
      );
      this.mc_button.onPress = gfx.utils.Delegate.create(this,function(mouseIndex, keyboardOrMouse, button)
      {
         this.setState("down");
         lib.manager.UISound.play(lib.manager.UISound.TABMENU_BTN);
         this.sendEvent("press",mouseIndex,button);
      }
      );
      this.mc_button.onRelease = gfx.utils.Delegate.create(this,function(mouseIndex, keyboardOrMouse, button)
      {
         this.setState("over");
         this.sendEvent("release",mouseIndex,button);
      }
      );
      this.mc_button.onReleaseOutside = gfx.utils.Delegate.create(this,function(mouseIndex, keyboardOrMouse, button)
      {
         this.setState("up");
         this.sendEvent("releaseOutside",mouseIndex,button);
      }
      );
      this.mc_button.onPressAux = gfx.utils.Delegate.create(this,function(mouseIndex, keyboardOrMouse, button)
      {
         this.sendEvent("press",mouseIndex,button);
      }
      );
      this.updateBySelected();
      this.cleanUp();
      g4.model.GameModel.addEventListener(g4.view.ViewID.CHAT_2,g4.model.GameModelEventType.MAIN_UI_MODE_CHANGED,this,"model_mainUIModeChangeHandler");
   }
   function getTabID()
   {
      return this.tabID;
   }
   function setTabID(value)
   {
      if(value != this.tabID)
      {
         var _loc2_ = g4.model.GameModel.chatModel.getChatTabData(value);
         if(_loc2_ == null)
         {
            this.cleanUp();
            return undefined;
         }
         this.tabID = value;
         this.chatTabData = _loc2_;
         this.__get__targetMovieClip()._visible = true;
      }
      this.update();
   }
   function cleanUp()
   {
      if(this.tabID == -1)
      {
         return undefined;
      }
      this.tabID = -1;
      this.chatTabData = null;
      this.__get__targetMovieClip()._visible = false;
      this.setLabel("");
      this.setGlowVisible(false);
   }
   function update()
   {
      if(this.tabID == -1)
      {
         return undefined;
      }
      this.setLabel(this.chatTabData.name);
      this.updateByUIMode();
   }
   function updateByUIMode()
   {
      if(this.tabID == -1)
      {
         return undefined;
      }
      if(g4.model.GameModel.mainModel.uiMode)
      {
         this.setAlpha(this.chatTabData.alpha);
      }
      else
      {
         this.setAlpha(this.chatTabData.alpha + g4.view.chat.ChatConstants.NOT_UI_MODE_ALPHA_OFFSET);
      }
   }
   function getGlowVisible()
   {
      return this.glowVisible;
   }
   function setGlowVisible(bShow)
   {
      if(bShow == this.glowVisible)
      {
         return undefined;
      }
      this.glowVisible = bShow;
      this.updateByState();
      var _loc2_ = this.textField;
      if(this.glowVisible)
      {
         this.textField._alpha = 0;
         lib.util.Warning.add(_loc2_);
      }
      else
      {
         lib.util.Warning.remove(_loc2_,true);
         this.textField._alpha = 100;
      }
   }
   function setAlpha(value)
   {
      this.mc_button._alpha = value;
   }
   function setLabel(text)
   {
      var _loc3_ = 4;
      var _loc4_ = 8;
      this.textField.text = text;
      var _loc2_ = this.origFontSize;
      while(true)
      {
         this.tempTextFormat.size = _loc2_;
         this.textField.setTextFormat(this.tempTextFormat);
         if(this.textField.textHeight + _loc3_ <= this.origTextFieldHeight)
         {
            break;
         }
         _loc2_ = _loc2_ - 0.1;
         if(_loc2_ < _loc4_)
         {
            break;
         }
      }
      this.textField._height = Math.max(this.origTextFieldHeight,this.textField.textHeight + _loc3_);
   }
   function updateBySelected()
   {
      this.setState("up");
   }
   function setState(state)
   {
      this.currentState = state;
      this.updateByState();
   }
   function updateByState()
   {
      this.updateSkinByState();
      this.updateTextColorByState();
   }
   function updateSkinByState()
   {
      if(this._selected)
      {
         this.mc_button.gotoAndStop(this.buttonFrameSelectedUp);
         this.textField._y = this.origTextFieldY + this.textFieldOffsetYDown;
         return undefined;
      }
      switch(this.currentState)
      {
         case "up":
            this.mc_button.gotoAndStop(this.buttonFrameUp);
            this.textField._y = this.origTextFieldY;
            break;
         case "over":
            this.mc_button.gotoAndStop(this.buttonFrameOver);
            this.textField._y = this.origTextFieldY;
            break;
         case "down":
            this.mc_button.gotoAndStop(this.buttonFrameDown);
            this.textField._y = this.origTextFieldY + this.textFieldOffsetYDown;
      }
   }
   function updateTextColorByState()
   {
      if(this._selected || this.glowVisible)
      {
         this.setTextFieldColor(g4.view.chat.ChatConstants.CHAT_TAB_TEXT_COLOR_SELECTED_UP,g4.view.chat.ChatConstants.CHAT_TAB_TEXT_FILTER_COLOR_SELECTED_UP);
         return undefined;
      }
      switch(this.currentState)
      {
         case "up":
            this.setTextFieldColor(g4.view.chat.ChatConstants.CHAT_TAB_TEXT_COLOR_UP,g4.view.chat.ChatConstants.CHAT_TAB_TEXT_FILTER_COLOR_UP);
            break;
         case "over":
            this.setTextFieldColor(g4.view.chat.ChatConstants.CHAT_TAB_TEXT_COLOR_OVER,g4.view.chat.ChatConstants.CHAT_TAB_TEXT_FILTER_COLOR_OVER);
            break;
         case "down":
            this.setTextFieldColor(g4.view.chat.ChatConstants.CHAT_TAB_TEXT_COLOR_DOWN,g4.view.chat.ChatConstants.CHAT_TAB_TEXT_FILTER_COLOR_DOWN);
      }
   }
   function setTextFieldColor(textColor, filterColor)
   {
      this.textField.textColor = textColor;
      if(g4.view.chat.ChatTab.textFieldFilters == null)
      {
         g4.view.chat.ChatTab.textFieldFilter = g4.util.UIUtil.getTextFieldFilter(g4.util.UIUtil.TEXT_FIELD_STYLE_1);
         g4.view.chat.ChatTab.textFieldFilters = [g4.view.chat.ChatTab.textFieldFilter];
      }
      g4.view.chat.ChatTab.textFieldFilter.color = filterColor;
      this.textField.filters = g4.view.chat.ChatTab.textFieldFilters;
   }
   function sendEvent(type, mouseIndex, button)
   {
      var _loc2_ = {};
      _loc2_.type = type;
      _loc2_.mouseIndex = mouseIndex;
      _loc2_.button = !isNaN(button)?button:1;
      this.dispatchEvent(_loc2_);
   }
   function model_mainUIModeChangeHandler(event)
   {
      this.updateByUIMode();
   }
}
