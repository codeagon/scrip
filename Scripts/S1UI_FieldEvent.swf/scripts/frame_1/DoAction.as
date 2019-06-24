function setGage(current, max, bPlayMovingEffect)
{
   if(GAGE_TYPE_BAR == gageType)
   {
      lib.Debuger.trace("gageMc : " + gageMc);
      gageMc.setGage(current,max);
      if(bPlayMovingEffect)
      {
         container_mc.gage.barMoveEffect._x = container_mc.gage.mask._x + container_mc.gage.mask._width - 1;
         container_mc.gage.barMoveEffect._visible = true;
         container_mc.gage.barMoveEffect.gotoAndPlay(1);
      }
   }
   else
   {
      setCircleGage(current,max,bPlayMovingEffect);
   }
}
function setCircleGage(current, max, bPlayMovingEffect)
{
   var _loc5_ = current / max * 100;
   var _loc3_ = int(_loc5_ / percentOfOneCircle);
   var _loc4_ = _loc5_ % percentOfOneCircle / percentOfOneCircle * 100;
   if(bPlayMovingEffect)
   {
      gageMc.getPointEffect.gotoAndStop(1);
      gageMc.getPointEffect._visible = true;
      gageMc.getPointEffect._x = gageMc["circle_" + _loc3_]._x;
      if(_loc4_ == 0)
      {
         gageMc.getPointEffect._x = gageMc.getPointEffect._x - 21;
      }
      gageMc.getPointEffect.play();
   }
   var _loc1_ = 0;
   _loc1_ = 0;
   while(_loc1_ < MAX_COUNT_CIRCLE)
   {
      var _loc2_ = gageMc["circle_" + _loc1_];
      if(_loc1_ < _loc3_)
      {
         _loc2_._alpha = 100;
      }
      else if(_loc1_ == _loc3_)
      {
         _loc2_._alpha = _loc4_;
      }
      else
      {
         _loc2_._alpha = 0;
      }
      _loc1_ = _loc1_ + 1;
   }
}
function finishMaxEffect()
{
   lib.Debuger.trace("finishMaxEffect");
   setGage(prevCurrent,prevMax,false);
}
function hidePrevMissionMc1(targetMc)
{
   gs.TweenLite.to(targetMc,0.1,{_alpha:0,delay:0.6,ease:easing.Regular.easeOut,onComplete:hidePrevMissionMc2,onCompleteParams:[targetMc]});
}
function hidePrevMissionMc2(targetMc)
{
   targetMc.bg.gotoAndStop(1);
   targetMc._visible = false;
}
function effectCurrentMissionMc1(targetMc)
{
   targetMc.bg.gotoAndStop(1);
   gs.TweenLite.to(targetMc.bg,0.4,{_alpha:100,ease:easing.Regular.easeOut,onComplete:effectCurrentMissionMc2,onCompleteParams:[targetMc]});
}
function effectCurrentMissionMc2(targetMc)
{
   targetMc.bg.gotoAndPlay(1);
   gs.TweenLite.to(targetMc.bg,0.1,{_alpha:0,delay:1,ease:easing.Regular.easeOut});
}
function setTime(timeStr)
{
   var _loc1_ = container_mc.time_mc.tf;
   _loc1_.htmlText = timeStr;
   _loc1_._width = _loc1_.textWidth + 5;
   container_mc.time_mc._x = 334 - container_mc.time_mc._width;
}
function setProgress(percent)
{
   var _loc1_ = lib.util.UIString.getUIString("$720007","percent",percent);
   container_mc.mask._xscale = percent;
   container_mc.progressTF.htmlText = _loc1_;
}
function clearPhaseInfo()
{
   var _loc1_ = 0;
   while(_loc1_ < MAX_PHASE)
   {
      var _loc2_ = container_mc["phase_" + _loc1_];
      _loc2_._visible = false;
      _loc1_ = _loc1_ + 1;
   }
}
function clearMissionInfo(targetMc)
{
   missionArray = [];
   var _loc1_ = 0;
   while(_loc1_ < MAX_MISSION)
   {
      var _loc3_ = targetMc["tf_" + _loc1_];
      _loc3_.text = "";
      var _loc2_ = targetMc["mc_" + _loc1_];
      _loc2_.gotoAndStop(1);
      _loc2_._visible = false;
      _loc1_ = _loc1_ + 1;
   }
   targetMc.bg.gotoAndStop(1);
   targetMc.bg._visible = true;
   targetMc._visible = true;
   targetMc._alpha = 0;
   targetMc._x = 291;
}
function hideMissionEffect()
{
   gs.TweenLite.to(container_mc.mission_effect_mc,0.2,{delay:0.2,_alpha:0,ease:easing.Regular.easeOut,onComplete:finishMissionEffect});
}
function finishMissionEffect()
{
   container_mc.mission_effect_mc._visible = false;
   container_mc.mission_effect_mc._x = container_mc.mission_mc._x;
   container_mc.mission_effect_mc._alpha = 100;
   var _loc1_ = 0;
   while(_loc1_ < MAX_MISSION)
   {
      var _loc2_ = container_mc.mission_effect_mc["tf_" + _loc1_];
      _loc2_.text = "";
      _loc1_ = _loc1_ + 1;
   }
}
function clearRankInfo()
{
   container_mc.rank_mc.first._visible = false;
   var _loc2_ = 0;
   while(_loc2_ < MAX_RANK)
   {
      var _loc1_ = container_mc.rank_mc["mc_" + _loc2_];
      _loc1_.rankTF.text = "";
      _loc1_.nameTF.text = "";
      _loc1_.pointTF.text = "";
      _loc1_._visible = false;
      _loc2_ = _loc2_ + 1;
   }
}
function initRankInfo()
{
   var _loc1_ = 0;
   while(_loc1_ < MAX_RANK)
   {
      var _loc2_ = container_mc.rank_mc["mc_" + _loc1_];
      _loc2_.rankTF.verticalAlign = "center";
      _loc2_.nameTF.verticalAlign = "center";
      _loc1_ = _loc1_ + 1;
   }
}
function ToGame_FieldEvent_Init()
{
   fscommand("ToGame_FieldEvent_Init");
}
function ToGame_FieldEvent_ClickRewardButton()
{
   lib.Debuger.trace("ToGame_FieldEvent_ClickRewardButton");
   fscommand("ToGame_FieldEvent_ClickRewardButton");
}
function init()
{
   initGage();
   container_mc.gage.setRewardButtonRelease(ToGame_FieldEvent_ClickRewardButton);
   ToGame_FieldEvent_Init();
}
function initGage()
{
   initBarMaxEffect();
   initCircleMaxEffect();
   clearGage();
}
function initBarMaxEffect()
{
   var _loc1_ = container_mc.gage.barMaxEffect;
   _loc1_.gageAlpha = 100;
   _loc1_.buttonAlpha = 40;
   _loc1_.finishFunc = finishMaxEffect;
}
function initCircleMaxEffect()
{
   var _loc1_ = container_mc.gage.circleMaxEffect_0;
   _loc1_.gageAlpha = 100;
   _loc1_.buttonAlpha = 50;
   _loc1_.finishFunc = finishMaxEffect;
}
function clearGage()
{
   var _loc1_ = container_mc.gage;
   _loc1_.tf._visible = gageType == GAGE_TYPE_BAR;
   _loc1_.gage._visible = gageType == GAGE_TYPE_BAR;
   _loc1_.gageBar._visible = gageType == GAGE_TYPE_BAR;
   _loc1_.bg._visible = gageType == GAGE_TYPE_BAR;
   _loc1_.mask._xscale = 0;
   _loc1_.circleGage._visible = gageType == GAGE_TYPE_CIRCLE;
   _loc1_.barMoveEffect._visible = false;
   _loc1_.barMoveEffect.gotoAndStop(1);
   _loc1_.barMaxEffect.clear();
   _loc1_.barMaxEffect.clearTween();
   _loc1_.circleMaxEffect_0.clear();
   _loc1_.circleMaxEffect_0.clearTween();
   _loc1_.circleMaxEffect_1._visible = false;
   _loc1_.circleMaxEffect_1.gotoAndStop(1);
   var _loc2_ = gageType != GAGE_TYPE_CIRCLE?1:2;
   _loc1_.gageBg.gotoAndStop(_loc2_);
   _loc1_.hit.gotoAndStop(_loc2_);
}
_global.gfxExtensions = true;
var UI = this;
var UIName = "FieldEvent";
var bWidgetOpen = false;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
var progressWidth = container_mc.mask._width;
var bHideMode = true;
var GAGE_TYPE_BAR = 0;
var GAGE_TYPE_CIRCLE = 1;
var gageType = GAGE_TYPE_BAR;
var gageMc = container_mc.gage;
var maxEffectMc = container_mc.gage.barMaxEffect;
var MAX_COUNT_CIRCLE = 10;
var percentOfOneCircle = 100 / MAX_COUNT_CIRCLE;
container_mc.gage.circleMaxEffect_0.hitTestDisable = true;
container_mc.gage.circleMaxEffect_1.hitTestDisable = true;
myListener.OnGameEventShowWindow = function(WindowName, bShow)
{
   if(WindowName.toLowerCase() == UIName.toLowerCase())
   {
      bWidgetOpen = bShow;
      if(bWidgetOpen)
      {
         UI._visible = true;
      }
      else
      {
         UI._visible = false;
         fscommand("ToGame_FieldEvent_TooltipClose");
      }
   }
};
myListener.OnGameEventChangeUIMode = function(bShow)
{
   container_mc.bg1._visible = bShow;
   container_mc.bg2._visible = bShow;
   container_mc.rank_mc.bg._visible = bShow;
};
var prevCurrent = 0;
var prevMax = 0;
myListener.OnGame_FieldEvent_SetRewardGageType = function(type)
{
   gageType = Number(type);
   clearGage();
   gageMc = gageType != GAGE_TYPE_CIRCLE?container_mc.gage:container_mc.gage.circleGage;
   maxEffectMc = gageType != GAGE_TYPE_CIRCLE?container_mc.gage.barMaxEffect:container_mc.gage.circleMaxEffect_0;
};
myListener.OnGame_FieldEvent_SetRewardGage = function(current, max, bEffect)
{
   var _loc5_ = container_mc.gage;
   current = Number(current);
   max = Number(max);
   bEffect = Boolean(Number(bEffect));
   if(false == bEffect)
   {
      prevCurrent = current;
      prevMax = max;
      setGage(current,max,false);
      return undefined;
   }
   if(maxEffectMc.playing)
   {
      prevCurrent = current;
      prevMax = max;
      return undefined;
   }
   var _loc3_ = current == max || prevCurrent != prevMax && current < prevCurrent;
   if(_loc3_)
   {
      setGage(prevMax,prevMax,false);
      maxEffectMc.start();
   }
   else
   {
      setGage(current,max,true);
   }
   prevCurrent = current;
   prevMax = max;
};
myListener.OnGame_FieldEvent_SetRewardButton = function(num)
{
   num = Number(num);
   container_mc.gage.setButton(num);
};
myListener.OnGame_FieldEvent_SetTitle = function(nameStr, type)
{
   type = Number(type);
   container_mc.titleTF.setText(nameStr);
   container_mc.icon_mc.gotoAndStop(type + 1);
   container_mc.icon_mc._visible = true;
};
container_mc.icon_mc._visible = false;
var missionArray = new Array();
container_mc.mission_0.bg.gotoAndStop(1);
container_mc.mission_1.bg.gotoAndStop(1);
var currentViewIndex = 0;
myListener.OnGame_FieldEvent_AddMission = function(missionParam, bEffect)
{
   bEffect = Boolean(Number(bEffect));
   var _loc13_ = container_mc["mission_" + currentViewIndex];
   currentViewIndex = ++currentViewIndex % 2;
   var _loc6_ = container_mc["mission_" + currentViewIndex];
   clearMissionInfo(_loc6_);
   var _loc11_ = lib.util.ExtString.split(missionParam,"\n");
   var _loc12_ = _loc11_.length;
   var _loc1_ = 0;
   while(_loc1_ < _loc12_)
   {
      var _loc2_ = lib.util.ExtString.split(_loc11_[_loc1_],"\t");
      var _loc4_ = _loc6_["tf_" + _loc1_];
      var _loc3_ = _loc6_["mc_" + _loc1_];
      var _loc8_ = _loc2_[0];
      var _loc7_ = _loc2_[1];
      var _loc5_ = Number(_loc2_[2]);
      missionArray.push(_loc8_);
      _loc4_.setText(_loc7_);
      _loc3_._visible = true;
      var _loc10_ = _loc5_ != 0?14210782:4868677;
      var _loc9_ = _loc5_ + 1;
      _loc3_.gotoAndStop(_loc9_);
      _loc4_.textColor = _loc10_;
      _loc1_ = _loc1_ + 1;
   }
   if(false == bEffect)
   {
      _loc6_._alpha = 100;
      _loc6_._visible = true;
      _loc6_._x = 21;
      _loc13_._visible = false;
   }
   else
   {
      _loc13_.bg._alpha = 100;
      _loc13_.bg._visible = true;
      _loc13_.bg.gotoAndPlay(1);
      gs.TweenLite.to(_loc13_,0.1,{_x:-249,delay:0.9,ease:easing.Regular.easeOut,onComplete:hidePrevMissionMc1,onCompleteParams:[_loc13_]});
      gs.TweenLite.to(_loc6_,0.1,{_x:23,_alpha:100,delay:0.9,ease:easing.Regular.easeOut,onComplete:effectCurrentMissionMc1,onCompleteParams:[_loc6_]});
   }
};
myListener.OnGame_FieldEvent_CompleteMission = function(id)
{
   var _loc5_ = container_mc["mission_" + currentViewIndex];
   var _loc6_ = missionArray.length;
   var _loc1_ = 0;
   while(_loc1_ < _loc6_)
   {
      var _loc2_ = missionArray[_loc1_];
      if(_loc2_ == id)
      {
         var _loc4_ = _loc5_["tf_" + _loc1_];
         var _loc3_ = _loc5_["mc_" + _loc1_];
         _loc4_.textColor = 4868677;
         _loc3_.gotoAndStop(2);
         break;
      }
      _loc1_ = _loc1_ + 1;
   }
};
myListener.OnGame_FieldEvent_SetPhase = function(phaseParam)
{
   clearPhaseInfo();
   var _loc4_ = lib.util.ExtString.split(phaseParam,"\t");
   var _loc5_ = _loc4_.length;
   var _loc1_ = 0;
   while(_loc1_ < _loc5_)
   {
      var _loc3_ = Number(_loc4_[_loc1_]);
      var _loc2_ = container_mc["phase_" + _loc1_];
      _loc2_._x = container_mc.mask._x + progressWidth * (_loc3_ / 100);
      _loc2_._visible = true;
      _loc1_ = _loc1_ + 1;
   }
};
setProgress(0);
var MAX_PHASE = 10;
clearPhaseInfo();
var MAX_MISSION = 3;
clearMissionInfo(container_mc.mission_0);
clearMissionInfo(container_mc.mission_1);
var MAX_RANK = 5;
myListener.OnGame_FieldEvent_SetProgress = function(percent)
{
   percent = Number(percent);
   setProgress(percent);
};
myListener.OnGame_FieldEvent_SetTime = function(timeStr)
{
   setTime(timeStr);
};
myListener.OnGame_FieldEvent_SetRank = function(rankParam)
{
   clearRankInfo();
   var _loc10_ = lib.util.ExtString.split(rankParam,"\n");
   var _loc11_ = _loc10_.length;
   var _loc4_ = 0;
   while(_loc4_ < _loc11_)
   {
      var _loc3_ = lib.util.ExtString.split(_loc10_[_loc4_],"\t");
      var _loc2_ = Number(_loc3_[0]);
      _loc2_ = !isNaN(_loc2_)?_loc2_:"";
      var _loc6_ = _loc3_[1];
      var _loc7_ = Boolean(Number(_loc3_[2]));
      var _loc5_ = _loc3_[3];
      var _loc8_ = Number(_loc5_);
      var _loc1_ = container_mc.rank_mc["mc_" + _loc4_];
      _loc1_.rankTF.htmlText = _loc2_;
      _loc1_.nameTF.htmlText = _loc6_;
      _loc1_.pointTF.htmlText = !isNaN(_loc8_)?_loc5_ + "%":"";
      var _loc9_ = !_loc7_?"0x9BDFFF":"0x80E71C";
      _loc1_.rankTF.textColor = _loc1_.nameTF.textColor = _loc1_.pointTF.textColor = _loc9_;
      _loc1_._visible = true;
      _loc4_ = _loc4_ + 1;
   }
   container_mc.rank_mc.first._visible = true;
};
init();
