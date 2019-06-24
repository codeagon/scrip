class g4.view.chat.MainChatOptionButton extends g4.view.chat.OptionButton
{
   var COMMAND_ADD_TAB = 1;
   var COMMAND_LOCK = 2;
   var COMMAND_UNLOCK = 3;
   var COMMAND_TAB_OPTION = 4;
   var COMMAND_RESET_POSITION = 5;
   var COMMAND_RESET_SETTING = 6;
   function MainChatOptionButton(targetMovieClip)
   {
      super(targetMovieClip);
   }
   function configUI()
   {
      this.toolTipText = lib.info.ToolTipStr.CHAT_OPTION;
      super.configUI();
   }
   function getMenuDataArray()
   {
      var _loc2_ = [];
      _loc2_.push(this.createMenuData(this.COMMAND_ADD_TAB,this.canToAddTab()));
      if(g4.model.GameModel.chatModel.__get__locked())
      {
         _loc2_.push(this.createMenuData(this.COMMAND_UNLOCK,true));
      }
      else
      {
         _loc2_.push(this.createMenuData(this.COMMAND_LOCK,true));
      }
      _loc2_.push(this.createMenuData(this.COMMAND_TAB_OPTION,true));
      _loc2_.push(this.createMenuData(this.COMMAND_RESET_POSITION,true));
      _loc2_.push(this.createMenuData(this.COMMAND_RESET_SETTING,true));
      return _loc2_;
   }
   function executeCommand(command)
   {
      switch(command)
      {
         case this.COMMAND_ADD_TAB:
            g4.view.chat.ChatGlobals.requestAddTabByUser = true;
            g4.model.GameModel.chatModel.ToGame_Chat_RequestAddTab();
            return undefined;
         case this.COMMAND_LOCK:
            g4.model.GameModel.chatModel.ToGame_Chat_SaveLock(true);
            return undefined;
         case this.COMMAND_UNLOCK:
            g4.model.GameModel.chatModel.ToGame_Chat_SaveLock(false);
            return undefined;
         case this.COMMAND_TAB_OPTION:
            g4.model.GameModel.chatModel.ToGame_Chat_RequestOpenChatTabOptionUI(g4.model.GameModel.chatModel.__get__selectedMainChatTabID());
            return undefined;
         case this.COMMAND_RESET_POSITION:
            g4.model.GameModel.chatModel.ToGame_Chat_RequestInitPos();
            return undefined;
         case this.COMMAND_RESET_SETTING:
            g4.model.GameModel.chatModel.ToGame_Chat_RequestInitChat();
            return undefined;
         default:
      }
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
         case this.COMMAND_ADD_TAB:
            return lib.util.UIString.getUIString("$031038");
         case this.COMMAND_LOCK:
            return lib.util.UIString.getUIString("$031040");
         case this.COMMAND_UNLOCK:
            return lib.util.UIString.getUIString("$031063");
         case this.COMMAND_TAB_OPTION:
            return lib.util.UIString.getUIString("$031076");
         case this.COMMAND_RESET_POSITION:
            return lib.util.UIString.getUIString("$031041");
         case this.COMMAND_RESET_SETTING:
            return lib.util.UIString.getUIString("$031061");
         default:
            return "";
      }
   }
   function canToAddTab()
   {
      return g4.model.GameModel.chatModel.__get__chatTabCount() < g4.model.GameConstants.CHAT_MAX_TAB_COUNT;
   }
}
