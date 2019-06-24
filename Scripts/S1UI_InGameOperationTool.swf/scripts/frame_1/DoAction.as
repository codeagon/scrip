function ToGame_InGameOperationTool_Punishment()
{
   var _loc1_ = Number(punishBtn.toggle);
   getURL("FSCommand:ToGame_InGameOperationTool_Punishment",_loc1_);
}
function ToGame_InGameOperationTool_ChatBlock()
{
   var _loc2_ = Number(chatBlockBtn.toggle);
   var _loc1_ = chatBlockDrop.selectedIndex;
   getURL("FSCommand:ToGame_InGameOperationTool_ChatBlock",_loc2_ + "/" + _loc1_);
}
function BFInit()
{
   var _loc4_ = container_mc.containerMc_BF;
   var _loc2_ = 0;
   while(_loc2_ < 6)
   {
      var _loc3_ = new lib.util.TxtBtn(_loc4_["btn" + _loc2_ + "_mc"],_loc4_["btn" + _loc2_ + "_txt"]);
      _loc3_.btn.tag = txtBtnTag[_loc2_];
      if(txtBtnTag[_loc2_] == "VIEW")
      {
         viewModeBtn = _loc3_;
         _loc3_.setToggleMode(true);
      }
      _loc3_.btn.onRelease2 = function()
      {
         if(this.tag == "VIEW")
         {
            var _loc2_ = Number(viewModeBtn.toggle);
            ToGame_InGameOperationTool_BFBtnEvent(this.tag + "\t" + _loc2_);
         }
         else if(this.tag == "GO" || this.tag == "INVITE" || this.tag == "KICK")
         {
            _loc2_ = nameInputFd0.text + "\t" + nameInputFd1.text + "\t" + nameInputFd2.text;
            ToGame_InGameOperationTool_BFBtnEvent(this.tag + "\t" + _loc2_);
         }
         else
         {
            ToGame_InGameOperationTool_BFBtnEvent(this.tag);
         }
      };
      _loc2_ = _loc2_ + 1;
   }
   lib.manager.Focus.addFocusGroup(UIname,2,[_loc4_.nameInputFd0,_loc4_.nameInputFd1,_loc4_.nameInputFd2]);
   lib.manager.Focus.addFocusGroup(UIname,3,[_loc4_.matchInputFd0,_loc4_.matchInputFd1,_loc4_.matchInputFd2,_loc4_.matchInputFd3,_loc4_.matchInputFd4]);
   matchBtn.btn.onRelease2 = function()
   {
      ToGame_InGameOperationTool_BFBtnEvent("MATCHING\t" + matchInputFd0.text + "\t" + matchInputFd1.text + "\t" + matchInputFd2.text + "\t" + matchInputFd3.text + "\t" + matchInputFd4.text);
   };
   messageBtn.btn.onRelease2 = function()
   {
      ToGame_InGameOperationTool_BFBtnEvent("MESSAGESEND\t" + messageInputFd.text);
   };
   messageInputFd.onEnterKey = matchInputFd0.onEnterKey = matchInputFd1.onEnterKey = matchInputFd2.onEnterKey = matchInputFd3.onEnterKey = matchInputFd4.onEnterKey = function()
   {
      if(this == matchInputFd4)
      {
         matchBtn.btn.onRelease2();
      }
      if(this == messageInputFd)
      {
         messageBtn.btn.onRelease2();
      }
   };
   messageInputFd.onChanged = matchInputFd0.onChanged = matchInputFd1.onChanged = matchInputFd2.onChanged = matchInputFd3.onChanged = matchInputFd4.onChanged = function()
   {
      var _loc3_ = lib.util.ExtString.trim(this.text);
      if(this == messageInputFd)
      {
         messageBtn.setEnabled(_loc3_ != "" && _loc3_ != undefined);
      }
      if(this == matchInputFd0 || this == matchInputFd1 || this == matchInputFd2 || this == matchInputFd3 || this == matchInputFd4)
      {
         var _loc8_ = lib.util.ExtString.trim(matchInputFd0.text);
         var _loc7_ = lib.util.ExtString.trim(matchInputFd1.text);
         var _loc6_ = lib.util.ExtString.trim(matchInputFd2.text);
         var _loc5_ = lib.util.ExtString.trim(matchInputFd3.text);
         var _loc4_ = lib.util.ExtString.trim(matchInputFd4.text);
         var _loc2_ = _loc8_ != undefined && _loc7_ != undefined && _loc6_ != undefined && _loc5_ != undefined && _loc4_ != undefined;
         _loc2_ = _loc2_ && (_loc8_ != "" && _loc7_ != "" && _loc6_ != "" && _loc5_ != "" && _loc4_ != "");
         matchBtn.setEnabled(_loc2_);
      }
   };
   serachBtn.setEnabled(false);
   matchBtn.setEnabled(false);
   messageBtn.setEnabled(false);
}
function ToGame_InGameOperationTool_BFBtnEvent(tag)
{
   lib.Debuger.trace("ToGame_InGameOperationTool_BFBtnEvent " + tag);
   getURL("FSCommand:ToGame_InGameOperationTool_BFBtnEvent",tag);
}
function ToGame_InGameOperationTool_Init()
{
   fscommand("ToGame_InGameOperationTool_Init");
}
function ToGame_InGameOperationTool_CloseUI()
{
   fscommand("ToGame_InGameOperationTool_CloseUI");
}
function ToGame_InGameOperationTool_CheckCharacterName()
{
   var _loc1_ = lib.util.ExtString.trim(container_mc.containerMc.chNameFd.text);
   if(_loc1_ == "" || _loc1_ == undefined)
   {
      return undefined;
   }
   getURL("FSCommand:ToGame_InGameOperationTool_CheckCharacterName",_loc1_);
}
function ToGame_InGameOperationTool_Event(_orderIndex, vale)
{
   var _loc1_ = orderTable[_orderIndex];
   if(_loc1_ == undefined)
   {
      return undefined;
   }
   var _loc2_ = "ToGame_InGameOperationTool_" + _loc1_;
   getURL("FSCommand:" add _loc2_,"");
}
function ToGame_InGameOperationTool_RequestInvisible()
{
   var _loc1_ = Number(btn_Invi.toggle);
   getURL("FSCommand:ToGame_InGameOperationTool_RequestInvisible",_loc1_);
}
function ToGame_InGameOperationTool_RequestGod()
{
   var _loc1_ = Number(btn_God.toggle);
   getURL("FSCommand:ToGame_InGameOperationTool_RequestGod",_loc1_);
}
function ToGame_InGameOperationTool_RequestNotAware()
{
   var _loc1_ = Number(btn_NotAware.toggle);
   getURL("FSCommand:ToGame_InGameOperationTool_RequestNotAware",_loc1_);
}
function ToGame_InGameOperationTool_RequestSpeed()
{
   speedValue = speedValue % 4 + 1;
   var _loc1_ = speedValue;
   btn_Speed.setToggleMode(_loc1_ > 1);
   btn_Speed.setToggle(_loc1_ > 1);
   btn_Speed.txt.text = SPPEDSTR + " x" + _loc1_;
   getURL("FSCommand:ToGame_InGameOperationTool_RequestSpeed",_loc1_);
}
function ToGame_InGameOperationTool_KillMonster()
{
   var _loc1_ = chNameFd2.text;
   getURL("FSCommand:ToGame_InGameOperationTool_KillMonster",_loc1_);
}
function ToGame_InGameOperationTool_MonsterRange()
{
   var _loc1_ = chNameFd2.text;
   if(_loc1_ == "" || _loc1_ == undefind)
   {
      return undefined;
   }
   getURL("FSCommand:ToGame_InGameOperationTool_MonsterRange",_loc1_);
}
function ToGame_InGameOperationTool_RequestCrash()
{
   var _loc1_ = Number(btn_Crash.toggle);
   lib.Debuger.trace("ToGame_InGameOperationTool_RequestCrash " + _loc1_);
   getURL("FSCommand:ToGame_InGameOperationTool_RequestCrash",_loc1_);
}
function ToGame_InGameOperationTool_DBID()
{
   var _loc1_ = chNameFd3.text;
   if(_loc1_ == "" || _loc1_ == undefind)
   {
      return undefined;
   }
   lib.Debuger.trace("ToGame_InGameOperationTool_DBID " + _loc1_);
   getURL("FSCommand:ToGame_InGameOperationTool_DBID",_loc1_);
}
function ToGame_InGameOperationTool_AlertMessage()
{
   var _loc1_ = chNameFd4.text;
   if(_loc1_ == "" || _loc1_ == undefind)
   {
      return undefined;
   }
   lib.Debuger.trace("ToGame_InGameOperationTool_AlertMessage " + _loc1_);
   getURL("FSCommand:ToGame_InGameOperationTool_AlertMessage",_loc1_);
}
function ToGame_InGameOperationTool_RequestNpcSpawn()
{
   var _loc3_ = chNameFd5.text;
   var _loc2_ = chNameFd7.text;
   var _loc1_ = chNameFd6.text;
   var _loc4_ = Number(container_mc.containerMc.npcSpawnMc.npcCheckBtn.checked);
   var _loc5_ = chNameFd8.text;
   if(_loc3_ == "" || _loc3_ == undefind)
   {
      return undefined;
   }
   if(_loc2_ == "" || _loc2_ == undefind)
   {
      return undefined;
   }
   if(_loc1_ == "" || _loc1_ == undefind)
   {
      return undefined;
   }
   getURL("FSCommand:ToGame_InGameOperationTool_RequestNpcSpawn",_loc3_ + "\t" + _loc2_ + "\t" + _loc1_ + "\t" + _loc4_ + "\t" + _loc5_);
}
function ToGame_InGameOperationTool_CheckAggressive(checked)
{
   getURL("FSCommand:ToGame_InGameOperationTool_CheckAggressive",checked);
}
function ToGame_InGameOperationTool_RequestSpawnRange()
{
   var _loc1_ = chNameFd8.text;
   if(_loc1_ == "" || _loc1_ == undefined)
   {
      return undefined;
   }
   getURL("FSCommand:ToGame_InGameOperationTool_RequestSpawnRange",_loc1_);
}
function ToGame_InGameOperationTool_ChangeTabBtn(index)
{
   getURL("FSCommand:ToGame_InGameOperationTool_ChangeTabBtn",index);
}
function ToGame_InGameOperationTool_RequestDungeonSearch()
{
   var _loc1_ = lib.util.ExtString.trim(container_mc.containerMc_DG.chNameFd.text);
   if(_loc1_ == "" || _loc1_ == undefined)
   {
      return undefined;
   }
   getURL("FSCommand:ToGame_InGameOperationTool_RequestDungeonSearch",_loc1_);
}
function EVInit()
{
   var _loc4_ = container_mc.containerMc_EV;
   var _loc5_ = evetnBrtnTag.length;
   var _loc2_ = 0;
   while(_loc2_ < _loc5_)
   {
      var _loc3_ = new lib.util.TxtBtn(_loc4_["btn" + _loc2_ + "_mc"],_loc4_["btn" + _loc2_ + "_txt"]);
      _loc3_.btn.tag = evetnBrtnTag[_loc2_];
      eventBtnArr.push(_loc3_);
      _loc3_.btn.onRelease2 = function()
      {
         ToGame_InGameOperationTool_EventBtnClick(this.tag);
      };
      _loc2_ = _loc2_ + 1;
   }
   var noticeBtn = new lib.util.TxtBtn(_loc4_.btn6_mc,_loc4_.btn6_txt);
   noticeBtn.setRelease(ToGame_InGameOperationTool_EventNotice);
   noticeTF.onChanged = function()
   {
      var _loc3_ = this.text;
      var _loc5_ = _loc3_.length;
      var _loc7_ = 0 < _loc5_;
      var _loc4_ = noticeTextLength != 0?noticeTextLength:40;
      if(_loc5_ > _loc4_)
      {
         var _loc6_ = new String(_loc3_);
         var _loc2_ = new String();
         _loc2_ = _loc6_.substr(0,_loc4_);
         this.text = _loc2_;
         noticeString = _loc2_;
      }
      noticeBtn.setEnabled(_loc7_);
   };
}
function ToGame_InGameOperationTool_EventBtnClick(index)
{
   var _loc1_ = lib.util.ExtString.trim(container_mc.containerMc_EV.chNameFd.text);
   getURL("FSCommand:ToGame_InGameOperationTool_EventBtnClick",index + "\t" + _loc1_);
}
function ToGame_InGameOperationTool_EventNotice()
{
   var _loc1_ = new String(noticeTF.text);
   UI.dubeger.text = _loc1_;
   getURL("FSCommand:ToGame_InGameOperationTool_EventNotice",_loc1_);
}
function ToGame_InGameOperationTool_EventListChange()
{
   var _loc1_ = eventDrop.selectedIndex;
   getURL("FSCommand:ToGame_InGameOperationTool_EventListChange",_loc1_);
   lib.Debuger.trace("ToGame_InGameOperationTool_EventListChange " + _loc1_);
}
var UI = this;
UI._visible = false;
var bWidgetOpen = false;
var UIname = "InGameOperationTool";
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
container_mc.text_name.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
myListener.OnGameEventShowWindow = function(widgetName, bShow)
{
   if(widgetName.toLowerCase() == UIname.toLowerCase())
   {
      bWidgetOpen = bShow;
      if(bWidgetOpen)
      {
         UI._visible = true;
      }
      else
      {
         UI._visible = false;
      }
   }
};
var PcName = "";
var SPPEDSTR = lib.util.UIString.getUIString("$008020");
container_mc.containerMc.btn14_txt.text = SPPEDSTR + " x1";
lib.manager.Focus.addFocusGroup(UIname,1,[container_mc.containerMc.npcSpawnMc.chNameFd5,container_mc.containerMc.npcSpawnMc.chNameFd7,container_mc.containerMc.npcSpawnMc.chNameFd6,container_mc.containerMc.npcSpawnMc.chNameFd8]);
var NameTextLength_Local = 0;
myListener.OnGame_InGameOperationTool_SetCharacterName = function(_cname)
{
   if(_cname == undefined)
   {
      _cname = "";
   }
   container_mc.containerMc.chNameFd.text = _cname;
   PcName = _cname;
   btn_find.setEnabled(_cname != "" && _cname != undefined);
};
myListener.OnGame_InGameOperationTool_SetGMState = function(invisible, god, aware, speed, crash, monsterrange, spawnrange)
{
   lib.Debuger.trace("OnGame_InGameOperationTool_SetGMState  " + invisible);
   btn_Invi.setToggle(Number(invisible));
   btn_God.setToggle(Number(god));
   btn_NotAware.setToggle(Number(aware));
   btn_Speed.setToggleMode(Number(speed) > 1);
   btn_Speed.setToggle(Number(speed) > 1);
   btn_Speed.txt.text = SPPEDSTR + " x" + Number(speed);
   btn_Crash.setToggle(Number(crash));
   chNameFd2.text = monsterrange;
   speedValue = Number(speed);
   chNameFd8.text = Number(spawnrange);
};
myListener.OnGame_InGameOperationTool_SetServerName = function(serverName)
{
   if(serverName == undefined)
   {
      serverName = "";
   }
   container_mc.serverName.text = serverName;
};
myListener.OnGame_InGameOperationTool_SetAcessInfo = function(str)
{
   container_mc.longinLog.htmlText = str;
};
myListener.OnGame_InGameOperationTool_SetDBID = function(dbid)
{
   if(dbid == undefined)
   {
      dbid = "";
   }
   chNameFd3.text = dbid;
};
myListener.OnGame_InGameOperationTool_SetEnableNpcSpawn = function(enable)
{
   enable = Number(enable);
   container_mc.containerMc.npcSpawnMc._visible = enable;
};
myListener.OnGame_InGameOperationTool_CheckAggressive = function(checked)
{
   checked = Number(checked);
   container_mc.containerMc.npcSpawnMc.npcCheckBtn.checked = Boolean(checked);
};
var punishBtn = new lib.util.TxtBtn(container_mc.containerMc.btn240_mc,container_mc.containerMc.btn240_txt);
punishBtn.setToggleMode(true);
myListener.OnGame_InGameOperationTool_SetPunishment = function($toggle)
{
   $toggle = Number($toggle);
   punishBtn.setToggle($toggle);
};
punishBtn.setRelease(ToGame_InGameOperationTool_Punishment);
var chatBlockBtn = new lib.util.TxtBtn(container_mc.containerMc.btn25_mc,container_mc.containerMc.btn25_txt);
chatBlockBtn.setToggleMode(true);
var chatBlockDrop = container_mc.containerMc.chat_drop;
var dropobj = {};
dropobj.onChanged = function(target, id, index)
{
   var _loc1_ = Number(chatBlockBtn.toggle);
   if(_loc1_ == 1)
   {
      ToGame_InGameOperationTool_ChatBlock();
   }
};
chatBlockDrop.addListener(dropobj);
myListener.OnGame_InGameOperationTool_SetChatBlock = function($toggle, times, selectIndex)
{
   $toggle = Number($toggle);
   chatBlockBtn.setToggle($toggle);
   var _loc1_ = lib.util.ExtString.split(times,"\t");
   chatBlockDrop.removeListener(dropobj);
   chatBlockDrop.data = _loc1_;
   chatBlockDrop.setSelectedIndex(Number(selectIndex));
   chatBlockDrop.addListener(dropobj);
};
chatBlockBtn.setRelease(ToGame_InGameOperationTool_ChatBlock);
var tabBtn = container_mc.tabBtn.tab;
myListener.OnGame_InGameOperationTool_TabBtn = function()
{
   function tabRelease()
   {
      container_mc.containerMc._visible = tabBtn.activedNum == 0;
      container_mc.containerMc_BF._visible = tabBtn.activedNum == 1;
      container_mc.containerMc_DG._visible = tabBtn.activedNum == 2;
      container_mc.containerMc_EV._visible = tabBtn.activedNum == 3;
      if(!arguments[1])
      {
         ToGame_InGameOperationTool_ChangeTabBtn(tabBtn.activedNum);
      }
   }
   tabBtn = container_mc.tabBtn.tab;
   tabBtn.setRelease(tabRelease);
   tabBtn.setTab(0);
};
myListener.OnGame_InGameOperationTool_TabBtn();
myListener.OnGame_InGameOperationTool_BFSetTargetInfo = function(master, id, name)
{
   nameInputFd0.text = master;
   nameInputFd1.text = id;
   nameInputFd2.text = name;
};
myListener.OnGame_InGameOperationTool_BFMatchingInfo = function(zoneID, AteamName, AteamMaster, BteamName, BteamMaster)
{
   matchInputFd0.text = AteamName;
   matchInputFd1.text = AteamMaster;
   matchInputFd2.text = BteamName;
   matchInputFd3.text = BteamMaster;
   matchInputFd4.text = zoneID;
};
myListener.OnGame_InGameOperationTool_BFMessage = function(message)
{
   messageInputFd.text = message;
};
myListener.OnGame_InGameOperationTool_BFViewMode = function(flag)
{
   viewModeBtn.setToggle(Number(flag));
};
var viewModeBtn;
var nameInputFd0 = new lib.util.ExtTextField(container_mc.containerMc_BF.nameInputFd0,0,container_mc.containerMc_BF.nameInputFd_focus0);
var nameInputFd1 = new lib.util.ExtTextField(container_mc.containerMc_BF.nameInputFd1,0,container_mc.containerMc_BF.nameInputFd_focus1);
var nameInputFd2 = new lib.util.ExtTextField(container_mc.containerMc_BF.nameInputFd2,0,container_mc.containerMc_BF.nameInputFd_focus2);
var matchInputFd0 = new lib.util.ExtTextField(container_mc.containerMc_BF.matchInputFd0,0,container_mc.containerMc_BF.matchFd_focus0);
var matchInputFd1 = new lib.util.ExtTextField(container_mc.containerMc_BF.matchInputFd1,0,container_mc.containerMc_BF.matchFd_focus1);
var matchInputFd2 = new lib.util.ExtTextField(container_mc.containerMc_BF.matchInputFd2,0,container_mc.containerMc_BF.matchFd_focus2);
var matchInputFd3 = new lib.util.ExtTextField(container_mc.containerMc_BF.matchInputFd3,0,container_mc.containerMc_BF.matchFd_focus3);
var matchInputFd4 = new lib.util.ExtTextField(container_mc.containerMc_BF.matchInputFd4,0,container_mc.containerMc_BF.matchFd_focus4);
var messageInputFd = new lib.util.ExtTextField(container_mc.containerMc_BF.messageInputFd,0,container_mc.containerMc_BF.messageInputFd_focus);
var serachBtn = new lib.util.TxtBtn(container_mc.containerMc_BF.name_mc,container_mc.containerMc_BF.name_txt);
var matchBtn = new lib.util.TxtBtn(container_mc.containerMc_BF.match_mc,container_mc.containerMc_BF.match_txt);
var messageBtn = new lib.util.TxtBtn(container_mc.containerMc_BF.message_mc,container_mc.containerMc_BF.message_txt);
txtBtnTag = ["GO","INVITE","KICK","LEAVE","EXIT","VIEW"];
var orderTable = ["RequestInventory","RequestWareHouse","RequestQuest","RequestPaperDoll","RequestSkill","RequestClose","RequestResurrection","RequestMove","RequestRecall","RequestPositionMove","RequestBookMark","RequestInvisible","RequestGod","RequestNotAware","RequestSpeed","RequestRemoveNPC","RequestPartyInfo","","RequestAlert","","RequestBlackList","RequestCharacterSearch","RequestActPunish","RequestPersonalWareHouse"];
var speedValue = 1;
var x_btn = new lib.util.TxtBtn(container_mc.x_mc);
x_btn.setRelease(ToGame_InGameOperationTool_CloseUI);
var btn_find = new lib.util.TxtBtn(container_mc.containerMc.find_mc,container_mc.containerMc.find_txt);
btn_find.setRelease(ToGame_InGameOperationTool_CheckCharacterName);
btn_find.setEnabled(false);
var btn_monfind = new lib.util.TxtBtn(container_mc.containerMc.monfind_mc,container_mc.containerMc.monfind_txt);
btn_monfind.setRelease(ToGame_InGameOperationTool_MonsterRange);
btn_monfind.setEnabled(false);
var btn_monremove = new lib.util.TxtBtn(container_mc.containerMc.monremove_mc,container_mc.containerMc.monremove_txt);
btn_monremove.setRelease(ToGame_InGameOperationTool_KillMonster);
btn_monremove.setEnabled(false);
var btn_DBIDfind = new lib.util.TxtBtn(container_mc.DBIDfind_mc,container_mc.DBIDfind_txt);
btn_DBIDfind.setRelease(ToGame_InGameOperationTool_DBID);
btn_DBIDfind.setEnabled(false);
var btn_alertMessage = new lib.util.TxtBtn(container_mc.alertMessage_mc,container_mc.alertMessage_txt);
btn_alertMessage.setRelease(ToGame_InGameOperationTool_AlertMessage);
btn_alertMessage.setEnabled(false);
var BTNCOUNT = 25;
var i = 0;
while(i < BTNCOUNT)
{
   if(i == 11)
   {
      var btn_Invi = new lib.util.TxtBtn(container_mc.containerMc["btn" + i + "_mc"],container_mc.containerMc["btn" + i + "_txt"]);
      btn_Invi.setToggleMode(true);
      btn_Invi.setRelease(ToGame_InGameOperationTool_RequestInvisible);
   }
   else if(i == 12)
   {
      var btn_God = new lib.util.TxtBtn(container_mc.containerMc["btn" + i + "_mc"],container_mc.containerMc["btn" + i + "_txt"]);
      btn_God.setToggleMode(true);
      btn_God.setRelease(ToGame_InGameOperationTool_RequestGod);
   }
   else if(i == 13)
   {
      var btn_NotAware = new lib.util.TxtBtn(container_mc.containerMc["btn" + i + "_mc"],container_mc.containerMc["btn" + i + "_txt"]);
      btn_NotAware.setToggleMode(true);
      btn_NotAware.setRelease(ToGame_InGameOperationTool_RequestNotAware);
   }
   else if(i == 14)
   {
      var btn_Speed = new lib.util.TxtBtn(container_mc.containerMc["btn" + i + "_mc"],container_mc.containerMc["btn" + i + "_txt"]);
      btn_Speed.setRelease(ToGame_InGameOperationTool_RequestSpeed);
   }
   else if(i == 17)
   {
      var btn_Crash = new lib.util.TxtBtn(container_mc.containerMc["btn" + i + "_mc"],container_mc.containerMc["btn" + i + "_txt"]);
      btn_Crash.setToggleMode(true);
      btn_Crash.setRelease(ToGame_InGameOperationTool_RequestCrash);
   }
   else if(i == 19)
   {
      var btn_NPCspawn = new lib.util.TxtBtn(container_mc.containerMc.npcSpawnMc["btn" + i + "_mc"],container_mc.containerMc.npcSpawnMc["btn" + i + "_txt"]);
      btn_NPCspawn.setRelease(ToGame_InGameOperationTool_RequestNpcSpawn);
   }
   else
   {
      var btnIns = new lib.util.TxtBtn(container_mc.containerMc["btn" + i + "_mc"],container_mc.containerMc["btn" + i + "_txt"]);
      btnIns.btn.ordrIndex = i;
      btnIns.btn.onRelease2 = function()
      {
         ToGame_InGameOperationTool_Event(this.ordrIndex);
      };
      btnIns.setRelease();
   }
   i++;
}
var chNameFd = new lib.util.ExtTextField(container_mc.containerMc.chNameFd,0,container_mc.containerMc.chNameFd_focus);
chNameFd.onEnterKey = function()
{
   ToGame_InGameOperationTool_CheckCharacterName();
};
chNameFd.onChanged = function()
{
   var _loc3_ = lib.util.ExtString.trim(this.text);
   btn_find.setEnabled(_loc3_ != "" && _loc3_ != undefined);
   var _loc2_ = 0;
   if(NameTextLength_Local > 0)
   {
      _loc2_ = NameTextLength_Local;
   }
   else
   {
      _loc2_ = 40;
   }
   lib.util.StrByteLen.getLenth3(container_mc.containerMc.chNameFd,_loc2_);
};
var chNameFd2 = new lib.util.ExtTextField(container_mc.containerMc.chNameFd2,1,container_mc.containerMc.chNameFd_focus2);
chNameFd2.min = 0;
chNameFd2.max = 1000;
chNameFd2.onEnterKey = function()
{
   ToGame_InGameOperationTool_MonsterRange();
};
chNameFd2.onChanged = function(f)
{
   var _loc3_ = lib.util.ExtString.trim(this.text);
   btn_monfind.setEnabled(f);
   btn_monremove.setEnabled(f);
   var _loc2_ = 0;
   if(NameTextLength_Local > 0)
   {
      _loc2_ = NameTextLength_Local;
   }
   else
   {
      _loc2_ = 40;
   }
   lib.util.StrByteLen.getLenth3(container_mc.containerMc.chNameFd2,_loc2_);
};
var chNameFd3 = new lib.util.ExtTextField(container_mc.chNameFd3,0,container_mc.chNameFd_focus3);
chNameFd3.onEnterKey = function()
{
   ToGame_InGameOperationTool_DBID();
};
chNameFd3.onChanged = function(f)
{
   btn_DBIDfind.setEnabled(f);
};
var chNameFd4 = new lib.util.ExtTextField(container_mc.chNameFd4,0,container_mc.chNameFd_focus4);
chNameFd4.onEnterKey = function()
{
   ToGame_InGameOperationTool_AlertMessage();
};
chNameFd4.onChanged = function(f)
{
   btn_alertMessage.setEnabled(f);
};
var chNameFd5 = new lib.util.ExtTextField(container_mc.containerMc.npcSpawnMc.chNameFd5,0,container_mc.containerMc.npcSpawnMc.chNameFd_focus5);
var chNameFd6 = new lib.util.ExtTextField(container_mc.containerMc.npcSpawnMc.chNameFd6,0,container_mc.containerMc.npcSpawnMc.chNameFd_focus6);
var chNameFd7 = new lib.util.ExtTextField(container_mc.containerMc.npcSpawnMc.chNameFd7,0,container_mc.containerMc.npcSpawnMc.chNameFd_focus7);
var chNameFd8 = new lib.util.ExtTextField(container_mc.containerMc.npcSpawnMc.chNameFd8,1,container_mc.containerMc.npcSpawnMc.chNameFd_focus8);
chNameFd8.min = 0;
chNameFd8.max = 1000;
chNameFd8.onEnterKey = function()
{
   ToGame_InGameOperationTool_RequestSpawnRange();
};
container_mc.containerMc.npcSpawnMc.npcCheckBtn.onChanged = function()
{
   ToGame_InGameOperationTool_CheckAggressive(Number(this.checked));
};
var btn_find2 = new lib.util.TxtBtn(container_mc.containerMc_DG.find_mc,container_mc.containerMc_DG.find_txt);
btn_find2.setRelease(ToGame_InGameOperationTool_RequestDungeonSearch);
btn_find2.setEnabled(false);
var chNameFd9 = new lib.util.ExtTextField(container_mc.containerMc_DG.chNameFd,0,container_mc.containerMc_DG.chNameFd_focus);
chNameFd9.onEnterKey = function()
{
   ToGame_InGameOperationTool_RequestDungeonSearch();
};
chNameFd9.onChanged = function()
{
   var _loc3_ = lib.util.ExtString.trim(this.text);
   lib.util.StrByteLen.getLenth3(container_mc.containerMc_DG.chNameFd,4);
   var _loc2_ = _loc3_.length;
   if(_loc2_ > 3)
   {
      btn_find2.setEnabled(true);
   }
   else
   {
      btn_find2.setEnabled(false);
   }
};
Selection.setFocus(chNameFd.textField);
var eventBtnArr = [];
var evetnBrtnTag = ["STATE","START","REVIVAL","END","INVITE","KICK"];
var noticeTextLength = 0;
var noticeTF = new lib.util.ExtTextField(container_mc.containerMc_EV.notice_txt,0,container_mc.containerMc_EV.notice_focus);
myListener.OnGame_InGameOperationTool_SetEventBtn = function(index, bool)
{
   var _loc1_ = eventBtnArr[index];
   _loc1_.setEnabled(Boolean(Number(bool)));
};
myListener.OnGame_InGameOperationTool_SetEventNoticeLength = function(len)
{
   noticeTextLength = Number(len);
};
myListener.OnGame_InGameOperationTool_SetEventState = function(str)
{
   container_mc.containerMc_EV.state_txt.htmlText = str;
};
var eventDrop = container_mc.containerMc_EV.event_drop;
var dropobj2 = {};
dropobj2.onChanged = function()
{
   ToGame_InGameOperationTool_EventListChange();
};
eventDrop.addListener(dropobj2);
myListener.OnGame_InGameOperationTool_SetEventList = function(dataList, selectIndex)
{
   var _loc1_ = lib.util.ExtString.split(dataList,"\t");
   eventDrop.removeListener(dropobj2);
   eventDrop.data = _loc1_;
   eventDrop.setSelectedIndex(Number(selectIndex));
   eventDrop.addListener(dropobj2);
};
var chNameFd10 = new lib.util.ExtTextField(container_mc.containerMc_EV.chNameFd,0,container_mc.containerMc_EV.chNameFd_focus);
chNameFd10.onEnterKey = function()
{
   Selection.setFocus(null);
};
chNameFd10.onChanged = function()
{
   var _loc3_ = lib.util.ExtString.trim(this.text);
   btn_find.setEnabled(_loc3_ != "" && _loc3_ != undefined);
   var _loc2_ = 0;
   if(NameTextLength_Local > 0)
   {
      _loc2_ = NameTextLength_Local;
   }
   else
   {
      _loc2_ = 40;
   }
   lib.util.StrByteLen.getLenth3(container_mc.containerMc_EV.chNameFd,_loc2_);
};
EVInit();
myListener.OnGame_InGameOperationTool_LengthLocal = function(lengthnum)
{
   lib.Debuger.trace("OnGame_InGameOperationTool_LengthLocal : " + lengthnum);
   NameTextLength_Local = lengthnum;
};
var containerY = container_mc.containerMc._y;
container_mc.containerMc.onScroll = function(a, b, c)
{
   this._y = containerY - arguments[0];
};
container_mc.scrollbar.setWheel(container_mc.containerMc);
container_mc.scrollbar.addListener(container_mc.containerMc);
container_mc.scrollbar.pageSize = container_mc.containerMc._height + 50;
container_mc.scrollbar.displaySize = container_mc.maskMc._height;
container_mc.scrollbar.rowHeight = 100;
myListener.OnGame_InGameOperationTool_SetEnableNpcSpawn(0);
BFInit();
ToGame_InGameOperationTool_Init();
