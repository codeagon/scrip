function effectEnd()
{
   container_mc.expBar._width = curWidth;
}
function effectEnd2()
{
   gs.TweenLite.to(container_mc.epMc.effectBar,2,{_alpha:0,ease:gs.easing.Strong.easeIn});
}
function ToGame_Message_EpClick()
{
   fscommand("ToGame_Message_EpClick");
}
function pointUp(point, tgMc)
{
   if(point == 0)
   {
      return undefined;
   }
   gs.TweenLite.killTweensOf(tgMc.addpointTxt);
   if(point > 0)
   {
      tgMc.addpointTxt.textColor = 65535;
      tgMc.addpointTxt.text = "+" + point;
   }
   else
   {
      tgMc.addpointTxt.textColor = 13382400;
      tgMc.addpointTxt.text = point;
   }
   tgMc.addpointTxt._visible = true;
   tgMc.addpointTxt._width = tgMc.addpointTxt.textWidth + 6;
   tgMc.waninigMc._visible = true;
   tgMc.waninigMc.gotoAndPlay(2);
   tgMc.addpointTxt._alpha = 100;
   tgMc.addpointTxt._x = 25.5;
   tgMc.addpointTxt._y = 2;
   tgMc.addpointTxt._alpha = 100;
   gs.TweenLite.to(tgMc.addpointTxt,0.5,{_y:-20,ease:gs.easing.Strong.easeOut,onComplete:onFinishTween,onCompleteParams:[tgMc.addpointTxt]});
}
function onFinishTween(tg)
{
   gs.TweenLite.to(tg,2,{_x:40,_alpha:0,ease:gs.easing.Strong.easeOut});
}
var UI = this;
UI._visible = false;
var UIname = "ExpBar";
var bWindowOpen = true;
var expStr = lib.util.UIString.getUIString("$024002") + " : ";
var attainStr = lib.util.UIString.getUIString("$024003") + " : ";
var addRestExpBonusStr = lib.util.UIString.getUIString("$024005") + " : ";
var addItemDropBonusStr = lib.util.UIString.getUIString("$024006") + " : ";
var addRestExpStr = lib.util.UIString.getUIString("$024007") + " : ";
var xpStr = lib.util.UIString.getUIString("$005008");
attain_mc._visible = false;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
container_mc.blet._visible = 0;
container_mc.blet._x = 0;
container_mc.expBar._width = 0;
container_mc.expBarAdd._width = 0;
var totalWidth = 1920;
var curWidth = 0;
var hasAddExp = false;
var bletPos = 0;
var _epMode;
var prevRatio = 0;
var EFFECT_RATIO = 5;
myListener.OnGameEventShowWindow = function(WindowName, bShow)
{
   if(WindowName.toLowerCase() == UIname.toLowerCase())
   {
      bWindowOpen = bShow;
      UI._visible = bShow;
   }
};
var ADD_STR = "";
myListener.OnGame_ExpBar_AddTooltip = function(str)
{
   if(str)
   {
      ADD_STR = str;
   }
   else
   {
      ADD_STR = "";
   }
   if(epTooltip != "")
   {
      epTooltip = epTooltip + str;
   }
};
myListener.OnGame_CharacterWindow_UpdateExp = function(curExp, totalExp, curAddRestExp, totalAddRestExp, addRestExpPercent, addItemDropPercent, expRatio, addExpRatio, expPeraddExpRatio)
{
   lib.Debuger.trace("OnGame_CharacterWindow_UpdateExp : " + curExp + " _ " + totalExp + " _ " + _epMode);
   if(_epMode == true)
   {
      return undefined;
   }
   expRatio = Number(expRatio);
   addExpRatio = Number(addExpRatio);
   expPeraddExpRatio = Number(expPeraddExpRatio);
   hasAddExp = curAddRestExp != "0" && curAddRestExp != "" && curAddRestExp != undefined;
   if(isNaN(addItemDropPercent))
   {
      addItemDropPercent = 0;
   }
   if(0.01 > expRatio)
   {
      expRatio = 0.01;
   }
   else
   {
      expRatio = lib.util.ExtString.decimal(expRatio,2);
   }
   if(0.01 > addExpRatio)
   {
      addExpRatio = 0.01;
   }
   else
   {
      addExpRatio = lib.util.ExtString.decimal(addExpRatio,2);
   }
   if(totalExp <= 0)
   {
      curWidth = 0;
      prevWidth = 0;
   }
   else
   {
      curWidth = expRatio / 100 * totalWidth;
   }
   var _loc5_ = "<font color=\'#" + lib.info.TextColor.GENERAL_CONTENTS.toString(16) + "\'>" + expStr + curExp + " / " + totalExp + " (" + expRatio + "%)" + "</font>" + ADD_STR;
   if(hasAddExp)
   {
      container_mc.expBar.gotoAndStop(2);
      bletPos = curWidth + expPeraddExpRatio / 100 * totalWidth;
      container_mc.blet._x = bletPos;
      container_mc.blet._visible = bletPos <= totalWidth;
      container_mc.expBarAdd._width = bletPos > totalWidth?totalWidth:bletPos;
      container_mc.tooltip = "";
      container_mc.tooltip = container_mc.tooltip + ("<font color=\'#00c0ff\'>" + addRestExpBonusStr + addRestExpPercent + "%" + "\n");
      if(addItemDropPercent)
      {
         container_mc.tooltip = container_mc.tooltip + (addItemDropBonusStr + addItemDropPercent + "%" + "\n");
      }
      container_mc.tooltip = container_mc.tooltip + (addRestExpStr + curAddRestExp + " / " + totalAddRestExp + " (" + addExpRatio + "%)" + "\n");
      container_mc.tooltip = container_mc.tooltip + (_loc5_ + "</font>");
   }
   else
   {
      container_mc.expBar.gotoAndStop(1);
      container_mc.blet._visible = false;
      container_mc.expBarAdd._width = 0;
      container_mc.tooltip = _loc5_;
   }
   container_mc.expBar._width = curWidth;
   prevRatio = expRatio;
};
container_mc.hit.onRollOver = function()
{
   if(epTooltip != "" && container_mc.epMc._currentframe == 1)
   {
      lib.manager.ToolTip.show(this,1,epTooltip);
   }
   else
   {
      lib.manager.ToolTip.show(this,1,container_mc.tooltip);
   }
   var _loc2_ = {x:this._x,y:this._y - this._height};
   this._parent.localToGlobal(_loc2_);
   var _loc3_ = 25;
   if(hasAddExp)
   {
      _loc3_ = 70;
   }
   lib.manager.ToolTip.move(_loc2_.x,_loc2_.y - _loc3_);
};
container_mc.hit.onRollOut = container_mc.hit.onReleaseOutside = function()
{
   lib.manager.ToolTip.hide();
};
myListener.OnGame_ExpBar_SetSectionAttain = function(sectionName, attainRatio)
{
   if(Number(attainRatio) != 100 && Number(attainRatio) != 0)
   {
      attainRatio = lib.util.ExtString.decimal(Number(attainRatio),2);
   }
   attain_mc.mask._xscale = attainRatio;
   attain_mc.attainRatio_txt.text = attainRatio;
   attain_mc.section_txt.text = sectionName;
   attain_mc.tooltip = attainStr + attainRatio + "%";
};
attain_mc.onRollOver = function()
{
   lib.manager.ToolTip.show(this,1,this.tooltip);
   var _loc2_ = {x:this._x + this._width,y:this._y - this._height};
   this._parent.localToGlobal(_loc2_);
   lib.manager.ToolTip.move(_loc2_.x - 180,_loc2_.y + 7);
};
attain_mc.onRollOut = attain_mc.onReleaseOutside = function()
{
   lib.manager.ToolTip.hide();
};
myListener.OnGame_ChangeStageSize = function(w, h)
{
};
myListener.OnGame_ExpBar_ShowSectionAttain = function(bTrue)
{
   bTrue = Number(bTrue);
   if(bTrue)
   {
      attain_mc._visible = true;
   }
   else
   {
      attain_mc._visible = false;
   }
};
apMc._visible = false;
var apX = apMc._x;
var apW = apX;
myListener.OnGame_AP_SetPoint = function(point, toolTip)
{
   if(point == undefined || point == "")
   {
      return undefined;
   }
   apMc._visible = true;
   var _loc4_ = Number(point) - Number(apMc.pointTxt.text);
   apMc.pointTxt.text = point;
   var _loc2_ = Math.max(36,apMc.pointTxt.textWidth + 4);
   var _loc1_ = Math.max(68,_loc2_ + 32);
   apMc.pointTxt._width = _loc2_;
   apMc.bg._width = _loc1_;
   apMc.waninigMc._width = _loc1_;
   apW = apX + _loc1_ + 2;
   bpMc._x = apW;
   lib.manager.ToolTip.add(apMc,toolTip,1);
   pointUp(_loc4_,apMc);
};
bpMc._visible = false;
var bpMaskTw = bpMc.maskMc._width;
myListener.OnGame_BP_SetPoint = function(point, tprocess, toolTip)
{
   if(point == undefined || point == "")
   {
      return undefined;
   }
   bpMc._visible = true;
   var _loc6_ = Number(point) - Number(bpMc.pointTxt.text);
   bpMc.pointTxt.text = point;
   var _loc2_ = Math.max(36,bpMc.pointTxt.textWidth + 4);
   var _loc4_ = Math.max(68,_loc2_ + 32);
   var _loc1_ = Math.max(64,_loc2_ + 28);
   bpMc.pointTxt._width = _loc2_;
   bpMc.bg._width = _loc4_;
   bpMc.waninigMc._width = _loc4_;
   bpMc.gageMc._width = _loc1_;
   bpMc.fullMc._width = _loc1_;
   bpMaskTw = _loc1_;
   bpMc._x = apW;
   var _loc3_ = Number(tprocess);
   var _loc7_ = _loc3_ * bpMaskTw / 100;
   bpMc.fullMc._visible = _loc3_ >= 100;
   bpMc.maskMc._width = _loc7_;
   lib.manager.ToolTip.add(bpMc,toolTip,1);
   pointUp(_loc6_,bpMc);
};
var prevEp = 0;
var epFoint = 0;
var epFointStr = 0;
var epMode = 0;
var epTooltip = "";
myListener.OnGame_ExpBar_SetEp = function(prevEp, totalEp, type, visibleMode, tooltip)
{
   _epMode = Number(visibleMode) == 1;
   if(_epMode == false)
   {
      return undefined;
   }
   container_mc.expBar.gotoAndStop(3);
   container_mc.blet.gotoAndStop(2);
   var _loc2_ = prevEp / 100 * totalWidth;
   var _loc1_ = totalEp / 100 * totalWidth;
   container_mc.expBarAdd._width = _loc1_;
   container_mc.blet._x = _loc1_;
   if(prevEp >= totalEp)
   {
      container_mc.blet._visible = false;
   }
   else
   {
      container_mc.blet._visible = true;
   }
   gs.TweenLite.killTweensOf(container_mc.expBar,false);
   gs.TweenLite.to(container_mc.expBar,0.5,{_width:_loc2_,ease:gs.easing.Strong.easeOut});
   if(tooltip)
   {
      epTooltip = tooltip + ADD_STR;
   }
   else
   {
      epTooltip = EP_STR + prevEp + "/" + totalEp + ADD_STR;
   }
};
var EP_STR = lib.util.UIString.getUIString("$670001");
var PrevLevel = 0;
var PrevCount = 0;
myListener.OnGame_ExpBar_EpEffect = function(modeType)
{
   if(modeType == 0)
   {
      container_mc.epMc.aniMc.markMc.gotoAndStop(1);
   }
   else
   {
      container_mc.epMc.aniMc.markMc.gotoAndPlay(2);
   }
};
myListener.OnGame_ExpBar_EpAlim = function(modeType, level, count, grade, effect)
{
   return undefined;
};
myListener.OnGame_CharacterWindow_UpdateExp(0,0,0,0,0,0);
myListener.OnGame_ExpBar_SetSectionAttain("$024004",0);
myListener.OnGame_ChangeStageSize(Stage.width,Stage.height);
