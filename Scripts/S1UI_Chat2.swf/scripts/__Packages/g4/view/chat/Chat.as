class g4.view.chat.Chat extends g4.core.View
{
   function Chat(targetMovieClip)
   {
      super(targetMovieClip);
   }
   function getUIName()
   {
      return g4.view.ViewID.CHAT_2;
   }
   function configUI()
   {
      this.mainChat = new g4.view.chat.MainChat(this.__get__targetMovieClip().container_mc);
      this.dividedChatArray = [];
      this.dividedChatMap = {};
      this.unusedDividedChatArray = [];
      this.__get__targetMovieClip().container_mc.mTempCoin._visible = false;
      _global.chatNameAction = gfx.utils.Delegate.create(this,this.chatNameAction);
   }
   function configGameInterface()
   {
      g4.model.GameModel.addEventListener(g4.view.ViewID.CHAT_2,g4.model.GameModelEventType.MAIN_STAGE_SIZE_CHANGE,this,"model_mainStageSizeChangeHandler");
      g4.model.GameModel.addEventListener(g4.view.ViewID.CHAT_2,g4.model.GameModelEventType.MAIN_UI_MODE_CHANGED,this,"model_mainUIModeChangeHandler");
      g4.model.GameModel.addEventListener(g4.view.ViewID.CHAT_2,g4.model.GameModelEventType.CHAT_TAB_ADD,this,"model_chatTabAddHandler");
      g4.model.GameModel.addEventListener(g4.view.ViewID.CHAT_2,g4.model.GameModelEventType.CHAT_TAB_UPDATE,this,"model_chatTabUpdateHandler");
      g4.model.GameModel.addEventListener(g4.view.ViewID.CHAT_2,g4.model.GameModelEventType.CHAT_TAB_REMOVE,this,"model_chatTabRemoveHandler");
      g4.model.GameModel.addEventListener(g4.view.ViewID.CHAT_2,g4.model.GameModelEventType.CHAT_TAB_ALL_REMOVE,this,"model_chatTabAllRemoveHandler");
      g4.model.GameModel.addEventListener(g4.view.ViewID.CHAT_2,g4.model.GameModelEventType.CHAT_CHAT_TAB_DRAGGING_START,this,"model_chatDividedChatMoveStartHandler");
      g4.model.GameModel.addEventListener(g4.view.ViewID.CHAT_2,g4.model.GameModelEventType.CHAT_CHAT_TEXT_ADD,this,"model_chatChatTextAddHandler");
      g4.model.GameModel.addEventListener(g4.view.ViewID.CHAT_2,g4.model.GameModelEventType.CHAT_REFRESH,this,"model_chatRefreshHandler");
   }
   function chatNameAction(data)
   {
      var _loc5_ = data.split("@");
      var _loc3_ = _loc5_[0];
      var _loc4_ = Number(_loc5_[1]);
      var _loc2_ = _loc5_[2];
      if(_loc3_.indexOf("&&&;") != -1)
      {
         _loc3_ = lib.util.ExtString.replace(_loc3_,"&&&;","\'",false);
      }
      if(_loc2_.indexOf("&&&;") != -1)
      {
         _loc2_ = lib.util.ExtString.replace(_loc2_,"&&&;","\'",false);
      }
      if(_loc2_.indexOf("***;") != -1)
      {
         _loc2_ = lib.util.ExtString.replace(_loc2_,"***;","\"",false);
      }
      if(_global.shift)
      {
         g4.model.GameModel.chatModel.ToGame_Chat_ClickName(_loc3_,_loc4_,_loc2_,"SHIFT");
      }
      else if(_global.control)
      {
         g4.model.GameModel.chatModel.ToGame_Chat_ClickName(_loc3_,_loc4_,_loc2_,"CTRL");
      }
      else
      {
         g4.model.GameModel.chatModel.ToGame_Chat_ClickName(_loc3_,_loc4_,_loc2_);
      }
   }
   function checkTab(tabID)
   {
      var _loc2_ = g4.model.GameModel.chatModel.getChatTabData(tabID);
      if(_loc2_.type == g4.model.GameConstants.CHAT_TAB_TYPE_MAIN)
      {
         this.removeDividedChat(tabID);
      }
      else if(_loc2_.type == g4.model.GameConstants.CHAT_TAB_TYPE_DIVIDED)
      {
         var _loc3_ = this.getOrCreateDividedChat(tabID);
         _loc3_.update();
      }
   }
   function getDividedChat(tabID)
   {
      return this.dividedChatMap[tabID];
   }
   function getOrCreateDividedChat(tabID)
   {
      var _loc2_ = this.getDividedChat(tabID);
      if(_loc2_ == null)
      {
         if(this.unusedDividedChatArray.length > 0)
         {
            _loc2_ = (g4.view.chat.DividedChat)this.unusedDividedChatArray.pop();
         }
         else
         {
            _loc2_ = this.createDividedChat();
         }
         this.dividedChatArray.push(_loc2_);
         this.dividedChatMap[tabID] = _loc2_;
         _loc2_.init(tabID);
      }
      return _loc2_;
   }
   function createDividedChat()
   {
      var _loc2_ = "$Chat2.DividedChat";
      var _loc3_ = this.__get__targetMovieClip().attachMovie(_loc2_,"mc_divided_chat_" + this.dividedChatArray.length,this.__get__targetMovieClip().getNextHighestDepth());
      return new g4.view.chat.DividedChat(_loc3_);
   }
   function removeDividedChat(tabID)
   {
      var _loc2_ = this.getDividedChat(tabID);
      if(_loc2_ == null)
      {
         return undefined;
      }
      _loc2_.cleanUp();
      g4.util.ArrayUtil.removeElement(this.dividedChatArray,_loc2_);
      delete this.dividedChatMap.tabID;
      this.unusedDividedChatArray.push(_loc2_);
   }
   function removeAllDividedChat()
   {
      if(this.dividedChatArray == null || this.dividedChatArray.length == 0)
      {
         return undefined;
      }
      var _loc3_ = undefined;
      var _loc2_ = undefined;
      var _loc4_ = this.dividedChatArray.length;
      _loc2_ = 0;
      while(_loc2_ < _loc4_)
      {
         _loc3_ = (g4.view.chat.DividedChat)this.dividedChatArray[_loc2_];
         _loc3_.cleanUp();
         this.unusedDividedChatArray.push(_loc3_);
         _loc2_ = _loc2_ + 1;
      }
      this.dividedChatArray = [];
      this.dividedChatMap = {};
   }
   function model_mainStageSizeChangeHandler(event)
   {
      if(this.dividedChatArray == null || this.dividedChatArray.length == 0)
      {
         return undefined;
      }
      var _loc2_ = undefined;
      var _loc3_ = this.dividedChatArray.length;
      _loc2_ = 0;
      while(_loc2_ < _loc3_)
      {
         (g4.view.chat.DividedChat)this.dividedChatArray[_loc2_].rearrangePositionAfterStageSizeChange();
         _loc2_ = _loc2_ + 1;
      }
   }
   function model_mainUIModeChangeHandler(event)
   {
      if(this.dividedChatArray == null || this.dividedChatArray.length == 0)
      {
         return undefined;
      }
      var _loc2_ = undefined;
      var _loc3_ = this.dividedChatArray.length;
      _loc2_ = 0;
      while(_loc2_ < _loc3_)
      {
         (g4.view.chat.DividedChat)this.dividedChatArray[_loc2_].updateByUIMode();
         _loc2_ = _loc2_ + 1;
      }
   }
   function model_chatTabAddHandler(event)
   {
      this.checkTab(event.data.tabID);
   }
   function model_chatTabUpdateHandler(event)
   {
      this.checkTab(event.data.tabID);
   }
   function model_chatTabRemoveHandler(event)
   {
      this.removeDividedChat(event.data.tabID);
   }
   function model_chatTabAllRemoveHandler(event)
   {
      this.removeAllDividedChat();
   }
   function model_chatDividedChatMoveStartHandler(event)
   {
      if(g4.model.GameModel.chatModel.__get__draggingTabID() == g4.model.GameConstants.CHAT_MAIN_CHAT_DEFAULT_TAB_ID)
      {
         return undefined;
      }
      var _loc2_ = this.getOrCreateDividedChat(g4.model.GameModel.chatModel.__get__draggingTabID());
      _loc2_.startDragging();
   }
   function model_chatChatTextAddHandler(event)
   {
      var _loc2_ = this.getDividedChat(event.data.tabID);
      if(_loc2_ == null)
      {
         return undefined;
      }
      _loc2_.addChat(event.data.chatTextArray,event.data.clear);
   }
   function model_chatRefreshHandler(event)
   {
      if(this.dividedChatArray == null || this.dividedChatArray.length == 0)
      {
         return undefined;
      }
      var _loc2_ = undefined;
      var _loc3_ = this.dividedChatArray.length;
      _loc2_ = 0;
      while(_loc2_ < _loc3_)
      {
         (g4.view.chat.DividedChat)this.dividedChatArray[_loc2_].updateWholeChat();
         _loc2_ = _loc2_ + 1;
      }
   }
}
