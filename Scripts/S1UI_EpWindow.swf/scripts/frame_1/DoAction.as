function createIcon(lineData, idx)
{
   var _loc4_ = lineData[0];
   var _loc2_ = container_mc.boxMc["icon" + _loc4_];
   if(!_loc2_)
   {
      _loc2_ = container_mc.boxMc.attachMovie("iconMc","icon" + _loc4_,idx);
      _loc2_.id = _loc4_;
      _loc2_.prev = 0;
      _loc2_.plusMc._visible = false;
      _loc2_.minusMc._visible = false;
      _loc2_.tipMc._visible = false;
      _loc2_.lockMc.hitTestDisable = true;
      lib.manager.ToolTip.add(_loc2_.tipMc,EP_TIP3,1);
      _loc2_.imgMc.clear();
      lib.display.DrawBitmapData.draw(_loc2_.imgMc,lineData[1],0,0,0,0,64,64,1);
      lib.manager.ToolTip.add(_loc2_.iconHit,_loc4_ + "\t0",6);
      _loc2_.hitMc.onRollOver = function()
      {
         if(pointFocus == this._parent || scrollLock)
         {
            return undefined;
         }
         this._parent.bg.gotoAndStop(2);
         SetTip(this._parent);
         this._parent.tipMc._visible = true;
      };
      _loc2_.hitMc.onRollOut = _loc2_.hitMc.onReleaseOutside = function()
      {
         if(pointFocus == this._parent || scrollLock)
         {
            return undefined;
         }
         this._parent.bg.gotoAndStop(1);
         this._parent.tipMc._visible = false;
         setPostion(this._parent,0,0);
      };
      _loc2_.hitMc.onRelease = function()
      {
         if(pointFocus == this._parent || scrollLock)
         {
            return undefined;
         }
         pointFocusEvent(this._parent);
         ToGame_EpWindow_ListClick(this._parent.id);
      };
   }
   _loc2_.skillMc.clear();
   if(lineData[8] > 0)
   {
      _loc2_.gotoAndStop(2);
      lib.display.DrawBitmapData.draw(_loc2_.skillMc,lineData[9],0,0,0,0,28,28,0.4375);
      lib.manager.ToolTip.add(_loc2_.skillHit,lineData[8] + "\t1",6);
      _loc2_.txt0.text = lineData[10];
      if(_loc2_.txt0.textWidth > _loc2_.txt0._width)
      {
         idx = _loc2_.txt0.getCharIndexAtPoint(_loc2_.txt0._width - 10,10);
         var _loc5_ = lineData[10].substr(0,idx);
         _loc5_ = _loc5_ + "...";
         _loc2_.txt0.text = _loc5_;
      }
      posTab = posTab + 1;
   }
   else
   {
      _loc2_.gotoAndStop(1);
      _loc2_.txt0.text = EP_STR2;
      posTab = 0;
   }
   return _loc2_;
}
function setPostion(_mc, _posX, _posY)
{
   _mc._x = _mc.posX + _posX;
   _mc._y = _mc.posY + _posY;
}
function resetPosition(idx, type)
{
   var _loc2_ = container_mc.boxMc;
   for(var _loc3_ in _loc2_)
   {
      var _loc1_ = _loc2_[_loc3_];
      if(typeof _loc1_ == "movieclip")
      {
         if(!type)
         {
         }
      }
   }
}
function pointFocusEvent(mc)
{
   pointFocus.plusMc._visible = false;
   pointFocus.minusMc._visible = false;
   setPostion(pointFocus,0,0);
   pointFocus.bg.gotoAndStop(1);
   pointFocus.tipMc._visible = false;
   if(pointFocus.btnBg._currentframe > 1)
   {
      pointFocus.effectMc.gotoAndPlay(15);
   }
   if(pointFocus.txt1.text != "")
   {
      pointFocus.newMc.gotoAndStop(3);
   }
   else
   {
      pointFocus.newMc.gotoAndStop(1);
   }
   pointFocus.lockMc.bg.gotoAndStop(1);
   pointFocus = mc;
   setPostion(pointFocus,-3,-5);
   pointFocus.lockMc.bg.gotoAndStop(2);
   var _loc1_ = 230 - pointFocus._y;
   var _loc2_ = container_mc.boxMc._y - _loc1_;
   if(_loc2_ < -40)
   {
      scrollLock = true;
      gs.TweenLite.killTweensOf(container_mc.boxMc,false);
      gs.TweenLite.to(container_mc.boxMc,0.3,{_y:_loc1_,ease:gs.easing.Strong.easeOut,onComplete:TweenEnd});
   }
   else if(_loc2_ > 438)
   {
      scrollLock = true;
      gs.TweenLite.killTweensOf(container_mc.boxMc,false);
      gs.TweenLite.to(container_mc.boxMc,0.3,{_y:_loc1_ + 398,ease:gs.easing.Strong.easeOut,onComplete:TweenEnd});
   }
}
function TweenEnd()
{
   scrollLock = false;
   scrollbarMc.scroll = (190 - container_mc.boxMc._y) / 20;
}
function setLine(targetMc, lineData, focusCheck)
{
   if(focusCheck == 1)
   {
      pointFocusEvent(targetMc);
   }
   var _loc2_ = Number(lineData[6]);
   targetMc.Mode = _loc2_;
   var _loc6_ = targetMc.lockMc._currentframe;
   var _loc4_ = Number(lineData[7]);
   targetMc.colorMc.gotoAndStop(Number(lineData[2]) + 1);
   targetMc.typeMc.gotoAndStop(Number(lineData[3]) + 1);
   targetMc.numMc.gotoAndStop(1);
   targetMc.newMc.gotoAndStop(Number(lineData[11]) + 1);
   if(_loc4_ == 0)
   {
      if(targetMc.prev > 0 && saveEffect)
      {
         targetMc.effectMc.gotoAndPlay(2);
      }
      targetMc.prev = 0;
      targetMc.txt2.htmlText = "<font color=\'" + COLOR_ARR[_loc2_] + "\'>" + lineData[5] + "</font>";
      targetMc.txt1.htmlText = "";
   }
   else
   {
      targetMc.lockMc.gotoAndStop(1);
      targetMc.txt1.htmlText = ICON_SRC + _loc4_;
      targetMc.txt2.htmlText = "<font color=\'#63d90d\'>" + lineData[5] + "</font>";
      targetMc.newMc.gotoAndStop(3);
   }
   if(targetMc.prev != _loc4_)
   {
      targetMc.prev = _loc4_;
      targetMc.txt1._y = 201;
      gs.TweenLite.killTweensOf(targetMc.txt1,false);
      gs.TweenLite.from(targetMc.txt1,0.2,{_y:204});
      if(pointFocus.btnBg._currentframe > 1)
      {
         targetMc.effectMc.gotoAndPlay(2);
      }
      getURL("FSCommand:ToGame_ToolTip_EpWindow",targetMc.id + "\t0");
   }
   if(_loc2_ < 2)
   {
      if(_loc6_ == 2 && _loc2_ == 1)
      {
         targetMc.lockMc.gotoAndStop(4);
      }
      else if(_loc6_ > 3 && _loc2_ == 0)
      {
         targetMc.lockMc.gotoAndStop(2);
      }
      else if(_loc6_ <= 3)
      {
         targetMc.lockMc.gotoAndStop(Number(_loc2_ + 2));
      }
   }
   else if(_loc2_ == 2)
   {
      targetMc.lockMc.gotoAndStop(1);
   }
   else if(_loc2_ != 3)
   {
      if(_loc2_ != 4)
      {
         if(_loc2_ == 5)
         {
            targetMc.numMc.gotoAndStop(2);
         }
      }
   }
   if(_loc2_ == 0)
   {
      targetMc.txt2._visible = false;
      targetMc.numMc._visible = false;
   }
   else
   {
      targetMc.txt2._visible = true;
      targetMc.numMc._visible = true;
   }
   targetMc.txt3.text = lineData[4];
   var _loc8_ = lineData[12];
   targetMc.tipN = _loc8_;
   if(_loc8_ == "-1")
   {
      targetMc.tipMc._alpha = 0;
   }
   else
   {
      targetMc.tipMc._alpha = 100;
   }
   var _loc7_ = lineData[13];
   var _loc5_ = lineData[14];
   var _loc9_ = lib.util.ExtString.split(_loc5_,"\n");
   _loc5_ = _loc9_[0];
   if(_loc7_ == "0" && _loc5_ == "0")
   {
      targetMc.btnBg.gotoAndStop(1);
   }
   else if(_loc5_ == "0")
   {
      targetMc.btnBg.gotoAndStop(2);
   }
   else if(_loc7_ == "0")
   {
      targetMc.btnBg.gotoAndStop(3);
   }
   else
   {
      targetMc.btnBg.gotoAndStop(4);
   }
   SetTip(targetMc);
}
function SetTip(targetMc)
{
   var _loc3_ = Number(saveEp - changeEp);
   var _loc2_ = targetMc.tipN;
   if(_loc2_ > _loc3_)
   {
      targetMc.tipMc.gotoAndStop(2);
   }
   else
   {
      targetMc.tipMc.gotoAndStop(1);
   }
   targetMc.tipMc.txt.htmlText = ICON_SRC + _loc2_;
}
function ChangeAnimation(lineMc, sNum, cNum, grade, type)
{
   if(lineMc._currentframe == 3)
   {
      return undefined;
   }
   lineMc.nextMc.mc.txt.htmlText = cNum;
   lineMc.nextMc._visible = false;
   if(sNum == cNum)
   {
      lineMc.txt2._visible = true;
      lineMc.grade = grade;
      lineMc.txt2.gotoAndStop(1);
      lineMc.txt2.txt.htmlText = cNum;
      lineMc.prev = null;
      return undefined;
   }
   lineMc.txt2.gotoAndStop(2);
   lineMc.txt2.txt.htmlText = cNum;
   gs.TweenLite.killTweensOf(lineMc.nextMc,false);
   if(type)
   {
      lineMc.nextMc._visible = true;
      if(lineMc.prev == cNum)
      {
         lineMc.nextMc.gotoAndStop(6);
         return undefined;
      }
      lineMc.prev = cNum;
      if(lineMc.nextMc._currentframe == 1)
      {
         lineMc.nextMc.gotoAndStop(6);
      }
      else
      {
         lineMc.nextMc.gotoAndPlay(1);
      }
      lineMc.txt2._visible = false;
      var preAni = lineMc.aniBox.attachMovie("prevMc","prevMc" + grade,grade);
      preAni._y = 63;
      if(lineMc.grade > grade)
      {
         preAni._x = 341;
         gs.TweenLite.to(preAni,1,{_alpha:0,_x:421,ease:gs.easing.Strong.easeOut,onComplete:function()
         {
            preAni.removeMovieClip();
         }});
      }
      else
      {
         preAni._x = 421;
         gs.TweenLite.to(preAni,1,{_alpha:0,_x:341,ease:gs.easing.Strong.easeOut,onComplete:function()
         {
            preAni.removeMovieClip();
         }});
      }
      preAni.txt.text = cNum;
   }
   else
   {
      var _loc4_ = lineMc.nextMc._currentframe;
      if(_loc4_ > 1)
      {
         lineMc.nextMc._visible = true;
         lineMc.nextMc.gotoAndPlay(7);
      }
      else
      {
         lineMc.nextMc._visible = false;
      }
      lineMc.txt2._visible = true;
      lineMc.prev = null;
   }
   lineMc.grade = grade;
}
function SetConnect(num, dataLIst)
{
   container_mc.infoMc.btmMc.gotoAndStop(num);
   gs.TweenLite.killTweensOf(container_mc.infoMc.btmMc,false);
   container_mc.totalMc.gotoAndStop(1);
   if(num > 1)
   {
      Sound_Play("2003");
      container_mc.infoMc.btmMc._alpha = 0;
      container_mc.infoMc.btmMc._x = 70;
      gs.TweenLite.to(container_mc.infoMc.btmMc,0.5,{_alpha:100,_x:20,ease:gs.easing.Strong.easeOut});
   }
   if(!dataLIst)
   {
      return undefined;
   }
   var _loc4_ = undefined;
   var _loc12_ = undefined;
   var _loc2_ = undefined;
   var _loc5_ = undefined;
   var _loc13_ = undefined;
   var _loc6_ = dataLIst.length;
   var _loc3_ = 0;
   while(_loc3_ < _loc6_)
   {
      _loc4_ = lib.util.ExtString.split(dataLIst[_loc3_],"\t");
      _loc2_ = container_mc.infoMc.btmMc["btn" + _loc3_];
      _loc5_ = container_mc.infoMc.btmMc["txt" + _loc3_];
      _loc2_.txt = _loc5_;
      if(_loc4_[0] == 0)
      {
         _loc2_._visible = false;
         container_mc.totalMc.gotoAndPlay(2);
      }
      else
      {
         _loc2_._visible = true;
         _loc2_.id = _loc4_[1];
         _loc2_.onRollOver = function()
         {
            this.txt.textColor = "0xCCCCCC";
            this.gotoAndStop(2);
         };
         _loc2_.onRollOut = _loc2_.onReleaseOutside = function()
         {
            this.txt.textColor = "0xB80000";
            this.gotoAndStop(1);
         };
         _loc2_.onRelease = function()
         {
            this.txt.textColor = "0xB80000";
            this.gotoAndStop(1);
            ToGame_EpWindow_ListClick(this.id);
         };
      }
      _loc5_.htmlText = _loc4_[2];
      _loc2_._width = _loc5_.textWidth + 32;
      _loc3_ = _loc3_ + 1;
   }
}
function SetButton(right_btn, left_btn)
{
   left_btn.onRollOver = function()
   {
      if(this._currentframe == 4)
      {
         return undefined;
      }
      this.gotoAndStop(2);
   };
   left_btn.onRelease = left_btn.onReleaseOutside = left_btn.onRollOut = function()
   {
      if(this._currentframe == 4)
      {
         return undefined;
      }
      this.gotoAndStop(1);
      myListener.StopClick();
   };
   left_btn.onPress = function()
   {
      if(this._currentframe == 4)
      {
         return undefined;
      }
      this.gotoAndStop(3);
      if(_global.shift)
      {
         ToGame_EpWindow_Min();
      }
      else
      {
         myListener.StartClick(-1);
      }
   };
   right_btn.onRollOver = function()
   {
      if(this._currentframe == 4)
      {
         return undefined;
      }
      this.gotoAndStop(2);
   };
   right_btn.onRelease = right_btn.onReleaseOutside = right_btn.onRollOut = function()
   {
      if(this._currentframe == 4)
      {
         return undefined;
      }
      this.gotoAndStop(1);
      myListener.StopClick();
   };
   right_btn.onPress = function()
   {
      if(this._currentframe == 4)
      {
         return undefined;
      }
      this.gotoAndStop(3);
      if(_global.shift)
      {
         ToGame_EpWindow_Max();
      }
      else
      {
         myListener.StartClick(1);
      }
   };
}
function ToGame_EpWindow_Init()
{
   fscommand("ToGame_EpWindow_Init");
}
function ToGame_EpWindow_Enter()
{
   Sound_Play("2091");
   saveEffect = true;
   fscommand("ToGame_EpWindow_Enter");
}
function ToGame_EpWindow_Cancel()
{
   Sound_Play("2006");
   saveEffect = false;
   fscommand("ToGame_EpWindow_Cancel");
}
function ToGame_EpWindow_CloseUI()
{
   fscommand("ToGame_EpWindow_CloseUI");
}
function ToGame_EpWindow_ListClick(id)
{
   Sound_Play("1022");
   getURL("FSCommand:ToGame_EpWindow_ListClick",id);
}
function ToGame_EpWindow_PlusClick()
{
   var _loc2_ = pointFocus.id;
   var _loc1_ = 1;
   if(pointFocus.txt2.text >= LimitMax)
   {
      delete container_mc.enterMc.onEnterFrame;
      pointFocus.plusMc._xscale = 100;
      pointFocus.plusMc._yscale = 100;
      pointFocus.plusMc.gotoAndStop(4);
      return undefined;
   }
   Sound_Play("1008");
   getURL("FSCommand:ToGame_EpWindow_PlusClick",_loc2_ + "\t" + _loc1_);
}
function ToGame_EpWindow_MinusClick()
{
   var _loc2_ = pointFocus.id;
   var _loc1_ = 1;
   if(pointFocus.txt2.text <= LimitMin || pointFocus.txt2.text == "")
   {
      pointFocus.minusMc._xscale = 100;
      pointFocus.minusMc._yscale = 100;
      pointFocus.minusMc.gotoAndStop(4);
      delete container_mc.enterMc.onEnterFrame;
      return undefined;
   }
   Sound_Play("1008");
   getURL("FSCommand:ToGame_EpWindow_MinusClick",_loc2_ + "\t" + _loc1_);
}
function ToGame_EpWindow_SetFilter(idx)
{
   getURL("FSCommand:ToGame_EpWindow_SetFilter",idx);
}
function ToGame_EpWindow_Max()
{
   Sound_Play("1023");
   fscommand("ToGame_EpWindow_Max");
}
function ToGame_EpWindow_Min()
{
   Sound_Play("1179");
   fscommand("ToGame_EpWindow_Min");
}
function ToGame_EpWindow_CloseInfo()
{
   fscommand("ToGame_EpWindow_CloseInfo");
}
function Sound_Play(num)
{
   lib.manager.UISound.play(num);
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
function ToGame_EpWindow_SelectTab(index)
{
   focusTab = index;
   getURL("FSCommand:ToGame_EpWindow_SelectTab",index);
}
var UI = this;
UI._visible = false;
var bWidgetOpen = false;
var UIname = "EpWindow";
container_mc.UIDrager.setData(UIName,UI);
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
var BETA_STR = lib.util.UIString.getUIString("$670002");
var EP_STR0 = lib.util.UIString.getUIString("$670013");
var EP_STR2 = lib.util.UIString.getUIString("$670015");
var EP_TIP0 = lib.util.UIString.getUIString("$670006");
var EP_TIP1 = lib.util.UIString.getUIString("$670007");
var EP_TIP3 = lib.util.UIString.getUIString("$670009");
var INFO_CUR = lib.util.UIString.getUIString("$670016");
var INFO_EDT = lib.util.UIString.getUIString("$670017");
var INFO_NEX = lib.util.UIString.getUIString("$670018");
var INFO_NON = lib.util.UIString.getUIString("$670019");
var INFO_GRD = lib.util.UIString.getUIString("$670020");
var INFO_MAX = lib.util.UIString.getUIString("$670037");
var FONT_COLOR_NONE = "<font color=\'#ffffff\'>";
var FONT_COLOR_EP = "<font color=\'#15BBA9\'>";
var FONT_COLOR_CHANGE = "<font color=\'#63d90d\'>";
var FONT_COLOR_RED = "<font color=\'#b80000\'>";
var ICON_SRC = "<img src=\'epIcon0\' vspace=\'-2\'/>";
var ICON_SRC1 = "<img src=\'epIcon1\' vspace=\'-7\'/>";
var GAGE_WID = 602;
var LIST_SX = 59;
var LIST_SY = 40;
var LIST_WID = 157;
var LIST_HIG = 234;
var saveEp = 0;
var changeEp = 0;
var totalEp = 0;
var LimitMin = 0;
var LimitMax = 99;
var saveEffect = false;
var x_btn = new lib.util.TxtBtn(container_mc.xmc);
x_btn.setRelease(ToGame_EpWindow_CloseUI);
var enter_btn = new lib.util.TxtBtn(container_mc.btn0.btn,container_mc.btn0.txt);
enter_btn.setRelease(ToGame_EpWindow_Enter);
var cancel_btn = new lib.util.TxtBtn(container_mc.btn1.btn,container_mc.btn1.txt);
cancel_btn.setRelease(ToGame_EpWindow_Cancel);
var close_btn = new lib.util.TxtBtn(container_mc.btn2.btn,container_mc.btn2.txt);
close_btn.setRelease(ToGame_EpWindow_CloseUI);
var btnArr = [enter_btn,cancel_btn,close_btn];
var listMcY = container_mc.boxMc._y;
var scrollbarMc = container_mc.scrollbar;
var scrollMoveEvent = false;
scrollbarMc.addListener(container_mc.boxMc);
container_mc.boxMc.onScroll = function()
{
   if(scrollLock)
   {
      return undefined;
   }
   container_mc.boxMc._y = listMcY - arguments[0];
   if(arguments[0] !== 0 && !scrollMoveEvent)
   {
      scrollMoveEvent = true;
      fscommand("ToGame_EpWindow_ScrollMove");
   }
};
scrollbarMc.setWheel(container_mc.boxMc);
scrollbarMc.wheelDelta = 1;
scrollbarMc.pageSize = 0;
scrollbarMc.displaySize = 672;
scrollbarMc.defaultBarSizeRatio = 0.3333333333333333;
scrollbarMc.rowHeight = LIST_HIG;
container_mc.checkMc.checkBtn.onChanged = function(changed)
{
   ToGame_EpWindow_SetFilter(Number(changed));
   if(!scrollMoveEvent)
   {
      scrollMoveEvent = true;
      fscommand("ToGame_EpWindow_ScrollMove");
   }
};
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
};
myListener.OnGame_EpWindow_SetTitle = function(str)
{
   container_mc.txtTitle.htmlText = str + BETA_STR;
};
myListener.OnGame_EpWindow_CheckPoint = function(num, type)
{
   changeEp = num;
   if(Number(num) > 0)
   {
      if(container_mc.btnEffect0._currentframe == 1)
      {
         container_mc.btnEffect0.gotoAndPlay(2);
      }
      enter_btn.setEnabled(true);
      cancel_btn.setEnabled(true);
      container_mc.epPoint.mc.txt.htmlText = FONT_COLOR_CHANGE + ICON_SRC1 + Number(saveEp - changeEp) + "</font>";
      container_mc.epPoint.gotoAndPlay(1);
   }
   else
   {
      container_mc.btnEffect0.gotoAndStop(1);
      enter_btn.setEnabled(false);
      cancel_btn.setEnabled(false);
      container_mc.epPoint.mc.txt.htmlText = FONT_COLOR_EP + ICON_SRC1 + saveEp + "</font>";
   }
};
myListener.OnGame_EpWindow_SetFilter = function(checkMode)
{
   container_mc.checkMc.checkBtn.checked = checkMode;
};
myListener.OnGame_EpWindow_SetInfo = function(exp, nextEp, ep, lvNum, gradeNum)
{
   var _loc4_ = lib.util.ExtString.split(exp,"\t");
   var _loc1_ = lib.util.ExtString.split(ep,"\t");
   var _loc3_ = _loc4_[0] / _loc4_[1];
   var _loc2_ = int(_loc3_ * 1000) / 10;
   var _loc5_ = Number(_loc1_[2]);
   var _loc7_ = lib.util.UIString.getUIString("$670014","count",String(ICON_SRC + FONT_COLOR_EP + nextEp + "</font>"));
   if(_loc5_ < 500)
   {
      container_mc.expTxt._visible = true;
      container_mc.expTxt.htmlText = _loc7_;
      container_mc.persentTxt.text = _loc2_ + "%";
      container_mc.gageMc._width = _loc3_ * GAGE_WID;
      gs.TweenLite.to(container_mc.gageMc,0,{tint:null});
   }
   else
   {
      container_mc.expTxt._visible = false;
      container_mc.persentTxt.text = "MAX";
      container_mc.gageMc._width = 1 * GAGE_WID;
      gs.TweenLite.to(container_mc.gageMc,0,{tint:11722715});
   }
   container_mc.totalMc.mc.txt.htmlText = EP_STR0 + " " + ICON_SRC + FONT_COLOR_EP + _loc5_ + "</font>";
   useEp = _loc1_[0];
   saveEp = Number(_loc1_[1]);
   container_mc.gradeMc.gotoAndStop(Number(gradeNum) + 1);
   container_mc.epPoint.mc.txt.htmlText = FONT_COLOR_EP + ICON_SRC1 + saveEp + "</font>";
   var _loc6_ = lib.util.UIString.getUIString("$670008","count",_loc2_);
   lib.manager.ToolTip.add(container_mc.nextHit,_loc6_,1);
};
myListener.OnGame_EpWindow_SetButton = function(index, enable, effect)
{
   var _loc1_ = container_mc["btn" + index];
   if(enable == "-1")
   {
      _loc1_._visible = false;
   }
   else
   {
      _loc1_._visible = true;
   }
   var _loc4_ = btnArr[index];
   _loc4_.setEnabled(Boolean(Number(enable)));
   if(!effect)
   {
      return undefined;
   }
   var _loc2_ = container_mc["btnEffect" + index];
   if(effect == "1")
   {
      _loc2_.gotoAndPlay(2);
   }
   else if(effect == "0")
   {
      _loc2_.gotoAndStop(1);
   }
};
myListener.OnGame_EpWindow_AddList = function(_type, _data, idxNum)
{
   var _loc1_ = lib.util.ExtString.split(_data,"\t");
   var _loc2_ = createIcon(_loc1_,idxNum);
   setLine(_loc2_,_loc1_,0,0);
   resetPosition(idxNum,1);
};
myListener.OnGame_EpWindow_RemoveList = function(_type, _id)
{
   var _loc1_ = container_mc.boxMc["icon" + _id];
   if(!_loc1_)
   {
      return undefined;
   }
   var _loc2_ = _loc1_.idx;
   _loc1_.removeMovieClip();
   resetPosition(_loc2_,0);
};
myListener.OnGame_EpWindow_UpDateList = function(_type, _data, focusCheck)
{
   var _loc2_ = lib.util.ExtString.split(_data,"\t");
   var _loc1_ = container_mc.boxMc["icon" + _loc2_[0]];
   if(!_loc1_)
   {
      return undefined;
   }
   setLine(_loc1_,_loc2_,focusCheck);
};
myListener.OnGame_EpWindow_ButtonEffect = function(_id, _type, _mode)
{
   var _loc2_ = container_mc.boxMc["icon" + _id];
   if(!_loc2_)
   {
      return undefined;
   }
   var _loc1_ = undefined;
   if(_type == 0)
   {
      _loc1_ = _loc2_.minusMc.effectMc;
   }
   else
   {
      _loc1_ = _loc2_.plusMc.effectMc;
   }
   if(_mode == 0)
   {
      _loc1_.gotoAndStop(1);
   }
   else
   {
      _loc1_.gotoAndPlay(2);
   }
};
myListener.OnGame_EpWindow_ListClear = function()
{
   listReset(container_mc.boxMc);
};
myListener.OnGame_EpWindow_SetList = function(_type, _data)
{
   var _loc5_ = lib.util.ExtString.split(_data,"\n");
   var _loc6_ = _loc5_.length;
   var _loc9_ = 0;
   container_mc.boxMc.bg._height = 10;
   if(_data == undefined || _data == "")
   {
      container_mc.defaultStr._visible = true;
      scrollbarMc.pageSize = 0;
      return undefined;
   }
   container_mc.defaultStr._visible = false;
   var _loc2_ = 0;
   var _loc10_ = 0;
   var _loc3_ = 0;
   while(_loc3_ < _loc6_)
   {
      var _loc4_ = lib.util.ExtString.split(_loc5_[_loc3_],"\t");
      var _loc1_ = createIcon(_loc4_,_loc2_);
      _loc1_._x = _loc1_.posX = LIST_SX + _loc2_ % 6 * LIST_WID;
      _loc1_._y = _loc1_.posY = LIST_SY + int(_loc2_ / 6) * LIST_HIG;
      _loc1_.idx = _loc2_;
      _loc2_ = _loc2_ + 1;
      setLine(_loc1_,_loc4_,0,0);
      _loc3_ = _loc3_ + 1;
   }
   var _loc7_ = container_mc.boxMc._height + 20;
   if(_loc7_ < 672)
   {
      _loc7_ = 672;
   }
   container_mc.boxMc.bg._height = scrollbarMc.pageSize = _loc7_;
};
var scrollLock = false;
var pointFocus = null;
var COLOR_ARR = ["#8f8f8f","#ffffff","#ffffff","#ffffff","#ffffff","#ffffff"];
var prevInfo = "";
var infoMode = 0;
var saveConnect = 0;
var connectData = [];
myListener.OnGame_EpWindow_SetFocusInfo = function(_data, _connect)
{
   var _loc1_ = container_mc.infoMc;
   _loc1_._visible = true;
   var _loc3_ = pointFocus.lockMc._currentframe;
   var _loc7_ = pointFocus.typeMc._currentframe;
   var _loc8_ = pointFocus.colorMc._currentframe;
   var _loc4_ = pointFocus.numMc._currentframe;
   _loc1_.lockMc.gotoAndStop(_loc3_);
   _loc1_.typeMc.gotoAndStop(_loc7_);
   _loc1_.colorMc.gotoAndStop(_loc8_);
   SetConnect(1);
   connectData = [];
   if(_loc3_ == 2)
   {
      pointFocus.bg.gotoAndStop(2);
      pointFocus.plusMc._visible = false;
      pointFocus.minusMc._visible = false;
      pointFocus.tipMc._visible = false;
   }
   else if(_loc4_ == 2)
   {
      pointFocus.bg.gotoAndStop(3);
      if(pointFocus.prev > 0)
      {
         pointFocus.plusMc._visible = true;
         pointFocus.minusMc._visible = true;
         pointFocus.tipMc._visible = true;
      }
      else
      {
         pointFocus.plusMc._visible = false;
         pointFocus.minusMc._visible = false;
         pointFocus.tipMc._visible = false;
      }
   }
   else
   {
      pointFocus.bg.gotoAndStop(4);
      pointFocus.plusMc._visible = true;
      pointFocus.minusMc._visible = true;
      pointFocus.tipMc._visible = true;
   }
   var _loc2_ = lib.util.ExtString.split(_data,"\t");
   infoMode = _loc2_[5];
   _loc1_.txt0.htmlText = _loc2_[2];
   _loc1_.txt1.htmlText = _loc2_[3];
   if(prevInfo != _loc2_[0])
   {
      prevInfo = _loc2_[0];
      listReset(_loc1_.boxMc);
      _loc1_.imgMc.clear();
      _loc1_.skillMc.clear();
      _loc1_.cGrade.mc.txt.text = "";
      _loc1_.nGrade.text = "";
      lib.display.DrawBitmapData.draw(_loc1_.imgMc,_loc2_[1],0,0,0,0,64,64,1);
      lib.manager.ToolTip.add(_loc1_.iconHit,_loc2_[0] + "\t0",6);
      if(_loc2_[6] > 0)
      {
         _loc1_.gotoAndStop(2);
         lib.display.DrawBitmapData.draw(_loc1_.skillMc,_loc2_[7],0,0,0,0,48,32,1);
         _loc1_.skillTxt.text = _loc2_[8];
         _loc1_.skillTxt._x = 69;
         lib.manager.ToolTip.add(_loc1_.skillTxt,_loc2_[6] + "\t1",6);
      }
      else
      {
         _loc1_.gotoAndStop(1);
         _loc1_.skillTxt.text = EP_STR2;
         _loc1_.skillTxt._x = 12;
      }
      if(_loc1_.skillTxt.textWidth > _loc1_.skillTxt._width)
      {
         var _loc6_ = _loc1_.skillTxt.getCharIndexAtPoint(430,10);
         _loc1_.skillTxt.text = _loc1_.skillTxt.text.substr(0,_loc6_) + "...";
      }
   }
   if(infoMode == 1)
   {
      _loc1_.maxTxt._visible = false;
      _loc1_.enableMc.play();
      gs.TweenLite.killTweensOf(_loc1_.enableMc,false);
      gs.TweenLite.to(_loc1_.enableMc,1,{_alpha:100});
   }
   else if(infoMode == 2)
   {
      if(pointFocus.prev == 0)
      {
         _loc1_.maxTxt._visible = true;
      }
      else
      {
         _loc1_.maxTxt._visible = false;
      }
      pointFocus.bg.gotoAndStop(3);
      _loc1_.enableMc.stop();
      _loc1_.enableMc._alpha = 100;
      gs.TweenLite.killTweensOf(_loc1_.enableMc,false);
      gs.TweenLite.to(_loc1_.enableMc,1,{_alpha:0});
   }
   else
   {
      pointFocus.bg.gotoAndStop(3);
      _loc1_.maxTxt._visible = false;
      _loc1_.enableMc.stop();
      _loc1_.enableMc._alpha = 100;
      gs.TweenLite.killTweensOf(_loc1_.enableMc,false);
      gs.TweenLite.to(_loc1_.enableMc,1,{_alpha:0});
   }
   connectData = lib.util.ExtString.split(_connect,"\n");
   var _loc5_ = connectData.length;
   saveConnect = Number(_loc5_) + 1;
   SetConnect(saveConnect,connectData);
};
myListener.OnGame_EpWindow_SetFocusUpDate = function(_current, _change, _data, _max)
{
   var _loc3_ = container_mc.infoMc;
   var _loc9_ = "";
   if(_current == 0)
   {
      _loc9_ = INFO_NON + INFO_CUR;
   }
   else if(_current == _max)
   {
      _loc9_ = _current + " " + INFO_GRD + "(" + INFO_MAX + " " + INFO_GRD + ")";
   }
   else
   {
      _loc9_ = _current + " " + INFO_GRD + INFO_CUR;
   }
   if(_loc3_.prevFocus == pointFocus)
   {
      if(_loc3_.cGrade.mc.txt.text != _loc9_)
      {
         _loc3_.cGrade.gotoAndPlay(2);
      }
   }
   _loc3_.cGrade.mc.txt.text = _loc9_;
   var _loc8_ = lib.util.ExtString.split(_data,"\n");
   var _loc7_ = _loc8_.length;
   var _loc6_ = "";
   if(_change == _max)
   {
      _loc6_ = INFO_GRD + "(" + INFO_MAX + " " + INFO_GRD + ")";
   }
   else if(0 < pointFocus.prev)
   {
      _loc6_ = INFO_GRD + INFO_EDT;
   }
   else
   {
      _loc6_ = INFO_GRD + INFO_NEX;
   }
   var _loc5_ = 0;
   while(_loc5_ < _loc7_)
   {
      var _loc2_ = lib.util.ExtString.split(_loc8_[_loc5_],"\t");
      var _loc1_ = _loc3_.boxMc["line" + _loc5_];
      if(!_loc1_)
      {
         _loc1_ = _loc3_.boxMc.attachMovie("lineMc","line" + _loc5_,_loc5_);
      }
      if(infoMode == 0)
      {
         if(pointFocus.prev > 0)
         {
            _loc3_.nGrade.htmlText = "<font color=\'#63d90d\'>" + _change + " " + _loc6_ + "</font>";
            _loc1_.gotoAndStop(2);
            ChangeAnimation(_loc1_,_loc2_[1],_loc2_[2],Number(_change),true);
         }
         else
         {
            _loc3_.nGrade.htmlText = "<font color=\'#C2EDFF\'>" + _change + " " + _loc6_ + "</font>";
            _loc1_.gotoAndStop(1);
            ChangeAnimation(_loc1_,_loc2_[1],_loc2_[2],Number(_change),false);
         }
         SetConnect(10);
      }
      else if(infoMode == 1)
      {
         SetConnect(1);
         if(pointFocus.prev > 0)
         {
            _loc1_.gotoAndStop(2);
            _loc3_.nGrade.htmlText = "<font color=\'#63d90d\'>" + _change + " " + _loc6_ + "</font>";
            ChangeAnimation(_loc1_,_loc2_[1],_loc2_[2],Number(_change),true);
         }
         else
         {
            _loc1_.gotoAndStop(1);
            _loc3_.nGrade.htmlText = "<font color=\'#C2EDFF\'>" + _change + " " + _loc6_ + "</font>";
            ChangeAnimation(_loc1_,_loc2_[1],_loc2_[2],Number(_change),false);
         }
      }
      else if(pointFocus.prev > 0)
      {
         _loc1_.gotoAndStop(2);
         _loc3_.nGrade.htmlText = "<font color=\'#63d90d\'>" + _change + " " + _loc6_ + "</font>";
         ChangeAnimation(_loc1_,_loc2_[1],_loc2_[2],Number(_change),true);
         SetConnect(11);
      }
      else
      {
         _loc1_.gotoAndStop(3);
         _loc3_.nGrade.htmlText = "";
         SetConnect(12);
      }
      _loc1_.enableMc.gotoAndStop(Number(infoMode) + 1);
      _loc1_._y = 88 * _loc5_;
      bgH = bgH + 88;
      _loc1_.txt0.htmlText = _loc2_[0];
      if(_loc3_.prevFocus == pointFocus && _loc1_.txt1.mc.txt.text != _loc2_[1])
      {
         _loc1_.txt1.gotoAndPlay(2);
      }
      _loc1_.txt1.mc.txt.htmlText = _loc2_[1];
      _loc1_.txt2.htmlText = _loc2_[3];
      _loc5_ = _loc5_ + 1;
   }
   if(saveConnect > 1)
   {
      SetConnect(saveConnect,connectData);
   }
   var _loc10_ = (_loc7_ - 1) * 88;
   if(_loc10_ < 0)
   {
      _loc10_ = 0;
   }
   _loc3_.bgMc._height = 256 + _loc10_;
   _loc3_.btmMc._y = 535 + _loc10_;
   _loc3_.maxTxt._y = 460 + _loc10_ / 2;
   _loc3_.prevFocus = pointFocus;
};
myListener.OnGame_EpWindow_SetFocusClear = function()
{
   pointFocus.hitMc.gotoAndStop(1);
   pointFocus.plusMc._visible = false;
   pointFocus.minusMc._visible = false;
   pointFocus.tipMc._visible = false;
   pointFocus.lockMc.bg.gotoAndStop(1);
   pointFocus.bg.gotoAndStop(1);
   setPostion(pointFocus,0,0);
   if(pointFocus.txt1.text != "")
   {
      pointFocus.newMc.gotoAndStop(3);
   }
   else
   {
      pointFocus.newMc.gotoAndStop(1);
   }
   if(pointFocus.btnBg._currentframe > 1)
   {
      pointFocus.effectMc.gotoAndPlay(15);
   }
   pointFocus = null;
   container_mc.infoMc._visible = false;
   container_mc.infoMc.prevFocus = null;
};
myListener.OnGame_EpWindow_SetLimit = function(min, max)
{
   LimitMin = min;
   LimitMax = max;
};
var rightClick = false;
var leftClick = false;
myListener.OnGame_EpWindow_SetFocusButton = function(index, enable, tooltip)
{
   SetButton(pointFocus.plusMc,pointFocus.minusMc);
   var _loc1_ = Boolean(Number(enable));
   if(index == 1)
   {
      rightClick = _loc1_;
      if(_loc1_)
      {
         pointFocus.plusMc.gotoAndStop(1);
      }
      else
      {
         pointFocus.plusMc.gotoAndStop(4);
      }
      if(tooltip)
      {
         lib.manager.ToolTip.add(pointFocus.plusMc,tooltip,1);
      }
      else
      {
         lib.manager.ToolTip.remove(pointFocus.plusMc);
      }
   }
   else
   {
      leftClick = _loc1_;
      if(_loc1_)
      {
         pointFocus.minusMc.gotoAndStop(1);
      }
      else
      {
         pointFocus.minusMc.gotoAndStop(4);
      }
      if(tooltip)
      {
         lib.manager.ToolTip.add(pointFocus.minusMc,tooltip,1);
      }
      else
      {
         lib.manager.ToolTip.remove(pointFocus.minusMc);
      }
   }
};
myListener.OnGame_MouseDown = function(button, target)
{
   if(target._name == "bg")
   {
      Sound_Play("1023");
      myListener.OnGame_EpWindow_SetFocusClear();
      ToGame_EpWindow_CloseInfo();
   }
};
var CLICK_SPEED = 11;
myListener.StartClick = function(type)
{
   delete container_mc.enterMc.onEnterFrame;
   myListener.clickEvent(type);
   var CLICK_COUNT = 0;
   CLICK_SPEED = 11;
   container_mc.enterMc.onEnterFrame = function()
   {
      if(CLICK_COUNT + 1 == CLICK_SPEED)
      {
         if(type == "1")
         {
            pointFocus.plusMc._xscale = 100;
            pointFocus.plusMc._yscale = 100;
         }
         else
         {
            pointFocus.minusMc._xscale = 100;
            pointFocus.minusMc._yscale = 100;
         }
      }
      if(CLICK_COUNT > CLICK_SPEED)
      {
         CLICK_SPEED = 2;
         CLICK_COUNT = -1;
         myListener.clickEvent(type);
      }
      CLICK_COUNT++;
   };
};
myListener.StopClick = function()
{
   delete container_mc.enterMc.onEnterFrame;
   pointFocus.plusMc._xscale = 100;
   pointFocus.plusMc._yscale = 100;
   pointFocus.minusMc._xscale = 100;
   pointFocus.minusMc._yscale = 100;
};
myListener.OnGame_MouseUp = function(button, target)
{
   myListener.StopClick();
};
myListener.clickEvent = function(type)
{
   if(type == "1")
   {
      pointFocus.plusMc._xscale = 95;
      pointFocus.plusMc._yscale = 95;
      ToGame_EpWindow_PlusClick();
   }
   else
   {
      pointFocus.minusMc._xscale = 95;
      pointFocus.minusMc._yscale = 95;
      ToGame_EpWindow_MinusClick();
   }
};
var tabBtn = container_mc.tabBtn.tab;
tabBtn.setRelease(ToGame_EpWindow_SelectTab);
tabBtn.setTab(0,1);
myListener.OnGame_EpWindow_TabEvent = function(idx, type)
{
   var _loc1_ = container_mc["tag" + idx];
   if(type == 0)
   {
      if(_loc1_)
      {
         _loc1_.removeMovieClip();
      }
   }
   else
   {
      if(!_loc1_)
      {
         _loc1_ = container_mc.attachMovie("tagMc","tag" + idx,idx);
      }
      _loc1_._x = 90 + idx * 140;
      _loc1_._y = 146;
   }
};
myListener.OnGame_EpWindow_SetTab = function(idx)
{
   tabBtn.setTab(idx,1);
   focusTab = idx;
};
var focusTab = 0;
container_mc.infoMc._visible = false;
container_mc.infoMc.txt1.verticalAlign = "center";
lib.manager.ToolTip.add(container_mc.epPoint.mc.txt,EP_TIP0,1);
lib.manager.ToolTip.add(container_mc.totalMc,EP_TIP1,1);
enter_btn.setEnabled(false);
cancel_btn.setEnabled(false);
container_mc.checkMc.checkBtn.checked = false;
container_mc.btnEffect0.hitTestDisable = true;
container_mc.btnEffect1.hitTestDisable = true;
container_mc.infoMc.skillMask.hitTestDisable = true;
container_mc.btnEffect0.gotoAndStop(1);
container_mc.btnEffect1.gotoAndStop(1);
ToGame_EpWindow_Init();
