function ToGameTradeResult(bCommit)
{
   getURL("FSCommand:ToGameTradeResult",bCommit);
}
function ToGameTradeShowMoneyInput()
{
   fscommand("ToGameTradeShowMoneyInput");
}
function ToGame_TradeWindow_CloseUI()
{
   fscommand("ToGame_TradeWindow_CloseUI");
}
function ToGame_TradeWindow_Init()
{
   fscommand("ToGame_TradeWindow_Init");
}
function ToGame_TradeWindow_RightClick(slotIndex)
{
   getURL("FSCommand:ToGame_TradeWindow_RightClick",slotIndex);
}
function clearInformation(target)
{
   for(var _loc3_ in target)
   {
      var _loc1_ = target[_loc3_];
      if(typeof _loc1_ == "movieclip")
      {
         lib.manager.ToolTip.remove(_loc1_.SLOT);
         _loc1_.clear();
         _loc1_.Icon.clear();
         _loc1_.enchantFd.text = "";
         if(logMode)
         {
            _loc1_.effect = false;
            _loc1_.drag = false;
         }
         else if(Number(_loc1_._name.substr(11)) >= 18)
         {
            _loc1_.effect = false;
            _loc1_.drag = false;
         }
         else
         {
            _loc1_.effect = true;
            _loc1_.drag = true;
         }
         _loc1_.BG_EMPTY._visible = true;
      }
   }
}
function clearAll()
{
   clearInformation(container_mc);
   myListener.OnGameEventExchangeSetItemList("","","0","0",false,false,"\n");
   message_array = [];
   currentMessageNum = 0;
   container_mc.message_txt.htmlText = captionStr;
}
function ok()
{
   if(logMode)
   {
      ToGame_TradeWindow_CloseUI();
   }
   else
   {
      ToGameTradeResult(true);
   }
}
function moneyInput()
{
   ToGameTradeShowMoneyInput();
}
function closeUI()
{
   ToGame_TradeWindow_CloseUI();
}
var UI = this;
UI._visible = false;
var UIname = "TradeWindow";
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
container_mc.scaleExpander.scaleExpanderEventCheck(UI,UIname);
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
container_mc.title_txt.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
container_mc.moneyA_txt.textColor = lib.info.TextColor.GENERAL_MONEY;
container_mc.moneyB_txt.textColor = lib.info.TextColor.GENERAL_MONEY;
container_mc.nameA_txt.textColor = lib.info.TextColor.GENERAL_EMPHASIS;
container_mc.nameB_txt.textColor = lib.info.TextColor.GENERAL_CONTENTS;
container_mc.message_txt.textColor = lib.info.TextColor.GENERAL_CONTENTS;
var con = this;
var logMode = false;
var message_array = new Array();
var currentMessageNum = 0;
var dataName = "TradeSlot";
var dragMc;
var captionStr = "";
myListener.OnGameEventShowWindow = function(WindowName, bShow)
{
   if(WindowName.toLowerCase() == UIname.toLowerCase())
   {
      bWindowOpen = bShow;
      if(_global.gbUIMode && bWindowOpen)
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
   if(_global.gbUIMode && bWindowOpen)
   {
      UI._visible = true;
   }
   else
   {
      UI._visible = false;
   }
};
this.bWindowOpen = false;
myListener.OnGameEventDragFailed();
dragMc._visible = true;
dragMc = null;
var goldType = 0;
myListener.OnGame_TradeWindow_SetGoldType = function(type)
{
   goldType = Number(type);
};
myListener.OnGameEventTradeSetData = function(nameA, nameB, moneyA, moneyB, dimA, dimB, itemDataList, viewMode)
{
   var _loc13_ = container_mc;
   _loc13_.nameA_txt.text = nameA;
   _loc13_.nameB_txt.text = nameB;
   var _loc15_ = lib.util.GoldCurrency.SetGoldText(moneyA,0,0,0,goldType);
   var _loc16_ = lib.util.GoldCurrency.SetGoldText(moneyB,0,0,0,goldType);
   _loc13_.moneyA_txt.htmlText = _loc15_;
   _loc13_.moneyB_txt.htmlText = _loc16_;
   moneyInput_btn.setEnabled(moneyA == "0");
   if(dimA == "1")
   {
      _loc13_.dimA_mc.gotoAndStop(2);
   }
   else
   {
      _loc13_.dimA_mc.gotoAndStop(1);
   }
   if(dimB == "1")
   {
      _loc13_.dimB_mc.gotoAndStop(2);
   }
   else
   {
      _loc13_.dimB_mc.gotoAndStop(1);
   }
   if(viewMode == undefined)
   {
      viewMode = false;
   }
   setLogMode(Boolean(Number(viewMode)));
   clearInformation(container_mc);
   var _loc9_ = itemDataList.split("\n");
   if(_loc9_[_loc9_.length - 1] == "undefined" || _loc9_[_loc9_.length - 1] == "")
   {
      _loc9_.splice(_loc9_.length - 1,1);
   }
   var _loc7_ = 0;
   while(_loc7_ < _loc9_.length)
   {
      var _loc1_ = _loc9_[_loc7_].split("\t");
      if(_loc1_.length != 1)
      {
         var _loc12_ = _loc1_[0];
         var _loc8_ = _loc1_[1];
         var _loc11_ = _loc1_[2];
         var _loc10_ = dataName + "__" + _loc12_;
         var _loc2_ = _loc13_[_loc10_];
         _loc2_.enchantFd.text = "";
         lib.display.DrawBitmapData.draw(_loc2_.Icon,_loc8_,0,0,0,0,50,50,0.78);
         _loc2_.Icon.TEX = _loc8_;
         _loc2_.id = _loc1_[0];
         _loc2_.grade = _loc1_[5];
         _loc2_.sealType = _loc1_[6];
         _loc2_.masterpiece = _loc1_[7];
         var _loc4_ = Number(_loc1_[4]);
         var _loc3_ = Number(_loc1_[8]);
         if(isNaN(_loc3_) == false && _loc3_ != -1 && _loc3_ != 0)
         {
            var _loc5_ = _loc2_.enchantFd;
            var _loc6_ = _loc4_ <= 0?21433:3615811;
            if(_loc3_ > 11 && _loc3_ < 15)
            {
               _loc6_ = _loc4_ <= 0?8915599:2299429;
            }
            else if(_loc3_ > 14)
            {
               _loc6_ = _loc4_ <= 0?10624002:4074792;
            }
            _loc5_.shadowColor = _loc6_;
            _loc5_.textColor = _loc4_ <= 0?14145495:7368816;
            _loc5_.text = "+" + _loc3_;
         }
         _loc2_.effect = false;
         _loc2_.drag = false;
         lib.manager.ToolTip.add(_loc2_.SLOT,_loc1_[0],6,_loc2_.Icon);
         if(Number(_loc1_[3]))
         {
            _loc2_.num_txt.text = _loc11_;
         }
         if(_loc1_[4] != undefined)
         {
            _loc2_.impossible = Number(_loc1_[4]);
         }
      }
      _loc7_ = _loc7_ + 1;
   }
};
myListener.OnGameEventTradeSetMsg = function(msg)
{
   container_mc.message_txt.htmlText = container_mc.message_txt.htmlText + (msg + "\n");
   container_mc.message_txt.scroll = container_mc.message_txt.maxscroll;
};
myListener.OnGameEventTradeLogSetMsg = function(msg)
{
   message_array = [];
   container_mc.message_txt.htmlText = msg;
};
myListener.OnGame_MouseDown = function(button, target)
{
   if(button == 2 && target._name == "SLOT")
   {
      var _loc1_ = target._parent._name;
      if(container_mc[_loc1_] != undefined && !logMode)
      {
         var _loc2_ = _loc1_.split("__");
         ToGame_TradeWindow_RightClick(_loc2_[1]);
      }
   }
};
myListener.OnGame_TradeWindow_SetCharge = function(charge)
{
   var _loc1_ = charge != "-1";
   container_mc.chargeLb._visible = _loc1_;
   container_mc.chargeBg._visible = _loc1_;
   container_mc.charge_txt._visible = _loc1_;
   var _loc2_ = lib.util.GoldCurrency.SetGoldText(charge,0,0,0,goldType);
   container_mc.charge_txt.htmlText = _loc2_;
};
myListener.OnGame_TradeWindow_SetCharge("-1");
setLogMode = function(_logMode)
{
   logMode = _logMode;
   moneyInput_btn.setVisible(!logMode);
   close_btn.setVisible(!logMode);
   ok_btn.setVisible(!logMode);
   container_mc.message_txt.selectable = !logMode;
   container_mc.btn_deal._visible = !logMode;
   container_mc.btn_moneyInput._visible = !logMode;
   if(logMode)
   {
      container_mc.text_name.text = lib.util.UIString.getUIString("$132006");
   }
   else
   {
      container_mc.text_name.text = lib.util.UIString.getUIString("$132001");
   }
};
var ok_btn = container_mc.txtBtn0.txtBtn;
var close_btn = container_mc.txtBtn1.txtBtn;
var moneyInput_btn = container_mc.moneyInputBtn.txtBtn;
var x_btn = new lib.util.TxtBtn(container_mc.x_mc);
ok_btn.setRelease(ok);
moneyInput_btn.setRelease(moneyInput);
close_btn.setRelease(closeUI);
x_btn.setRelease(closeUI);
container_mc.scrollbar2.setTextField(container_mc.message_txt);
container_mc.TradeA__Area.GetName = function()
{
   return this._name;
};
container_mc.TradeB__Area.GetName = function()
{
   return this._name;
};
ToGame_TradeWindow_Init();
