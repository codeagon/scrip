class g4.view.chat.MainChatTabBar extends g4.core.SimpleView
{
   var COMMAND_REMOVE_TAB = 1;
   var COMMAND_TAB_OPTION = 2;
   var COMMAND_PRIVATE_CHANNEL = 3;
   var COMMAND_ADD_TAB = 4;
   var interactinoMenuTabID = -1;
   var divideTabID = -1;
   var regMouseX = 0;
   var regMouseY = 0;
   var mouseOffsetTabDivide = 15;
   var actualTabsWidth = 0;
   var tabAreaMaskWidth = 0;
   var tabScrollPositionMax = 0;
   var tabScrollPosition = 0;
   var tabScrollDirection = 0;
   var buttonRightOffsetX = 0;
   var tabAreaOffsetX = 0;
   var emphasisRightOffsetX = 0;
   function MainChatTabBar(targetMovieClip)
   {
      super(targetMovieClip);
      this.configUI();
   }
   function configUI()
   {
      this.tweenObject = {};
      this.mc_tab_area = this.__get__targetMovieClip().mc_tab_area;
      this.mc_mask = this.mc_tab_area.mc_mask;
      this.mc_tab_container = this.mc_tab_area.mc_tab_container;
      this.mc_tab_position_indicator = this.mc_tab_area.mc_tab_position_indicator;
      this.button_add = this.mc_tab_container.button_add;
      this.button_left = this.__get__targetMovieClip().button_left;
      this.button_right = this.__get__targetMovieClip().button_right;
      this.mc_emphasis_left = this.__get__targetMovieClip().mc_emphasis_left;
      this.mc_emphasis_right = this.__get__targetMovieClip().mc_emphasis_right;
      this.buttonRightOffsetX = this.button_right._x - g4.view.chat.ChatConstants.STYLE_CHAT_BASE_WIDTH;
      this.emphasisRightOffsetX = this.mc_emphasis_right._x - g4.view.chat.ChatConstants.STYLE_CHAT_BASE_WIDTH;
      this.tabAreaOffsetX = this.mc_mask._width - g4.view.chat.ChatConstants.STYLE_CHAT_BASE_WIDTH;
      var _loc7_ = "$Chat2.ChatTab";
      var _loc6_ = [this.mc_tab_container.mc_tab];
      var _loc2_ = undefined;
      var _loc5_ = g4.model.GameConstants.CHAT_MAX_TAB_COUNT;
      _loc2_ = 1;
      while(_loc2_ < _loc5_)
      {
         _loc6_.push(this.mc_tab_container.attachMovie(_loc7_,"mc_tab_" + _loc2_,this.mc_tab_container.getNextHighestDepth()));
         _loc2_ = _loc2_ + 1;
      }
      this.chatTabArray = [];
      var _loc4_ = undefined;
      var _loc3_ = undefined;
      _loc2_ = 0;
      while(_loc2_ < _loc5_)
      {
         _loc3_ = _loc6_[_loc2_];
         _loc3_._x = (g4.view.chat.ChatConstants.CHAT_TAB_WIDTH + g4.view.chat.ChatConstants.CHAT_TAB_GAP) * _loc2_;
         _loc3_._y = 0;
         _loc4_ = new g4.view.chat.ChatTab(_loc3_);
         _loc4_.addEventListener("press",this,"chatTab_pressHandler");
         this.chatTabArray.push(_loc4_);
         _loc2_ = _loc2_ + 1;
      }
      this.button_add.addEventListener("click",this,"button_add_clickHandler");
      this.button_left.addEventListener("press",this,"button_left_pressHandler");
      this.button_right.addEventListener("press",this,"button_right_pressHandler");
      g4.util.UIUtil.setMouseEnabled(this.mc_emphasis_left,false);
      g4.util.UIUtil.setMouseEnabled(this.mc_emphasis_right,false);
      this.updateByTabData();
      this.updateByUIMode();
      this.cleanUp();
      g4.model.GameModel.addEventListener(g4.view.ViewID.CHAT_2,g4.model.GameModelEventType.MAIN_UI_MODE_CHANGED,this,"model_mainUIModeChangeHandler");
      g4.model.GameModel.addEventListener(g4.view.ViewID.CHAT_2,g4.model.GameModelEventType.CHAT_TAB_ADD,this,"model_chatTabAddHandler");
      g4.model.GameModel.addEventListener(g4.view.ViewID.CHAT_2,g4.model.GameModelEventType.CHAT_TAB_UPDATE,this,"model_chatTabUpdateHandler");
      g4.model.GameModel.addEventListener(g4.view.ViewID.CHAT_2,g4.model.GameModelEventType.CHAT_TAB_REMOVE,this,"model_chatTabRemoveHandler");
      g4.model.GameModel.addEventListener(g4.view.ViewID.CHAT_2,g4.model.GameModelEventType.CHAT_TAB_ALL_REMOVE,this,"model_chatTabAllRemoveHandler");
      g4.model.GameModel.addEventListener(g4.view.ViewID.CHAT_2,g4.model.GameModelEventType.CHAT_SELECTED_MAIN_TAB_CHANGE,this,"model_chatSelectedMainTabChangeHandler");
      g4.model.GameModel.addEventListener(g4.view.ViewID.CHAT_2,g4.model.GameModelEventType.CHAT_CHAT_TAB_DRAGGING_START,this,"model_chatChatTabDraggingStartHandler");
      g4.model.GameModel.addEventListener(g4.view.ViewID.CHAT_2,g4.model.GameModelEventType.CHAT_CHAT_TAB_DRAGGING_END,this,"model_chatChatTabDraggingEndHandler");
      g4.model.GameModel.addEventListener(g4.view.ViewID.CHAT_2,g4.model.GameModelEventType.CHAT_CHAT_TEXT_ADD,this,"model_chatChatTextAddHandler");
   }
   function setSize(w, h)
   {
      this.button_right._x = w + this.buttonRightOffsetX;
      this.mc_emphasis_right._x = w + this.emphasisRightOffsetX;
      this.tabAreaMaskWidth = w + this.tabAreaOffsetX;
      this.mc_mask._width = this.tabAreaMaskWidth;
      this.updateAfterTabAreaSizeChanged();
   }
   function cleanUp()
   {
      this.stopChatTabDraggingTracking();
   }
   function updateByUIMode()
   {
      if(g4.model.GameModel.mainModel.uiMode)
      {
         this.button_left._visible = true;
         this.button_right._visible = true;
         this.button_add._visible = true;
      }
      else
      {
         this.button_left._visible = false;
         this.button_right._visible = false;
         this.button_add._visible = false;
      }
   }
   function sendUpdateBorderEvent()
   {
      this.dispatchEvent({type:"updateBorder"});
   }
   function getTabMinX()
   {
      return this.mc_tab_area._x;
   }
   function getTabMaxX()
   {
      return this.getTabMinX() + this.tabAreaMaskWidth;
   }
   function getSelectedTabActualX()
   {
      return this.getTabMinX() + this.selectedTab.__get__targetMovieClip()._x - this.tabScrollPosition;
   }
   function getSelectedTabLeft()
   {
      if(this.selectedTab == null)
      {
         return this.getTabMinX();
      }
      return Math.max(this.getTabMinX(),Math.min(this.getTabMaxX(),this.getSelectedTabActualX()));
   }
   function getSelectedTabRight()
   {
      if(this.selectedTab == null)
      {
         return this.getTabMinX();
      }
      return Math.max(this.getTabMinX(),Math.min(this.getTabMaxX(),this.getSelectedTabActualX() + g4.view.chat.ChatConstants.CHAT_TAB_WIDTH));
   }
   function updateAfterTabAreaSizeChanged()
   {
      if(this.actualTabsWidth > this.tabAreaMaskWidth)
      {
         this.tabScrollPositionMax = this.actualTabsWidth - this.tabAreaMaskWidth;
         this.setTabScrollPosition(this.tabScrollPosition);
      }
      else
      {
         this.tabScrollPositionMax = 0;
         this.setTabScrollPosition(0);
      }
   }
   function setTabScrollPosition(value, useTween)
   {
      gs.TweenLite.killTweensOf(this.tweenObject,false);
      if(useTween)
      {
         this.tweenObject.scrollPosition = this.tabScrollPosition;
         gs.TweenLite.to(this.tweenObject,0.3,{scrollPosition:value,ease:gs.easing.Cubic.easeOut,onUpdate:gfx.utils.Delegate.create(this,function()
         {
            this._setTabScrollPosition(this.tweenObject.scrollPosition);
         }
         )});
      }
      else
      {
         this._setTabScrollPosition(value);
      }
   }
   function _setTabScrollPosition(value)
   {
      value = Math.max(0,Math.min(this.tabScrollPositionMax,value));
      this.tabScrollPosition = value;
      this.mc_tab_container._x = - this.tabScrollPosition;
      if(this.tabScrollPositionMax > 0)
      {
         this.setButtonEnabled(this.button_left,this.tabScrollPosition > 0);
         this.setButtonEnabled(this.button_right,this.tabScrollPosition < this.tabScrollPositionMax);
      }
      else
      {
         this.setButtonEnabled(this.button_left,false);
         this.setButtonEnabled(this.button_right,false);
      }
      this.updateScrollButtonEmphasis();
      this.sendUpdateBorderEvent();
   }
   function setButtonEnabled(button, enabled)
   {
      button.__set__disabled(!enabled);
   }
   function startTabScroll(direction)
   {
      this.tabScrollDirection = direction;
      this.doTabScroll();
      this.clearIntervalTabScroll();
      this.tabScrollIntervalID = setInterval(this,"tabScrollFirst",500);
      Mouse.addListener(this);
   }
   function tabScrollFirst()
   {
      this.doTabScroll();
      this.clearIntervalTabScroll();
      this.tabScrollIntervalID = setInterval(this,"doTabScroll",35);
   }
   function doTabScroll()
   {
      this.setTabScrollPosition(this.tabScrollPosition + this.tabScrollDirection * g4.view.chat.ChatConstants.CHAT_TAB_SCROLL_SIZE,true);
   }
   function stopTabScroll()
   {
      this.clearIntervalTabScroll();
   }
   function clearIntervalTabScroll()
   {
      if(this.tabScrollIntervalID != 0)
      {
         clearInterval(this.tabScrollIntervalID);
         this.tabScrollIntervalID = 0;
      }
   }
   function canToAddTab()
   {
      return g4.model.GameModel.chatModel.__get__chatTabCount() < g4.model.GameConstants.CHAT_MAX_TAB_COUNT;
   }
   function updateByTabData()
   {
      var _loc4_ = g4.model.GameModel.chatModel.__get__mainChatTabCount();
      var _loc3_ = undefined;
      var _loc2_ = undefined;
      var _loc5_ = g4.model.GameConstants.CHAT_MAX_TAB_COUNT;
      _loc2_ = 0;
      while(_loc2_ < _loc5_)
      {
         _loc3_ = (g4.view.chat.ChatTab)this.chatTabArray[_loc2_];
         if(_loc2_ < _loc4_)
         {
            _loc3_.setTabID(g4.model.GameModel.chatModel.getMainChatTabIDAt(_loc2_));
         }
         else
         {
            _loc3_.cleanUp();
         }
         _loc2_ = _loc2_ + 1;
      }
      var _loc6_ = g4.view.chat.ChatConstants.CHAT_TAB_WIDTH * g4.model.GameModel.chatModel.__get__mainChatTabCount() + g4.view.chat.ChatConstants.CHAT_TAB_GAP * Math.max(0,g4.model.GameModel.chatModel.__get__mainChatTabCount() - 1);
      if(this.canToAddTab())
      {
         this.button_add.__set__disabled(false);
      }
      else
      {
         this.button_add.__set__disabled(true);
      }
      this.button_add._x = (g4.view.chat.ChatConstants.CHAT_TAB_WIDTH + g4.view.chat.ChatConstants.CHAT_TAB_GAP) * g4.model.GameModel.chatModel.__get__mainChatTabCount();
      _loc6_ = _loc6_ + (g4.view.chat.ChatConstants.CHAT_TAB_GAP + g4.view.chat.ChatConstants.TAB_ADD_BUTTON_WIDTH);
      this.actualTabsWidth = _loc6_;
      this.updateAfterTabAreaSizeChanged();
      this.updateBySelectedTab();
      if(g4.view.chat.ChatGlobals.requestAddTabByUser)
      {
         g4.view.chat.ChatGlobals.requestAddTabByUser = false;
         this.setTabScrollPosition(this.tabScrollPositionMax,true);
      }
   }
   function updateBySelectedTab()
   {
      var _loc4_ = null;
      var _loc6_ = g4.model.GameModel.chatModel.__get__selectedMainChatTabID();
      var _loc2_ = undefined;
      var _loc3_ = undefined;
      var _loc5_ = g4.model.GameModel.chatModel.__get__mainChatTabCount();
      _loc3_ = 0;
      while(_loc3_ < _loc5_)
      {
         _loc2_ = (g4.view.chat.ChatTab)this.chatTabArray[_loc3_];
         if(_loc2_.getTabID() == _loc6_)
         {
            _loc2_.__set__selected(true);
            _loc4_ = _loc2_;
         }
         else
         {
            _loc2_.__set__selected(false);
         }
         _loc3_ = _loc3_ + 1;
      }
      this.selectedTab = _loc4_;
      this.sendUpdateBorderEvent();
   }
   function getChatTabByTabID(tabID)
   {
      var _loc3_ = undefined;
      var _loc2_ = undefined;
      var _loc4_ = g4.model.GameModel.chatModel.__get__mainChatTabCount();
      _loc2_ = 0;
      while(_loc2_ < _loc4_)
      {
         _loc3_ = (g4.view.chat.ChatTab)this.chatTabArray[_loc2_];
         if(_loc3_.getTabID() == tabID)
         {
            return _loc3_;
         }
         _loc2_ = _loc2_ + 1;
      }
      return null;
   }
   function showTabGlow(channelID, tabID)
   {
      if(tabID == g4.model.GameModel.chatModel.__get__selectedMainChatTabID())
      {
         return undefined;
      }
      var _loc3_ = g4.model.GameModel.chatModel.getChatTabData(tabID);
      if(_loc3_ == null)
      {
         return undefined;
      }
      if(_loc3_.type != g4.model.GameConstants.CHAT_TAB_TYPE_MAIN)
      {
         return undefined;
      }
      var _loc2_ = g4.model.GameModel.chatModel.getChatChannelData(channelID);
      if(_loc2_ == null)
      {
         return undefined;
      }
      if(_loc2_.type != g4.model.GameConstants.CHAT_CHANNEL_TYPE_WHISPER)
      {
         return undefined;
      }
      var _loc4_ = this.getChatTabByTabID(tabID);
      if(_loc4_ == null)
      {
         return undefined;
      }
      _loc4_.setGlowVisible(true);
      this.updateScrollButtonEmphasis();
   }
   function updateScrollButtonEmphasis()
   {
      var _loc5_ = false;
      var _loc4_ = false;
      var _loc9_ = Math.min(g4.view.chat.ChatConstants.CHAT_TAB_WIDTH,g4.view.chat.ChatConstants.CHAT_TAB_INVISIBLE_MIN_WIDTH);
      var _loc8_ = this.tabScrollPosition - _loc9_;
      var _loc7_ = this.tabScrollPosition + this.tabAreaMaskWidth + _loc9_;
      var _loc2_ = undefined;
      var _loc3_ = undefined;
      var _loc6_ = g4.model.GameModel.chatModel.__get__mainChatTabCount();
      _loc3_ = 0;
      while(_loc3_ < _loc6_)
      {
         _loc2_ = (g4.view.chat.ChatTab)this.chatTabArray[_loc3_];
         if(_loc2_.getGlowVisible())
         {
            if(_loc2_.__get__targetMovieClip()._x < _loc8_)
            {
               _loc5_ = true;
            }
            else if(_loc2_.__get__targetMovieClip()._x + g4.view.chat.ChatConstants.CHAT_TAB_WIDTH > _loc7_)
            {
               _loc4_ = true;
            }
            if(_loc5_ && _loc4_)
            {
               break;
            }
         }
         _loc3_ = _loc3_ + 1;
      }
      if(_loc5_)
      {
         this.mc_emphasis_left._alpha = 0;
         lib.util.Warning.add(this.mc_emphasis_left);
      }
      else
      {
         lib.util.Warning.remove(this.mc_emphasis_left,true);
         this.mc_emphasis_left._alpha = 0;
      }
      if(_loc4_)
      {
         this.mc_emphasis_right._alpha = 0;
         lib.util.Warning.add(this.mc_emphasis_right);
      }
      else
      {
         lib.util.Warning.remove(this.mc_emphasis_right,true);
         this.mc_emphasis_right._alpha = 0;
      }
   }
   function startChatTabDraggingTracking()
   {
      g4.util.UIUtil.addEnterFrameListener(this,"chatTabDraggingTracking");
   }
   function stopChatTabDraggingTracking()
   {
      g4.util.UIUtil.removeEnterFrameListener(this,"chatTabDraggingTracking");
      this.mc_tab_position_indicator._visible = false;
   }
   function chatTabDraggingTracking()
   {
      if(g4.view.chat.ChatGlobals.draggingDividedChat == null)
      {
         return undefined;
      }
      g4.view.chat.ChatGlobals.draggingDividedChat.calculatePoint();
      this.mc_tab_container.globalToLocal(g4.view.chat.ChatGlobals.draggingDividedChatPoint);
      var _loc6_ = -1;
      var _loc8_ = undefined;
      var _loc2_ = undefined;
      var _loc7_ = g4.model.GameModel.chatModel.__get__mainChatTabCount();
      var _loc3_ = 35 * lib.info.AlignInfo.scaleRatio;
      _loc2_ = 0;
      while(_loc2_ < _loc7_)
      {
         var _loc5_ = (g4.view.chat.ChatConstants.CHAT_TAB_WIDTH + g4.view.chat.ChatConstants.CHAT_TAB_GAP) * _loc2_ + (g4.view.chat.ChatConstants.CHAT_TAB_WIDTH + g4.view.chat.ChatConstants.CHAT_TAB_GAP / 2);
         var _loc4_ = 0;
         if(g4.view.chat.ChatGlobals.draggingDividedChatPoint.x >= _loc5_ - _loc3_ && g4.view.chat.ChatGlobals.draggingDividedChatPoint.x < _loc5_ + _loc3_ && g4.view.chat.ChatGlobals.draggingDividedChatPoint.y >= _loc4_ - _loc3_ && g4.view.chat.ChatGlobals.draggingDividedChatPoint.y < _loc4_ + g4.view.chat.ChatConstants.CHAT_TAB_HEIGHT + _loc3_)
         {
            _loc6_ = _loc2_ + 1;
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
      if(_loc6_ == -1)
      {
         this.mc_tab_position_indicator._visible = false;
      }
      else
      {
         this.mc_tab_position_indicator._visible = true;
         this.mc_tab_position_indicator._x = this.mc_tab_container._x + (g4.view.chat.ChatConstants.CHAT_TAB_WIDTH + g4.view.chat.ChatConstants.CHAT_TAB_GAP) * Math.max(0,_loc6_ - 1) + g4.view.chat.ChatConstants.CHAT_TAB_WIDTH + Math.floor(g4.view.chat.ChatConstants.CHAT_TAB_GAP / 2);
      }
      g4.view.chat.ChatGlobals.draggingDividedChatTabIndex = _loc6_;
   }
   function startTabDivideCheck(tabID)
   {
      this.divideTabID = tabID;
      this.regMouseX = _root._xmouse;
      this.regMouseY = _root._ymouse;
      g4.util.UIUtil.addEnterFrameListener(this,"onEnterFrameHandler_forTabDivideCheck");
      Mouse.addListener(this);
   }
   function stopTabDivideCheck()
   {
      Mouse.removeListener(this);
      g4.util.UIUtil.removeEnterFrameListener(this,"onEnterFrameHandler_forTabDivideCheck");
   }
   function onEnterFrameHandler_forTabDivideCheck()
   {
      if(Math.abs(_root._xmouse - this.regMouseX) > this.mouseOffsetTabDivide || Math.abs(_root._ymouse - this.regMouseY) > this.mouseOffsetTabDivide)
      {
         this.stopTabDivideCheck();
         g4.model.GameModel.chatModel.startChatTabDragging(this.divideTabID);
      }
   }
   function onMouseUp(button)
   {
      if(button != 1)
      {
         return undefined;
      }
      this.stopTabDivideCheck();
      this.stopTabScroll();
   }
   function showMenu(tabID)
   {
      this.interactinoMenuTabID = tabID;
      g4.model.GameModel.mainModel.openInteractionMenuCommon(this.getMenuDataArray(this.interactinoMenuTabID),gfx.utils.Delegate.create(this,this.interactionMenu_closeHandler));
   }
   function getMenuDataArray(tabID)
   {
      var _loc2_ = [];
      if(tabID != g4.model.GameConstants.CHAT_MAIN_CHAT_DEFAULT_TAB_ID)
      {
         _loc2_.push(this.createMenuData(this.COMMAND_REMOVE_TAB,true));
      }
      _loc2_.push(this.createMenuData(this.COMMAND_TAB_OPTION,true));
      _loc2_.push(this.createMenuData(this.COMMAND_PRIVATE_CHANNEL,true));
      _loc2_.push(this.createMenuData(this.COMMAND_ADD_TAB,this.canToAddTab()));
      return _loc2_;
   }
   function createMenuData(command, enabled)
   {
      var _loc2_ = new g4.model.main.InteractionMenuData();
      _loc2_.label = this.getTextByCommand(command);
      _loc2_.data = command;
      _loc2_.enabled = enabled;
      return _loc2_;
   }
   function getTextByCommand(command)
   {
      switch(command)
      {
         case this.COMMAND_REMOVE_TAB:
            return lib.util.UIString.getUIString("$031056");
         case this.COMMAND_TAB_OPTION:
            return lib.util.UIString.getUIString("$031057");
         case this.COMMAND_PRIVATE_CHANNEL:
            return lib.util.UIString.getUIString("$032019");
         case this.COMMAND_ADD_TAB:
            return lib.util.UIString.getUIString("$031038");
         default:
            return "";
      }
   }
   function interactionMenu_closeHandler(data)
   {
      switch(data)
      {
         case this.COMMAND_REMOVE_TAB:
            g4.model.GameModel.chatModel.removeTab(this.interactinoMenuTabID);
            return undefined;
         case this.COMMAND_TAB_OPTION:
            g4.model.GameModel.chatModel.ToGame_Chat_RequestOpenChatTabOptionUI(this.interactinoMenuTabID);
            return undefined;
         case this.COMMAND_PRIVATE_CHANNEL:
            g4.model.GameModel.chatModel.ToGame_Chat_RequestPrivateChannelUI(this.interactinoMenuTabID);
            return undefined;
         case this.COMMAND_ADD_TAB:
            g4.view.chat.ChatGlobals.requestAddTabByUser = true;
            g4.model.GameModel.chatModel.ToGame_Chat_RequestAddTab();
            return undefined;
         default:
      }
   }
   function chatTab_pressHandler(event)
   {
      var _loc2_ = (g4.view.chat.ChatTab)event.target;
      var _loc3_ = _loc2_.getTabID();
      if(_loc2_.getGlowVisible())
      {
         _loc2_.setGlowVisible(false);
         this.updateScrollButtonEmphasis();
      }
      g4.model.GameModel.chatModel.__set__selectedMainChatTabID(_loc3_);
      if(event.button == 1)
      {
         if(g4.model.GameModel.chatModel.__get__locked())
         {
            return undefined;
         }
         if(_loc3_ == g4.model.GameConstants.CHAT_MAIN_CHAT_DEFAULT_TAB_ID)
         {
            g4.model.GameModel.chatModel.startChatTabDragging(_loc3_);
         }
         else
         {
            g4.view.chat.ChatGlobals.tabPressPoint.x = _loc2_.__get__targetMovieClip()._xmouse;
            g4.view.chat.ChatGlobals.tabPressPoint.y = _loc2_.__get__targetMovieClip()._ymouse;
            this.startTabDivideCheck(_loc3_);
         }
      }
      else if(event.button == 2)
      {
         this.showMenu(_loc3_);
      }
   }
   function button_add_clickHandler(event)
   {
      g4.view.chat.ChatGlobals.requestAddTabByUser = true;
      g4.model.GameModel.chatModel.ToGame_Chat_RequestAddTab();
   }
   function button_left_pressHandler(event)
   {
      this.startTabScroll(-1);
   }
   function button_right_pressHandler(event)
   {
      this.startTabScroll(1);
   }
   function model_mainUIModeChangeHandler(event)
   {
      this.updateByUIMode();
   }
   function model_chatTabAddHandler(event)
   {
      this.updateByTabData();
   }
   function model_chatTabUpdateHandler(event)
   {
      this.updateByTabData();
   }
   function model_chatTabRemoveHandler(event)
   {
      this.updateByTabData();
   }
   function model_chatTabAllRemoveHandler(event)
   {
      this.updateByTabData();
   }
   function model_chatSelectedMainTabChangeHandler(event)
   {
      this.updateBySelectedTab();
   }
   function model_chatChatTabDraggingStartHandler(event)
   {
      this.startChatTabDraggingTracking();
   }
   function model_chatChatTabDraggingEndHandler(event)
   {
      this.stopChatTabDraggingTracking();
   }
   function model_chatChatTextAddHandler(event)
   {
      this.showTabGlow(event.data.channelID,event.data.tabID);
   }
}
