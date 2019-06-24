var UI = this;
UI._visible = false;
var UIname = "PaperDoll";
var UIname2 = "PaperDoll2";
this.bWindowOpen = false;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
container_mc.title_txt.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
container_mc.title_txt.textAutoSize = "shrink";
container_mc.notice_mc.txt.textColor = lib.info.TextColor.GENERAL_NOTICE;
container_mc.notice_mc.txt.textAutoSize = "shrink";
container_mc.notice_mc.txt.htmlText = "<img src=\'icon_notice\' vspace=\'-1\'> " + lib.util.UIString.getUIString("$221070");
var enchantBtn1 = new lib.util.TxtBtn(container_mc.enchantBtn__1);
container_mc.enchantBtn__1._visible = false;
container_mc.enchantBtn__1.id = 1;
container_mc.enchantBtn__1.bVisible = false;
setEnchantBtnMouseEvent(container_mc.enchantBtn__1);
var enchantBtn3 = new lib.util.TxtBtn(container_mc.enchantBtn__3);
container_mc.enchantBtn__3._visible = false;
container_mc.enchantBtn__3.id = 3;
container_mc.enchantBtn__3.bVisible = false;
setEnchantBtnMouseEvent(container_mc.enchantBtn__3);
var enchantBtn4 = new lib.util.TxtBtn(container_mc.enchantBtn__4);
container_mc.enchantBtn__4._visible = false;
container_mc.enchantBtn__4.id = 4;
container_mc.enchantBtn__4.bVisible = false;
setEnchantBtnMouseEvent(container_mc.enchantBtn__4);
var enchantBtn5 = new lib.util.TxtBtn(container_mc.enchantBtn__5);
container_mc.enchantBtn__5._visible = false;
container_mc.enchantBtn__5.id = 5;
container_mc.enchantBtn__5.bVisible = false;
setEnchantBtnMouseEvent(container_mc.enchantBtn__5);
var titleText = "";
container_mc.comboBox._visible = false;
container_mc.comboBox.useBaseTextColor = false;
var NUM_LAST_PARTS_SLOT = 19;
var MAX_ITEMSLOTCOUNT = 15;
var MAX_ITEMSLOTCOUNT2 = 7;
var STARTINDEX_CRISTALSLOT = 21;
var MAX_CRISTALSLOTCOUNT = 8;
var RACESTR = container_mc.race_txt.text;
var CLASSSTR = container_mc.class_txt.text;
var SEXSTR = container_mc.sex_txt.text;
var EPSTR = container_mc.ep_txt.text;
var EXPSTR = container_mc.text_exp.text;
var expTextFieldStartX = container_mc.text_exp._x + container_mc.text_exp._width;
lib.manager.ToolTip.add(container_mc.ep_txt,"$221030",1);
lib.manager.ToolTip.add(container_mc.balloonMc,"$221033",1);
var SPEED = 0.3;
var con = this;
var dataName = "PaperDoll__";
var enableItemSet = true;
var selectedItemSet;
var name;
var nick;
var level;
var race;
var sex;
var userClass;
var userClassIndex;
var txt_array = new Array("name_txt","race_txt","atk_txt","def_txt","profMineral_txt","profBug_txt","profHub_txt","profEnergy_txt","critical_txt","criticalRes_txt","criticalPower_txt","speed_txt","abnormalA_txt","abnormalARes_txt","abnormalB_txt","abnormalBRes_txt","abnormalC_txt","abnormalCRes_txt","abnormalD_txt","abnormalDRes_txt","reaction_txt","reactionRes_txt","weaponAtk_txt","armorDef_txt");
var bookMarkMcX = container_mc.bookmarkBtn._x;
var paperX = container_mc.paperdollMc0._x;
var attackAbil = [0,0,0];
var defenceAbil = [0,0,0];
var indunCount = 0;
var itemToolTipString = [lib.info.ToolTipStr.ITEM_WEAPON,lib.info.ToolTipStr.ITEM_HEAD,lib.info.ToolTipStr.ITEM_BODY,lib.info.ToolTipStr.ITEM_ARM,lib.info.ToolTipStr.ITEM_LEG,lib.info.ToolTipStr.ITEM_EAR,lib.info.ToolTipStr.ITEM_EAR,lib.info.ToolTipStr.ITEM_RING,lib.info.ToolTipStr.ITEM_RING,lib.info.ToolTipStr.ITEM_NECKLACE,lib.info.ToolTipStr.ITEM_UNDERWEAR,lib.info.ToolTipStr.ITEM_HAIR,lib.info.ToolTipStr.ITEM_FACE,"$102272","$102271"];
var cristalToolTipString = [lib.info.ToolTipStr.ITEM_WEAPONCUSTOM,lib.info.ToolTipStr.ITEM_WEAPONCUSTOM,lib.info.ToolTipStr.ITEM_WEAPONCUSTOM,lib.info.ToolTipStr.ITEM_WEAPONCUSTOM,lib.info.ToolTipStr.ITEM_BODYCUSTOM,lib.info.ToolTipStr.ITEM_BODYCUSTOM,lib.info.ToolTipStr.ITEM_BODYCUSTOM,lib.info.ToolTipStr.ITEM_BODYCUSTOM,lib.info.ToolTipStr.ITEM_EARCUSTOM,lib.info.ToolTipStr.ITEM_RINGCUSTOM];
var itemStyleToolTipString = [lib.info.ToolTipStr.ITEM_STYLEWEAPONCUSTOM,lib.info.ToolTipStr.ITEM_STYLEBODYCUSTOM,"","",lib.info.ToolTipStr.ITEM_STYLEHAIRCUSTOM,lib.info.ToolTipStr.ITEM_STYLEFACECUSTOM,"$221144","$221171"];
var isTheOther;
var greetingDefault = lib.util.UIString.getUIString("$221033");
var greetMessage = "";
container_mc.setItemMc._visible = false;
container_mc.pvp_mc._visible = false;
var pvp_sex = "";
var indunBgTh = container_mc.indunmaskMc._height;
var PartyRaid_indunResetBtn = false;
var tab_currentPage;
var reputation_tab;
var tab_list_categoty_0 = [];
var tab_list_categoty_index_0 = [];
var tab_list_num0 = 0;
var temp0;
var lnkStyle = new TextField.StyleSheet();
lnkStyle.setStyle("a",{color:"#80e71c",textDecoration:"underline"});
lnkStyle.setStyle("a:hover",{color:"#e5ff9f",textDecoration:"underline"});
lnkStyle.setStyle("a:active",{color:"#517f24",textDecoration:"underline"});
SetGuideTxt();
var NameTextLength_Local = 0;
var BFEnable = lib.gamedata.DefaultData.getDefaultUIData("BFEnable").param0;
var bVIP = lib.gamedata.DefaultData.getDefaultUIData("VIP").param0;
var bPremiumitem = lib.gamedata.DefaultData.getDefaultUIData("bPremiumitem").param0;
function setEnchantBtnMouseEvent(targetBtn)
{
   targetBtn.onRelease2 = function()
   {
      var _loc2_ = this.id;
      ToGame_PaperDoll_RequestOpenEnchantUI(_loc2_);
   };
}
function SetGuideTxt()
{
   var _loc1_ = "<font color=\'#80e71c\'><a href=\'asfunction:_parent._parent.goPremium\'>" + lib.util.UIString.getUIString("$221090") + "</a></font>";
   var _loc2_ = lib.util.UIString.getUIString("$221083","item",_loc1_);
   container_mc.styleslotbg.guideFd2.htmlText = "<img src=\'icon_notice\' vspace=\'-1\'/>" + _loc2_;
}
function visibleStyleRune(bTrue)
{
   if(!bStyleRune)
   {
      bTrue = false;
   }
   var _loc2_ = 110;
   while(_loc2_ <= 119)
   {
      var _loc1_ = container_mc[dataName + _loc2_];
      _loc1_._visible = bTrue;
      if(!_loc1_.Icon)
      {
         lib.manager.ToolTip.add(_loc1_.SLOT,runeToolTipStr,1);
      }
      _loc2_ = _loc2_ + 1;
   }
}
function goPremium()
{
   fscommand("ToGame_WebService_PimiumItem");
}
function slotChanged(slot, slotSize)
{
   if(slot != undefined)
   {
      var _loc5_ = 0;
      var _loc4_ = 0;
      slot.Icon._width = slotSize - 10;
      slot.Icon._height = slotSize - 10;
      var _loc3_ = (slot.Icon._width - slotSize) / 2;
      slot.Icon._x = - _loc3_;
      slot.Icon._y = - _loc3_;
      slot.Icon._alpha = 10;
      gs.TweenLite.killTweensOf(slot.Icon,false);
      gs.TweenLite.to(slot.Icon,0.3,{_alpha:100,_x:_loc5_,_y:_loc4_,_width:slotSize,_height:slotSize,ease:gs.easing.Bounce.easeOut,overwrite:1});
   }
}
function cristalChanged(slot, slotSize)
{
   if(slot != undefined)
   {
      var _loc5_ = 0;
      var _loc4_ = 0;
      slot.Icon._width = slotSize - 10;
      slot.Icon._height = slotSize - 10;
      var _loc3_ = (slot.Icon._width - slotSize) / 2;
      slot.Icon._x = - _loc3_;
      slot.Icon._y = - _loc3_;
      slot.Icon._alpha = 10;
      gs.TweenLite.killTweensOf(slot.Icon,false);
      gs.TweenLite.to(slot.Icon,0.3,{_alpha:100,_x:_loc5_,_y:_loc4_,_width:slotSize,_height:slotSize,ease:gs.easing.Bounce.easeOut,overwrite:1});
   }
}
function ToGame_PaperDoll_Init()
{
   getURL("FSCommand:ToGame_PaperDoll_Init",Number(isTheOther));
}
function ToGameShowPaperDoll(bShow)
{
   getURL("FSCommand:ToGameShowPaperDoll",bShow);
}
function ToGameRotatePaperDoll(pitch, yaw, roll)
{
   if(Number(isTheOther))
   {
      return undefined;
   }
   getURL("FSCommand:ToGameRotatePaperDoll",pitch + "\t" + yaw + "\t" + roll);
}
function ToGame_PaperDoll_RequestOpenEnchantUI(id)
{
   getURL("FSCommand:ToGame_PaperDoll_RequestOpenEnchantUI",id);
}
function ToGame_PaperDoll_CloseUI()
{
   getURL("FSCommand:ToGame_PaperDoll_CloseUI",Number(isTheOther));
}
function ToGame_PaperDoll_RightClick(slotIndex)
{
   if(Number(isTheOther))
   {
      return undefined;
   }
   getURL("FSCommand:ToGame_PaperDoll_RightClick",slotIndex);
}
function ToGame_PaperDoll_RequestInstanceDungeon()
{
   getURL("FSCommand:ToGame_PaperDoll_RequestInstanceDungeon",Number(isTheOther));
}
function ToGame_PaperDoll_InputGreeting(_message)
{
   if(Number(isTheOther))
   {
      return undefined;
   }
   getURL("FSCommand:ToGame_PaperDoll_InputGreeting",_message);
}
function ToGame_PaperDoll_LeftClickSlot(slotIndex)
{
   getURL("FSCommand:ToGame_PaperDoll_LeftClickSlot",slotIndex);
}
function raperValue(datas)
{
   str = datas[0];
   if(datas[1] != 0 && datas[1] != undefined)
   {
      if(Number(datas[1]) > 0)
      {
         str = str + (" (<font color=\'#556600\'>+" + datas[1] + "</font>)");
      }
      else
      {
         str = str + (" (<font color=\'#ff3838\'>-" + Math.abs(datas[1]) + "</font>)");
      }
   }
   if(datas[2] != 0 && datas[2] != undefined)
   {
      if(Number(datas[2]) > 0)
      {
         str = str + (" (<font color=\'#58c84e\'>+" + datas[2] + "</font>)");
      }
      else
      {
         str = str + (" (<font color=\'#ff3838\'>-" + Math.abs(datas[2]) + "</font>)");
      }
   }
   return str;
}
function openStateMc(_open)
{
   container_mc.bookmarkBtn.isOpen = _open;
   delete container_mc.bookmarkBtn.arrowMc.onEnterFrame;
   container_mc.bookmarkBtn.arrowMc.arrowMc.gotoAndStop(1);
   gs.TweenLite.killTweensOf(container_mc.paperdollMc0,false);
   if(_open)
   {
      container_mc.bookmarkBtn.arrowMc.gotoAndStop(1);
      container_mc.bookmarkBtn._x = bookMarkMcX;
      container_mc.paperdollMc0._visible = true;
      gs.TweenLite.to(container_mc.paperdollMc0,SPEED,{_x:paperX,ease:gs.easing.Strong.easeOut});
      hit.gotoAndStop(1);
   }
   else
   {
      container_mc.bookmarkBtn.arrowMc.gotoAndStop(container_mc.bookmarkBtn.arrowMc._totalframes);
      container_mc.bookmarkBtn._x = bookMarkMcX + 70;
      gs.TweenLite.to(container_mc.paperdollMc0,SPEED,{_x:paperX + 300,ease:gs.easing.Back.easeOut,onComplete:onFinishTween});
      hit.gotoAndStop(2);
   }
}
function initStyleSlotForPCPremium()
{
   var _loc5_ = container_mc[dataName + "100"].enchantFd.getTextFormat();
   _loc5_.size = 16;
   var _loc4_ = [100,101,104,105,106,107];
   var _loc2_ = 0;
   while(_loc2_ < _loc4_.length)
   {
      var _loc3_ = dataName + _loc4_[_loc2_];
      var _loc1_ = container_mc[_loc3_].enchantFd;
      _loc1_.setNewTextFormat(_loc5_);
      _loc1_._x = 4;
      _loc1_._y = -1;
      _loc1_.shadowColor = 0;
      _loc1_.textColor = 12975929;
      _loc1_.text = "PC방";
      _loc2_ = _loc2_ + 1;
   }
}
function onFinishTween()
{
   container_mc.paperdollMc0._visible = false;
}
function clearItemSlot()
{
   var _loc2_ = 1;
   while(_loc2_ <= MAX_ITEMSLOTCOUNT)
   {
      var _loc1_ = container_mc[dataName + _loc2_];
      _loc1_.clear();
      _loc1_.Icon.clear();
      lib.manager.ToolTip.add(_loc1_.SLOT,itemToolTipString[_loc2_ - 1],1);
      _loc1_.bHaveItem = false;
      _loc1_.SLOT.enabled = !isTheOther;
      _loc1_.enchantFd.text = "";
      var _loc3_ = _loc1_["coolAniMc" + _loc2_];
      if(_loc3_ != undefined)
      {
         coolTimeManager.removeCoolTimeInstance(_loc3_);
         _loc3_.removeMovieClip();
      }
      _loc2_ = _loc2_ + 1;
   }
}
function clearItemSlot2()
{
   var _loc2_ = 100;
   while(_loc2_ <= 100 + MAX_ITEMSLOTCOUNT2)
   {
      var _loc1_ = container_mc[dataName + _loc2_];
      _loc1_.clear();
      _loc1_.Icon.clear();
      lib.manager.ToolTip.add(_loc1_.SLOT,itemStyleToolTipString[_loc2_ - 100],1);
      _loc1_.bHaveItem = false;
      _loc1_.SLOT.enabled = !isTheOther;
      _loc1_.enchantFd._visible = false;
      UI["_stylesloteffect_" + [_loc2_ - 100]] = false;
      var _loc3_ = _loc1_["coolAniMc" + _loc2_];
      if(_loc3_ != undefined)
      {
         coolTimeManager.removeCoolTimeInstance(_loc3_);
         _loc3_.removeMovieClip();
      }
      _loc2_ = _loc2_ + 1;
   }
}
function clearCustomizeWeapon()
{
   var _loc2_ = STARTINDEX_CRISTALSLOT;
   while(_loc2_ < STARTINDEX_CRISTALSLOT + 4)
   {
      var _loc1_ = container_mc[dataName + _loc2_];
      _loc1_.clear();
      _loc1_.Icon.clear();
      _loc1_.SLOT.enabled = false;
      _loc1_.FX_IMPOSSIBLE._visible = true;
      lib.manager.ToolTip.add(_loc1_.SLOT,cristalToolTipString[_loc2_ - STARTINDEX_CRISTALSLOT],1);
      var _loc4_ = container_mc["effect" + _loc2_];
      _loc4_._visible = false;
      var _loc3_ = _loc1_["coolAniMc" + _loc2_];
      if(_loc3_ != undefined)
      {
         coolTimeManager.removeCoolTimeInstance(_loc3_);
         _loc3_.removeMovieClip();
      }
      _loc2_ = _loc2_ + 1;
   }
}
function clearCustomizeArmor()
{
   var _loc2_ = STARTINDEX_CRISTALSLOT + 4;
   while(_loc2_ < STARTINDEX_CRISTALSLOT + 8)
   {
      var _loc1_ = container_mc[dataName + _loc2_];
      _loc1_.clear();
      _loc1_.Icon.clear();
      _loc1_.SLOT.enabled = false;
      _loc1_.FX_IMPOSSIBLE._visible = true;
      lib.manager.ToolTip.add(_loc1_.SLOT,cristalToolTipString[_loc2_ - STARTINDEX_CRISTALSLOT],1);
      var _loc4_ = container_mc["effect" + _loc2_];
      _loc4_._visible = false;
      var _loc3_ = _loc1_["coolAniMc" + _loc2_];
      if(_loc3_ != undefined)
      {
         coolTimeManager.removeCoolTimeInstance(_loc3_);
         _loc3_.removeMovieClip();
      }
      _loc2_ = _loc2_ + 1;
   }
}
function clearCustomizeEarArmor(_direction)
{
   var _loc3_ = _direction != "0"?32:31;
   var _loc1_ = container_mc[dataName + _loc3_];
   _loc1_.clear();
   _loc1_.SLOT.enabled = false;
   _loc1_.Icon.clear();
   _loc1_.FX_IMPOSSIBLE._visible = true;
   lib.manager.ToolTip.add(_loc1_.SLOT,cristalToolTipString[8],1);
   var _loc4_ = container_mc["effect" + i];
   _loc4_._visible = false;
   var _loc2_ = _loc1_["coolAniMc" + _loc3_];
   if(_loc2_ != undefined)
   {
      coolTimeManager.removeCoolTimeInstance(_loc2_);
      _loc2_.removeMovieClip();
   }
}
function clearCustomizeRingArmor(_direction)
{
   var _loc3_ = _direction != "0"?42:41;
   var _loc1_ = container_mc[dataName + _loc3_];
   _loc1_.clear();
   _loc1_.SLOT.enabled = false;
   _loc1_.Icon.clear();
   _loc1_.FX_IMPOSSIBLE._visible = true;
   lib.manager.ToolTip.add(_loc1_.SLOT,cristalToolTipString[9],1);
   var _loc4_ = container_mc["effect" + i];
   _loc4_._visible = false;
   var _loc2_ = _loc1_["coolAniMc" + _loc3_];
   if(_loc2_ != undefined)
   {
      coolTimeManager.removeCoolTimeInstance(_loc2_);
      _loc2_.removeMovieClip();
   }
}
function listReset()
{
   for(var _loc1_ in container_mc.statusContainer)
   {
      if(typeof container_mc.statusContainer[_loc1_] == "movieclip")
      {
         container_mc.statusContainer[_loc1_].removeMovieClip();
      }
   }
}
function setStatus(index)
{
   tab_activedNum = index;
   ToGame_PaperDoll_TabFocus(index);
   listReset();
   if(statusDatas[index].length > 0)
   {
      var _loc5_ = 0;
      while(_loc5_ < statusDatas[index].length)
      {
         var _loc2_ = container_mc.statusContainer.attachMovie("infoLine","line_" + _loc5_,_loc5_);
         _loc2_._y = 7 + _loc5_ * 25;
         var _loc1_ = statusDatas[index][_loc5_];
         if(_loc1_._label != undefined)
         {
            _loc2_.txt0.htmlText = _loc1_._label;
            _loc2_.txt1.htmlText = _loc1_.str;
            if(_loc1_.extraData == "" || _loc1_.extraData == null)
            {
               _loc2_.txt1._x = 280;
            }
            else
            {
               _loc2_.txt1._x = 220;
            }
            _loc2_.txt2.htmlText = _loc1_.extraData;
            if(_loc1_.tooltip != "" && _loc1_.tooltip != undefined)
            {
               lib.manager.ToolTip.add(_loc2_.mTooltip,_loc1_.tooltip,1);
            }
            else
            {
               lib.manager.ToolTip.remove(_loc2_.mTooltip);
            }
         }
         _loc5_ = _loc5_ + 1;
      }
   }
   else
   {
      for(var _loc5_ in statusDatas[index])
      {
         _loc1_ = statusDatas[index][_loc5_];
         var _loc4_ = _loc1_.index;
         _loc2_ = container_mc.statusContainer.attachMovie("infoLine","line_" + _loc4_,_loc4_);
         _loc2_._y = 7 + _loc4_ * 25;
         if(_loc1_._label != undefined)
         {
            _loc2_.txt0.htmlText = _loc1_._label;
            _loc2_.txt1.htmlText = _loc1_.str;
            if(_loc1_.extraData == "" || _loc1_.extraData == null)
            {
               _loc2_.txt1._x = 280;
            }
            else
            {
               _loc2_.txt1._x = 220;
            }
            _loc2_.txt2.htmlText = _loc1_.extraData;
            if(_loc1_.tooltip != "" && _loc1_.tooltip != undefined)
            {
               lib.manager.ToolTip.add(_loc2_.mTooltip,_loc1_.tooltip,1);
            }
            else
            {
               lib.manager.ToolTip.remove(_loc2_.mTooltip);
            }
         }
      }
   }
   container_mc.statusContainer._visible = index != 4;
   container_mc.indunContainer._visible = index == 4;
   container_mc.indunContainer._visible = index == 4;
   container_mc.indunBg._visible = index != 4;
   container_mc.scrollbar._visible = index == 4;
   container_mc.scrollbar1._visible = index != 4;
   container_mc.scrollBgMc._visible = index == 4;
   container_mc.scrollbar.scroll = 0;
   indunResetBtn.setVisible(index == 4 && !isTheOther);
   if(container_mc.scrollbar1.pageSize != container_mc.statusContainer._height + 10)
   {
      container_mc.scrollbar1.pageSize = container_mc.statusContainer._height + 10;
   }
   if(index == 4)
   {
      container_mc.indunmaskMc._height = indunBgTh - 50;
   }
   else
   {
      container_mc.indunmaskMc._height = indunBgTh;
   }
}
function release(num, notSendToGame)
{
   var _loc1_ = 0;
   while(_loc1_ < 10)
   {
      container_mc["LbFd" + _loc1_].text = "";
      container_mc["staFd" + _loc1_].htmlText = "";
      _loc1_ = _loc1_ + 1;
   }
   setStatus(tab.activedNum);
}
function SetPvpPosition()
{
   pvpPosY = 42;
   var _loc3_ = pvpBoxArray.length;
   var _loc1_ = 0;
   while(_loc1_ < _loc3_)
   {
      var _loc2_ = pvpBoxArray[_loc1_];
      if(_loc2_ != undefined)
      {
         _loc2_._y = pvpPosY;
         pvpPosY = pvpPosY + _loc2_._height;
      }
      _loc1_ = _loc1_ + 1;
   }
}
function ToGame_PaperDoll_RequestPVP()
{
   getURL("FSCommand:ToGame_PaperDoll_RequestPVP",Number(isTheOther));
}
function ToGame_PaperDoll_RequestPVPInfo(index)
{
   getURL("FSCommand:ToGame_PaperDoll_RequestPVPInfo",index);
}
function PaperDoll_Visible(bool)
{
   var _loc1_ = 0;
   while(_loc1_ < 100)
   {
      container_mc["PaperDoll__" + _loc1_]._visible = bool;
      container_mc["LbFd" + _loc1_]._visible = bool;
      container_mc["staFd" + _loc1_]._visible = bool;
      container_mc["tab_btn" + _loc1_]._visible = bool;
      if(tab2.activedNum == 1)
      {
         container_mc["LbFd" + _loc1_]._visible = true;
         container_mc["staFd" + _loc1_]._visible = true;
         container_mc["tab_btn" + _loc1_]._visible = true;
      }
      _loc1_ = _loc1_ + 1;
   }
   if(bStyleRune)
   {
      container_mc.PaperDoll__14._visible = false;
      container_mc.PaperDoll__15._visible = false;
   }
   if(isTheOther == false || isTheOther == undefined)
   {
      container_mc.enchantBtn__1._visible = tab2.activedNum == 0 && container_mc.enchantBtn__1.bVisible;
      container_mc.enchantBtn__3._visible = tab2.activedNum == 0 && container_mc.enchantBtn__3.bVisible;
      container_mc.enchantBtn__4._visible = tab2.activedNum == 0 && container_mc.enchantBtn__4.bVisible;
      container_mc.enchantBtn__5._visible = tab2.activedNum == 0 && container_mc.enchantBtn__5.bVisible;
   }
   if(tab2.activedNum == 1)
   {
      _loc1_ = 100;
      while(_loc1_ < 108)
      {
         container_mc["PaperDoll__" + _loc1_]._visible = true;
         _loc1_ = _loc1_ + 1;
      }
      container_mc.styleslotbg._visible = true;
      visibleStyleRune(true);
   }
   else
   {
      _loc1_ = 100;
      while(_loc1_ < 108)
      {
         container_mc["PaperDoll__" + _loc1_]._visible = false;
         _loc1_ = _loc1_ + 1;
      }
      container_mc.styleslotbg._visible = false;
      visibleStyleRune(false);
   }
   _loc1_ = 0;
   while(_loc1_ < 6)
   {
      if(tab2.activedNum == 0)
      {
         if(UI["_stylesloteffect_" + _loc1_] == true)
         {
            container_mc["stylesloteffect_" + _loc1_]._visible = true;
         }
         else
         {
            container_mc["stylesloteffect_" + _loc1_]._visible = false;
         }
      }
      else
      {
         container_mc["stylesloteffect_" + _loc1_]._visible = false;
      }
      _loc1_ = _loc1_ + 1;
   }
   container_mc.text_exp._visible = bool;
   container_mc.ep_txt._visible = bool;
   container_mc.tabBtn._visible = bool;
   container_mc.indunContainer._visible = bool && tab_activedNum == 4;
   container_mc.statusContainer._visible = bool && tab_activedNum != 4;
   container_mc.indunBg._visible = bool;
   container_mc.scrollBgMc._visible = bool;
   container_mc.scrollbar._visible = bool && tab_activedNum == 4;
   container_mc.scrollbar1._visible = bool && tab_activedNum != 4;
   container_mc.Bg2._visible = bool;
   if(bStyleRune)
   {
      container_mc.Bg2.gotoAndStop(2);
   }
   else
   {
      container_mc.Bg2.gotoAndStop(1);
   }
   container_mc.expIconMc._visible = bool;
   indunResetBtn.setVisible(bool && tab_activedNum == 4 && !isTheOther);
   if(tab2.activedNum == 1)
   {
      container_mc.text_exp._visible = true;
      container_mc.ep_txt._visible = true;
      container_mc.tabBtn._visible = true;
      container_mc.indunBg._visible = true;
      container_mc.expIconMc._visible = true;
      container_mc.Bg2._visible = true;
      container_mc.Bg2.gotoAndStop(4);
      container_mc.comboBox._visible = false;
      container_mc.scrollBgMc._visible = true;
      container_mc.scrollbar._visible = tab_activedNum == 4;
      container_mc.scrollbar1._visible = tab_activedNum != 4;
      container_mc.statusContainer._visible = true;
   }
   if(tab2.activedNum == 0 || tab2.activedNum == 1)
   {
      if(!isTheOther && container_mc.tab_btn4._currentframe != 1)
      {
         indunResetBtn.setVisible(true);
         container_mc.indunContainer._visible = true;
      }
   }
   if(!isTheOther)
   {
      container_mc.setItemMc._visible = bool;
   }
   else
   {
      container_mc.setItemMc._visible = false;
   }
   container_mc.itemLevel._visible = bool;
   container_mc.PKPoint._visible = bool;
   if(tab2.activedNum == 1)
   {
      container_mc.itemLevel._visible = true;
      container_mc.PKPoint._visible = true;
   }
   if(tab2.activedNum == 0)
   {
      container_mc.comboBox._visible = true;
   }
   else
   {
      container_mc.comboBox._visible = false;
   }
}
function ToGame_CharacterWindow_InitDungeon()
{
   fscommand("ToGame_CharacterWindow_InitDungeon");
}
function setComboBoxListener()
{
   container_mc.comboBox.addListener(container_mc.comboBox);
}
function ToGame_PaperDoll_SelectTitle(_id)
{
   getURL("FSCommand:ToGame_PaperDoll_SelectTitle",_id);
}
function ToGame_PaperDoll_RequestItemSet(index)
{
   getURL("FSCommand:ToGame_PaperDoll_RequestItemSet",index + "\t" + Number(isTheOther));
}
function ToGame_PaperDoll_SaveItemSet()
{
   fscommand("ToGame_PaperDoll_SaveItemSet");
}
function ToGame_PaperDoll_SetCheckReputation(index1, index2, index3)
{
   getURL("FSCommand:ToGame_PaperDoll_SetCheckReputation",index1 + "\t" + index2 + "\t" + index3);
}
function ToGame_PaperDoll_SetEnableItemSetSlot(index1)
{
   getURL("FSCommand:ToGame_PaperDoll_SetEnableItemSetSlot",index1);
}
function ToGame_PaperDoll_RequestStyleInfo(theOther)
{
   getURL("FSCommand:ToGame_PaperDoll_RequestStyleInfo",theOther);
}
function release2(num, blockEvent)
{
   if(BFEnable == "0" && num == 2)
   {
      num = 3;
   }
   if(num == 1)
   {
      lib.manager.UISound.play(lib.manager.UISound.MAIN_BTN);
      ToGame_PaperDoll_RequestStyleInfo(isTheOther);
      container_mc.pve_btn._visible = false;
      container_mc.pvp_btn._visible = false;
      container_mc.pvp_mc._visible = false;
      container_mc.dungeonContainerMc._visible = false;
      container_mc.dataGuideFd._visible = false;
      container_mc.pvpeBgMc._visible = false;
      PaperDoll_Visible(false);
      container_mc.notice_mc._visible = false;
      container_mc.pvpScrollbar._visible = false;
      container_mc.reputation_mc._visible = false;
      container_mc.balloonMc._visible = isTheOther == undefined || isTheOther == 0;
      container_mc.introBgMc._visible = isTheOther == undefined || isTheOther == 0;
      container_mc.greeting_txt._visible = true;
      container_mc.guild_txt._visible = true;
      container_mc.comboBox._visible = false;
      unionMakContainer._visible = unionRankMakContainer._visible = true;
      container_mc.vip_mc._visible = false;
   }
   else if(num == 2)
   {
      if(container_mc.pvp_mc._visible == false)
      {
         container_mc.dungeonContainerMc._visible = false;
         container_mc.dataGuideFd._visible = false;
         container_mc.pvp_mc._visible = true;
         ToGame_PaperDoll_RequestPVP();
         PaperDoll_Visible(false);
         container_mc.notice_mc._visible = true;
         container_mc.pvpScrollbar._visible = true;
         container_mc.reputation_mc._visible = false;
      }
      lib.manager.UISound.play(lib.manager.UISound.MAIN_BTN);
      container_mc.pve_btn._visible = true;
      container_mc.pvp_btn._visible = true;
      container_mc.pvpeBgMc._visible = true;
      container_mc.pve_btn.onRelease();
      container_mc.balloonMc._visible = false;
      container_mc.introBgMc._visible = false;
      container_mc.greeting_txt._visible = false;
      container_mc.guild_txt._visible = false;
      container_mc.comboBox._visible = false;
      unionMakContainer._visible = unionRankMakContainer._visible = false;
      if(eme_indunTabVisible == true)
      {
         container_mc.pve_btn._visible = true;
         container_mc.pvp_btn._visible = true;
         container_mc.pve_btn._x = 7;
         container_mc.pvp_btn._x = 122;
      }
      else if(eme_indunTabVisible == false)
      {
         container_mc.pve_btn._visible = false;
         container_mc.pvp_btn._visible = true;
         container_mc.dungeonContainerMc._visible = false;
         container_mc.pvp_mc._visible = true;
         container_mc.pve_btn._x = 7;
         container_mc.pvp_btn._x = 7;
      }
      container_mc.vip_mc._visible = false;
   }
   else if(num == 0)
   {
      container_mc.pve_btn._visible = false;
      container_mc.pvp_btn._visible = false;
      container_mc.dungeonContainerMc._visible = false;
      container_mc.dataGuideFd._visible = false;
      container_mc.pvp_mc._visible = false;
      container_mc.pvpeBgMc._visible = false;
      PaperDoll_Visible(true);
      lib.manager.UISound.play(lib.manager.UISound.MAIN_BTN);
      container_mc.notice_mc._visible = false;
      container_mc.pvpScrollbar._visible = false;
      container_mc.reputation_mc._visible = false;
      container_mc.comboBox._visible = isTheOther == undefined || isTheOther == 0;
      container_mc.balloonMc._visible = false;
      container_mc.introBgMc._visible = false;
      container_mc.greeting_txt._visible = isTheOther == 1;
      container_mc.guild_txt._visible = true;
      unionMakContainer._visible = unionRankMakContainer._visible = true;
      container_mc.vip_mc._visible = false;
   }
   else if(num == 3)
   {
      lib.manager.UISound.play(lib.manager.UISound.MAIN_BTN);
      container_mc.pve_btn._visible = false;
      container_mc.pvp_btn._visible = false;
      container_mc.dungeonContainerMc._visible = false;
      container_mc.dataGuideFd._visible = false;
      container_mc.pvp_mc._visible = false;
      PaperDoll_Visible(false);
      container_mc.notice_mc._visible = false;
      container_mc.pvpScrollbar._visible = false;
      container_mc.reputation_mc._visible = true;
      container_mc.greeting_txt._visible = false;
      container_mc.balloonMc._visible = false;
      container_mc.introBgMc._visible = false;
      container_mc.guild_txt._visible = false;
      container_mc.comboBox._visible = false;
      unionMakContainer._visible = unionRankMakContainer._visible = false;
      container_mc.setItemMc._visible = false;
      container_mc.vip_mc._visible = false;
   }
   else if(num == 4)
   {
      lib.manager.UISound.play(lib.manager.UISound.MAIN_BTN);
      container_mc.pve_btn._visible = false;
      container_mc.pvp_btn._visible = false;
      container_mc.dungeonContainerMc._visible = false;
      container_mc.dataGuideFd._visible = false;
      container_mc.pvp_mc._visible = false;
      PaperDoll_Visible(false);
      container_mc.notice_mc._visible = false;
      container_mc.pvpScrollbar._visible = false;
      container_mc.reputation_mc._visible = false;
      container_mc.greeting_txt._visible = false;
      container_mc.balloonMc._visible = false;
      container_mc.introBgMc._visible = false;
      container_mc.guild_txt._visible = false;
      container_mc.comboBox._visible = false;
      unionMakContainer._visible = unionRankMakContainer._visible = false;
      container_mc.setItemMc._visible = false;
      container_mc.guild_txt._visible = false;
      container_mc.vip_mc._visible = true;
   }
}
if(BFEnable == "0")
{
   container_mc.tabBtn2.labels = ["$221074","$221082","$221076"];
}
if(bVIP == "1")
{
   container_mc.tabBtn2._btnWidth = 92;
   container_mc.tabBtn2.labels = ["$221074","$221082","$221075","$221076","$221167"];
}
var bStyleRune = lib.gamedata.DefaultData.getDefaultUIData("StyleRune").param0 == "1";
if(bStyleRune)
{
   container_mc.styleslotbg.gotoAndStop(2);
   container_mc.Bg2.gotoAndStop(2);
   container_mc.PaperDoll__10._x = 211;
   container_mc.PaperDoll__10._y = 231;
   container_mc.PaperDoll__11._x = 211;
   container_mc.PaperDoll__11._y = 322;
   container_mc.PaperDoll__14._visible = false;
   container_mc.PaperDoll__15._visible = false;
}
var runeToolTipStr = lib.util.UIString.getUIString("$221169");
var tab2 = container_mc.tabBtn2.tab;
var pvpresult = lib.util.UIString.getUIString("$221070");
var scrollBar = container_mc.pvpScrollbar;
var list_pvpY = container_mc.pvp_mc._y;
var list_pveY = container_mc.dungeonContainerMc._y;
var pvScrollListner = {};
pvScrollListner.onScroll = function()
{
   container_mc.pvp_mc._y = list_pvpY - arguments[0];
   if(container_mc.pvp_mc._visible)
   {
      container_mc.pvp_mc._y = list_pvpY - arguments[0];
   }
   else if(container_mc.dungeonContainerMc._visible)
   {
      container_mc.dungeonContainerMc._y = list_pveY - arguments[0];
   }
};
scrollBar.addListener(pvScrollListner);
scrollBar.setWheel(container_mc.pvp_mc);
scrollBar.wheelDelta = 1;
scrollBar.pageSize = container_mc.pvp_mc._height;
scrollBar.displaySize = container_mc.mask_mc._height;
scrollBar.defaultBarSizeRatio = 0.3333333333333333;
scrollBar.rowHeight = 30;
scrollBar.scroll = 0;
container_mc.reputation_mc.txt.htmlText = lib.util.UIString.getUIString("$221079");
container_mc.reputation_mc.list.parentLinkID = "parent";
container_mc.reputation_mc.list.subLinkID = "sub";
var LISTROWS2 = 11;
var ROWSPACE2 = 0;
var lineHeight2 = 70;
var contentsHeight2 = container_mc.reputation_mc.reputation_mask_mc._height;
var con = container_mc.reputation_mc;
var reputationScrollbars = con.reputationScrollbar;
var targetContent = con.list;
var targetMask = con.reputation_mask_mc;
reputationScrollbars.addListener(targetContent);
targetContent.onScroll = function()
{
   this._y = - arguments[0];
};
reputationScrollbars.setWheel(targetContent);
reputationScrollbars.wheelDelta = 1;
reputationScrollbars.pageSize = 0;
reputationScrollbars.displaySize = contentsHeight2 - 50;
reputationScrollbars.defaultBarSizeRatio = 0.3333333333333333;
reputationScrollbars.rowHeight = lineHeight2 + ROWSPACE2;
reputationScrollbars.scroll = 0;
targetContent.onSelected = function(id, isParent)
{
   this._parent.reputationScrollbars.pageSize = this.calculateListHight();
};
var clickRecipe0 = null;
var clickRecipe1 = null;
var clickRecipe2 = null;
var reputation_arr = new Array();
var _enable;
var _disable;
var title_name;
var _stylesloteffect_0 = false;
var _stylesloteffect_1 = false;
var _stylesloteffect_2 = false;
var _stylesloteffect_3 = false;
var _stylesloteffect_4 = false;
var _stylesloteffect_5 = false;
stylesloteffect_0._visible = false;
stylesloteffect_1._visible = false;
stylesloteffect_2._visible = false;
stylesloteffect_3._visible = false;
stylesloteffect_4._visible = false;
stylesloteffect_5._visible = false;
var indunTabVisible = lib.gamedata.DefaultData.getDefaultUIData("indunTabVisible").param0;
var indunTabVisibles = lib.util.ExtString.split(indunTabVisible,",");
var eme_indunTabVisible = false;
if(indunTabVisibles.length == undefined || indunTabVisibles.length == 0)
{
   eme_indunTabVisible = true;
}
else if(indunTabVisibles[0] == 1)
{
   eme_indunTabVisible = true;
}
else
{
   eme_indunTabVisible = false;
}
var CustomScaleEvent;
myListener.OnGameEventShowWindow = function(widgetName, bShow)
{
   if(widgetName.toLowerCase() == UIname.toLowerCase() && (isTheOther == undefined || isTheOther == 0))
   {
      bWindowOpen = bShow;
      container_mc.greeting_txt.type = "input";
      continer_mc.introBgMc._visible = true;
      var delaynum = 0;
      UI.onEnterFrame = null;
      UI.onEnterFrame = function()
      {
         delaynum++;
         if(delaynum > 0)
         {
            if(tab2.activedNum == 0)
            {
               container_mc.setItemMc._visible = true;
            }
            UI.onEnterFrame = null;
         }
      };
      if(tab2.activedNum == 0)
      {
         container_mc.setItemMc._visible = true;
      }
      isTheOther = false;
      UI._visible = _global.gbUIMode && bShow;
      if(bPremiumitem != "0")
      {
      }
      if(UI._visible == false)
      {
      }
   }
   else if(widgetName.toLowerCase() == UIname2.toLowerCase() && (isTheOther == undefined || isTheOther == 1))
   {
      bWindowOpen = bShow;
      container_mc.greeting_txt.type = "dynamic";
      container_mc.introBgMc._visible = false;
      container_mc.greeting_txt.selectable = false;
      container_mc.comboBox._visible = false;
      container_mc.setItemMc._visible = false;
      var delay_num = 0;
      container_mc.onEnterFrame = null;
      container_mc.onEnterFrame = function()
      {
         delay_num++;
         if(delay_num > 0)
         {
            container_mc.onEnterFrame = null;
            if(container_mc.greeting_txt.text == greetingDefault)
            {
               container_mc.greeting_txt._visible = false;
               container_mc.balloonMc._visible = false;
            }
         }
      };
      isTheOther = true;
      UI._visible = _global.gbUIMode && bShow;
   }
   if(UI._visible == true)
   {
      CustomScaleEvent = new CustomScaleEvent();
      CustomScaleEvent.CustomScaleEventCheck(UI,UIname);
      UI.scaleExpander.scaleExpanderEventCheck(UI,UIname);
   }
   else
   {
      CustomScaleEvent.CustomScaleEventRemoveCheck();
   }
};
myListener.OnGameEventChangeUIMode = function(bShow)
{
   if(_global.gbUIMode && bWindowOpen)
   {
      UI._visible = true;
   }
   else
   {
      UI._visible = false;
   }
};
myListener.OnGame_PaperDoll_SetEnchantBtn = function(dataList)
{
   var _loc8_ = lib.util.ExtString.split(dataList,"\n");
   var _loc9_ = _loc8_.length;
   var _loc2_ = 0;
   while(_loc2_ < _loc9_)
   {
      var _loc1_ = lib.util.ExtString.split(_loc8_[_loc2_],"\t");
      var _loc4_ = _loc1_[0];
      var _loc5_ = Number(_loc1_[1]);
      var _loc6_ = Number(_loc1_[2]);
      var _loc3_ = UI["enchantBtn" + _loc4_];
      var _loc7_ = container_mc["enchantBtn__" + _loc4_];
      _loc7_.bVisible = _loc5_;
      if(tab2.activedNum == 0 && (isTheOther == false || isTheOther == undefined))
      {
         _loc3_.setVisible(_loc5_);
      }
      _loc3_.setEnabled(_loc6_);
      _loc2_ = _loc2_ + 1;
   }
};
myListener.OnGameEventUpdatePaperDollSlotList = function(partsList, changedIndex, _theOther)
{
   if(Number(_theOther) != Number(isTheOther))
   {
      return undefined;
   }
   clearItemSlot();
   var _loc9_ = partsList.split("\n");
   var _loc10_ = _loc9_.length;
   var _loc6_ = 0;
   while(_loc6_ < _loc10_)
   {
      var _loc2_ = _loc9_[_loc6_].split("\t");
      if(_loc2_.length != 1)
      {
         var _loc4_ = _loc2_[0];
         var _loc8_ = _loc2_[1];
         var _loc3_ = Number(_loc2_[5]);
         var _loc1_ = dataName + _loc4_;
         container_mc[_loc1_].Icon._visible = true;
         container_mc[_loc1_].id = _loc4_;
         lib.display.DrawBitmapData.draw(container_mc[_loc1_].Icon,_loc8_,0,0,0,0,50,50,0.78);
         container_mc[_loc1_].Icon.TEX = _loc8_;
         container_mc[_loc1_].grade = _loc2_[2];
         container_mc[_loc1_].sealType = _loc2_[3];
         container_mc[_loc1_].masterpiece = _loc2_[4];
         container_mc[_loc1_].durability = _loc2_[6];
         if(isNaN(_loc3_) == false && _loc3_ != -1 && _loc3_ != 0)
         {
            var _loc7_ = container_mc[_loc1_].enchantFd;
            var _loc5_ = 21433;
            if(_loc3_ > 11 && _loc3_ < 15)
            {
               _loc5_ = 8915599;
            }
            else if(_loc3_ > 14)
            {
               _loc5_ = 10624002;
            }
            _loc7_.shadowColor = _loc5_;
            _loc7_.text = "+" + _loc3_;
         }
         lib.manager.ToolTip.add(container_mc[_loc1_].SLOT,_loc4_,6,container_mc[_loc1_].Icon);
         container_mc[_loc1_].bHaveItem = true;
      }
      _loc6_ = _loc6_ + 1;
   }
   slotChanged(container_mc["PaperDoll__" + changedIndex],50);
};
myListener.OnGameEventUpdateWeaponCustomizingSlotList = function(max, List, changedIndex, _theOther)
{
   if(Number(_theOther) != Number(isTheOther))
   {
      return undefined;
   }
   clearCustomizeWeapon();
   var _loc6_ = STARTINDEX_CRISTALSLOT;
   while(_loc6_ < STARTINDEX_CRISTALSLOT + max)
   {
      var _loc5_ = container_mc[dataName + _loc6_];
      _loc5_._alpha = 100;
      _loc5_.SLOT.enabled = !isTheOther;
      _loc5_.FX_IMPOSSIBLE._visible = false;
      _loc6_ = _loc6_ + 1;
   }
   var _loc7_ = List.split("\n");
   var _loc1_ = STARTINDEX_CRISTALSLOT;
   _loc6_ = 0;
   while(_loc6_ < _loc7_.length)
   {
      var _loc2_ = _loc7_[_loc6_].split("\t");
      if(_loc2_.length != 1)
      {
         var _loc4_ = 0;
         while(_loc4_ < Number(_loc2_[1]))
         {
            var _loc3_ = container_mc["effect" + _loc1_];
            _loc3_.gotoAndStop(Number(_loc2_[1]));
            _loc3_._visible = true;
            lib.util.DrawBitmap.draw(container_mc[dataName + _loc1_].Icon,_loc2_[0],50,50);
            container_mc[dataName + _loc1_].grade = _loc2_[2];
            container_mc[dataName + _loc1_].sealType = _loc2_[3];
            container_mc[dataName + _loc1_].masterpiece = _loc2_[4];
            container_mc[dataName + _loc1_].durability = _loc2_[5];
            container_mc[dataName + _loc1_].id = _loc2_[0];
            lib.manager.ToolTip.add(container_mc[dataName + _loc1_].SLOT,_loc1_,6,container_mc[dataName + _loc1_].Icon);
            _loc1_ = _loc1_ + 1;
            _loc4_ = _loc4_ + 1;
         }
      }
      _loc6_ = _loc6_ + 1;
   }
   cristalChanged(container_mc["PaperDoll__" + changedIndex],50);
};
myListener.OnGameEventUpdateArmorCustomizingSlotList = function(max, List, changedIndex, _theOther)
{
   if(Number(_theOther) != Number(isTheOther))
   {
      return undefined;
   }
   clearCustomizeArmor();
   var _loc6_ = STARTINDEX_CRISTALSLOT + 4;
   while(_loc6_ < STARTINDEX_CRISTALSLOT + 4 + max)
   {
      var _loc5_ = container_mc[dataName + _loc6_];
      _loc5_._alpha = 100;
      _loc5_.SLOT.enabled = !isTheOther;
      _loc5_.FX_IMPOSSIBLE._visible = false;
      _loc6_ = _loc6_ + 1;
   }
   var _loc7_ = List.split("\n");
   var _loc1_ = STARTINDEX_CRISTALSLOT + 4;
   _loc6_ = 0;
   while(_loc6_ < _loc7_.length)
   {
      var _loc2_ = _loc7_[_loc6_].split("\t");
      if(_loc2_.length != 1)
      {
         var _loc4_ = 0;
         while(_loc4_ < Number(_loc2_[1]))
         {
            var _loc3_ = container_mc["effect" + _loc1_];
            _loc3_.gotoAndStop(Number(_loc2_[1]));
            _loc3_._visible = true;
            lib.util.DrawBitmap.draw(container_mc[dataName + _loc1_].Icon,_loc2_[0],50,50);
            container_mc[dataName + _loc1_].grade = _loc2_[2];
            container_mc[dataName + _loc1_].sealType = _loc2_[3];
            container_mc[dataName + _loc1_].masterpiece = _loc2_[4];
            container_mc[dataName + _loc1_].durability = _loc2_[5];
            container_mc[dataName + _loc1_].id = _loc2_[0];
            lib.manager.ToolTip.add(container_mc[dataName + _loc1_].SLOT,_loc1_,6,container_mc[dataName + _loc1_].Icon);
            _loc1_ = _loc1_ + 1;
            _loc4_ = _loc4_ + 1;
         }
      }
      _loc6_ = _loc6_ + 1;
   }
   cristalChanged(container_mc["PaperDoll__" + changedIndex],50);
};
myListener.OnGameEventUpdateEarCustomizingSlotList = function(_direction, max, List, changedIndex, _theOther)
{
   if(Number(_theOther) != Number(isTheOther))
   {
      return undefined;
   }
   clearCustomizeEarArmor(_direction);
   var _loc1_ = undefined;
   if(_direction == "0")
   {
      _loc1_ = container_mc[dataName + 31];
      customizeCnt = 31;
   }
   else
   {
      _loc1_ = container_mc[dataName + 32];
      customizeCnt = 32;
   }
   if(Number(max) > 0)
   {
      _loc1_._alpha = 100;
      _loc1_.SLOT.enabled = !isTheOther;
      _loc1_.FX_IMPOSSIBLE._visible = false;
   }
   var _loc5_ = List.split("\n");
   var _loc2_ = _loc5_[0].split("\t");
   if(_loc2_.length != 1)
   {
      var _loc4_ = 0;
      while(_loc4_ < Number(_loc2_[1]))
      {
         var _loc3_ = container_mc["effect" + customizeCnt];
         _loc3_.gotoAndStop(Number(_loc2_[1]));
         _loc3_._visible = true;
         lib.util.DrawBitmap.draw(_loc1_.Icon,_loc2_[0],50,50);
         _loc1_.grade = _loc2_[2];
         _loc1_.sealType = _loc2_[3];
         _loc1_.masterpiece = _loc2_[4];
         _loc1_.durability = _loc2_[5];
         _loc1_.id = _loc2_[0];
         lib.manager.ToolTip.add(_loc1_.SLOT,customizeCnt,6,_loc1_.Icon);
         _loc4_ = _loc4_ + 1;
      }
   }
   cristalChanged(container_mc["PaperDoll__" + changedIndex],50);
};
myListener.OnGameEventUpdateRingCustomizingSlotList = function(_direction, max, List, changedIndex, _theOther)
{
   if(Number(_theOther) != Number(isTheOther))
   {
      return undefined;
   }
   clearCustomizeRingArmor(_direction);
   var _loc1_ = undefined;
   if(_direction == "0")
   {
      _loc1_ = container_mc[dataName + 41];
      customizeCnt = 41;
   }
   else
   {
      _loc1_ = container_mc[dataName + 42];
      customizeCnt = 42;
   }
   if(Number(max) > 0)
   {
      _loc1_._alpha = 100;
      _loc1_.SLOT.enabled = !isTheOther;
      _loc1_.FX_IMPOSSIBLE._visible = false;
   }
   var _loc5_ = List.split("\n");
   var _loc2_ = _loc5_[0].split("\t");
   if(_loc2_.length != 1)
   {
      var _loc4_ = 0;
      while(_loc4_ < Number(_loc2_[1]))
      {
         var _loc3_ = container_mc["effect" + customizeCnt];
         _loc3_.gotoAndStop(Number(_loc2_[1]));
         _loc3_._visible = true;
         lib.util.DrawBitmap.draw(_loc1_.Icon,_loc2_[0],50,50);
         _loc1_.grade = _loc2_[2];
         _loc1_.sealType = _loc2_[3];
         _loc1_.masterpiece = _loc2_[4];
         _loc1_.durability = _loc2_[5];
         _loc1_.id = _loc2_[0];
         lib.manager.ToolTip.add(_loc1_.SLOT,customizeCnt,6,_loc1_.Icon);
         _loc4_ = _loc4_ + 1;
      }
   }
   cristalChanged(container_mc["PaperDoll__" + changedIndex],50);
};
myListener.OnGame_PaperDoll_UserName = function(Name, _theOther)
{
   if(Number(_theOther) != Number(isTheOther))
   {
      return undefined;
   }
   name = Name;
   container_mc.title_txt.text = lib.util.UIString.getUIString("$221004") + level + " " + name;
   title_name = lib.util.UIString.getUIString("$221004") + level + " " + name;
};
myListener.OnGameEventUpdateUserNick = function(Nick, _theOther)
{
   if(Number(_theOther) != Number(isTheOther))
   {
      return undefined;
   }
};
myListener.OnGame_PaperDoll_UserLevel = function(Level, _theOther)
{
   if(Number(_theOther) != Number(isTheOther))
   {
      return undefined;
   }
   level = Level;
   container_mc.title_txt.text = lib.util.UIString.getUIString("$221004") + level + " " + name;
   title_name = lib.util.UIString.getUIString("$221004") + level + " " + name;
};
myListener.OnGameEventUpdateUserRace = function(_Race, _theOther)
{
   if(Number(_theOther) != Number(isTheOther))
   {
      return undefined;
   }
   race = _Race;
   container_mc.title_txt.htmlText = "<img src=\'" + userClassIndex + "\' vspace=\'-6\'> " + title_name;
};
myListener.OnGameEventUpdateUserSex = function(Sex, _theOther)
{
   if(Number(_theOther) != Number(isTheOther))
   {
      return undefined;
   }
   sex = Sex;
   if(sex != undefined && sex != null)
   {
      container_mc.sex_txt.text = Sex;
   }
};
myListener.OnGameEventUpdateUserClass = function(_userClass, _userClassIndex, _theOther)
{
   if(Number(_theOther) != Number(isTheOther))
   {
      return undefined;
   }
   userClass = _userClass;
   var _loc1_ = Number(_userClassIndex) + 1;
   userClassIndex = "icon_class_0" + _loc1_;
   container_mc.title_txt.htmlText = "<img src=\'" + userClassIndex + "\' vspace=\'-6\'> " + title_name;
};
myListener.OnGameEventUpdateUserExp = function(cexp, maxexp, _theOther, percent)
{
   if(Number(_theOther) != Number(isTheOther))
   {
      return undefined;
   }
   if(percent == undefined || percent == null || percent == "" || percent == "undefined")
   {
      percent = Math.round(Number(cexp) / Number(maxexp) * 100);
   }
   var _loc3_ = String(lib.util.CurrencyFormat.makeComma(cexp));
   var _loc2_ = String(lib.util.CurrencyFormat.makeComma(maxexp));
   container_mc.text_exp.htmlText = "<font color=\'#73EEF7\'>" + _loc3_ + "</font> / " + _loc2_ + " (" + percent + "%)";
   container_mc.text_exp._width = container_mc.text_exp.textWidth + 5;
   container_mc.text_exp._x = expTextFieldStartX - container_mc.text_exp._width;
   container_mc.expIconMc._x = container_mc.text_exp._x - container_mc.expIconMc._width;
};
myListener.OnGameEventUpdateUserExtraPoint = function(ep, _theOther)
{
   if(Number(_theOther) != Number(isTheOther))
   {
      return undefined;
   }
   container_mc.ep_txt.text = EPSTR + " " + lib.util.CurrencyFormat.makeComma(String(ep));
};
var dd = false;
myListener.OnGameEvent_PaperDoll_SetSilhouette = function(sex, race, _theOther)
{
   if(Number(_theOther) != Number(isTheOther))
   {
      return undefined;
   }
   var _loc3_ = sex != 1?"W":"M";
   var _loc1_ = "H";
   if(race == 0)
   {
      _loc1_ = "H";
   }
   else if(race == 1)
   {
      _loc1_ = "E";
   }
   else if(race == 2)
   {
      _loc1_ = "A";
   }
   else if(race == 3)
   {
      _loc1_ = "K";
   }
   else if(race == 4)
   {
      if(sex == 1)
      {
         _loc1_ = "P";
         _loc3_ = "P";
      }
      else
      {
         _loc1_ = "E";
         _loc3_ = "L";
      }
   }
   else if(race == 5)
   {
      _loc1_ = "B";
      _loc3_ = "K";
   }
   var _loc5_ = UIname.toLowerCase();
   if(_theOther)
   {
      _loc5_ = UIname2.toLowerCase();
   }
   var _loc4_ = flash.display.BitmapData.loadBitmap("img://__S1UIRES_Skin.BG_" + _loc5_ + "_" + _loc1_ + _loc3_);
   if(_loc4_ == null)
   {
      _loc4_ = flash.display.BitmapData.loadBitmap("img://__S1UIRES_Skin.BG_bfadmission");
   }
   container_mc.uiBgMc2.attachBitmap(_loc4_,1);
   container_mc.uiBgMc2._width = w;
   container_mc.uiBgMc2._height = h;
   pvp_sex = sex;
};
myListener.OnGame_MouseDown = function(button, target)
{
   if(isTheOther)
   {
      return undefined;
   }
   if(button == 2 && target._name == "SLOT")
   {
      var _loc3_ = target._parent._name;
      if(container_mc[_loc3_] != target._parent)
      {
         return undefined;
      }
      var _loc4_ = _loc3_.substring(11,_loc3_.length);
      if(container_mc[_loc3_] != undefined)
      {
         ToGame_PaperDoll_RightClick(_loc4_);
      }
   }
   else if(button == 1 && _root.bSelectSlotMode)
   {
      var _loc5_ = target != undefined && target != "";
      if(_loc5_)
      {
         _loc3_ = target._parent._name;
         if(container_mc[_loc3_] != target._parent)
         {
            return undefined;
         }
         _loc4_ = _loc3_.substring(11,_loc3_.length);
         if(container_mc[_loc3_] != undefined && target._name == "SLOT")
         {
            ToGame_PaperDoll_LeftClickSlot(_loc4_);
         }
         else
         {
            ToGame_PaperDoll_LeftClickSlot("InvalidUI");
         }
      }
      else
      {
         ToGame_PaperDoll_LeftClickSlot("GameScreen");
      }
   }
};
var statusDatas = [];
var reformItemFarming = lib.gamedata.DefaultData.getDefaultUIData("reformItemFarming").param0 == "1";
var reform_before = {totalatk:{_label:"$221016",str:"",index:0,tip:"$102224"},totaldef:{_label:"$221017",str:"",index:1,tip:"$102225"},str:{_label:"$221018",str:"",index:2,tip:"$102226"},res:{_label:"$221019",str:"",index:3,tip:"$102227"},cristr:{_label:"$221012",str:"",index:4,tip:"$102228"},crires:{_label:"$221013",str:"",index:5,tip:"$102229"},powrt:{_label:"$221014",str:"",index:6,tip:"$102230"}};
var reform_after = {totalatk:{_label:"$221016",str:"",index:0,tip:"$102224"},totaldef:{_label:"$221017",str:"",index:1,tip:"$102225"},cristr:{_label:"$221012",str:"",index:2,tip:"$102228"},crires:{_label:"$221013",str:"",index:3,tip:"$102229"},powrt:{_label:"$221014",str:"",index:4,tip:"$102230"}};
statusDatas[0] = !reformItemFarming?reform_before:reform_after;
statusDatas[1] = {atk:{_label:"$221006",str:"",index:0,tip:"$102231"},def:{_label:"$221007",str:"",index:1,tip:"$102232"},impact:{_label:"$221008",str:"",index:2,tip:"$102233"},balance:{_label:"$221009",str:"",index:3,tip:"$102234"},atksp:{_label:"$221011",str:"",index:4,tip:"$102235"},runsp:{_label:"$221010",str:"",index:5,tip:"$102236"},wingsp:{_label:"$221170",str:"",index:6,tip:"$102280"}};
statusDatas[2] = {resA:{_label:"$221021",str:"",index:0,tip:"$102237"},resB:{_label:"$221022",str:"",index:1,tip:"$102238"},resC:{_label:"$221023",str:"",index:2,tip:"$102239"}};
statusDatas[3] = {promin:{_label:"$221026",str:"",index:0,tip:"$102240"},prohub:{_label:"$221025",str:"",index:1,tip:"$102241"},proeng:{_label:"$221028",str:"",index:2,tip:"$102242"}};
myListener.OnGame_PaperDoll_SetStatus = function(statusType, statusValue, statusAdd, _theOther)
{
   if(Number(_theOther) != Number(isTheOther))
   {
      return undefined;
   }
   var _loc3_ = statusValue;
   var _loc7_ = "";
   var _loc4_ = "";
   if(statusAdd != undefined && statusAdd != "" && statusAdd != 0 && statusAdd != "0/0")
   {
      if(Number(statusAdd) < 0)
      {
         _loc7_ = "<font size=\'17\' color=\'#FF3300\'> " + statusAdd + "</font>";
      }
      else if(Number(statusAdd) == 0)
      {
         _loc7_ = "";
      }
      else
      {
         _loc7_ = "<font size=\'17\' color=\'#58c84e\'> +" + statusAdd + "</font>";
      }
   }
   if(statusType == "totalatk" || statusType == "totaldef")
   {
      var _loc6_ = statusValue.split("/");
      var _loc2_ = statusAdd.split("/");
      if(_loc6_[1] == null)
      {
         _loc3_ = Number(statusValue) + Number(statusAdd);
         if(Number(statusAdd) == 0)
         {
            _loc4_ = "";
         }
         else if(Number(statusAdd) < 0)
         {
            _loc4_ = statusValue + "<font size=\'14\' color=\'#ff3300\'> (" + statusAdd + ")</font>";
         }
         else
         {
            _loc4_ = statusValue + "<font size=\'14\' color=\'#58c84e\'> (+" + statusAdd + ")</font>";
         }
      }
      else if(_loc6_[0] == _loc6_[1])
      {
         _loc3_ = Number(_loc6_[0]) + Number(_loc2_[0]);
         if(Number(_loc2_[0]) == 0)
         {
            _loc4_ = "";
         }
         else if(Number(_loc2_[0]) < 0)
         {
            _loc4_ = _loc6_[0] + "<font size=\'14\' color=\'#ff3300\'> (" + _loc2_[0] + ")</font>";
         }
         else
         {
            _loc4_ = _loc6_[0] + "<font size=\'14\' color=\'#58c84e\'> (+" + _loc2_[0] + ")</font>";
         }
      }
      else
      {
         _loc3_ = Number(_loc6_[0]) + Number(_loc2_[0]) + " ~ " + (Number(_loc6_[1]) + Number(_loc2_[1]));
         var _loc9_ = "";
         if(Number(_loc2_[0]) == 0)
         {
            _loc9_ = "";
         }
         else
         {
            if(Number(_loc2_[0]) < 0)
            {
               _loc9_ = _loc6_[0] + "<font size=\'14\' color=\'#ff3300\'> (" + _loc2_[0] + ")</font> ~ ";
            }
            else
            {
               _loc9_ = _loc6_[0] + "<font size=\'14\' color=\'#58c84e\'> (+" + _loc2_[0] + ")</font> ~ ";
            }
            if(Number(_loc2_[1]) < 0)
            {
               _loc9_ = _loc9_ + (_loc6_[1] + "<font size=\'14\' color=\'#ff3300\'> (" + _loc2_[1] + ")</font>");
            }
            else
            {
               _loc9_ = _loc9_ + (_loc6_[1] + "<font size=\'14\' color=\'#58c84e\'> (+" + _loc2_[1] + ")</font>");
            }
         }
         _loc4_ = _loc9_;
      }
      _loc7_ = "";
   }
   else if(statusType == "powrt")
   {
      _loc3_ = lib.util.UIString.getUIString("$221029","power",_loc3_ + _loc7_);
      _loc7_ = "";
   }
   else if(statusType == "promin" || statusType == "prohub" || statusType == "proeng")
   {
      var _loc8_ = lib.util.ExtString.split(statusValue,"\t");
      if(Number(_loc8_[0]) < 0)
      {
         _loc3_ = "Lv.<font size=\'17\' color=\'#58c84e\'>" + Math.abs(_loc8_[0]) + "</font>";
      }
      else
      {
         _loc3_ = "Lv." + _loc8_[0];
      }
      _addStr = "";
      if(Number(_loc8_[2]) > 0)
      {
         extraData = _loc8_[1] + "<font size=\'17\' color=\'#58c84e\'>+" + _loc8_[2] + "</font> / " + _loc8_[3];
      }
      else
      {
         extraData = _loc8_[1] + " / " + _loc8_[3];
      }
   }
   if(extraData == undefind)
   {
      extraData = "";
   }
   for(var _loc11_ in statusDatas)
   {
      if(statusDatas[_loc11_][statusType] != undefined)
      {
         statusDatas[_loc11_][statusType].str = _loc3_ + _loc7_;
         statusDatas[_loc11_][statusType].extraData = extraData;
         statusDatas[_loc11_][statusType].tooltip = _loc4_;
      }
   }
   setStatus(selectedBottomTab);
};
myListener.OnGame_PaperDoll_SetAllStatus = function(_listData, _theOther)
{
   if(Number(_theOther) != Number(isTheOther))
   {
      return undefined;
   }
   var _loc13_ = lib.util.ExtString.split(_listData,"\n");
   var _loc14_ = _loc13_.length;
   var _loc11_ = 0;
   while(_loc11_ < _loc14_)
   {
      var _loc1_ = lib.util.ExtString.split(_loc13_[_loc11_],"\t");
      var _loc8_ = _loc1_[0];
      var _loc10_ = "";
      var _loc9_ = "";
      var _loc4_ = _loc1_[2];
      var _loc6_ = _loc1_[1];
      var _loc5_ = "";
      if(_loc4_ != undefined && _loc4_ != "" && _loc4_ != 0 && _loc4_ != "0/0")
      {
         if(Number(_loc4_) < 0)
         {
            _loc5_ = "<font size=\'17\' color=\'#FF3300\'> " + _loc4_ + "</font>";
         }
         else if(Number(_loc4_) == 0)
         {
            _loc5_ = "";
         }
         else
         {
            _loc5_ = "<font size=\'17\' color=\'#58c84e\'> +" + _loc4_ + "</font>";
         }
      }
      if(_loc8_ == "totalatk" || _loc8_ == "totaldef")
      {
         var _loc3_ = _loc6_.split("/");
         var _loc2_ = _loc4_.split("/");
         if(_loc3_[0] == _loc3_[1] || _loc3_[1] == null)
         {
            _loc6_ = Number(_loc3_[0]) + Number(_loc2_[0]);
            if(Number(_loc2_[0]) == 0)
            {
               _loc9_ = "";
            }
            else if(Number(_loc2_[0]) < 0)
            {
               _loc9_ = _loc3_[0] + "<font size=\'14\' color=\'#ff3300\'> (" + _loc2_[0] + ")</font>";
            }
            else
            {
               _loc9_ = _loc3_[0] + "<font size=\'14\' color=\'#58c84e\'> (+" + _loc2_[0] + ")</font>";
            }
         }
         else
         {
            _loc6_ = Number(_loc3_[0]) + Number(_loc2_[0]) + " ~ " + (Number(_loc3_[1]) + Number(_loc2_[1]));
            var _loc7_ = "";
            if(Number(_loc2_[0]) < 0)
            {
               _loc7_ = "";
            }
            else
            {
               if(Number(_loc2_[0]) < 0)
               {
                  _loc7_ = _loc3_[0] + "<font size=\'14\' color=\'#ff3300\'> (" + _loc2_[0] + ")</font> ~ ";
               }
               else
               {
                  _loc7_ = _loc3_[0] + "<font size=\'14\' color=\'#58c84e\'> (+" + _loc2_[0] + ")</font> ~ ";
               }
               if(Number(_loc2_[1]) < 0)
               {
                  _loc7_ = _loc7_ + (_loc3_[1] + "<font size=\'14\' color=\'#ff0000\'> (" + _loc2_[1] + ")</font>");
               }
               else
               {
                  _loc7_ = _loc7_ + (_loc3_[1] + "<font size=\'14\' color=\'#58c84e\'> (+" + _loc2_[1] + ")</font>");
               }
            }
            _loc9_ = _loc7_;
         }
         _loc5_ = "";
      }
      else if(_loc8_ == "powrt")
      {
         _loc6_ = lib.util.UIString.getUIString("$221029","power",_loc6_ + _loc5_);
         _loc5_ = "";
      }
      else if(_loc8_ == "promin" || _loc8_ == "prohub" || _loc8_ == "proeng")
      {
         if(Number(_loc1_[1]) < 0)
         {
            _loc6_ = "Lv.<font size=\'17\' color=\'#58c84e\'>" + Math.abs(_loc1_[1]) + "</font>";
         }
         else
         {
            _loc6_ = "Lv." + _loc1_[1];
         }
         _loc5_ = "";
         if(Number(_loc1_[3]) > 0)
         {
            _loc10_ = _loc1_[2] + "<font size=\'17\' color=\'#58c84e\'>+" + _loc1_[3] + "</font> / " + _loc1_[4];
         }
         else
         {
            _loc10_ = _loc1_[2] + " / " + _loc1_[4];
         }
      }
      for(var _loc12_ in statusDatas)
      {
         if(statusDatas[_loc12_][_loc1_[0]] != undefined)
         {
            statusDatas[_loc12_][_loc1_[0]].str = _loc6_ + _loc5_;
            statusDatas[_loc12_][_loc1_[0]].extraData = _loc10_;
            statusDatas[_loc12_][_loc1_[0]].tooltip = _loc9_;
         }
      }
      _loc11_ = _loc11_ + 1;
   }
   setStatus(selectedBottomTab);
};
myListener.OnGame_PaperDoll_UpDateStatus = function(_tabNum, _listData, _theOther)
{
   if(Number(_theOther) != Number(isTheOther))
   {
      return undefined;
   }
   statusDatas[_tabNum] = [];
   var _loc5_ = lib.util.ExtString.split(_listData,"\n");
   var _loc6_ = _loc5_.length;
   var _loc4_ = "";
   var _loc3_ = 0;
   while(_loc3_ < _loc6_)
   {
      var _loc1_ = lib.util.ExtString.split(_loc5_[_loc3_],"\t");
      _loc4_ = "";
      if(Number(_loc1_[2]) < 0)
      {
         _loc4_ = "<font size=\'17\' color=\'#FF3300\'> " + _loc1_[2] + "</font>";
      }
      else if(Number(_loc1_[2]) > 0)
      {
         _loc4_ = "<font size=\'17\' color=\'#58c84e\'> +" + _loc1_[2] + "</font>";
      }
      var _loc2_ = new Object();
      _loc2_._label = _loc1_[0];
      _loc2_.str = _loc1_[1] + _loc4_;
      _loc2_.index = _loc3_;
      _loc2_.tip = _loc1_[3];
      statusDatas[_tabNum].push(_loc2_);
      _loc3_ = _loc3_ + 1;
   }
   setStatus(selectedBottomTab);
};
myListener.OnGame_PaperDoll_InstanceDungeon = function(id, __name, timeStr, _theOther)
{
   if(Number(_theOther) != Number(isTheOther))
   {
      return undefined;
   }
   var _loc3_ = container_mc.indunContainer;
   var _loc2_ = _loc3_["line" + id];
   if(_loc2_ == undefined)
   {
      _loc2_ = _loc3_.attachMovie("indunline","line" + id,indunCount);
      _loc2_.id = id;
      _loc2_._y = 7 + indunCount * 25;
      indunCount++;
   }
   _loc2_.txt0.text = __name;
   _loc2_.txt1.text = timeStr;
   _loc2_.onRollOver = function()
   {
      this.effect_mc.gotoAndStop("over");
   };
   _loc2_.onRollOut = _loc2_.hit.onReleaseOutside = function()
   {
      this.effect_mc.gotoAndStop("out");
   };
   var _loc5_ = container_mc.scrollbar.scroll;
   container_mc.scrollbar.pageSize = container_mc.indunContainer._height;
   container_mc.scrollbar.scroll = _loc5_;
};
myListener.OnGame_PaperDoll_GuildName = function(guildName, guildTitle, _theOther)
{
   if(Number(_theOther) != Number(isTheOther))
   {
      return undefined;
   }
   if(guildName == undefined)
   {
      guildName = "";
   }
   if(guildTitle == undefined)
   {
      guildTitle = "";
   }
   if(guildName == "")
   {
      container_mc.guild_txt.text = "";
   }
   else if(guildTitle == "")
   {
      container_mc.guild_txt.text = "[" + guildName + "]";
   }
   else
   {
      container_mc.guild_txt.text = lib.util.UIString.getUIString("$221032","guildname",guildName,"guildtitle",guildTitle);
   }
   var _loc4_ = unionMakContainer._width + unionRankMakContainer._width;
   var _loc3_ = 235 - (container_mc.guild_txt.textWidth + _loc4_ + 4) / 2;
   unionMakContainer._x = _loc3_;
   unionRankMakContainer._x = _loc3_ + unionMakContainer._width;
   unionMakContainer._y = unionRankMakContainer._y = container_mc.guild_txt._y - 4;
   container_mc.guild_txt._x = unionRankMakContainer._x + unionRankMakContainer._width;
};
var unionMakContainer = container_mc.createEmptyMovieClip("unionMakContainer",container_mc.getNextHighestDepth());
var unionRankMakContainer = container_mc.createEmptyMovieClip("unionRankMakContainer",container_mc.getNextHighestDepth());
myListener.OnGame_PaperDoll_Union = function(unionName, unionMark, rankName, rankMark, _theOther)
{
   if(Number(_theOther) != Number(isTheOther))
   {
      return undefined;
   }
   lib.util.DrawBitmap.draw(unionMakContainer,unionMark,28,28);
   lib.util.DrawBitmap.draw(unionRankMakContainer,rankMark,28,28);
   lib.manager.ToolTip.add(unionMakContainer,unionName,1);
   lib.manager.ToolTip.add(unionRankMakContainer,rankName,1);
   var _loc2_ = unionMakContainer._width + unionRankMakContainer._width;
   var _loc1_ = 235 - (container_mc.guild_txt.textWidth + _loc2_ + 4) / 2;
   unionMakContainer._x = _loc1_;
   unionRankMakContainer._x = _loc1_ + unionMakContainer._width;
   unionMakContainer._y = unionRankMakContainer._y = container_mc.guild_txt._y - 4;
   container_mc.guild_txt._x = unionRankMakContainer._x + unionRankMakContainer._width;
};
myListener.OnGame_PaperDoll_Greeting = function(_message, _theOther)
{
   if(Number(_theOther) != Number(isTheOther))
   {
      return undefined;
   }
   if(_message == undefined || _message == "")
   {
      _message = greetingDefault;
      greetMessage = "";
   }
   else
   {
      greetMessage = _message;
   }
   greeting_txt.text = _message;
   greeting_txt.textField.textColor = lib.info.TextColor.GENERAL_NORMAL;
};
var greeting_txt = new lib.util.ExtTextField(container_mc.greeting_txt,0,container_mc.introBgMc.focus);
greeting_txt.caption = greetingDefault;
greeting_txt.onChanged = function()
{
   var _loc1_ = 0;
   if(NameTextLength_Local > 0)
   {
      _loc1_ = NameTextLength_Local;
   }
   else
   {
      _loc1_ = 40;
   }
   lib.util.StrByteLen.getLenth3(container_mc.greeting_txt,_loc1_);
};
greeting_txt.onKillFocusEvent = function()
{
   var _loc2_ = lib.util.ExtString.trim(this.text);
   if(greetingDefault == _loc2_)
   {
      ToGame_PaperDoll_InputGreeting("");
   }
   else
   {
      ToGame_PaperDoll_InputGreeting(this.text);
   }
   this.textField.textColor = lib.info.TextColor.GENERAL_NORMAL;
   container_mc.introBgMc.bg._alpha = 0;
};
greeting_txt.onEnterKey = function()
{
   Selection.setFocus(null);
};
var saveItemLevel = 0;
myListener.OnGame_PaperDoll_SetItemLevel = function(equipItemLevel, allItemLevel, _theOther)
{
   if(Number(_theOther) != Number(isTheOther))
   {
      return undefined;
   }
   saveItemLevel = equipItemLevel;
   container_mc.itemLevel.txt.text = equipItemLevel + "(" + allItemLevel + ")";
   lib.manager.ToolTip.add(container_mc.itemLevel,lib.util.UIString.getUIString("$$021035") + " " + equipItemLevel + "\n" + "(" + lib.util.UIString.getUIString("$221073") + " " + allItemLevel + ")",1);
};
myListener.OnGame_PaperDoll_SetPvPItemLevel = function(equipItemLevel)
{
   container_mc.itemLevel.gotoAndStop(2);
   container_mc.PKPoint._x = 144;
   container_mc.itemLevel.txt0.text = saveItemLevel;
   container_mc.itemLevel.txt1.text = equipItemLevel;
   var _loc1_ = "PVE" + lib.util.UIString.getUIString("$221071") + " " + saveItemLevel + "\n";
   _loc1_ = _loc1_ + ("PVP" + lib.util.UIString.getUIString("$221071") + " " + equipItemLevel);
   lib.manager.ToolTip.add(container_mc.itemLevel,_loc1_,1);
};
myListener.OnGame_PaperDoll_SetPKPoint = function(PKPoint, bPKDeclared, _theOther)
{
   if(Number(_theOther) != Number(isTheOther))
   {
      return undefined;
   }
   bPKDeclared = Number(bPKDeclared);
   container_mc.PKPoint.txt.setText(PKPoint);
   container_mc.PKPoint.txt.textColor = !bPKDeclared?lib.info.TextColor.GENERAL_DISABLE:lib.info.TextColor.GENERAL_IMPOSSIBLE;
   lib.manager.ToolTip.add(container_mc.PKPoint,lib.util.UIString.getUIString("$221072") + " " + PKPoint,1);
};
myListener.OnGame_PaperDoll_SetTab = function(index)
{
   tab2.setTab(index,1);
};
var x_btn = new lib.util.TxtBtn(container_mc.x_mc);
x_btn.setRelease(ToGame_PaperDoll_CloseUI);
lib.manager.ToolTip.add(container_mc.bookmarkBtn,"$221001",1);
container_mc.bookmarkBtn.onPress = function()
{
   openStateMc(!this.isOpen);
};
container_mc.bookmarkBtn.onRollOver = function()
{
   this.arrowMc.arrowMc.gotoAndStop(2);
};
container_mc.bookmarkBtn.onRollOut = container_mc.bookmarkBtn.onReleaseOutside = function()
{
   lib.manager.ToolTip.hide();
   this.arrowMc.arrowMc.gotoAndStop(1);
};
container_mc.balloonMc.onMouseMove = function()
{
   if(this.hitTest(_root._xmouse,_root._ymouse) && !isTheOther)
   {
      container_mc.introBgMc.bg.onEnterFrame = function()
      {
         this._alpha = this._alpha + 20;
         if(this._alpha >= 100)
         {
            this._alpha = 100;
            delete this.onEnterFrame;
         }
      };
   }
   else if(Selection.getFocus() != container_mc.greeting_txt)
   {
      delete container_mc.introBgMc.bg.onEnterFrame;
      container_mc.introBgMc.bg._alpha = 0;
   }
};
var tab = container_mc.tabBtn.tab;
tab.setRelease(release);
tab.setTab(0,1);
container_mc.scrollbar.pageSize = container_mc.indunContainer._height;
container_mc.scrollbar.displaySize = 130;
container_mc.scrollbar.rowHeight = 26;
var indunConY = container_mc.indunContainer._y;
container_mc.indunContainer.onScroll = function()
{
   this._y = indunConY - arguments[0];
};
container_mc.scrollbar.setWheel(container_mc.indunContainer);
container_mc.scrollbar.addListener(container_mc.indunContainer);
container_mc.scrollbar1.pageSize = container_mc.statusContainer._height + 15;
container_mc.scrollbar1.displaySize = 182;
container_mc.scrollbar1.rowHeight = 26;
var statusConY = container_mc.statusContainer._y;
container_mc.statusContainer.onScroll = function()
{
   this._y = statusConY - arguments[0];
};
container_mc.scrollbar1.setWheel(container_mc.statusContainer);
container_mc.scrollbar1.addListener(container_mc.statusContainer);
container_mc.paperdollMc0._x = 325;
openStateMc(false);
clearCustomizeWeapon();
clearCustomizeArmor();
clearCustomizeEarArmor(0);
clearCustomizeEarArmor(1);
clearCustomizeRingArmor(0);
clearCustomizeRingArmor(1);
clearItemSlot2();
initStyleSlotForPCPremium();
if(this._name.toLowerCase() == UIname.toLowerCase() && (isTheOther == undefined || isTheOther == 0))
{
   isTheOther = false;
   ToGame_PaperDoll_Init();
}
else if(this._name.toLowerCase() == UIname2.toLowerCase() && (isTheOther == undefined || isTheOther == 1))
{
   isTheOther = true;
   ToGame_PaperDoll_Init();
}
container_mc.pvp_btn.hit.onRollOver = function()
{
   this._parent.gotoAndStop(2);
};
container_mc.pvp_btn.hit.onRollOut = function()
{
   this._parent.gotoAndStop(1);
};
container_mc.pvp_btn.hit.onPress = function()
{
   this._parent.gotoAndStop(3);
};
container_mc.pvp_btn.hit.onRelease = container_mc.pvp_btn1.hit.onReleaseOutside = function()
{
   this._parent.gotoAndStop(1);
   if(container_mc.pvp_mc._visible == false)
   {
      container_mc.pvp_mc._visible = true;
      ToGame_PaperDoll_RequestPVP();
      PaperDoll_Visible(false);
   }
   lib.manager.UISound.play(lib.manager.UISound.MAIN_BTN);
};
var pvpPosY;
var pvpBoxArray = [];
myListener.OnGame_PaperDoll_SetDataPVP = function(_Index, _Title, _Setdata, _theOther)
{
   if(Number(_theOther) != Number(isTheOther))
   {
      return undefined;
   }
   var _loc5_ = container_mc.pvp_mc.attachMovie("pvpBox","pvpBox" + _Index,_Index);
   pvpBoxArray[_Index] = _loc5_;
   _loc5_.titleTxt.text = _Title;
   _loc5_.btn.idx = _Index;
   _loc5_.btn._visible = false;
   _loc5_.btn.onRollOver = function()
   {
      this.gotoAndStop(2);
   };
   _loc5_.btn.onRollOut = function()
   {
      this.gotoAndStop(1);
   };
   _loc5_.btn.onPress = function()
   {
      this.gotoAndStop(3);
   };
   _loc5_.btn.onRelease = _loc5_.btn.onReleaseOutside = function()
   {
      this.gotoAndStop(1);
      ToGame_PaperDoll_RequestPVPInfo(this.idx);
      lib.manager.UISound.play(lib.manager.UISound.MAIN_BTN);
   };
   var _loc8_ = _Setdata.split("\n");
   var _loc9_ = _loc8_.length;
   var _loc3_ = 42;
   var _loc2_ = 0;
   while(_loc2_ < _loc9_)
   {
      if(_loc8_[_loc2_] == "setLine")
      {
         var _loc7_ = _loc5_.attachMovie("pvpLine","pvpLine" + _loc2_,_loc2_);
         _loc7_._y = _loc3_;
         _loc3_ = _loc3_ + 15;
      }
      else
      {
         var _loc6_ = _loc8_[_loc2_].split("\t");
         var _loc4_ = _loc5_.attachMovie("pvpList","pvpList" + _loc2_,_loc2_);
         _loc4_.txt0.htmlText = _loc6_[0];
         _loc4_.txt1.htmlText = _loc6_[1];
         _loc4_._y = _loc3_;
         _loc3_ = _loc3_ + 30;
         _loc5_.bg._height = _loc3_;
      }
      _loc2_ = _loc2_ + 1;
   }
   SetPvpPosition();
};
var bfResetPeriod = "";
myListener.OnGame_PaperDoll_SetBFResetPeriod = function(periodStr)
{
   bfResetPeriod = "<img src=\'icon_notice\' vspace=\'-1\'>" + periodStr;
   if(container_mc.pvp_btn._visible && container_mc.pvp_btn._currentframe == 3)
   {
      container_mc.notice_mc.txt.htmlText = bfResetPeriod;
   }
};
var dungeonExpStr0 = "<font color=\'#4ECD30\'>" + lib.util.UIString.getUIString("$221093") + "</font>";
var dungeonExpStr1 = "<font color=\'#FFCC00\'>" + lib.util.UIString.getUIString("$221094") + "</font>";
myListener.OnGame_PaperDoll_SetDurability = function(dtype, target)
{
   if(target.DRB_Mc)
   {
      target.DRB_Mc.removeMovieClip();
   }
   if(dtype > 0)
   {
      target.attachMovie("durabilityE" + dtype,"DRB_Mc",target.getNextHighestDepth());
      target._visible = true;
   }
};
myListener.OnGame_PaperDoll_SetDataPVE = function(setdata, visibleCount, _theOther)
{
   if(Number(_theOther) != Number(isTheOther))
   {
      return undefined;
   }
   var _loc4_ = container_mc.dungeonContainerMc;
   for(var _loc3_ in _loc4_)
   {
      if(typeof _loc4_[_loc3_] == "movieclip")
      {
         _loc4_[_loc3_].removeMovieClip();
      }
      container_mc.dataGuideFd._visible = true;
   }
   var _loc7_ = setdata.split("\n");
   var _loc8_ = _loc7_.length;
   _loc3_ = 0;
   while(_loc3_ < _loc8_)
   {
      container_mc.dataGuideFd._visible = false;
      var _loc2_ = _loc7_[_loc3_].split("\t");
      if(_loc2_[0] == "" || _loc2_[0] == undefined)
      {
         break;
      }
      var _loc5_ = _loc4_.getNextHighestDepth();
      var _loc1_ = _loc4_.attachMovie("dungeonId","dungeonMc" + _loc3_,_loc5_);
      _loc1_._y = _loc1_._height * _loc3_;
      _loc1_.lvFd.text = _loc2_[0];
      _loc1_.nameFd.verticalAlign = "center";
      _loc1_.nameFd.setText(_loc2_[1]);
      var _loc6_ = _loc2_[2] + lib.util.UIString.getUIString("$221060");
      _loc1_.countFd.setText(_loc6_);
      _loc1_.expFd.htmlText = _loc2_[3] != "0"?dungeonExpStr1:dungeonExpStr0;
      _loc1_.countFd._visible = visibleCount == "1";
      _loc3_ = _loc3_ + 1;
   }
   container_mc.pvpScrollbar.pageSize = container_mc.dungeonContainerMc._height;
};
container_mc.pve_btn.onRelease = function()
{
   container_mc.dataGuideFd._visible = container_mc.dungeonContainerMc._height <= 1;
   this.gotoAndStop(3);
   this.txt.textColor = releaseColor;
   container_mc.pvp_btn.gotoAndStop(1);
   container_mc.pvp_btn.txt.textColor = normalColor;
   container_mc.dungeonContainerMc._visible = true;
   container_mc.pvp_mc._visible = false;
   container_mc.pvpScrollbar.pageSize = container_mc.dungeonContainerMc._height;
   container_mc.pvpScrollbar.setWheel(container_mc.dungeonContainerMc);
   container_mc.notice_mc.txt.htmlText = "<img src=\'icon_notice\' vspace=\'-1\'> " + lib.util.UIString.getUIString("$221095");
};
container_mc.pve_btn.onRollOver = function()
{
   if(this._currentframe != 3)
   {
      this.gotoAndStop(2);
      this.txt.textColor = overColor;
   }
};
container_mc.pve_btn.onRollOut = container_mc.pve_btn.onReleaseOutside = function()
{
   if(this._currentframe != 3)
   {
      this.gotoAndStop(1);
      this.txt.textColor = normalColor;
   }
};
container_mc.pvp_btn.onRelease = function()
{
   container_mc.dataGuideFd._visible = false;
   this.gotoAndStop(3);
   this.txt.textColor = releaseColor;
   container_mc.pve_btn.gotoAndStop(1);
   container_mc.pve_btn.txt.textColor = normalColor;
   container_mc.dungeonContainerMc._visible = false;
   container_mc.pvp_mc._visible = true;
   container_mc.pvpScrollbar.pageSize = container_mc.pvp_mc._height;
   container_mc.pvpScrollbar.setWheel(container_mc.pvp_mc);
   container_mc.notice_mc.txt.htmlText = bfResetPeriod;
};
container_mc.pvp_btn.onRollOver = function()
{
   if(this._currentframe != 3)
   {
      this.gotoAndStop(2);
      this.txt.textColor = overColor;
   }
};
container_mc.pvp_btn.onRollOut = container_mc.pvp_btn.onReleaseOutside = function()
{
   if(this._currentframe != 3)
   {
      this.gotoAndStop(1);
      this.txt.textColor = normalColor;
   }
};
myListener.OnGame_PaperDoll_AddReputation = function(dataList, _theOther)
{
   if(Number(_theOther) != Number(isTheOther))
   {
      return undefined;
   }
   var _loc5_ = dataList.split("\t");
   if(_loc5_.length != 1)
   {
      container_mc.reputation_mc.dataGuideFd._visible = false;
      var categoryId = Number(_loc5_[0]);
      var _loc10_ = _loc5_[1];
      var subId = Number(_loc5_[2]);
      var _loc7_ = _loc5_[3];
      var _loc6_ = Number(_loc5_[4]);
      var _loc8_ = Number(_loc5_[5]);
      var _loc9_ = Number(_loc5_[6]);
      var _loc15_ = Number(_loc5_[7]);
      var _loc16_ = Number(_loc5_[8]);
      var _loc13_ = Number(_loc5_[9]);
      var _loc11_ = Number(_loc5_[10]);
      var line = container_mc.reputation_mc.list.addData(categoryId,_loc10_,subId,_loc7_,categoryIndex,subIndex);
      container_mc.reputation_mc.list.showCheckBox(questId,0);
      container_mc.reputation_mc.list.useDefaultColor = false;
      container_mc.reputation_mc.list.SUBDEPTH_H = 70;
      if(reputation_arr[container_mc.reputation_mc.list.parentLength] == undefined)
      {
         reputation_arr[container_mc.reputation_mc.list.parentLength] = new Array();
      }
      reputation_arr[container_mc.reputation_mc.list.parentLength].push(line);
      line.hit.onRelease = function()
      {
      };
      var _loc4_ = undefined;
      var _loc3_ = 1;
      line.categoryIds = categoryId;
      line.subIds = subId;
      if(_loc6_ == 0)
      {
         _loc4_ = lib.util.UIString.getUIString("$005015");
         _loc3_ = 2;
         line.str1_data = _loc4_;
         line.str1_num = _loc3_;
      }
      else if(_loc6_ == 1)
      {
         _loc4_ = lib.util.UIString.getUIString("$005016");
         _loc3_ = 2;
         line.str1_data = _loc4_;
         line.str1_num = _loc3_;
      }
      else if(_loc6_ == 2)
      {
         _loc4_ = lib.util.UIString.getUIString("$005017");
         _loc3_ = 2;
         line.str1_data = _loc4_;
         line.str1_num = _loc3_;
      }
      else if(_loc6_ == 3)
      {
         _loc4_ = lib.util.UIString.getUIString("$005018");
         _loc3_ = 1;
         line.str1_data = _loc4_;
         line.str1_num = _loc3_;
      }
      else if(_loc6_ == 4)
      {
         _loc4_ = lib.util.UIString.getUIString("$005019");
         _loc3_ = 1;
         line.str1_data = _loc4_;
         line.str1_num = _loc3_;
      }
      else if(_loc6_ == 5)
      {
         _loc4_ = lib.util.UIString.getUIString("$005020");
         _loc3_ = 1;
         line.str1_data = _loc4_;
         line.str1_num = _loc3_;
      }
      else if(_loc6_ == 6)
      {
         _loc4_ = lib.util.UIString.getUIString("$005021");
         _loc3_ = 3;
         line.str1_data = _loc4_;
         line.str1_num = _loc3_;
      }
      else if(_loc6_ == 7)
      {
         _loc4_ = lib.util.UIString.getUIString("$005022");
         _loc3_ = 3;
         line.str1_data = _loc4_;
         line.str1_num = _loc3_;
      }
      else if(_loc6_ == 8)
      {
         _loc4_ = lib.util.UIString.getUIString("$005023");
         _loc3_ = 3;
         line.str1_data = _loc4_;
         line.str1_num = _loc3_;
      }
      var _loc14_ = _loc4_ + " (" + _loc8_ + "/" + _loc9_ + ")";
      var _loc12_ = "<font color=\'#80e71c\'>" + _loc15_ + "</font>" + "/" + _loc16_;
      line.reputation_gage_txt.setText(_loc14_);
      line.reputation_txt.setText(_loc12_);
      line.reputation_bg_mc.gotoAndStop(_loc3_);
      line.reputation_gage_mc.gotoAndStop(_loc3_);
      line.reputation_mask_mc._width = _loc8_ / _loc9_ * 267;
      line.reputation_check_txt.text = _loc7_;
      line.reputation_check_txt.autoSize = true;
      line.reputation_check_btn.setText(line.reputation_check_txt);
      lib.manager.ToolTip.add(line.reputation_check_txt,categoryId + "\t" + subId + "\t" + "0",6);
      var checked = Number(_loc13_);
      if(isTheOther == undefined || isTheOther == 0)
      {
      }
      line.reputation_check_btn.onEnterFrame = function()
      {
         if(line.reputation_check_btn != undefined)
         {
            line.reputation_check_btn.onEnterFrame = null;
            line.reputation_check_btn.checked = checked;
            lib.manager.ToolTip.add(line.reputation_check_btn,lib.util.UIString.getUIString("$221084"),1);
            if(isTheOther == undefined || isTheOther == 0)
            {
               line.reputation_check_btn.onChanged = function(checks)
               {
                  var _loc2_ = 0;
                  while(_loc2_ < reputation_arr.length)
                  {
                     var _loc1_ = 0;
                     while(_loc1_ < reputation_arr[_loc2_].length)
                     {
                        if(reputation_arr[_loc2_][_loc1_] != line)
                        {
                           reputation_arr[_loc2_][_loc1_].reputation_check_btn.checked = false;
                           reputation_arr[_loc2_][_loc1_].reputation_check_btn.checked = false;
                        }
                        _loc1_ = _loc1_ + 1;
                     }
                     _loc2_ = _loc2_ + 1;
                  }
                  ToGame_PaperDoll_SetCheckReputation(categoryId,subId,checks);
               };
            }
            else
            {
               line.reputation_check_btn.setEnabled(false);
            }
         }
      };
      line.reputation_Icon1.gotoAndStop(_loc11_ + 1);
      lib.manager.ToolTip.add(line.reputation_Icon1,categoryId + "\t" + subId + "\t" + "1",6);
      lib.util.DrawBitmap.draw(line.reputation_Icon2,"img://__Icon_Items.ReputationPointCoin");
      if(temp0 != container_mc.reputation_mc.list.getParent(categoryId))
      {
         tab_list_num0++;
         tab_list_categoty_0.push(tab_list_num0);
         tab_list_categoty_index_0.push(Number(container_mc.reputation_mc.list._data[categoryId].isOpen));
      }
      temp0 = container_mc.reputation_mc.list.getParent(categoryId);
      line._parent._parent.parentDepth.hit.onRelease2 = function(_index0)
      {
         if(tab_list_categoty_index_0[Number(_index0) - 1] == 0)
         {
            tab_list_categoty_index_0[Number(_index0) - 1] = 1;
         }
         else if(tab_list_categoty_index_0[Number(_index0) - 1] == 1)
         {
            tab_list_categoty_index_0[Number(_index0) - 1] = 0;
         }
      };
      container_mc.reputation_mc.reputationScrollbar.pageSize = container_mc.reputation_mc.list._height;
   }
   if(tab_list_categoty_0.length > 0)
   {
      var _loc2_ = 0;
      while(_loc2_ < tab_list_categoty_0.length)
      {
         container_mc.reputation_mc.list.set_selectParentDepth(_loc2_ + 1,tab_list_categoty_index_0[_loc2_]);
         _loc2_ = _loc2_ + 1;
      }
   }
};
myListener.OnGame_PaperDoll_UpdateReputation = function(newData, _theOther)
{
   if(Number(_theOther) != Number(isTheOther))
   {
      return undefined;
   }
   var _loc6_ = null;
   var _loc1_ = null;
   var _loc4_ = newData.split("\t");
   if(_loc4_.length != 1)
   {
      var _loc14_ = Number(_loc4_[0]);
      var _loc9_ = _loc4_[1];
      var _loc15_ = Number(_loc4_[2]);
      var _loc12_ = _loc4_[3];
      _loc6_ = container_mc.reputation_mc.list.getParent(_loc14_);
      _loc1_ = container_mc.reputation_mc.list.getSub(_loc15_);
      var _loc5_ = Number(_loc4_[4]);
      var _loc7_ = Number(_loc4_[5]);
      var _loc8_ = Number(_loc4_[6]);
      var _loc18_ = Number(_loc4_[7]);
      var _loc19_ = Number(_loc4_[8]);
      var _loc16_ = Number(_loc4_[9]);
      var _loc11_ = Number(_loc4_[10]);
      var _loc3_ = undefined;
      var _loc2_ = 1;
      _loc6_.txt.setText(_loc9_);
      _loc1_.reputation_check_txt.htmlText = _loc12_;
      _loc1_.reputation_check_txt.autoSize = true;
      _loc1_.reputation_check_btn.setText(line.reputation_check_txt);
      if(_loc5_ == 0)
      {
         _loc3_ = lib.util.UIString.getUIString("$005015");
         _loc2_ = 2;
         _loc1_.str1_data = _loc3_;
         _loc1_.str1_num = _loc2_;
      }
      else if(_loc5_ == 1)
      {
         _loc3_ = lib.util.UIString.getUIString("$005016");
         _loc2_ = 2;
         _loc1_.str1_data = _loc3_;
         _loc1_.str1_num = _loc2_;
      }
      else if(_loc5_ == 2)
      {
         _loc3_ = lib.util.UIString.getUIString("$005017");
         _loc2_ = 2;
         _loc1_.str1_data = _loc3_;
         _loc1_.str1_num = _loc2_;
      }
      else if(_loc5_ == 3)
      {
         _loc3_ = lib.util.UIString.getUIString("$005018");
         _loc2_ = 1;
         _loc1_.str1_data = _loc3_;
         _loc1_.str1_num = _loc2_;
      }
      else if(_loc5_ == 4)
      {
         _loc3_ = lib.util.UIString.getUIString("$005019");
         _loc2_ = 1;
         _loc1_.str1_data = _loc3_;
         _loc1_.str1_num = _loc2_;
      }
      else if(_loc5_ == 5)
      {
         _loc3_ = lib.util.UIString.getUIString("$005020");
         _loc2_ = 1;
         _loc1_.str1_data = _loc3_;
         _loc1_.str1_num = _loc2_;
      }
      else if(_loc5_ == 6)
      {
         _loc3_ = lib.util.UIString.getUIString("$005021");
         _loc2_ = 3;
         _loc1_.str1_data = _loc3_;
         _loc1_.str1_num = _loc2_;
      }
      else if(_loc5_ == 7)
      {
         _loc3_ = lib.util.UIString.getUIString("$005022");
         _loc2_ = 3;
         _loc1_.str1_data = _loc3_;
         _loc1_.str1_num = _loc2_;
      }
      else if(_loc5_ == 8)
      {
         _loc3_ = lib.util.UIString.getUIString("$005023");
         _loc2_ = 3;
         _loc1_.str1_data = _loc3_;
         _loc1_.str1_num = _loc2_;
      }
      var _loc17_ = _loc3_ + " (" + _loc7_ + "/" + _loc8_ + ")";
      var _loc13_ = "<font color=\'#80e71c\'>" + _loc18_ + "</font>" + "/" + _loc19_;
      _loc1_.reputation_gage_txt.setText(_loc17_);
      _loc1_.reputation_txt.setText(_loc13_);
      _loc1_.reputation_bg_mc.gotoAndStop(_loc2_);
      _loc1_.reputation_gage_mc.gotoAndStop(_loc2_);
      _loc1_.reputation_mask_mc._width = _loc7_ / _loc8_ * 267;
      var _loc10_ = Number(_loc16_);
      _loc1_.reputation_check_btn.checked = _loc10_;
      _loc1_.reputation_Icon1.gotoAndStop(_loc11_ + 1);
   }
};
myListener.OnGame_PaperDoll_DeleteReputation = function(_theOther)
{
   if(Number(_theOther) != Number(isTheOther))
   {
      return undefined;
   }
   container_mc.reputation_mc.dataGuideFd._visible = true;
   var _loc1_ = container_mc.reputation_mc;
   _loc1_.list.clear();
   _loc1_.reputationScrollbars.pageSize = 0;
   reputation_arr = new Array();
};
myListener.OnGame_PaperDoll_SingleDeleteReputation = function(index, _theOther)
{
   if(Number(_theOther) != Number(isTheOther))
   {
      return undefined;
   }
   var _loc1_ = container_mc.reputation_mc;
   _loc1_.list.removeData(index);
   if(reputation_arr.length == 0)
   {
      container_mc.reputation_mc.dataGuideFd._visible = true;
   }
};
myListener.OnGame_PaperDoll_PartyRaidIndunBtnVisible = function(flag, _theOther)
{
   if(Number(_theOther) != Number(isTheOther))
   {
      return undefined;
   }
   if(flag == 1)
   {
      PartyRaid_indunResetBtn = true;
      container_mc.indunResetBtn.setEnabled(false);
   }
   else
   {
      PartyRaid_indunResetBtn = false;
      container_mc.indunResetBtn.setEnabled(true);
   }
};
myListener.OnGame_PaperDoll_LengthLocal = function(lengthnum)
{
   NameTextLength_Local = lengthnum;
};
myListener.OnGame_PaperDoll_SetEnableIndunResetBtn = function(_state)
{
   indunResetBtn.setEnabled(Number(_state));
};
myListener.OnGame_PaperDoll_SetDisablePKPoint = function()
{
   container_mc.PKPoint._alpha = 0;
};
var indunResetBtn = container_mc.indunResetBtn.txtBtn;
indunResetBtn.setEnabled(false);
indunResetBtn.setRelease(ToGame_CharacterWindow_InitDungeon);
indunResetBtn.setVisible(false);
myListener.OnGame_PaperDoll_SetItemSet = function(index, _state, _theOther)
{
   if(Number(_theOther) != Number(isTheOther))
   {
      return undefined;
   }
   if(Number(_theOther) == 1)
   {
      setSaveBtn.setVisible(false);
   }
   var _loc1_ = container_mc.setItemMc["btn" + index];
   _loc1_.setState(_state);
   var _loc3_ = _loc1_.keyStr;
   var _loc2_ = "";
   if(_loc1_.state == 0)
   {
      _loc2_ = lib.util.UIString.getUIString("$102173") + _loc3_;
   }
   else if(_loc1_.state > 0)
   {
      _loc2_ = "[" + index + "] " + lib.util.UIString.getUIString("$102172") + _loc3_;
   }
   lib.manager.ToolTip.add(_loc1_,_loc2_,1);
};
myListener.OnGame_PaperDoll_SetEnableItemSet = function(enable, _theOther)
{
   if(Number(_theOther) != Number(isTheOther))
   {
      return undefined;
   }
   enable = Number(enable);
   enableItemSet = enable;
   var _loc1_ = 1;
   while(_loc1_ <= 5)
   {
      var _loc2_ = container_mc.setItemMc["btn" + _loc1_];
      _loc2_.hitTestDisable = !enable;
      _loc1_ = _loc1_ + 1;
   }
};
myListener.OnGame_PaperDoll_SetItemSetBtnKey = function(index, keycode)
{
   if(Number(isTheOther))
   {
      return undefined;
   }
   var _loc2_ = "";
   if(keycode != undefined && keycode != 0 && keycode != "")
   {
      _loc2_ = " (" + lib.info.KeyMap.toKeyCode(keycode) + ")";
   }
   var _loc3_ = "";
   var _loc1_ = container_mc.setItemMc["btn" + index];
   _loc1_.keyStr = _loc2_;
   if(_loc1_.state == 0)
   {
      _loc3_ = lib.util.UIString.getUIString("$102173") + _loc2_;
   }
   else if(_loc1_.state > 0)
   {
      _loc3_ = "[" + index + "] " + lib.util.UIString.getUIString("$102172") + _loc2_;
   }
   lib.manager.ToolTip.add(_loc1_,_loc3_,1);
};
myListener.OnGame_PaperDoll_SetEnableItemSetSaveBtn = function(enable)
{
   if(Number(isTheOther))
   {
      return undefined;
   }
   enable = Number(enable);
   setSaveBtn.setEnabled(enable);
};
myListener.OnGame_PaperDoll_SetEnableItemSetSlot = function(enable, disable)
{
   _enable = enable;
   _disable = disable;
   if(disable == 1)
   {
      container_mc.setItemMc.visibleBtn.gotoAndStop(1);
   }
   else
   {
      container_mc.setItemMc.visibleBtn.gotoAndStop(2);
   }
   if(enable == 1)
   {
      container_mc.setItemMc.visibleBtn.visibleBtn.gotoAndStop(4);
   }
   else
   {
      container_mc.setItemMc.visibleBtn.visibleBtn.gotoAndStop(1);
   }
   container_mc.setItemMc.visibleBtn.visibleBtn.onRollOver = function()
   {
      if(enable != 1)
      {
         this.gotoAndStop(2);
         if(disable == 0)
         {
            lib.manager.ToolTip.add(container_mc.setItemMc.visibleBtn.visibleBtn,"$221081",1);
         }
         else
         {
            lib.manager.ToolTip.add(container_mc.setItemMc.visibleBtn.visibleBtn,"$221080",1);
         }
      }
   };
   container_mc.setItemMc.visibleBtn.visibleBtn.onRollOut = function()
   {
      if(enable != 1)
      {
         this.gotoAndStop(1);
      }
   };
   container_mc.setItemMc.visibleBtn.visibleBtn.onPress = function()
   {
      if(enable != 1)
      {
         this.gotoAndStop(3);
      }
   };
   container_mc.setItemMc.visibleBtn.visibleBtn.onRelease = function()
   {
      if(enable != 1)
      {
         this.gotoAndStop(1);
         if(_disable == 1)
         {
            _disable = 0;
         }
         else
         {
            _disable = 1;
         }
         myListener.OnGame_PaperDoll_SetEnableItemSetSlot(_enable,_disable);
         ToGame_PaperDoll_SetEnableItemSetSlot(_disable);
      }
   };
};
myListener.OnGame_PaperDoll_UpdateStyleSlot = function(partsList, _theOther)
{
   if(Number(_theOther) != Number(isTheOther))
   {
      return undefined;
   }
   clearItemSlot2();
   var _loc7_ = partsList.split("\n");
   var _loc8_ = _loc7_.length;
   var _loc4_ = 0;
   while(_loc4_ < _loc8_)
   {
      var _loc2_ = _loc7_[_loc4_].split("\t");
      if(_loc2_.length != 1)
      {
         var _loc3_ = _loc2_[0];
         var _loc5_ = _loc2_[1];
         var _loc1_ = dataName + _loc3_;
         container_mc[_loc1_].Icon._visible = true;
         container_mc[_loc1_].id = _loc3_;
         lib.util.DrawBitmap.draw(container_mc[_loc1_].Icon,_loc5_,50,50);
         container_mc[_loc1_].grade = _loc2_[2];
         container_mc[_loc1_].sealType = _loc2_[3];
         container_mc[_loc1_].masterpiece = _loc2_[4];
         var _loc6_ = Number(_loc2_[5]);
         if(_loc6_)
         {
            container_mc[_loc1_].enchantFd._visible = true;
         }
         UI["_stylesloteffect_" + [_loc3_ - 100]] = true;
         container_mc["stylesloteffect_" + [_loc3_ - 100]]._visible = true;
         lib.manager.ToolTip.add(container_mc[_loc1_].SLOT,_loc3_,6,container_mc[_loc1_].Icon);
         container_mc[_loc1_].bHaveItem = true;
      }
      _loc4_ = _loc4_ + 1;
   }
};
myListener.OnGame_PaperDoll_DisableStyleSlot = function(slotIndex, _theOther)
{
   if(Number(_theOther) != Number(isTheOther))
   {
      return undefined;
   }
   var _loc1_ = container_mc[dataName + slotIndex];
   _loc1_.clear();
   lib.manager.ToolTip.add(_loc1_.SLOT,itemStyleToolTipString[slotIndex - 100],1);
   _loc1_.bHaveItem = false;
   _loc1_.SLOT.enabled = !isTheOther;
   _loc1_.SLOT.enabled = false;
   _loc1_.FX_IMPOSSIBLE._visible = true;
   UI["_stylesloteffect_" + [slotIndex - 100]] = false;
   container_mc["stylesloteffect_" + [slotIndex - 100]]._visible = false;
};
var coolTimeManager = lib.util.CoolTimeManger.getInstance();
myListener.OnGame_PaperDoll_SetCoolTime = function(slotIndex, remain, total)
{
   targetName = dataName + Number(slotIndex);
   remain = Number(remain);
   total = Number(total);
   var pMc = container_mc[targetName];
   var iconName = container_mc[targetName].iconName;
   var _loc2_ = pMc["coolAniMc" + slotIndex];
   if(remain <= 0 || total <= 0)
   {
      if(_loc2_.coolTime != undefined)
      {
         coolTimeManager.removeCoolTimeInstance(_loc2_);
         var _loc3_ = pMc.attachMovie("effect_standby","effect_standby" + slotIndex,pMc.getNextHighestDepth());
         _loc3_._x = 1;
         _loc3_._y = 1;
         lib.util.DrawBitmap.makeMcAndDraw(_loc3_.a_mc,iconName,50,50);
         lib.util.DrawBitmap.makeMcAndDraw(_loc3_.b_mc,iconName,50,50);
         lib.util.DrawBitmap.makeMcAndDraw(_loc3_.c_mc,iconName,50,50);
         _loc2_.removeMovieClip();
      }
   }
   else
   {
      if(_loc2_ == undefined)
      {
         _loc2_ = pMc.attachMovie("coolTime_ani","coolAniMc" + slotIndex,pMc.getNextHighestDepth());
         _loc2_.iconName = iconName;
         _loc2_._x = pX + 1;
         _loc2_._y = pY + 1;
         _loc2_.hitTestDisable = true;
         _loc2_.onFinished = function()
         {
            var _loc2_ = pMc.attachMovie("effect_standby","effect_standby" + slotIndex,pMc.getNextHighestDepth());
            _loc2_._x = this._x;
            _loc2_._y = this._y;
            lib.util.DrawBitmap.makeMcAndDraw(_loc2_.a_mc,this.iconName,50,50);
            lib.util.DrawBitmap.makeMcAndDraw(_loc2_.b_mc,this.iconName,50,50);
            lib.util.DrawBitmap.makeMcAndDraw(_loc2_.c_mc,this.iconName,50,50);
         };
      }
      _loc2_.setCoolTime(remain,total);
      coolTimeManager.addCoolTimeInstance(_loc2_);
   }
};
container_mc.comboBox.onChanged = function(This, selected, selectedIndex)
{
   ToGame_PaperDoll_SelectTitle(selected);
};
container_mc.comboBox.rowMax = 10;
myListener.OnGame_PaperDoll_SetTitleInfo = function(_titleData, _selectedIndex)
{
   var _loc11_ = [];
   var _loc4_ = lib.util.ExtString.split(_titleData,"\n");
   _selectedIndex = Number(_selectedIndex);
   var _loc12_ = 0;
   if(_loc4_[_loc4_.length - 1] == "undefined" || _loc4_[_loc4_.length - 1] == "")
   {
      _loc4_.splice(_loc4_.length - 1,1);
   }
   var _loc13_ = lib.util.UIString.getUIString("$221159");
   _loc11_.push({label:_loc13_,id:0,enable:1});
   var _loc1_ = 0;
   while(_loc1_ < _loc4_.length)
   {
      var _loc2_ = lib.util.ExtString.split(_loc4_[_loc1_],"\t");
      var _loc3_ = Number(_loc2_[0]);
      var _loc5_ = _loc2_[1];
      var _loc6_ = Number(_loc2_[2]);
      if(_selectedIndex != NaN && _selectedIndex == _loc3_)
      {
         _loc12_ = _loc1_ + 1;
      }
      _loc11_.push({label:_loc5_,id:_loc3_,enable:_loc6_});
      _loc1_ = _loc1_ + 1;
   }
   container_mc.comboBox.data = _loc11_;
   container_mc.comboBox.setSelectedId(_loc11_[_loc12_].id);
   setComboBoxListener();
};
myListener.OnGame_PaperDoll_SetVIP = function(basicPack, addPack)
{
   container_mc.vip_mc.dataGuideFd._visible = true;
   vipscrollBar.scroll = 0;
   vipscrollBar.pageSize = 0;
   for(var _loc3_ in container_mc.vip_mc.listMc)
   {
      container_mc.vip_mc.listMc[_loc3_].removeMovieClip();
   }
   if(basicPack == undefined || basicPack == "")
   {
      return undefined;
   }
   container_mc.vip_mc.dataGuideFd._visible = false;
   var _loc24_ = container_mc.vip_mc.list;
   var _loc11_ = lib.util.ExtString.split(basicPack,"\t");
   var _loc18_ = _loc11_[0];
   var _loc23_ = _loc11_[1];
   var _loc14_ = _loc11_[2];
   var _loc17_ = _loc11_[3];
   var _loc16_ = Number(_loc11_[4]);
   var _loc15_ = Number(_loc11_[5]);
   var _loc19_ = _loc11_[6];
   var _loc20_ = _loc11_[7];
   if(_loc14_ == undefined || _loc14_ == "")
   {
      return undefined;
   }
   var _loc5_ = container_mc.vip_mc.listMc.attachMovie("basicPack","line0",container_mc.vip_mc.listMc.getNextHighestDepth());
   _loc5_._x = 0;
   _loc5_._y = 0;
   lib.util.DrawBitmap.draw(_loc5_.slot,_loc14_,64,64);
   lib.manager.ToolTip.add(_loc5_.slot,_loc18_,6);
   _loc5_.titleMc.txt.htmlText = _loc23_;
   _loc5_.gradeTxt.htmlText = _loc17_;
   var _loc21_ = _loc16_ / _loc15_ * 100;
   _loc5_.pointbarMc.txt.text = _loc16_ + "/" + _loc15_;
   _loc5_.pointbarMc.barMc._xscale = _loc21_;
   _loc5_.pointbarMc._x = _loc5_.gradeTxt._x + _loc5_.gradeTxt.textWidth + 20;
   _loc5_.pointbarMc._visible = _loc15_ != 0;
   _loc5_.remainTimeTxt.setText(_loc19_);
   _loc5_.descTxt.htmlText = _loc20_;
   _loc5_.descTxt._height = _loc5_.descTxt.textHeight + 8;
   var _loc12_ = lib.util.ExtString.split(addPack,"\n");
   var _loc13_ = _loc12_.length;
   var _loc10_ = _loc5_._height;
   _loc3_ = 0;
   while(_loc3_ < _loc13_)
   {
      var _loc2_ = lib.util.ExtString.split(_loc12_[_loc3_],"\t");
      var _loc9_ = _loc2_[0];
      var _loc7_ = _loc2_[1];
      var _loc4_ = _loc2_[2];
      var _loc8_ = _loc2_[3];
      var _loc6_ = _loc2_[4];
      if(_loc4_ == undefined || _loc4_ == "")
      {
         return undefined;
      }
      var _loc1_ = container_mc.vip_mc.listMc.attachMovie("addPack","line" + (_loc3_ + 1),container_mc.vip_mc.listMc.getNextHighestDepth());
      _loc1_._x = 0;
      _loc1_._y = _loc10_ + 15;
      lib.util.DrawBitmap.draw(_loc1_.slot,_loc4_,64,64);
      lib.manager.ToolTip.add(_loc1_.slot,_loc9_,6);
      _loc1_.titleMc.txt.htmlText = _loc7_;
      _loc1_.remainTimeTxt.setText(_loc8_);
      _loc1_.descTxt.htmlText = _loc6_;
      _loc1_.descTxt._height = _loc1_.descTxt.textHeight + 8;
      _loc10_ = _loc10_ + _loc1_._height;
      _loc3_ = _loc3_ + 1;
   }
   vipscrollBar.pageSize = container_mc.vip_mc.listMc._height;
};
var vipscrollBar = container_mc.vip_mc.vipScrollbar;
var vipY = container_mc.vip_mc.listMc._y;
var vipScrollListner = {};
vipscrollBar.addListener(vipScrollListner);
vipscrollBar.setWheel(container_mc.vip_mc.listMc);
vipscrollBar.pageSize = container_mc.vip_mc.listMc._height;
vipscrollBar.displaySize = container_mc.vip_mc.mask_mc._height;
vipscrollBar.rowHeight = 26;
vipScrollListner.onScroll = function()
{
   lib.Debuger.trace("vipScrollListner.onScroll   " + arguments[0]);
   container_mc.vip_mc.listMc._y = vipY - arguments[0];
};
myListener.OnGame_PaperDoll_SetStyleRune = function(index, rune)
{
   var _loc1_ = container_mc[dataName + index];
   _loc1_.clear();
   if(rune == "-1")
   {
      _loc1_.FX_IMPOSSIBLE._visible = true;
      lib.manager.ToolTip.add(_loc1_.SLOT,runeToolTipStr,1);
      return undefined;
   }
   if(rune == "0")
   {
      lib.manager.ToolTip.add(_loc1_.SLOT,runeToolTipStr,1);
      return undefined;
   }
   var _loc2_ = lib.util.ExtString.split(rune,"\t");
   var _loc3_ = _loc2_[0];
   var _loc5_ = Number(_loc2_[1]);
   _loc1_.draw(_loc3_,50,50);
   _loc1_.grade = _loc5_;
   lib.manager.ToolTip.add(_loc1_.SLOT,index,6,_loc1_.Icon);
};
lib.manager.ToolTip.add(container_mc.setItemMc.saveBtn,lib.util.UIString.getUIString("$102174"),1);
var i = 1;
while(i <= 5)
{
   var btn = container_mc.setItemMc["btn" + i];
   btn.index = i;
   btn.state = 0;
   btn.keyStr = "";
   btn.onRollOver = function()
   {
      if(this.state != 2)
      {
         this.gotoAndStop(2);
      }
   };
   btn.onRollOut = btn.onReleaseOutside = function()
   {
      if(this.state == 1)
      {
         this.gotoAndStop(1);
      }
      else if(this.state == 0)
      {
         this.gotoAndStop(5);
      }
   };
   btn.onPress = function()
   {
      lib.manager.UISound.play(lib.manager.UISound.MAIN_BTN);
      if(this.state != 2)
      {
         this.gotoAndStop(3);
      }
   };
   btn.onRelease = function()
   {
      if(this.state == 1)
      {
         this.gotoAndStop(4);
      }
      ToGame_PaperDoll_RequestItemSet(this.index);
   };
   btn.setState = function(s)
   {
      this.state = s;
      if(s == 0)
      {
         this.gotoAndStop(5);
      }
      if(s == 1)
      {
         this.gotoAndStop(1);
      }
      if(s == 2)
      {
         this.gotoAndStop(4);
      }
   };
   var keystr = btn.keyStr;
   var tooltipstr = "";
   if(btn.state == 0)
   {
      tooltipstr = lib.util.UIString.getUIString("$102173") + keystr;
   }
   else if(btn.state > 0)
   {
      tooltipstr = "[" + index + "] " + lib.util.UIString.getUIString("$102172") + keystr;
   }
   lib.manager.ToolTip.add(btn,tooltipstr,1);
   i++;
}
var setSaveBtn = new lib.util.TxtBtn(container_mc.setItemMc.saveBtn);
setSaveBtn.setRelease(ToGame_PaperDoll_SaveItemSet);
tab2.setRelease(release2);
tab2.setTab(0,1);
var selectedBottomTab = null;
var normalColor = 6915227;
var overColor = 10010078;
var pressColor = 13034751;
var releaseColor = 13034751;
var txtY = 7;
var i = 0;
while(i < 5)
{
   var bottomTab = container_mc["tab_btn" + i];
   bottomTab.index = i;
   bottomTab.onRollOver = function()
   {
      if(selectedBottomTab != this.index)
      {
         this.gotoAndStop(2);
         this.txt.textColor = overColor;
      }
   };
   bottomTab.onRollOut = bottomTab.onReleaseOutside = function()
   {
      if(selectedBottomTab != this.index)
      {
         this.gotoAndStop(1);
         this.txt.textColor = normalColor;
         this.txt._y = txtY;
      }
   };
   bottomTab.onPress = function()
   {
      lib.manager.UISound.play(lib.manager.UISound.MAIN_BTN);
      if(selectedBottomTab != this.index)
      {
         this.gotoAndStop(3);
         this.txt.textColor = pressColor;
         this.txt._y = txtY + 1;
      }
   };
   bottomTab.onRelease = function()
   {
      if(selectedBottomTab != this.index)
      {
         var _loc2_ = container_mc["tab_btn" + selectedBottomTab];
         _loc2_.gotoAndStop(1);
         _loc2_.txt.textColor = normalColor;
         _loc2_.txt._y = txtY;
         this.gotoAndStop(3);
         this.txt.textColor = pressColor;
         this.txt._y = txtY;
         selectedBottomTab = this.index;
         tab_currentPage = selectedBottomTab;
         setStatus(this.index);
      }
   };
   i++;
}
container_mc.tab_btn0.onRelease();
indunResetBtn.setEnabled(false);
myListener.OnGame_PaperDoll_SetEnableItemSetSlot(0,0);
container_mc.PaperDoll__1.trackAsMenu = true;
container_mc.PaperDoll__15.trackAsMenu = true;
