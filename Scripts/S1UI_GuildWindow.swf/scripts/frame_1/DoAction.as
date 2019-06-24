function limitLength(txdMc, limitLen)
{
   var _loc1_ = txdMc.length;
   var _loc3_ = txdMc.text;
   if(_loc1_ > limitLen)
   {
      var _loc4_ = new String(_loc3_);
      var _loc2_ = new String();
      _loc2_ = _loc4_.substr(0,limitLen);
      txdMc.text = _loc2_;
   }
   container_mc.infoMc.txtLenCheck.text = _loc1_ + "/" + limitLen;
}
function setComboBox()
{
   EditMc.comboBox0.data = comboArr;
   EditMc.comboBox0.addListener(comboListner);
   EditMc.comboBox0.selectedIndex = 0;
   EditMc.comboBox1.data = comboArr;
   EditMc.comboBox1.addListener(comboListner);
   EditMc.comboBox1.selectedIndex = 0;
   EditMc.comboBox2.data = guildInviteArr;
   EditMc.comboBox2.addListener(comboListner);
   EditMc.comboBox2.selectedIndex = 0;
   var _loc2_ = new lib.util.ExtTextField(EditMc.inputTxt,0,EditMc.input_focus);
   _loc2_.caption = GUILD_STYLE_CAPTION;
   _loc2_.textField.selectable = true;
   _loc2_.onChanged = function()
   {
      var _loc1_ = EditMc.inputTxt.length;
      if(_loc1_ > NameTextLength_Local1)
      {
         EditMc.inputTxt.text = prevInput;
      }
      else
      {
         prevInput = EditMc.inputTxt.text;
      }
      if(EditMc.inputTxt.text == GUILD_STYLE_CAPTION)
      {
         _loc1_ = 0;
      }
      EditMc.txtLenCheck.text = _loc1_ + "/" + NameTextLength_Local1;
   };
   EditMc.onEnterKey = function()
   {
      Selection.setFocus(null);
   };
}
function CheckType(mc, num)
{
   var _loc2_ = Number(StyleType * 2) + 1;
   var _loc1_ = [1,1,_loc2_];
   if(num != 0)
   {
      if(num == 1)
      {
         _loc1_ = [2,1,_loc2_];
      }
      else if(num == 2)
      {
         _loc1_ = [1,2,_loc2_];
      }
      else if(num == 4)
      {
         _loc1_ = [1,1,_loc2_ + 1];
      }
      else if(num == 3)
      {
         _loc1_ = [2,2,_loc2_];
      }
      else if(num == 5)
      {
         _loc1_ = [2,1,_loc2_ + 1];
      }
      else if(num == 6)
      {
         _loc1_ = [1,2,_loc2_ + 1];
      }
      else
      {
         _loc1_ = [2,2,_loc2_ + 1];
      }
   }
   mc.checkBox0.gotoAndStop(_loc1_[0]);
   mc.checkBox1.gotoAndStop(_loc1_[1]);
   mc.checkBox2.gotoAndStop(_loc1_[2]);
}
function SetComboArr()
{
   var _loc1_ = 1;
   while(_loc1_ < 66)
   {
      comboArr.push(_loc1_);
      _loc1_ = _loc1_ + 1;
   }
}
function ToGame_GuildWindow_Rename()
{
   fscommand("ToGame_GuildWindow_Rename");
}
function setGage(mc, num)
{
   if(num == 0)
   {
      mc._visible = false;
      return undefined;
   }
   mc._visible = true;
   if(num < 5)
   {
      mc.gageM._width = 1;
      mc.gageE._x = 2;
   }
   else
   {
      mc.gageM._width = num - 3;
      mc.gageE._x = num - 3;
   }
}
function release3(num, type)
{
   if(infoSubTabNum == num)
   {
      return undefined;
   }
   infoSubTabNum = num;
   if(type == 1)
   {
      return undefined;
   }
   ToGame_PlaySound("3022");
   if(num == "0")
   {
      ToGame_GuildWindow_GuildHistoryPage(1);
   }
   else
   {
      ToGame_GuildWindow_WareHouseHistoryPage(1);
   }
}
function listClear(mc, len)
{
   var _loc1_ = 0;
   while(_loc1_ < len)
   {
      mc.boxMc["line" + _loc1_].removeMovieClip();
      _loc1_ = _loc1_ + 1;
   }
   mc.boxMc._y = 0;
   mc.scrollbar.scroll = 0;
}
function SetApplyButton(mc, bool_0, bool_1)
{
   var _loc1_ = new lib.util.TxtBtn(mc.btn0,mc.txt0);
   _loc1_.setRelease(function()
   {
      ToGameSendGuildApplyAcceptResult(mc.id,1);
   }
   );
   var _loc2_ = new lib.util.TxtBtn(mc.btn1,mc.txt1);
   _loc2_.setRelease(function()
   {
      ToGameSendGuildApplyAcceptResult(mc.id,0);
   }
   );
   _loc1_.setEnabled(Boolean(Number(bool_0)));
   _loc2_.setEnabled(Boolean(Number(bool_1)));
}
function levelCheck(mc, checkLv)
{
   if(checkLv < sLevel)
   {
      mc.gotoAndStop(2);
   }
   else
   {
      mc.gotoAndStop(1);
   }
   mc.txt.text = GUILD_INFO_TXT_0 + (Number(checkLv) + 1);
}
function createSlot(slot, slotIndex, img)
{
   lib.manager.ToolTip.add(slot,slotIndex,3);
   slot.overMc._visible = false;
   slot.numFd.text = "";
   slot.slotHit.slotName = "SKILLSLOT";
   slot.descFd.verticalAutoSize = "center";
   slot.nameFd.verticalAutoSize = "center";
   lib.display.DrawBitmapData.draw(slot.img,img,0,0,0,0,44,44,0.6875);
   slot.img.hitTestDisable = true;
   if(skillEdit == 0)
   {
      return undefined;
   }
   slot.slotHit.onRollOver = function()
   {
      if(this._parent.disable)
      {
         return undefined;
      }
      if(skillPocus == this._parent)
      {
         return undefined;
      }
      this._parent.overMc._visible = true;
   };
   slot.slotHit.onRollOut = function()
   {
      if(this._parent.disable)
      {
         return undefined;
      }
      if(skillPocus == this._parent)
      {
         return undefined;
      }
      this._parent.overMc._visible = false;
   };
   slot.slotHit.onReleaseOutside = function()
   {
      this._parent.overMc._visible = false;
      if(skillPocus == this._parent)
      {
         return undefined;
      }
   };
   slot.slotHit.onPress = function()
   {
      if(this._parent.disable)
      {
         return undefined;
      }
      pressedSkillSlot = this;
      if(skillPocus == this._parent)
      {
         return undefined;
      }
      this._parent.overMc._visible = true;
   };
   slot.slotHit.onRelease = function()
   {
      if(this._parent.disable)
      {
         return undefined;
      }
      if(pressedSkillSlot == this)
      {
         pressedSkillSlot = null;
      }
      if(skillPocus == this._parent)
      {
         return undefined;
      }
      ToGame_PlaySound("3020");
      SetSkillButton(this._parent);
   };
   slot.slotHit.onDragOut = function()
   {
      if(this == pressedSkillSlot)
      {
         var _loc3_ = this._parent.img;
         if(_loc3_ != undefined)
         {
            _global.StartIconDrag(this._parent,_loc3_);
         }
      }
   };
   slot.slotHit.GetName = function()
   {
      return this._parent._name;
   };
   return slot;
}
function SetSkillButton(slotMc)
{
   skillPocus.overMc._visible = false;
   skillPocus.pBtn._visible = false;
   skillPocus.mBtn._visible = false;
   skillPocus = slotMc;
   if(slotMc == null)
   {
      return undefined;
   }
   skillPocus.overMc._visible = true;
   skillPocus.pBtn._visible = true;
   skillPocus.mBtn._visible = true;
}
function clearSkill(target, slotIndex)
{
   var _loc1_ = target.coolTimeMc;
   if(_loc1_ != undefined)
   {
      coolTimeManager.removeCoolTimeInstance(_loc1_);
      _loc1_.removeMovieClip();
   }
}
function setWarList(warInfo)
{
   var _loc6_ = Number(warInfo[0]);
   var _loc1_ = guildWarMc.boxMc["list_" + _loc6_];
   if(undefined == _loc1_)
   {
      _loc1_ = createWarList(_loc6_);
   }
   clearWarList(_loc1_);
   _loc1_._visible = true;
   var _loc3_ = Number(warInfo[1]);
   var _loc28_ = warInfo[2];
   var _loc29_ = warInfo[3];
   var _loc12_ = warInfo[4];
   var _loc27_ = warInfo[5];
   var _loc19_ = warInfo[6];
   var _loc5_ = warInfo[7];
   var _loc24_ = warInfo[8];
   var _loc10_ = warInfo[9];
   var _loc21_ = warInfo[10];
   var _loc22_ = warInfo[11];
   var _loc17_ = warInfo[12];
   var _loc26_ = Boolean(Number(warInfo[13]));
   var _loc14_ = Boolean(Number(warInfo[14]));
   var _loc23_ = _loc3_ + 1;
   _loc1_.gotoAndStop(_loc23_);
   _loc1_.myNameTF.setText(_loc28_);
   lib.util.DrawBitmap.draw(_loc1_.myImg,_loc29_,50,50);
   _loc1_.myCoinMc.tf.text = _loc12_;
   var _loc8_ = _loc1_.myCoinMc.tf.textWidth;
   var _loc15_ = _loc8_ + 28;
   _loc1_.myCoinMc.tf._width = _loc8_ + 5;
   _loc1_.myCoinMc.mc._x = _loc8_ + 1;
   _loc1_.myCoinMc._x = 137 - _loc15_ / 2;
   lib.manager.ToolTip.add(_loc1_.myCoinMc,_loc27_,1);
   _loc1_.myKillTF.htmlText = _loc19_ + "<font size=\'20\' face=\'$NormalFont\'>" + KILL + "</font>";
   var _loc11_ = _loc1_.myKillTF.textWidth;
   _loc1_.myKillTF._x = _loc1_.vsTF._x - _loc11_ - 10;
   _loc1_.myKillTF._width = _loc11_ + 5;
   _loc1_.myCoinMc._visible = Number(_loc12_) != 0;
   _loc1_.targetNameTF.setText(_loc5_);
   lib.util.DrawBitmap.draw(_loc1_.targetImg,_loc24_,50,50);
   _loc1_.targetCoinMc.tf.text = _loc10_;
   var _loc7_ = _loc1_.targetCoinMc.tf.textWidth;
   var _loc20_ = _loc7_ + 28;
   _loc1_.targetCoinMc._x = 720 - _loc20_ / 2;
   _loc1_.targetCoinMc.tf._width = _loc7_ + 5;
   _loc1_.targetCoinMc.mc._x = _loc7_ + 1;
   lib.manager.ToolTip.add(_loc1_.targetCoinMc,_loc21_,1);
   _loc1_.targetKillTF.htmlText = _loc22_ + "<font size=\'20\' face=\'$NormalFont\' >" + KILL + "</font>";
   var _loc9_ = _loc1_.targetKillTF.textWidth;
   _loc1_.targetKillTF._x = _loc1_.vsTF._x + _loc1_.vsTF._width + 10;
   _loc1_.targetKillTF._width = _loc9_ + 5;
   _loc1_.targetCoinMc._visible = Number(_loc10_) != 0;
   var _loc16_ = guildWarListTitleTextColor[_loc3_];
   _loc1_.titleTF.textColor = _loc16_;
   var _loc4_ = "";
   switch(_loc3_)
   {
      case 0:
         _loc4_ = lib.util.UIString.getUIString("$123285","guildName",_loc5_);
         _loc1_.blueAni._x = _loc1_.targetKillTF._x + _loc9_ + 10;
         break;
      case 1:
         _loc4_ = lib.util.UIString.getUIString("$123286");
         _loc1_.blueAni._x = _loc1_.myKillTF._x - 55;
         _loc1_.redAni._x = _loc1_.targetKillTF._x + _loc9_ + 32;
         break;
      case 2:
         _loc4_ = lib.util.UIString.getUIString("$123287","guildName",_loc5_);
         _loc1_.redAni._x = _loc1_.myKillTF._x - 10 - _loc1_.redAni._width;
   }
   _loc1_.blueAni._visible = _loc3_ < 2;
   _loc1_.redAni._visible = 1 <= _loc3_;
   _loc1_.titleTF.text = _loc4_;
   _loc1_.timeTF.text = _loc17_;
   _loc1_.withdrawBtn._visible = GUILD_WAR_TYPE_DECLARED != _loc3_?true:false;
   _loc1_.counterBtn._visible = GUILD_WAR_TYPE_DECLARED != _loc3_?false:true;
   _loc1_.surrenderBtn._visible = GUILD_WAR_TYPE_DECLARED != _loc3_?false:true;
   var _loc25_ = GUILD_WAR_TYPE_DECLARED != _loc3_?_loc1_.withdrawBtn:_loc1_.counterBtn;
   var _loc13_ = GUILD_WAR_TYPE_DECLARED != _loc3_?null:_loc1_.surrenderBtn;
   _loc25_.setDisabled(_loc26_);
   if(GUILD_WAR_TYPE_DECLARED == _loc3_)
   {
      var _loc18_ = !_loc14_?surrenderTooltipNormalState:surrenderTooltipDisableState;
      _loc13_.setDisabled(_loc14_);
      lib.manager.ToolTip.add(_loc13_,_loc18_,1);
   }
   _loc1_.idx = _loc6_;
}
function createWarList(index)
{
   var _loc1_ = guildWarMc.boxMc.attachMovie("warLineMc","list_" + index,guildWarMc.boxMc.getNextHighestDepth());
   _loc1_._y = 5 + 177 * index;
   _loc1_.myNameTF.verticalAlign = "center";
   _loc1_.myCoinTF.verticalAlign = "center";
   _loc1_.myKillTF.verticalAlign = "center";
   _loc1_.targetNameTF.verticalAlign = "center";
   _loc1_.targetCoinTF.verticalAlign = "center";
   _loc1_.targetKillTF.verticalAlign = "center";
   _loc1_.vsTF.verticalAlign = "center";
   _loc1_.timeTF.verticalAlign = "center";
   _loc1_.titleTF.verticalAlign = "center";
   setButtonEvent(_loc1_.withdrawBtn,GUILD_WAR_LIST_BUTTON_LABEL_WITHDRAW,GUILD_WAR_LIST_BUTTON_TYPE_WITHDRAW);
   setButtonEvent(_loc1_.counterBtn,GUILD_WAR_LIST_BUTTON_LABEL_COUNTER,GUILD_WAR_LIST_BUTTON_TYPE_COUNTER);
   setButtonEvent(_loc1_.surrenderBtn,GUILD_WAR_LIST_BUTTON_LABEL_SURRENDER,GUILD_WAR_LIST_BUTTON_TYPE_SURRENDER);
   lib.manager.ToolTip.add(_loc1_.withdrawBtn,guildWarToolTipStr0,1);
   lib.manager.ToolTip.add(_loc1_.counterBtn,guildWarToolTipStr1,1);
   return _loc1_;
}
function clearWarList(targetMc)
{
   lib.util.DrawBitmap.draw(targetMc.myImg,"");
   targetMc.myNameTF.text = "";
   targetMc.myCoinTF.text = "";
   targetMc.myKillCountTF.text = "";
   lib.util.DrawBitmap.draw(targetMc.targetImg,"");
   targetMc.targetNameTF.text = "";
   targetMc.targetCoinTF.text = "";
   targetMc.targetKillCountTF.text = "";
   targetMc.timeTF.text = "";
   targetMc.titleTF.text = "";
   targetMc.titleTF.textColor = guildWarListTitleTextColor[2];
   lib.manager.ToolTip.remove(targetMc.surrenderBtn);
}
function setButtonEvent(targetBtn, buttonLabel, buttonType)
{
   targetBtn.buttonType = buttonType;
   targetBtn.txt.text = buttonLabel;
   targetBtn.setDisabled = function(bDisable)
   {
      var _loc2_ = !bDisable?GUILD_WAR_LIST_BUTTON_TYPE_NORMAL:GUILD_WAR_LIST_BUTTON_TYPE_DISABLE;
      var _loc3_ = !bDisable?guildWarListButtonTextColor[GUILD_WAR_LIST_BUTTON_TYPE_NORMAL]:guildWarListButtonTextColor[GUILD_WAR_LIST_BUTTON_TYPE_DISABLE];
      this.txt.textColor = _loc3_;
      this.btn.gotoAndStop(_loc2_);
   };
   targetBtn.isDisabled = function()
   {
      if(this._currentframe == GUILD_WAR_LIST_BUTTON_TYPE_DISABLE)
      {
         return true;
      }
      return false;
   };
   targetBtn.onRollOver = function()
   {
      if(this.isDisabled())
      {
         return undefined;
      }
      this.txt.textColor = guildWarListButtonTextColor[GUILD_WAR_LIST_BUTTON_TYPE_OVER];
      this.btn.gotoAndStop(GUILD_WAR_LIST_BUTTON_TYPE_OVER);
   };
   targetBtn.onRollOut = targetBtn.onReleaseOutside = function()
   {
      if(this.isDisabled())
      {
         return undefined;
      }
      this.txt.textColor = guildWarListButtonTextColor[GUILD_WAR_LIST_BUTTON_TYPE_NORMAL];
      this.btn.gotoAndStop(GUILD_WAR_LIST_BUTTON_TYPE_NORMAL);
   };
   targetBtn.onPress = function()
   {
      if(this.isDisabled())
      {
         return undefined;
      }
      this.txt.textColor = guildWarListButtonTextColor[GUILD_WAR_LIST_BUTTON_TYPE_PRESS];
      this.btn.gotoAndStop(GUILD_WAR_LIST_BUTTON_TYPE_PRESS);
   };
   targetBtn.onRelease = function()
   {
      if(this.isDisabled())
      {
         return undefined;
      }
      var _loc2_ = this._parent.idx;
      ToGame_GuildWindow_GuildWarListButton(_loc2_,this.buttonType);
   };
}
function ToGame_GuildWindow_Init()
{
   fscommand("ToGame_GuildWindow_Init");
}
function ToGame_GuildWindow_Close()
{
   ToGame_PlaySound("3022");
   fscommand("ToGame_GuildWindow_Close");
}
function ToGame_GuildWindow_Create()
{
   fscommand("ToGame_GuildWindow_Create");
}
function ToGame_GuildWindow_Search()
{
   fscommand("ToGame_GuildWindow_Search");
}
function ToGame_GuildWindow_EditCrest()
{
   fscommand("ToGame_GuildWindow_EditCrest");
}
function ToGame_GuildWindow_GuildLeave()
{
   ToGame_PlaySound("3022");
   fscommand("ToGame_GuildWindow_GuildLeave");
}
function ToGame_GuildWindow_PREdit()
{
   ToGame_PlaySound("3022");
   fscommand("ToGame_GuildWindow_PREdit");
}
function ToGame_GuildWindow_PREditClose()
{
   fscommand("ToGame_GuildWindow_PREditClose");
}
function ToGame_GuildWindow_GuildHistoryPage(num)
{
   getURL("FSCommand:ToGame_GuildWindow_GuildHistoryPage",num);
}
function ToGame_GuildWindow_WareHouseHistoryPage(num)
{
   getURL("FSCommand:ToGame_GuildWindow_WareHouseHistoryPage",num);
}
function ToGame_GuildWindow_RequestItemLink(id)
{
   getURL("FSCommand:ToGame_GuildWindow_RequestItemLink",id);
}
function ToGame_GuildWindow_ApplyListPage(num)
{
   getURL("FSCommand:ToGame_GuildWindow_ApplyListPage",num);
}
function ToGame_Community_ChangeGuildMemberGroup(id)
{
   getURL("FSCommand:ToGame_Community_ChangeGuildMemberGroup",id);
}
function ToGame_GuildWindow_SetAuthorize()
{
   ToGame_PlaySound("3024");
   fscommand("ToGame_GuildWindow_SetAuthorize");
}
function ToGame_GuildWindow_SubsidyPay()
{
   ToGame_PlaySound("3024");
   fscommand("ToGame_GuildWindow_SubsidyPay");
}
function ToGameRequestShowOnlineFriendOnly(bTrue)
{
   getURL("FSCommand:ToGameRequestShowOnlineFriendOnly",bTrue);
}
function ToGame_GuildWindow_InitPageCheck(bTrue)
{
   getURL("FSCommand:ToGame_GuildWindow_InitPageCheck",bTrue);
}
function ToGameSendGuildApplyAcceptResult(id, bTrue)
{
   getURL("FSCommand:ToGameSendGuildApplyAcceptResult",id + "\t" + bTrue);
}
function ToGame_GuildWindow_EditIntroduce(str)
{
   getURL("FSCommand:ToGame_GuildWindow_EditIntroduce",str);
}
function ToGame_GuildWindow_EditNotice(str)
{
   getURL("FSCommand:ToGame_GuildWindow_EditNotice",str);
}
function ToGameRequestGuildMemberList(type, idx)
{
   if(introduceShow && idx == "4")
   {
      idx = 6;
   }
   getURL("FSCommand:ToGameRequestGuildMemberList",type + "\t" + idx);
}
function ToGame_GuildWindow_MissionFilter(idx, type)
{
   getURL("FSCommand:ToGame_GuildWindow_MissionFilter",idx + "\t" + type);
}
function ToGame_GuildWindow_MissionScale(idx)
{
   getURL("FSCommand:ToGame_GuildWindow_MissionScale",idx);
}
function ToGame_GuildWindow_MissionTaskInfo(id, type)
{
   getURL("FSCommand:ToGame_GuildWindow_MissionTaskInfo",id + "\t" + type);
}
function ToGame_GuildWindow_MissionClick(id)
{
   ToGame_PlaySound("3024");
   getURL("FSCommand:ToGame_GuildWindow_MissionClick",id);
}
function ToGame_GuildWindow_SkillClick(id, type)
{
   ToGame_PlaySound("3021");
   getURL("FSCommand:ToGame_GuildWindow_SkillClick",id + "\t" + type);
}
function ToGame_GuildWindow_SkillApply()
{
   SetSkillButton(null);
   fscommand("ToGame_GuildWindow_SkillApply");
}
function ToGame_GuildWindow_SkillCancel()
{
   fscommand("ToGame_GuildWindow_SkillCancel");
}
function ToGame_GuildWindow_SkillUse(id)
{
   getURL("FSCommand:ToGame_GuildWindow_SkillUse",id);
}
function ToGame_GuildWindow_StartGuildWar()
{
   fscommand("ToGame_GuildWindow_StartGuildWar");
}
function ToGame_GuildWindow_ShowGuildWarHistory()
{
   fscommand("ToGame_GuildWindow_ShowGuildWarHistory");
}
function ToGame_GuildWindow_GuildWarListButton(idx, buttonType)
{
   getURL("FSCommand:ToGame_GuildWindow_GuildWarListButton",idx + "\t" + buttonType);
}
function ToGame_PlaySound(id)
{
   lib.manager.UISound.play(id);
}
function release(num, type)
{
   ToGame_PlaySound("3022");
   ToGame_GuildWindow_ChangeTab(tab.activedNum,type);
}
function ToGame_GuildWindow_ChangeTab(TabNo, type)
{
   if(tabNum == TabNo)
   {
      return undefined;
   }
   if(tabNum != -1 && type == 0)
   {
      getURL("FSCommand:ToGame_GuildWindow_ChangeTab",TabNo);
   }
   tabNum = TabNo;
   container_mc.infoMc._visible = false;
   container_mc.listMc._visible = false;
   container_mc.questMc._visible = false;
   container_mc.skillMc._visible = false;
   container_mc.warMc._visible = false;
   container_mc.skillMc.boxMc._visible = false;
   if(TabNo == "1")
   {
      tab2.setTab(0,1);
   }
   container_mc.infoMc._visible = "0" == TabNo;
   container_mc.listMc._visible = "1" == TabNo;
   container_mc.questMc._visible = "2" == TabNo;
   container_mc.skillMc._visible = "3" == TabNo;
   container_mc.warMc._visible = "4" == TabNo;
}
function parsHtml(str)
{
   str = lib.util.ExtString.replace(str,"<a id=\'","<a href=\'asfunction:_parent._parent.itemLink,");
   return str;
}
function itemLink(itemId)
{
   ToGame_GuildWindow_RequestItemLink(itemId);
}
function ToGame_GuildWindow_PREditEnter()
{
   var _loc1_ = "";
   var _loc3_ = Number(EditMc.checkBox0._currentframe - 1) + Number(EditMc.checkBox1._currentframe - 1) * 2 + Number((EditMc.checkBox2._currentframe + 1) % 2) * 4;
   var _loc2_ = EditMc.inputTxt.text;
   _loc1_ = _loc1_ + (_loc3_ + "\t");
   _loc1_ = _loc1_ + (EditMc.comboBox0.selectedIndex + "\t");
   _loc1_ = _loc1_ + (EditMc.comboBox1.selectedIndex + "\t");
   _loc1_ = _loc1_ + (EditMc.comboBox2.selectedIndex + 1 + "\t");
   if(_loc2_ == GUILD_STYLE_CAPTION)
   {
      _loc2_ = "";
   }
   _loc1_ = _loc1_ + _loc2_;
   ToGame_PlaySound("3024");
   getURL("FSCommand:ToGame_GuildWindow_PREditEnter",_loc1_);
}
function changeItroduceMode(flag)
{
   ToGame_PlaySound("3022");
   if(flag)
   {
      listBtn3.txt.htmlText = GUILD_LIST_TXT_0;
   }
   else
   {
      listBtn3.txt.htmlText = GUILD_LIST_TXT_1;
   }
   introduceShow = flag;
   SetSort(0);
   var _loc2_ = 0;
   while(_loc2_ < listLen)
   {
      var _loc1_ = container_mc.listMc.boxMc["line" + _loc2_];
      _loc1_.introduceBg._visible = _loc1_.txt_6.type == "input" && introduceShow;
      _loc1_.txt_3._visible = !introduceShow;
      _loc1_.txt_4._visible = !introduceShow;
      _loc1_.txt_6._visible = introduceShow;
      _loc2_ = _loc2_ + 1;
   }
}
function release2(num)
{
   ToGame_PlaySound("3022");
   ToGame_GuildWindow_SubTab(tab2.activedNum);
}
function SetSort(TabNo)
{
   container_mc.listMc.sortBtn.clear();
   if(TabNo == 0)
   {
      if(introduceShow)
      {
         container_mc.listMc.sortBtn.colums = [135,212,120,97,415];
         container_mc.listMc.sortBtn.labels = ["$111044","$111006","$111010","$111008","$123116"];
      }
      else
      {
         container_mc.listMc.sortBtn.colums = [135,212,120,97,213,202];
         container_mc.listMc.sortBtn.labels = ["$111044","$111006","$111010","$111008","$123230","$123038"];
      }
   }
   else
   {
      container_mc.listMc.sortBtn.colums = [170,92,89,150,290,193];
      container_mc.listMc.sortBtn.labels = ["$111006","$111010","$111008","$123118","$111067","$111027"];
   }
}
function ToGame_GuildWindow_SubTab(TabNo)
{
   if(subTabNum == TabNo)
   {
      return undefined;
   }
   if(subTabNum != -1)
   {
      getURL("FSCommand:ToGame_GuildWindow_SubTab",TabNo);
   }
   subTabNum = TabNo;
   if(TabNo == 0)
   {
      listClear(container_mc.listMc,listLen2);
      listLen2 = 0;
      SetSort(0);
      container_mc.listMc.tipMc._visible = false;
      container_mc.listMc.btmMc._visible = true;
      container_mc.listMc.txtBtn1._visible = true;
      container_mc.listMc.txtBtn2._visible = true;
   }
   else
   {
      listClear(container_mc.listMc,listLen);
      listLen = 0;
      SetSort(1);
      container_mc.listMc.tipMc._visible = true;
      container_mc.listMc.btmMc._visible = false;
      container_mc.listMc.txtBtn1._visible = false;
      container_mc.listMc.txtBtn2._visible = false;
   }
}
function SetMissionUpDate(lineMc, ProgressList, time, button)
{
   var _loc5_ = lib.util.ExtString.split(ProgressList,"\n");
   var _loc1_ = 0;
   var _loc6_ = _loc5_.length;
   _loc1_ = 0;
   while(_loc1_ < _loc6_)
   {
      var _loc2_ = lib.util.ExtString.split(_loc5_[_loc1_],"\t");
      lineMc.detailMc["txt" + _loc1_].htmlText = _loc2_[0] + "(" + _loc2_[1] + " / " + _loc2_[2] + ")";
      _loc1_ = _loc1_ + 1;
   }
   var _loc4_ = lib.util.ExtString.split(button,"\t");
   lineMc.txt3.textAutoSize = "shrink";
   lineMc.txt3.text = time;
   if(_loc4_[3] != "-1")
   {
      if(lineMc.bg._currentframe == 4)
      {
         lineMc.txt5.htmlText = _loc4_[3];
         lineMc.txt4.htmlText = "";
      }
      else
      {
         lineMc.txt4.htmlText = _loc4_[3];
         lineMc.txt5.htmlText = "";
      }
   }
   else
   {
      lineMc.txt4.htmlText = "";
      lineMc.txt5.htmlText = "";
   }
   var _loc7_ = lineMc.btn;
   _loc7_.setText(_loc4_[0]);
   _loc7_.setEnabled(Boolean(Number(_loc4_[1])));
   if(_loc4_[2] != "" && _loc4_[2] != undefined)
   {
      lib.manager.ToolTip.add(lineMc.btnMc,_loc4_[2],1);
   }
   else
   {
      lib.manager.ToolTip.remove(lineMc.btnMc);
   }
}
function CheckIndex(lineMc)
{
   var _loc1_ = 0;
   var _loc2_ = missionArr.length;
   _loc1_ = 0;
   while(_loc1_ < _loc2_)
   {
      if(missionArr[_loc1_] == lineMc)
      {
         return _loc1_;
      }
      _loc1_ = _loc1_ + 1;
   }
}
function SetPosition()
{
   var _loc1_ = 0;
   var _loc4_ = missionArr.length;
   var _loc3_ = 0;
   _loc1_ = 0;
   while(_loc1_ < _loc4_)
   {
      var _loc2_ = missionArr[_loc1_];
      _loc2_._y = _loc3_;
      _loc3_ = _loc3_ + _loc2_.bg._height;
      _loc1_ = _loc1_ + 1;
   }
   container_mc.questMc.scrollbar.pageSize = container_mc.questMc.boxMc._height;
   container_mc.questMc.scrollbar.scroll = 0;
}
function questCheckAlign()
{
   var _loc1_ = undefined;
   var _loc4_ = 720;
   _loc1_ = 3;
   while(_loc1_ > -1)
   {
      var _loc2_ = container_mc.questMc["check" + _loc1_];
      var _loc3_ = _loc2_._width + 10;
      _loc4_ = _loc4_ - _loc3_;
      _loc2_._x = _loc4_;
      _loc1_ = _loc1_ - 1;
   }
}
stop();
var UI = this;
UI._visible = false;
var UIname = "GuildWindow";
this.bWindowOpen = false;
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
container_mc.title_txt.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
var CustomScaleEvent;
var historyStyle = new TextField.StyleSheet();
historyStyle.setStyle("a",{color:"#ffe03f",textDecoration:"underline"});
historyStyle.setStyle("a:hover",{color:"#FFDE5E",display:"inline"});
historyStyle.setStyle("a:active",{color:"#FF9D5E",display:"inline"});
historyStyle.setStyle("date",{color:"#BCE7A9",display:"inline"});
historyStyle.setStyle("history",{display:"block"});
historyStyle.setStyle("guildname",{color:"#d7d7d7",display:"inline"});
historyStyle.setStyle("name",{color:"#80e71c",display:"inline"});
var NameTextLength_Local1 = 0;
var NameTextLength_Local2 = 0;
var NameTextLength_Local3 = 0;
myListener.OnGame_GuildWindow_LengthLocal = function(lengthnum1, lengthnum2, lengthnum3)
{
   NameTextLength_Local1 = lengthnum3;
   NameTextLength_Local2 = lengthnum2;
   NameTextLength_Local3 = lengthnum1;
};
var guild_data = "";
var GUILD_NOITEC_CAPTION = lib.util.UIString.getUIString("$123268");
var GUILD_STYLE_CAPTION = lib.util.UIString.getUIString("$123176");
var notice_txt = new lib.util.ExtTextField(container_mc.infoMc.noticeFd,0,container_mc.infoMc.noticeFd_focus);
notice_txt.caption = GUILD_NOITEC_CAPTION;
notice_txt.textField.selectable = false;
notice_txt.onChanged = function()
{
   var _loc1_ = 0;
   if(NameTextLength_Local2 > 0)
   {
      _loc1_ = NameTextLength_Local2;
   }
   else
   {
      _loc1_ = 200;
   }
   limitLength(container_mc.infoMc.noticeFd,_loc1_);
};
notice_txt.onKillFocusEvent = function(tf)
{
   var _loc1_ = tf.text;
   if(_loc1_ == GUILD_NOITEC_CAPTION)
   {
      _loc1_ = "";
   }
   ToGame_GuildWindow_EditNotice(_loc1_);
};
notice_txt.onEnterKey = function()
{
   Selection.setFocus(null);
};
container_mc.infoMc.numberSteper.onChanged = function(page)
{
   if(infoSubTabNum == 0)
   {
      ToGame_GuildWindow_GuildHistoryPage(page);
   }
   else
   {
      ToGame_GuildWindow_WareHouseHistoryPage(page);
   }
};
container_mc.listMc.tipMc.numberSteper.onChanged = function(page)
{
   ToGame_GuildWindow_ApplyListPage(page);
};
container_mc.infoMc.scrollbar.setTextField(container_mc.infoMc.guildHistoryFd);
container_mc.listMc.scrollbar.pageSize = container_mc.listMc.boxMc._height;
container_mc.listMc.scrollbar.displaySize = container_mc.listMc.maskMc._height;
container_mc.listMc.scrollbar.rowHeight = lib.manager.UISkin.LISTLINE_HEIGHT;
var gListConY = container_mc.listMc.boxMc._y;
container_mc.listMc.boxMc.onScroll = function()
{
   this._y = gListConY - arguments[0];
};
container_mc.listMc.scrollbar.setWheel(container_mc.listMc.boxMc);
container_mc.listMc.scrollbar.addListener(container_mc.listMc.boxMc);
container_mc.questMc.scrollbar.pageSize = container_mc.questMc.boxMc._height;
container_mc.questMc.scrollbar.displaySize = container_mc.questMc.maskMc._height;
container_mc.questMc.scrollbar.rowHeight = lib.manager.UISkin.LISTLINE_HEIGHT;
var gQuestConY = container_mc.questMc.boxMc._y;
container_mc.questMc.boxMc.onScroll = function()
{
   this._y = gQuestConY - arguments[0];
};
container_mc.questMc.scrollbar.setWheel(container_mc.questMc.boxMc);
container_mc.questMc.scrollbar.addListener(container_mc.questMc.boxMc);
var sLevel = 0;
container_mc.skillMc.scrollbar2.pageSize = container_mc.skillMc.boxMc._height;
container_mc.skillMc.scrollbar2.displaySize = container_mc.skillMc.maskMc._height;
container_mc.skillMc.scrollbar2.rowHeight = lib.manager.UISkin.LISTLINE_HEIGHT;
var gSkillConY = container_mc.skillMc.boxMc._y;
container_mc.skillMc.boxMc.onScroll = function()
{
   this._y = gSkillConY - arguments[0];
};
container_mc.skillMc.scrollbar2.setWheel(container_mc.skillMc.boxMc);
container_mc.skillMc.scrollbar2.addListener(container_mc.skillMc.boxMc);
container_mc.listMc.btmMc.onlineCheck.onChanged = function(checked)
{
   ToGameRequestShowOnlineFriendOnly(Number(checked));
};
var GUILD_INFO_TXT_0 = lib.util.UIString.getUIString("$123204");
var GUILD_INFO_TXT_1 = lib.util.UIString.getUIString("$123205");
var GUILD_INFO_TXT_2 = lib.util.UIString.getUIString("$123206");
var GUILD_INFO_TXT_3 = lib.util.UIString.getUIString("$123213");
var GUILD_LIST_TXT_0 = lib.util.UIString.getUIString("$123228");
var GUILD_LIST_TXT_1 = lib.util.UIString.getUIString("$123229");
var GUILD_MISSION_TXT_0 = lib.util.UIString.getUIString("$123224");
var GUILD_MISSION_TXT_1 = lib.util.UIString.getUIString("$123225");
var GUILD_MISSION_TXT_2 = lib.util.UIString.getUIString("$123226");
var GUILD_MISSION_TXT_3 = lib.util.UIString.getUIString("$123227");
myListener.OnGameEventShowWindow = function(WindowName, bShow)
{
   if(WindowName.toLowerCase() == UIname.toLowerCase())
   {
      bWindowOpen = bShow;
      if(_global.gbUIMode && bWindowOpen)
      {
         UI._visible = true;
         UI.container_mc.lock_mc._x = 1007;
      }
      else
      {
         UI._visible = false;
      }
      if(UI._visible == true)
      {
         CustomScaleEvent = new CustomScaleEvent();
         CustomScaleEvent.CustomScaleEventCheck(UI,UIname);
      }
      else
      {
         CustomScaleEvent.CustomScaleEventRemoveCheck();
         lib.util.InteractionGroup.delInteraction(UIname);
      }
   }
};
myListener.OnGameEventChangeUIMode = function(bShow)
{
   if(_global.gbUIMode && bWindowOpen)
   {
      UI._visible = true;
      UI.container_mc.lock_mc._x = 709;
   }
   else
   {
      UI._visible = false;
   }
};
var x_btn = new lib.util.TxtBtn(container_mc.closeMc);
x_btn.setRelease(ToGame_GuildWindow_Close);
var crest_btn = new lib.util.TxtBtn(container_mc.boardMc.crestBtn);
crest_btn.setRelease(ToGame_GuildWindow_EditCrest);
var leave_btn = container_mc.boardMc.leaveBtn.txtBtn;
leave_btn.setRelease(ToGame_GuildWindow_GuildLeave);
var pr_btn = new lib.util.TxtBtn(container_mc.infoMc.prBtn.btn,container_mc.infoMc.prBtn.txt);
pr_btn.setRelease(ToGame_GuildWindow_PREdit);
lib.manager.ToolTip.add(container_mc.infoMc.prBtn,"$123211",1);
lib.manager.ToolTip.add(container_mc.boardMc.leaveBtn,"$123212",1);
var listBtn1 = container_mc.listMc.txtBtn1.txtBtn;
var listBtn2 = container_mc.listMc.txtBtn2.txtBtn;
var listBtn3 = container_mc.listMc.btmMc.txtBtn3.txtBtn;
listBtn1.setRelease(ToGame_GuildWindow_SetAuthorize);
listBtn2.setRelease(ToGame_GuildWindow_SubsidyPay);
listBtn3.setRelease(function()
{
   changeItroduceMode(!introduceShow);
}
);
myListener.OnGame_GuildWindow_UnEntered = function(type)
{
   container_mc.boardMc.gotoAndStop(Number(type) + 1);
   if(type == "1")
   {
      container_mc.boardMc.crestBtn._visible = false;
      container_mc.boardMc.leaveBtn._visible = false;
      var _loc4_ = new lib.util.TxtBtn(container_mc.boardMc.btn0,container_mc.boardMc.txt0);
      var _loc3_ = new lib.util.TxtBtn(container_mc.boardMc.btn1,container_mc.boardMc.txt1);
      container_mc.boardMc.sub0.setText(lib.util.UIString.getUIString("$123198"));
      container_mc.boardMc.sub1.setText(lib.util.UIString.getUIString("$123199"));
      lib.manager.ToolTip.add(container_mc.boardMc.txt0,"$123202",1);
      lib.manager.ToolTip.add(container_mc.boardMc.txt1,"$123203",1);
      _loc4_.setTextColor("0xd7d7d7","0xFFFFFF","0xd7d7d7","0x485460");
      _loc3_.setTextColor("0xd7d7d7","0xFFFFFF","0xd7d7d7","0x485460");
      _loc4_.setRelease(ToGame_GuildWindow_Search);
      _loc3_.setRelease(ToGame_GuildWindow_Create);
      ToGame_GuildWindow_ChangeTab(-2,1);
      container_mc.titleBg._visible = false;
      container_mc.tabBtn._alpha = 75;
      var _loc2_ = container_mc.boardMc.title0._width / 2 - 15;
      var _loc1_ = container_mc.boardMc.title1._width / 2 - 15;
      container_mc.boardMc.icon0_L._x = 296 - _loc2_;
      container_mc.boardMc.icon0_R._x = 296 + _loc2_;
      container_mc.boardMc.icon1_L._x = 760 - _loc1_;
      container_mc.boardMc.icon1_R._x = 760 + _loc1_;
   }
   else
   {
      tab.setTab(0,1);
      container_mc.boardMc.crestBtn._visible = true;
      container_mc.boardMc.leaveBtn._visible = true;
      container_mc.titleBg._visible = true;
      container_mc.tabBtn._alpha = 100;
   }
};
myListener.OnGame_GuildWindow_UnEntered(0);
myListener.OnGame_GuildWindow_SetTab = function(index)
{
   tab.setTab(index,1);
};
var StyleType = 0;
var styleType = ["$123140","$123141","$123142","$123143"];
var styleArr = ["$123144","$123145","$123146","$123147"];
var guildInviteArr = ["$123168","$123169","$123170"];
var comboArr = [];
var EditMc = container_mc.popMc;
EditMc._visible = false;
var editEnter = EditMc.txtBtn0.txtBtn;
editEnter.setRelease(ToGame_GuildWindow_PREditEnter);
var editClose = new lib.util.TxtBtn(EditMc.btn);
editClose.setRelease(ToGame_GuildWindow_PREditClose);
myListener.OnGame_GuildWindow_PREdit = function(bool, dataList, enableType)
{
   EditMc._visible = Boolean(Number(bool));
   if(!EditMc._visible)
   {
      return undefined;
   }
   var _loc1_ = lib.util.ExtString.split(dataList,"\t");
   CheckType(EditMc,_loc1_[0]);
   if(enableType == "1")
   {
      EditMc.gotoAndStop(1);
      setComboBox();
      EditMc.comboBox0.selectedIndex = Number(_loc1_[1]) - 1;
      EditMc.comboBox1.selectedIndex = Number(_loc1_[2]) - 1;
      EditMc.comboBox2.selectedIndex = Number(_loc1_[3]) - 1;
      EditMc.comboBox0._visible = EditMc.comboBox1._visible = EditMc.comboBox2._visible = EditMc.txtLenCheck._visible = true;
      editEnter.setEnabled(true);
   }
   else
   {
      EditMc.gotoAndStop(2);
      lib.manager.ToolTip.add(EditMc.checkHit0,styleArr[0],1);
      lib.manager.ToolTip.add(EditMc.checkHit1,styleArr[1],1);
      lib.manager.ToolTip.add(EditMc.checkHit2,styleArr[Number(StyleType + 2)],1);
      setComboBox();
      EditMc.txt1.text = _loc1_[1] + " ~ " + _loc1_[2];
      EditMc.txt2.text = guildInviteArr[Number(_loc1_[3]) - 1];
      EditMc.comboBox0._visible = EditMc.comboBox1._visible = EditMc.comboBox2._visible = EditMc.txtLenCheck._visible = false;
      editEnter.setEnabled(false);
      lib.manager.ToolTip.add(EditMc.txtBtn0,"$123219",1);
   }
   if(_loc1_[4] != undefined && _loc1_[4] != "")
   {
      EditMc.inputTxt.htmlText = _loc1_[4];
      var _loc2_ = EditMc.inputTxt.length;
      mc.txtLenCheck.text = _loc2_ + "/" + NameTextLength_Local1;
   }
   else
   {
      mc.txtLenCheck.text = "";
   }
};
myListener.OnGame_GuildWindow_SetStyleIcon = function(num)
{
   StyleType = num;
   EditMc.checkBox2.gotoAndStop(Number(StyleType * 2) + 1);
   lib.manager.ToolTip.add(EditMc.checkBox0,styleArr[0],1);
   lib.manager.ToolTip.add(EditMc.checkBox1,styleArr[1],1);
   lib.manager.ToolTip.add(EditMc.checkBox2,styleArr[Number(StyleType + 2)],1);
};
myListener.OnGame_GuildWindow_SetStyleIcon(0);
var comboListner = {};
comboListner.onChanged = function(mc, id, index)
{
   if(mc == EditMc.comboBox0)
   {
      if(EditMc.comboBox0.selectedIndex > EditMc.comboBox1.selectedIndex)
      {
         EditMc.comboBox1.selectedIndex = 64;
      }
   }
   else if(mc == EditMc.comboBox1)
   {
      if(EditMc.comboBox0.selectedIndex > EditMc.comboBox1.selectedIndex)
      {
         EditMc.comboBox0.selectedIndex = 0;
      }
   }
};
SetComboArr();
var GUILD_MARK_DEFAULT = "img://__Icon_IPolitics.Icon_guildcrest_default";
var guildSizeArr = ["$123207","$123208","$123209"];
var EXP_GAGE_SIZE = 756;
var EXP_GAGE_SIZE2 = 49;
var rename_btn = container_mc.infoMc.nameBtn.txtBtn;
rename_btn.setRelease(ToGame_GuildWindow_Rename);
rename_btn.setVisible(false);
myListener.OnGame_GuildWindow_SetEnableRenameBtn = function(flag)
{
   rename_btn.setVisible(Number(flag));
};
myListener.OnGame_GuildWindow_ScaleGuide = function(str)
{
   lib.manager.ToolTip.add(container_mc.boardMc.helpIcon,str,1);
};
myListener.OnGameEventSetGuildInfo = function(guildName, masterName, createDate, guildLevel, guildIcon, expData, goldParam, guildSize, guildFlag, trophyParam, onlineMember, totalMember)
{
   var _loc1_ = container_mc.boardMc;
   _loc1_.nameTxt.setText(guildName);
   _loc1_.masterTxt.setText(masterName);
   var _loc8_ = GUILD_INFO_TXT_0 + guildLevel;
   _loc1_.lvTxt.text = _loc8_;
   container_mc.infoMc.lvTxt.text = GUILD_INFO_TXT_0 + guildLevel;
   container_mc.infoMc.guildTxt.text = guildName;
   container_mc.infoMc.nameBtn._x = container_mc.infoMc.guildTxt.textWidth + 45;
   _loc1_.flagMc.gotoAndStop(Number(guildFlag) + 1);
   if(trophyParam == "0" || trophyParam == undefined || trophyParam == "")
   {
      lib.manager.ToolTip.remove(_loc1_.trophyMc);
      _loc1_.trophyMc._visible = false;
   }
   else
   {
      _loc1_.trophyMc._visible = true;
      lib.manager.ToolTip.add(_loc1_.trophyMc,trophyParam,1);
   }
   var _loc4_ = lib.util.ExtString.split(guildIcon,"\t");
   if(_loc4_[0] == "-1" || _loc4_[0] == GUILD_MARK_DEFAULT)
   {
      _loc1_.guildIconMc.clear();
      lib.manager.ToolTip.add(_loc1_.crestBtn,"$123263",1);
   }
   else
   {
      lib.display.DrawBitmapData.draw(_loc1_.guildIconMc,_loc4_[0],0,0,0,0,50,50,0.78125);
   }
   _loc1_.goldTxt.setText(goldParam);
   _loc1_.coinMc._x = 96 + _loc1_.goldTxt.textWidth / 2;
   expData = lib.util.ExtString.split(expData,"\t");
   var _loc3_ = Number(expData[0]) / Number(expData[1]);
   var _loc7_ = int(_loc3_ * 100) + "%";
   if(expData[1] == "0" || _loc3_ > 1)
   {
      _loc3_ = 1;
   }
   var _loc10_ = EXP_GAGE_SIZE * _loc3_;
   var _loc9_ = EXP_GAGE_SIZE2 * _loc3_;
   container_mc.infoMc.expMc._width = _loc10_;
   setGage(_loc1_.expMc,_loc9_);
   container_mc.infoMc.expTxt.htmlText = expData[0] + "/" + expData[1];
   container_mc.infoMc.expTxt2.htmlText = _loc7_;
   lib.manager.ToolTip.add(container_mc.boardMc.hit_mc,_loc7_,1);
   var _loc5_ = lib.util.ExtString.split(guildSize,"\t");
   _loc1_.sizeTxt.text = guildSizeArr[Number(_loc5_[0])];
   container_mc.boardMc.helpIcon._x = 98 + container_mc.boardMc.sizeTitle.textWidth / 2;
   lib.manager.ToolTip.add(container_mc.boardMc.helpIcon,GUILD_INFO_TXT_3,1);
   container_mc.boardMc.memberTxt.htmlText = _loc5_[1] + " / " + totalMember;
};
var tab3 = container_mc.infoMc.subTab.tab;
var infoSubTabNum = -1;
tab3.setRelease(release3);
tab3.setTab(0,1);
var bAmIGuildMaster = 0;
var bGuildTitleEdit = 0;
var bGuildCrestEdit = 0;
myListener.OnGameEventSetGuildMemberInfo = function(bMaster, bNoticeEdit, bTitleEdit, guildPR, guildCrest, guildReward, bShowOnline)
{
   bAmIGuildMaster = bMaster;
   bGuildTitleEdit = bTitleEdit;
   bGuildCrestEdit = guildCrest;
   var _loc1_ = Boolean(Number(bNoticeEdit));
   if(_loc1_)
   {
      notice_txt.textField.selectable = true;
      container_mc.infoMc.noticeBg._visible = true;
      container_mc.infoMc.txtLenCheck._visible = true;
   }
   else
   {
      notice_txt.textField.selectable = false;
      container_mc.infoMc.noticeBg._visible = false;
      container_mc.infoMc.txtLenCheck._visible = false;
   }
   crest_btn.setEnabled(Boolean(Number(bGuildCrestEdit)));
   container_mc.boardMc.plusMc._visible = Boolean(Number(bGuildCrestEdit));
   if(bGuildCrestEdit == "1")
   {
      lib.manager.ToolTip.add(pMc.crestBtn,"$123263",1);
   }
   else
   {
      lib.manager.ToolTip.remove(pMc.crestBtn);
   }
   pr_btn.setEnabled(Boolean(Number(guildPR)));
   listBtn1.setEnabled(Boolean(Number(bGuildTitleEdit)));
   listBtn2.setEnabled(Boolean(Number(guildReward)));
   if(bGuildTitleEdit == "0")
   {
      lib.manager.ToolTip.add(container_mc.listMc.txtBtn1,"$123264",1);
   }
   else
   {
      lib.manager.ToolTip.remove(container_mc.listMc.txtBtn1);
   }
   if(guildReward == "0")
   {
      lib.manager.ToolTip.add(container_mc.listMc.txtBtn2,"$123222",1);
   }
   else
   {
      lib.manager.ToolTip.remove(container_mc.listMc.txtBtn2);
   }
   container_mc.listMc.btmMc.onlineCheck.checked = Boolean(Number(bShowOnline));
   changeItroduceMode(introduceShow);
};
myListener.OnGame_GuildWindow_Notice = function(str)
{
   var _loc1_ = 0;
   if(str == undefined || str == "")
   {
      _loc1_ = 0;
   }
   else
   {
      container_mc.infoMc.noticeFd.htmlText = str;
      _loc1_ = container_mc.infoMc.noticeFd.length;
   }
   container_mc.infoMc.txtLenCheck.text = _loc1_ + "/" + NameTextLength_Local2;
};
myListener.OnGame_GuildWindow_SetGuildHistory = function(historyList, currentPage, totalPage)
{
   container_mc.infoMc.guildHistoryFd.htmlText = "";
   container_mc.infoMc.guildHistoryFd.styleSheet = historyStyle;
   container_mc.infoMc.scrollbar.scroll = 0;
   container_mc.infoMc.numberSteper.setPage(Number(currentPage),Number(totalPage));
   historyList = parsHtml(historyList);
   container_mc.infoMc.guildHistoryFd.htmlText = historyList;
   if(historyList == "" || historyList == undefined)
   {
      container_mc.infoMc.defaultStr._visible = true;
   }
   else
   {
      container_mc.infoMc.defaultStr._visible = false;
   }
};
myListener.OnGame_GuildWindow_SetMembers = function(total, online)
{
   container_mc.listMc.btmMc.membetTxt.htmlText = "(<font color=\'#80e71c\'>" + online + "</font>" + "/" + total + ")";
};
container_mc.listMc.btmMc.membetTxt._x = container_mc.listMc.btmMc.onlineCheck._x + container_mc.listMc.btmMc.onlineCheck._width;
container_mc.listMc.countMc._visible = false;
myListener.OnGame_GuildWindow_RequestCount = function(num)
{
   var _loc3_ = Number(num);
   var _loc1_ = container_mc.listMc.countMc;
   if(_loc3_ > 0)
   {
      _loc1_._visible = true;
      _loc1_.txt.htmlText = num;
      var _loc2_ = _loc1_.txt.textWidth + 12;
      if(_loc2_ < 17)
      {
         _loc2_ = 17;
      }
      _loc1_.txt._width = _loc2_;
      _loc1_.bg._width = _loc2_;
   }
   _loc1_._visible = false;
   return undefined;
};
var listLen = 0;
var listLen2 = 0;
var introduceShow = false;
myListener.OnGameEventSetGuildMemberList = function(dataList)
{
   var _loc11_ = container_mc.listMc;
   var _loc14_ = 0;
   listClear(_loc11_,listLen);
   listLen = 0;
   var _loc13_ = lib.util.ExtString.split(dataList,"\n");
   var _loc10_ = _loc13_.shift();
   if(_loc10_ != undefined && _loc10_ != "")
   {
      _loc11_.defaultStr._visible = false;
   }
   else
   {
      _loc11_.defaultStr._visible = true;
   }
   while(_loc10_ != undefined)
   {
      var _loc2_ = lib.util.ExtString.split(_loc10_,"\t");
      if(_loc2_ != undefined)
      {
         var lineMc = _loc11_.boxMc.attachMovie("line1","line" + listLen,_loc11_.boxMc.getNextHighestDepth());
         var _loc8_ = Number(_loc2_[12]);
         var _loc7_ = undefined;
         if(_loc2_[14] == null)
         {
            _loc7_ = 0;
         }
         else
         {
            _loc7_ = Number(_loc2_[14]);
         }
         lineMc.block_mc._visible = _loc8_;
         lineMc.mReward._visible = _loc7_ == 0;
         var _loc9_ = 112;
         if(_loc8_)
         {
            _loc9_ = _loc9_ + 17;
            lib.manager.ToolTip.add(lineMc.block_mc,lib.util.UIString.getUIString("$101085"),1);
         }
         if(_loc7_ == 0)
         {
            lineMc.mReward._x = _loc9_;
            lib.manager.ToolTip.add(lineMc.mReward,lib.util.UIString.getUIString("$101115"),1);
         }
         lineMc.group = Number(_loc2_[7]);
         lineMc.online = Number(_loc2_[6]);
         lineMc.itsme = Number(_loc2_[11]);
         lineMc.mymemo = _loc2_[10];
         if(lineMc.online != 2)
         {
            _loc14_ = _loc14_ + 1;
         }
         lineMc.index = listLen;
         lineMc.id = _loc2_[0];
         lineMc._x = 5;
         lineMc._y = 30 * listLen;
         lineMc.txt_7.verticalAlign = "center";
         lineMc.txt_0.setText(_loc2_[1]);
         lineMc.txt_1.setText(_loc2_[5]);
         lineMc.txt_2.setText(_loc2_[3]);
         lineMc.txt_3.setText(_loc2_[9]);
         var _loc12_ = 2 != lineMc.online?_loc2_[2]:_loc2_[13];
         lineMc.txt_4.setText(_loc12_);
         lineMc.txt_5.setText(_loc2_[8]);
         lineMc.txt_6.setText(_loc2_[10]);
         lib.util.InteractionGroup.addInteraction(UIname,_loc2_[1],lineMc);
         var _loc4_ = 0;
         while(_loc4_ < 6)
         {
            var _loc3_ = lineMc["txt_" + _loc4_];
            if(lineMc.group == 1)
            {
               if(lineMc.online == 2)
               {
                  _loc3_.textColor = lib.info.TextColor.LIST_GUILD_MEMBER_OFFLINE;
               }
               else
               {
                  _loc3_.textColor = lib.info.TextColor.LIST_GUILD_MEMBER_ONLINE;
               }
            }
            else if(lineMc.online == 2)
            {
               _loc3_.textColor = lib.info.TextColor.LIST_GUILD_MEMBER_OFFLINE;
            }
            else
            {
               _loc3_.textColor = lib.info.TextColor.LIST_GUILD_MEMBER_ONLINE;
            }
            if(lineMc.itsme == 1)
            {
               _loc3_.textColor = 8447772;
            }
            _loc4_ = _loc4_ + 1;
         }
         lineMc.introduceBg._visible = itsme == 1 && introduceShow;
         if(lineMc.itsme == 1)
         {
            lineMc.txt_6.type = "input";
            lineMc.txt_6.selectable = true;
            var _loc5_ = new lib.util.ExtTextField(lineMc.txt_6,0,lineMc.txt_6_focus);
            _loc5_.lineMc = lineMc;
            _loc5_.onChanged = function()
            {
               var _loc2_ = 0;
               if(NameTextLength_Local3 > 0)
               {
                  _loc2_ = NameTextLength_Local3;
               }
               else
               {
                  _loc2_ = 30;
               }
               lib.util.StrByteLen.getLenth3(this.lineMc.txt_6,_loc2_);
            };
            _loc5_.onSetFocusEvent = function()
            {
               this.textField.text = this.textField._parent.mymemo;
            };
            _loc5_.onKillFocusEvent = function()
            {
               this.textField._parent.mymemo = this.text;
               lib.util.ExtString.textCut(this.textField,this.textField._parent.mymemo,true);
               ToGame_GuildWindow_EditIntroduce(this.textField._parent.mymemo);
               if(this.lineMc.group == 1)
               {
                  if(this.lineMc.online == 2)
                  {
                     this.textField.textColor = lib.info.TextColor.LIST_GUILD_MEMBER_OFFLINE;
                  }
                  else
                  {
                     this.textField.textColor = lib.info.TextColor.LIST_GUILD_MEMBER_ONLINE;
                  }
               }
               else if(this.lineMc.online == 2)
               {
                  this.textField.textColor = lib.info.TextColor.LIST_GUILD_MEMBER_OFFLINE;
               }
               else
               {
                  this.textField.textColor = lib.info.TextColor.LIST_GUILD_MEMBER_ONLINE;
               }
            };
            _loc5_.onEnterKey = function()
            {
               Selection.setFocus(null);
            };
         }
         else
         {
            lineMc.txt_6_focus._visible = false;
            lineMc.txt_6.selectable = false;
            lineMc.txt_6.type = "dynamic";
         }
         lineMc.showComboBox_btn._visible = bAmIGuildMaster;
         if(!bAmIGuildMaster)
         {
            lineMc.txt_5._x = 5;
         }
         lineMc.hit_mc.onRollOver = function()
         {
            if(popMc == undefined)
            {
               this._parent.effect_mc.gotoAndStop("over");
            }
         };
         lineMc.hit_mc.onRollOut = lineMc.hit_mc.onReleaseOutside = function()
         {
            if(popMc == undefined)
            {
               this._parent.effect_mc.gotoAndStop("out");
            }
         };
         lineMc.showComboBox_btn.onRollOver = function()
         {
            this.gotoAndStop(2);
         };
         lineMc.showComboBox_btn.onRollOut = lineMc.showComboBox_btn.onReleaseOutside = function()
         {
            this.gotoAndStop(1);
         };
         lineMc.showComboBox_btn.onPress = function()
         {
            this.gotoAndStop(3);
         };
         lineMc.showComboBox_btn.onRelease = function()
         {
            this.gotoAndStop(1);
            ToGame_Community_ChangeGuildMemberGroup(this._parent.id);
         };
         lineMc.txt_3._visible = !introduceShow;
         lineMc.txt_4._visible = !introduceShow;
         lineMc.txt_6._visible = introduceShow;
         listLen++;
      }
      _loc10_ = _loc13_.shift();
   }
   _loc11_.scrollbar.pageSize = _loc11_.boxMc._height;
   _loc11_.scrollbar.scroll = 0;
};
myListener.OnGameEventSetGuildApplyList = function(dataList, currentPage, totalPage)
{
   var _loc4_ = container_mc.listMc;
   listClear(_loc4_,listLen2);
   listLen2 = 0;
   var _loc5_ = lib.util.ExtString.split(dataList,"\n");
   var _loc3_ = _loc5_.shift();
   if(_loc3_ != undefined && _loc3_ != "")
   {
      _loc4_.defaultStr._visible = false;
   }
   else
   {
      _loc4_.defaultStr._visible = true;
   }
   while(_loc3_ != undefined)
   {
      var _loc2_ = lib.util.ExtString.split(_loc3_,"\t");
      if(_loc2_ != undefined)
      {
         var _loc1_ = _loc4_.boxMc.attachMovie("line2","line" + listLen2,_loc4_.boxMc.getNextHighestDepth());
         _loc1_.index = listLen2;
         _loc1_.id = _loc2_[0];
         _loc1_._x = 5;
         _loc1_._y = 30 * listLen2;
         _loc1_.txt_0.setText(_loc2_[1]);
         _loc1_.txt_1.setText(_loc2_[4]);
         _loc1_.txt_2.setText(_loc2_[2]);
         _loc1_.txt_3.setText(_loc2_[6]);
         _loc1_.txt_4.setText(_loc2_[7]);
         SetApplyButton(_loc1_,_loc2_[8],_loc2_[9]);
         lib.util.InteractionGroup.addInteraction(UIname,_loc2_[1],_loc1_);
         listLen2++;
      }
      _loc3_ = _loc5_.shift();
   }
   _loc4_.tipMc.numberSteper.setPage(Number(currentPage),Number(totalPage));
   _loc4_.scrollbar.pageSize = _loc4_.boxMc._height;
   _loc4_.scrollbar.scroll = 0;
};
var missionArr = [];
container_mc.questMc.comboBox.data = ["$123221","$123209","$123208","$123207"];
var comboIdx = [-1,2,1,0];
var guildStateListner = {};
guildStateListner.onChanged = function()
{
   var _loc2_ = comboIdx[arguments[2]];
   ToGame_GuildWindow_MissionScale(_loc2_);
};
container_mc.questMc.comboBox.addListener(guildStateListner);
lib.manager.ToolTip.add(container_mc.questMc.helpIcon,"$123223",1);
myListener.OnGame_GuildWindow_MissionCount = function(current, total)
{
   container_mc.questMc.countTxt.htmlText = GUILD_MISSION_TXT_0 + " <font color=\'#80e71c\'>" + current + "</font>/" + total;
   container_mc.questMc.helpIcon._x = container_mc.questMc.guildTxt.textWidth + 50;
   container_mc.questMc.countTxt._x = container_mc.questMc.helpIcon._x + 25;
};
myListener.OnGame_GuildWindow_MissionFilter = function(checkData)
{
   var _loc1_ = lib.util.ExtString.split(checkData,"\t");
   container_mc.questMc.check0.checked = Boolean(Number(_loc1_[0]));
   container_mc.questMc.check1.checked = Boolean(Number(_loc1_[1]));
   container_mc.questMc.check2.checked = Boolean(Number(_loc1_[2]));
   container_mc.questMc.check3.checked = Boolean(Number(_loc1_[3]));
};
container_mc.questMc.check0.onChanged = function(checked)
{
   ToGame_GuildWindow_MissionFilter(1,Number(checked));
};
container_mc.questMc.check1.onChanged = function(checked)
{
   ToGame_GuildWindow_MissionFilter(2,Number(checked));
};
container_mc.questMc.check2.onChanged = function(checked)
{
   ToGame_GuildWindow_MissionFilter(3,Number(checked));
};
container_mc.questMc.check3.onChanged = function(checked)
{
   ToGame_GuildWindow_MissionFilter(0,Number(checked));
};
myListener.OnGame_GuildWindow_MissionScale = function(idx)
{
   var _loc2_ = int(idx) + 1;
   idx = comboIdx[_loc2_] + 1;
   container_mc.questMc.comboBox.setSelectedIndex(idx);
};
var scaleArr = ["$123207","$123208","$123209","$123210"];
var missionTypeArr = ["$123241","$123236","$123237","$123238","$123242"];
myListener.OnGame_GuildWindow_SetMission = function(DataList, RewardList, ProgressList, time, button)
{
   var _loc2_ = lib.util.ExtString.split(DataList,"\t");
   var _loc5_ = _loc2_[0];
   var lineMc = container_mc.questMc.boxMc["line" + _loc5_];
   if(!lineMc)
   {
      lineMc = container_mc.questMc.boxMc.attachMovie("line5","line" + _loc5_,container_mc.questMc.boxMc.getNextHighestDepth());
      missionArr.push(lineMc);
   }
   var _loc3_ = _loc2_[8];
   if(_loc3_ == 1 || _loc3_ == 2)
   {
      lineMc.detailMc._visible = true;
      lineMc.txt4._y = 36;
      lineMc.txt5._y = 36;
      lineMc.txt3._y = 60;
      lineMc.btnMc._y = 81;
      lineMc.txt2._y = 130;
      lineMc.txt2_1._y = 130;
      lineMc.goldMc._y = 124;
      lineMc.expMc._y = 124;
      if(_loc3_ == 2)
      {
         lineMc.alimBtn._visible = false;
         lineMc.btnMc.effectMc.gotoAndPlay(2);
      }
      else
      {
         lineMc.alimBtn._visible = true;
         lineMc.btnMc.effectMc.gotoAndStop(1);
      }
   }
   else
   {
      lineMc.detailMc._visible = false;
      lineMc.alimBtn._visible = false;
      lineMc.txt4._y = 16;
      lineMc.txt5._y = 16;
      lineMc.txt3._y = 36;
      lineMc.btnMc._y = 61;
      lineMc.txt2._y = 72;
      lineMc.txt2_1._y = 72;
      lineMc.goldMc._y = 66;
      lineMc.expMc._y = 66;
      lineMc.btnMc.effectMc.gotoAndStop(1);
   }
   var _loc6_ = lib.util.ExtString.split(RewardList,"\t");
   lineMc.txt2.htmlText = "<font color=\'#ddb377\'>" + GUILD_MISSION_TXT_2 + "</font> " + _loc6_[0];
   lineMc.txt2_1.htmlText = _loc6_[1];
   lineMc.expMc._x = lineMc.txt2.textWidth + 20;
   lineMc.txt2_1._x = lineMc.expMc._x + 40;
   lineMc.goldMc._x = lineMc.txt2_1._x + lineMc.txt2_1.textWidth + 7;
   lineMc.id = _loc5_;
   var _loc8_ = missionTypeArr[Number(_loc2_[4])];
   if(_loc2_[1] == "1")
   {
      lineMc.typeMc.gotoAndStop(5);
      lineMc.typeMc.txt.htmlText = "[" + lib.util.UIString.getUIString("$123242") + "]";
      lineMc.txt0._x = lineMc.typeMc.txt.textWidth + 50;
      lib.manager.ToolTip.add(lineMc.typeMc.occMc,"$123227",1);
   }
   else if(_loc2_[1] == "2")
   {
      lineMc.typeMc.gotoAndStop(6);
      lineMc.typeMc.txt.htmlText = "[" + lib.util.UIString.getUIString("$123294") + "]";
      lineMc.txt0._x = lineMc.typeMc.txt.textWidth + 25;
   }
   else
   {
      lineMc.typeMc.gotoAndStop(Number(_loc2_[4]));
      lineMc.typeMc.txt.htmlText = "[" + lib.util.UIString.getUIString(_loc8_) + "]";
      lineMc.txt0._x = lineMc.typeMc.txt.textWidth + 25;
   }
   lineMc.txt1.setText(_loc2_[6]);
   var _loc7_ = lib.util.UIString.getUIString(scaleArr[Number(_loc2_[2])]);
   if(_loc2_[3] == "0")
   {
      lineMc.detailMc._visible = false;
      lineMc.alimBtn._visible = false;
      lineMc.txt4._y = 16;
      lineMc.txt5._y = 16;
      lineMc.txt3._y = 32;
      lineMc.btnMc._y = 61;
      lineMc.txt2._y = 72;
      lineMc.txt2_1._y = 72;
      lineMc.goldMc._y = 66;
      lineMc.expMc._y = 66;
      lineMc.bg.gotoAndStop(5);
      lineMc.typeMc.txt.textColor = "0x666666";
      lineMc.txt0.htmlText = "<font color=\'#c5c5c5\'>" + _loc2_[5] + "</font><font color=\'#ff0809\'> (" + _loc7_ + " " + GUILD_MISSION_TXT_1 + ")</font>";
      lineMc.txt1.textColor = "0xc5c5c5";
      lineMc.txt2.textColor = "0xc5c5c5";
      lineMc.txt3.textColor = "0xc5c5c5";
   }
   else
   {
      lineMc.bg.gotoAndStop(Number(_loc3_) + 1);
      lineMc.txt0.htmlText = _loc2_[5] + " (" + _loc7_ + " " + GUILD_MISSION_TXT_1 + ")";
   }
   lineMc.alimBtn.gotoAndStop(Number(_loc2_[7]) + 1);
   lineMc.alimBtn.hit.onRollOver = function()
   {
      this._parent.mc.gotoAndStop(2);
   };
   lineMc.alimBtn.hit.onRollOut = lineMc.alimBtn.hit.onReleaseOutside = function()
   {
      this._parent.mc.gotoAndStop(1);
   };
   lineMc.alimBtn.hit.onPress = function()
   {
      this._parent.mc.gotoAndStop(3);
      lib.manager.UISound.play(lib.manager.UISound.MAIN_BTN);
   };
   lineMc.alimBtn.hit.onRelease = function()
   {
      this._parent.mc.gotoAndStop(2);
      if(this._parent._currentframe == 1)
      {
         this._parent.gotoAndStop(2);
      }
      else
      {
         this._parent.gotoAndStop(1);
      }
      ToGame_GuildWindow_MissionTaskInfo(this._parent._parent.id,this._parent._currentframe - 1);
      if(this._parent._currentframe == 1)
      {
         lib.manager.ToolTip.add(this,lib.util.UIString.getUIString("$091031"),1);
      }
      else
      {
         lib.manager.ToolTip.add(this,lib.util.UIString.getUIString("$091032"),1);
      }
   };
   lib.manager.ToolTip.add(lineMc.alimBtn,lib.util.UIString.getUIString("$091031"),1);
   var _loc4_ = new lib.util.TxtBtn(lineMc.btnMc.btn,lineMc.btnMc.txt);
   _loc4_.setRelease(function()
   {
      ToGame_GuildWindow_MissionClick(lineMc.id);
   }
   );
   _loc4_.setTextColor("0xd7d7d7","0xFFFFFF","0xd7d7d7","0xd7d7d7");
   lineMc.btn = _loc4_;
   SetMissionUpDate(lineMc,ProgressList,time,button);
   SetPosition();
};
myListener.OnGame_GuildWindow_UpDateMission = function(id, ProgressList)
{
   var _loc3_ = container_mc.questMc.boxMc["line" + id];
   if(!_loc3_)
   {
      return undefined;
   }
   var _loc4_ = lib.util.ExtString.split(ProgressList,"\n");
   var _loc1_ = 0;
   var _loc5_ = _loc4_.length;
   _loc1_ = 0;
   while(_loc1_ < _loc5_)
   {
      var _loc2_ = lib.util.ExtString.split(_loc4_[_loc1_],"\t");
      _loc3_.detailMc["txt" + _loc1_].text = _loc2_[0] + "(" + _loc2_[1] + " / " + _loc2_[2] + ")";
      _loc1_ = _loc1_ + 1;
   }
};
myListener.OnGame_GuildWindow_UpDateTime = function(id, time)
{
   var _loc1_ = container_mc.questMc.boxMc["line" + id];
   if(!_loc1_)
   {
      return undefined;
   }
   _loc1_.txt3.text = time;
   _loc1_.txt3.textAutoSize = "shrink";
};
myListener.OnGame_GuildWindow_UpDateButton = function(id, button)
{
   var _loc2_ = container_mc.questMc.boxMc["line" + id];
   if(!_loc2_)
   {
      return undefined;
   }
   var _loc1_ = lib.util.ExtString.split(button,"\t");
   var _loc3_ = _loc2_.btn;
   _loc3_.setText(_loc1_[0]);
   _loc3_.setEnabled(Boolean(Number(_loc1_[1])));
   if(_loc1_[2] != "" && _loc1_[2] != undefined)
   {
      lib.manager.ToolTip.add(_loc2_.btnMc,_loc1_[2],1);
   }
   else
   {
      lib.manager.ToolTip.remove(_loc2_.btnMc);
   }
};
myListener.OnGame_GuildWindow_UpDateToggle = function(id, flag)
{
   var _loc1_ = container_mc.questMc.boxMc["line" + id];
   if(!_loc1_)
   {
      return undefined;
   }
   _loc1_.alimBtn.gotoAndStop(Number(flag) + 1);
};
myListener.OnGame_GuildWindow_SwapMission = function(id, idx)
{
   var _loc1_ = container_mc.questMc.boxMc["line" + id];
   if(!_loc1_)
   {
      return undefined;
   }
   var _loc2_ = CheckIndex(_loc1_);
   missionArr.splice(_loc2_,1);
   missionArr.splice(idx,0,_loc1_);
   SetPosition();
};
myListener.OnGame_GuildWindow_ClearMission = function(id)
{
   var _loc1_ = container_mc.questMc.boxMc["line" + id];
   if(!_loc1_)
   {
      return undefined;
   }
   var _loc2_ = CheckIndex(_loc1_);
   missionArr.splice(_loc2_,1);
   _loc1_.removeMovieClip();
   SetPosition();
};
myListener.OnGame_GuildWindow_AllClearMission = function()
{
   var _loc1_ = container_mc.questMc.boxMc;
   for(var _loc2_ in _loc1_)
   {
      _loc1_[_loc2_].removeMovieClip();
   }
   missionArr = [];
   container_mc.questMc.scrollbar.scroll = 0;
   container_mc.questMc.scrollbar.pageSize = 0;
};
var SLOT_PRE_FIX = "GuildWindow__";
var skillEdit = 0;
var skillBtn0 = new lib.util.TxtBtn(container_mc.skillMc.btn0.btn,container_mc.skillMc.btn0.txt);
skillBtn0.setText("$123104");
skillBtn0.setRelease(ToGame_GuildWindow_SkillApply);
var skillBtn1 = new lib.util.TxtBtn(container_mc.skillMc.btn1.btn,container_mc.skillMc.btn1.txt);
skillBtn1.setText("$123269");
skillBtn1.setRelease(ToGame_GuildWindow_SkillCancel);
lib.manager.ToolTip.add(container_mc.skillMc.helpIcon,"$123265",1);
container_mc.skillMc.helpIcon._x = 760 - container_mc.skillMc.helpIcon.txt.textWidth;
myListener.OnGame_GuildWindow_SetGuildSkill = function(level, point, type)
{
   var _loc1_ = container_mc.skillMc;
   sLevel = Number(level);
   _loc1_.countTxt.text = point;
   skillEdit = Number(type);
   levelCheck(_loc1_.boxMc.bg0,0);
   levelCheck(_loc1_.boxMc.bg1,14);
   levelCheck(_loc1_.boxMc.bg2,29);
   levelCheck(_loc1_.boxMc.bg3,44);
   levelCheck(_loc1_.boxMc.bg4,59);
   levelCheck(_loc1_.boxMc.bg5,74);
   container_mc.skillMc.boxMc._visible = true;
};
var pressedSkillSlot = null;
myListener.OnGame_MouseDown = function(button, target)
{
   if(button == 2 && target._name == "slotHit")
   {
      if(!target._parent.disable)
      {
         if(target._parent.typeMc._visible)
         {
            ToGame_GuildWindow_SkillUse(target._parent.id);
         }
      }
   }
};
myListener.OnGame_GuildWindow_ChangeSkill = function(dataList)
{
   var _loc6_ = container_mc.skillMc;
   var _loc4_ = lib.util.ExtString.split(dataList,"\t");
   var _loc5_ = _loc4_.length;
   var _loc2_ = "";
   var _loc3_ = undefined;
   var _loc1_ = 0;
   while(_loc1_ < _loc5_)
   {
      _loc2_ = _loc4_[_loc1_];
      _loc3_ = _loc6_.boxMc[SLOT_PRE_FIX + _loc2_];
      _loc3_.effectMc.gotoAndPlay(2);
      _loc1_ = _loc1_ + 1;
   }
};
myListener.OnGame_GuildWindow_UpDateSkill = function(idx, dataList)
{
   var _loc5_ = container_mc.skillMc;
   var slotMc = _loc5_.boxMc[SLOT_PRE_FIX + idx];
   var _loc1_ = lib.util.ExtString.split(dataList,"\t");
   slotMc.id = _loc1_[0];
   clearSkill(slotMc,idx);
   var _loc2_ = createSlot(slotMc,_loc1_[0],_loc1_[1]);
   _loc2_.slotIndex = idx;
   _loc2_.skillId = _loc1_[0];
   _loc2_.TEX = _loc1_[1];
   _loc2_.slotHit.slotName = "GUILDSLOT";
   _loc2_.slotHit.trackAsMenu = true;
   var _loc8_ = "";
   if(_loc1_[2] == "0")
   {
      slotMc.disableMc._visible = true;
      slotMc.gotoAndStop(1);
      slotMc.txt.htmlText = _loc1_[2] + "/" + _loc1_[3];
   }
   else if(_loc1_[2] == _loc1_[3])
   {
      _loc2_.disable = false;
      slotMc.disableMc._visible = false;
      slotMc.gotoAndStop(3);
      _loc2_.overMc.gotoAndStop(2);
      if(_loc1_[6] == "0")
      {
         slotMc.txt.htmlText = "<font color=\'#ffcc00\'>" + _loc1_[2] + "/" + _loc1_[3] + "</font>";
      }
      else
      {
         slotMc.txt.htmlText = "<font color=\'#80e71c\'>" + _loc1_[2] + "</font>/" + _loc1_[3];
      }
   }
   else
   {
      _loc2_.disable = false;
      slotMc.gotoAndStop(2);
      slotMc.disableMc._visible = false;
      if(_loc1_[6] == "0")
      {
         slotMc.txt.htmlText = _loc1_[2] + "/" + _loc1_[3];
      }
      else
      {
         slotMc.txt.htmlText = "<font color=\'#80e71c\'>" + _loc1_[2] + "</font>/" + _loc1_[3];
      }
   }
   var _loc4_ = _loc5_.boxMc["line" + idx];
   if(_loc4_)
   {
      _loc4_.gotoAndStop(Number(_loc1_[4]) + 1);
   }
   if(!slotMc.init)
   {
      slotMc.pBtn._visible = false;
      slotMc.mBtn._visible = false;
      var _loc7_ = new lib.util.TxtBtn(slotMc.pBtn);
      _loc7_.setRelease(function()
      {
         ToGame_GuildWindow_SkillClick(slotMc.id,1);
      }
      );
      var _loc6_ = new lib.util.TxtBtn(slotMc.mBtn);
      _loc6_.setRelease(function()
      {
         ToGame_GuildWindow_SkillClick(slotMc.id,0);
      }
      );
      slotMc.pb = _loc7_;
      slotMc.mb = _loc6_;
   }
   slotMc.init = true;
   slotMc.btn._visible = Boolean(Number(skillEdit));
   slotMc.pb.setEnabled(Boolean(Number(_loc1_[5])));
   slotMc.mb.setEnabled(Boolean(Number(_loc1_[6])));
   if(_loc1_[7] == "1")
   {
      slotMc.typeMc._visible = true;
   }
   else
   {
      slotMc.typeMc._visible = false;
   }
   if(_loc1_[8] == "1")
   {
      slotMc.effectMc.gotoAndPlay(2);
   }
};
var skillPocus = null;
myListener.OnGame_GuildWindow_SkillButton = function(btn0, btn1)
{
   skillBtn0.setEnabled(Boolean(Number(btn0)));
   skillBtn1.setEnabled(Boolean(Number(btn1)));
   if(btn0 == "0")
   {
      lib.manager.ToolTip.add(container_mc.skillMc.btn0,"$123266",1);
   }
   else
   {
      lib.manager.ToolTip.add(container_mc.skillMc.btn0,"$123267",1);
   }
};
var coolTimeManager = lib.util.CoolTimeManger.getInstance();
myListener.OnGame_GuildWindow_CoolTime = function(slotIndex, remain, total)
{
   slotIndex = Number(slotIndex);
   remain = Number(remain);
   total = Number(total);
   var _loc8_ = container_mc.skillMc;
   var _loc2_ = _loc8_.boxMc[SLOT_PRE_FIX + slotIndex];
   var _loc7_ = _loc2_.slotHit._x;
   var _loc6_ = _loc2_.slotHit._y;
   var _loc1_ = _loc2_.coolTimeMc;
   if(remain <= 0 || total <= 0)
   {
      if(_loc1_.coolTime != undefined)
      {
         coolTimeManager.removeCoolTimeInstance(_loc1_);
         _loc1_.removeMovieClip();
      }
   }
   else
   {
      if(_loc1_ == undefined)
      {
         _loc1_ = _loc2_.attachMovie("slotCoolTimeMc","coolTimeMc",_loc2_.getNextHighestDepth());
         _loc1_.iconName = iconName;
         _loc1_._xscale = _loc1_._yscale = 80;
         _loc1_._x = _loc7_ + 3;
         _loc1_._y = _loc6_ + 3;
         _loc1_.hitTestDisable = true;
      }
      _loc1_.setCoolTime(remain,total);
      coolTimeManager.addCoolTimeInstance(_loc1_);
   }
};
var guildWarMc = container_mc.warMc;
guildWarMc.helpIcon._x = guildWarMc.titleFd._x + guildWarMc.titleFd.textWidth + 15;
guildWarMc.helpFd._x = guildWarMc.helpIcon._x + 20;
var startWarBtn = guildWarMc.startWarBtn.txtBtn;
startWarBtn.setRelease(ToGame_GuildWindow_StartGuildWar);
var showHistoryBtn = guildWarMc.showHistoryBtn.txtBtn;
showHistoryBtn.setRelease(ToGame_GuildWindow_ShowGuildWarHistory);
var guildWarScrollDisplaySize = guildWarMc.maskMc._height;
var guildWarMcPosY = guildWarMc.boxMc._y;
var guildWarScroll = guildWarMc.scrollbar;
guildWarScroll.addListener(guildWarMc.boxMc);
guildWarMc.boxMc.onScroll = function()
{
   guildWarMc.boxMc._y = guildWarMcPosY - arguments[0];
};
guildWarScroll.setWheel(guildWarMc.boxMc);
guildWarScroll.wheelDelta = 1;
guildWarScroll.pageSize = 0;
guildWarScroll.displaySize = guildWarScrollDisplaySize;
guildWarScroll.defaultBarSizeRatio = 0.3333333333333333;
guildWarScroll.rowHeight = 30;
guildWarScroll.scroll = 0;
var GUILD_WAR_LIST_BUTTON_TYPE_WITHDRAW = 0;
var GUILD_WAR_LIST_BUTTON_TYPE_COUNTER = 1;
var GUILD_WAR_LIST_BUTTON_TYPE_SURRENDER = 2;
var GUILD_WAR_LIST_BUTTON_LABEL_WITHDRAW = lib.util.UIString.getUIString("$123280");
var GUILD_WAR_LIST_BUTTON_LABEL_COUNTER = lib.util.UIString.getUIString("$123281");
var GUILD_WAR_LIST_BUTTON_LABEL_SURRENDER = lib.util.UIString.getUIString("$123282");
var GUILD_WAR_TYPE_DECLARED = 2;
var guildWarListTitleTextColor = [13100534,16771800,15263976];
var guildWarListButtonTextColor = [16777215,9023180,13756409,1411990,7368816];
var GUILD_WAR_LIST_BUTTON_TYPE_NORMAL = 1;
var GUILD_WAR_LIST_BUTTON_TYPE_OVER = 2;
var GUILD_WAR_LIST_BUTTON_TYPE_PRESS = 3;
var GUILD_WAR_LIST_BUTTON_TYPE_DISABLE = 4;
var guildWarToolTipStr0 = lib.util.UIString.getUIString("$123288");
var guildWarToolTipStr1 = lib.util.UIString.getUIString("$123289");
var guildWarToolTipStr2 = lib.util.UIString.getUIString("$123291");
var KILL = lib.util.UIString.getUIString("$123290");
lib.manager.ToolTip.add(guildWarMc.helpIcon,guildWarToolTipStr2,1);
myListener.OnGame_GuildWindow_SetDisableGuildWar = function()
{
   tab.setVisible(4,0);
};
var listLen = 0;
myListener.OnGame_GuildWindow_SetGuildWarList = function(warData)
{
   var _loc5_ = lib.util.ExtString.split(warData,"\n");
   var _loc4_ = _loc5_.length;
   var _loc1_ = _loc4_;
   while(_loc1_ < listLen)
   {
      var _loc2_ = guildWarMc.boxMc["list_" + _loc1_];
      _loc2_._visible = false;
      _loc1_ = _loc1_ + 1;
   }
   listLen = Math.max(_loc4_,listLen);
   var _loc6_ = _loc4_ - 1;
   _loc1_ = 0;
   while(_loc1_ < _loc4_)
   {
      var _loc3_ = lib.util.ExtString.split(_loc5_[_loc1_],"\t");
      setWarList(_loc3_);
      _loc1_ = _loc1_ + 1;
   }
   guildWarScroll.scroll = 0;
   guildWarScroll.pageSize = 5 + 177 * _loc6_ + 172;
   guildWarMc.boxMc.hitMc._height = 5 + 177 * _loc6_ + 172;
};
myListener.OnGame_GuildWindow_UpdateGuildWarList = function(warData)
{
   var _loc5_ = lib.util.ExtString.split(warData,"\n");
   var _loc6_ = _loc5_.length;
   var _loc1_ = 0;
   while(_loc1_ < _loc6_)
   {
      var _loc2_ = lib.util.ExtString.split(_loc5_[_loc1_],"\t");
      var _loc4_ = Number(_loc2_[0]);
      var _loc3_ = guildWarMc.boxMc["list_" + _loc4_];
      if(undefined != _loc3_)
      {
         setWarList(_loc2_);
      }
      _loc1_ = _loc1_ + 1;
   }
};
var attackStr = lib.util.UIString.getUIString("$123283");
var defenceStr = lib.util.UIString.getUIString("$123284");
myListener.OnGame_GuildWindow_GuildWarCount = function(attackCount, attackTotalCount, defenceCount, defenceTotalCount)
{
   var _loc2_ = attackStr + " <font color=\'#6ee2ff\'>" + attackCount + "</font>/" + attackTotalCount;
   var _loc1_ = defenceStr + " <font color=\'#f9d891\'>" + defenceCount;
   guildWarMc.attackTF.htmlText = _loc2_;
   var _loc4_ = guildWarMc.attackTF.textWidth;
   guildWarMc.attackTF._width = _loc4_ + 5;
   guildWarMc.defenceTF.htmlText = _loc1_;
   var _loc3_ = guildWarMc.defenceTF.textWidth;
   guildWarMc.defenceTF._width = _loc3_ + 5;
   guildWarMc.defenceBg._x = guildWarMc.attackTF._x + guildWarMc.attackTF._width + 20;
   guildWarMc.defenceMc._x = guildWarMc.defenceBg._x + 4;
   guildWarMc.defenceTF._x = guildWarMc.defenceBg._x + 35;
};
var surrenderTooltipDisableState = lib.util.UIString.getUIString("$123292");
var surrenderTooltipNormalState = lib.util.UIString.getUIString("$123293");
myListener.OnGame_GuildWindow_SoundTest = function(id)
{
   ToGame_PlaySound(id);
};
var tab = container_mc.tabBtn.tab;
var tabNum = -1;
tab.setRelease(release);
changeItroduceMode(false);
var tab2 = container_mc.listMc.tabBtn.tab;
var subTabNum = -1;
tab2.setRelease(release2);
tab2.setTab(0,1);
container_mc.listMc.tipMc._visible = false;
container_mc.listMc.sortBtn.onSelected = function(index)
{
   ToGameRequestGuildMemberList(subTabNum,index);
};
questCheckAlign();
ToGame_GuildWindow_Init();
