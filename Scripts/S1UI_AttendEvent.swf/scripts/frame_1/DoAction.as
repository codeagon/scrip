function setScroll(posY, num)
{
   var _loc1_ = posY;
   if(_loc1_ <= 600)
   {
      container_mc.maskMc._height = _loc1_;
      container_mc.scrollbar.resize(_loc1_);
      container_mc.btmMc._y = 160 + _loc1_;
      container_mc.bgMc._height = 210 + _loc1_;
      container_mc.scrollbar._visible = false;
      return undefined;
   }
   _loc1_ = 600;
   container_mc.maskMc._height = _loc1_;
   container_mc.scrollbar.resize(_loc1_);
   container_mc.btmMc._y = 160 + _loc1_;
   container_mc.bgMc._height = 210 + _loc1_;
   container_mc.scrollbar._visible = true;
   container_mc.scrollbar.displaySize = container_mc.maskMc._height;
   container_mc.scrollbar.rowHeight = lib.manager.UISkin.LISTLINE_HEIGHT;
   container_mc.scrollbar.setWheel(container_mc.boxMc);
   container_mc.scrollbar.addListener(container_mc.boxMc);
   container_mc.scrollbar.pageSize = posY;
   if(num == 0)
   {
      return undefined;
   }
   var _loc2_ = (num - 1) * 140;
   container_mc.scrollbar.setScrollPosition(_loc2_);
}
function setAttendSlot(slot, itemInfo)
{
   slot.index = itemInfo[0];
   slot.draw(itemInfo[1]);
   slot.SLOT.enabled = false;
   slot.display = true;
   slot.disable = !Boolean(Number(itemInfo[3]));
   slot.grade = itemInfo[4];
   slot.sealType = itemInfo[5];
   slot.masterpiece = itemInfo[6];
   if(Number(itemInfo[2]) > 1)
   {
      slot.num = itemInfo[2];
   }
   slot.enchantFd.text = "";
   var _loc2_ = Number(_itemInfo[7]);
   if(isNaN(_loc2_) == false && _loc2_ != -1 && _loc2_ != 0)
   {
      var _loc4_ = impossible <= 0?21433:3615811;
      if(_loc2_ > 11 && _loc2_ < 15)
      {
         _loc4_ = impossible <= 0?8915599:2299429;
      }
      else if(_loc2_ > 14)
      {
         _loc4_ = impossible <= 0?10624002:4074792;
      }
      container_mc.enchantFd.shadowColor = _loc4_;
      container_mc.enchantFd.textColor = impossible <= 0?14145495:7368816;
      container_mc.enchantFd.text = "+" + _loc2_;
   }
   lib.manager.ToolTip.add(slot,itemInfo[0],6);
}
function setAttendButton(mc, num, idx, type, tip, border)
{
   var _loc2_ = undefined;
   var _loc3_ = mc["txt" + num];
   if(border == "0")
   {
      _loc2_ = mc["btnN" + num];
      _loc2_._visible = true;
   }
   else
   {
      _loc2_ = mc["btnB" + num];
      _loc2_._visible = true;
   }
   var _loc1_ = new lib.util.TxtBtn(_loc2_,_loc3_);
   _loc1_.setTextColor("0xFFFFFF","0xFFFFFF","0xFFFFFF",lib.info.TextColor.BTN_UINIQUE_DISABLE);
   _loc3_.textColor = "0xFFFFFF";
   _loc1_.comp = mc["com" + num];
   _loc1_.comp.hitTestDisable = true;
   _loc1_.txtmc = _loc3_;
   _loc1_.btnmc = _loc2_;
   AttendBtnArr.push(_loc1_);
   setAttendEvent(_loc1_,idx);
   setAttendButtonState(_loc1_,type,tip,0);
}
function setAttendEvent(mc, idx)
{
   mc.setRelease(function()
   {
      ToGame_AttendEvent_ClickButton(idx);
   }
   );
}
function setAttendButtonState(mc, type, tip, effect)
{
   if(type == "1")
   {
      mc.setEnabled(true);
      mc.comp._visible = false;
      if(txt)
      {
         mc.setText(txt);
      }
      else
      {
         mc.setText("$012063");
      }
   }
   else if(type == "0")
   {
      mc.setEnabled(false);
      mc.comp._visible = false;
      if(txt)
      {
         mc.setText(txt);
      }
      else
      {
         mc.setText("$012064");
      }
   }
   else
   {
      mc.setEnabled(false);
      mc.comp._visible = true;
      if(txt)
      {
         mc.setText(txt);
      }
      else
      {
         mc.setText("$012065");
      }
   }
   if(tip != "" && tip != undefined)
   {
      lib.manager.ToolTip.add(mc.txtmc,tip,1);
   }
   else
   {
      lib.manager.ToolTip.remove(mc.txtmc);
   }
   if(effect == "1")
   {
      mc.btnmc.effectMc.gotoAndPlay(2);
   }
   else
   {
      mc.btnmc.effectMc.gotoAndStop(1);
   }
}
function ToGame_AttendEvent_ClickButton(idx)
{
   getURL("FSCommand:ToGame_AttendEvent_ClickButton",idx);
}
function ToGame_AttendEvent_Init()
{
   fscommand("ToGame_AttendEvent_Init");
}
function ToGame_AttendEvent_Close()
{
   fscommand("ToGame_AttendEvent_Close");
}
function listClear()
{
   var _loc1_ = 0;
   while(_loc1_ < BoxLen)
   {
      var _loc2_ = container_mc.boxMc["box" + _loc1_];
      _loc2_.removeMovieClip();
      _loc1_ = _loc1_ + 1;
   }
   BoxLen = 0;
}
var UI = this;
UI._visible = false;
var bWidgetOpen = false;
var UIname = "AttendEvent";
container_mc.UIDrager.setData(UIName,UI);
container_mc.titleFd.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
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
var xBtn = new lib.util.TxtBtn(container_mc.xmc);
xBtn.setRelease(ToGame_AttendEvent_Close);
var AttendListH = 140;
var AttendBtnArr = [];
var BoxLen = 0;
myListener.OnGame_AttendEvent_SetTitle = function(txt)
{
   container_mc.titleTxt.text = txt;
   container_mc._visible = true;
};
myListener.OnGame_AttendEvent_SetMonth = function(day)
{
   container_mc.txt0.text = lib.util.UIString.getUIString("$094067");
   container_mc.txt1.text = lib.util.UIString.getUIString("$094068");
};
myListener.OnGame_AttendEvent_SetCondition = function(dayStr, conditionStr, tipStr)
{
   container_mc.dayTxt.htmlText = dayStr;
   container_mc.conditionTxt.htmlText = conditionStr;
   container_mc.btmMc.tipTxt.htmlText = tipStr;
};
myListener.OnGame_AttendEvent_SetList = function(dataList)
{
   listClear();
   AttendBtnArr = [];
   var _loc15_ = lib.util.ExtString.split(dataList,"\n");
   var _loc13_ = _loc15_.length - 1;
   var _loc6_ = 0;
   var _loc4_ = 0;
   var _loc12_ = 0;
   var _loc16_ = (int(_loc13_ / 5) + 1) * 5;
   var _loc14_ = 0;
   var _loc2_ = 0;
   while(_loc2_ < _loc16_)
   {
      _loc6_ = int(_loc2_ / 5);
      _loc4_ = int(_loc2_ % 5);
      var _loc1_ = container_mc.boxMc["box" + _loc6_];
      if(!_loc1_)
      {
         _loc1_ = container_mc.boxMc.attachMovie("attendMc","box" + _loc6_,container_mc.boxMc.getNextHighestDepth());
         _loc1_._y = _loc12_;
         _loc12_ = _loc12_ + AttendListH;
         BoxLen++;
      }
      _loc1_["btnN" + _loc4_]._visible = false;
      _loc1_["btnB" + _loc4_]._visible = false;
      if(_loc2_ > _loc13_)
      {
         _loc1_["com" + _loc4_]._visible = false;
         _loc1_["dayTxt" + _loc4_].text = "";
      }
      else
      {
         var _loc3_ = lib.util.ExtString.split(_loc15_[_loc2_],"\t");
         var _loc10_ = _loc1_["dayTxt" + _loc4_];
         var _loc8_ = Number(_loc2_) + 1;
         var _loc11_ = lib.util.UIString.getUIString("$094069","count",_loc8_);
         _loc10_.text = _loc11_;
         var _loc5_ = _loc1_["border" + _loc4_];
         if(_loc3_[10] == "0")
         {
            _loc5_.gotoAndStop(1 + Number(_loc3_[11]));
         }
         else
         {
            _loc5_.gotoAndStop(3 + Number(_loc3_[11]));
         }
         if(_loc3_[11] == "1")
         {
            _loc14_ = _loc6_;
         }
         _loc5_.hitTestDisable = true;
         var _loc7_ = _loc1_["icon" + _loc4_];
         var _loc9_ = _loc7_.attachMovie("Slot_link","slot",_loc7_.getNextHighestDepth());
         setAttendSlot(_loc9_,_loc3_);
         setAttendButton(_loc1_,_loc4_,_loc2_,_loc3_[8],_loc3_[9],_loc3_[10]);
      }
      _loc2_ = _loc2_ + 1;
   }
   setScroll(_loc12_,_loc14_);
};
myListener.OnGame_AttendEvent_SetUpDate = function(idx, stateType, tip, effect)
{
   var _loc1_ = AttendBtnArr[idx];
   setAttendButtonState(_loc1_,stateType,tip,effect);
};
var boxY = container_mc.boxMc._y;
container_mc.boxMc.onScroll = function()
{
   this._y = boxY - arguments[0];
};
ToGame_AttendEvent_Init();
