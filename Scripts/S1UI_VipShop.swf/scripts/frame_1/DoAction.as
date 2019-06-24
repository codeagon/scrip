function setSlot(mc, slotData)
{
   mc.img.clear();
   mc.id = slotData[0];
   lib.manager.ToolTip.remove(mc.slot);
   lib.manager.ToolTip.add(mc.slot,slotData[0],6);
   lib.display.DrawBitmapData.draw(mc.img,slotData[1],0,0,0,0,50,50,imgScale);
   mc.txt0.htmlText = slotData[2];
   mc.txt1.htmlText = slotData[3];
   if(slotData[4] > 1)
   {
      mc.txt2.text = slotData[4];
   }
   else
   {
      mc.txt2.text = "";
   }
   var _loc3_ = slotData[6];
   var _loc4_ = Number(slotData[5]);
   if(_loc3_ == "0")
   {
      _loc4_ = _loc4_ + 10;
      mc.iconMc._visible = false;
      mc.txt1._visible = false;
      mc.txt3.text = BTN_STR0;
      mc.btn.gotoAndStop(4);
   }
   else if(_loc3_ == "3")
   {
      mc.iconMc._visible = true;
      mc.txt1._visible = true;
      mc.txt3.text = BTN_STR1;
      mc.btn.gotoAndStop(4);
   }
   else if(_loc3_ == "1")
   {
      mc.btn.gotoAndStop(4);
   }
   else
   {
      mc.iconMc._visible = true;
      mc.txt1._visible = true;
      mc.txt3.text = BTN_STR0;
      mc.btn.gotoAndStop(1);
   }
   mc.gradeMc.gotoAndStop(_loc4_);
   mc.stateMc.gotoAndStop(Number(_loc3_) + 1);
   mc.txt3.hitTestDisable = true;
   mc.stateMc.hitTestDisable = true;
}
function ToGame_VipShop_ClickPoint(type)
{
   getURL("FSCommand:ToGame_VipShop_ClickPoint",type);
}
function ToGame_VipShop_Init()
{
   fscommand("ToGame_VipShop_Init");
}
function ToGame_VipShop_CloseUI()
{
   fscommand("ToGame_VipShop_CloseUI");
}
function ToGame_VipShop_GuideButton()
{
   fscommand("ToGame_VipShop_GuideButton");
   ToGame_VipShop_ClickPoint("guide");
}
function ToGame_VipShop_ItemRenewal()
{
   fscommand("ToGame_VipShop_ItemRenewal");
   ToGame_VipShop_ClickPoint("renewal");
}
function ToGame_VipShop_ClickItem(id)
{
   getURL("FSCommand:ToGame_VipShop_ClickItem",id);
   ToGame_VipShop_ClickPoint("item");
}
function effectEvent(mc, effect)
{
   if(effect)
   {
      mc.gotoAndPlay(2);
   }
   else
   {
      mc.gotoAndStop(1);
   }
}
function listReset(mc)
{
   for(var _loc2_ in mc)
   {
      if(typeof mc[_loc2_] == "movieclip")
      {
         mc[_loc2_].removeMovieClip();
      }
   }
}
var UI = this;
UI._visible = false;
var UIname = "VipShop";
this.bWindowOpen = false;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
var BTN_STR0 = lib.util.UIString.getUIString("$500103");
var BTN_STR1 = lib.util.UIString.getUIString("$500104");
var STR2 = lib.util.UIString.getUIString("$500105");
var x_btn = new lib.util.TxtBtn(container_mc.xBtn);
x_btn.setRelease(ToGame_VipShop_CloseUI);
var guide_btn = new lib.util.TxtBtn(container_mc.guideBtn);
guide_btn.setRelease(ToGame_VipShop_GuideButton);
var renewal_btn = new lib.util.TxtBtn(container_mc.renewalBtn);
renewal_btn.setRelease(ToGame_VipShop_ItemRenewal);
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
var totalLen = 10;
var imgScale = 0.875;
myListener.OnGame_VipShop_SetLevel = function(num)
{
};
myListener.OnGame_VipShop_SetTime = function(str)
{
   container_mc.timeTxt.text = str;
};
myListener.OnGame_VipShop_SetCoin = function(str)
{
   container_mc.coinTxt.text = str;
};
myListener.OnGame_VipShop_SetItem = function(listData)
{
   var _loc4_ = lib.util.ExtString.split(listData,"\n");
   var _loc3_ = undefined;
   var _loc1_ = 0;
   while(_loc1_ < totalLen)
   {
      _loc3_ = container_mc["slot" + _loc1_];
      var _loc2_ = lib.util.ExtString.split(_loc4_[_loc1_],"\t");
      setSlot(_loc3_,_loc2_);
      _loc1_ = _loc1_ + 1;
   }
};
myListener.OnGame_VipShop_UpDateItem = function(index, type)
{
   var _loc1_ = container_mc["slot" + index];
   if(_loc1_.stateMc._currentframe == 1)
   {
      _loc1_.stateMc.gotoAndStop(Number(type) + 1);
      if(type == "1" || type == "2")
      {
         _loc1_.stateMc.aniMc.gotoAndPlay(2);
      }
   }
   else
   {
      _loc1_.stateMc.gotoAndStop(Number(type) + 1);
   }
   var _loc3_ = _loc1_.gradeMc._currentframe;
   if(type == "0")
   {
      _loc3_ = _loc3_ + 10;
      _loc1_.iconMc._visible = false;
      _loc1_.txt11._visible = false;
      _loc1_.txt3.text = BTN_STR0;
      _loc1_.btn.gotoAndStop(4);
   }
   else if(type == "3")
   {
      _loc1_.iconMc._visible = true;
      _loc1_.txt1._visible = true;
      _loc1_.txt3.text = BTN_STR1;
      _loc1_.btn.gotoAndStop(4);
   }
   else if(tyoe == "1")
   {
      _loc1_.iconMc._visible = true;
      _loc1_.txt1._visible = true;
      _loc1_.txt3.text = BTN_STR0;
      _loc1_.btn.gotoAndStop(4);
   }
   else
   {
      _loc1_.iconMc._visible = true;
      _loc1_.txt1._visible = true;
      _loc1_.txt3.text = BTN_STR0;
      _loc1_.btn.gotoAndStop(1);
   }
   _loc1_.gradeMc.gotoAndStop(_loc3_);
   _loc1_.txt3.hitTestDisable = true;
   _loc1_.stateMc.hitTestDisable = true;
};
myListener.OnGame_VipShop_ResetCount = function(count)
{
   container_mc.resetTxt.text = lib.util.UIString.getUIString("$500105","count",count);
};
container_mc.messageMc._visible = false;
myListener.OnGame_VipShop_Message = function(str, type)
{
   if(str != "" && str != undefined)
   {
      container_mc.messageMc._visible = true;
      container_mc.messageMc.txt.htmlText = str;
      container_mc.messageMc.gotoAndStop(Number(type) + 1);
   }
   else
   {
      container_mc.messageMc._visible = false;
   }
};
myListener.OnGame_VipShop_Elin = function(type)
{
   container_mc.elinMc.gotoAndStop(Number(type) + 1);
};
container_mc.btn0.onRelease = function()
{
   ToGame_VipShop_ClickPoint("head");
};
container_mc.btn1.onRelease = function()
{
   ToGame_VipShop_ClickPoint("body");
};
var i = 0;
while(i < totalLen)
{
   var btnMc = container_mc["slot" + i].btn;
   btnMc.onPress = function()
   {
      if(this._currentframe == 4)
      {
         return undefined;
      }
      this.gotoAndStop(3);
   };
   btnMc.onRelease = function()
   {
      if(this._currentframe == 4)
      {
         return undefined;
      }
      this.gotoAndStop(1);
      ToGame_VipShop_ClickItem(this._parent.id);
   };
   btnMc.onRollOver = function()
   {
      if(this._currentframe == 4)
      {
         return undefined;
      }
      this.gotoAndStop(2);
   };
   btnMc.onRollOut = btnMc.onReleaseOutside = function()
   {
      if(this._currentframe == 4)
      {
         return undefined;
      }
      this.gotoAndStop(1);
   };
   i++;
}
ToGame_VipShop_Init();
