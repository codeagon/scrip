class g4.view.partyRaid.PartyRaidGroupMember extends gfx.core.UIComponent
{
   var groupID = -1;
   var id = -1;
   var isMe = false;
   var isDead = false;
   var connected = false;
   var isMaster = false;
   var readyState = 0;
   function PartyRaidGroupMember()
   {
      super();
   }
   function configUI()
   {
      super.configUI();
      this.text_name.verticalAlign = "bottom";
      g4.util.UIUtil.setMouseEnabled(this.text_name,false);
      g4.util.UIUtil.setTextFieldStyle(this.text_name,g4.util.UIUtil.TEXT_FIELD_STYLE_1);
      this.text_offline.verticalAlign = "center";
      this.text_offline.text = "$023500";
      g4.util.UIUtil.setMouseEnabled(this.text_offline,false);
      g4.util.UIUtil.setTextFieldStyle(this.text_offline,g4.util.UIUtil.TEXT_FIELD_STYLE_1);
      lib.manager.ToolTip.add(this.mc_icon_master,lib.util.UIString.getUIString("$023508"),1);
      lib.manager.ToolTip.add(this.mc_icon_ready_done,lib.util.UIString.getUIString("$023509"),1);
      lib.manager.ToolTip.add(this.mc_icon_ready_not_yet,lib.util.UIString.getUIString("$023510"),1);
      this.mc_hp.mc_temp.swapDepths(this.mc_hp.getNextHighestDepth());
      this.mc_hp.mc_temp.removeMovieClip();
      var _loc4_ = this.mc_hp.createEmptyMovieClip("mc_hp_normal",this.mc_hp.getNextHighestDepth());
      this.gaugeBarHP = new g4.component.GaugeBar(_loc4_,flash.display.BitmapData.loadBitmap("$PartyRaid_bitmap_hp"),g4.view.partyRaid.PartyRaidConstants.LIBRARY_RESOURCE_BITMAP_HP_WIDTH,g4.view.partyRaid.PartyRaidConstants.LIBRARY_RESOURCE_BITMAP_HP_HEIGHT);
      var _loc3_ = this.mc_hp.createEmptyMovieClip("mc_hp_debuff",this.mc_hp.getNextHighestDepth());
      this.gaugeBarHPDebuff = new g4.component.GaugeBar(_loc3_,flash.display.BitmapData.loadBitmap("$PartyRaid_bitmap_hp_debuff"),g4.view.partyRaid.PartyRaidConstants.LIBRARY_RESOURCE_BITMAP_HP_WIDTH,g4.view.partyRaid.PartyRaidConstants.LIBRARY_RESOURCE_BITMAP_HP_HEIGHT);
      this.mc_mp.mc_temp.swapDepths(this.mc_mp.getNextHighestDepth());
      this.mc_mp.mc_temp.removeMovieClip();
      this.gaugeBarMP = new g4.component.GaugeBar(this.mc_mp,flash.display.BitmapData.loadBitmap("$PartyRaid_bitmap_mp"),g4.view.partyRaid.PartyRaidConstants.LIBRARY_RESOURCE_BITMAP_MP_WIDTH,g4.view.partyRaid.PartyRaidConstants.LIBRARY_RESOURCE_BITMAP_MP_HEIGHT);
      this.cleanUp();
      Mouse.addListener(this);
   }
   function init(groupID, id)
   {
      this.groupID = groupID;
      this.id = id;
      lib.manager.ToolTip.add(this,groupID + "\t" + id,10);
   }
   function setDetailMode(detailMode)
   {
      this.mc_buff_area._visible = detailMode;
   }
   function cleanUp()
   {
      this._visible = false;
      this.setMaster(false);
      this.setClazz(-1);
      this.setName("",false);
      this.setConnected(false);
      this.setHP(0,0);
      this.setMP(0,0);
      this.setDead(false);
      this.setReady(0);
      this.setDangerous(false);
      this.setDebuffState(false);
      this.mc_buff_area.cleanUp();
   }
   function setVisible(visible)
   {
      if(visible)
      {
         this._visible = true;
      }
      else
      {
         this.cleanUp();
      }
   }
   function setMaster(isMaster)
   {
      this.isMaster = isMaster;
      this.updateIconVisible();
   }
   function setReady(type)
   {
      this.readyState = type;
      this.updateIconVisible();
   }
   function updateIconVisible()
   {
      var _loc3_ = false;
      var _loc4_ = false;
      var _loc2_ = false;
      if(this.isMaster)
      {
         _loc3_ = true;
      }
      else if(this.readyState == 1)
      {
         _loc4_ = true;
      }
      else if(this.readyState == 2)
      {
         _loc2_ = true;
      }
      this.mc_icon_master._visible = _loc3_;
      this.mc_icon_ready_done._visible = _loc4_;
      this.mc_icon_ready_not_yet._visible = _loc2_;
   }
   function setClazz(classType)
   {
      if(classType == -1)
      {
         this.mc_clazz._visible = false;
         return undefined;
      }
      this.mc_clazz._visible = true;
      this.mc_clazz.gotoAndStop(classType + 1);
      lib.manager.ToolTip.add(this.mc_clazz,lib.info.ToolTipStr["CLASS_" + classType],1);
   }
   function setName(userName, isMe)
   {
      this.text_name.setText(userName,0);
      this.isMe = isMe;
      this.updateBG();
      this.updateTextColor();
   }
   function setConnected(connected)
   {
      this.connected = connected;
      this.updateBG();
      this.updateGaugeBar();
      this.updateTextColor();
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
   }
   function setHP(currentHP, maxHP)
   {
      var _loc2_ = 0;
      if(currentHP > 0 && maxHP > 0)
      {
         _loc2_ = Math.max(0,Math.min(1,currentHP / maxHP));
      }
      this.gaugeBarHP.setRatio(_loc2_);
      this.gaugeBarHPDebuff.setRatio(_loc2_);
   }
   function setMP(currentMP, maxMP)
   {
      var _loc2_ = 0;
      if(currentMP > 0 && maxMP > 0)
      {
         _loc2_ = Math.max(0,Math.min(1,currentMP / maxMP));
      }
      this.gaugeBarMP.setRatio(_loc2_);
   }
   function setDead(isDead)
   {
      this.isDead = isDead;
      this.updateBG();
      this.updateGaugeBar();
      this.updateTextColor();
   }
   function diceStart()
   {
      g4.model.GameModel.partyModel.ToGame_PartyWindowRaidInfo_PartyRaidMember_DiceDistributionStart_End(this.groupID,this.id);
   }
   function diceSetValue(value, isMax)
   {
      if(isMax)
      {
         this.diceEnd();
      }
      g4.model.GameModel.partyModel.ToGame_PartyWindowRaidInfo_PartyRaidMember_DiceDistributionData_End(this.groupID,this.id);
   }
   function diceEnd()
   {
   }
   function setDangerous(isDangerous)
   {
   }
   function setDebuffState(isDebuff)
   {
      if(isDebuff)
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
   function updateBG()
   {
      var _loc7_ = false;
      var _loc6_ = false;
      if(this.isMe)
      {
         _loc6_ = true;
      }
      else
      {
         _loc7_ = true;
      }
      this.mc_clazz_bg_normal._visible = _loc7_;
      this.mc_clazz_bg_me._visible = _loc6_;
      var _loc4_ = false;
      var _loc5_ = false;
      var _loc3_ = false;
      var _loc2_ = false;
      if(this.connected)
      {
         if(this.isDead)
         {
            _loc2_ = true;
         }
         else if(this.isMe)
         {
            _loc5_ = true;
         }
         else
         {
            _loc4_ = true;
         }
      }
      else
      {
         _loc3_ = true;
      }
      this.mc_bg_me._visible = _loc5_;
      this.mc_bg_normal._visible = _loc4_;
      this.mc_bg_offline._visible = _loc3_;
      this.mc_bg_dead._visible = _loc2_;
   }
   function updateTextColor()
   {
      var _loc2_ = g4.view.partyRaid.PartyRaidConstants.TEXT_COLOR_NORMAL;
      if(this.connected)
      {
         if(this.isDead)
         {
            _loc2_ = g4.view.partyRaid.PartyRaidConstants.TEXT_COLOR_DEAD;
         }
         else if(this.isMe)
         {
            _loc2_ = g4.view.partyRaid.PartyRaidConstants.TEXT_COLOR_ME;
         }
      }
      else
      {
         _loc2_ = g4.view.partyRaid.PartyRaidConstants.TEXT_COLOR_OFFLINE;
      }
      this.text_name.textColor = _loc2_;
   }
   function updateGaugeBar()
   {
      var _loc2_ = true;
      if(!this.connected || this.isDead)
      {
         _loc2_ = false;
      }
      this.mc_hp._visible = _loc2_;
      this.mc_mp._visible = _loc2_;
   }
   function buffAdd(id, stackCnt, type, bRelaxMerit, img, remain, total)
   {
      this.mc_buff_area.buffAdd(id,stackCnt,type,bRelaxMerit,img,remain,total);
   }
   function buffRemove(id)
   {
      this.mc_buff_area.buffRemove(id);
   }
   function buffRemoveAll(type)
   {
      this.mc_buff_area.buffRemoveAll(type);
   }
   function setTimePause(id, bPause)
   {
      this.mc_buff_area.setTimePause(id,bPause);
   }
   function onMouseDown(button, targetPath)
   {
      if(button == 2)
      {
         if(this.contains(this,Mouse.getTopMostEntity(true)))
         {
            g4.model.GameModel.partyModel.ToGame_PartyWindowRaidInfo_InteractionMenu(this.groupID,this.id);
         }
      }
   }
}
