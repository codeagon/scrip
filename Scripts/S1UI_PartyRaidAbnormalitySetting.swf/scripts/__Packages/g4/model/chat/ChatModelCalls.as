class g4.model.chat.ChatModelCalls extends g4.model.ModelCalls
{
   function ChatModelCalls()
   {
      super();
   }
   function ToGame_Chat_TabChanged(index)
   {
      this.sendToGame("ToGame_Chat_TabChanged",String(index));
   }
   function ToGame_Chat_ClickSocialBtn()
   {
      this.sendToGame("ToGame_Chat_ClickSocialBtn");
   }
   function ToGame_Chat_ChangeInputLanguage()
   {
      this.sendToGame("ToGame_Chat_ChangeInputLanguage");
   }
   function ToGame_Chat_RequestSlashCommand(channelNum, whisperTarget)
   {
      if(whisperTarget == null || whisperTarget.length == 0)
      {
         this.sendToGame("ToGame_Chat_RequestSlashCommand",String(channelNum));
      }
      else
      {
         this.sendToGame("ToGame_Chat_RequestSlashCommand",channelNum + "\t" + whisperTarget);
      }
   }
   function ToGame_Chat_SendWriting(chatType, HtmlText, id, notHtmlText)
   {
      this.sendToGame("ToGame_Chat_SendWriting",arguments.join("\t"));
   }
   function ToGame_Chat_StartSaveTabInfo()
   {
      this.sendToGame("ToGame_Chat_StartSaveTabInfo");
   }
   function ToGame_Chat_SaveTabInfo(tabID, x, y, width, height, type)
   {
      this.sendToGame("ToGame_Chat_SaveTabInfo",arguments.join("\t"));
   }
   function ToGame_Chat_EndSaveTabInfo()
   {
      this.sendToGame("ToGame_Chat_EndSaveTabInfo");
   }
   function ToGame_Chat_RequestAddTab()
   {
      this.sendToGame("ToGame_Chat_RequestAddTab");
   }
   function ToGame_Chat_RemoveTab(tabID)
   {
      this.sendToGame("ToGame_Chat_RemoveTab",String(tabID));
   }
   function ToGame_Chat_RequestOpenChatTabOptionUI(tabID)
   {
      this.sendToGame("ToGame_Chat_RequestOpenChatTabOptionUI",String(tabID));
   }
   function ToGame_Chat_RequestPrivateChannelUI(tabID)
   {
      this.sendToGame("ToGame_Chat_RequestPrivateChannelUI",String(tabID));
   }
   function ToGame_Chat_RequestInitChat()
   {
      this.sendToGame("ToGame_Chat_RequestInitChat");
   }
   function ToGame_Chat_ClickLink(type, id, id2)
   {
      if(id2 == undefined)
      {
         this.sendToGame("ToGame_Chat_ClickLink",type + "\t" + id);
      }
      else
      {
         this.sendToGame("ToGame_Chat_ClickLink",type + "\t" + id + "\t" + id2);
      }
   }
   function ToGame_Chat_ClickName(name, channelID, strTalk, combinationKey)
   {
      if(combinationKey == undefined || combinationKey == "")
      {
         this.sendToGame("ToGame_Chat_ClickName",name + "\t" + channelID + "\t" + strTalk);
      }
      else
      {
         this.sendToGame("ToGame_Chat_ClickName",name + "\t" + channelID + "\t" + strTalk + "\t" + combinationKey);
      }
   }
   function ToGame_Chat_SaveLock(locked)
   {
      this.sendToGame("ToGame_Chat_SaveLock",String(locked));
   }
   function ToGame_Chat_RequestInitPos()
   {
      this.sendToGame("ToGame_Chat_RequestInitPos");
   }
   function ToGame_Chat_SetChatMode(chatMode)
   {
      this.sendToGame("ToGame_Chat_SetChatMode",String(chatMode));
   }
}
