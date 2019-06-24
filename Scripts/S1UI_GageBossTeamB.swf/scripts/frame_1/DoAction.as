function init()
{
   if(gageFocus.percentGage == 100)
   {
      initAni.gotoAndPlay(2);
      gs.TweenLite.to(container_mc,0.5,{_alpha:100});
   }
   else
   {
      container_mc._alpha = 100;
   }
}
function EffectOn()
{
   gs.TweenLite.to(container_mc.stackGage,0.5,{_alpha:effectTargetAlpha,ease:Strong.easeIn,onComplete:EffectOn});
   if(effectTargetAlpha == 100)
   {
      effectTargetAlpha = 0;
   }
   else
   {
      effectTargetAlpha = 100;
   }
}
function EffectOff()
{
   container_mc.stackGage._alpha = 100;
   effectTargetAlpha = 0;
   gs.TweenLite.killTweensOf(container_mc.stackGage,false);
}
function patternMotionEnd(mc)
{
   gs.TweenLite.to(mc,0.1,{_xscale:100,_yscale:100});
}
function searchBuff(id, type, remove)
{
   var _loc6_ = coolTimeMc;
   if(isNaN(type))
   {
      var _loc1_ = 0;
      while(_loc1_ < buff_array.length)
      {
         if(buff_array[_loc1_]._name == "buff_" + id)
         {
            var _loc4_ = buff_array[_loc1_];
            if(remove == 1)
            {
               buff_array.splice(_loc1_,1);
            }
            return _loc4_;
         }
         _loc1_ = _loc1_ + 1;
      }
      _loc1_ = 0;
      while(_loc1_ < debuff_array.length)
      {
         if(debuff_array[_loc1_]._name == "debuff_" + id)
         {
            _loc4_ = debuff_array[_loc1_];
            if(remove == 1)
            {
               debuff_array.splice(_loc1_,1);
            }
            return _loc4_;
         }
         _loc1_ = _loc1_ + 1;
      }
      return null;
   }
   if(type == 0)
   {
      _loc1_ = 0;
      while(_loc1_ < buff_array.length)
      {
         if(buff_array[_loc1_]._name == "buff_" + id)
         {
            _loc4_ = buff_array[_loc1_];
            if(remove == 1)
            {
               buff_array.splice(_loc1_,1);
            }
            return _loc4_;
         }
         _loc1_ = _loc1_ + 1;
      }
      return null;
   }
   if(type >= 1)
   {
      _loc1_ = 0;
      while(_loc1_ < debuff_array.length)
      {
         if(debuff_array[_loc1_]._name == "debuff_" + id)
         {
            _loc4_ = debuff_array[_loc1_];
            if(remove == 1)
            {
               debuff_array.splice(_loc1_,1);
            }
            return _loc4_;
         }
         _loc1_ = _loc1_ + 1;
      }
      return null;
   }
}
function align()
{
   var _loc14_ = coolTimeMc;
   var _loc4_ = new Array();
   var _loc11_ = new Array();
   var _loc6_ = new Array();
   var _loc9_ = new Array();
   var _loc1_ = 0;
   while(_loc1_ < buff_array.length)
   {
      if(buff_array[_loc1_].bRelaxMerit)
      {
         _loc9_.push(buff_array[_loc1_]);
      }
      else
      {
         _loc6_.push(buff_array[_loc1_]);
      }
      _loc1_ = _loc1_ + 1;
   }
   _loc11_ = _loc6_.concat(_loc9_);
   var _loc12_ = new Array();
   var _loc8_ = new Array();
   var _loc7_ = new Array();
   _loc1_ = 0;
   while(_loc1_ < debuff_array.length)
   {
      if(debuff_array[_loc1_].bRelaxMerit)
      {
         _loc7_.push(debuff_array[_loc1_]);
      }
      else
      {
         _loc8_.push(debuff_array[_loc1_]);
      }
      _loc1_ = _loc1_ + 1;
   }
   _loc12_ = _loc8_.concat(_loc7_);
   var _loc13_ = _loc11_.length - 1;
   _loc4_ = _loc11_.concat(_loc12_);
   var _loc10_ = _loc4_.length;
   var _loc5_ = 1;
   var _loc2_ = 0;
   _loc1_ = 0;
   while(_loc1_ < _loc10_)
   {
      var _loc3_ = _loc2_ * (buffGap + buffWidth);
      _loc4_[_loc1_]._x = _loc3_;
      _loc4_[_loc1_]._y = _loc5_ * (buffGap + 60) - (buffGap + 60);
      _loc2_ = _loc2_ + 1;
      if(_loc2_ == maxNumInOneLine)
      {
         _loc5_ = _loc5_ + 1;
         _loc2_ = 0;
      }
      _loc1_ = _loc1_ + 1;
   }
}
function ToGame_GageBossTeamB_Init()
{
   fscommand("ToGame_GageBossTeamB_Init");
}
function ToGame_GageBossTeamB_PercentVisible(type)
{
   getURL("FSCommand:ToGame_GageBossTeamB_PercentVisible",type);
}
function GageUpMotionEnd(targetMc, num)
{
   targetMc.prevRank = targetMc.prevRank + 1;
   textUpData();
   GageChange(targetMc);
   targetMc.currentGage._width = 1;
   GageUpMotion(targetMc,num);
}
function GageDownMotionEnd(targetMc, num)
{
   targetMc.prevRank = targetMc.prevRank - 1;
   textUpData(true);
   GageChange(targetMc);
   GageDownMotion(targetMc,num);
}
function GageUpMotion(targetMc, num)
{
   var _loc5_ = targetMc.reSize;
   var _loc3_ = targetMc.currentGage._width;
   var _loc2_ = num - (gageWidth + 1 - _loc3_) / _loc5_;
   var _loc4_ = 0.5;
   targetMc.effectGage._width = 1;
   targetMc.effectGage._x = 0;
   if(_loc2_ >= 0)
   {
      _loc4_ = (gageWidth - _loc3_) * 0.001;
      gs.TweenLite.to(targetMc.currentGage,_loc4_,{_width:gageWidth,onComplete:GageUpMotionEnd,onCompleteParams:[targetMc,_loc2_]});
   }
   else
   {
      _loc2_ = gageWidth * (_loc3_ / _loc5_ + num) / targetMc.cuttingGage;
      gs.TweenLite.to(targetMc.currentGage,0.3,{_width:_loc2_});
   }
}
function boundEnd()
{
   container_mc._x = 0;
   container_mc._y = 0;
   gs.TweenLite.from(container_mc,0.3,{_x:0,_y:-10,ease:Regular.easeOut});
}
function GageDownMotion(targetMc, num)
{
   var _loc6_ = targetMc.cuttingGage;
   var _loc5_ = targetMc.reSize;
   var _loc3_ = targetMc.currentGage._width;
   var _loc2_ = num - _loc3_ / _loc5_;
   var _loc4_ = 0.5;
   if(criticalDamage == true)
   {
      if(gageFocus == gageTop)
      {
         gs.TweenLite.killTweensOf(container_mc,false);
         container_mc._x = 0;
         container_mc._y = 0;
         gs.TweenLite.to(container_mc,0.05,{_x:-15,_y:0,onComplete:boundEnd});
         initAni.gotoAndPlay(20);
      }
   }
   targetMc.effectBar._alpha = 0;
   if(_loc2_ >= 0)
   {
      lib.Debuger.trace("포인트넘" + _loc2_);
      targetMc.effectGage._width = _loc3_;
      targetMc.currentGage._width = 1;
      _loc4_ = targetMc.effectGage._width * 0.001;
      gs.TweenLite.to(targetMc.effectGage,_loc4_,{_width:1,ease:Regular.easeOut,onComplete:GageDownMotionEnd,onCompleteParams:[targetMc,_loc2_]});
      targetMc.effectBar._x = 0;
   }
   else
   {
      _loc2_ = gageWidth * (_loc3_ / _loc5_ - num) / _loc6_;
      targetMc.effectGage._width = _loc3_;
      targetMc.currentGage._width = _loc2_;
      gs.TweenLite.to(targetMc.effectGage,0.3,{delay:0.1,_width:_loc2_,ease:Regular.easeOut});
      targetMc.effectBar._x = _loc2_;
   }
}
function GageChange2(targetMc, nColor)
{
   targetMc.effectGage.colorMc.clear();
   targetMc.effectGage.colorMc.beginFill(nColor);
   targetMc.effectGage.colorMc.moveTo(0,0);
   targetMc.effectGage.colorMc.lineTo(gageWidth,0);
   targetMc.effectGage.colorMc.lineTo(gageWidth,18);
   targetMc.effectGage.colorMc.lineTo(0,18);
   targetMc.effectGage.colorMc.lineTo(0,0);
   targetMc.effectGage.colorMc.endFill();
   targetMc.effectGage.colorMc._alpha = 30;
}
function GageChange(targetMc)
{
   var _loc4_ = ColorArray.length;
   var _loc2_ = ColorArray[(targetMc.prevRank - 1) % _loc4_];
   var _loc3_ = ColorArray[(targetMc.prevRank - 2) % _loc4_];
   if(targetMc.prevRank == 2)
   {
      _loc3_ = 12648962;
   }
   if(targetMc.prevRank == 1)
   {
      _loc2_ = 12648962;
      _loc3_ = 0;
   }
   targetMc.currentGage._xscale = 100;
   targetMc.currentGage.clear();
   targetMc.nextGage.clear();
   targetMc.currentGage.beginFill(_loc2_);
   targetMc.currentGage.moveTo(0,0);
   targetMc.currentGage.lineTo(gageWidth,0);
   targetMc.currentGage.lineTo(gageWidth,18);
   targetMc.currentGage.lineTo(0,18);
   targetMc.currentGage.lineTo(0,0);
   targetMc.currentGage.endFill();
   targetMc.nextGage.beginFill(_loc3_);
   targetMc.nextGage.moveTo(0,0);
   targetMc.nextGage.lineTo(gageWidth,0);
   targetMc.nextGage.lineTo(gageWidth,18);
   targetMc.nextGage.lineTo(0,18);
   targetMc.nextGage.lineTo(0,0);
   targetMc.nextGage.endFill();
   GageChange2(targetMc,_loc2_);
}
function dangerEffect(type)
{
   gs.TweenLite.killTweensOf(container_mc.dangerBg,false);
   if(type)
   {
      var _loc1_ = container_mc.dangerBg._alpha;
      if(_loc1_ > 40)
      {
         _loc1_ = 0;
      }
      else
      {
         _loc1_ = 80;
      }
      gs.TweenLite.to(container_mc.dangerBg,0.5,{_alpha:_loc1_,onComplete:dangerEffect,onCompleteParams:[true]});
   }
   else
   {
      gs.TweenLite.to(container_mc.dangerBg,0.5,{_alpha:0});
   }
}
function textUpData(rankMotion)
{
   container_mc.percentTxt.text = gageTop.percentGage + "%";
   container_mc.rankTxt.text = "X" + gageTop.prevRank;
   if(rankMotion)
   {
      container_mc.rankTxt._alpha = 100;
      container_mc.rankTxt._x = 370;
      gs.TweenLite.killTweensOf(container_mc.rankTxt,false);
      gs.TweenLite.from(container_mc.rankTxt,0.3,{_alpha:0,_x:410,ease:Regular.easeOut});
   }
}
var UI = this;
UI._visible = false;
container_mc._alpha = 0;
var UIname = "GageBossTeamB";
var bWindowOpen = false;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
container_mc.UIDrager.setData(UIname,UI,container_mc.lock_mc);
var ColorArray = ["0x946DEF","0xFF9900","0x56A901","0x0066CC"];
var gageWidth = 473;
var criticalDamage = false;
var reSize = 1;
var stackBG = flash.display.BitmapData.loadBitmap("stack_BG");
var stack0 = flash.display.BitmapData.loadBitmap("stack_0");
var stack1 = flash.display.BitmapData.loadBitmap("stack_1");
var stack2 = flash.display.BitmapData.loadBitmap("stack_2");
var stack3 = flash.display.BitmapData.loadBitmap("stack_3");
var stack4 = flash.display.BitmapData.loadBitmap("stack_4");
var gageArr = [];
var gageFocus;
var gageTop;
container_mc.gageMc0.effectBar._alpha = 0;
container_mc.dangerBg._alpha = 0;
container_mc.percentTxt._visible = true;
container_mc.questMc._visible = false;
container_mc.stackGage._visible = false;
container_mc.gageBox.gageMc0._visible = false;
container_mc.gageBox.gageMc1._visible = false;
container_mc.UIDrager.onRelease2 = function()
{
   if(container_mc.UIDrager.pos_state == "false")
   {
      if(container_mc.percentTxt._visible)
      {
         myListener.OnGame_GageBossTeamB_PercentVisible(0);
         ToGame_GageBossTeamB_PercentVisible(0);
      }
      else
      {
         myListener.OnGame_GageBossTeamB_PercentVisible(1);
         ToGame_GageBossTeamB_PercentVisible(1);
      }
   }
};
myListener.OnGameEventShowWindow = function(_WindowName, _bShow)
{
   if(_WindowName.toLowerCase() == UIname.toLowerCase())
   {
      bWindowOpen = _bShow;
      if(bWindowOpen)
      {
         UI._visible = true;
         init();
      }
      else
      {
         UI._visible = false;
      }
   }
};
myListener.OnGame_GageBossTeamB_Add = function(index)
{
   var _loc1_ = container_mc.gageBox["gageMc" + index];
   _loc1_._visible = true;
   var _loc2_ = index * 20;
   _loc1_._x = _loc2_;
   _loc1_._y = - _loc2_;
   _loc1_.effectBar._alpha = 0;
   if(index == 1)
   {
      _loc1_.brightnessMc._alpha = 60;
      _loc1_.nameTxt._alpha = 50;
   }
};
myListener.OnGame_GageBossTeamB_Focus = function(index)
{
   var _loc1_ = container_mc.gageBox["gageMc" + index];
   if(!gageFocus)
   {
      gageFocus = gageTop = _loc1_;
   }
   if(_loc1_ == gageFocus)
   {
      return undefined;
   }
   gageFocus = _loc1_;
};
myListener.OnGame_GageBossTeamB_Swap = function(index)
{
   var _loc2_ = container_mc.gageBox["gageMc" + index];
   if(_loc2_ == gageTop)
   {
      return undefined;
   }
   var _loc1_ = gageTop;
   gageTop = _loc2_;
   var _loc3_ = gageTop._x;
   var _loc4_ = gageTop._y;
   gs.TweenLite.killTweensOf(_loc1_,false);
   gs.TweenLite.killTweensOf(gageTop,false);
   _loc1_.brightnessMc._alpha = 60;
   gageTop.brightnessMc._alpha = 0;
   gageTop.swapDepths(_loc1_);
   gs.TweenLite.to(gageTop,0.2,{_x:0,_y:0});
   gs.TweenLite.to(_loc1_,0.2,{_x:_loc3_,_y:_loc4_});
   gs.TweenLite.killTweensOf(container_mc.percentTxt,false);
   gs.TweenLite.killTweensOf(container_mc.rankTxt,false);
   container_mc.percentTxt._alpha = 0;
   container_mc.rankTxt._alpha = 0;
   container_mc.rankTxt._x = 370;
   textUpData();
   _loc1_.nameTxt._alpha = 50;
   _loc2_.nameTxt._alpha = 100;
   gs.TweenLite.to(container_mc.percentTxt,0.2,{delay:0.2,_alpha:100});
   gs.TweenLite.to(container_mc.rankTxt,0.2,{delay:0.2,_alpha:100});
};
myListener.OnGame_GageBossTeamB_SetColorRotation = function(_colorList)
{
   ColorArray = [];
};
myListener.OnGame_GageBossTeamB_SetBossData = function(bossName, questType)
{
   if(gageFocus == gageTop)
   {
      container_mc.questTxt.htmlText = "<img src=\'" + questType + "\'>";
      container_mc.questMc._visible = false;
   }
   gageFocus.nameTxt.htmlText = bossName;
};
myListener.OnGame_GageBossTeamB_PercentVisible = function(bool)
{
   container_mc.percentTxt._visible = Boolean(Number(bool));
   textUpData();
};
myListener.OnGame_GageBossTeamB_SetHp = function(curHP, maxHP, maxRank)
{
   var _loc1_ = gageFocus;
   gs.TweenLite.killTweensOf(_loc1_.effectBar,false);
   gs.TweenLite.killTweensOf(_loc1_.effectGage,false);
   gs.TweenLite.killTweensOf(_loc1_.currentGage,false);
   coolTimeMc._visible = true;
   patternMc._visible = true;
   var _loc6_ = maxHP;
   var _loc2_ = _loc6_ / maxRank;
   var _loc7_ = gageWidth / _loc2_;
   _loc1_.totalGage = _loc6_;
   _loc1_.cuttingGage = _loc2_;
   _loc1_.reSize = _loc7_;
   var _loc8_ = curHP % _loc2_;
   var _loc4_ = 1;
   if(_loc8_ == 0)
   {
      _loc4_ = 0;
   }
   _loc1_.prevRank = int(curHP / _loc2_) + _loc4_;
   _loc1_.percentGage = int(curHP / maxHP * 100);
   GageChange(_loc1_);
   var _loc3_ = curHP % _loc2_ / _loc2_ * gageWidth;
   _loc1_.currentGage._width = _loc3_;
   if(_loc3_ == 0)
   {
      _loc1_.currentGage._width = gageWidth;
   }
   if(_loc1_.currentGage._width == gageWidth)
   {
      _loc1_.prevRank = _loc1_.prevRank - 1;
   }
   _loc1_.effectGage._width = _loc3_;
   textUpData();
};
myListener.OnGame_GageBossTeamB_UpDataHp = function(curHP, critical)
{
   var targetMc = gageFocus;
   var checkGage = 0;
   var _loc3_ = targetMc.totalGage;
   var cuttingGage = targetMc.cuttingGage;
   var reSize = targetMc.reSize;
   targetMc.percentGage = int(curHP / _loc3_ * 100);
   textUpData();
   if(_loc3_ < curHP)
   {
      checkGage = _loc3_;
   }
   else if(0 >= curHP)
   {
      checkGage = 1;
   }
   else
   {
      checkGage = curHP;
   }
   if(critical == 1)
   {
      criticalDamage = true;
   }
   else
   {
      criticalDamage = false;
   }
   var _loc4_ = 0;
   delete targetMc.currentGage.onEnterFrame;
   targetMc.currentGage.onEnterFrame = function()
   {
      delete this.onEnterFrame;
      var _loc2_ = int(targetMc.currentGage._width / reSize + (targetMc.prevRank - 1) * cuttingGage);
      gs.TweenLite.killTweensOf(targetMc.effectBar,false);
      gs.TweenLite.killTweensOf(targetMc.effectGage,false);
      gs.TweenLite.killTweensOf(targetMc.currentGage,false);
      if(_loc2_ < curHP)
      {
         GageUpMotion(targetMc,checkGage - _loc2_);
      }
      else if(_loc2_ > curHP)
      {
         GageDownMotion(targetMc,_loc2_ - checkGage);
      }
   };
};
myListener.OnGame_GageBossTeamB_DangerMode = function(bool)
{
   var _loc1_ = Boolean(Number(bool));
   if(_loc1_)
   {
      dangerEffect(true);
   }
   else
   {
      dangerEffect(false);
   }
};
myListener.OnGame_GageBossTeamB_SetSt = function(curST, maxST, stackMin, switchs)
{
   if(maxST < 1 || maxST == undefined)
   {
      container_mc.stackGage._visible = false;
      coolTimeMc._y = 36;
      return undefined;
   }
   coolTimeMc._y = 52;
   container_mc.stackGage._visible = true;
   container_mc.stackGage.clear();
   var _loc3_ = UI.stack0;
   container_mc.stackGage.stackTxt.text = curST;
   if(stackMin == 0)
   {
      if(maxST == 7)
      {
         if(curST == maxST)
         {
            _loc3_ = UI.stack4;
         }
         else
         {
            _loc3_ = UI.stack3;
         }
      }
      else if(curST == maxST)
      {
         _loc3_ = UI.stack2;
      }
      else
      {
         _loc3_ = UI.stack1;
      }
   }
   var _loc1_ = 0;
   while(_loc1_ < maxST)
   {
      var _loc2_ = _loc1_ * 17;
      lib.display.DrawBitmapData.draw(container_mc.stackGage,stackBG,_loc2_,0,0,0,16,16,1);
      if(_loc1_ + 1 <= curST)
      {
         lib.display.DrawBitmapData.draw(container_mc.stackGage,_loc3_,2 + _loc2_,2,0,0,16,16,1);
      }
      _loc1_ = _loc1_ + 1;
   }
   if(switchs == 1)
   {
      effectTargetAlpha = 0;
      EffectOn();
   }
   else
   {
      EffectOff();
   }
};
var effectTargetAlpha = 0;
var PATTERN_STR_0 = lib.util.UIString.getUIString("$610000");
var PATTERN_STR_1 = lib.util.UIString.getUIString("$610001");
var PATTERN_STR_2 = lib.util.UIString.getUIString("$610002");
var PATTERN_STR_3 = lib.util.UIString.getUIString("$610003");
var PATTERN_STR_4 = lib.util.UIString.getUIString("$610004");
myListener.OnGame_GageBossTeamB_SetPattern = function(idx, type)
{
   var _loc3_ = patternMc["pBox" + idx];
   if(type == 0)
   {
      _loc3_.removeMovieClip();
      return undefined;
   }
   if(!_loc3_)
   {
      _loc3_ = patternMc.attachMovie("pBox","pBox" + idx,patternMc.getNextHighestDepth());
      _loc3_.gotoAndStop(Number(idx) + 1);
      _loc3_.count = 0;
      pattern[idx] = _loc3_;
   }
   else
   {
      _loc3_.count = _loc3_.count + 1;
      _loc3_.txt.text = _loc3_.count;
   }
   lib.manager.ToolTip.add(_loc3_,UI["PATTERN_STR_" + idx],1);
   var _loc4_ = 0;
   var _loc1_ = 5;
   while(_loc1_ >= 0)
   {
      var _loc2_ = patternMc["pBox" + _loc1_];
      if(_loc2_)
      {
         _loc2_._x = _loc4_;
         _loc4_ = _loc4_ - 35;
      }
      _loc1_ = _loc1_ - 1;
   }
   _loc3_.effect0._alpha = 0;
   _loc3_.effect1._alpha = 0;
   _loc3_._xscale = 80;
   _loc3_._yscale = 80;
   gs.TweenLite.killTweensOf(_loc3_.effect0,false);
   gs.TweenLite.from(_loc3_.effect0,0.8,{_alpha:100,_xscale:130,_yscale:130,ease:Regular.easeOut});
   gs.TweenLite.killTweensOf(_loc3_.effect1,false);
   gs.TweenLite.from(_loc3_.effect1,0.8,{_alpha:100,ease:Regular.easeOut});
   gs.TweenLite.killTweensOf(_loc3_,false);
   gs.TweenLite.from(_loc3_,0.2,{_xscale:150,_yscale:150,ease:Regular.easeOut,onComplete:patternMotionEnd,onCompleteParams:[_loc3_]});
};
var buffGap = 3;
var buffWidth = 30;
var buff_array = new Array();
var debuff_array = new Array();
buff_array.cnt = 0;
debuff_array.cnt = 0;
var cnt = 0;
myListener.OnGame_GageBossTeamB_AddBuff = function(id, stackCnt, type, bRelaxMerit, img, remain, total)
{
   cnt++;
   type = Number(type);
   remain = Math.abs(Number(remain));
   total = Math.abs(Number(total));
   stackCnt = Number(stackCnt);
   bRelaxMerit = Number(bRelaxMerit);
   var _loc12_ = coolTimeMc;
   var _loc10_ = null;
   var _loc6_ = null;
   var _loc11_ = null;
   var _loc3_ = null;
   if(type == 0)
   {
      _loc10_ = _loc12_.buff_container;
      _loc3_ = buff_array;
      _loc11_ = _loc3_.length;
      _loc6_ = "buff_";
   }
   else
   {
      _loc10_ = _loc12_.buff_container;
      _loc3_ = debuff_array;
      _loc11_ = _loc3_.length;
      _loc6_ = "debuff_";
   }
   var _loc16_ = searchBuff(id,type);
   if(_loc16_ == null)
   {
      var _loc13_ = "Slot_link";
      var maked = _loc10_.attachMovie(_loc13_,_loc6_ + id,cnt);
      if(type == 0)
      {
         maked.Count.txt.textColor = lib.info.TextColor.SLOT_ABNORMALITY_BUFF;
         maked.frame_mc.gotoAndStop(1);
      }
      else if(type == 1)
      {
         maked.Count.txt.textColor = lib.info.TextColor.SLOT_ABNORMALITY_DEBUFF;
         maked.frame_mc.gotoAndStop(1);
      }
      else if(type == 2)
      {
         maked.Count.txt.textColor = lib.info.TextColor.SLOT_ABNORMALITY_DEBUFF_WEAK;
         maked.frame_mc.gotoAndStop(3);
      }
      else if(type == 3)
      {
         maked.Count.txt.textColor = lib.info.TextColor.SLOT_ABNORMALITY_DEBUFF_TICK;
         maked.frame_mc.gotoAndStop(4);
      }
      else if(type == 4)
      {
         maked.Count.txt.textColor = lib.info.TextColor.SLOT_ABNORMALITY_DEBUFF_STUN;
         maked.frame_mc.gotoAndStop(5);
      }
      maked.warn = false;
      if(stackCnt > 1 || stackCnt < 0)
      {
         maked.stack.text = stackCnt;
         if(stackCnt < 0)
         {
            maked.stack.textColor = 13369345;
         }
         else
         {
            maked.stack.textColor = 16777215;
         }
      }
      else
      {
         maked.stack.text = "";
      }
      _loc3_.push(maked);
      _loc3_.cnt = _loc3_.cnt + 1;
      if(bRelaxMerit != 1)
      {
         if(total == 0)
         {
            maked.cool.remove();
            delete maked.cool;
            maked.Count._visible = false;
            maked.CoolTime._visible = false;
            delete maked.timer.onEnterFrame;
         }
         else
         {
            maked.CoolTime._visible = true;
            maked.Count._visible = true;
            maked.cool = new lib.util.CoolTime(remain,total);
            if(remain <= 0)
            {
               maked.cool.remove();
               delete maked.cool;
               myListener.OnGame_GageBossTeamB_RemoveBuff(id);
            }
            else
            {
               maked.cool.onTick = function()
               {
                  maked.Count.txt.text = this.getCountText();
                  if(this.getSecond() <= 3 && maked.warn == false)
                  {
                     lib.util.Warning.add(maked);
                     maked.warn = true;
                  }
                  lib.util.CoolTime.draw(maked.CoolTime,28,28,this.getDgree(),0,45,true);
               };
               maked.cool.onFinished = function()
               {
                  delete maked.cool;
                  myListener.OnGame_GageBossTeamB_RemoveBuff(id);
               };
            }
         }
      }
      else
      {
         maked.remain = remain;
         maked.total = total;
         disableTrans = lib.info.ColorTrans.disableTrans();
         var _loc15_ = new flash.geom.Transform(maked.Icon);
         _loc15_.colorTransform = disableTrans;
      }
      maked.id = id;
      maked.type = type;
      maked.bRelaxMerit = bRelaxMerit;
      maked.img = img;
      maked.draw(img,28,28);
      maked.drag = false;
      maked.effect = false;
      maked.Count._alpha = 100;
      maked.Count.txt.textAutoSize = "fit";
      if(bRelaxMerit)
      {
         var _loc17_ = img.substring(19,img.length);
         lib.manager.ToolTip.add(maked.SLOT,_loc17_,5,maked.Icon);
      }
      else
      {
         var _loc14_ = img.substring(20,img.length);
         lib.manager.ToolTip.add(maked.SLOT,_loc14_,4,maked.Icon);
      }
   }
   align();
};
myListener.OnGame_GageBossTeamB_UpDateBuff = function(id, stackCnt, useRelaxMerit, img, remain, total)
{
   remain = Number(remain);
   total = Number(total);
   stackCnt = Number(stackCnt);
   useRelaxMerit = Number(useRelaxMerit);
   var searched = searchBuff(id);
   if(img != undefined && img != "null" && img != "")
   {
      if(searched.TEX != img)
      {
         searched.draw(img,28,28);
      }
   }
   if(stackCnt > 1 || stackCnt < 0)
   {
      searched.stack.text = stackCnt;
      if(stackCnt < 0)
      {
         searched.stack.textColor = 13369345;
      }
      else
      {
         searched.stack.textColor = 16777215;
      }
   }
   else
   {
      searched.stack.text = "";
   }
   if(searched.bRelaxMerit == 1 && useRelaxMerit != undefined && useRelaxMerit != "")
   {
      if(!useRelaxMerit)
      {
         searched.cool.remove();
         delete searched.cool;
         searched.Count._alpha = 0;
         disableTrans = lib.info.ColorTrans.disableTrans();
         var _loc7_ = new flash.geom.Transform(searched.Icon);
         _loc7_.colorTransform = disableTrans;
      }
      else
      {
         searched.Count._alpha = 100;
         enableTrans = lib.info.ColorTrans.enableTrans();
         _loc7_ = new flash.geom.Transform(searched.Icon);
         _loc7_.colorTransform = enableTrans;
         if(isNaN(remain))
         {
            remain = searched.remain;
         }
         if(isNaN(total))
         {
            total = searched.total;
         }
      }
   }
   if(searched.bRelaxMerit == 1 && !useRelaxMerit)
   {
      return undefined;
   }
   if(total == 0)
   {
      lib.util.Warning.remove(searched);
      searched.warn = false;
      searched.cool.remove();
      delete searched.cool;
      searched.Count._visible = false;
      searched.CoolTime._visible = false;
      delete searched.timer.onEnterFrame;
      return undefined;
   }
   searched.Count._visible = true;
   searched.CoolTime._visible = true;
   if(remain != undefined && total != undefined && remain != "null" && total != "null" && remain != "" && total != "")
   {
      searched.cool.remove();
      delete searched.cool;
      searched.cool = new lib.util.CoolTime(remain,total);
      searched.cool.reverse = true;
      lib.util.Warning.remove(searched,true);
      searched._alpha = 100;
      searched.warn = false;
      if(remain <= 0)
      {
         searched.cool.remove();
         delete searched.cool;
         myListener.OnGame_GageBossTeamB_RemoveBuff(id);
      }
      else
      {
         searched.cool.onTick = function()
         {
            searched.Count.txt.text = this.getCountText();
            if(this.getSecond() <= 3 && searched.warn == false)
            {
               lib.util.Warning.add(searched);
               searched.warn = true;
            }
            lib.util.CoolTime.draw(searched.CoolTime,28,28,this.getDgree(),0,45,true);
         };
         searched.cool.onFinished = function()
         {
            delete searched.cool;
            myListener.OnGame_GageBossTeamB_RemoveBuff(id);
         };
      }
   }
};
myListener.OnGame_GageBossTeamB_RemoveBuff = function(id)
{
   var _loc4_ = coolTimeMc;
   var _loc1_ = searchBuff(id,null,1);
   var _loc3_ = undefined;
   var _loc2_ = _loc1_.type;
   if(_loc2_ == 0)
   {
      _loc3_ = buff_array;
   }
   else if(_loc2_ >= 1)
   {
      _loc3_ = debuff_array;
   }
   lib.util.Warning.remove(_loc1_);
   _loc1_.cool.remove();
   removeMovieClip(_loc1_);
   align();
};
myListener.OnGame_GageBossTeamB_ClearBuff = function(type)
{
   var _loc5_ = coolTimeMc;
   type = Number(type);
   if(isNaN(type))
   {
      var _loc2_ = buff_array.concat();
      var _loc3_ = debuff_array.concat();
      var _loc1_ = 0;
      while(_loc1_ < _loc2_.length)
      {
         myListener.OnGame_GageBossTeamB_RemoveBuff(_loc2_[_loc1_].id);
         _loc1_ = _loc1_ + 1;
      }
      _loc1_ = 0;
      while(_loc1_ < _loc3_.length)
      {
         myListener.OnGame_GageBossTeamB_RemoveBuff(_loc3_[_loc1_].id);
         _loc1_ = _loc1_ + 1;
      }
      return undefined;
   }
   var _loc6_ = undefined;
   if(type == 0)
   {
      imsi_arrray = buff_array.concat();
      _loc1_ = 0;
      while(_loc1_ < imsi_arrray.length)
      {
         myListener.OnGame_GageBossTeamB_RemoveBuff(imsi_arrray[_loc1_].id);
         _loc1_ = _loc1_ + 1;
      }
   }
   else if(type >= 1)
   {
      imsi_arrray = debuff_array.concat();
      _loc1_ = 0;
      while(_loc1_ < imsi_arrray.length)
      {
         myListener.OnGame_GageBossTeamB_RemoveBuff(imsi_arrray[_loc1_].id);
         _loc1_ = _loc1_ + 1;
      }
   }
};
myListener.OnGame_GageBossTeamB_HoldBuff = function(id)
{
   var _loc1_ = searchBuff(id);
   if(_loc1_ != null)
   {
      _loc1_.cool.remove();
      delete register1.cool;
   }
};
myListener.OnGame_GageBossTeamB_TeamName = function(teamName, teamIndex)
{
   gageFocus.teamName.text = teamName;
   gageFocus.teamMark.gotoAndStop(teamIndex);
   switch(teamIndex)
   {
      case 1:
         gageFocus.teamName.textColor = 3529727;
         break;
      case 2:
         gageFocus.teamName.textColor = 16729916;
         break;
      case 3:
         gageFocus.teamName.textColor = 8447772;
   }
};
var sidx = 1000;
var iconFrameBm0 = flash.display.BitmapData.loadBitmap("slotFrame0");
var iconFrameBm1 = iconFrameBm0;
var iconFrameBm2 = flash.display.BitmapData.loadBitmap("slotFrame2");
var iconFrameBm3 = flash.display.BitmapData.loadBitmap("slotFrame3");
var iconFrameBm4 = flash.display.BitmapData.loadBitmap("slotFrame4");
var disableBmData = flash.display.BitmapData.loadBitmap("buffDisable");
myListener.OnGame_GageBossTeamB_Add(0);
myListener.OnGame_GageBossTeamB_Focus(0);
ToGame_GageBossTeamB_Init();
myListener.OnGame_AutoTest = function(num)
{
   var count = 10;
   var gage = 9200;
   container_mc.onEnterFrame = function()
   {
      count--;
      gage = gage - num;
      myListener.OnGame_GageBossTeamB_UpDataHp(gage);
      if(count < 0)
      {
         delete this.onEnterFrame;
      }
   };
};
myListener.OnGame_AutoTest2 = function()
{
   var gage = testGage;
   var timer = 0;
   var cevent = 0;
   container_mc.onEnterFrame = function()
   {
      timer = random(10);
      if(timer == 0)
      {
         var _loc2_ = 100 + random(500);
         gage = gage - _loc2_;
         if(_loc2_ > 500)
         {
            cevent = 1;
         }
         else
         {
            cevent = 0;
         }
         myListener.OnGame_GageBossTeamB_UpDataHp(gage,cevent);
         if(gage <= 0)
         {
            delete this.onEnterFrame;
         }
      }
   };
};
var testGage = 1000;
myListener.OnGame_AutoTest3 = function()
{
   var _loc1_ = random(100);
   var _loc3_ = random(10);
   var _loc2_ = false;
   if(_loc3_ == 0)
   {
      _loc2_ = 1;
      _loc1_ = _loc1_ + 500;
   }
   testGage = testGage - _loc1_;
   myListener.OnGame_GageBossTeamB_UpDataHp(testGage,_loc2_);
};
