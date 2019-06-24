function ToGame_NoteLog_Init()
{
   lib.Debuger.trace("ToGame_NoteLog_Init");
   fscommand("ToGame_NoteLog_Init");
}
function ToGame_NoteLog_CloseUI()
{
   lib.Debuger.trace("ToGame_NoteLog_CloseUI");
   fscommand("ToGame_NoteLog_CloseUI");
}
function ToGame_NoteLog_RequestMode(_mode)
{
   lib.Debuger.trace("ToGame_NoteLog_RequestMode   messageMode : " + _mode);
   getURL("FSCommand:ToGame_NoteLog_CloseUI",_mode);
}
function ToGame_NoteLog_RequestSort(sortId)
{
   lib.Debuger.trace("ToGame_NoteLog_RequestSort   sortId : " + sortId);
   getURL("FSCommand:ToGame_NoteLog_RequestSort",sortId);
}
function ToGame_NoteLog_Remove()
{
   if(deleteList.length == 0)
   {
      return undefined;
   }
   var _loc1_ = deleteList.join("\n");
   lib.Debuger.trace("ToGame_NoteLog_Remove   dels : " + _loc1_);
   getURL("FSCommand:ToGame_NoteLog_Remove",_loc1_);
}
function ToGame_NoteLog_RequestRead(id)
{
   lib.Debuger.trace("ToGame_NoteLog_RequestRead  id : " + id);
   getURL("FSCommand:ToGame_NoteLog_RequestRead",id);
}
function ToGame_NoteLog_RequestReceiveState(_state)
{
   lib.Debuger.trace("ToGame_NoteLog_RequestReceiveState  state : " + _state);
   getURL("FSCommand:ToGame_NoteLog_RequestReceiveState",_state);
}
function ToGame_NoteLog_RequestMessageState(id, _state)
{
   lib.Debuger.trace("ToGame_NoteLog_RequestMessageState  id : " + id + "  state : " + _state);
   getURL("FSCommand:ToGame_NoteLog_RequestMessageState",id + "\t" + _state);
}
function ToGame_NoteLog_RequestPage(page)
{
   lib.Debuger.trace("ToGame_NoteLog_RequestPage    page : " + page);
   getURL("FSCommand:ToGame_NoteLog_RequestPage",page);
}
function ToGame_NoteLog_Send()
{
   var _loc1_ = container_mc.writeContainer.sendNameFd.text;
   var _loc2_ = container_mc.writeContainer.recieveNameFd.text;
   if(_loc1_ != "" && _loc1_ != undefined && _loc2_ != "" && _loc2_ != undefined && container_mc.writeContainer.messageFd.text != "")
   {
      lib.Debuger.trace("ToGame_NoteLog_Send  " + _loc1_ + "  " + _loc2_ + "  " + container_mc.writeContainer.messageFd.text);
      getURL("FSCommand:ToGame_NoteLog_Send",_loc1_ + "\t" + _loc2_ + "\t" + container_mc.writeContainer.messageFd.text);
   }
}
function ToGame_NoteLog_RequestNameFind(__name)
{
   lib.Debuger.trace("ToGame_NoteLog_RequestNameFind  " + __name);
   getURL("FSCommand:ToGame_NoteLog_RequestNameFind",__name);
}
function clearLog()
{
   var _loc3_ = 0;
   while(_loc3_ < LINELENGTH)
   {
      var _loc2_ = container_mc.logContainer["line" + _loc3_];
      _loc2_.checkBox.enabled = false;
      _loc2_.msg_mc.gotoAndStop(1);
      var _loc1_ = 0;
      while(_loc1_ < COLUMS)
      {
         _loc2_["t" + _loc1_ + "_txt"].text = "";
         _loc1_ = _loc1_ + 1;
      }
      _loc2_._visible = false;
      _loc3_ = _loc3_ + 1;
   }
   removeCheck(null,false);
   lineObject = {};
}
function addLog(index, _data)
{
   var _loc3_ = container_mc.logContainer["line" + index];
   _loc3_.index = index;
   _loc3_.id = _data[0];
   _loc3_.type = Number(_data[2]);
   lineObject[String(_data[0])] = _loc3_;
   trace(_loc3_.msg_mc + "  상태 : " + Number(_data[1]));
   _loc3_.msg_mc.gotoAndStop(Number(_data[1]) + 1);
   _loc3_.msg_mc.onPress = function()
   {
      var _loc2_ = undefined;
      if(this._currentframe == 1)
      {
         _loc2_ = 2;
      }
      else if(this._currentframe == 2)
      {
         _loc2_ = 3;
      }
      else if(this._currentframe == 3)
      {
         _loc2_ = 2;
      }
      this.gotoAndStop(_loc2_);
      ToGame_NoteLog_RequestMessageState(this._parent.id,_loc2_ - 1);
   };
   _loc3_.msg_mc.onRollOver = function()
   {
      var _loc2_ = undefined;
      if(this._currentframe == 1)
      {
         _loc2_ = lib.info.ToolTipStr.NOTE_MESSAGENEW;
      }
      else if(this._currentframe == 2)
      {
         _loc2_ = lib.info.ToolTipStr.NOTE_MESSAGEREAD;
      }
      else if(this._currentframe == 3)
      {
         _loc2_ = lib.info.ToolTipStr.NOTE_MESSAGEHIGH;
      }
      lib.manager.ToolTip.show(this,1,_loc2_);
   };
   _loc3_.msg_mc.onRollOut = _loc3_.msg_mc.onRelease = _loc3_.msg_mc.onReleaseOutside = function()
   {
      lib.manager.ToolTip.hide();
   };
   _loc3_.checkBox.enabled = true;
   _loc3_.checkBox.onChanged = function(_checked)
   {
      trace("onChanged  ");
      removeCheck(this._parent.id,_checked);
   };
   _loc3_.t1_txt.textColor = Number(_data[2]) != 1?NORMALCOLOR:SYSTEMCOLOR;
   var _loc2_ = 0;
   while(_loc2_ < COLUMS - 1)
   {
      _loc3_["t" + _loc2_ + "_txt"].text = _data[_loc2_ + 3];
      _loc2_ = _loc2_ + 1;
   }
   var _loc8_ = lib.util.ExtString.replace(_data[5],"\r"," ");
   lib.util.ExtString.textCut(_loc3_.t2_txt,_loc8_);
   _loc3_.hit_mc.onRollOver = function()
   {
      var _loc2_ = this._parent;
      _loc2_.t0_txt.textColor = lib.info.TextColor.LIST_OVER;
      _loc2_.t2_txt.textColor = lib.info.TextColor.LIST_OVER;
      if(_loc2_.type == 0)
      {
         _loc2_.t1_txt.textColor = lib.info.TextColor.LIST_OVER;
      }
      _loc2_.effect_mc.gotoAndPlay("over");
   };
   _loc3_.hit_mc.onRollOut = _loc3_.hit_mc.onReleaseOutside = function()
   {
      var _loc2_ = this._parent;
      _loc2_.t0_txt.textColor = lib.info.TextColor.LIST_NORMAL;
      _loc2_.t2_txt.textColor = lib.info.TextColor.LIST_NORMAL;
      if(_loc2_.type == 0)
      {
         _loc2_.t1_txt.textColor = lib.info.TextColor.LIST_NORMAL;
      }
      else
      {
         _loc2_.t1_txt.textColor = SYSTEMCOLOR;
      }
      _loc2_.effect_mc.gotoAndPlay("out");
   };
   _loc3_.hit_mc.onPress = function()
   {
      var _loc2_ = this._parent;
      _loc2_.t0_txt.textColor = lib.info.TextColor.LIST_PRESS;
      _loc2_.t2_txt.textColor = lib.info.TextColor.LIST_PRESS;
      if(_loc2_.type == 0)
      {
         _loc2_.t1_txt.textColor = lib.info.TextColor.LIST_PRESS;
      }
      _loc2_.effect_mc.gotoAndStop("active");
   };
   _loc3_.hit_mc.onRelease = function()
   {
      var _loc2_ = this._parent;
      _loc2_.t0_txt.textColor = lib.info.TextColor.LIST_ACTIVE;
      _loc2_.t2_txt.textColor = lib.info.TextColor.LIST_ACTIVE;
      _loc2_.t1_txt.textColor = lib.info.TextColor.LIST_ACTIVE;
      ToGame_NoteLog_RequestRead(_loc2_.id);
   };
   _loc3_._visible = true;
}
function removeCheck(id, _state)
{
   if(id == null)
   {
      deleteList = [];
   }
   if(id == null)
   {
      deleteList = [];
      var _loc1_ = 0;
      while(_loc1_ < LINELENGTH)
      {
         var _loc2_ = container_mc.logContainer["line" + _loc1_];
         _loc2_.checkBox.checked = _state;
         if(_state && _loc2_.checkBox.enabled)
         {
            deleteList.push(_loc2_.id);
         }
         _loc1_ = _loc1_ + 1;
      }
   }
   else
   {
      _loc1_ = 0;
      while(_loc1_ < deleteList.length)
      {
         var _loc3_ = deleteList[_loc1_];
         if(_loc3_ == id)
         {
            deleteList.splice(_loc1_,1);
            break;
         }
         _loc1_ = _loc1_ + 1;
      }
      if(_state)
      {
         deleteList.push(id);
      }
   }
   if(!_state)
   {
      container_mc.logContainer.checkAll.checked = false;
   }
   remove_btn.setEnabled(deleteList.length > 0);
}
function activeSendBtn()
{
   var _loc1_ = lib.util.ExtString.trim(container_mc.writeContainer.recieveNameFd.text) != "" && container_mc.writeContainer.recieveNameFd.text != undefined;
   _loc1_ = _loc1_ && (lib.util.ExtString.trim(container_mc.writeContainer.sendNameFd.text) != "" && container_mc.writeContainer.sendNameFd.text != undefined);
   _loc1_ = _loc1_ && lib.util.ExtString.trim(container_mc.writeContainer.messageFd.text) != "";
   send_btn.setEnabled(_loc1_);
}
function over(num)
{
   if(tab.activedNum != num)
   {
      tab.btn_array[num].gotoAndStop(2);
      tab.colorFormat.color = tab.overColor;
      tab.btn_array[num].txt.setTextFormat(tab.colorFormat);
   }
}
function out(num)
{
   if(tab.activedNum != num)
   {
      tab.btn_array[num].gotoAndStop(1);
      tab.colorFormat.color = tab.outColor;
      tab.btn_array[num].txt.setTextFormat(tab.colorFormat);
   }
}
function press(num)
{
   if(tab.activedNum != num)
   {
      tab.btn_array[num].gotoAndStop(3);
      tab.colorFormat.color = tab.pressColor;
      tab.btn_array[num].txt.setTextFormat(tab.colorFormat);
   }
}
function release(num)
{
   if(tab.activedNum != num)
   {
      ToGame_NoteLog_RequestMode(num);
   }
}
function tabActive(num)
{
   tab.btn_array[tab.activedNum].gotoAndStop(1);
   tab.colorFormat.color = tab.outColor;
   tab.btn_array[tab.activedNum].txt.setTextFormat(tab.colorFormat);
   tab.activedNum = num;
   tab.btn_array[num].gotoAndStop(4);
   tab.colorFormat.color = tab.pressColor;
   tab.btn_array[num].txt.setTextFormat(tab.colorFormat);
}
var UI = this;
UI._visible = false;
var bWidgetOpen = false;
var UIname = "NoteLog";
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
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
var LINELENGTH = 17;
var COLUMS = 3;
var MAXSTRING = 10000;
var NORMALCOLOR = 13421772;
var SYSTEMCOLOR = 15335424;
var lineObject = {};
var messageMode;
var reciveActive;
var deleteList = [];
var clickIndex;
container_mc.logContainer.fullMessage._visible = false;
container_mc.writeContainer.messageFd.maxChars = MAXSTRING;
myListener.OnGame_NoteLog_SetData = function(_data, currentPage, maxPage, currentCount, maxCount)
{
   lib.Debuger.trace("OnGame_NoteLog_SetData  ::: " + _data);
   container_mc.logContainer.numberSteper.setPage(Number(currentPage),Number(maxPage));
   container_mc.logContainer.noteCount.textColor = Number(currentCount) < Number(maxCount)?lib.info.TextColor.FILL_SHORT:lib.info.TextColor.FILL_FULL;
   container_mc.logContainer.noteCount.text = currentCount + " / " + maxCount;
   container_mc.logContainer.fullMessage._visible = Number(currentCount) >= Number(maxCount);
   clearLog();
   var _loc3_ = lib.util.ExtString.split(_data,"\n");
   var _loc1_ = _loc3_.shift();
   var _loc4_ = 0;
   while(_loc1_ != undefined)
   {
      var _loc2_ = lib.util.ExtString.split(_loc1_,"\t");
      _loc4_;
      addLog(_loc4_++,_loc2_);
      _loc1_ = _loc3_.shift();
   }
};
myListener.OnGame_NoteLog_SetReceiveState = function(_state)
{
   reciveActive = _state;
   container_mc.logContainer.recieve_check.checked = !Boolean(Number(_state));
};
myListener.OnGame_NoteLog_SetMessageState = function(id, _state)
{
   var _loc1_ = lineObject[String(id)];
   _loc1_.msg_mc.gotoAndStop(Number(_state) + 1);
};
myListener.OnGame_NoteLog_ClearLog = function()
{
   clearLog();
};
myListener.OnGame_NoteLog_SetFromName = function(__name)
{
   container_mc.writeContainer.sendNameFd.text = __name;
   activeSendBtn();
};
myListener.OnGame_NoteLog_SetToName = function(__name)
{
   container_mc.writeContainer.recieveNameFd.text = __name;
   activeSendBtn();
};
myListener.OnGame_NoteLog_SetNameFindResult = function(_result)
{
   container_mc.writeContainer.recieveNameFd.searchResult(lib.util.ExtString.split(_result,"\t"));
};
myListener.OnGame_NoteLog_SetMessageMaxString = function(_max)
{
   MAXSTRING = Number(_max);
   container_mc.writeContainer.messageFd.maxChars = MAXSTRING;
};
myListener.OnGame_NoteLog_SetMode = function(_mode)
{
   tabActive(_mode);
   container_mc.writeContainer._visible = Number(_mode) == 1;
   container_mc.logContainer._visible = Number(_mode) == 0;
   remove_btn.setVisible(Number(_mode) == 0);
   send_btn.setVisible(Number(_mode) == 1);
   if(Number(_mode) == 1)
   {
      myListener.OnGame_NoteLog_ClearWrite();
   }
};
myListener.OnGame_NoteLog_ClearWrite = function()
{
   container_mc.writeContainer.sendNameFd.text = "";
   container_mc.writeContainer.recieveNameFd.text = "";
   container_mc.writeContainer.messageFd.text = "";
   activeSendBtn();
};
var close_btn = new lib.util.TxtAniBtn(container_mc.close_mc,container_mc.close_txt,20,27,33,43);
var remove_btn = new lib.util.TxtAniBtn(container_mc.remove_mc,container_mc.remove_txt,20,27,33,43);
var x_btn = new lib.util.TxtBtn(container_mc.x_mc);
var send_btn = new lib.util.TxtAniBtn(container_mc.send_mc,container_mc.send_txt,20,27,33,43);
close_btn.setRelease(ToGame_NoteLog_CloseUI);
x_btn.setRelease(ToGame_NoteLog_CloseUI);
send_btn.setRelease(ToGame_NoteLog_Send);
remove_btn.setRelease(ToGame_NoteLog_Remove);
remove_btn.setEnabled(false);
send_btn.setEnabled(false);
var tabMc_array = new Array(container_mc.tab0_mc,container_mc.tab1_mc);
var tabTxt_array = new Array(container_mc.tab0_txt,container_mc.tab1_txt);
var tab = new lib.util.TabBtn(tabMc_array,tabTxt_array);
tab.setRollOver(over);
tab.setRollOut(out);
tab.setRelease(release);
tab.setPress(press);
container_mc.logContainer.numberSteper.onChanged = function(num)
{
   ToGame_NoteLog_RequestPage(num);
};
container_mc.logContainer.recieve_check.onChanged = function(checked)
{
   ToGame_NoteLog_RequestReceiveState(Number(!checked));
};
container_mc.logContainer.checkAll.onChanged = function(checked)
{
   removeCheck(null,checked);
};
var i = 0;
while(i < COLUMS + 1)
{
   var sortBtn = container_mc.logContainer["sort" + i + "_btn"];
   sortBtn.id = i;
   sortBtn.onPress = function()
   {
      ToGame_NoteLog_RequestSort(this.id);
   };
   i++;
}
container_mc.writeContainer.recieveNameFd.onChanged = function(str)
{
   ToGame_NoteLog_RequestNameFind(str);
   activeSendBtn();
};
container_mc.writeContainer.messageFd.onChanged = function()
{
   activeSendBtn();
};
container_mc.writeContainer.messageFd.onSetFocus = function()
{
   _global.inputing = true;
};
container_mc.writeContainer.messageFd.onKillFocus = function()
{
   _global.inputing = false;
};
container_mc.writeContainer.scrollbar.setTextField(container_mc.writeContainer.messageFd);
myListener.OnGame_NoteLog_SetMode(0);
clearLog();
container_mc.logContainer.numberSteper.setPage(1,1);
ToGame_NoteLog_Init();
