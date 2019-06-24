class g4.view.party.PartyMemberSlot extends gfx.core.UIComponent
{
   var index = -1;
   var memberID = -1;
   var survival = false;
   var connected = false;
   var inSameWorld = false;
   var inRange = false;
   var level = 0;
   var partyMasterState = 0;
   var battleReadyState = 0;
   var settingButtonVisible = false;
   function PartyMemberSlot()
   {
      super();
   }
   function configUI()
   {
      super.configUI();
      this.text_offline.verticalAlign = "center";
      this.text_offline.text = "$023010";
      g4.util.UIUtil.setMouseEnabled(this.text_offline,false);
      g4.util.UIUtil.setTextFieldStyle(this.text_offline,g4.util.UIUtil.TEXT_FIELD_STYLE_1);
      this.text_name.verticalAlign = "bottom";
      g4.util.UIUtil.setTextFieldStyle(this.text_name,g4.util.UIUtil.TEXT_FIELD_STYLE_1);
      g4.util.UIUtil.setMouseEnabled(this.mc_achievement,false);
      lib.manager.ToolTip.add(this.mc_battle_ready_done,lib.util.UIString.getUIString("$023014"),1);
      lib.manager.ToolTip.add(this.mc_battle_ready,lib.util.UIString.getUIString("$023015"),1);
      lib.manager.ToolTip.add(this.mc_party_master,lib.util.UIString.getUIString("$023007"),1);
      lib.manager.ToolTip.add(this.mc_party_master_raid,lib.util.UIString.getUIString("$023013"),1);
      this.UIDrager.setData(this._name,this);
      this.UIDrager.adjustDragLimit(0,0,0,-40 * lib.info.AlignInfo.scaleRatio);
      this.mc_buff_area.setCheckArea(this.mc_slot_area_check);
      this.mc_hp.mc_temp.swapDepths(this.mc_hp.getNextHighestDepth());
      this.mc_hp.mc_temp.removeMovieClip();
      var _loc4_ = this.mc_hp.createEmptyMovieClip("mc_hp_normal",this.mc_hp.getNextHighestDepth());
      this.gaugeBarHP = new g4.component.GaugeBar(_loc4_,flash.display.BitmapData.loadBitmap("$Party_bitmap_hp"),g4.view.party.PartyConstants.LIBRARY_RESOURCE_BITMAP_HP_WIDTH,g4.view.party.PartyConstants.LIBRARY_RESOURCE_BITMAP_HP_HEIGHT);
      var _loc3_ = this.mc_hp.createEmptyMovieClip("mc_hp_debuff",this.mc_hp.getNextHighestDepth());
      this.gaugeBarHPDebuff = new g4.component.GaugeBar(_loc3_,flash.display.BitmapData.loadBitmap("$Party_bitmap_hp_debuff"),g4.view.party.PartyConstants.LIBRARY_RESOURCE_BITMAP_HP_WIDTH,g4.view.party.PartyConstants.LIBRARY_RESOURCE_BITMAP_HP_HEIGHT);
      this.mc_mp.mc_temp.swapDepths(this.mc_mp.getNextHighestDepth());
      this.mc_mp.mc_temp.removeMovieClip();
      this.gaugeBarMP = new g4.component.GaugeBar(this.mc_mp,flash.display.BitmapData.loadBitmap("$Party_bitmap_mp"),g4.view.party.PartyConstants.LIBRARY_RESOURCE_BITMAP_MP_WIDTH,g4.view.party.PartyConstants.LIBRARY_RESOURCE_BITMAP_MP_HEIGHT);
      this.button_setting.addEventListener("click",this,"button_setting_clickHandler");
      Mouse.addListener(this);
      g4.model.GameModel.addEventListener(g4.view.ViewID.PARTY_WINDOW,g4.model.GameModelEventType.MAIN_UI_MODE_CHANGED,this,"model_mainUIModeChangeHandler");
      this.cleanUp();
      lib.manager.CustomScaleManger.getInstance().addCustomScale(this,g4.view.ViewID.PARTY_WINDOW);
   }
   function init(index)
   {
      this.index = index;
      if(index == 0)
      {
         this.settingButtonVisible = true;
      }
      this.updateSettingButtonVisible();
   }
   function setMemberID(value)
   {
      this.memberID = value;
      _root.ToGame_RequestSetUIPosition(this._name);
      lib.manager.ToolTip.add(this.UIDrager,this.memberID,9);
      this.__set__visible(true);
   }
   function cleanUp()
   {
      this.__set__visible(false);
      this.memberID = -1;
      this.setLevel(0);
      this.setName(null);
      this.setBattleState(false);
      this.setHP(0,0,0);
      this.setMP(0,0,0);
      this.setAchievementRating(-1);
      this.setDebuffState(false);
      this.setClazz(-1);
      this.setConnection(false);
      this.setSurvival(false);
      this.setPartyMasterState(0);
      this.setPartyRaidReady(0);
      this.setPartyRaid(false);
      this.setAwaken(false);
      this.clearBuff();
   }
   function updateSettingButtonVisible()
   {
      if(this.settingButtonVisible && g4.model.GameModel.mainModel.uiMode)
      {
         this.button_setting.__set__visible(true);
      }
      else
      {
         this.button_setting.__set__visible(false);
      }
   }
   function setLevel(value)
   {
      this.level = value;
      this.updateLevelAndNickname();
   }
   function setName(value)
   {
      this.nickname = value;
      this.updateLevelAndNickname();
   }
   function updateLevelAndNickname()
   {
      var _loc2_ = "";
      if(this.level > 0)
      {
         _loc2_ = _loc2_ + (String(this.level) + " ");
      }
      if(this.nickname != null && this.nickname.length > 0)
      {
         _loc2_ = _loc2_ + this.nickname;
      }
      lib.util.ExtString.textCut(this.text_name,_loc2_,true);
   }
   function setClazz(clazz, gageType, position)
   {
      if(clazz == -1)
      {
         this.mc_clazz._visible = false;
      }
      else
      {
         this.mc_clazz.gotoAndStop(clazz + 1);
         this.mc_clazz._visible = true;
         lib.manager.ToolTip.add(this.mc_clazz,lib.info.ToolTipStr["CLASS_" + clazz],1);
      }
   }
   function setConnection(connected)
   {
      this.connected = connected;
      if(connected)
      {
         this.text_offline._visible = false;
         this.mc_clazz._alpha = 100;
      }
      else
      {
         this.text_offline._visible = true;
         this.mc_clazz._alpha = 30;
      }
      this.updateGaugeBarVisible();
      this.updateNicknameTextColor();
      this.updateBG();
      this.updateBlur();
   }
   function setSurvival(survival)
   {
      this.survival = survival;
      this.updateGaugeBarVisible();
      this.updateNicknameTextColor();
      this.updateBG();
   }
   function setSameWorld(inSameWorld, inRange)
   {
      this.inSameWorld = inSameWorld;
      this.inRange = inRange;
      this.updateBlur();
   }
   function updateGaugeBarVisible()
   {
      if(this.connected && this.survival)
      {
         this.mc_hp._visible = true;
         this.mc_mp._visible = true;
      }
      else
      {
         this.mc_hp._visible = false;
         this.mc_mp._visible = false;
      }
   }
   function updateNicknameTextColor()
   {
      if(this.connected)
      {
         if(this.survival)
         {
            this.text_name.textColor = g4.view.party.PartyConstants.TEXT_COLOR_NICKNAME_NORMAL;
         }
         else
         {
            this.text_name.textColor = g4.view.party.PartyConstants.TEXT_COLOR_NICKNAME_DEAD;
         }
      }
      else
      {
         this.text_name.textColor = g4.view.party.PartyConstants.TEXT_COLOR_NICKNAME_OFFLINE;
      }
   }
   function updateBG()
   {
      var _loc2_ = false;
      if(this.connected && !this.survival)
      {
         _loc2_ = true;
      }
      if(_loc2_)
      {
         this.mc_bg_normal._visible = false;
         this.mc_bg_dead._visible = true;
      }
      else
      {
         this.mc_bg_normal._visible = true;
         this.mc_bg_dead._visible = false;
      }
   }
   function updateBlur()
   {
      var _loc2_ = false;
      if(this.connected)
      {
         if(!this.inSameWorld || !this.inRange)
         {
            _loc2_ = true;
         }
      }
      this._alpha = !_loc2_?100:50;
   }
   function setPartyMasterState(state)
   {
      this.partyMasterState = state;
      this.updateIconVisible();
   }
   function setPartyRaidReady(state)
   {
      this.battleReadyState = state;
      this.updateIconVisible();
   }
   function updateIconVisible()
   {
      var _loc4_ = false;
      var _loc3_ = false;
      var _loc5_ = false;
      var _loc2_ = false;
      if(this.partyMasterState == 1)
      {
         _loc4_ = true;
      }
      else if(this.partyMasterState == 2)
      {
         _loc3_ = true;
      }
      else if(this.battleReadyState == 1)
      {
         _loc5_ = true;
      }
      else if(this.battleReadyState == 2)
      {
         _loc2_ = true;
      }
      this.mc_party_master._visible = _loc4_;
      this.mc_party_master_raid._visible = _loc3_;
      this.mc_battle_ready_done._visible = _loc5_;
      this.mc_battle_ready._visible = _loc2_;
   }
   function setPartyRaid(isRaidParty)
   {
   }
   function setAwaken(awaken)
   {
   }
   function setBattleState(battleState)
   {
   }
   function setDebuffState(debuffState)
   {
      if(debuffState)
      {
         this.gaugeBarHP.__get__targetMovieClip()._visible = false;
         this.gaugeBarHPDebuff.__get__targetMovieClip()._visible = true;
      }
      else
      {
         this.gaugeBarHP.__get__targetMovieClip()._visible = true;
         this.gaugeBarHPDebuff.__get__targetMovieClip()._visible = false;
      }
   }
   function setHP(current, max, maxAdd)
   {
      var _loc2_ = max + maxAdd;
      if(current > 0 && _loc2_ > 0)
      {
         this.gaugeBarHP.setRatio(current / _loc2_);
         this.gaugeBarHPDebuff.setRatio(current / _loc2_);
      }
      else
      {
         this.gaugeBarHP.setRatio(0);
         this.gaugeBarHPDebuff.setRatio(0);
      }
   }
   function setMP(current, max, maxAdd)
   {
      var _loc2_ = max + maxAdd;
      if(current > 0 && _loc2_ > 0)
      {
         this.gaugeBarMP.setRatio(current / _loc2_);
      }
      else
      {
         this.gaugeBarMP.setRatio(0);
      }
   }
   function setAchievementRating(rating)
   {
      if(rating >= 1 && rating <= 5)
      {
         this.mc_achievement.gotoAndStop(rating);
         this.mc_achievement._visible = true;
      }
      else
      {
         this.mc_achievement._visible = false;
      }
   }
   function setDiceDistributionStart(type)
   {
      g4.model.GameModel.partyModel.ToGame_PartyWindow_DiceDistributionStart_End(this.memberID);
   }
   function setDiceDistributionData(value, isHighestValue)
   {
      g4.model.GameModel.partyModel.ToGame_PartyWindow_DiceDistributionData_End(this.memberID);
   }
   function setDiceDistributionIcon(img, grade, sealType)
   {
      g4.model.GameModel.partyModel.ToGame_PartyWindow_DiceDistributionIcon_End(this.memberID);
   }
   function setDiceDistributionEnd()
   {
   }
   function addBuff(id, stackCnt, type, group, bRelaxMerit, img, remain, total, currentTime)
   {
      this.mc_buff_area.addBuff(id,stackCnt,type,group,bRelaxMerit,img,remain,total,currentTime);
   }
   function removeBuff(id)
   {
      this.mc_buff_area.removeBuff(id);
   }
   function clearBuff()
   {
      this.mc_buff_area.clearAllBuffs();
   }
   function setTimePause(id, bPause)
   {
      this.mc_buff_area.setTimePause(id,bPause);
   }
   function contains(parent, child)
   {
      var _loc1_ = child;
      while(true)
      {
         if(_loc1_ == null)
         {
            break;
         }
         if(_loc1_ == parent)
         {
            return true;
         }
         _loc1_ = _loc1_._parent;
      }
      return false;
   }
   function button_setting_clickHandler(event)
   {
      g4.model.GameModel.uiModel.openPartyInteractionMenu();
   }
   function onMouseDown(button, targetPath)
   {
      if(button == 2)
      {
         if(this.contains(this,Mouse.getTopMostEntity(true)))
         {
            g4.model.GameModel.partyModel.ToGame_PartyWindow_CallMenu(this.memberID);
         }
      }
   }
   function model_mainUIModeChangeHandler(event)
   {
      this.updateSettingButtonVisible();
   }
}
