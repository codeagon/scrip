function ToGame_InGameStoreAllPayment_Init()
{
   lib.Debuger.trace("ToGame_InGameStoreAllPayment_Init");
   fscommand("ToGame_InGameStoreAllPayment_Init");
}
function ToGame_InGameStoreAllPayment_CloseUI()
{
   lib.Debuger.trace("ToGame_InGameStoreAllPayment_CloseUI");
   fscommand("ToGame_InGameStoreAllPayment_CloseUI");
}
function ToGame_InGameStoreAllPayment_Payment()
{
   lib.Debuger.trace("ToGame_InGameStoreAllPayment_Payment");
   fscommand("ToGame_InGameStoreAllPayment_Payment");
}
function ToGame_InGameStoreAllPayment_Goddess()
{
   lib.Debuger.trace("ToGame_InGameStoreAllPayment_Goddess");
   fscommand("ToGame_InGameStoreAllPayment_Goddess");
}
function ToGame_InGameStoreAllPayment_Confirm()
{
   lib.Debuger.trace("ToGame_InGameStoreAllPayment_Confirm");
   fscommand("ToGame_InGameStoreAllPayment_Confirm");
}
function listReset(_lineMc)
{
   var _loc1_ = _lineMc;
   for(var _loc2_ in _loc1_)
   {
      if(typeof _loc1_[_loc2_] == "movieclip")
      {
         _loc1_[_loc2_].removeMovieClip();
      }
   }
}
function setSkin(type)
{
   container_mc.bg._width = sizeArray[type].width;
   container_mc.UIDrager._width = sizeArray[type].width;
   hit._width = sizeArray[type].width;
   hit._height = sizeArray[type].height;
   container_mc.close_mc._x = sizeArray[type].width - 6 - container_mc.close_mc._width;
   container_mc.bg._height = sizeArray[type].height;
   container_mc.deco_top._width = sizeArray[type].width - 10;
   container_mc.deco_bot._width = sizeArray[type].width - 10;
   container_mc.info_mc.bg._width = sizeArray[type].width - 6;
   container_mc.caution_mc.bg._width = sizeArray[type].width - 6;
   container_mc.caution_mc.scroll._x = sizeArray[type].width - 7 - container_mc.caution_mc.scroll._width;
   container_mc.caution_mc.mask._width = container_mc.caution_mc.scroll._x;
   container_mc.caution_mc.txt.txt._width = container_mc.caution_mc.mask._width - 10;
   container_mc.info_mc.txt._width = sizeArray[type].width - 42;
   container_mc.list_scroll._x = sizeArray[type].width - 7 - container_mc.list_scroll._width;
   container_mc.list_mask._width = container_mc.list_scroll._x;
   container_mc.payment_btn._x = sizeArray[type].width - 53 - container_mc.payment_btn._width;
   if(type == 0 || type == 1)
   {
      container_mc.info_mc._visible = true;
      container_mc.money_mc._visible = true;
      container_mc.payment_btn._visible = true;
      container_mc.goddess_btn._visible = false;
      container_mc.confirm_btn._visible = false;
      container_mc.deco_bot._visible = false;
      container_mc.caution_mc._y = 583;
   }
   else if(type == 2)
   {
      container_mc.info_mc._visible = false;
      container_mc.money_mc._visible = false;
      container_mc.payment_btn._visible = false;
      container_mc.goddess_btn._visible = true;
      container_mc.confirm_btn._visible = true;
      container_mc.deco_bot._visible = true;
      container_mc.caution_mc._y = 512;
   }
}
function setPosition(type)
{
   UI._x = lib.info.AlignInfo.zeroPointX + lib.info.AlignInfo.onePercentPixelW * 50;
   UI._y = lib.info.AlignInfo.zeroPointY + lib.info.AlignInfo.onePercentPixelH * 45;
   UI._x = UI._x - sizeArray[type].width / 2 * lib.info.AlignInfo.scaleRatio;
   UI._y = UI._y - sizeArray[type].height / 2 * lib.info.AlignInfo.scaleRatio;
}
function setText(target, type)
{
   lib.Debuger.trace("type : " + type);
   var _loc3_ = true;
   if(target[txtName[2]]._x == 452)
   {
      _loc3_ = false;
   }
   if(type == 0)
   {
      target.TCat_txt._visible = true;
      target.result_txt._visible = false;
      var _loc2_ = 2;
      while(_loc2_ < txtName.length - 1)
      {
         target[txtName[_loc2_]]._visible = true;
         if(_loc3_)
         {
            target[txtName[_loc2_]]._x = target[txtName[_loc2_]]._x + 164;
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   else if(type == 1)
   {
      target.TCat_txt._visible = false;
      target.result_txt._visible = false;
      _loc2_ = 2;
      while(_loc2_ < txtName.length - 1)
      {
         target[txtName[_loc2_]]._visible = true;
         if(_loc3_ == false)
         {
            target[txtName[_loc2_]]._x = target[txtName[_loc2_]]._x - 164;
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   else if(type == 2)
   {
      target.result_txt._visible = true;
      _loc2_ = 1;
      while(_loc2_ < txtName.length - 1)
      {
         target[txtName[_loc2_]]._visible = false;
         _loc2_ = _loc2_ + 1;
      }
   }
}
var UI = this;
UI._visible = false;
var UIname = "InGameStoreAllPayment";
this.bWindowOpen = false;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
container_mc.result_txt._visible = false;
container_mc.godess_btn._visible = false;
container_mc.confirm_btn._visible = false;
container_mc.deco_bot._visible = false;
container_mc.payment_btn.btn._width = 204;
container_mc.payment_btn.btn._height = 54;
container_mc.goddess_btn._x = 50;
container_mc.goddess_btn._y = 453;
var string = lib.util.UIString.getUIString("$500046");
container_mc.goddess_btn.txt.text = string;
container_mc.confirm_btn._x = 283;
container_mc.confirm_btn._y = 453;
string = lib.util.UIString.getUIString("$500047");
container_mc.confirm_btn.txt.text = string;
var x_btn = new lib.util.TxtBtn(container_mc.close_mc);
x_btn.setRelease(ToGame_InGameStoreAllPayment_CloseUI);
var buy_btn = new lib.util.TxtBtn(container_mc.payment_btn.btn,container_mc.payment_btn.txt);
buy_btn.setTextColor("0xD7D7D7","0xFFFFFF","0xFFFFFF","0x485460");
buy_btn.setRelease(ToGame_InGameStoreAllPayment_Payment);
var goddess_btn = new lib.util.TxtBtn(container_mc.goddess_btn.btn,container_mc.goddess_btn.txt);
goddess_btn.setTextColor("0x83BBE4","0xFFFFFF","0xFFFFFF","0x485460");
goddess_btn.setRelease(ToGame_InGameStoreAllPayment_Goddess);
var confirm_btn = new lib.util.TxtBtn(container_mc.confirm_btn.btn,container_mc.confirm_btn.txt);
confirm_btn.setTextColor("0x83BBE4","0xFFFFFF","0xFFFFFF","0x485460");
confirm_btn.setRelease(ToGame_InGameStoreAllPayment_Confirm);
var listContainerY = container_mc.list_container._y;
var listScroll = container_mc.list_scroll;
listScroll.addListener(container_mc.list_container);
container_mc.list_container.onScroll = function()
{
   container_mc.list_container._y = listContainerY - arguments[0];
};
listScroll.setWheel(container_mc.list_container);
listScroll.wheelDelta = 1;
listScroll.pageSize = 0;
listScroll.displaySize = container_mc.list_mask._height;
listScroll.defaultBarSizeRatio = 0.3333333333333333;
listScroll.rowHeight = 30;
listScroll.scroll = 0;
var cautionY = container_mc.caution_mc.txt._y;
var cautionScroll = container_mc.caution_mc.scroll;
cautionScroll.addListener(container_mc.caution_mc.txt);
container_mc.caution_mc.txt.onScroll = function()
{
   container_mc.caution_mc.txt._y = cautionY - arguments[0];
};
cautionScroll.setWheel(container_mc.caution_mc.txt);
cautionScroll.wheelDelta = 1;
cautionScroll.displaySize = container_mc.caution_mc.mask._height;
cautionScroll.defaultBarSizeRatio = 0.3333333333333333;
cautionScroll.rowHeight = 30;
cautionScroll.scroll = 0;
myListener.OnGameEventShowWindow = function(_WindowName, _bShow)
{
   if(_WindowName.toLowerCase() == UIname.toLowerCase())
   {
      bWindowOpen = _bShow;
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
myListener.OnGameEventChangeUIMode = function(_bShow)
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
var txtName = ["product_txt","TCat_txt","option_txt","price_txt","discount_txt","payment_txt","result_txt"];
myListener.OnGame_InGameStoreAllPayment_SetList = function(type, listData)
{
   listReset(container_mc.list_container);
   type = Number(type);
   setSkin(type);
   setText(container_mc,type);
   listScroll.pageSize = 0;
   listScroll.scroll = 0;
   var _loc8_ = lib.util.ExtString.split(listData,"\n");
   var _loc9_ = _loc8_.length;
   if(_loc8_[_loc9_ - 1] == "0" || _loc8_[_loc9_ - 1] == "undefined" || _loc8_[_loc9_ - 1] == "")
   {
      _loc8_.splice(_loc9_ - 1,1);
      _loc9_ = _listdata.length;
   }
   var _loc1_ = null;
   var _loc5_ = 0;
   while(_loc5_ < _loc9_)
   {
      var _loc3_ = lib.util.ExtString.split(_loc8_[_loc5_],"\t");
      _loc1_ = container_mc.list_container.attachMovie("list_mc","list_" + String(_loc5_),container_mc.list_container.getNextHighestDepth());
      _loc1_._y = 59 * _loc5_;
      var _loc4_ = 0;
      while(_loc4_ < txtName.length)
      {
         _loc1_[txtName[_loc4_]].verticalAlign = "center";
         _loc4_ = _loc4_ + 1;
      }
      setText(_loc1_,type);
      if(type == 0)
      {
         _loc1_.line._width = 892.5;
      }
      else if(type == 1)
      {
         _loc1_.line._width = 728.5;
      }
      else if(type == 2)
      {
         _loc1_.line._width = 572.5;
      }
      var _loc2_ = _loc1_.icon.slot.attachMovie("Slot_link","img",_loc1_.icon.slot.getNextHighestDepth());
      _loc2_.draw(_loc3_[1]);
      if(Number(_loc3_[2]) != -1)
      {
         _loc2_.num_txt._visible = true;
         _loc2_.num_txt.text = Number(_loc3_[2]);
      }
      else
      {
         _loc2_.num_txt.text = "";
      }
      _loc2_.SLOT.enabled = false;
      _loc2_.display = true;
      if(_loc3_[4] == 1)
      {
         _loc2_.impossible = true;
      }
      else if(_loc3_[4] == 2)
      {
         _loc2_.disable = true;
      }
      else
      {
         _loc2_.impossible = false;
         _loc2_.disable = false;
      }
      _loc2_.package_mc._visible = Boolean(Number(_loc3_[5]));
      _loc2_.package_mc._xscale = 110;
      _loc2_.package_mc._yscale = 110;
      _loc2_._width = 47;
      _loc2_._height = 44;
      _loc2_._x = 1;
      _loc2_._y = 0.7;
      _loc1_.icon.frame._width = _loc1_.icon.frame._height = 46;
      lib.manager.ToolTip.add(_loc2_.SLOT,_loc3_[0],6,_loc2_.Icon);
      _loc1_.product_txt.htmlText = _loc3_[3];
      _loc1_.TCat_txt.htmlText = _loc3_[10];
      _loc1_.option_txt.htmlText = _loc3_[6];
      _loc1_.price_txt.htmlText = _loc3_[7];
      _loc1_.discount_txt.htmlText = _loc3_[8];
      _loc1_.payment_txt.htmlText = _loc3_[9];
      var _loc6_ = null;
      if(_loc3_[11] == "0")
      {
         _loc1_.result_txt.textColor = 12582917;
         _loc6_ = lib.util.UIString.getUIString("$500048");
         _loc1_.result_txt.htmlText = _loc6_;
      }
      else if(_loc3_[11] == "1")
      {
         _loc1_.result_txt.textColor = 14145495;
         _loc6_ = lib.util.UIString.getUIString("$500049");
         _loc1_.result_txt.htmlText = _loc6_;
      }
      _loc5_ = _loc5_ + 1;
   }
   listScroll.pageSize = container_mc.list_container._height + 2;
   setPosition(type);
};
myListener.OnGame_InGameStoreAllPayment_SetPrice = function(type, price_0, price_1, price_2)
{
   type = Number(type);
   var _loc1_ = null;
   container_mc.money_mc.bg._width = 435;
   container_mc.money_mc.bg._height = 96;
   container_mc.money_mc.line._width = 425;
   container_mc.money_mc.curMoney_txt._x = 185;
   container_mc.money_mc.payment_txt._x = 185;
   container_mc.money_mc.balance_txt._x = 185;
   if(type == 0)
   {
      _loc1_ = lib.util.UIString.getUIString("$500043");
      container_mc.money_mc.bg._width = container_mc.money_mc.bg._width + 164;
      container_mc.money_mc.line._width = container_mc.money_mc.line._width + 164;
      container_mc.money_mc.curMoney_txt._x = container_mc.money_mc.curMoney_txt._x + 164;
      container_mc.money_mc.payment_txt._x = container_mc.money_mc.payment_txt._x + 164;
      container_mc.money_mc.balance_txt._x = container_mc.money_mc.balance_txt._x + 164;
   }
   else if(type == 1)
   {
      _loc1_ = lib.util.UIString.getUIString("$500044");
   }
   lib.Debuger.trace(price_0 + " " + price_1 + " " + price_2);
   container_mc.money_mc.curMoney_txt.text = price_0 + _loc1_;
   container_mc.money_mc.payment_txt.text = price_1 + _loc1_;
   container_mc.money_mc.balance_txt.text = price_2 + _loc1_;
};
myListener.OnGame_InGameStoreAllPayment_SetInfo = function(txt)
{
   container_mc.info_mc.txt.htmlText = txt;
};
myListener.OnGame_InGameStoreAllPayment_SetCaution = function(txt)
{
   lib.Debuger.trace("txt : " + txt);
   container_mc.caution_mc.scroll.pageSize = 0;
   container_mc.caution_mc.scroll.scroll = 0;
   container_mc.caution_mc.txt.txt.htmlText = txt;
   var _loc1_ = container_mc.caution_mc.txt.txt.textHeight + 10;
   container_mc.caution_mc.txt.txt._height = _loc1_;
   container_mc.caution_mc.scroll.pageSize = container_mc.caution_mc.txt._height;
};
var sizeArray = [{width:923,height:746},{width:759,height:746},{width:503,height:675}];
ToGame_InGameStoreAllPayment_Init();
