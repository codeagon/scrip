function openFinished()
{
   closeBtn.setVisible(true);
   startBtn.setVisible(true);
   hit._height = 500;
   ToGame_KachaItem_EndIntro();
}
function killEffect()
{
   var _loc1_ = tempClip.pop();
   while(_loc1_ != undefined)
   {
      gs.TweenLite.killTweensOf(_loc1_);
      _loc1_.removeMovieClip();
      _loc1_ = tempClip.pop();
   }
   effectMc._visible = false;
}
function onFinishEffect0(mc, item_info)
{
   var _loc17_ = item_info[2];
   var _loc6_ = _loc17_.split("");
   var _loc15_ = _loc6_.length;
   var _loc4_ = 0;
   var _loc3_ = 0;
   var _loc2_ = 1;
   if(_loc15_ > 2 && _loc15_ < 6)
   {
      _loc4_ = (_loc15_ - 2) * 17;
   }
   else if(_loc15_ > 5)
   {
      _loc15_ = 5;
      _loc4_ = (_loc15_ - 2) * 17;
      _loc3_ = 5;
      _loc2_ = 0.8;
   }
   lib.Debuger.trace("nl : " + _loc15_);
   gs.TweenLite.to(mc,0.3,{_x:SLOTCX1 - _loc4_,_y:SLOTCY1,ease:gs.easing.Strong.easeOut});
   var _loc14_ = container_mc.attachMovie("numberClip","numberMc" + i,container_mc.getNextHighestDepth());
   _loc14_.gotoAndStop(11);
   _loc14_._xscale = _loc14_._yscale = 100 * _loc2_;
   effectMc._visible = true;
   container_mc.effectMc.gotoAndPlay(2);
   _loc14_._x = XX - _loc4_;
   lib.Debuger.trace("xmc._x : " + _loc14_._x);
   _loc14_._y = XY + _loc3_;
   _loc14_._alpha = 100;
   tempClip.push(_loc14_);
   gs.TweenLite.from(_loc14_,0.3,{delay:0.1,_alpha:40,_x:XX - _loc4_,_y:XY + _loc3_ - 20,_xscale:220 * _loc2_,_yscale:220 * _loc2_,ease:gs.easing.Elastic.easeOut});
   var i = 0;
   while(i < _loc6_.length)
   {
      var _loc1_ = container_mc.attachMovie("numberClip","numberMc" + i,container_mc.getNextHighestDepth());
      tempClip.push(_loc1_);
      var _loc5_ = Number(_loc6_[i]);
      _loc1_.gotoAndStop(_loc5_ + 1);
      _loc1_._alpha = 0;
      _loc1_._x = 370;
      _loc1_._y = NUMBERY + _loc3_;
      _loc1_._xscale = _loc1_._yscale = 100 * _loc2_;
      if(i == 0)
      {
         gs.TweenLite.to(_loc1_,0.15,{delay:0.15,_alpha:100,_x:NUMBERX + 33 * _loc2_ * i - _loc4_,_y:NUMBERY + _loc3_,ease:gs.easing.Strong.easeInOut,onComplete:setTimeout,onCompleteParams:[onFinishEffect1,1000,item_info]});
      }
      else
      {
         gs.TweenLite.to(_loc1_,0.15,{delay:0.15,_alpha:100,_x:NUMBERX + 33 * _loc2_ * i - _loc4_,_y:NUMBERY + _loc3_,ease:gs.easing.Strong.easeInOut});
      }
      i++;
   }
}
function onFinishEffect1(item_info)
{
   if(!effectFlag)
   {
      return undefined;
   }
   var _loc2_ = container_mc["slot" + (slotCount - 1)];
   lib.manager.ToolTip.add(_loc2_.SLOT,slotCount - 1,6,_loc2_.Icon);
   _loc2_.grade = item_info[4];
   _loc2_.sealType = item_info[5];
   _loc2_.masterpiece = item_info[6];
   if(item_info[3] == "0")
   {
      _loc2_.num = "";
   }
   else
   {
      _loc2_.num = item_info[2];
   }
   _loc2_.effect = false;
   _loc2_.drag = false;
   _loc2_.Slot.draw(item_info[1],56,56);
   _loc2_.Slot._visible = true;
   _loc2_.up_txt.verticalAlign = "center";
   _loc2_.up_txt._width = 211;
   _loc2_.up_txt._height = 67;
   _loc2_.upText = item_info[0];
   if(slotCount > 1)
   {
      container_mc.slot0._x = DSLOTX;
      container_mc.slot0._visible = true;
      container_mc.slot1._visible = true;
      container_mc.itemNameFd.text = "";
      var _loc1_ = tempClip.pop();
      while(_loc1_ != undefined)
      {
         _loc1_.removeMovieClip();
         _loc1_ = tempClip.pop();
      }
   }
   ToGame_KachaItem_EndTransition();
}
function ToGame_KachaItem_Init()
{
   fscommand("ToGame_KachaItem_Init");
}
function ToGame_KachaItem_Close()
{
   fscommand("ToGame_KachaItem_Close");
}
function ToGame_KachaItem_Start()
{
   fscommand("ToGame_KachaItem_Start");
}
function ToGame_KachaItem_EndIntro()
{
   fscommand("ToGame_KachaItem_EndIntro");
}
function ToGame_KachaItem_EndTransition()
{
   fscommand("ToGame_KachaItem_EndTransition");
}
function ToGame_KachaItem_SelectSlot()
{
   fscommand("ToGame_KachaItem_SelectSlot");
}
var UI = this;
UI._visible = false;
var UIname = "KachaItem";
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
container_mc.titleFd.textAutoSize = "shrink";
var bWidgetOpen = true;
myListener.OnGameEventShowWindow = function(WindowName, bShow)
{
   if(WindowName.toLowerCase() == UIname.toLowerCase())
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
container_mc.itemNameFd.textAutoSize = "shrink";
container_mc.itemNameFd.verticalAlign = "center";
var DSLOTX = 90;
var DSLOTY = 240;
myListener.OnGame_KachaItem_SetDefaultItem = function(_item)
{
   var _loc2_ = lib.util.ExtString.split(_item,"\t");
   if(_loc2_.length > 0)
   {
      killEffect();
      container_mc.slot1._visible = false;
      slotCount = 1;
      var _loc1_ = container_mc.slot0;
      _loc1_._visible = true;
      lib.manager.ToolTip.add(_loc1_.SLOT,0,6,_loc1_.Icon);
      _loc1_.grade = _loc2_[4];
      _loc1_.sealType = _loc2_[5];
      _loc1_.masterpiece = _loc2_[6];
      _loc1_.num_txt._visible = _loc2_[3] == "1";
      _loc1_.num = _loc2_[2];
      _loc1_.effect = false;
      _loc1_.drag = false;
      _loc1_.Slot.draw(_loc2_[1],56,56);
      _loc1_.Slot._visible = true;
      _loc1_.up_txt.verticalAlign = "center";
      _loc1_.up_txt._width = 211;
      _loc1_.up_txt._height = 67;
      _loc1_.upText = _loc2_[0];
      _loc1_._x = DSLOTX + (211 - _loc1_.up_txt.textWidth) / 2;
   }
};
var bkeyBox = false;
myListener.OnGame_KachaItem_ShowKeyBox = function()
{
   bkeyBox = true;
   container_mc.keyMc0._visible = true;
   container_mc.keyMc1._visible = true;
   container_mc.keyMc2._visible = true;
   container_mc.keyMc3._visible = true;
   selectKey.enabled = true;
   selectKey.gotoAndStop(1);
   selectKey = undefined;
};
var selectKey;
var i = 0;
while(i < 4)
{
   var keyBtn = container_mc["keyMc" + i];
   keyBtn.index = i;
   keyBtn.onRelease = function()
   {
      selectKey.enabled = true;
      selectKey.gotoAndStop(1);
      selectKey = this;
      this.gotoAndStop(3);
      this.enabled = false;
      ToGame_KachaItem_SelectSlot(this.index);
   };
   keyBtn.onRollOver = function()
   {
      this.gotoAndStop(2);
   };
   keyBtn.onRollOut = keyBtn.onReleaseOutside = function()
   {
      this.gotoAndStop(1);
   };
   keyBtn._visible = false;
   i++;
}
var slotCount = 0;
var SLOTX = 190;
var SLOTY = 260;
var SLOTCX0 = 197;
var SLOTCY0 = 275;
var SLOTCX1 = 137;
var SLOTCY1 = 275;
var tempClip = [];
myListener.OnGame_KachaItem_ShowItem = function(_item)
{
   var _loc2_ = lib.util.ExtString.split(_item,"\t");
   if(_loc2_.length > 0)
   {
      killEffect();
      container_mc.slot0._visible = false;
      container_mc.slot1._visible = false;
      effectFlag = true;
      slotCount++;
      var _loc1_ = container_mc.attachMovie("Comp:Slot","effectSlot" + slotCount,container_mc.getNextHighestDepth());
      tempClip.push(_loc1_);
      _loc1_.draw(_loc2_[1],56,56);
      _loc1_.grade = _loc2_[4];
      _loc1_.sealType = _loc2_[5];
      _loc1_.masterpiece = _loc2_[6];
      _loc1_.effect = false;
      _loc1_.drag = false;
      _loc1_._xscale = 250;
      _loc1_._yscale = 250;
      _loc1_._x = SLOTCX0 - 40;
      _loc1_._y = SLOTCY0 - 40;
      _loc1_._alpha = 50;
      lib.manager.UISound.play("1205");
      container_mc.itemNameFd._visible = true;
      container_mc.itemNameFd.text = _loc2_[0];
      lib.manager.ToolTip.add(_loc1_.SLOT,slotCount - 1,6,_loc1_.Icon);
      gs.TweenLite.to(_loc1_,0.3,{_alpha:100,_x:SLOTCX0,_y:SLOTCY0,_xscale:110,_yscale:110,ease:gs.easing.Strong.easeOut,onComplete:onFinishEffect0,onCompleteParams:[_loc1_,_loc2_]});
   }
};
container_mc.slot0._visible = false;
container_mc.slot1._visible = false;
container_mc.slot1.up_txt.verticalAlign = "center";
var SLOT0X = 80;
var SLOT0Y = 240;
var SLOT1X = 85;
var SLOT1Y = 300;
var NUMBERX = 260;
var NUMBERY = 282;
var XX = 213;
var XY = 282;
myListener.OnGame_KachaItem_TitleName = function(_title)
{
   container_mc.titleFd.text = _title;
};
myListener.OnGame_KachaItem_HeadIcon = function(img)
{
   container_mc.slotMc.clear();
   container_mc.slotMc.drag = false;
   container_mc.slotMc.draw(img,64,64);
   lib.manager.ToolTip.add(container_mc.slotMc.SLOT,3,6,container_mc.slotMc.Icon);
};
myListener.OnGame_KachaItem_SetUseableCount = function(count)
{
   container_mc.countTxt.text = count;
};
container_mc.countTxt.textAutoSize = "shrink";
lib.manager.ToolTip.add(container_mc.countTxt,"$463007",1);
myListener.OnGame_KachaItem_StateMessage = function(statemessage)
{
   statemessage = statemessage != "-1"?"<img src=\'icon_notice\' vspace=\'-1\'> " + statemessage:"";
   container_mc.itemNameFd.htmlText = statemessage;
};
myListener.OnGame_KachaItem_SetBtnEnable = function(btnIndex, enable)
{
   if(btnIndex == "0")
   {
      startBtn.setEnabled(enable == "1");
   }
   else
   {
      closeBtn.setEnabled(enable == "1");
   }
};
myListener.OnGame_KachaItem_SetBtnName = function(btnIndex, nameStr)
{
   if(btnIndex == "0")
   {
      startBtn.setText(nameStr);
   }
   else
   {
      closeBtn.setText(nameStr);
   }
};
var effectFlag = true;
myListener.OnGame_KachaItem_ResetResult = function()
{
   if(!bkeyBox)
   {
      slotCount = 0;
   }
   effectFlag = false;
   container_mc.slot0._visible = false;
   container_mc.slot1._visible = false;
   bkeyBox = false;
   container_mc.keyMc0._visible = false;
   container_mc.keyMc1._visible = false;
   container_mc.keyMc2._visible = false;
   container_mc.keyMc3._visible = false;
};
var closeBtn = new lib.util.TxtBtn(container_mc.cancel_mc,container_mc.cancel_txt);
var startBtn = new lib.util.TxtBtn(container_mc.execute_mc,container_mc.execute_txt);
closeBtn.setTextColor(lib.info.TextColor.BTN_UINIQUE_NORMAL,lib.info.TextColor.BTN_UINIQUE_OVER,lib.info.TextColor.BTN_UINIQUE_PRESS,lib.info.TextColor.BTN_UINIQUE_DISABLE);
startBtn.setTextColor(lib.info.TextColor.BTN_UINIQUE_NORMAL,lib.info.TextColor.BTN_UINIQUE_OVER,lib.info.TextColor.BTN_UINIQUE_PRESS,lib.info.TextColor.BTN_UINIQUE_DISABLE);
closeBtn.setRelease(ToGame_KachaItem_Close);
startBtn.setRelease(ToGame_KachaItem_Start);
closeBtn.setVisible(false);
startBtn.setVisible(false);
myListener.OnGame_KachaItem_SetBtnEnable(0,0);
ToGame_KachaItem_Init();
stop();
