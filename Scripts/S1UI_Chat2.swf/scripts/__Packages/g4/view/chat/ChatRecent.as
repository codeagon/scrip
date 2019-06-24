class g4.view.chat.ChatRecent extends g4.core.SimpleView
{
   var MAX_DISPLAY_LINE = 3;
   var textFieldOffsetX = 0;
   var textFieldOffsetY = 0;
   function ChatRecent(targetMovieClip)
   {
      super(targetMovieClip);
      this.configUI();
   }
   function configUI()
   {
      this.textField = this.__get__targetMovieClip().textField;
      this.textFieldOffsetX = this.textField._width - g4.view.chat.ChatConstants.STYLE_CHAT_BASE_WIDTH;
      this.textFieldOffsetY = this.textField._y - g4.view.chat.ChatConstants.STYLE_CHAT_BASE_HEIGHT;
      this.textField.multiline = true;
      this.textField.wordWrap = true;
      this.textField.html = true;
      this.textField.verticalAlign = "bottom";
      g4.util.UIUtil.setMouseEnabled(this.textField,false);
      g4.util.UIUtil.setTextFieldStyle(this.textField,g4.util.UIUtil.TEXT_FIELD_STYLE_1);
      this.recentChatTextArray = [];
      g4.model.GameModel.addEventListener(g4.view.ViewID.CHAT_2,g4.model.GameModelEventType.CHAT_CHAT_TEXT_ADD,this,"model_chatChatTextAddHandler");
      g4.model.GameModel.addEventListener(g4.view.ViewID.CHAT_2,g4.model.GameModelEventType.CHAT_SELECTED_MAIN_TAB_CHANGE,this,"model_chatSelectedMainTabChangeHandler");
      g4.model.GameModel.addEventListener(g4.view.ViewID.CHAT_2,g4.model.GameModelEventType.CHAT_REFRESH,this,"model_chatRefreshHandler");
      g4.model.GameModel.addEventListener(g4.view.ViewID.CHAT_2,g4.model.GameModelEventType.CHAT_RESIZING_END,this,"model_chatResizingEndHandler");
      g4.model.GameModel.addEventListener(g4.view.ViewID.CHAT_2,g4.model.GameModelEventType.CHAT_TAB_UPDATE,this,"model_chatTabAddHandler");
   }
   function setSize(w, h)
   {
      this.textField._width = w + this.textFieldOffsetX;
      this.textField._y = h + this.textFieldOffsetY;
   }
   function getSelectedTabID()
   {
      return g4.model.GameModel.chatModel.__get__selectedMainChatTabID();
   }
   function addChat(chatTextArray)
   {
      this.recentChatTextArray = this.recentChatTextArray.concat(chatTextArray);
      while(this.recentChatTextArray.length > this.MAX_DISPLAY_LINE)
      {
         this.recentChatTextArray.shift();
      }
      this.updateChatText();
   }
   function updateWholeChat()
   {
      var _loc3_ = g4.model.GameModel.chatModel.getChatTabData(this.getSelectedTabID());
      if(_loc3_.chatTextArray == null || _loc3_.chatTextArray.length == 0)
      {
         this.clearChat();
         return undefined;
      }
      this.recentChatTextArray = [];
      var _loc4_ = _loc3_.chatTextArray.length - 1;
      var _loc5_ = Math.max(0,_loc4_ - this.MAX_DISPLAY_LINE - 1);
      var _loc2_ = undefined;
      _loc2_ = _loc5_;
      while(_loc2_ <= _loc4_)
      {
         this.recentChatTextArray.push(_loc3_.chatTextArray[_loc2_]);
         _loc2_ = _loc2_ + 1;
      }
      this.textField.fontScaleFactor = _loc3_.fontSize;
      this.updateChatText();
   }
   function clearChat()
   {
      this.recentChatTextArray = [];
      this.updateChatText();
   }
   function updateChatText()
   {
      if(this.recentChatTextArray == null || this.recentChatTextArray.length == 0)
      {
         this.textField.htmlText = "";
         return undefined;
      }
      var _loc3_ = this.recentChatTextArray.join("");
      var _loc2_ = _loc3_.length;
      while(_loc2_ > 0)
      {
         if(_loc3_.substr(_loc2_ - 1,1) == "\n")
         {
            _loc2_ = _loc2_ - 1;
            continue;
         }
         break;
      }
      if(_loc2_ != _loc3_.length)
      {
         _loc3_ = _loc3_.substr(0,_loc2_);
      }
      this.textField.htmlText = _loc3_;
      if(this.textField.numLines > this.MAX_DISPLAY_LINE)
      {
         var _loc4_ = this.textField.numLines - this.MAX_DISPLAY_LINE;
         var _loc5_ = this.textField.getLineOffset(_loc4_);
         this.textField.replaceText(0,_loc5_,"");
      }
   }
   function model_chatChatTextAddHandler(event)
   {
      if(event.data.tabID == this.getSelectedTabID())
      {
         this.addChat(event.data.chatTextArray);
      }
   }
   function model_chatSelectedMainTabChangeHandler(event)
   {
      this.updateWholeChat();
   }
   function model_chatRefreshHandler(event)
   {
      this.updateWholeChat();
   }
   function model_chatResizingEndHandler(event)
   {
      this.updateChatText();
   }
   function model_chatTabAddHandler(event)
   {
      this.updateWholeChat();
   }
}
