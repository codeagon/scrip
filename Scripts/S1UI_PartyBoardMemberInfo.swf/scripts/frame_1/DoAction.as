function ToGame_PartyBoardMemberInfo_Whisper()
{
   fscommand("ToGame_PartyBoardMemberInfo_Whisper");
}
function ToGame_PartyBoardMemberInfo_Volunteer()
{
   fscommand("ToGame_PartyBoardMemberInfo_Volunteer");
}
function ToGame_PartyBoardMemberInfo_Invite()
{
   fscommand("ToGame_PartyBoardMemberInfo_Invite");
}
function ToGame_PartyBoardMemberInfo_CloseUI()
{
   fscommand("ToGame_PartyBoardMemberInfo_CloseUI");
}
function ToGame_PartyBoardMemberInfo_ClickLine(id)
{
   getURL("FSCommand:ToGame_PartyBoardMemberInfo_ClickLine",id);
}
function closeUI()
{
   ToGame_PartyBoardMemberInfo_CloseUI();
}
function action()
{
   if(Mode == 0)
   {
      ToGame_PartyBoardMemberInfo_Volunteer();
   }
   else if(Mode == 1)
   {
      ToGame_PartyBoardMemberInfo_Invite();
   }
}
var UI = this;
UI._visible = false;
var UIname = "PartyBoardMemberInfo";
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
var con = this;
container_mc.text_name.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
container_mc.explain_0.textColor = lib.info.TextColor.GENERAL_EXPLAIN_DETAIL;
container_mc.purpose_txt.textColor = lib.info.TextColor.GENERAL_CONTENTS;
container_mc.defaultStr.textColor = lib.info.TextColor.GENERAL_DISABLE;
lib.util.ExtString.textCut(container_mc.refresh_txt,lib.util.UIString.getUIString("$331002"),1);
container_mc.defaultStr.setText(lib.util.UIString.getUIString("$111039"));
bWidgetOpen = false;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
var Mode = 0;
var w1 = 156;
var w2 = 129;
var scrollBar = container_mc.scrollbar;
var listObj = {};
scrollBar.addListener(listObj);
var list_mcY = container_mc.list_mc._y;
listObj.onScroll = function()
{
   container_mc.list_mc._y = list_mcY - arguments[0];
};
scrollBar.setWheel(container_mc.list_mc);
scrollBar.wheelDelta = 1;
scrollBar.pageSize = 0;
scrollBar.displaySize = container_mc.mask_mc._height;
scrollBar.defaultBarSizeRatio = 0.3333333333333333;
scrollBar.rowHeight = 30;
scrollBar.scroll = 0;
scrollBar._visible = false;
myListener.OnGameEventShowWindow = function(widgetName, bShow)
{
   if(widgetName.toLowerCase() == UIname.toLowerCase())
   {
      bWidgetOpen = bShow;
      if(_global.gbUIMode && bWidgetOpen)
      {
         UI._visible = true;
      }
      else
      {
         UI._visible = false;
      }
      if(UI._visible == false)
      {
         lib.util.InteractionGroup.delInteraction(UIname);
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
myListener.OnGame_PartyBoardMemberInfo_SetMode = function(mode)
{
   Mode = Number(mode);
   if(Mode == 0)
   {
      container_mc.text_name.text = lib.util.UIString.getUIString("$333001");
      action_btn.setText(lib.util.UIString.getUIString("$333010"));
      container_mc.defaultStr.setText(lib.util.UIString.getUIString("$111039"));
   }
   else if(Mode == 1)
   {
      container_mc.text_name.text = lib.util.UIString.getUIString("$333002");
      action_btn.setText(lib.util.UIString.getUIString("$333009"));
      container_mc.defaultStr.setText(lib.util.UIString.getUIString("$333012"));
   }
};
var lineContainer = container_mc.list_mc;
var lineName = "line";
var list = new lib.util.List(lineContainer,lineName,0);
var clickStat = null;
var clickId = null;
myListener.OnGame_PartyBoardMemberInfo_SetData = function(purpose, dataList)
{
   list.clear();
   clickStat = clickId = null;
   container_mc.purpose_txt.setText(purpose);
   var _loc8_ = dataList.split("\n");
   if(_loc8_[_loc8_.length - 1] == "0" || _loc8_[_loc8_.length - 1] == "undefined" || _loc8_[_loc8_.length - 1] == "")
   {
      _loc8_.pop();
   }
   if(_loc8_[0] != undefined && _loc8_[0] != "")
   {
      container_mc.defaultStr._visible = false;
   }
   else
   {
      container_mc.defaultStr._visible = true;
   }
   var _loc9_ = _loc8_.length;
   if(_loc9_ > 10)
   {
      scrollBar._visible = true;
   }
   else
   {
      scrollBar._visible = false;
   }
   var _loc4_ = 0;
   while(_loc4_ < _loc9_)
   {
      var _loc3_ = _loc8_[_loc4_].split("\t");
      if(_loc3_.length != 1)
      {
         if(Mode == 0)
         {
            lineName = "line";
         }
         else if(Mode == 1)
         {
            lineName = "line2";
         }
         var _loc2_ = list.add(_loc3_[0],lineName);
         var _loc5_ = Number(_loc3_[5]);
         var _loc6_ = Number(_loc3_[7]);
         var _loc7_ = Number(_loc3_[8]) == 1;
         if(_loc5_ == 1)
         {
            _loc2_.partyMaster_mc._visible = true;
            _loc2_.partyMaster_mc.gotoAndStop(1);
         }
         else if(_loc5_ == 2)
         {
            _loc2_.partyMaster_mc._visible = true;
            _loc2_.partyMaster_mc.gotoAndStop(2);
         }
         else
         {
            _loc2_.partyMaster_mc.gotoAndStop(1);
            _loc2_.partyMaster_mc._visible = false;
         }
         _loc2_.block_mc._visible = _loc6_;
         if(_loc6_)
         {
            _loc2_.txt0._width = 96.7;
            _loc2_.txt0._x = 32.8;
            lib.manager.ToolTip.add(_loc2_.block_mc,lib.util.UIString.getUIString("$101085"),1);
         }
         else
         {
            _loc2_.txt0._width = 116;
            _loc2_.txt0._x = 16;
         }
         _loc2_.txt0.setText(_loc3_[1]);
         _loc2_.txt1.setText(_loc3_[2]);
         _loc2_.txt2.setText(_loc3_[3]);
         _loc2_.txt3.setText(_loc3_[4]);
         _loc2_.stat = _loc4_;
         _loc2_.hit_mc.onRollOver = function()
         {
            if(clickStat != this._parent.stat)
            {
               this._parent.effect_mc.gotoAndStop("over");
            }
         };
         _loc2_.hit_mc.onRollOut = _loc2_.hit_mc.onReleaseOutside = function()
         {
            if(clickStat != this._parent.stat)
            {
               this._parent.effect_mc.gotoAndStop("out");
            }
         };
         _loc2_.hit_mc.onRelease = function()
         {
            if(clickStat != this._parent.stat)
            {
               list.getItem(clickId).effect_mc.gotoAndStop("out");
               clickStat = this._parent.stat;
               clickId = this._parent.id;
               purpose = this._parent.purpose;
               this._parent.effect_mc.gotoAndStop("active");
            }
            ToGame_PartyBoardMemberInfo_ClickLine(this._parent.id);
         };
         if(_loc5_)
         {
            _loc2_.txt0.textColor = _loc2_.txt1.textColor = _loc2_.txt2.textColor = _loc2_.txt3.textColor = lib.info.TextColor.LIST_PARTYBOARD_MY;
            if(_loc2_.partyMaster_mc._currentframe == 1)
            {
               lib.manager.ToolTip.add(_loc2_.partyMaster_mc,lib.util.UIString.getUIString("$101083"),1);
            }
            else
            {
               lib.manager.ToolTip.add(_loc2_.partyMaster_mc,lib.util.UIString.getUIString("$333013"),1);
            }
         }
         if(_loc3_[6] == "1")
         {
            _loc2_.txt0.textColor = _loc2_.txt1.textColor = _loc2_.txt2.textColor = _loc2_.txt3.textColor = lib.info.TextColor.GENERAL_OFFLINE;
            lib.manager.ToolTip.add(_loc2_.hit_mc,lib.util.UIString.getUIString("$102146"),1);
         }
         if(!_loc5_ && _loc3_[6] != "1")
         {
            lib.manager.ToolTip.remove(_loc2_.hit_mc);
         }
         if(_loc7_)
         {
            _loc2_.txt0.textColor = _loc2_.txt1.textColor = _loc2_.txt2.textColor = _loc2_.txt3.textColor = lib.info.TextColor.GENERAL_IMPOSSIBLE;
         }
         lib.util.InteractionGroup.addInteraction(UIname,_loc3_[1],_loc2_.txt100);
      }
      _loc4_ = _loc4_ + 1;
   }
   scrollBar.pageSize = container_mc.list_mc._height;
};
myListener.OnGame_PartyBoardMemberInfo_SetEnableWhisperBtn = function(bEnable)
{
   bEnable = Number(bEnable);
   whisper_btn.setEnabled(bEnable);
};
myListener.OnGame_PartyBoardMemberInfo_SetEnableVolunteerBtn = function(bEnable)
{
   bEnable = Number(bEnable);
   action_btn.setEnabled(bEnable);
};
myListener.OnGame_PartyBoardMemberInfo_SetEnableInviteBtn = function(bEnable)
{
   bEnable = Number(bEnable);
   action_btn.setEnabled(bEnable);
};
var x_btn = new lib.util.TxtBtn(container_mc.x_mc);
var action_btn = container_mc.txtBtn1.txtBtn;
var whisper_btn = container_mc.txtBtn0.txtBtn;
action_btn.setEnabled(false);
whisper_btn.setEnabled(false);
x_btn.setRelease(closeUI);
whisper_btn.setRelease(function()
{
   ToGame_PartyBoardMemberInfo_Whisper();
}
);
action_btn.setRelease(action);
fscommand("ToGame_PartyBoardMemberInfo_Init");
