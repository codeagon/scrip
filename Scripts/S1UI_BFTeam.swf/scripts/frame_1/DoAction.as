function listBuild()
{
   lib.Debuger.trace("listBuild");
   teamNumber = 0;
   clearSlotBg();
   listClear();
   var _loc5_ = 0;
   var _loc4_ = 0;
   while(_loc4_ < 20)
   {
      var _loc2_ = container_mc["BFSlot" + _loc4_];
      _loc2_.slotBg._visible = false;
      _loc4_ = _loc4_ + 1;
   }
   lib.Debuger.trace("teamListData : " + teamListData);
   var _loc6_ = teamListData.length;
   _loc4_ = 0;
   while(_loc4_ < _loc6_)
   {
      _loc2_ = container_mc["BFSlot" + _loc4_];
      var _loc3_ = teamListData[_loc4_];
      if(_loc3_[3] != undefined)
      {
         _loc2_.masterMc.gotoAndStop(Number(_loc3_[0]) + 1);
         if(Number(_loc3_[0]))
         {
            _loc2_.nameFd._width = 125;
         }
         else
         {
            _loc2_.nameFd._width = 150;
         }
         if(_loc3_[1] == "")
         {
            _loc2_.levelFd.text = "";
         }
         else
         {
            _loc2_.levelFd.setText(lib.util.UIString.getUIString("$273020") + " " + _loc3_[1]);
            _loc5_ = _loc5_ + 1;
         }
         _loc2_.classFd.setText(_loc3_[2]);
         _loc2_.nameFd.setText(_loc3_[3]);
         if(_loc3_[4] == undefined)
         {
            _loc2_.classMc._visible = false;
         }
         else
         {
            _loc2_.classMc._visible = true;
            _loc2_.classMc.gotoAndStop(Number(_loc3_[4]) + 1);
         }
         _loc2_.onRollOver = function()
         {
            if(dropTargetSlot != this && dragTargetSlot != this)
            {
               setSlotState(this,2);
            }
         };
         _loc2_.onRollOut = function()
         {
            if(dropTargetSlot != this && dragTargetSlot != this)
            {
               setSlotState(this,1);
            }
         };
         _loc2_.onReleaseOutside = function()
         {
            if(dropTargetSlot != this && dragTargetSlot != this)
            {
               setSlotState(this,1);
            }
         };
      }
      _loc4_ = _loc4_ + 1;
   }
   teamNumber = _loc5_;
   teamCount = userLimitCount;
   if(iamMaster && !inBFZone)
   {
      Mouse.addListener(mouseListner);
   }
   lib.Debuger.trace("listnum : " + _loc5_);
   lib.Debuger.trace("userLimitCountuserLimitCount : " + userLimitCount);
   if(userLimitCount == 5)
   {
      if(_loc5_ < 6)
      {
         container_mc.slotbg1._visible = false;
         clearSlotBg();
         setEnableSlotBg(0);
         container_mc.slottxt0.textColor = lib.info.TextColor.GENERAL_EXPLAIN;
         container_mc.slottxt1.textColor = lib.info.TextColor.GENERAL_DISABLE;
         container_mc.slottxt2.textColor = lib.info.TextColor.GENERAL_DISABLE;
         container_mc.slottxt3.textColor = lib.info.TextColor.GENERAL_DISABLE;
         container_mc.checkBtn0.checked = true;
         container_mc.checkBtn1.checked = false;
         container_mc.checkBtn2.checked = false;
         container_mc.checkBtn3.checked = false;
         lib.manager.ToolTip.add(container_mc.checkBtn0,"$273021",1);
         lib.manager.ToolTip.remove(container_mc.checkBtn1);
         lib.manager.ToolTip.remove(container_mc.checkBtn2);
         lib.manager.ToolTip.remove(container_mc.checkBtn3);
      }
      else if(_loc5_ < 11)
      {
         container_mc.slotbg1._visible = false;
         container_mc.slotbg2._visible = false;
         clearSlotBg();
         setEnableSlotBg(0);
         setEnableSlotBg(1);
         container_mc.slottxt0.textColor = lib.info.TextColor.GENERAL_EXPLAIN;
         container_mc.slottxt1.textColor = lib.info.TextColor.GENERAL_EXPLAIN;
         container_mc.slottxt2.textColor = lib.info.TextColor.GENERAL_DISABLE;
         container_mc.slottxt3.textColor = lib.info.TextColor.GENERAL_DISABLE;
         container_mc.checkBtn0.checked = true;
         container_mc.checkBtn1.checked = true;
         container_mc.checkBtn2.checked = false;
         container_mc.checkBtn3.checked = false;
         lib.manager.ToolTip.add(container_mc.checkBtn0,"$273021",1);
         lib.manager.ToolTip.add(container_mc.checkBtn1,"$273021",1);
         lib.manager.ToolTip.remove(container_mc.checkBtn2);
         lib.manager.ToolTip.remove(container_mc.checkBtn3);
      }
      else if(_loc5_ < 16)
      {
         container_mc.slotbg1._visible = false;
         container_mc.slotbg2._visible = false;
         container_mc.slotbg3._visible = false;
         clearSlotBg();
         setEnableSlotBg(0);
         setEnableSlotBg(1);
         setEnableSlotBg(2);
         container_mc.slottxt0.textColor = lib.info.TextColor.GENERAL_EXPLAIN;
         container_mc.slottxt1.textColor = lib.info.TextColor.GENERAL_EXPLAIN;
         container_mc.slottxt2.textColor = lib.info.TextColor.GENERAL_EXPLAIN;
         container_mc.slottxt3.textColor = lib.info.TextColor.GENERAL_DISABLE;
         container_mc.checkBtn0.checked = true;
         container_mc.checkBtn1.checked = true;
         container_mc.checkBtn2.checked = true;
         container_mc.checkBtn3.checked = false;
         lib.manager.ToolTip.add(container_mc.checkBtn0,"$273021",1);
         lib.manager.ToolTip.add(container_mc.checkBtn1,"$273021",1);
         lib.manager.ToolTip.add(container_mc.checkBtn2,"$273021",1);
         lib.manager.ToolTip.remove(container_mc.checkBtn3);
      }
      else if(_loc5_ < 21)
      {
         container_mc.slotbg1._visible = false;
         container_mc.slotbg2._visible = false;
         container_mc.slotbg3._visible = false;
         container_mc.slotbg4._visible = false;
         clearSlotBg();
         setEnableSlotBg(0);
         setEnableSlotBg(1);
         setEnableSlotBg(2);
         setEnableSlotBg(3);
         container_mc.slottxt0.textColor = lib.info.TextColor.GENERAL_EXPLAIN;
         container_mc.slottxt1.textColor = lib.info.TextColor.GENERAL_EXPLAIN;
         container_mc.slottxt2.textColor = lib.info.TextColor.GENERAL_EXPLAIN;
         container_mc.slottxt3.textColor = lib.info.TextColor.GENERAL_EXPLAIN;
         container_mc.checkBtn0.checked = true;
         container_mc.checkBtn1.checked = true;
         container_mc.checkBtn2.checked = true;
         container_mc.checkBtn3.checked = true;
         lib.manager.ToolTip.add(container_mc.checkBtn0,"$273021",1);
         lib.manager.ToolTip.add(container_mc.checkBtn1,"$273021",1);
         lib.manager.ToolTip.add(container_mc.checkBtn2,"$273021",1);
         lib.manager.ToolTip.add(container_mc.checkBtn3,"$273021",1);
      }
   }
   else if(userLimitCount == 10)
   {
      if(_loc5_ < 11)
      {
         container_mc.slotbg1._visible = false;
         container_mc.slotbg2._visible = false;
         clearSlotBg();
         setEnableSlotBg(0);
         setEnableSlotBg(1);
         container_mc.slottxt0.textColor = lib.info.TextColor.GENERAL_EXPLAIN;
         container_mc.slottxt1.textColor = lib.info.TextColor.GENERAL_EXPLAIN;
         container_mc.slottxt2.textColor = lib.info.TextColor.GENERAL_DISABLE;
         container_mc.slottxt3.textColor = lib.info.TextColor.GENERAL_DISABLE;
         container_mc.checkBtn0.checked = true;
         container_mc.checkBtn1.checked = true;
         container_mc.checkBtn2.checked = false;
         container_mc.checkBtn3.checked = false;
         lib.manager.ToolTip.add(container_mc.checkBtn0,"$273021",1);
         lib.manager.ToolTip.add(container_mc.checkBtn1,"$273021",1);
         lib.manager.ToolTip.remove(container_mc.checkBtn2);
         lib.manager.ToolTip.remove(container_mc.checkBtn3);
      }
      else if(_loc5_ < 21)
      {
         container_mc.slotbg1._visible = false;
         container_mc.slotbg2._visible = false;
         container_mc.slotbg3._visible = false;
         container_mc.slotbg4._visible = false;
         clearSlotBg();
         setEnableSlotBg(0);
         setEnableSlotBg(1);
         setEnableSlotBg(2);
         setEnableSlotBg(3);
         container_mc.slottxt0.textColor = lib.info.TextColor.GENERAL_EXPLAIN;
         container_mc.slottxt1.textColor = lib.info.TextColor.GENERAL_EXPLAIN;
         container_mc.slottxt2.textColor = lib.info.TextColor.GENERAL_EXPLAIN;
         container_mc.slottxt3.textColor = lib.info.TextColor.GENERAL_EXPLAIN;
         container_mc.checkBtn0.checked = true;
         container_mc.checkBtn1.checked = true;
         container_mc.checkBtn2.checked = true;
         container_mc.checkBtn3.checked = true;
         lib.manager.ToolTip.add(container_mc.checkBtn0,"$273021",1);
         lib.manager.ToolTip.add(container_mc.checkBtn1,"$273021",1);
         lib.manager.ToolTip.add(container_mc.checkBtn2,"$273021",1);
         lib.manager.ToolTip.add(container_mc.checkBtn3,"$273021",1);
      }
   }
}
function listClear()
{
   gs.TweenLite.killTweensOf(copyMc0,false);
   gs.TweenLite.killTweensOf(copyMc1,false);
   var _loc2_ = 0;
   while(_loc2_ < LISTMAX)
   {
      var _loc1_ = container_mc["BFSlot" + _loc2_];
      setSlotState(_loc1_,Number(userLimitCount >= _loc2_ + 1));
      _loc1_.hit.isBFTeamSlot = userLimitCount >= _loc2_ + 1;
      _loc1_.index = _loc2_;
      _loc1_._visible = true;
      _loc1_.masterMc.gotoAndStop(1);
      _loc1_.levelFd.text = "";
      _loc1_.classFd.setText("");
      _loc1_.nameFd.setText("");
      _loc1_.classMc._visible = false;
      _loc2_ = _loc2_ + 1;
   }
   dragTargetSlot = undefined;
   dropTargetSlot = undefined;
   isDrag = false;
   isMoving = false;
   dragSlotMc.removeMovieClip();
   copyMc0.removeMovieClip();
   copyMc1.removeMovieClip();
   overClip = undefined;
   Mouse.removeListener(mouseListner);
}
function setSlotState(slotMc, _state)
{
   if(_state == 0)
   {
      slotMc.enabled = false;
      slotMc.slotBg._visible = true;
      slotMc.slotBg.gotoAndStop(4);
   }
   else if(_state == 1)
   {
      slotMc.enabled = true;
      slotMc.slotBg._visible = false;
   }
   else if(_state == 2)
   {
      slotMc.slotBg._visible = true;
      slotMc.slotBg.gotoAndStop(2);
   }
   else if(_state == 3)
   {
      slotMc.slotBg._visible = true;
      slotMc.slotBg.gotoAndStop(3);
   }
}
function cloneSlot(targetMc, cloneMc)
{
   cloneMc.masterMc.gotoAndStop(targetMc.masterMc._currentframe);
   cloneMc.levelFd.text = targetMc.levelFd.text;
   cloneMc.classFd.text = targetMc.classFd.text;
   cloneMc.nameFd.text = targetMc.nameFd.text;
   cloneMc.classMc._visible = targetMc.classMc._visible;
   cloneMc.classMc.gotoAndStop(targetMc.classMc._currentframe);
}
function changePosition(index0, index1)
{
   Mouse.removeListener(mouseListner);
   gs.TweenLite.killTweensOf(copyMc0,false);
   gs.TweenLite.killTweensOf(copyMc1,false);
   var _loc2_ = container_mc["BFSlot" + index0];
   var _loc1_ = container_mc["BFSlot" + index1];
   copyMc0 = _loc2_.duplicateMovieClip("copyMc0",container_mc.getNextHighestDepth());
   copyMc1 = _loc1_.duplicateMovieClip("copyMc1",container_mc.getNextHighestDepth());
   _loc2_._visible = false;
   _loc1_._visible = false;
   cloneSlot(_loc2_,copyMc0);
   cloneSlot(_loc1_,copyMc1);
   var _loc6_ = copyMc0._x;
   var _loc4_ = copyMc1._y > copyMc0._y?copyMc0._y - copyMc0._height / 2:copyMc0._y + copyMc0._height / 2;
   var _loc5_ = copyMc1._x;
   var _loc3_ = copyMc0._y >= copyMc1._y?copyMc1._y - copyMc1._height / 2:copyMc1._y + copyMc1._height / 2;
   var _loc10_ = copyMc1._x;
   var _loc8_ = copyMc1._y;
   var _loc9_ = copyMc0._x;
   var _loc7_ = copyMc0._y;
   gs.TweenLite.to(copyMc0,PFSPEED,{_x:_loc6_,_y:_loc4_,ease:gs.easing.Back.easeOut,onComplete:onChTween,onCompleteParams:[copyMc0,_loc10_,_loc8_]});
   gs.TweenLite.to(copyMc1,PFSPEED,{_x:_loc5_,_y:_loc3_,ease:gs.easing.Back.easeOut,onComplete:onChTween,onCompleteParams:[copyMc1,_loc9_,_loc7_]});
}
function moveAni(selectMc, targetMc, flag)
{
   var _loc3_ = targetMc._x;
   var _loc2_ = targetMc._y;
   isMoving = true;
   gs.TweenLite.to(selectMc,SPEED,{_x:_loc3_,_y:_loc2_,ease:gs.easing.Strong.easeOut,onComplete:onFinishTween,onCompleteParams:[selectMc,targetMc,flag]});
}
function onFinishTween(selectMc, targetMc, flag)
{
   selectMc.removeMovieClip();
   listBuild();
}
function onChTween(selectMc, x, y)
{
   gs.TweenLite.to(selectMc,SPEED,{_x:x,_y:y,ease:gs.easing.Strong.easeOut,onComplete:onEndChTween,onCompleteParams:[selectMc]});
}
function onEndChTween(selectMc)
{
   selectMc.removeMovieClip();
   listBuild();
}
function ToGame_BFTeam_Init()
{
   fscommand("ToGame_BFTeam_Init");
}
function ToGame_BFTeam_CloseUI()
{
   Mouse.removeListener(mouseListner);
   fscommand("ToGame_BFTeam_CloseUI");
}
function ToGame_BFTeam_Invite()
{
   fscommand("ToGame_BFTeam_Invite");
}
function ToGame_BFTeam_Leave()
{
   fscommand("ToGame_BFTeam_Leave");
}
function ToGame_BFTeam_Confirm()
{
   var _loc1_ = Number(!Boolean(battleState));
   if(_loc1_ == 1)
   {
      getURL("FSCommand:ToGame_BFTeam_Confirm",_loc1_);
   }
   else
   {
      ToGame_BFTeam_Confirm_Cancel();
   }
}
function ToGame_BFTeam_Confirm_Cancel()
{
   fscommand("ToGame_BFTeam_Confirm_Cancel");
}
function ToGame_BFTeam_SwapElement(indexA, indexB)
{
   getURL("FSCommand:ToGame_BFTeam_SwapElement",indexA + "\t" + indexB);
}
function ToGame_BFTeam_DelegateMaster(index)
{
   getURL("FSCommand:ToGame_BFTeam_DelegateMaster",index);
}
function ToGame_BFTeam_PartyCheck(index, bool)
{
   lib.Debuger.trace("ToGame_BFTeam_PartyCheck : " + index + " " + bool);
   getURL("FSCommand:ToGame_BFTeam_PartyCheck",index + "\t" + bool);
}
function popUP(mc)
{
   lib.Debuger.trace("popUP");
   clearPop();
   var _loc4_ = container_mc;
   popMc = _loc4_.attachMovie("pop","popMc",_loc4_.getNextHighestDepth());
   popMc._x = _loc4_._xmouse;
   popMc._y = _loc4_._ymouse;
   popMc.obj = mc;
   var _loc2_ = 0;
   while(_loc2_ < 1)
   {
      var _loc3_ = new TextFormat();
      if(popMc["line" + _loc2_].effect_mc.txt.maxscroll > 1)
      {
         _loc3_.size = 14;
         popMc["line" + _loc2_].effect_mc.txt.setTextFormat(_loc3_);
      }
      popMc["line" + _loc2_].effect_mc.txt.verticalAlign = "center";
      popMc["line" + _loc2_].effect_mc.txt.textAutoSize = "shrink";
      popMc["line" + _loc2_].type = _loc2_;
      popMc["line" + _loc2_].effect_mc.hit.onRollOver = function()
      {
         delete popMc.onEnterFrame;
         this._parent._parent.effect_mc.gotoAndStop("over");
         this._parent.txt.textColor = lib.info.TextColor.SUBMENU_OVER;
         this._parent.txt.shadowColor = 16777215;
      };
      popMc["line" + _loc2_].effect_mc.hit.onRollOut = popMc["line" + _loc2_].effect_mc.hit.onReleaseOutside = function()
      {
         callFadeOut();
         this._parent._parent.effect_mc.gotoAndStop("out");
         this._parent.txt.textColor = lib.info.TextColor.SUBMENU_NORMAL;
         this._parent.txt.shadowColor = 0;
      };
      popMc["line" + _loc2_].effect_mc.hit.onPress = function()
      {
         delete popMc.onEnterFrame;
         this._parent._parent.effect_mc.gotoAndStop("press");
         this._parent.txt.textColor = lib.info.TextColor.SUBMENU_PRESS;
         this._parent.txt.shadowColor = 0;
      };
      popMc["line" + _loc2_].effect_mc.hit.onRelease = function()
      {
         ToGame_BFTeam_DelegateMaster(popMc.obj.index);
         clearPop();
         this._parent.txt.textColor = lib.info.TextColor.SUBMENU_OVER;
         this._parent.txt.shadowColor = 0;
      };
      _loc2_ = _loc2_ + 1;
   }
   callFadeOut();
   popMc.popBgMc.bg._height = 60;
}
function callFadeOut()
{
   popMc.count = 0;
   delete this.onEnterFrame;
   popMc.onEnterFrame = function()
   {
      this.count = this.count + 1;
      if(this.count > POPTIMER)
      {
         clearPop();
         delete popMc.onEnterFrame;
      }
   };
}
function clearPop()
{
   delete popMc.onEnterFrame;
   var _loc1_ = popMc.obj;
   popMc.removeMovieClip();
   popMc = undefined;
   _loc1_.hit_mc.onRollOut();
}
function ListScrollBar(bool)
{
   lib.Debuger.trace("ListScrollBar");
   var _loc2_ = undefined;
   var _loc9_ = 0;
   var _loc6_ = 1;
   var _loc3_ = undefined;
   if(bool == true)
   {
      _loc3_ = UI.container_mc.MapMaskMc._height;
   }
   else
   {
      _loc3_ = 1000;
   }
   _loc2_ = UI.container_mc.moviescroll1;
   var _loc4_ = {};
   _loc2_.addListener(_loc4_);
   _loc4_.onScroll = function()
   {
      UI.container_mc.MapMc._y = 472 - arguments[0];
   };
   _loc2_.setWheel(UI.container_mc.MapMc);
   if(listHeight == undefined)
   {
      _loc2_.__set__pageSize(UI.container_mc.MapMc._height);
   }
   else
   {
      _loc2_.__set__pageSize(listHeight);
   }
   _loc2_.setWheel(UI.container_mc.MapMc);
   _loc2_.wheelDelta = 1;
   _loc2_.__set__displaySize(_loc3_);
   _loc2_.__set__rowHeight(100);
   _loc2_.__set__scroll(0);
   var _loc5_ = 0;
   var _loc8_ = 1;
   var _loc7_ = 187;
}
function MapData(mapImg, __name, userLimit, winPoint, desc, leveldata, admission)
{
   lib.util.DrawBitmap.draw(container_mc.mapImgMc,mapImg);
   container_mc.mapImgMc._xscale = 98.3;
   container_mc.mapImgMc._yscale = 97.6;
   container_mc.MapMc.nameFd.setText(__name);
   container_mc.MapMc.memberLimitFd.setText(userLimit);
   container_mc.MapMc.scoreFd.setText(winPoint);
   container_mc.MapMc.descFd.htmlText = desc;
   container_mc.MapMc.descFd._height = container_mc.MapMc.descFd.textHeight + 3;
   container_mc.MapMc.levelFd.setText(leveldata);
   if(admission == 2)
   {
      container_mc.MapMc.pointFd._visible = true;
      container_mc.MapMc.IconMc._visible = true;
      container_mc.MapMc.IconMc._x = container_mc.MapMc.pointFd.textWidth + 3;
      container_mc.MapMc.descFd._y = 133;
   }
   else if(admission != 2)
   {
      container_mc.MapMc.pointFd._visible = false;
      container_mc.MapMc.IconMc._visible = false;
      container_mc.MapMc.descFd._y = container_mc.MapMc.pointFd._y;
   }
   var delaynum = 0;
   UI.onEnterFrame = null;
   UI.onEnterFrame = function()
   {
      delaynum++;
      if(delaynum > 1)
      {
         UI.onEnterFrame = null;
         if(container_mc.MapMc.descFd.maxscroll > 1)
         {
            container_mc.MapMc.descFd._height = container_mc.MapMc.descFd._height + (container_mc.MapMc.descFd.maxscroll - 1) * 20 + 0;
         }
         ListScrollBar(true);
      }
   };
   container_mc.MapMc.scrollHitArea._height = container_mc.MapMc.descFd._y + container_mc.MapMc.descFd._height + 5;
}
function clearSlotBg()
{
   container_mc.slotBg0.gotoAndStop(1);
   container_mc.slotBg1.gotoAndStop(1);
   container_mc.slotBg2.gotoAndStop(1);
   container_mc.slotBg3.gotoAndStop(1);
}
function setEnableSlotBg(index)
{
   container_mc["slotBg" + index].gotoAndStop(2);
}
var UI = this;
UI._visible = false;
var bWidgetOpen = false;
var UIname = "BFTeam";
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
container_mc.text_name.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
container_mc.explain_0.textColor = lib.info.TextColor.GENERAL_EXPLAIN_DETAIL;
container_mc.explain_1.textColor = lib.info.TextColor.GENERAL_EXPLAIN_DETAIL;
container_mc.explain_2.textColor = lib.info.TextColor.GENERAL_EXPLAIN_DETAIL;
container_mc.explain_3.textColor = lib.info.TextColor.GENERAL_EXPLAIN_DETAIL;
container_mc.MapMc.nameFd.textColor = lib.info.TextColor.GENERAL_CONTENTS;
container_mc.MapMc.memberLimitFd.textColor = lib.info.TextColor.GENERAL_CONTENTS;
container_mc.MapMc.scoreFd.textColor = lib.info.TextColor.GENERAL_EMPHASIS;
container_mc.MapMc.descFd.textColor = lib.info.TextColor.GENERAL_CONTENTS;
container_mc.MapMc.levelFd.textColor = lib.info.TextColor.GENERAL_CONTENTS;
container_mc.guideMc.mc.guideFd.textColor = lib.info.TextColor.GENERAL_NOTICE;
container_mc.guideMc.mc.guideFd.verticalAlign = "center";
container_mc.guideMc.mc.guideFd.htmlText = "<img src=\'icon_notice\' vspace=\'-1\'> " + lib.util.UIString.getUIString("$273005");
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
container_mc.MapMc.pointFd.setText(container_mc.MapMc.pointFd.text);
container_mc.MapMc.IconMc._x = container_mc.MapMc.pointFd._x + container_mc.MapMc.pointFd.textWidth + 2;
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
   container_mc.ToolTip._visible = bShow;
};
var LISTMAX = 20;
var CLASSNAME_STR = ["$013020","$013021","$013022","$013023","$013024","$013025","$013026","$013027"];
var CONFIRM_STR = "$273002";
var CANCEL_STR = "$275026";
var GUIDE_STR = "$273005";
var SPEED = 0.3;
var PFSPEED = 0.2;
var CENTERPOSITION = 222;
var RIGHTPOSITION = container_mc.leave_mc._x;
var POPTIMER = 24;
var teamListData;
var userLimitCount = 0;
var iamMaster = false;
var dragSlotMc;
var dragTargetSlot;
var dropTargetSlot;
var mouseListner = {};
var isDrag = false;
var isMoving = false;
var overClip;
var copyMc0;
var copyMc1;
var inBFZone = false;
var battleState;
var teamNumber = 0;
var teamCount = 0;
var partycheck0 = true;
var partycheck1 = true;
var partycheck2 = true;
var partycheck3 = true;
var confirm_btn_Boolean = false;
var BFNAME_STR = lib.util.UIString.getUIString("$275005");
var BFMEMBERS_STR = lib.util.UIString.getUIString("$275006");
var SCORE_STR = lib.util.UIString.getUIString("$275007");
var Names = lib.util.UIString.getUIString("$273001");
var LEVEL_STR = lib.util.UIString.getUIString("$275031");
myListener.OnGame_BFTeam_SetData = function(teamList, userLimit, isMaster, indexA, indexB, mapImg, __name, userLimit2, winPoint, desc, leveldata, admission)
{
   admission = Number(admission);
   container_mc.text_name.text = Names + " [" + __name + "]";
   teamList = lib.util.ExtString.split(teamList,"\n");
   var _loc6_ = teamList.length;
   teamListData = [];
   var _loc2_ = 0;
   while(_loc2_ < _loc6_)
   {
      teamListData[_loc2_] = [];
      var _loc3_ = lib.util.ExtString.split(teamList[_loc2_],"\t");
      var _loc4_ = _loc3_.length;
      var _loc1_ = 0;
      while(_loc1_ < _loc4_)
      {
         teamListData[_loc2_].push(_loc3_[_loc1_]);
         _loc1_ = _loc1_ + 1;
      }
      _loc2_ = _loc2_ + 1;
   }
   userLimitCount = Number(userLimit);
   iamMaster = Boolean(Number(isMaster));
   if(iamMaster)
   {
      confirm_btn.setEnabled(true);
   }
   if(indexA != undefined && indexA !== "" && indexB != undefined && indexB !== "")
   {
      changePosition(indexA,indexB);
   }
   else
   {
      listBuild();
   }
   container_mc.MapMc._visible = true;
   ListScrollBar(true);
   MapData(mapImg,__name,userLimit2,winPoint,desc,leveldata,admission);
};
myListener.OnGame_BFTeam_PartyCheck = function(checkList)
{
   lib.Debuger.trace("OnGame_BFTeam_PartyCheck");
   lib.Debuger.trace("checkList : " + checkList);
   var _loc1_ = new Array();
   _loc1_ = checkList.split("\t");
   lib.Debuger.trace("check_arr : " + _loc1_);
   lib.Debuger.trace("check_arr.length : " + _loc1_.length);
   if(_loc1_[0] == "1")
   {
      container_mc.checkBtn0.checked = true;
   }
   else
   {
      container_mc.checkBtn0.checked = false;
   }
   if(_loc1_[1] == "1")
   {
      container_mc.checkBtn1.checked = true;
   }
   else
   {
      container_mc.checkBtn1.checked = false;
   }
   if(_loc1_[2] == "1")
   {
      container_mc.checkBtn2.checked = true;
   }
   else
   {
      container_mc.checkBtn2.checked = false;
   }
   if(_loc1_[3] == "1")
   {
      container_mc.checkBtn3.checked = true;
   }
   else
   {
      container_mc.checkBtn3.checked = false;
   }
};
myListener.OnGame_BFTeam_PartyCheck2 = function(checkList)
{
   lib.Debuger.trace("OnGame_BFTeam_PartyCheck2");
   lib.Debuger.trace("checkList : " + checkList);
   container_mc.checkBtn0.onChanged = function(changed)
   {
      if(changed == true)
      {
         ToGame_BFTeam_PartyCheck(0,1);
      }
      else if(changed == false)
      {
         ToGame_BFTeam_PartyCheck(0,0);
      }
      container_mc.checkBtn0.checked = changed;
   };
   container_mc.checkBtn1.onChanged = function(changed)
   {
      if(changed == true)
      {
         ToGame_BFTeam_PartyCheck(1,1);
      }
      else if(changed == false)
      {
         ToGame_BFTeam_PartyCheck(1,0);
      }
      container_mc.checkBtn1.checked = changed;
   };
   container_mc.checkBtn2.onChanged = function(changed)
   {
      if(changed == true)
      {
         ToGame_BFTeam_PartyCheck(2,1);
      }
      else if(changed == false)
      {
         ToGame_BFTeam_PartyCheck(2,0);
      }
      container_mc.checkBtn2.checked = changed;
   };
   container_mc.checkBtn3.onChanged = function(changed)
   {
      if(changed == true)
      {
         ToGame_BFTeam_PartyCheck(3,1);
      }
      else if(changed == false)
      {
         ToGame_BFTeam_PartyCheck(3,0);
      }
      container_mc.checkBtn3.checked = changed;
   };
   if(teamCount == 5)
   {
      if(teamNumber < 6)
      {
         container_mc.checkBtn0.checked = true;
         container_mc.checkBtn1.checked = false;
         container_mc.checkBtn2.checked = false;
         container_mc.checkBtn3.checked = false;
         lib.manager.ToolTip.add(container_mc.checkBtn0,"$273021",1);
         lib.manager.ToolTip.remove(container_mc.checkBtn1);
         lib.manager.ToolTip.remove(container_mc.checkBtn2);
         lib.manager.ToolTip.remove(container_mc.checkBtn3);
         container_mc.checkblind0._visible = false;
         container_mc.checkblind1._visible = true;
         container_mc.checkblind2._visible = true;
         container_mc.checkblind3._visible = true;
      }
      else if(teamNumber < 11)
      {
         container_mc.checkBtn0.checked = true;
         container_mc.checkBtn1.checked = true;
         container_mc.checkBtn2.checked = false;
         container_mc.checkBtn3.checked = false;
         lib.manager.ToolTip.add(container_mc.checkBtn0,"$273021",1);
         lib.manager.ToolTip.add(container_mc.checkBtn1,"$273021",1);
         lib.manager.ToolTip.remove(container_mc.checkBtn2);
         lib.manager.ToolTip.remove(container_mc.checkBtn3);
         container_mc.checkblind0._visible = false;
         container_mc.checkblind1._visible = false;
         container_mc.checkblind2._visible = true;
         container_mc.checkblind3._visible = true;
      }
      else if(teamNumber < 16)
      {
         container_mc.checkBtn0.checked = true;
         container_mc.checkBtn1.checked = true;
         container_mc.checkBtn2.checked = true;
         container_mc.checkBtn3.checked = false;
         lib.manager.ToolTip.add(container_mc.checkBtn0,"$273021",1);
         lib.manager.ToolTip.add(container_mc.checkBtn1,"$273021",1);
         lib.manager.ToolTip.add(container_mc.checkBtn2,"$273021",1);
         lib.manager.ToolTip.remove(container_mc.checkBtn3);
         container_mc.checkblind0._visible = false;
         container_mc.checkblind1._visible = false;
         container_mc.checkblind2._visible = false;
         container_mc.checkblind3._visible = true;
      }
      else if(teamNumber < 21)
      {
         container_mc.checkBtn0.checked = true;
         container_mc.checkBtn1.checked = true;
         container_mc.checkBtn2.checked = true;
         container_mc.checkBtn3.checked = true;
         lib.manager.ToolTip.add(container_mc.checkBtn0,"$273021",1);
         lib.manager.ToolTip.add(container_mc.checkBtn1,"$273021",1);
         lib.manager.ToolTip.add(container_mc.checkBtn2,"$273021",1);
         lib.manager.ToolTip.add(container_mc.checkBtn3,"$273021",1);
         container_mc.checkblind0._visible = false;
         container_mc.checkblind1._visible = false;
         container_mc.checkblind2._visible = false;
         container_mc.checkblind3._visible = false;
      }
   }
   else if(teamCount == 10)
   {
      if(teamNumber < 11)
      {
         container_mc.checkBtn0.checked = true;
         container_mc.checkBtn1.checked = true;
         container_mc.checkBtn2.checked = false;
         container_mc.checkBtn3.checked = false;
         lib.manager.ToolTip.add(container_mc.checkBtn0,"$273021",1);
         lib.manager.ToolTip.add(container_mc.checkBtn1,"$273021",1);
         lib.manager.ToolTip.remove(container_mc.checkBtn2);
         lib.manager.ToolTip.remove(container_mc.checkBtn3);
         container_mc.checkblind0._visible = false;
         container_mc.checkblind1._visible = false;
         container_mc.checkblind2._visible = true;
         container_mc.checkblind3._visible = true;
      }
      else if(teamNumber < 21)
      {
         container_mc.checkBtn0.checked = true;
         container_mc.checkBtn1.checked = true;
         container_mc.checkBtn2.checked = true;
         container_mc.checkBtn3.checked = true;
         lib.manager.ToolTip.add(container_mc.checkBtn0,"$273021",1);
         lib.manager.ToolTip.add(container_mc.checkBtn1,"$273021",1);
         lib.manager.ToolTip.add(container_mc.checkBtn2,"$273021",1);
         lib.manager.ToolTip.add(container_mc.checkBtn3,"$273021",1);
         container_mc.checkblind0._visible = false;
         container_mc.checkblind1._visible = false;
         container_mc.checkblind2._visible = false;
         container_mc.checkblind3._visible = false;
      }
   }
};
myListener.OnGame_BFTeam_SetState = function(_battleState)
{
   battleState = Number(_battleState);
   if(battleState == 1)
   {
      if(iamMaster)
      {
         Mouse.addListener(mouseListner);
      }
      confirm_btn.txt.setText(CANCEL_STR);
      invite_btn.setEnabled(false);
      leave_btn.setEnabled(false);
      container_mc.guideMc._visible = true;
      inBFZone = false;
      container_mc.MapBlind._visible = true;
      ListScrollBar(false);
   }
   else if(battleState == 2)
   {
      inBFZone = true;
      confirm_btn.setEnabled(false);
      invite_btn.setEnabled(false);
      leave_btn.setEnabled(true);
      container_mc.guideMc._visible = false;
      container_mc.MapBlind._visible = false;
      ListScrollBar(true);
   }
   else
   {
      confirm_btn.txt.setText(CONFIRM_STR);
      confirm_btn.setEnabled(iamMaster);
      invite_btn.setEnabled(iamMaster);
      leave_btn.setEnabled(true);
      container_mc.guideMc._visible = false;
      inBFZone = false;
      container_mc.MapBlind._visible = false;
      ListScrollBar(true);
   }
};
var confirm_btn = container_mc.confirmBtn.txtBtn;
var invite_btn = container_mc.txtBtn0.txtBtn;
var leave_btn = container_mc.txtBtn1.txtBtn;
var x_btn = new lib.util.TxtBtn(container_mc.x_mc);
close_btn.setRelease(ToGame_BFTeam_CloseUI);
x_btn.setRelease(ToGame_BFTeam_CloseUI);
confirm_btn.setRelease(ToGame_BFTeam_Confirm);
invite_btn.setRelease(ToGame_BFTeam_Invite);
leave_btn.setRelease(ToGame_BFTeam_Leave);
mouseListner.onMouseDown = function()
{
   lib.Debuger.trace("iamMaster : " + iamMaster);
   var _loc2_ = Mouse.getTopMostEntity(_level0._xmouse,_level0._ymouse);
   if((_loc2_.isBFTeamSlot == true || _loc2_._parent.hit.isBFTeamSlot == true) && iamMaster)
   {
      isDrag = true;
      var _loc1_ = _loc2_._parent;
      if(_loc1_.levelFd.text == "")
      {
         isDrag = false;
      }
      else
      {
         setSlotState(_loc1_,3);
         dragTargetSlot = _loc1_;
         dragSlotMc.removeMovieClip();
         dragSlotMc = _loc1_.duplicateMovieClip("dragSlotMc",container_mc.getNextHighestDepth());
         cloneSlot(dragTargetSlot,dragSlotMc);
         dragSlotMc._alpha = 60;
         dragSlotMc.startDrag();
         dragSlotMc.effect_mc._visible = false;
      }
   }
};
mouseListner.onMouseUp = function()
{
   if(isDrag)
   {
      Mouse.removeListener(mouseListner);
      dragSlotMc.stopDrag();
      dragSlotMc.effect_mc._visible = true;
      var target = eval(dragSlotMc._droptarget);
      isDrag = false;
      if((target.isBFTeamSlot == true || target._parent.hit.isBFTeamSlot == true) && dragTargetSlot != target._parent)
      {
         setSlotState(target._parent,3);
         dropTargetSlot = target._parent;
         dragSlotMc.removeMovieClip();
         ToGame_BFTeam_SwapElement(dragTargetSlot.index,dropTargetSlot.index);
      }
      else
      {
         moveAni(dragSlotMc,dragTargetSlot,2);
      }
   }
};
mouseListner.onMouseMove = function()
{
   if(isDrag)
   {
      var _loc1_ = Mouse.getTopMostEntity(_level0._xmouse,_level0._ymouse);
      if((_loc1_.isBFTeamSlot == true || _loc1_._parent.hit.isBFTeamSlot == true) && dragTargetSlot != _loc1_._parent)
      {
         setSlotState(overClip,1);
         setSlotState(_loc1_._parent,2);
         overClip = _loc1_._parent;
      }
      else
      {
         setSlotState(overClip,1);
         overClip = undefined;
      }
   }
};
myListener.OnGame_MouseDown = function(button, target)
{
   if(button == 2 && !isDrag)
   {
      if((target.isBFTeamSlot == true || target._parent.hit.isBFTeamSlot == true) && iamMaster)
      {
         lib.Debuger.trace("popup action");
         lib.Debuger.trace("target._parent : " + target._parent);
         if(target._parent.masterMc._currentframe != 2)
         {
            popUP(target._parent);
         }
      }
   }
};
container_mc.guideMc._visible = false;
container_mc.MapBlind._visible = false;
confirm_btn.setEnabled(false);
invite_btn.setEnabled(false);
leave_btn.setEnabled(false);
clearSlotBg();
ToGame_BFTeam_Init();
