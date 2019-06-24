class g4.view.chat.MainChat extends g4.core.SimpleView
{
   var positionRatioX = 0;
   var positionRatioY = 0;
   var sleepMode = false;
   var regWidth = g4.view.chat.ChatConstants.STYLE_CHAT_BASE_WIDTH;
   var regHeight = g4.view.chat.ChatConstants.STYLE_CHAT_BASE_WIDTH;
   var chatModeButtonOffsetY = 0;
   var resizeButtonOffsetX = 0;
   var enterInfoOffsetY = 0;
   var bgOffsetX = 0;
   var bgOffsetY = 0;
   var optionButtonOffsetX = 0;
   function MainChat(targetMovieClip)
   {
      super(targetMovieClip);
      this.container_mc = targetMovieClip;
      this.configUI();
   }
   function configUI()
   {
      this.mc_main_chat_container = this.container_mc.mc_main_chat_container;
      this.mc_punishment = this.mc_main_chat_container.mc_punishment;
      this.mc_chat_container = this.mc_main_chat_container.mc_chat_container;
      this.mc_recent_chat = this.mc_main_chat_container.mc_recent_chat;
      this.mc_bg = this.mc_chat_container.bg_mc;
      this.button_option = this.mc_chat_container.button_option;
      this.mc_line_left = this.mc_chat_container.mc_line_left;
      this.mc_line_right = this.mc_chat_container.mc_line_right;
      this.button_chat_mode = this.container_mc.button_chat_mode;
      this.mc_info_enter = this.container_mc.mc_info_enter;
      this.chatModeButtonOffsetY = this.button_chat_mode._y - g4.view.chat.ChatConstants.STYLE_CHAT_BASE_HEIGHT;
      this.resizeButtonOffsetX = this.mc_chat_container.button_resize._x - g4.view.chat.ChatConstants.STYLE_CHAT_BASE_WIDTH;
      this.enterInfoOffsetY = this.mc_info_enter._y - g4.view.chat.ChatConstants.STYLE_CHAT_BASE_HEIGHT;
      this.bgOffsetX = this.mc_bg._width - g4.view.chat.ChatConstants.STYLE_CHAT_BASE_WIDTH;
      this.bgOffsetY = this.mc_bg._height - g4.view.chat.ChatConstants.STYLE_CHAT_BASE_HEIGHT;
      this.optionButtonOffsetX = this.button_option._x - g4.view.chat.ChatConstants.STYLE_CHAT_BASE_WIDTH;
      g4.util.UIUtil.setMouseEnabled(this.mc_line_left,false);
      g4.util.UIUtil.setMouseEnabled(this.mc_line_right,false);
      this.mc_punishment.textField.autoSize = true;
      this.mc_punishment.textField.verticalAlign = "center";
      g4.util.UIUtil.setTextFieldStyle(this.mc_punishment.textField,g4.util.UIUtil.TEXT_FIELD_STYLE_1);
      this.optionButton = new g4.view.chat.MainChatOptionButton(this.button_option);
      this.mainChatTabBar = new g4.view.chat.MainChatTabBar(this.mc_chat_container.mc_chat_tab_area);
      this.mainChatTabBar.addEventListener("updateBorder",this,"mainChatTabBar_updateBorderHandler");
      this.chatInput = new g4.view.chat.ChatInput(this.mc_main_chat_container.input_mc);
      this.chatChannel = new g4.view.chat.ChatChannel(this.mc_main_chat_container.input_mc.mc_dropdown);
      this.textArea = new g4.view.chat.TextArea(this.mc_chat_container.text_content,(lib.controls.S_TextScrollBar)this.mc_chat_container.mc_scroll_bar,g4.view.chat.ChatConstants.TEMP_MAIN_CHAT_SCROLL_BAR_HEIGHT);
      this.resizeButton = new g4.view.chat.ResizeButton(this.mc_chat_container.button_resize,g4.view.chat.ChatConstants.CHAT_MIN_WIDTH,g4.view.chat.ChatConstants.CHAT_MIN_HEIGHT,g4.view.chat.ChatConstants.CHAT_MAX_WIDTH,g4.view.chat.ChatConstants.CHAT_MAX_HEIGHT,gfx.utils.Delegate.create(this,this.resizingStartHandler),gfx.utils.Delegate.create(this,this.resizingHandler),gfx.utils.Delegate.create(this,this.resizingEndHandler),this.container_mc);
      this.chatRecent = new g4.view.chat.ChatRecent(this.mc_recent_chat);
      this.button_chat_mode.addEventListener("click",this,"button_chat_mode_clickHandler");
      this.mc_info_enter.textField.verticalAlign = "center";
      this.mc_info_enter.textField.text = lib.util.UIString.getUIString("$031092");
      g4.util.UIUtil.setMouseEnabled(this.mc_info_enter,false);
      g4.util.UIUtil.setTextFieldStyle(this.mc_info_enter.textField,g4.util.UIUtil.TEXT_FIELD_STYLE_1);
      this.cleanUp();
      this.updatePunishment();
      this.updateByUIModeAndChatMode();
      this.resizeButton.setTabID(this.getSelectedTabID());
      g4.model.GameModel.addEventListener(g4.view.ViewID.CHAT_2,g4.model.GameModelEventType.MAIN_UI_MODE_CHANGED,this,"model_mainUIModeChangeHandler");
      g4.model.GameModel.addEventListener(g4.view.ViewID.CHAT_2,g4.model.GameModelEventType.MAIN_STAGE_SIZE_CHANGE,this,"model_mainStageSizeChangeHandler");
      g4.model.GameModel.addEventListener(g4.view.ViewID.CHAT_2,g4.model.GameModelEventType.CHAT_TAB_ADD,this,"model_chatTabAddHandler");
      g4.model.GameModel.addEventListener(g4.view.ViewID.CHAT_2,g4.model.GameModelEventType.CHAT_TAB_UPDATE,this,"model_chatTabAddHandler");
      g4.model.GameModel.addEventListener(g4.view.ViewID.CHAT_2,g4.model.GameModelEventType.CHAT_TAB_REMOVE,this,"model_chatTabRemoveHandler");
      g4.model.GameModel.addEventListener(g4.view.ViewID.CHAT_2,g4.model.GameModelEventType.CHAT_TAB_ALL_REMOVE,this,"model_chatTabAllRemoveHandler");
      g4.model.GameModel.addEventListener(g4.view.ViewID.CHAT_2,g4.model.GameModelEventType.CHAT_CHAT_TEXT_ADD,this,"model_chatChatTextAddHandler");
      g4.model.GameModel.addEventListener(g4.view.ViewID.CHAT_2,g4.model.GameModelEventType.CHAT_SELECTED_MAIN_TAB_CHANGE,this,"model_chatSelectedMainTabChangeHandler");
      g4.model.GameModel.addEventListener(g4.view.ViewID.CHAT_2,g4.model.GameModelEventType.CHAT_REFRESH,this,"model_chatRefreshHandler");
      g4.model.GameModel.addEventListener(g4.view.ViewID.CHAT_2,g4.model.GameModelEventType.CHAT_CLOSE,this,"model_chatCloseHandler");
      g4.model.GameModel.addEventListener(g4.view.ViewID.CHAT_2,g4.model.GameModelEventType.CHAT_CHAT_TAB_DRAGGING_START,this,"model_chatDividedChatMoveStartHandler");
      g4.model.GameModel.addEventListener(g4.view.ViewID.CHAT_2,g4.model.GameModelEventType.CHAT_PUNISHMENT_CHANGE,this,"model_chatPunishmentChangeHandler");
      g4.model.GameModel.addEventListener(g4.view.ViewID.CHAT_2,g4.model.GameModelEventType.CHAT_MODE_CHANGE,this,"model_chatModeChangeHandler");
      g4.model.GameModel.addEventListener(g4.view.ViewID.CHAT_2,g4.model.GameModelEventType.CHAT_INPUT_FOCUS,this,"model_chatInputFocusHandler");
   }
   function getSelectedTabID()
   {
      return g4.model.GameModel.chatModel.__get__selectedMainChatTabID();
   }
   function updateByData()
   {
      var _loc2_ = g4.model.GameModel.chatModel.getChatTabData(this.getSelectedTabID());
      if(_loc2_ == null)
      {
         this.cleanUp();
      }
      else
      {
         this.container_mc._visible = true;
         this.setSize(_loc2_.width,_loc2_.height);
         if(_loc2_.x == -1 || _loc2_.y == -1)
         {
            this.initPosition();
         }
         else
         {
            this.move(_loc2_.x,_loc2_.y);
            this.savePositionRatio();
         }
         this.textArea.updateByData(_loc2_);
         this.updateWholeChat();
      }
      this.updateByUIMode();
   }
   function cleanUp()
   {
      this.initSize();
      this.initPosition();
      this.clearChat();
   }
   function updateByChatMode()
   {
      if(g4.model.GameModel.chatModel.__get__chatMode() == g4.model.GameConstants.CHAT_MODE_COLLAPSED)
      {
         this.button_chat_mode.__set__selected(false);
         lib.manager.ToolTip.add(this.button_chat_mode,lib.util.UIString.getUIString("$031093"),1);
      }
      else
      {
         this.button_chat_mode.__set__selected(true);
         lib.manager.ToolTip.add(this.button_chat_mode,lib.util.UIString.getUIString("$031094"),1);
      }
   }
   function setInputFocus(focus)
   {
      if(focus)
      {
         this.wakeUp();
         this.setChatContentVisible(true);
      }
      else
      {
         this.updateByUIModeAndChatMode();
      }
   }
   function setChatContentVisible(visible)
   {
      gs.TweenLite.killTweensOf(this.mc_chat_container,false);
      gs.TweenLite.killTweensOf(this.mc_recent_chat,false);
      var _loc2_ = 0.3;
      var _loc3_ = 0.2;
      var _loc4_ = 20;
      if(visible)
      {
         this.mc_info_enter._visible = false;
         gs.TweenLite.to(this.mc_chat_container,_loc2_,{_alpha:100,_y:0,ease:gs.easing.Cubic.easeOut});
         gs.TweenLite.to(this.mc_recent_chat,_loc3_,{_alpha:0,_y:_loc4_,ease:gs.easing.Cubic.easeOut});
      }
      else
      {
         this.mc_info_enter._visible = true;
         gs.TweenLite.to(this.mc_chat_container,_loc3_,{_alpha:0,_y:_loc4_,ease:gs.easing.Cubic.easeOut});
         gs.TweenLite.to(this.mc_recent_chat,_loc2_,{_alpha:100,_y:0,ease:gs.easing.Cubic.easeOut});
      }
   }
   function updateByUIModeAndChatMode()
   {
      var _loc2_ = false;
      if(g4.model.GameModel.chatModel.__get__chatMode() == g4.model.GameConstants.CHAT_MODE_EXPANDED)
      {
         _loc2_ = true;
      }
      else if(g4.model.GameModel.mainModel.uiMode)
      {
         _loc2_ = true;
      }
      this.setChatContentVisible(_loc2_);
   }
   function updateByUIMode()
   {
      var _loc3_ = g4.model.GameModel.chatModel.getChatTabData(this.getSelectedTabID());
      if(_loc3_ == null)
      {
         return undefined;
      }
      var _loc2_ = undefined;
      if(g4.model.GameModel.mainModel.uiMode)
      {
         _loc2_ = _loc3_.alpha;
         this.resizeButton.__get__targetMovieClip()._visible = true;
      }
      else
      {
         _loc2_ = _loc3_.alpha + g4.view.chat.ChatConstants.NOT_UI_MODE_ALPHA_OFFSET;
         this.resizeButton.__get__targetMovieClip()._visible = false;
      }
      this.mc_bg._alpha = _loc2_;
      this.mc_line_left._alpha = _loc2_;
      this.mc_line_right._alpha = _loc2_;
      this.textArea.updateByUIMode();
   }
   function sleep()
   {
      if(g4.model.GameModel.chatModel.__get__chatMode() == g4.model.GameConstants.CHAT_MODE_EXPANDED)
      {
         return undefined;
      }
      if(this.sleepMode)
      {
         return undefined;
      }
      this.sleepMode = true;
      g4.model.GameModel.chatModel.setInputFocus(false);
      this.setAlpha(this.mc_main_chat_container,false);
      g4.util.UIUtil.setMouseEnabled(this.mc_punishment,false);
      this.container_mc.onRollOver = gfx.utils.Delegate.create(this,function()
      {
         this.wakeUp();
      }
      );
   }
   function wakeUp()
   {
      if(!this.sleepMode)
      {
         return undefined;
      }
      this.sleepMode = false;
      delete this.container_mc.onRollOver;
      g4.util.UIUtil.setMouseEnabled(this.mc_punishment,true);
      this.setAlpha(this.mc_main_chat_container,true);
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
   function updateWholeChat()
   {
      var _loc2_ = g4.model.GameModel.chatModel.getChatTabData(this.getSelectedTabID());
      if(_loc2_ == null || _loc2_.chatTextArray == null || _loc2_.chatTextArray.length == 0)
      {
         this.clearChat();
         return undefined;
      }
      this.textArea.updateByData(_loc2_);
      this.textArea.setWholeChat(_loc2_.chatTextArray.join(""));
      this.wakeUp();
   }
   function clearChat()
   {
      this.textArea.setWholeChat("");
   }
   function rearrangePositionAfterStageSizeChange()
   {
      this.move(g4.util.ScreenUtil.convertScreenRatioToPixelX(this.positionRatioX),g4.util.ScreenUtil.convertScreenRatioToPixelY(this.positionRatioY));
      this.saveChatTabPosition();
   }
   function initPosition()
   {
      this.move(lib.info.AlignInfo.xRatioToPixel(0) + g4.view.chat.ChatUtil.convertScaledSize(g4.view.chat.ChatConstants.CHAT_MARGIN_X),lib.info.AlignInfo.yRatioToPixel(100) - g4.view.chat.ChatUtil.convertScaledSize(this.regHeight + g4.view.chat.ChatConstants.CHAT_MARGIN_Y));
      this.savePositionRatio();
   }
   function move(x, y)
   {
      if(x < 0 || x > Stage.width * 0.9 || isNaN(x))
      {
         x = 6;
      }
      if(y < 0 || y > Stage.height * 0.9 || isNaN(y))
      {
         y = Stage.height * 0.7;
      }
      this.container_mc._x = x;
      this.container_mc._y = y;
   }
   function savePositionRatio()
   {
      this.positionRatioX = g4.util.ScreenUtil.convertScreenPixelToRatioX(this.container_mc._x);
      this.positionRatioY = g4.util.ScreenUtil.convertScreenPixelToRatioY(this.container_mc._y);
   }
   function saveChatTabPosition()
   {
      g4.model.GameModel.chatModel.saveChatTabPosition(this.getSelectedTabID(),this.container_mc._x,this.container_mc._y);
   }
   function initSize()
   {
      this.setSize(g4.view.chat.ChatConstants.CHAT_DEFAULT_WIDTH,g4.view.chat.ChatConstants.CHAT_DEFAULT_HEIGHT);
   }
   function setSize(w, h)
   {
      this.regWidth = w;
      this.regHeight = h;
      this.mc_bg._width = w + this.bgOffsetX;
      this.mc_bg._height = h + this.bgOffsetY;
      this.button_option._x = w + this.optionButtonOffsetX;
      this.resizeButton.__get__targetMovieClip()._x = w + this.resizeButtonOffsetX;
      this.button_chat_mode._y = h + this.chatModeButtonOffsetY;
      this.mc_info_enter._y = h + this.enterInfoOffsetY;
      this.mainChatTabBar.setSize(w,h);
      this.textArea.setSize(w,h);
      this.chatInput.setSize(w,h);
      this.chatRecent.setSize(w,h);
   }
   function updateBorder()
   {
      var _loc3_ = this.mainChatTabBar.getSelectedTabLeft();
      var _loc2_ = this.mainChatTabBar.getSelectedTabRight();
      this.mc_line_left._width = _loc3_;
      this.mc_line_right._x = _loc2_;
      this.mc_line_right._width = this.regWidth - _loc2_;
   }
   function startDragging()
   {
      var _loc5_ = g4.util.ScreenUtil.getScreenMinX();
      var _loc4_ = g4.util.ScreenUtil.getScreenMinY();
      var _loc3_ = g4.util.ScreenUtil.getScreenMaxX() - g4.view.chat.ChatUtil.convertScaledSize(g4.view.chat.ChatConstants.CHAT_MIN_WIDTH_WHEN_DRAGGING);
      var _loc2_ = g4.util.ScreenUtil.getScreenMaxY() - g4.view.chat.ChatUtil.convertScaledSize(g4.view.chat.ChatConstants.CHAT_MIN_HEIGHT_WHEN_DRAGGING);
      this.container_mc.startDrag(false,_loc5_,_loc4_,_loc3_,_loc2_);
      Mouse.addListener(this);
   }
   function onMouseUp(button)
   {
      if(button != 1)
      {
         return undefined;
      }
      Mouse.removeListener(this);
      this.container_mc.stopDrag();
      this.savePositionRatio();
      this.saveChatTabPosition();
      g4.model.GameModel.chatModel.endChatTabDragging();
   }
   function resizingStartHandler()
   {
      this.wakeUp();
   }
   function resizingHandler(x, y, w, h)
   {
      this.setSize(w,h);
      this.move(x,y);
   }
   function resizingEndHandler()
   {
   }
   function updatePunishment()
   {
      if(g4.model.GameModel.chatModel.__get__punishment() == null || g4.model.GameModel.chatModel.__get__punishment().length == 0)
      {
         this.mc_punishment._visible = false;
         this.mc_punishment.textField.text = "";
      }
      else
      {
         this.mc_punishment._visible = true;
         this.mc_punishment.textField.text = g4.model.GameModel.chatModel.punishment;
         lib.manager.ToolTip.add(this.mc_punishment,lib.util.UIString.getUIString("$031064"),1);
      }
   }
   function button_chat_mode_clickHandler(event)
   {
      g4.model.GameModel.chatModel.ToGame_Chat_SetChatMode(g4.model.GameModel.chatModel.__get__chatMode() != g4.model.GameConstants.CHAT_MODE_COLLAPSED?g4.model.GameConstants.CHAT_MODE_COLLAPSED:g4.model.GameConstants.CHAT_MODE_EXPANDED);
   }
   function mainChatTabBar_updateBorderHandler(event)
   {
      this.updateBorder();
   }
   function model_mainUIModeChangeHandler(event)
   {
      this.updateByUIMode();
      this.updateByUIModeAndChatMode();
   }
   function model_mainStageSizeChangeHandler(event)
   {
      this.rearrangePositionAfterStageSizeChange();
   }
   function model_chatTabAddHandler(event)
   {
      if(event.data.tabID == this.getSelectedTabID() || event.data.tabID == g4.model.GameConstants.CHAT_MAIN_CHAT_DEFAULT_TAB_ID)
      {
         this.updateByData();
      }
   }
   function model_chatTabRemoveHandler(event)
   {
      if(event.data.tabID == this.getSelectedTabID())
      {
         this.updateByData();
      }
   }
   function model_chatTabAllRemoveHandler(event)
   {
      this.updateByData();
   }
   function model_chatChatTextAddHandler(event)
   {
      if(event.data.tabID == this.getSelectedTabID())
      {
         this.textArea.addChat(event.data.chatTextArray,event.data.clear);
         this.wakeUp();
      }
   }
   function model_chatSelectedMainTabChangeHandler(event)
   {
      this.updateByUIMode();
      this.updateWholeChat();
      this.resizeButton.setTabID(this.getSelectedTabID());
   }
   function model_chatRefreshHandler(event)
   {
      this.updateWholeChat();
   }
   function model_chatCloseHandler(event)
   {
      this.sleep();
   }
   function model_chatDividedChatMoveStartHandler(event)
   {
      if(g4.model.GameModel.chatModel.__get__draggingTabID() == g4.model.GameConstants.CHAT_MAIN_CHAT_DEFAULT_TAB_ID)
      {
         this.startDragging();
      }
   }
   function model_chatPunishmentChangeHandler(event)
   {
      this.updatePunishment();
   }
   function model_chatModeChangeHandler(event)
   {
      this.updateByChatMode();
      this.updateByUIModeAndChatMode();
   }
   function model_chatInputFocusHandler(event)
   {
      this.setInputFocus(event.data.focus);
   }
}
