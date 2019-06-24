function release(num, type)
{
   ToGame_GuildList_ChangeTab(tab.activedNum,type);
}
function ToGame_GuildList_ChangeTab(TabNo, type)
{
   if(tabNum == TabNo)
   {
      return undefined;
   }
   if(tabNum != -1 && type == 0)
   {
      getURL("FSCommand:ToGame_GuildList_ChangeTab",TabNo);
   }
   tabNum = TabNo;
   container_mc.searchMc._visible = "0" == TabNo;
   container_mc.rankMc._visible = "1" == TabNo;
   container_mc.cityWarMc._visible = "2" == TabNo;
   container_mc.warMc._visible = "3" == TabNo;
   ScountClose();
   SetDetailClose();
   container_mc.searchMc.tabBtn._visible = true;
}
function release2(num, type)
{
   ToGame_GuildList_ChangeSubTab(subTab.activedNum,type);
}
function ToGame_GuildList_ChangeSubTab(TabNo, type)
{
   if(subTabNum == TabNo)
   {
      return undefined;
   }
   if(tabNum != -1 && type == 0)
   {
      getURL("FSCommand:ToGame_GuildList_ChangeSubTab",TabNo);
   }
   subTabNum = TabNo;
   container_mc.searchMc.detailInfoMc._visible = false;
   container_mc.searchMc.mc0._visible = "0" == TabNo;
   container_mc.searchMc.mc1._visible = "1" == TabNo;
   container_mc.searchMc.mc2._visible = "2" == TabNo;
}
function setRankListInfo(target, lineData)
{
   var _loc2_ = lib.util.ExtString.split(lineData,"\t");
   var _loc10_ = Number(_loc2_[0]);
   var _loc3_ = Number(_loc2_[1]);
   var _loc4_ = Number(_loc2_[2]);
   var _loc18_ = _loc2_[3];
   var _loc11_ = _loc2_[4];
   var _loc8_ = _loc2_[5];
   var _loc17_ = Number(_loc2_[6]);
   var _loc12_ = Number(_loc2_[7]);
   var _loc19_ = Number(_loc2_[8]);
   var _loc14_ = _loc2_[9];
   var _loc13_ = Boolean(Number(_loc2_[11]));
   var _loc9_ = _loc2_[12];
   var _loc5_ = "";
   if(_loc4_ == 0)
   {
      _loc4_ = "";
   }
   if(_loc3_ == 3)
   {
      _loc5_ = "<img src=\'" + rankImg[_loc3_] + "\' vspace=\'-1\'>";
   }
   else
   {
      _loc5_ = "<img src=\'" + rankImg[_loc3_] + "\' vspace=\'-1\'>" + _loc4_;
   }
   target.rankMc.gotoAndStop(Number(_loc3_) + 1);
   target.rankFd.htmlText = _loc10_;
   target.rankMc.txt.htmlText = _loc5_;
   target.guildNameFd.setText(_loc11_);
   target.guildMasterFd.text = _loc8_;
   target.guildLevelFd.text = _loc17_;
   target.guildMemberFd.text = _loc12_;
   target.guildCreateFd.text = _loc14_;
   lib.util.DrawBitmap.draw(target.img,_loc18_,48,48);
   var _loc15_ = _loc19_ + 1 + Number(StyleType * 8);
   target.mc.gotoAndStop(_loc15_);
   lib.manager.ToolTip.add(target.mc.checkHit0,styleArr[0],1);
   lib.manager.ToolTip.add(target.mc.checkHit1,styleArr[1],1);
   lib.manager.ToolTip.add(target.mc.checkHit2,styleArr[Number(StyleType + 2)],1);
   if(_loc13_)
   {
      target.rankFd.textColor = "0x4FB359";
      target.guildNameFd.textColor = "0x4FB359";
      target.guildMasterFd.textColor = "0x4FB359";
      target.guildLevelFd.textColor = "0x4FB359";
      target.guildMemberFd.textColor = "0x4FB359";
      target.guildCreateFd.textColor = "0x4FB359";
   }
   if(_loc9_ != "0")
   {
      var _loc6_ = target.attachMovie("crown","crown",target.getNextHighestDepth());
      var _loc16_ = target.guildNameFd.textWidth;
      _loc6_._x = target.guildNameFd._x + _loc16_;
      var _loc7_ = _loc2_[10];
      if(_loc7_ != "" && _loc7_ != undefined)
      {
         lib.manager.ToolTip.add(_loc6_,_loc7_,1);
      }
      else
      {
         lib.manager.ToolTip.remove(_loc6_);
      }
   }
}
function clearContainer(container, prefix, count)
{
   var _loc1_ = 0;
   while(_loc1_ < count)
   {
      var _loc2_ = container[prefix + _loc1_];
      if(undefined != _loc2_)
      {
         _loc2_.removeMovieClip();
      }
      _loc1_ = _loc1_ + 1;
   }
}
function setCityWarListInfo(target, lineData)
{
   var _loc2_ = lib.util.ExtString.split(lineData,"\t");
   var _loc7_ = Number(_loc2_[0]);
   var _loc16_ = _loc2_[1];
   var _loc8_ = _loc2_[2];
   var _loc5_ = _loc2_[3];
   var _loc15_ = Number(_loc2_[4]);
   var _loc10_ = Number(_loc2_[5]);
   var _loc17_ = Number(_loc2_[6]);
   var _loc9_ = Number(_loc2_[7]);
   var _loc14_ = Number(_loc2_[8]);
   var _loc12_ = _loc2_[9];
   var _loc11_ = Boolean(Number(_loc2_[10]));
   var _loc6_ = Number(_loc2_[11]);
   target.rankFd.text = _loc7_;
   target.guildNameFd.setText(_loc8_);
   target.guildMasterFd.text = _loc5_;
   target.guildLevelFd.text = _loc15_;
   target.guildMemberFd.text = _loc10_;
   target.destroyFd.text = _loc17_;
   target.killFd.text = _loc9_;
   target.deathFd.text = _loc14_;
   target.destroyedDateFd.text = _loc12_;
   lib.util.DrawBitmap.draw(target.img,_loc16_,48,48);
   if(_loc11_)
   {
      var _loc18_ = "0x4FB359";
      target.rankFd.textColor = "0x4FB359";
      target.guildNameFd.textColor = "0x4FB359";
      target.guildMasterFd.textColor = "0x4FB359";
      target.guildLevelFd.textColor = "0x4FB359";
      target.guildMemberFd.textColor = "0x4FB359";
      target.destroyFd.textColor = "0x4FB359";
      target.killFd.textColor = "0x4FB359";
      target.deathFd.textColor = "0x4FB359";
      target.destroyedDateFd.textColor = "0x4FB359";
   }
   if(_loc6_ != "0")
   {
      var _loc3_ = target.attachMovie("crown","crown",target.getNextHighestDepth());
      var _loc13_ = target.guildNameFd.textWidth;
      _loc3_._x = target.guildNameFd._x + _loc13_;
      var _loc4_ = _loc2_[12];
      if(_loc4_ != "" && _loc4_ != undefined)
      {
         lib.manager.ToolTip.add(_loc3_,_loc4_,1);
      }
      else
      {
         lib.manager.ToolTip.remove(_loc3_);
      }
   }
}
function cityWarDateComboInit()
{
   cityWarContainer.dateCombo.data = [{label:"",id:undefined}];
   cityWarContainer.dateCombo.setEnabled(false);
}
function ToGame_GuildList_Init()
{
   fscommand("ToGame_GuildList_Init");
}
function ToGame_GuildList_CloseUI()
{
   fscommand("ToGame_GuildList_CloseUI");
}
function ToGame_GuildList_RequestChangeCityWarDate(dateId, dateIndex)
{
   if(selectedDateIndex == dateIndex)
   {
      return undefined;
   }
   selectedDateIndex = dateIndex;
   getURL("FSCommand:ToGame_GuildList_RequestChangeCityWarDate",dateId);
}
function ToGame_GuildList_SelectedCity(_id)
{
   getURL("FSCommand:ToGame_GuildList_SelectedCity",_id);
}
function setGuildWarListInfo(target, lineData)
{
   var _loc1_ = lib.util.ExtString.split(lineData,"\t");
   var _loc3_ = _loc1_[0];
   var _loc11_ = _loc1_[1];
   var _loc6_ = _loc1_[2];
   var _loc5_ = _loc1_[3];
   var _loc8_ = _loc1_[4];
   var _loc4_ = Number(_loc1_[5]);
   var _loc9_ = lib.util.UIString.getUIString("$123274","guildName",_loc6_);
   var _loc7_ = lib.util.UIString.getUIString("$123275","guildName",_loc8_);
   var _loc10_ = GUILD_WAR_EVENT_STRING[_loc4_];
   target.timeTF.text = _loc3_;
   target.guildNameTF.setText(_loc9_);
   target.targetGuildNameTF.setText(_loc7_);
   target.eventTF.htmlText = _loc10_;
   lib.util.DrawBitmap.draw(target.guildImg,_loc11_,48,48);
   lib.util.DrawBitmap.draw(target.targetGuildImg,_loc5_,48,48);
}
function SetPageEvent(currentPage, totalPages)
{
   if(totalPages == "0" || currentPage == "0")
   {
      container_mc.pageMc._visible = false;
      container_mc.pageBg._visible = false;
      return undefined;
   }
   container_mc.pageMc.setPage(Number(currentPage),Number(totalPages));
   container_mc.pageMc._visible = true;
   container_mc.pageBg._visible = true;
}
function SearchListLine(idx, gLData)
{
   var _loc2_ = parentMc_Search0.listBox.attachMovie("line2","line" + idx,idx);
   _loc2_._y = LINE_H * idx;
   _loc2_.index = idx;
   _loc2_.id = gLData[0];
   var _loc5_ = Number(idx) % 2 + 1;
   _loc2_.bg.gotoAndStop(_loc5_);
   _loc2_.bg._height = _loc2_.hit._height = LINE_H;
   _loc2_.txt0.setText(gLData[1]);
   lib.util.DrawBitmap.draw(_loc2_.img,gLData[2],48,48);
   _loc2_.txt1.setText(gLData[4]);
   var _loc6_ = Number(gLData[5]) + 1 + Number(StyleType * 8);
   _loc2_.mc.gotoAndStop(_loc6_);
   lib.manager.ToolTip.add(_loc2_.mc.checkHit0,styleArr[0],1);
   lib.manager.ToolTip.add(_loc2_.mc.checkHit1,styleArr[1],1);
   lib.manager.ToolTip.add(_loc2_.mc.checkHit2,styleArr[Number(StyleType + 2)],1);
   _loc2_.txt2.text = gLData[6] + "~" + gLData[7];
   _loc2_.txt3.text = guildInviteArr[Number(gLData[8])];
   _loc2_.overMc.onRelease = function()
   {
      SetDetailOpen(this._parent.id,0);
   };
   if(gLData[9])
   {
      lib.manager.ToolTip.add(_loc2_.overMc,gLData[9],1);
   }
   else
   {
      lib.manager.ToolTip.remove(_loc2_.overMc);
   }
}
function SearchListLine2(idx, gLData)
{
   var lineMc = parentMc_Search1.listBox.attachMovie("line3","line" + idx,idx);
   lineMc._y = LINE_H2 * idx;
   lineMc.index = idx;
   lineMc.id = gLData[0];
   var _loc6_ = Number(idx) % 2 + 1;
   lineMc.bg.gotoAndStop(_loc6_);
   lineMc.txt0.setText(gLData[1]);
   lineMc.txt1.setText(gLData[2]);
   lineMc.txt2.setText(gLData[3]);
   var _loc7_ = Number(gLData[4]) + 1 + Number(StyleType * 8);
   lineMc.mc.gotoAndStop(_loc7_);
   lib.manager.ToolTip.add(lineMc.mc.checkHit0,styleArr[0],1);
   lib.manager.ToolTip.add(lineMc.mc.checkHit1,styleArr[1],1);
   lib.manager.ToolTip.add(lineMc.mc.checkHit2,styleArr[Number(StyleType + 2)],1);
   lineMc.txt3.text = guildSizeArr[Number(gLData[5])];
   lineMc.txt4.text = gLData[6];
   var _loc2_ = new lib.util.TxtBtn(lineMc.btn.btn,lineMc.btn.txt);
   _loc2_.setRelease(function()
   {
      ToGame_GuildList_ScoutListClick(lineMc.id);
   }
   );
   _loc2_.setTextColor("0xcccccc","0xffffff","0xcccccc","0x666666");
   if(gLData[7] == "-1")
   {
      _loc2_.setEnabled(false);
      lineMc.btn.txt.text = "$123171";
      lineMc.btn.txt.textColor = "0x666666";
   }
   else
   {
      var _loc5_ = Boolean(Number(gLData[7]));
      _loc2_.setEnabled(_loc5_);
      if(_loc5_)
      {
         lineMc.btn.txt.text = "$123172";
      }
      else
      {
         lineMc.btn.txt.text = "$123173";
      }
   }
   var _loc4_ = gLData[8];
   if(_loc4_ != "undefined" && _loc4_ != "")
   {
      lib.manager.ToolTip.add(lineMc.overMc,gLData[8],1);
   }
   else
   {
      lib.manager.ToolTip.add(lineMc.overMc,"$123174",1);
   }
}
function ToGame_GuildList_ScoutListClick(id)
{
   getURL("FSCommand:ToGame_GuildList_ScoutListClick",id);
}
function ScountOpen()
{
   parentMc_Search1.scoutMc._visible = true;
   parentMc_Search1.btmMc._visible = false;
   parentMc_Search1.sortMc._visible = false;
   parentMc_Search1.listBox._visible = false;
   parentMc_Search1.scoutMc.comboBox0.selectedIndex = 0;
   parentMc_Search1.scoutMc.checkBox0.checked = true;
   parentMc_Search1.scoutMc.checkBox1.checked = true;
   parentMc_Search1.scoutMc.checkBox2.checked = true;
   parentMc_Search1.scoutMc.checkBox0.gotoAndStop(1);
   parentMc_Search1.scoutMc.checkBox1.gotoAndStop(1);
   parentMc_Search1.scoutMc.checkBox2.gotoAndStop(1);
   parentMc_Search1.scoutMc.txtLenCheck2.text = "0/" + ScountTextLength_Local;
   container_mc.searchMc.tabBtn._visible = false;
}
function ScountClose()
{
   var _loc1_ = new lib.util.ExtTextField(container_mc.searchMc.mc1.scoutMc.inputTxt,0,container_mc.searchMc.mc1.scoutMc.input_focus);
   _loc1_.caption = SCOUT_DEFAULT;
   parentMc_Search1.scoutMc._visible = false;
   parentMc_Search1.btmMc._visible = true;
   parentMc_Search1.sortMc._visible = true;
   parentMc_Search1.listBox._visible = true;
   container_mc.searchMc.tabBtn._visible = true;
}
function setComboBox2()
{
   comboArr = [];
   var _loc1_ = 1;
   while(_loc1_ < 66)
   {
      comboArr.push(_loc1_);
      _loc1_ = _loc1_ + 1;
   }
   parentMc_Search0.comboBox0.data = guildSizeArr;
   parentMc_Search0.comboBox0.addListener(comboListner);
   parentMc_Search0.comboBox0.selectedIndex = 0;
   parentMc_Search0.comboBox1.data = ["$123175","$123164"];
   parentMc_Search0.comboBox1.addListener(comboListner);
   parentMc_Search0.comboBox1.selectedIndex = 0;
   parentMc_Search0.comboBox2.data = guildInviteArr;
   parentMc_Search0.comboBox2.addListener(comboListner);
   parentMc_Search0.comboBox2.selectedIndex = 0;
}
function listReset(mc)
{
   for(var _loc2_ in mc)
   {
      if(typeof mc[_loc2_] == "movieclip")
      {
         lib.manager.ToolTip.remove(mc[_loc2_].hit);
         mc[_loc2_].removeMovieClip();
      }
   }
}
function ToGame_GuildList_SearchOption()
{
   optionClose();
   var _loc1_ = "";
   var _loc3_ = Number(parentMc_Search0.checkBox0._currentframe - 1) + Number(parentMc_Search0.checkBox1._currentframe - 1) * 2 + Number((parentMc_Search0.checkBox2._currentframe + 1) % 2) * 4;
   var _loc2_ = parentMc_Search0.searchTxt.text;
   if(_loc2_ == optionSearch.caption)
   {
      _loc2_ = "";
   }
   _loc1_ = _loc1_ + (_loc3_ + "\t");
   _loc1_ = _loc1_ + (parentMc_Search0.comboBox0.selectedIndex - 1 + "\t");
   _loc1_ = _loc1_ + (parentMc_Search0.comboBox1.selectedIndex + "\t");
   _loc1_ = _loc1_ + (parentMc_Search0.comboBox2.selectedIndex + "\t");
   _loc1_ = _loc1_ + _loc2_;
   getURL("FSCommand:ToGame_GuildList_SearchOption",_loc1_);
}
function SearchInputCheck()
{
   var _loc1_ = Number(parentMc_Search0.checkBox0._currentframe - 1) + Number(parentMc_Search0.checkBox1._currentframe - 1) * 2 + Number((parentMc_Search0.checkBox2._currentframe + 1) % 2) * 4;
   if(StyleType == 0)
   {
      parentMc_Search0.checkTxt.text = checkTxtArr[_loc1_];
   }
   else
   {
      parentMc_Search0.checkTxt.text = checkTxtArr2[_loc1_];
   }
   if(_loc1_ !== 0 && _loc1_ !== 7)
   {
      parentMc_Search0.checkTxt.text = parentMc_Search0.checkTxt.text + STR_SUM3;
   }
}
function SetDetailOpen(id, type)
{
   getURL("FSCommand:ToGame_GuildList_DetailInfo",id);
   container_mc.searchMc.detailInfoMc._visible = true;
   if(type == "0")
   {
      container_mc.searchMc.detailInfoMc.btn0._x = 416;
      container_mc.searchMc.detailInfoMc.btn1._alpha = 0;
   }
   else
   {
      container_mc.searchMc.detailInfoMc.btn0._x = 347;
      container_mc.searchMc.detailInfoMc.btn1._alpha = 100;
   }
}
function SetDetailClose()
{
   container_mc.searchMc.detailInfoMc._visible = false;
}
function SearchInviteAccept()
{
   if(container_mc.searchMc.detailInfoMc.btn0._x == 347)
   {
      getURL("FSCommand:ToGame_GuildList_InviteClick",1);
   }
   else
   {
      fscommand("ToGame_GuildList_SearchClick");
   }
}
function ToGame_GuildList_InviteListClick(id, type)
{
   getURL("FSCommand:ToGame_GuildList_InviteListClick",id + "\t" + type);
}
function SearchInviteRufuse()
{
   SetDetailClose();
   getURL("FSCommand:ToGame_GuildList_InviteClick",0);
}
function ToGame_GuildList_ScoutClick()
{
   var _loc1_ = "";
   var _loc3_ = Number(parentMc_Search1.scoutMc.checkBox0._currentframe - 1) + Number(parentMc_Search1.scoutMc.checkBox1._currentframe - 1) * 2 + Number((parentMc_Search1.scoutMc.checkBox2._currentframe + 1) % 2) * 4;
   _loc1_ = _loc1_ + (_loc3_ + "\t");
   _loc1_ = _loc1_ + (parentMc_Search1.scoutMc.comboBox0.selectedIndex + "\t");
   var _loc2_ = parentMc_Search1.scoutMc.inputTxt.text;
   if(_loc2_ == scout_txt.caption)
   {
      _loc2_ = "";
   }
   _loc1_ = _loc1_ + _loc2_;
   getURL("FSCommand:ToGame_GuildList_ScoutClick",_loc1_);
}
function SearchListLine3(idx, gLData)
{
   var lineMc = container_mc.searchMc.mc2.listBox.attachMovie("line2","line" + idx,idx);
   var _loc6_ = Number(idx) % 2 + 1;
   lineMc.bg.gotoAndStop(_loc6_);
   lineMc._y = LINE_H2 * idx;
   lineMc.index = idx;
   lineMc.id = gLData[0];
   lineMc.gotoAndStop(2);
   lineMc.bg._height = lineMc.hit._height = LINE_H2;
   lineMc.txt0.setText(gLData[1]);
   lib.util.DrawBitmap.draw(lineMc.img,gLData[2],48,48);
   lineMc.txt1.setText(gLData[4]);
   var _loc7_ = Number(gLData[5]) + 1 + Number(StyleType * 8);
   lineMc.mc.gotoAndStop(_loc7_);
   lib.manager.ToolTip.add(lineMc.mc.checkHit0,styleArr[0],1);
   lib.manager.ToolTip.add(lineMc.mc.checkHit1,styleArr[1],1);
   lib.manager.ToolTip.add(lineMc.mc.checkHit2,styleArr[Number(StyleType + 2)],1);
   lineMc.txt2.text = gLData[6] + " ~ " + gLData[7];
   var _loc4_ = new lib.util.TxtBtn(lineMc.btn0.btn);
   _loc4_.setTextColor("0xcccccc","0xffffff","0xcccccc","0x666666");
   _loc4_.setRelease(function()
   {
      ToGame_GuildList_InviteListClick(lineMc.id,1);
   }
   );
   var _loc9_ = Boolean(Number(gLData[8]));
   _loc4_.setEnabled(_loc9_);
   var _loc5_ = new lib.util.TxtBtn(lineMc.btn1.btn);
   _loc5_.setTextColor("0xcccccc","0xffffff","0xcccccc","0x666666");
   _loc5_.setRelease(function()
   {
      ToGame_GuildList_InviteListClick(lineMc.id,0);
   }
   );
   var _loc8_ = Boolean(Number(gLData[9]));
   _loc5_.setEnabled(_loc8_);
   lineMc.overMc.onRelease = function()
   {
      SetDetailOpen(this._parent.id,1);
   };
}
var UI = this;
UI._visible = false;
var bWidgetOpen = false;
var UIname = "GuildList";
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
myListener.OnGameEventShowWindow = function(widgetName, bShow)
{
   if(widgetName.toLowerCase() == UIname.toLowerCase())
   {
      bWidgetOpen = bShow;
      if(_global.gbUIMode && bWidgetOpen)
      {
         container_mc.lock_mc._x = 1006;
         container_mc.x_mc._x = 1038;
         UI._visible = true;
      }
      else
      {
         UI._visible = false;
      }
   }
};
myListener.OnGameEventChangeUIMode = function(bShow)
{
   if(_global.gbUIMode && bWidgetOpen)
   {
      UI._visible = true;
   }
   else
   {
      UI._visible = false;
   }
};
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
container_mc.text_name.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
var x_btn = new lib.util.TxtBtn(container_mc.x_mc);
x_btn.setRelease(ToGame_GuildList_CloseUI);
var tab = container_mc.tabBtn.tab;
var tabNum = -1;
myListener.OnGame_GuildList_SetTab = function(index)
{
   tab.setTab(index,1);
};
myListener.OnGame_GuildList_SetDisableGuildWar = function()
{
   tab.setVisible(3,0);
};
tab.setRelease(release);
var subTab = container_mc.searchMc.tabBtn.tab;
var subTabNum = -1;
subTab.setRelease(release2);
container_mc.searchMc.countMc._visible = false;
myListener.OnGame_GuildList_RequestCount = function(num)
{
   var _loc3_ = Number(num);
   var _loc1_ = container_mc.searchMc.countMc;
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
var rankContainer = container_mc.rankMc;
var RANK_MAX_LINE = 10;
myListener.OnGame_GuildList_RankList = function(listData, currentPage, maxPage)
{
   var _loc4_ = lib.util.ExtString.split(listData,"\n");
   var _loc5_ = _loc4_.length;
   var _loc3_ = rankContainer.listContainer;
   clearContainer(_loc3_,"line_",RANK_MAX_LINE);
   var _loc1_ = 0;
   while(_loc1_ < _loc5_)
   {
      var _loc2_ = _loc3_.attachMovie("ranklineMc","line_" + _loc1_,_loc3_.getNextHighestDepth());
      _loc2_._y = _loc1_ * 49;
      setRankListInfo(_loc2_,_loc4_[_loc1_]);
      _loc1_ = _loc1_ + 1;
   }
   SetPageEvent(currentPage,maxPage);
};
var rankImg = ["rank_none","rank_down","rank_up","rank_new"];
var cityWarContainer = container_mc.cityWarMc;
var CITYWAR_MAX_LINE = 10;
myListener.OnGame_GuildList_SetCityWarResultList = function(listData)
{
   var _loc4_ = lib.util.ExtString.split(listData,"\n");
   var _loc5_ = _loc4_.length;
   var _loc3_ = cityWarContainer.listContainer;
   clearContainer(_loc3_,"line_",CITYWAR_MAX_LINE);
   var _loc1_ = 0;
   while(_loc1_ < _loc5_)
   {
      var _loc2_ = _loc3_.attachMovie("citywarlineMc","line_" + _loc1_,_loc3_.getNextHighestDepth());
      _loc2_._y = _loc1_ * 49;
      setCityWarListInfo(_loc2_,_loc4_[_loc1_]);
      _loc2_.bg.gotoAndStop(_loc1_ % 2 + 1);
      _loc1_ = _loc1_ + 1;
   }
};
var CITYWAR_GUILD_NAME_FD_MAX_WIDTH = 160;
var selectedDateIndex = null;
myListener.OnGame_GuildList_SetDateInfo = function(dateData, selectedId)
{
   selectedDateIndex = 0;
   var _loc5_ = lib.util.ExtString.split(dateData,"\n");
   var _loc8_ = [];
   var _loc1_ = 0;
   while(_loc1_ < _loc5_.length)
   {
      var _loc3_ = lib.util.ExtString.split(_loc5_[_loc1_],"\t");
      var _loc2_ = _loc3_[0];
      var _loc4_ = _loc3_[1];
      _loc8_.push({label:_loc4_,id:_loc2_});
      if(selectedId == _loc2_)
      {
         selectedDateIndex = _loc1_;
      }
      _loc1_ = _loc1_ + 1;
   }
   if(0 < _loc8_.length)
   {
      cityWarContainer.dateCombo.data = _loc8_;
      cityWarContainer.dateCombo.setSelectedIndex(selectedDateIndex);
      cityWarContainer.dateCombo.addListener(cityWarContainer.dateCombo);
      cityWarContainer.dateCombo.setEnabled(true);
   }
};
myListener.OnGame_GuildList_SetPageInfo = function(currentPage, maxPage)
{
   SetPageEvent(currentPage,maxPage);
};
cityWarDateComboInit();
rankContainer.pageButton.onChanged = function(page)
{
   ToGame_GuildList_RankPage(page);
};
cityWarContainer.dateCombo.onChanged = function(target, selected, selectedIndex)
{
   ToGame_GuildList_RequestChangeCityWarDate(selected,selectedIndex);
};
var guildWarContainer = container_mc.warMc;
var GUILDWAR_MAX_LINE = 10;
myListener.OnGame_GuildList_SetGuildWarList = function(listData)
{
   var _loc4_ = lib.util.ExtString.split(listData,"\n");
   var _loc6_ = _loc4_.length;
   var _loc5_ = Math.min(_loc6_,GUILDWAR_MAX_LINE);
   var _loc3_ = guildWarContainer.listContainer;
   clearContainer(_loc3_,"line_",GUILDWAR_MAX_LINE);
   var _loc1_ = 0;
   while(_loc1_ < _loc5_)
   {
      var _loc2_ = _loc3_.attachMovie("guildwarLineMc","line_" + _loc1_,_loc3_.getNextHighestDepth());
      _loc2_._y = _loc1_ * 49;
      setGuildWarListInfo(_loc2_,_loc4_[_loc1_]);
      _loc2_.bg.gotoAndStop(_loc1_ % 2 + 1);
      _loc1_ = _loc1_ + 1;
   }
};
var GUILD_WAR_EVENT_STRING = [lib.util.UIString.getUIString("$123271"),lib.util.UIString.getUIString("$123272"),lib.util.UIString.getUIString("$123273")];
var ScountTextLength_Local = 50;
var TIMESTR = lib.util.UIString.getUIString("$123039");
var MINUTESTR = lib.util.UIString.getUIString("$123040");
var SEC = lib.util.UIString.getUIString("$123041");
var MANS = lib.util.UIString.getUIString("$123042");
var GUILD_LEAGUE_TXT_0 = lib.util.UIString.getUIString("$123056");
var GUILD_LEAGUE_TXT_1 = lib.util.UIString.getUIString("$123057");
var GUILD_LEAGUE_TXT_2 = lib.util.UIString.getUIString("$123058");
var GUILD_LEAGUE_TXT_3 = lib.util.UIString.getUIString("$123059");
var GUILD_WAR_TXT_0 = lib.util.UIString.getUIString("$123064");
var GUILD_WAR_TXT_1 = lib.util.UIString.getUIString("$123065");
var GUILD_WAR_TXT_2 = lib.util.UIString.getUIString("$123086");
var GUILD_WAR_COINT = "<img src=\'coin\' vspace=\'-1\'>";
var btnStr = ["$123073","$123074","$123075","$123076","$123071","$123072"];
var INFO_STR0 = lib.util.UIString.getUIString("$123155");
var INFO_STR1 = lib.util.UIString.getUIString("$126004");
var parentMc_Search0 = container_mc.searchMc.mc0;
var parentMc_Search1 = container_mc.searchMc.mc1;
var guildScaleNum = ["$123164","$123165","$123166","$123167"];
var StyleType = 0;
var guildSizeArr = ["$123164","$123207","$123208","$123209"];
var styleType = ["$123140","$123141","$123142","$123143"];
var styleArr = ["$123144","$123145","$123146","$123147"];
var guildInviteArr = ["$123164","$123168","$123169","$123170"];
var comboArr = [];
var LINE_H = 48;
var LINE_H2 = 50;
var LINE_MAX = 9;
var LIST_LEN = 0;
container_mc.pageMc.setPage(0,0);
container_mc.pageMc.onChanged = function(page)
{
   if(tabNum == 0)
   {
      getURL("FSCommand:ToGame_GuildList_SearchPage",page);
   }
   else if(tabNum == 1)
   {
      getURL("FSCommand:ToGame_GuildList_RankPage",page);
   }
   else if(tabNum == 2)
   {
      getURL("FSCommand:ToGame_GuildList_RequestCityWarResultPage",page);
   }
   else if(tabNum == 3)
   {
      getURL("FSCommand:ToGame_GuildList_GuildWarPage",page);
   }
};
parentMc_Search0.sortBtn._visible = false;
myListener.OnGame_GuildList_SearchList = function(dataList, currentPage, totalPages)
{
   listReset(parentMc_Search0.listBox);
   var _loc4_ = lib.util.ExtString.split(dataList,"\n");
   var _loc3_ = LIST_LEN = _loc4_.length;
   parentMc_Search0.sortBtn._visible = true;
   if((LIST_LEN = _loc4_.length) > LINE_MAX - 3)
   {
      var _loc3_ = LINE_MAX - 3;
   }
   if(_loc3_ > 0)
   {
      SetTip("");
   }
   var _loc1_ = 0;
   while(_loc1_ < _loc3_)
   {
      var _loc2_ = lib.util.ExtString.split(_loc4_[_loc1_],"\t");
      SearchListLine(_loc1_,_loc2_);
      _loc1_ = _loc1_ + 1;
   }
   SetPageEvent(currentPage,totalPages);
};
parentMc_Search1.scoutMc._visible = false;
myListener.OnGame_GuildList_SearchScout = function(dataList, currentPage, totalPages, button, time)
{
   listReset(parentMc_Search1.listBox);
   parentMc_Search1.scoutMc._visible = false;
   var _loc4_ = lib.util.ExtString.split(dataList,"\n");
   var _loc3_ = _loc4_.length;
   if(_loc3_ > LINE_MAX - 1)
   {
      _loc3_ = LINE_MAX - 1;
   }
   var _loc1_ = 0;
   while(_loc1_ < _loc3_)
   {
      var _loc2_ = lib.util.ExtString.split(_loc4_[_loc1_],"\t");
      SearchListLine2(_loc1_,_loc2_);
      _loc1_ = _loc1_ + 1;
   }
   SetPageEvent(currentPage,totalPages);
   myListener.OnGame_GuildList_SearchCooltime(time);
   myListener.OnGame_GuildList_SearchScoutBtn(button);
};
var cooltimeStr = "";
myListener.OnGame_GuildList_SearchCooltime = function(time)
{
   if(time == "" || time == undefined)
   {
      cooltimeStr = "";
   }
   else
   {
      cooltimeStr = "<font color=\'#FF0000\'>" + lib.util.UIString.getUIString("$123161") + " (" + lib.util.UIString.getUIString("$123162","count",time) + ")</font>";
   }
};
myListener.OnGame_GuildList_SearchScoutBtn = function(modeType)
{
   if(modeType == "1")
   {
      searchScout_btn.setEnabled(true);
      parentMc_Search1.btmMc.btnIcon._visible = true;
      searchScout_btn.setText("$123133");
      parentMc_Search1.btmMc.btnIcon._x = 492 - parentMc_Search1.btmMc.btnTxt.textWidth / 2;
   }
   else if(modeType == "0")
   {
      searchScout_btn.setEnabled(false);
      parentMc_Search1.btmMc.btnIcon._visible = false;
      if(cooltimeStr == "")
      {
         searchScout_btn.setText("$123163");
      }
      else
      {
         parentMc_Search1.btmMc.btnTxt.htmlText = cooltimeStr;
      }
   }
   else
   {
      searchScout_btn.setEnabled(false);
      searchScout_btn.setText("$123161");
      parentMc_Search1.btmMc.btnIcon._visible = false;
   }
};
var DetailBtn = false;
myListener.OnGame_GuildList_DetailInfo = function(dataList, btnMode)
{
   var _loc2_ = container_mc.searchMc.detailInfoMc;
   var _loc1_ = lib.util.ExtString.split(dataList,"\t");
   lib.util.DrawBitmap.draw(_loc2_.crestMc,_loc1_[1],52,52);
   _loc2_.txt0.autoSize = true;
   _loc2_.txt0.setText(_loc1_[0]);
   _loc2_.txt1.text = _loc1_[2];
   _loc2_.txt2.text = _loc1_[3] + "/" + _loc1_[4] + INFO_STR0;
   _loc2_.txt3.text = _loc1_[5];
   var _loc3_ = "";
   if(_loc1_[6] != undefined)
   {
      _loc3_ = _loc1_[6] + INFO_STR1;
   }
   _loc2_.txt5.text = _loc3_;
   var _loc4_ = Number(_loc1_[7]) + 1 + Number(StyleType * 8);
   _loc2_.mc.gotoAndStop(_loc4_);
   _loc2_.txt6.text = _loc1_[8] + "~" + _loc1_[9];
   _loc2_.txt8.text = guildInviteArr[Number(_loc1_[10])];
   _loc2_.txt9.htmlText = _loc1_[11];
   DetailBtn = Boolean(Number(btnMode));
   if(!DetailBtn)
   {
      container_mc.searchMc.detailInfoMc.btn0._visible = false;
      container_mc.searchMc.detailInfoMc.btn1._visible = false;
   }
   else
   {
      container_mc.searchMc.detailInfoMc.btn0._visible = true;
      container_mc.searchMc.detailInfoMc.btn1._visible = true;
   }
};
var searchOption_btn = new lib.util.TxtBtn(parentMc_Search0.btn,parentMc_Search0.btnTxt);
searchOption_btn.setRelease(ToGame_GuildList_SearchOption);
searchOption_btn.setTextColor("0xcccccc","0xffffff","0xcccccc","0x666666");
lib.manager.ToolTip.add(parentMc_Search0.btn,"$123177",1);
var searchScout_btn = new lib.util.TxtBtn(parentMc_Search1.btmMc.btn,parentMc_Search1.btmMc.btnTxt);
searchScout_btn.setRelease(ScountOpen);
searchScout_btn.setTextColor("0xadd7ff","0xffffff","0x66b8d6","0x707070");
var searchScout_btn0 = new lib.util.TxtBtn(parentMc_Search1.scoutMc.btn0.btn,parentMc_Search1.scoutMc.btn0.txt);
searchScout_btn0.setRelease(ToGame_GuildList_ScoutClick);
var searchScout_btn1 = new lib.util.TxtBtn(parentMc_Search1.scoutMc.btn1.btn,parentMc_Search1.scoutMc.btn1.txt);
searchScout_btn1.setRelease(ScountClose);
var searchScout_btn2 = new lib.util.TxtBtn(parentMc_Search1.scoutMc.btn2);
searchScout_btn2.setRelease(ScountClose);
var SCOUT_DEFAULT = lib.util.UIString.getUIString("$123178");
var scout_txt = new lib.util.ExtTextField(container_mc.searchMc.mc1.scoutMc.inputTxt,0,container_mc.searchMc.mc1.scoutMc.input_focus);
scout_txt.caption = SCOUT_DEFAULT;
var prevScout = "";
scout_txt.onChanged = function()
{
   var _loc1_ = container_mc.searchMc.mc1.scoutMc.inputTxt.length;
   if(_loc1_ > ScountTextLength_Local)
   {
      container_mc.searchMc.mc1.scoutMc.inputTxt.text = prevScout;
      _loc1_ = ScountTextLength_Local;
   }
   else
   {
      prevScout = container_mc.searchMc.mc1.scoutMc.inputTxt.text;
   }
   container_mc.searchMc.mc1.scoutMc.txtLenCheck2.text = _loc1_ + "/" + ScountTextLength_Local;
};
scout_txt.onEnterKey = function()
{
   Selection.setFocus(null);
};
parentMc_Search1.scoutMc.comboBox0.data = guildSizeArr;
parentMc_Search1.scoutMc.comboBox0.addListener(comboListner);
parentMc_Search1.scoutMc.comboBox0.selectedIndex = 0;
myListener.OnGame_GuildList_SearchOption = function(dataList)
{
   listReset(parentMc_Search0.listBox);
   parentMc_Search0.sortBtn._visible = false;
   var _loc1_ = lib.util.ExtString.split(dataList,"\t");
   CheckType(parentMc_Search0,_loc1_[0]);
   parentMc_Search0.comboBox0.selectedIndex = _loc1_[3] + 1;
   parentMc_Search0.comboBox1.selectedIndex = Number(_loc1_[2]);
   parentMc_Search0.comboBox2.selectedIndex = Number(_loc1_[1]);
};
myListener.OnGame_GuildList_SetScale = function(dataList)
{
   var _loc1_ = lib.util.ExtString.split(dataList,"\t");
   if(_loc1_)
   {
      guildScaleNum[1] = lib.util.UIString.getUIString("$123167") + lib.util.UIString.getUIString("$123180","count",_loc1_[0]);
      guildScaleNum[2] = lib.util.UIString.getUIString("$123166") + lib.util.UIString.getUIString("$123180","count",_loc1_[1]);
      guildScaleNum[3] = lib.util.UIString.getUIString("$123165") + lib.util.UIString.getUIString("$123180","count",_loc1_[2]);
   }
   else
   {
      guildScaleNum = ["$123164","$123167","$123166","$123165"];
   }
   parentMc_Search0.comboBox0.data = guildScaleNum;
};
myListener.OnGame_GuildList_SetStyleIcon = function(num)
{
   StyleType = num;
   parentMc_Search1.scoutMc.checkBox2.gotoAndStop(Number(StyleType * 2) + 1);
   container_mc.searchMc.detailInfoMc.mc.gotoAndStop(Number(StyleType * 8) + 1);
   lib.manager.ToolTip.add(container_mc.searchMc.detailInfoMc.mc.checkHit0,styleArr[0],1);
   lib.manager.ToolTip.add(container_mc.searchMc.detailInfoMc.mc.checkHit1,styleArr[1],1);
   lib.manager.ToolTip.add(container_mc.searchMc.detailInfoMc.mc.checkHit2,styleArr[Number(StyleType + 2)],1);
   lib.manager.ToolTip.add(container_mc.searchMc.mc1.scoutMc.checkBox0,styleArr[0],1);
   lib.manager.ToolTip.add(container_mc.searchMc.mc1.scoutMc.checkBox1,styleArr[1],1);
   lib.manager.ToolTip.add(container_mc.searchMc.mc1.scoutMc.checkBox2,styleArr[Number(StyleType + 2)],1);
   lib.manager.ToolTip.add(container_mc.searchMc.mc0.checkBox0,styleArr[0],1);
   lib.manager.ToolTip.add(container_mc.searchMc.mc0.checkBox1,styleArr[1],1);
   lib.manager.ToolTip.add(container_mc.searchMc.mc0.checkBox2,styleArr[Number(StyleType + 2)],1);
};
parentMc_Search0.searchTxt.onChanged = function()
{
   lib.util.StrByteLen.getLenth3(parentMc_Search0.searchTxt,30);
   SearchInputCheck();
};
var optionSearch = new lib.util.ExtTextField(parentMc_Search0.searchTxt,0,parentMc_Search0.searchFocus);
optionSearch.caption = lib.util.UIString.getUIString("$123181");
optionSearch.textField.selectable = true;
optionSearch.onEnterKey = function()
{
   ToGame_GuildList_SearchOption();
   Selection.setFocus(null);
};
var STR_SUM0 = lib.util.UIString.getUIString("$123184") + ", " + lib.util.UIString.getUIString("$123185");
var STR_SUM1 = lib.util.UIString.getUIString("$123184") + ", " + lib.util.UIString.getUIString("$123186");
var STR_SUM2 = lib.util.UIString.getUIString("$123185") + ", " + lib.util.UIString.getUIString("$123186");
var STR_SUM3 = lib.util.UIString.getUIString("$123188");
var STR_SUM4 = lib.util.UIString.getUIString("$123184") + ", " + lib.util.UIString.getUIString("$123187");
var STR_SUM5 = lib.util.UIString.getUIString("$123185") + ", " + lib.util.UIString.getUIString("$123187");
var checkTxtArr = ["$123182","$123184","$123185",STR_SUM0,"$123186",STR_SUM1,STR_SUM2,"$123183"];
var checkTxtArr2 = ["$123182","$123184","$123185",STR_SUM0,"$123187",STR_SUM4,STR_SUM5,"$123183"];
var saveEditDefault = [0,0,0,2];
var ditailAccept_btn = new lib.util.TxtBtn(container_mc.searchMc.detailInfoMc.btn0.btn,container_mc.searchMc.detailInfoMc.btn0.txt);
var ditailRufuse_btn = new lib.util.TxtBtn(container_mc.searchMc.detailInfoMc.btn1.btn,container_mc.searchMc.detailInfoMc.btn1.txt);
ditailAccept_btn.setRelease(SearchInviteAccept);
ditailRufuse_btn.setRelease(SearchInviteRufuse);
var ditailClose_btn = new lib.util.TxtBtn(container_mc.searchMc.detailInfoMc.btn);
ditailClose_btn.setRelease(SetDetailClose);
parentMc_Search0.checkBox0.onChanged = function(checked)
{
   SearchInputCheck();
};
parentMc_Search0.checkBox1.onChanged = function(checked)
{
   SearchInputCheck();
};
parentMc_Search0.checkBox2.onChanged = function(checked)
{
   SearchInputCheck();
};
container_mc.searchMc.detailInfoMc._visible = false;
setComboBox2();
myListener.OnGame_GuildList_SetStyleIcon(0);
myListener.OnGame_GuildList_SearchInvite = function(dataList, currentPage, totalPages)
{
   listReset(container_mc.searchMc.mc2.listBox);
   var _loc4_ = lib.util.ExtString.split(dataList,"\n");
   var _loc3_ = _loc4_.length;
   if(_loc3_ > LINE_MAX)
   {
      _loc3_ = LINE_MAX;
   }
   var _loc1_ = 0;
   while(_loc1_ < _loc3_)
   {
      var _loc2_ = lib.util.ExtString.split(_loc4_[_loc1_],"\t");
      SearchListLine3(_loc1_,_loc2_);
      _loc1_ = _loc1_ + 1;
   }
   SetPageEvent(currentPage,totalPages);
};
tab.setTab(0,0);
subTab.setTab(0,0);
ToGame_GuildList_Init();
