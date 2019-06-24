function ToGame_ParcelPostLog_Init()
{
   fscommand("ToGame_ParcelPostLog_Init");
}
function ToGame_ParcelPostLog_CloseUI()
{
   fscommand("ToGame_ParcelPostLog_CloseUI");
}
function ToGame_ParcelPostLog_RequestMessage(index)
{
   getURL("FSCommand:ToGame_ParcelPostLog_RequestMessage",index);
}
function ToGame_ParcelPostLog_RequestPage(pageNumber)
{
   getURL("FSCommand:ToGame_ParcelPostLog_RequestPage",pageNumber);
}
function ToGame_ParcelPostLog_ChangeMode(mode)
{
   getURL("FSCommand:ToGame_ParcelPostLog_ChangeMode",mode);
}
function ToGame_ParcelPostLog_RemoveMessage()
{
   if(deleteList.length == 0)
   {
      return undefined;
   }
   var _loc1_ = deleteList.join("\t");
   getURL("FSCommand:ToGame_ParcelPostLog_RemoveMessage",_loc1_);
}
function ToGame_ParcelPostLog_CheckBtn(flag)
{
   getURL("FSCommand:ToGame_ParcelPostLog_CheckBtn",flag);
}
function ToGame_ParcelPostLog_RequestWrite()
{
   fscommand("ToGame_ParcelPostLog_RequestWrite");
}
function ToGame_ParcelPostLog_RequestList(pageNumber)
{
   getURL("FSCommand:ToGame_ParcelPostLog_RequestList",pageNumber);
}
function ToGame_ParcelPostLog_RemoveCheck(index, _state)
{
   getURL("FSCommand:ToGame_ParcelPostLog_RemoveCheck",index + "\t" + _state);
}
function clearLog()
{
   var _loc3_ = 0;
   while(_loc3_ < LINELENGTH)
   {
      var _loc2_ = containerMc["line" + _loc3_];
      _loc2_.checkBox.enabled = false;
      var _loc1_ = 0;
      while(_loc1_ < 4)
      {
         _loc2_["txt_" + _loc1_].verticalAlign = "center";
         _loc2_["txt_" + _loc1_].text = "";
         _loc2_["txt_" + _loc1_]._alpha = 100;
         _loc2_.iconMc._alpha = 100;
         _loc1_ = _loc1_ + 1;
      }
      _loc2_._visible = false;
      _loc3_ = _loc3_ + 1;
   }
   removeCheck(null,false);
}
function removeCheck(index, _state)
{
   lib.Debuger.trace("11111" + index + " / " + _state);
   if(index == null)
   {
      deleteList = [];
   }
   if(index == null)
   {
      deleteList = [];
      var _loc2_ = 0;
      while(_loc2_ < LINELENGTH)
      {
         var _loc1_ = containerMc["line" + _loc2_];
         _loc1_.checkBox.checked = _state && _loc1_.checkBox.enabled;
         if(_state && _loc1_.checkBox.enabled)
         {
            deleteList.push(_loc1_.index);
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   else
   {
      _loc2_ = 0;
      while(_loc2_ < deleteList.length)
      {
         var _loc3_ = deleteList[_loc2_];
         if(_loc3_ == index)
         {
            deleteList.splice(_loc2_,1);
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
      if(_state)
      {
         deleteList.push(index);
      }
   }
   if(!_state)
   {
      containerMc.checkAll.checked = false;
   }
   lib.Debuger.trace("22222" + index + " / " + _state);
   remove_btn.setEnabled(deleteList.length > 0);
   ToGame_ParcelPostLog_RemoveCheck(index,_state);
}
function release(num, blockEvent)
{
   if(!blockEvent)
   {
      ToGame_ParcelPostLog_ChangeMode(num);
   }
}
var UI = this;
UI._visible = false;
var bWidgetOpen = false;
var UIname = "ParcelPostLog";
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
container_mc.recieveContainerMc.defaultStr.setText(lib.util.UIString.getUIString("$111039"));
container_mc.sendContainerMc.defaultStr.setText(lib.util.UIString.getUIString("$111039"));
container_mc.title_txt.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
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
   container_mc.ToolTip._visible = bShow;
};
var LINELENGTH = 12;
var NORMALCOLOR = 13421772;
var SYSTEMCOLOR = 15335424;
var DISABLEALPHA = 30;
var MAXMESSAGE = 100;
var isMode = 0;
var containerMc = container_mc.recieveContainerMc;
var deleteList = [];
var selectLineMc;
var tab = container_mc.tabBtn.tab;
var strObj = {recieveStr0:lib.util.UIString.getUIString("$201025"),recieveStr1:lib.util.UIString.getUIString("$201026"),recieveStr2:lib.util.UIString.getUIString("$201013"),messageType0:lib.util.UIString.getUIString("$202012"),messageType1:lib.util.UIString.getUIString("$202013"),messageType2:lib.util.UIString.getUIString("$202014")};
var SYSTEM_STR = lib.util.UIString.getUIString("$201028");
var SENDBACKM_STR = lib.util.UIString.getUIString("$201029");
myListener.OnGame_ParcelPostLog_SetData = function(dataList, currentPage, totalPage, totalMessge)
{
   clearLog();
   container_mc.numberSteper.setPage(Number(currentPage),Number(totalPage));
   var _loc12_ = totalMessge < 70?lib.info.TextColor.GENERAL_NORMAL.toString(16):lib.info.TextColor.GENERAL_CRITICAL.toString(16);
   container_mc.countFd.htmlText = "<font color=\'#80e71c\'>" + totalMessge + "</font>" + "/" + "<font color=\'#d7d7d7\'>" + MAXMESSAGE + "</font>";
   var _loc16_ = lib.util.ExtString.split(dataList,"\n");
   if(_loc16_[0] != undefined && _loc16_[0] != "")
   {
      containerMc.defaultStr._visible = false;
   }
   else
   {
      containerMc.defaultStr._visible = true;
   }
   var _loc8_ = 0;
   while(_loc8_ < LINELENGTH)
   {
      var _loc5_ = lib.util.ExtString.split(_loc16_[_loc8_],"\t");
      var _loc2_ = containerMc["line" + _loc8_];
      var _loc4_ = Number(_loc5_[0]);
      var _loc11_ = Number(_loc5_[1]);
      var _loc14_ = _loc5_[2];
      var _loc3_ = _loc5_[3];
      var _loc10_ = Number(_loc5_[4]);
      var _loc9_ = Number(_loc5_[5]);
      var _loc15_ = _loc5_[6];
      if(_loc4_ == 3)
      {
         _loc2_.txt_0.textColor = 8447772;
         _loc2_.txt_1.textColor = 8447772;
         _loc2_.txt_2.textColor = 8447772;
      }
      else
      {
         _loc2_.txt_0.textColor = 14145495;
         _loc2_.txt_1.textColor = 14145495;
         _loc2_.txt_2.textColor = 14145495;
      }
      if(_loc5_ != undefined)
      {
         _loc2_._visible = true;
         _loc2_.index = _loc8_;
         _loc2_.txt_0.text = _loc14_;
         if(_loc11_ == 1)
         {
            if(_loc4_ == 3)
            {
               _loc3_ = "<font color=\'#" + lib.info.TextColor.SYSTEM_MESSAGE.toString(16) + "\'>" + SYSTEM_STR + "</font>" + "<font color=\'#80e71c\'>" + _loc3_ + "</font>";
            }
            else
            {
               _loc3_ = "<font color=\'#" + lib.info.TextColor.SYSTEM_MESSAGE.toString(16) + "\'>" + SYSTEM_STR + "</font>" + _loc3_;
            }
         }
         else if(_loc11_ == 2)
         {
            if(_loc4_ == 3)
            {
               _loc3_ = "<font color=\'#" + lib.info.TextColor.PARCELPOST_STATE_SENDBACK.toString(16) + "\'>" + SENDBACKM_STR + "</font>" + "<font color=\'#80e71c\'>" + _loc3_ + "</font>";
            }
            else
            {
               _loc3_ = "<font color=\'#" + lib.info.TextColor.PARCELPOST_STATE_SENDBACK.toString(16) + "\'>" + SENDBACKM_STR + "</font>" + _loc3_;
            }
         }
         if(_loc4_ == 3)
         {
            _loc3_ = "</font><font color=\'#80e71c\'>" + _loc3_ + "</font>";
            lib.util.ExtString.textCut(_loc2_.txt_1,_loc3_,true);
         }
         else
         {
            lib.util.ExtString.textCut(_loc2_.txt_1,_loc3_,true);
         }
         _loc2_.iconMc.gotoAndStop(_loc4_ + 1);
         var _loc7_ = "";
         if(isMode == 0)
         {
            _loc7_ = strObj["messageType" + _loc4_];
         }
         else
         {
            if(_loc4_ == 0)
            {
               _loc7_ = _loc7_ + lib.util.UIString.getUIString("$202012");
            }
            else
            {
               _loc7_ = _loc7_ + lib.util.UIString.getUIString("$202013");
            }
            if(_loc10_ == 0)
            {
               _loc7_ = _loc7_ + (" " + lib.util.UIString.getUIString("$202025"));
            }
            else
            {
               _loc7_ = _loc7_ + (" " + lib.util.UIString.getUIString("$202026"));
            }
         }
         lib.manager.ToolTip.add(_loc2_.iconMc,_loc7_,1);
         if(_loc10_ && !isMode)
         {
            _loc2_.txt_0._alpha = DISABLEALPHA;
            _loc2_.txt_1._alpha = DISABLEALPHA;
         }
         _loc2_.txt_2.setText(_loc15_);
         if(_loc9_ && !isMode)
         {
            _loc2_.iconMc._alpha = DISABLEALPHA;
         }
         else if(isMode)
         {
            _loc12_ = lib.info.TextColor.PARCELPOST_STATE_UNPAYMENT.toString(16);
            if(_loc9_ == 1)
            {
               _loc12_ = lib.info.TextColor.PARCELPOST_STATE_RECEIVED.toString(16);
            }
            else if(_loc9_ == 2)
            {
               _loc12_ = lib.info.TextColor.PARCELPOST_STATE_SENDBACK.toString(16);
            }
         }
         if(_loc4_ == 0)
         {
            if(_loc10_ == 0)
            {
               _loc2_.iconMc.iconMc.gotoAndStop(1);
            }
            else
            {
               _loc2_.iconMc.iconMc.gotoAndStop(2);
            }
         }
         else if(_loc9_)
         {
            _loc2_.iconMc.iconMc.gotoAndStop(2);
         }
         else
         {
            _loc2_.iconMc.iconMc.gotoAndStop(1);
         }
         _loc2_.hit.onRollOver = function()
         {
            var _loc2_ = this._parent;
            if(selectLineMc == _loc2_)
            {
               _loc2_.effect_mc.gotoAndStop("press");
            }
            else
            {
               _loc2_.t0_txt.textColor = lib.info.TextColor.LIST_OVER;
               _loc2_.t0_txt.textColor = lib.info.TextColor.LIST_OVER;
               _loc2_.t2_txt.textColor = lib.info.TextColor.LIST_OVER;
               _loc2_.effect_mc.gotoAndStop("over");
            }
         };
         _loc2_.hit.onRollOut = _loc2_.hit.onReleaseOutside = function()
         {
            var _loc2_ = this._parent;
            if(selectLineMc == _loc2_)
            {
               _loc2_.effect_mc.gotoAndStop("active");
            }
            else
            {
               _loc2_.t0_txt.textColor = lib.info.TextColor.LIST_NORMAL;
               _loc2_.t1_txt.textColor = lib.info.TextColor.LIST_NORMAL;
               _loc2_.t2_txt.textColor = lib.info.TextColor.LIST_NORMAL;
               _loc2_.effect_mc.gotoAndStop("out");
            }
         };
         _loc2_.hit.onPress = function()
         {
            var _loc2_ = this._parent;
            if(selectLineMc == _loc2_)
            {
               return undefined;
            }
            _loc2_.t0_txt.textColor = lib.info.TextColor.LIST_PRESS;
            _loc2_.t2_txt.textColor = lib.info.TextColor.LIST_PRESS;
            _loc2_.effect_mc.gotoAndStop("active");
         };
         _loc2_.hit.onRelease = function()
         {
            var _loc2_ = this._parent;
            if(selectLineMc != _loc2_)
            {
               _loc2_.t0_txt.textColor = lib.info.TextColor.LIST_ACTIVE;
               _loc2_.t2_txt.textColor = lib.info.TextColor.LIST_ACTIVE;
               _loc2_.t1_txt.textColor = lib.info.TextColor.LIST_ACTIVE;
               var _loc3_ = selectLineMc;
               selectLineMc = _loc2_;
               _loc3_.hit.onRollOut();
            }
            ToGame_ParcelPostLog_RequestMessage(_loc2_.index);
         };
         if(_loc4_ != 0 && !isMode && _loc9_ == 0)
         {
            _loc2_.checkBox.enabled = false;
            _loc2_.checkBox._alpha = 20;
            lib.manager.ToolTip.add(_loc2_.checkBox,"$202019",1);
         }
         else
         {
            _loc2_.checkBox.enabled = true;
            _loc2_.checkBox._alpha = 100;
            lib.manager.ToolTip.remove(_loc2_.checkBox);
         }
         _loc2_.checkBox.onChanged = function(_checked)
         {
            removeCheck(this._parent.index,_checked);
         };
      }
      _loc8_ = _loc8_ + 1;
   }
};
myListener.OnGame_ParcelPostLog_ChangeMode = function(_mode)
{
   isMode = Number(_mode);
   tab.setTab(isMode,1);
   if(isMode == 0)
   {
      containerMc = container_mc.recieveContainerMc;
   }
   else
   {
      containerMc = container_mc.sendContainerMc;
   }
   container_mc.recieveContainerMc._visible = isMode == 0;
   container_mc.sendContainerMc._visible = isMode != 0;
};
myListener.OnGame_ParcelPostLog_SetReadMail = function(flag)
{
   container_mc.recieveContainerMc.checkBtn.checked = Boolean(Number(flag));
};
myListener.OnGame_ParcelPostLog_SetRemoveButton = function(flag)
{
   remove_btn.setEnabled(Boolean(Number(flag)));
};
var remove_btn = container_mc.txtBtn0.txtBtn;
var x_btn = new lib.util.TxtBtn(container_mc.x_mc);
var write_btn = container_mc.txtBtn1.txtBtn;
close_btn.setRelease(ToGame_ParcelPostLog_CloseUI);
x_btn.setRelease(ToGame_ParcelPostLog_CloseUI);
write_btn.setRelease(ToGame_ParcelPostLog_RequestWrite);
remove_btn.setRelease(ToGame_ParcelPostLog_RemoveMessage);
remove_btn.setEnabled(false);
send_btn.setEnabled(false);
tab.setRelease(release);
container_mc.numberSteper.onChanged = function(num)
{
   ToGame_ParcelPostLog_RequestPage(num);
};
container_mc.recieveContainerMc.checkBtn.setText(container_mc.recieveContainerMc.checkLb);
container_mc.recieveContainerMc.checkBtn.onChanged = function(checked)
{
   ToGame_ParcelPostLog_CheckBtn(Number(checked));
};
lib.manager.ToolTip.add(container_mc.recieveContainerMc.checkAll,lib.util.UIString.getUIString("$202015"),1);
lib.manager.ToolTip.add(container_mc.sendContainerMc.checkAll,lib.util.UIString.getUIString("$202015"),1);
container_mc.recieveContainerMc.checkAll.onChanged = function(checked)
{
   removeCheck(null,checked);
};
container_mc.sendContainerMc.checkAll.onChanged = function(checked)
{
   removeCheck(null,checked);
};
container_mc.checkBtn.onChanged = function(_checked)
{
   ToGame_ParcelPostLog_CheckBtn(Number(_checked));
};
container_mc.numberSteper.onChanged = function(page)
{
   ToGame_ParcelPostLog_RequestList(page);
};
container_mc.numberSteper.setPage(1,1);
ToGame_ParcelPostLog_Init();
