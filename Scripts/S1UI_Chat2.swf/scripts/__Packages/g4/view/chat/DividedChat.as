class g4.view.chat.DividedChat extends g4.core.InvalidationView
{
   var autoSleepTimeoutID = 0;
   var dragging = false;
   var resizing = false;
   var positionRatioX = 0;
   var positionRatioY = 0;
   var tabID = -1;
   var tabIDChanged = true;
   var updateFlag = false;
   var updateWholeChatFlag = false;
   var updateByUIModeFlag = false;
   var addChatFlag = false;
   var startDraggingFlag = false;
   var pendingChatData = [];
   var sleepMode = false;
   var optionButtonOffsetX = 0;
   var resizeButtonOffsetX = 0;
   var bgOffsetX = 0;
   var bgOffsetY = 0;
   function DividedChat(targetMovieClip)
   {
      super(targetMovieClip);
      this.mc = targetMovieClip;
      this.mc_bg = this.mc.mc_bg;
      this.button_option = this.mc.button_option;
      this.mc_tab = targetMovieClip.mc_tab;
      this.mc_line_left = targetMovieClip.mc_line_left;
      this.mc_line_right = targetMovieClip.mc_line_right;
      targetMovieClip._visible = false;
   }
   function configUI()
   {
      this.__get__targetMovieClip()._visible = true;
      this.optionButtonOffsetX = this.button_option._x - g4.view.chat.ChatConstants.STYLE_CHAT_BASE_WIDTH;
      this.resizeButtonOffsetX = this.mc.button_resize._x - g4.view.chat.ChatConstants.STYLE_CHAT_BASE_WIDTH;
      this.bgOffsetX = this.mc_bg._width - g4.view.chat.ChatConstants.STYLE_CHAT_BASE_WIDTH;
      this.bgOffsetY = this.mc_bg._height - g4.view.chat.ChatConstants.STYLE_CHAT_BASE_HEIGHT;
      this.mc._xscale = this.mc._yscale = g4.view.chat.ChatUtil.getActualScaleRatio() * 100;
      this.optionButton = new g4.view.chat.DividedChatOptionButton(this.button_option);
      this.chatTab = new g4.view.chat.ChatTab(this.mc_tab);
      this.chatTab.__set__selected(true);
      this.chatTab.addEventListener("press",this,"chatTab_pressHandler");
      this.textArea = new g4.view.chat.TextArea(this.mc.textField,(lib.controls.S_TextScrollBar)this.mc.mc_scroll_bar,g4.view.chat.ChatConstants.TEMP_DIVIDED_CHAT_SCROLL_BAR_HEIGHT);
      this.resizeButton = new g4.view.chat.ResizeButton(this.mc.button_resize,g4.view.chat.ChatConstants.CHAT_MIN_WIDTH,g4.view.chat.ChatConstants.CHAT_MIN_HEIGHT,g4.view.chat.ChatConstants.CHAT_MAX_WIDTH,g4.view.chat.ChatConstants.CHAT_MAX_HEIGHT,gfx.utils.Delegate.create(this,this.resizingStartHandler),gfx.utils.Delegate.create(this,this.resizingHandler),gfx.utils.Delegate.create(this,this.resizingEndHandler),this.__get__targetMovieClip());
      this.startAutoSleep();
   }
   function draw()
   {
      if(this.tabIDChanged)
      {
         this.tabIDChanged = false;
         this.optionButton.setTabID(this.tabID);
         this.resizeButton.setTabID(this.tabID);
         this.updateFlag = true;
      }
      if(this.updateFlag)
      {
         this.updateFlag = false;
         this._update();
         this.updateByUIModeFlag = true;
         this.updateWholeChatFlag = true;
      }
      if(this.updateWholeChatFlag)
      {
         this.updateWholeChatFlag = false;
         this.addChatFlag = false;
         this.pendingChatData = [];
         this._updateWholeChat();
      }
      if(this.updateByUIModeFlag)
      {
         this.updateByUIModeFlag = false;
         this._updateByUIMode();
      }
      if(this.addChatFlag)
      {
         this.addChatFlag = false;
         this._addChat();
      }
   }
   function update()
   {
      this.updateFlag = true;
      this.invalidate();
   }
   function _update()
   {
      if(this.tabID == -1)
      {
         this.__get__targetMovieClip()._visible = false;
         this.chatTab.cleanUp();
      }
      else
      {
         this.__get__targetMovieClip()._visible = true;
         this.chatTab.setTabID(this.tabID);
         var _loc2_ = g4.model.GameModel.chatModel.getChatTabData(this.tabID);
         this.textArea.updateByData(_loc2_);
         this.setSize(_loc2_.width,_loc2_.height);
         if(!this.dragging)
         {
            this.move(_loc2_.x,_loc2_.y);
            this.savePositionRatio();
         }
      }
   }
   function updateWholeChat()
   {
      this.updateWholeChatFlag = true;
      this.invalidate();
   }
   function _updateWholeChat()
   {
      var _loc2_ = undefined;
      if(this.tabID != -1)
      {
         _loc2_ = g4.model.GameModel.chatModel.getChatTabData(this.tabID);
      }
      if(_loc2_ == null || _loc2_.chatTextArray == null || _loc2_.chatTextArray.length == 0)
      {
         this.textArea.setWholeChat("");
         return undefined;
      }
      this.textArea.setWholeChat(_loc2_.chatTextArray.join(""));
      this.wakeUp();
      this.startAutoSleep();
   }
   function updateByUIMode()
   {
      this.updateByUIModeFlag = true;
      this.invalidate();
   }
   function _updateByUIMode()
   {
      if(this.tabID == -1)
      {
         return undefined;
      }
      var _loc2_ = g4.model.GameModel.chatModel.getChatTabData(this.tabID);
      if(_loc2_ == null)
      {
         return undefined;
      }
      if(g4.model.GameModel.mainModel.uiMode)
      {
         this.mc_bg._alpha = _loc2_.alpha;
         this.resizeButton.__get__targetMovieClip()._visible = true;
      }
      else
      {
         this.mc_bg._alpha = _loc2_.alpha + g4.view.chat.ChatConstants.NOT_UI_MODE_ALPHA_OFFSET;
         this.resizeButton.__get__targetMovieClip()._visible = false;
      }
      this.textArea.updateByUIMode();
      this.addOrRemoveRollOverHandler();
   }
   function addChat(chatTextArray, clear)
   {
      if(chatTextArray == null || chatTextArray.length == 0)
      {
         return undefined;
      }
      var _loc2_ = {};
      _loc2_.chatTextArray = chatTextArray;
      _loc2_.clear = clear;
      this.pendingChatData.push(_loc2_);
      this.addChatFlag = true;
      this.invalidate();
   }
   function _addChat()
   {
      if(this.pendingChatData == null || this.pendingChatData.length == 0)
      {
         return undefined;
      }
      var _loc3_ = this.pendingChatData;
      this.pendingChatData = [];
      var _loc2_ = undefined;
      var _loc4_ = _loc3_.length;
      _loc2_ = 0;
      while(_loc2_ < _loc4_)
      {
         this.textArea.addChat(_loc3_[_loc2_].chatTextArray,_loc3_[_loc2_].clear);
         this.wakeUp();
         this.startAutoSleep();
         _loc2_ = _loc2_ + 1;
      }
   }
   function init(tabID)
   {
      this.tabID = tabID;
      this.tabIDChanged = true;
      this.invalidate();
   }
   function cleanUp()
   {
      this.tabID = -1;
      this.tabIDChanged = true;
      this.invalidate();
   }
   function rearrangePositionAfterStageSizeChange()
   {
      this.move(g4.util.ScreenUtil.convertScreenRatioToPixelX(this.positionRatioX),g4.util.ScreenUtil.convertScreenRatioToPixelY(this.positionRatioY));
      this.saveChatTabPosition();
   }
   function move(x, y)
   {
      this.mc._x = x;
      this.mc._y = y;
   }
   function savePositionRatio()
   {
      this.positionRatioX = g4.util.ScreenUtil.convertScreenPixelToRatioX(this.mc._x);
      this.positionRatioY = g4.util.ScreenUtil.convertScreenPixelToRatioY(this.mc._y);
   }
   function saveChatTabPosition()
   {
      g4.model.GameModel.chatModel.saveChatTabPosition(this.tabID,this.mc._x,this.mc._y);
   }
   function setSize(w, h)
   {
      this.mc_bg._width = w + this.bgOffsetX;
      this.mc_bg._height = h + this.bgOffsetY;
      this.button_option._x = w + this.optionButtonOffsetX;
      this.resizeButton.__get__targetMovieClip()._x = w + this.resizeButtonOffsetX;
      this.mc_line_left._width = this.mc_tab._x;
      this.mc_line_right._x = this.mc_tab._x + this.mc_tab._width;
      this.mc_line_right._width = w - this.mc_line_right._x;
      this.textArea.setSize(w,h);
   }
   function startDragging()
   {
      if(!this.startDraggingFlag)
      {
         var _loc3_ = g4.view.chat.ChatUtil.getActualScaleRatio();
         var _loc5_ = (this.mc_tab._x + g4.view.chat.ChatGlobals.tabPressPoint.x) * _loc3_;
         var _loc4_ = (this.mc_tab._y + g4.view.chat.ChatGlobals.tabPressPoint.y) * _loc3_;
         this.__get__targetMovieClip()._x = _root._xmouse - _loc5_;
         this.__get__targetMovieClip()._y = _root._ymouse - _loc4_;
      }
      this.startDraggingFlag = false;
      g4.view.chat.ChatGlobals.draggingDividedChatTabIndex = -1;
      g4.view.chat.ChatGlobals.draggingDividedChat = this;
      this._startDragging();
   }
   function _startDragging()
   {
      this.dragging = true;
      this.wakeUp();
      var _loc5_ = g4.util.ScreenUtil.getScreenMinX();
      var _loc4_ = g4.util.ScreenUtil.getScreenMinY();
      var _loc3_ = g4.util.ScreenUtil.getScreenMaxX() - g4.view.chat.ChatUtil.convertScaledSize(g4.view.chat.ChatConstants.CHAT_MIN_WIDTH_WHEN_DRAGGING);
      var _loc2_ = g4.util.ScreenUtil.getScreenMaxY() - g4.view.chat.ChatUtil.convertScaledSize(g4.view.chat.ChatConstants.CHAT_MIN_HEIGHT_WHEN_DRAGGING);
      this.__get__targetMovieClip().startDrag(false,_loc5_,_loc4_,_loc3_,_loc2_);
      Mouse.addListener(this);
   }
   function onMouseUp(button)
   {
      if(button != 1)
      {
         return undefined;
      }
      Mouse.removeListener(this);
      this.dragging = false;
      this.__get__targetMovieClip().stopDrag();
      this.savePositionRatio();
      this.saveChatTabPosition();
      this.startAutoSleep();
      var _loc2_ = g4.view.chat.ChatGlobals.draggingDividedChatTabIndex;
      g4.view.chat.ChatGlobals.draggingDividedChat = null;
      g4.view.chat.ChatGlobals.draggingDividedChatTabIndex = -1;
      g4.model.GameModel.chatModel.endChatTabDragging(_loc2_);
   }
   function calculatePoint()
   {
      g4.view.chat.ChatGlobals.draggingDividedChatPoint.x = 0;
      g4.view.chat.ChatGlobals.draggingDividedChatPoint.y = 0;
      this.mc_tab.localToGlobal(g4.view.chat.ChatGlobals.draggingDividedChatPoint);
   }
   function resizingStartHandler()
   {
      this.resizing = true;
      this.wakeUp();
   }
   function resizingHandler(x, y, w, h)
   {
      this.setSize(w,h);
      this.move(x,y);
   }
   function resizingEndHandler()
   {
      this.resizing = false;
      this.startAutoSleep();
   }
   function stopAutoSleep()
   {
      if(this.autoSleepTimeoutID != 0)
      {
         clearTimeout(this.autoSleepTimeoutID);
         this.autoSleepTimeoutID = 0;
      }
   }
   function startAutoSleep()
   {
      this.stopAutoSleep();
      if(this.dragging || this.resizing)
      {
         return undefined;
      }
      this.autoSleepTimeoutID = setTimeout(gfx.utils.Delegate.create(this,this.doAutoSleep),g4.view.chat.ChatConstants.CHAT_AUTO_HIDE_WAIT_SEC * 1000);
   }
   function doAutoSleep()
   {
      if(g4.model.GameModel.mainModel.uiMode && g4.util.UIUtil.isMouseOver(this.mc))
      {
         this.startAutoSleep();
      }
      else
      {
         this.sleep();
      }
   }
   function sleep()
   {
      if(this.sleepMode)
      {
         return undefined;
      }
      this.sleepMode = true;
      this.setAlpha(this.mc,false);
      this.addOrRemoveRollOverHandler();
   }
   function wakeUp()
   {
      this.stopAutoSleep();
      if(!this.sleepMode)
      {
         return undefined;
      }
      this.sleepMode = false;
      this.addOrRemoveRollOverHandler();
      this.setAlpha(this.mc,true);
   }
   function addOrRemoveRollOverHandler()
   {
      if(g4.model.GameModel.mainModel.uiMode && this.sleepMode)
      {
         this.mc.onRollOver = gfx.utils.Delegate.create(this,function()
         {
            this.wakeUp();
            this.startAutoSleep();
         }
         );
      }
      else
      {
         delete this.mc.onRollOver;
      }
   }
   function setAlpha(target, bShow)
   {
      gs.TweenLite.killTweensOf(target,false);
      if(bShow)
      {
         gs.TweenLite.to(target,g4.view.chat.ChatConstants.CHAT_SHOW_TIME_SEC,{_alpha:100});
      }
      else
      {
         gs.TweenLite.to(target,g4.view.chat.ChatConstants.CHAT_HIDE_TIME_SEC,{_alpha:0});
      }
   }
   function chatTab_pressHandler(event)
   {
      if(event.button == 1)
      {
         if(g4.model.GameModel.chatModel.__get__locked())
         {
            return undefined;
         }
         this.startDraggingFlag = true;
         g4.model.GameModel.chatModel.startChatTabDragging(this.tabID);
      }
      else if(event.button == 2)
      {
         this.optionButton.showMenu();
      }
   }
}
