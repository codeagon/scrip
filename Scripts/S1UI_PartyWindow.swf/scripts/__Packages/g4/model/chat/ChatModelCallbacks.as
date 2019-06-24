class g4.model.chat.ChatModelCallbacks extends g4.model.ModelCallbacks
{
   function ChatModelCallbacks()
   {
      super();
      this.registerGameInterface("OnGame_Chat_AddTab",this.OnGame_Chat_AddTab);
      this.registerGameInterface("OnGame_Chat_UpdateTab",this.OnGame_Chat_UpdateTab);
      this.registerGameInterface("OnGame_Chat_ResetInfo",this.OnGame_Chat_ResetInfo);
      this.registerGameInterface("OnGame_Chat_SetChannelInfo",this.OnGame_Chat_SetChannelInfo);
      this.registerGameInterface("OnGame_Chat_SetChannelList",this.OnGame_Chat_SetChannelList);
      this.registerGameInterface("OnGame_Chat_UpdateChannelList",this.OnGame_Chat_UpdateChannelList);
      this.registerGameInterface("OnGame_Chat_ChangeChannel",this.OnGame_Chat_ChangeChannel);
      this.registerGameInterface("OnGame_Chat_SetWriting",this.OnGame_Chat_SetWriting);
      this.registerGameInterface("OnGame_Chat_ChangeChatMode",this.OnGame_Chat_ChangeChatMode);
      this.registerGameInterface("OnGame_Chat_SetLanguageInfo",this.OnGame_Chat_SetLanguageInfo);
      this.registerGameInterface("OnGame_Chat_SetLock",this.OnGame_Chat_SetLock);
      this.registerGameInterface("OnGame_Chat_Refresh",this.OnGame_Chat_Refresh);
      this.registerGameInterface("OnGame_Chat_RemakeToHtml",this.OnGame_Chat_RemakeToHtml);
      this.registerGameInterface("OnGame_Chat_Close",this.OnGame_Chat_Close);
      this.registerGameInterface("OnGame_Chat_ChangeInputChannel",this.OnGame_Chat_ChangeInputChannel);
      this.registerGameInterface("OnGame_Chat_AddInputText",this.OnGame_Chat_AddInputText);
      this.registerGameInterface("OnGame_Chat_AddLink",this.OnGame_Chat_AddLink);
      this.registerGameInterface("OnGame_Chat_SaveTabInfo",this.OnGame_Chat_SaveTabInfo);
      this.registerGameInterface("OnGame_Chat_SetPunishment",this.OnGame_Chat_SetPunishment);
      this.registerGameInterface("OnGame_Chat_SetChatMode",this.OnGame_Chat_SetChatMode);
   }
   function OnGame_Chat_AddTab(index, tabName, x, y, width, height, alpha, fontSize, type, bLock)
   {
      index = Number(index);
      x = Number(x);
      y = Number(y);
      width = Number(width);
      height = Number(height);
      alpha = Number(alpha);
      type = Number(type);
      fontSize = Number(fontSize);
      g4.model.GameModel.chatModel.$OnGame_Chat_AddTab(index,tabName,x,y,width,height,alpha,fontSize,type,bLock);
   }
   function OnGame_Chat_UpdateTab(index, tabName, x, y, width, height, alpha, fontSize, type, bLock)
   {
      index = Number(index);
      x = Number(x);
      y = Number(y);
      width = Number(width);
      height = Number(height);
      alpha = Number(alpha);
      type = Number(type);
      fontSize = Number(fontSize);
      g4.model.GameModel.chatModel.$OnGame_Chat_UpdateTab(index,tabName,x,y,width,height,alpha,fontSize,type,bLock);
   }
   function OnGame_Chat_ResetInfo()
   {
      g4.model.GameModel.chatModel.$OnGame_Chat_ResetInfo();
   }
   function OnGame_Chat_SetChannelInfo(channelData)
   {
      g4.model.GameModel.chatModel.$OnGame_Chat_SetChannelInfo(channelData);
   }
   function OnGame_Chat_SetChannelList(channelList)
   {
      g4.model.GameModel.chatModel.$OnGame_Chat_SetChannelList(channelList);
   }
   function OnGame_Chat_UpdateChannelList(channelID, name)
   {
      channelID = Number(channelID);
      g4.model.GameModel.chatModel.$OnGame_Chat_UpdateChannelList(channelID,name);
   }
   function OnGame_Chat_ChangeChannel(channelID, whisperTarget)
   {
      channelID = Number(channelID);
      g4.model.GameModel.chatModel.$OnGame_Chat_ChangeChannel(channelID,whisperTarget);
   }
   function OnGame_Chat_SetWriting(channelID, writing, id, addParam, tabIDList, wisperType)
   {
      channelID = Number(channelID);
      addParam = Number(addParam);
      wisperType = Number(wisperType);
      g4.model.GameModel.chatModel.$OnGame_Chat_SetWriting(channelID,writing,id,addParam,tabIDList,wisperType);
   }
   function OnGame_Chat_ChangeChatMode(bInputMode)
   {
      bInputMode = g4.util.Converter.toBoolean(bInputMode);
      g4.model.GameModel.chatModel.$OnGame_Chat_ChangeChatMode(bInputMode);
   }
   function OnGame_Chat_SetLanguageInfo(language)
   {
      language = Number(language);
      g4.model.GameModel.chatModel.$OnGame_Chat_SetLanguageInfo(language);
   }
   function OnGame_Chat_SetLock(locked)
   {
      locked = g4.util.Converter.toBoolean(locked);
      g4.model.GameModel.chatModel.$OnGame_Chat_SetLock(locked);
   }
   function OnGame_Chat_Refresh()
   {
      g4.model.GameModel.chatModel.$OnGame_Chat_Refresh();
   }
   function OnGame_Chat_RemakeToHtml(channelID, message, id)
   {
      channelID = Number(channelID);
      g4.model.GameModel.chatModel.$OnGame_Chat_RemakeToHtml(channelID,message,id);
   }
   function OnGame_Chat_Close()
   {
      this.sendEvent(g4.model.GameModelEventType.CHAT_CLOSE);
   }
   function OnGame_Chat_ChangeInputChannel(channelID, whisperTarget, bNotChatClear)
   {
      channelID = Number(channelID);
      bNotChatClear = g4.util.Converter.toBoolean(bNotChatClear);
      g4.model.GameModel.chatModel.$OnGame_Chat_ChangeInputChannel(channelID,whisperTarget,bNotChatClear);
   }
   function OnGame_Chat_AddInputText(text)
   {
      var _loc2_ = {};
      _loc2_.text = text;
      this.sendEvent(g4.model.GameModelEventType.CHAT_ADD_INPUT_TEXT,_loc2_);
   }
   function OnGame_Chat_AddLink(linkType, linkData, text, itemGrade)
   {
      linkType = Number(linkType);
      itemGrade = Number(itemGrade);
      var _loc2_ = {};
      _loc2_.linkType = linkType;
      _loc2_.linkData = linkData;
      _loc2_.text = text;
      _loc2_.itemGrade = itemGrade;
      this.sendEvent(g4.model.GameModelEventType.CHAT_ADD_LINK,_loc2_);
   }
   function OnGame_Chat_SaveTabInfo()
   {
      g4.model.GameModel.chatModel.$OnGame_Chat_SaveTabInfo();
   }
   function OnGame_Chat_SetPunishment(bShow, data)
   {
      g4.model.GameModel.chatModel.$OnGame_Chat_SetPunishment(bShow,data);
   }
   function OnGame_Chat_SetChatMode(chatMode)
   {
      g4.model.GameModel.chatModel.$OnGame_Chat_SetChatMode(chatMode);
   }
}
