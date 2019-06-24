class g4.view.chat.DividedChatOptionButton extends g4.view.chat.OptionButton
{
   var COMMAND_REMOVE_TAB = 1;
   var COMMAND_TAB_OPTION = 2;
   var COMMAND_PRIVATE_CHANNEL = 3;
   var COMMAND_RESET_POSITION = 4;
   var tabID = -1;
   function DividedChatOptionButton(targetMovieClip)
   {
      super(targetMovieClip);
   }
   function configUI()
   {
      this.toolTipText = lib.util.UIString.getUIString("$032001");
      super.configUI();
   }
   function getMenuDataArray()
   {
      var _loc2_ = [];
      _loc2_.push(this.createMenuData(this.COMMAND_REMOVE_TAB,true));
      _loc2_.push(this.createMenuData(this.COMMAND_TAB_OPTION,true));
      _loc2_.push(this.createMenuData(this.COMMAND_PRIVATE_CHANNEL,true));
      _loc2_.push(this.createMenuData(this.COMMAND_RESET_POSITION,true));
      return _loc2_;
   }
   function executeCommand(command)
   {
      switch(command)
      {
         case this.COMMAND_REMOVE_TAB:
            g4.model.GameModel.chatModel.removeTab(this.tabID);
            break;
         case this.COMMAND_TAB_OPTION:
            g4.model.GameModel.chatModel.ToGame_Chat_RequestOpenChatTabOptionUI(this.tabID);
            break;
         case this.COMMAND_PRIVATE_CHANNEL:
            g4.model.GameModel.chatModel.ToGame_Chat_RequestPrivateChannelUI(this.tabID);
            break;
         case this.COMMAND_RESET_POSITION:
            g4.model.GameModel.chatModel.moveToMainChatTab(this.tabID);
      }
   }
   function setTabID(id)
   {
      this.tabID = id;
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
         case this.COMMAND_RESET_POSITION:
            return lib.util.UIString.getUIString("$031058");
         default:
            return "";
      }
   }
}
