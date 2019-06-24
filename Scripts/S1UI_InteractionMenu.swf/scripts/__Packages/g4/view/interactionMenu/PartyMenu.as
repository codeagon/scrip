class g4.view.interactionMenu.PartyMenu extends g4.view.interactionMenu.Menu
{
   var depth1MenuCommand = -1;
   function PartyMenu(targetMovieClip)
   {
      super(targetMovieClip);
      this.configUI();
   }
   function configUI()
   {
      this.mc_depth1 = this.__get__targetMovieClip().createEmptyMovieClip("mc_depth1",this.__get__targetMovieClip().getNextHighestDepth());
      this.mc_depth1_bg = this.mc_depth1.attachMovie("$InteractionMenu.bg","mc_bg",this.mc_depth1.getNextHighestDepth());
      this.mc_depth1_list = this.mc_depth1.createEmptyMovieClip("mc_list",this.mc_depth1.getNextHighestDepth());
      this.mc_depth1_list._x = g4.view.interactionMenu.InteractionMenuConstants.PADDING_LEFT;
      this.mc_depth1_list._y = g4.view.interactionMenu.InteractionMenuConstants.PADDING_TOP;
      this.list_depth1 = new g4.view.interactionMenu.List(this.mc_depth1_list);
      this.list_depth1.addEventListener(g4.view.interactionMenu.List.ITEM_ROLL_OVER,this,"list1_itemRollOverHandler");
      this.list_depth1.addEventListener(g4.view.interactionMenu.List.ITEM_ROLL_OUT,this,"list1_itemRollOutHandler");
      this.list_depth1.addEventListener(g4.view.interactionMenu.List.ITEM_CLICK,this,"list1_itemClickHandler");
      this.mc_depth2 = this.__get__targetMovieClip().createEmptyMovieClip("mc_depth2",this.__get__targetMovieClip().getNextHighestDepth());
      this.mc_depth2_bg = this.mc_depth2.attachMovie("$InteractionMenu.bg","mc_bg",this.mc_depth2.getNextHighestDepth());
      this.mc_depth2_list = this.mc_depth2.createEmptyMovieClip("mc_list",this.mc_depth2.getNextHighestDepth());
      this.mc_depth2_list._x = g4.view.interactionMenu.InteractionMenuConstants.PADDING_LEFT;
      this.mc_depth2_list._y = g4.view.interactionMenu.InteractionMenuConstants.PADDING_TOP;
      this.list_depth2 = new g4.view.interactionMenu.List(this.mc_depth2_list);
      this.list_depth2.addEventListener(g4.view.interactionMenu.List.ITEM_ROLL_OVER,this,"list2_itemRollOverHandler");
      this.list_depth2.addEventListener(g4.view.interactionMenu.List.ITEM_ROLL_OUT,this,"list2_itemRollOutHandler");
      this.list_depth2.addEventListener(g4.view.interactionMenu.List.ITEM_CLICK,this,"list2_itemClickHandler");
      this.__get__targetMovieClip()._visible = false;
      this.closeDepth2Menu();
      g4.model.GameModel.addEventListener(g4.view.ViewID.INTERACTION_MENU,g4.model.GameModelEventType.UI_OPEN_PARTY_INTERACTION_MENU,this,"model_uiOpenPartyInteractionMenu");
      g4.model.GameModel.addEventListener(g4.view.ViewID.INTERACTION_MENU,g4.model.GameModelEventType.UI_OPEN_PARTY_RAID_INTERACTION_MENU,this,"model_uiOpenPartyRaidInteractionMenu");
   }
   function afterClose()
   {
      this.closeDepth2Menu();
   }
   function setDataAndOpenMenu(isPartyRaidMenu)
   {
      var _loc2_ = this.getDepth1MenuDataArray(isPartyRaidMenu);
      if(_loc2_ == null || _loc2_.length == 0)
      {
         this.closeMenuImmediately();
         return undefined;
      }
      this.list_depth1.setData(_loc2_);
      this.mc_depth1_bg._height = g4.view.interactionMenu.InteractionMenuConstants.PADDING_TOP + g4.view.interactionMenu.InteractionMenuConstants.PADDING_BOTTOM + this.list_depth1.getActualHeight();
      this.moveDepth1();
      this.openMenu();
      this.closeMenuLater();
   }
   function getDepth1MenuDataArray(isPartyRaidMenu)
   {
      var _loc5_ = this.getDepth1CommandArray(isPartyRaidMenu);
      if(_loc5_ == null || _loc5_.length == 0)
      {
         return null;
      }
      var _loc6_ = [];
      var _loc2_ = undefined;
      var _loc3_ = undefined;
      var _loc4_ = undefined;
      var _loc7_ = _loc5_.length;
      _loc4_ = 0;
      while(_loc4_ < _loc7_)
      {
         _loc3_ = _loc5_[_loc4_];
         _loc2_ = new g4.model.main.InteractionMenuData();
         _loc2_.data = _loc3_;
         _loc2_.label = this.getCommandName(_loc3_);
         _loc2_.enabled = this.getCommandEnabled(_loc3_);
         switch(_loc3_)
         {
            case g4.view.interactionMenu.InteractionMenuConstants.PARTY_COMMAND_KICK:
            case g4.view.interactionMenu.InteractionMenuConstants.PARTY_COMMAND_DELEGATION:
            case g4.view.interactionMenu.InteractionMenuConstants.PARTY_COMMAND_INVITATION_GRANT:
            case g4.view.interactionMenu.InteractionMenuConstants.PARTY_COMMAND_INVITATION_REVOKE:
               _loc2_.children = [null];
         }
         _loc6_.push(_loc2_);
         _loc4_ = _loc4_ + 1;
      }
      return _loc6_;
   }
   function getDepth1CommandArray(isPartyRaidMenu)
   {
      if(!g4.model.GameModel.partyModel.isInParty)
      {
         return null;
      }
      var _loc1_ = [];
      switch(g4.model.GameModel.partyModel.partyMyState)
      {
         case g4.model.GameConstants.PARTY_MY_STATE_PARTY_MASTER:
            _loc1_.push(g4.view.interactionMenu.InteractionMenuConstants.PARTY_COMMAND_LEAVE);
            _loc1_.push(g4.view.interactionMenu.InteractionMenuConstants.PARTY_COMMAND_DISTRIBUTION);
            _loc1_.push(g4.view.interactionMenu.InteractionMenuConstants.PARTY_COMMAND_KICK);
            _loc1_.push(g4.view.interactionMenu.InteractionMenuConstants.PARTY_COMMAND_DELEGATION);
            if(!g4.model.GameModel.partyModel.dismissDisible)
            {
               _loc1_.push(g4.view.interactionMenu.InteractionMenuConstants.PARTY_COMMAND_DISMANTLE);
            }
            _loc1_.push(g4.view.interactionMenu.InteractionMenuConstants.PARTY_COMMAND_RESET_DUNGEON);
            break;
         case g4.model.GameConstants.PARTY_MY_STATE_PARTY_RAID_MASTER:
            _loc1_.push(g4.view.interactionMenu.InteractionMenuConstants.PARTY_COMMAND_LEAVE);
            _loc1_.push(g4.view.interactionMenu.InteractionMenuConstants.PARTY_COMMAND_DISTRIBUTION);
            _loc1_.push(g4.view.interactionMenu.InteractionMenuConstants.PARTY_COMMAND_KICK);
            _loc1_.push(g4.view.interactionMenu.InteractionMenuConstants.PARTY_COMMAND_DELEGATION);
            _loc1_.push(g4.view.interactionMenu.InteractionMenuConstants.PARTY_COMMAND_INVITATION_GRANT);
            _loc1_.push(g4.view.interactionMenu.InteractionMenuConstants.PARTY_COMMAND_INVITATION_REVOKE);
            if(!g4.model.GameModel.partyModel.dismissDisible)
            {
               _loc1_.push(g4.view.interactionMenu.InteractionMenuConstants.PARTY_COMMAND_DISMANTLE);
            }
            _loc1_.push(g4.view.interactionMenu.InteractionMenuConstants.PARTY_COMMAND_CHECK_BATTLE_READY);
            break;
         default:
            _loc1_.push(g4.view.interactionMenu.InteractionMenuConstants.PARTY_COMMAND_LEAVE);
            if(!g4.model.GameModel.partyModel.banDisible)
            {
               _loc1_.push(g4.view.interactionMenu.InteractionMenuConstants.PARTY_COMMAND_KICK);
            }
            _loc1_.push(g4.view.interactionMenu.InteractionMenuConstants.PARTY_COMMAND_DISTRIBUTION);
      }
      if(isPartyRaidMenu)
      {
         _loc1_.push(g4.view.interactionMenu.InteractionMenuConstants.PARTY_COMMAND_ABNORMALITY_RAID);
         _loc1_.push(g4.view.interactionMenu.InteractionMenuConstants.PARTY_COMMAND_PARTY_RAID_RESET_POSITION);
      }
      else
      {
         _loc1_.push(g4.view.interactionMenu.InteractionMenuConstants.PARTY_COMMAND_ABNORMALITY);
      }
      return _loc1_;
   }
   function getCommandName(command)
   {
      switch(command)
      {
         case g4.view.interactionMenu.InteractionMenuConstants.PARTY_COMMAND_DISTRIBUTION:
            return "$021003";
         case g4.view.interactionMenu.InteractionMenuConstants.PARTY_COMMAND_KICK:
            return "$021004";
         case g4.view.interactionMenu.InteractionMenuConstants.PARTY_COMMAND_DELEGATION:
            return "$021005";
         case g4.view.interactionMenu.InteractionMenuConstants.PARTY_COMMAND_LEAVE:
            return "$021006";
         case g4.view.interactionMenu.InteractionMenuConstants.PARTY_COMMAND_DISMANTLE:
            return "$021007";
         case g4.view.interactionMenu.InteractionMenuConstants.PARTY_COMMAND_RESET_DUNGEON:
            return "$021013";
         case g4.view.interactionMenu.InteractionMenuConstants.PARTY_COMMAND_CHECK_BATTLE_READY:
            return "$021029";
         case g4.view.interactionMenu.InteractionMenuConstants.PARTY_COMMAND_INVITATION_GRANT:
            return "$021030";
         case g4.view.interactionMenu.InteractionMenuConstants.PARTY_COMMAND_INVITATION_REVOKE:
            return "$021031";
         case g4.view.interactionMenu.InteractionMenuConstants.PARTY_COMMAND_ABNORMALITY:
         case g4.view.interactionMenu.InteractionMenuConstants.PARTY_COMMAND_ABNORMALITY_RAID:
            return "$023018";
         case g4.view.interactionMenu.InteractionMenuConstants.PARTY_COMMAND_PARTY_RAID_RESET_POSITION:
            return "$023136";
         default:
            return "-";
      }
   }
   function getCommandEnabled(command)
   {
      if(command == g4.view.interactionMenu.InteractionMenuConstants.PARTY_COMMAND_DISMANTLE && g4.model.GameModel.partyModel.partyMyState == g4.model.GameConstants.PARTY_MY_STATE_PARTY_RAID_MASTER && g4.model.GameModel.partyModel.getPartyMemberCount() > 4)
      {
         return false;
      }
      return true;
   }
   function moveDepth1()
   {
      var _loc6_ = this.__get__targetMovieClip()._xscale / 100;
      var _loc7_ = Stage.visibleRect.x / _loc6_;
      var _loc16_ = (Stage.visibleRect.x + Stage.visibleRect.width) / _loc6_;
      var _loc14_ = Stage.visibleRect.y / _loc6_;
      var _loc15_ = (Stage.visibleRect.y + Stage.visibleRect.height) / _loc6_;
      var _loc10_ = this.mc_depth1_bg._width;
      var _loc11_ = this.mc_depth1_bg._height;
      var _loc9_ = g4.view.interactionMenu.InteractionMenuConstants.MENU_OFFSET_X;
      var _loc8_ = g4.view.interactionMenu.InteractionMenuConstants.MENU_OFFSET_Y;
      var _loc3_ = {};
      _loc3_.x = _root._xmouse;
      _loc3_.y = _root._ymouse;
      this.__get__targetMovieClip().globalToLocal(_loc3_);
      var _loc13_ = _loc3_.x;
      var _loc12_ = _loc3_.y;
      var _loc4_ = _loc13_ + _loc9_;
      if(_loc4_ + _loc10_ > _loc16_)
      {
         _loc4_ = _loc13_ - _loc9_ - _loc10_;
      }
      if(_loc4_ < _loc7_)
      {
         _loc4_ = _loc7_;
      }
      var _loc5_ = _loc12_ + _loc8_;
      if(_loc5_ + _loc11_ > _loc15_)
      {
         _loc5_ = _loc12_ - _loc8_ - _loc11_;
      }
      if(_loc5_ < _loc14_)
      {
         _loc5_ = _loc14_;
      }
      this.mc_depth1._x = _loc4_;
      this.mc_depth1._y = _loc5_;
   }
   function closeDepth2Menu()
   {
      this.mc_depth2._visible = false;
   }
   function openDepth2Menu(command, mc)
   {
      this.depth1MenuCommand = command;
      var _loc2_ = this.getDepth2MenuDataArray(this.depth1MenuCommand);
      if(_loc2_ == null || _loc2_.length == 0)
      {
         return undefined;
      }
      this.list_depth2.setData(_loc2_);
      this.mc_depth2_bg._height = g4.view.interactionMenu.InteractionMenuConstants.PADDING_TOP + g4.view.interactionMenu.InteractionMenuConstants.PADDING_BOTTOM + this.list_depth2.getActualHeight();
      this.moveDepth2(mc);
      this.mc_depth2._visible = true;
   }
   function getDepth2MenuDataArray(command)
   {
      var _loc5_ = undefined;
      switch(command)
      {
         case g4.view.interactionMenu.InteractionMenuConstants.PARTY_COMMAND_INVITATION_GRANT:
            _loc5_ = this.getPartyMemberDataArray(false);
            break;
         case g4.view.interactionMenu.InteractionMenuConstants.PARTY_COMMAND_INVITATION_REVOKE:
            _loc5_ = this.getPartyMemberDataArray(true);
            break;
         case g4.view.interactionMenu.InteractionMenuConstants.PARTY_COMMAND_KICK:
         case g4.view.interactionMenu.InteractionMenuConstants.PARTY_COMMAND_DELEGATION:
            _loc5_ = g4.model.GameModel.partyModel.partyMemberDataArray;
      }
      if(_loc5_ == null || _loc5_.length == 0)
      {
         return null;
      }
      var _loc6_ = [];
      var _loc2_ = undefined;
      var _loc4_ = undefined;
      var _loc3_ = undefined;
      var _loc7_ = _loc5_.length;
      _loc3_ = 0;
      while(_loc3_ < _loc7_)
      {
         _loc4_ = _loc5_[_loc3_];
         _loc2_ = new g4.model.main.InteractionMenuData();
         _loc2_.data = _loc4_;
         _loc2_.label = _loc4_.name;
         _loc6_.push(_loc2_);
         _loc3_ = _loc3_ + 1;
      }
      return _loc6_;
   }
   function getPartyMemberDataArray(hasInvitation)
   {
      var _loc3_ = [];
      var _loc2_ = undefined;
      var _loc1_ = undefined;
      var _loc4_ = g4.model.GameModel.partyModel.partyMemberDataArray.length;
      _loc1_ = 0;
      while(_loc1_ < _loc4_)
      {
         _loc2_ = g4.model.GameModel.partyModel.partyMemberDataArray[_loc1_];
         if(_loc2_.hasInvitation == hasInvitation)
         {
            _loc3_.push(_loc2_);
         }
         _loc1_ = _loc1_ + 1;
      }
      return _loc3_;
   }
   function moveDepth2(target)
   {
      var _loc5_ = this.__get__targetMovieClip()._xscale / 100;
      var _loc6_ = Stage.visibleRect.x / _loc5_;
      var _loc17_ = (Stage.visibleRect.x + Stage.visibleRect.width) / _loc5_;
      var _loc11_ = Stage.visibleRect.y / _loc5_;
      var _loc12_ = (Stage.visibleRect.y + Stage.visibleRect.height) / _loc5_;
      var _loc9_ = this.mc_depth2_bg._width;
      var _loc10_ = this.mc_depth2_bg._height;
      var _loc8_ = g4.view.interactionMenu.InteractionMenuConstants.PADDING_LEFT + g4.view.interactionMenu.InteractionMenuConstants.DEPTH_2_MENU_OFFSET_X;
      var _loc7_ = - g4.view.interactionMenu.InteractionMenuConstants.PADDING_TOP;
      var _loc2_ = {};
      _loc2_.x = 0;
      _loc2_.y = 0;
      target.localToGlobal(_loc2_);
      this.__get__targetMovieClip().globalToLocal(_loc2_);
      var _loc15_ = _loc2_.x;
      var _loc14_ = _loc2_.x + g4.view.interactionMenu.InteractionMenuConstants.ITEM_WIDTH;
      var _loc16_ = _loc2_.y;
      var _loc13_ = _loc2_.y + g4.view.interactionMenu.InteractionMenuConstants.ITEM_HEIGHT;
      var _loc3_ = _loc14_ + _loc8_;
      if(_loc3_ + _loc9_ > _loc17_)
      {
         _loc3_ = _loc15_ - _loc8_ - _loc9_;
      }
      if(_loc3_ < _loc6_)
      {
         _loc3_ = _loc6_;
      }
      var _loc4_ = _loc16_ + _loc7_;
      if(_loc4_ + _loc10_ > _loc12_)
      {
         _loc4_ = _loc13_ - _loc7_ - _loc10_;
      }
      if(_loc4_ < _loc11_)
      {
         _loc4_ = _loc11_;
      }
      this.mc_depth2._x = _loc3_;
      this.mc_depth2._y = _loc4_;
   }
   function list1_itemRollOverHandler(event)
   {
      this.closeDepth2Menu();
      var _loc2_ = Number(event.data);
      switch(_loc2_)
      {
         case g4.view.interactionMenu.InteractionMenuConstants.PARTY_COMMAND_KICK:
         case g4.view.interactionMenu.InteractionMenuConstants.PARTY_COMMAND_DELEGATION:
         case g4.view.interactionMenu.InteractionMenuConstants.PARTY_COMMAND_INVITATION_GRANT:
         case g4.view.interactionMenu.InteractionMenuConstants.PARTY_COMMAND_INVITATION_REVOKE:
            var _loc3_ = (MovieClip)event.target;
            this.openDepth2Menu(_loc2_,_loc3_);
      }
      this.cancelAutoClose();
   }
   function list1_itemRollOutHandler(event)
   {
      this.closeMenuLater();
   }
   function list1_itemClickHandler(event)
   {
      lib.manager.UISound.play(lib.manager.UISound.MAIN_BTN);
      var _loc2_ = Number(event.data);
      switch(_loc2_)
      {
         case g4.view.interactionMenu.InteractionMenuConstants.PARTY_COMMAND_DISTRIBUTION:
            g4.model.GameModel.partyModel.ToGame_PartyLootingSetting_Open();
            break;
         case g4.view.interactionMenu.InteractionMenuConstants.PARTY_COMMAND_LEAVE:
            g4.model.GameModel.partyModel.ToGame_PartyWindow_LeaveParty();
            break;
         case g4.view.interactionMenu.InteractionMenuConstants.PARTY_COMMAND_DISMANTLE:
            g4.model.GameModel.partyModel.ToGame_PartyWindow_DismissParty();
            break;
         case g4.view.interactionMenu.InteractionMenuConstants.PARTY_COMMAND_CHECK_BATTLE_READY:
            g4.model.GameModel.partyModel.ToGame_PartyWindowRaidInfo_CheckReadyForBattle();
            break;
         case g4.view.interactionMenu.InteractionMenuConstants.PARTY_COMMAND_RESET_DUNGEON:
            g4.model.GameModel.partyModel.ToGame_PartyWindow_ResetAllDungeons();
            break;
         case g4.view.interactionMenu.InteractionMenuConstants.PARTY_COMMAND_ABNORMALITY:
            g4.model.GameModel.partyModel.ToGame_PartyAbnormalitySetting_Open();
            break;
         case g4.view.interactionMenu.InteractionMenuConstants.PARTY_COMMAND_ABNORMALITY_RAID:
            g4.model.GameModel.partyModel.ToGame_PartyRaidAbnormalitySetting_Open();
            break;
         case g4.view.interactionMenu.InteractionMenuConstants.PARTY_COMMAND_PARTY_RAID_RESET_POSITION:
            g4.model.GameModel.partyModel.partyRaidResetPosition();
      }
      this.closeMenuImmediately();
   }
   function list2_itemRollOverHandler(event)
   {
      this.cancelAutoClose();
   }
   function list2_itemRollOutHandler(event)
   {
      this.closeMenuLater();
   }
   function list2_itemClickHandler(event)
   {
      var _loc3_ = (g4.model.party.PartyMemberData)event.data;
      var _loc2_ = _loc3_.index;
      switch(this.depth1MenuCommand)
      {
         case g4.view.interactionMenu.InteractionMenuConstants.PARTY_COMMAND_KICK:
            g4.model.GameModel.partyModel.ToGame_PartyWindow_BanPartyMember(_loc2_);
            break;
         case g4.view.interactionMenu.InteractionMenuConstants.PARTY_COMMAND_DELEGATION:
            g4.model.GameModel.partyModel.ToGame_PartyWindow_ChangePartyMaster(_loc2_);
            break;
         case g4.view.interactionMenu.InteractionMenuConstants.PARTY_COMMAND_INVITATION_GRANT:
            g4.model.GameModel.partyModel.ToGame_PartyWindow_SetPermissionInvitation(_loc2_,true);
            break;
         case g4.view.interactionMenu.InteractionMenuConstants.PARTY_COMMAND_INVITATION_REVOKE:
            g4.model.GameModel.partyModel.ToGame_PartyWindow_SetPermissionInvitation(_loc2_,false);
      }
      this.closeMenuImmediately();
   }
   function model_uiOpenPartyInteractionMenu(event)
   {
      this.setDataAndOpenMenu(false);
   }
   function model_uiOpenPartyRaidInteractionMenu(event)
   {
      this.setDataAndOpenMenu(true);
   }
}
