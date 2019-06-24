function vipPosition()
{
   if(attendtPosition)
   {
      container_mc.vipMc._x = buffCount * 56 + 88;
   }
   else
   {
      container_mc.vipMc._x = buffCount * 56 + 32;
   }
}
function VipViewMode()
{
   if(vipMode)
   {
      container_mc.vipMc.iconMc.gradeMc.gotoAndStop(12);
      container_mc.vipMc.expMc._visible = false;
   }
   else
   {
      container_mc.vipMc.iconMc.gradeMc.gotoAndStop(Number(vipLevel) + 1);
      container_mc.vipMc.expMc._visible = true;
   }
}
function newEffect(mc, num)
{
   gs.TweenLite.killTweensOf(mc,false);
   gs.TweenLite.to(mc,0.5,{_alpha:num,onComplete:effectCheck,onCompleteParams:[mc]});
}
function effectCheck(mc)
{
   if(mc.effectMode)
   {
      if(mc._alpha > 50)
      {
         newEffect(mc,0);
      }
      else
      {
         newEffect(mc,100);
      }
   }
}
function attendtPosition()
{
   attendtMc._x = buffCount * 56 + 32;
}
function ToGame_Benefit_PcEventClick()
{
   fscommand("ToGame_Benefit_PcEventClick");
}
function ToGame_Benefit_VipClick()
{
   fscommand("ToGame_Benefit_VipClick");
}
function ToGame_Benefit_AttendEventClick()
{
   lib.Debuger.trace("ToGame_Benefit_AttendEventClick");
   fscommand("ToGame_Benefit_AttendEventClick");
}
function ToGame_Benefit_ButtonClick(id)
{
   lib.Debuger.trace("ToGame_Benefit_ButtonClick : " + id);
   getURL("FSCommand:ToGame_Benefit_ButtonClick",id);
}
function drawArc(mc, x, y, radius, r1, r2)
{
   var _loc15_ = Math.ceil((r2 - r1) / 45);
   var _loc1_ = (r2 - r1) / _loc15_;
   var _loc6_ = 0;
   var _loc13_ = mc;
   _loc13_.clear();
   _loc13_.lineStyle(10,16764108,100,false,"normal","none");
   var _loc17_ = x + radius * Math.sin(r1 * rad);
   var _loc16_ = y - radius * Math.cos(r1 * rad);
   _loc13_.moveTo(_loc17_,_loc16_);
   while(_loc6_ < _loc15_)
   {
      var _loc4_ = r1 + _loc1_ * _loc6_;
      var _loc3_ = _loc4_ + _loc1_;
      var _loc5_ = -90 + _loc4_ + _loc1_ / 2;
      var _loc8_ = x + radius * Math.sin(_loc3_ * rad);
      var _loc7_ = y - radius * Math.cos(_loc3_ * rad);
      var _loc10_ = x + radius * Math.cos(_loc5_ * rad) / Math.cos(_loc1_ / 2 * rad);
      var _loc9_ = y + radius * Math.sin(_loc5_ * rad) / Math.cos(_loc1_ / 2 * rad);
      _loc13_.curveTo(_loc10_,_loc9_,_loc8_,_loc7_);
      _loc6_ = _loc6_ + 1;
   }
   return _loc13_;
}
function VipExpChange()
{
   var startNum = prevPer;
   var endNum = prevExp * 300 + 30;
   var count = 0;
   prevPer = endNum;
   container_mc.vipMc.expMc.onEnterFrame = function()
   {
      if(count > 14)
      {
         drawArc(container_mc.vipMc.expMc.mc,28,24,24,0,endNum);
         delete this.onEnterFrame;
         return undefined;
      }
      startNum = startNum + (endNum - startNum) * 0.2;
      drawArc(container_mc.vipMc.expMc.mc,28,24,24,0,int(startNum));
      count++;
   };
   gs.TweenLite.killTweensOf(container_mc.vipMc,false);
   gs.TweenLite.to(container_mc.vipMc,0.3,{_xscale:150,_yscale:150,ease:Regular.easeOut,onComplete:VipExpChangeEnd});
}
function VipExpChangeEnd()
{
   gs.TweenLite.to(container_mc.vipMc,0.1,{delay:0.8,_xscale:100,_yscale:100,ease:Regular.easeOut});
}
function searchBuff(id)
{
   var _loc2_ = buffList.getIterator();
   while(_loc2_.hasNext())
   {
      var _loc1_ = _loc2_.next();
      if(_loc1_.id == id)
      {
         return _loc1_;
      }
   }
   return null;
}
function alignTypeHandler(value)
{
   if(value != null)
   {
      alignType = value;
      if(value == 0)
      {
         buffList.xGap = buffGap;
         buffList.setAlignDirection("L");
      }
      else if(value == 1)
      {
         buffList.xGap = buffGap;
         buffList.setAlignDirection("R");
      }
      else if(value == 2)
      {
         buffList.yGap = buffVerticalGap;
         buffList.setAlignDirection("T");
      }
      else if(value == 3)
      {
         buffList.yGap = buffVerticalGap;
         buffList.setAlignDirection("B");
      }
   }
}
var UI = this;
UI._visible = false;
var UIname = "Benefit";
this.bWindowOpen = true;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
var alignType = 0;
var buffGap = 15;
var buffWidth = 44;
var buffVerticalGap = 26;
var buffList = new lib.util.List(container_mc.abnormality,"buff_");
var buffCount = 0;
myListener.OnGameEventShowWindow = function(_WindowName, _bShow)
{
   if(_WindowName.toLowerCase() == UIname.toLowerCase())
   {
      bWindowOpen = _bShow;
      UI._visible = _bShow;
   }
};
container_mc.bgMovieclip._visible = false;
myListener.OnGameEventChangeUIMode = function()
{
   if(_global.gbUIMode)
   {
      if(container_mc.vipMc)
      {
         container_mc.bgMovieclip._visible = true;
      }
   }
   else
   {
      container_mc.bgMovieclip._visible = false;
   }
};
myListener.OnGame_Benefit_AddBuff = function(id, type, stackCnt, bRelaxMerit, img, remain, total)
{
   type = Boolean(type);
   remain = Math.abs(Number(remain));
   total = Math.abs(Number(total));
   stackCnt = Number(stackCnt);
   bRelaxMerit = Number(bRelaxMerit);
   var _loc15_ = null;
   var _loc11_ = null;
   var _loc12_ = null;
   var _loc14_ = null;
   var _loc9_ = searchBuff(id);
   if(_loc9_ == null)
   {
      buffCount++;
      var maked = buffList.add(id,"Slot_link");
      maked.BG.attachMovie("retainBg","retainBg",maked.BG.getNextHighestDepth());
      maked.BG.retainBg._x = maked.BG.retainBg._y = 28;
      maked.Count.txt.textColor = lib.info.TextColor.SLOT_ABNORMALITY_BUFF;
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
      if(bRelaxMerit != 1)
      {
         if(total == 0)
         {
            maked.Count._visible = false;
            maked.CoolTime._visible = false;
         }
         else
         {
            maked.CoolTime._visible = false;
            maked.Count._visible = true;
            maked.cool = new lib.util.CoolTime(remain,total);
            var _loc7_ = random(1000000);
            maked.cool.tempCount = _loc7_;
            if(remain <= 0)
            {
               maked.cool.remove();
               delete maked.cool;
               myListener.OnGame_Benefit_RemoveBuff(id);
            }
            else
            {
               maked.cool.onTick = function()
               {
                  maked.Count.txt.text = this.getCountText();
                  lib.util.CoolTime.draw(maked.CoolTime,58.7,58.7,this.getDgree(),0,45,true);
               };
               maked.cool.onFinished = function()
               {
                  if(type == true)
                  {
                     maked.warn == false;
                     maked.Count.txt.text = this.getCountText();
                     OnGame_Benefit_HoldBuff(id);
                  }
                  else
                  {
                     delete maked.cool;
                     myListener.OnGame_Benefit_RemoveBuff(id);
                  }
               };
            }
         }
      }
      else
      {
         maked.remain = remain;
         maked.total = total;
         disableTrans = lib.info.ColorTrans.disableTrans();
         var _loc8_ = new flash.geom.Transform(maked.Icon);
         _loc8_.colorTransform = disableTrans;
      }
      maked.id = id;
      maked._xscale = maked._yscale = 75;
      maked.bRelaxMerit = bRelaxMerit;
      maked.img = img;
      maked.draw(img,58.7,58.7);
      maked.drag = false;
      maked.effect = false;
      maked.Count._alpha = 100;
      maked.Count.txt.textAutoSize = "fit";
      if(bRelaxMerit)
      {
         lib.manager.ToolTip.add(maked.SLOT,id,6);
      }
      else
      {
         lib.manager.ToolTip.add(maked.SLOT,id,6);
      }
      maked.onUnload = function()
      {
         UI.stopDrag();
         lib.util.Warning.remove(this);
         this.cool.remove();
      };
      maked.onPress2 = function()
      {
         var _loc2_ = lib.info.AlignInfo.yRatioToPixel(0);
         var _loc1_ = lib.info.AlignInfo.yRatioToPixel(100);
         UI.startDrag(false,-10,_loc2_ - 15,Stage.width - 30,_loc1_ - 50);
      };
      maked.onRelease2 = function()
      {
         lib.info.AlignInfo.savePos(UI,true);
         UI.stopDrag();
      };
   }
   buffList.sortOn(["bRelaxMerit","type"],[Array.DESCENDING,Array.DESCENDING]);
   vipPosition();
   attendtPosition();
};
myListener.OnGame_Benefit_UpdateBuff = function(id, stackCnt, useRelaxMerit, img, remain, total)
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
         searched.draw(img,58.7,58.7);
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
         lib.util.Warning.remove(searched,true);
         searched.warn = false;
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
      lib.util.Warning.remove(searched,true);
      searched.warn = false;
      searched.cool.remove();
      delete searched.cool;
      searched.Count._visible = false;
      searched.CoolTime._visible = false;
      return undefined;
   }
   searched.Count._visible = true;
   searched.CoolTime._visible = false;
   if(remain != undefined && total != undefined && remain != "null" && total != "null" && remain != "" && total != "")
   {
      searched.cool.remove();
      delete searched.cool;
      lib.util.Warning.remove(searched,true);
      searched.warn = false;
      searched._alpha = 100;
      searched.cool = new lib.util.CoolTime(remain,total);
      searched.cool.reverse = true;
      searched.cool.onTick = function()
      {
         searched.Count.txt.text = this.getCountText();
         lib.util.CoolTime.draw(searched.CoolTime,58.7,58.7,this.getDgree(),0,45,true);
      };
      searched.cool.onFinished = function()
      {
         delete searched.cool;
         myListener.OnGame_Benefit_RemoveBuff(id);
      };
   }
};
myListener.OnGame_Benefit_RemoveBuff = function(id)
{
   var _loc1_ = buffList.getItem(id);
   if(_loc1_)
   {
      buffCount--;
      _loc1_.cool.remove();
      delete register1.cool;
      buffList.remove(id);
   }
   if(_loc1_ == eventMc)
   {
      eventMc = null;
   }
   vipPosition();
   attendtPosition();
};
myListener.OnGame_Benefit_ClearBuff = function()
{
   buffList.clear();
   buffCount = 0;
   eventMc = null;
   vipPosition();
   attendtPosition();
};
myListener.OnGame_Benefit_HoldBuff = function(id)
{
   var _loc1_ = searchBuff(id);
   if(_loc1_ != null)
   {
      _loc1_.cool.remove();
      delete register1.cool;
   }
};
myListener.OnGameEventEnableRelaxMeritIcon = function(id, bEnable)
{
   bEnable = Number(bEnable);
   var _loc1_ = searchBuff(id);
   if(bEnable)
   {
      _loc1_.Count._alpha = 100;
      enableTrans = lib.info.ColorTrans.enableTrans();
      var _loc3_ = new flash.geom.Transform(_loc1_.Icon);
      _loc3_.colorTransform = enableTrans;
      myListener.OnGame_Benefit_UpdateBuff(id,"",_loc1_.remain,_loc1_.total);
   }
   else
   {
      _loc1_.cool.remove();
      delete register1.cool;
      _loc1_.Count._alpha = 0;
      disableTrans = lib.info.ColorTrans.disableTrans();
      _loc3_ = new flash.geom.Transform(_loc1_.Icon);
      _loc3_.colorTransform = disableTrans;
   }
};
var vipLevel = -1;
var vipMode = true;
myListener.OnGame_Benefit_SetButton = function(id)
{
   var _loc2_ = buffList.getItem(id);
   lib.Debuger.trace("버튼" + _loc2_);
   _loc2_.onRollOver2 = function()
   {
      UI.stopDrag();
      this.BG.retainBg.btn.gotoAndStop(2);
   };
   _loc2_.onReleaseOut2 = _loc2_.onReleaseOutSide2 = function()
   {
      UI.stopDrag();
      this.BG.retainBg.btn.gotoAndStop(1);
   };
   _loc2_.onPress2 = function()
   {
      var _loc3_ = lib.info.AlignInfo.yRatioToPixel(0);
      var _loc2_ = lib.info.AlignInfo.yRatioToPixel(100);
      UI.startDrag(false,-10,_loc3_ - 15,Stage.width - 30,_loc2_ - 50);
      clickX = UI._x;
      clickY = UI._y;
      this.BG.retainBg.btn.gotoAndStop(3);
   };
   _loc2_.onRelease2 = function()
   {
      UI.stopDrag();
      if(UI._x > clickX + 5 || UI._x < clickX - 5 || UI._y > clickY + 5 || UI._y < clickY - 5)
      {
         lib.info.AlignInfo.savePos(UI,true);
      }
      else
      {
         this.BG.retainBg.btn.gotoAndStop(1);
         ToGame_Benefit_ButtonClick(id);
      }
   };
};
var clickX = 0;
var clickY = 0;
myListener.OnGame_Benefit_SetVip = function(level, Str, grade)
{
   vipLevel = level;
   if(level == "-1")
   {
      container_mc.vipMc.removeMovieClip();
      return undefined;
   }
   var _loc2_ = container_mc.vipMc;
   if(!_loc2_)
   {
      _loc2_ = container_mc.attachMovie("vipMc","vipMc",container_mc.getNextHighestDepth());
      _loc2_._y = 22;
      _loc2_.btn.count = 0;
      _loc2_.btn.drag = false;
      vipPosition();
      _loc2_.btn.onRollOver = function()
      {
         UI.stopDrag();
         this._parent.overMc._alpha = 100;
      };
      _loc2_.btn.onRollOut = _loc2_.btn.onReleaseOutside = function()
      {
         UI.stopDrag();
         this._parent.overMc._alpha = 0;
      };
      _loc2_.btn.onPress = function()
      {
         clickX = UI._x;
         clickY = UI._y;
         var _loc3_ = lib.info.AlignInfo.yRatioToPixel(0);
         var _loc2_ = lib.info.AlignInfo.yRatioToPixel(100);
         UI.startDrag(false,-10,_loc3_ - 15,Stage.width - 30,_loc2_ - 50);
         this._parent.overMc._alpha = 100;
      };
      _loc2_.btn.onRelease = function()
      {
         UI.stopDrag();
         this._parent.overMc._alpha = 0;
         if(UI._x > clickX + 5 || UI._x < clickX - 5 || UI._y > clickY + 5 || UI._y < clickY - 5)
         {
            lib.info.AlignInfo.savePos(UI,true);
         }
         else
         {
            ToGame_Benefit_VipClick();
         }
      };
   }
   VipViewMode();
   if(Str == "")
   {
      lib.manager.ToolTip.remove(_loc2_.btn);
   }
   else
   {
      lib.manager.ToolTip.add(_loc2_.btn,Str,1);
   }
};
var prevExp = 0;
myListener.OnGame_Benefit_VipExp = function(curNum, totalNum)
{
   if(!container_mc.vipMc)
   {
      return undefined;
   }
   var _loc1_ = curNum / totalNum;
   if(prevExp != _loc1_)
   {
      prevExp = _loc1_;
      if(!vipMode)
      {
         VipExpChange("Exp");
      }
   }
};
myListener.OnGame_Benefit_VipEffect = function(effectMode)
{
   if(!container_mc.vipMc)
   {
      return undefined;
   }
   if(effectMode == "1")
   {
      container_mc.vipMc.iconMc.gotoAndPlay(2);
   }
   else
   {
      container_mc.vipMc.iconMc.gotoAndStop(1);
   }
};
myListener.OnGame_Benefit_VipLevelHide = function(hideMode)
{
   if(!container_mc.vipMc)
   {
      return undefined;
   }
   vipMode = Boolean(Number(hideMode));
   VipViewMode();
};
var eventMc = null;
myListener.OnGame_Benefit_SetAccountPromotionText = function(id, str)
{
   if(!eventMc)
   {
      return undefined;
   }
   eventMc.txt0.text = "";
   eventMc.txt1.text = "";
   eventMc.txt2.text = str;
};
myListener.OnGame_Benefit_SetAccountPromotionEvent = function(id, bool, btn, tooltip, count, effect)
{
   if(bool == "1")
   {
      if(!eventMc)
      {
         var _loc2_ = buffList.getItem(id);
         eventMc = _loc2_.BG.retainBg;
         eventMc.gotoAndStop(2);
         eventMc.txt0.text = lib.util.UIString.getUIString("$012056");
         eventMc.txt1.text = lib.util.UIString.getUIString("$012057");
         eventMc.txt2.text = "";
         _loc2_.onRollOver2 = function()
         {
            UI.stopDrag();
            if(this.BG.retainBg.btn._currentframe == 4)
            {
               return undefined;
            }
            this.BG.retainBg.btn.gotoAndStop(2);
         };
         _loc2_.onReleaseOut2 = _loc2_.onReleaseOutSide2 = function()
         {
            UI.stopDrag();
            if(this.BG.retainBg.btn._currentframe == 4)
            {
               return undefined;
            }
            this.BG.retainBg.btn.gotoAndStop(1);
         };
         _loc2_.onPress2 = function()
         {
            var _loc3_ = lib.info.AlignInfo.yRatioToPixel(0);
            var _loc2_ = lib.info.AlignInfo.yRatioToPixel(100);
            UI.startDrag(false,-10,_loc3_ - 15,Stage.width - 30,_loc2_ - 50);
            clickX = UI._x;
            clickY = UI._y;
            if(this.BG.retainBg.btn._currentframe == 4)
            {
               return undefined;
            }
            this.BG.retainBg.btn.gotoAndStop(3);
         };
         _loc2_.onRelease2 = function()
         {
            UI.stopDrag();
            if(UI._x > clickX + 5 || UI._x < clickX - 5 || UI._y > clickY + 5 || UI._y < clickY - 5)
            {
               lib.info.AlignInfo.savePos(UI,true);
            }
            else
            {
               if(this.BG.retainBg.btn._currentframe == 4)
               {
                  return undefined;
               }
               this.BG.retainBg.btn.gotoAndStop(1);
               ToGame_Benefit_PcEventClick();
            }
         };
      }
      if(btn == "1")
      {
         eventMc.btn.gotoAndStop(1);
      }
      else
      {
         eventMc.btn.gotoAndStop(4);
      }
      if(tooltip != "" && tooltip != undefined)
      {
         lib.manager.ToolTip.add(eventMc.btn,tooltip,1);
      }
      else
      {
         lib.manager.ToolTip.remove(eventMc.btn);
      }
      if(count > 0)
      {
         eventMc.countMc._visible = true;
         eventMc.countMc.txt.htmlText = count;
         var _loc3_ = eventMc.countMc.txt.textWidth + 12;
         if(_loc3_ < 17)
         {
            _loc3_ = 17;
         }
         eventMc.countMc.txt._width = _loc3_;
         eventMc.countMc.bg._width = _loc3_;
      }
      else
      {
         eventMc.countMc._visible = false;
      }
      eventMc.btn.effect._alpha = 0;
      if(effect == "1")
      {
         eventMc.btn.effect.effectMode = true;
         newEffect(eventMc.btn.effect,100);
      }
      else
      {
         eventMc.btn.effect.effectMode = false;
         newEffect(eventMc.btn.effect,0);
      }
   }
   if(eventMc)
   {
      eventMc.gotoAndStop(1);
      eventMc = null;
   }
   return undefined;
};
myListener.OnGame_Benefit_SetAccountPromotionTime = function(timeStr, per)
{
   if(!eventMc)
   {
      return undefined;
   }
   eventMc.txt.text = timeStr;
};
var attendtMc = null;
myListener.OnGame_Benefit_SetAttendEvent = function(bool, btn, tooltip, count, effect)
{
   if(bool == "1")
   {
      if(!attendtMc)
      {
         attendtMc = container_mc.attachMovie("eventMc","eventMc",container_mc.getNextHighestDepth());
         attendtMc._y = 22;
         attendtMc.onRollOver = function()
         {
            UI.stopDrag();
            if(this.btn._currentframe == 4)
            {
               return undefined;
            }
            this.btn.gotoAndStop(2);
         };
         attendtMc.onRollOut = mc.onReleaseOutside = function()
         {
            UI.stopDrag();
            if(this.btn._currentframe == 4)
            {
               return undefined;
            }
            this.btn.gotoAndStop(1);
         };
         attendtMc.onPress = function()
         {
            var _loc3_ = lib.info.AlignInfo.yRatioToPixel(0);
            var _loc2_ = lib.info.AlignInfo.yRatioToPixel(100);
            UI.startDrag(false,-10,_loc3_ - 15,Stage.width - 30,_loc2_ - 50);
            clickX = UI._x;
            clickY = UI._y;
            if(this.btn._currentframe == 4)
            {
               return undefined;
            }
            this.btn.gotoAndStop(3);
         };
         attendtMc.onRelease = function()
         {
            UI.stopDrag();
            if(UI._x > clickX + 5 || UI._x < clickX - 5 || UI._y > clickY + 5 || UI._y < clickY - 5)
            {
               lib.info.AlignInfo.savePos(UI,true);
            }
            else
            {
               if(this.btn._currentframe == 4)
               {
                  return undefined;
               }
               this.btn.gotoAndStop(1);
               ToGame_Benefit_AttendEventClick();
            }
         };
      }
      if(btn == "1")
      {
         attendtMc.btn.gotoAndStop(1);
      }
      else
      {
         attendtMc.btn.gotoAndStop(4);
      }
      if(tooltip != "" && tooltip != undefined)
      {
         lib.manager.ToolTip.add(attendtMc.btn,tooltip,1);
      }
      else
      {
         lib.manager.ToolTip.remove(attendtMc.btn);
      }
      if(count > 0)
      {
         attendtMc.countMc._visible = true;
         attendtMc.countMc.txt.htmlText = count;
         var _loc2_ = attendtMc.countMc.txt.textWidth + 12;
         if(_loc2_ < 17)
         {
            _loc2_ = 17;
         }
         attendtMc.countMc.txt._width = _loc2_;
         attendtMc.countMc.bg._width = _loc2_;
      }
      else
      {
         attendtMc.countMc._visible = false;
      }
      attendtMc.btn.effect._alpha = 0;
      if(effect == "1")
      {
         attendtMc.btn.effect.effectMode = true;
         newEffect(attendtMc.btn.effect,100);
      }
      else
      {
         attendtMc.btn.effect.effectMode = false;
         newEffect(attendtMc.btn.effect,0);
      }
      attendtPosition();
   }
   if(attendtMc)
   {
      container_mc.eventMc.removeMovieClip();
      attendtMc = null;
   }
   return undefined;
};
var rad = 0.017453292519943295;
var radius = 150;
var obj_Angle = new Object();
var sArc = 0;
var prevPer = 30;
buffList.setAlignDirection("R");
buffList.setAddAlign(false);
buffList.xGap = buffGap;
buffList.yGap = buffGap;
buffList.columnWidth = buffWidth;
buffList.rowHeight = buffWidth;
