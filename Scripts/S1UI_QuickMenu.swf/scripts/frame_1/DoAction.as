function gr(bx, by, tx, ty)
{
   var _loc1_ = gr2(bx,by,tx,ty);
   _loc1_ = _loc1_ / lib.info.PreMath.radian;
   return Math.ceil(_loc1_);
}
function gr2(bx, by, tx, ty)
{
   if(bx < tx && by == ty)
   {
      return 1.5707963267948966;
   }
   if(bx == tx && by < ty)
   {
      return 3.141592653589793;
   }
   if(bx > tx && by == ty)
   {
      return 4.71238898038469;
   }
   if(bx == tx && by > ty)
   {
      return 0;
   }
   if(bx == tx && by == ty)
   {
      return -1;
   }
   var _loc5_ = undefined;
   _loc5_ = Math.atan((bx - tx) / (by - ty));
   if(bx > tx && by > ty)
   {
      return 6.283185307179586 - _loc5_;
   }
   if(bx < tx && by > ty)
   {
      return - _loc5_;
   }
   return 3.141592653589793 - _loc5_;
}
function showMarker(bTrue)
{
   if(mode == 1)
   {
      container_mc.mark1._visible = bTrue;
      container_mc.mark2._visible = bTrue;
      container_mc.mark3._visible = bTrue;
      container_mc.mark4._visible = bTrue;
      container_mc.removeTargetInfo._visible = bTrue;
      container_mc.chat1._visible = false;
      container_mc.chat2._visible = false;
      container_mc.chat3._visible = false;
      container_mc.chat4._visible = false;
   }
   else
   {
      container_mc.chat1._visible = bTrue;
      container_mc.chat2._visible = bTrue;
      container_mc.chat3._visible = bTrue;
      container_mc.chat4._visible = bTrue;
      container_mc.mark1._visible = false;
      container_mc.mark2._visible = false;
      container_mc.mark3._visible = false;
      container_mc.mark4._visible = false;
      container_mc.removeTargetInfo._visible = false;
   }
   if(bTrue)
   {
      btn_array[0].sA = -1;
      btn_array[0].eA = 45;
      btn_array[1].sA = 46;
      btn_array[1].eA = 130;
      btn_array[2].sA = 211;
      btn_array[2].eA = 314;
      btn_array[3].sA = 131;
      btn_array[3].eA = 210;
      btn_array[5].sA = 315;
      btn_array[5].eA = 361;
   }
   else
   {
      btn_array[0].sA = null;
      btn_array[0].eA = null;
      btn_array[1].sA = null;
      btn_array[1].eA = null;
      btn_array[2].sA = null;
      btn_array[2].eA = null;
      btn_array[3].sA = null;
      btn_array[3].eA = null;
      btn_array[3].sA = null;
      btn_array[3].eA = null;
   }
}
function ToGame_QuickMenu_DisplayMyPos()
{
   fscommand("ToGame_QuickMenu_DisplayMyPos");
   trace("ToGame_QuickMenu_DisplayMyPos()");
   _root.debug3.text = "[퀵메뉴]내정보표시\r" + _root.debug3.text;
}
function ToGame_QuickMenu_SelectMarker(num)
{
   getURL("FSCommand:ToGame_QuickMenu_SelectMarker",num);
   trace("ToGame_QuickMenu_SelectMarker: " + num);
   _root.debug3.text = "[퀵메뉴]마커선택" + num + "\r" + _root.debug3.text;
}
function ToGame_QuickMenu_SelectMacro(num)
{
   getURL("FSCommand:ToGame_QuickMenu_SelectMacro",num);
   trace("ToGame_QuickMenu_SelectMacro: " + num);
}
function ToGame_QuickMenu_SelectChat(num)
{
   getURL("FSCommand:ToGame_QuickMenu_SelectChat",num);
   trace("ToGame_QuickMenu_SelectChat: " + num);
}
function ToGame_QuickMenu_SelectInteractionMenu(num)
{
   getURL("FSCommand:ToGame_QuickMenu_SelectInteractionMenu",num);
   trace("ToGame_QuickMenu_SelectInteractionMenu: " + num);
}
function ToGame_QuickMenu_ResetMarker()
{
   fscommand("ToGame_QuickMenu_ResetMarker");
   trace("ToGame_QuickMenu_ResetMarker");
}
function ToGame_QuickMenu_SelectCenter()
{
   fscommand("ToGame_QuickMenu_SelectCenter");
   trace("ToGame_QuickMenu_SelectCenter");
}
var UI = this;
UI._visible = false;
var UIname = "QuickMenu";
var bWindowOpen = true;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
container_mc.interac1._visible = false;
container_mc.interac2._visible = false;
container_mc.mark1._visible = false;
container_mc.mark2._visible = false;
container_mc.mark3._visible = false;
container_mc.mark4._visible = false;
container_mc.chat1._visible = false;
container_mc.chat2._visible = false;
container_mc.chat3._visible = false;
container_mc.chat4._visible = false;
container_mc.shape1._visible = false;
container_mc.shape2._visible = false;
container_mc.removeTargetInfo._visible = false;
var overColor = 9490431;
var outColor = 10592673;
var workMode = 0;
var activeMc = container_mc.myPos;
var preActiveMc = null;
var centerX = lib.info.AlignInfo.UI_WIDTH / 2;
var centerY = lib.info.AlignInfo.UI_HEIGHT / 2;
var minMove = 100;
var btn_array;
var marker_array = [{name:"mark2",sA:-1,eA:45},{name:"mark3",sA:46,eA:130},{name:"mark1",sA:211,eA:314},{name:"removeTargetInfo",sA:131,eA:210},{name:"center",sA:null,eA:null},{name:"mark2",sA:315,eA:361}];
var chat_array = [{name:"chat2",sA:-1,eA:45},{name:"chat3",sA:46,eA:130},{name:"chat1",sA:211,eA:314},{name:"chat4",sA:131,eA:210},{name:"center",sA:null,eA:null},{name:"chat2",sA:315,eA:361}];
btn_array = marker_array;
var btnLeng = btn_array.length;
var existTarget = 0;
var xPos = null;
var yPos = null;
myListener.OnGame_ChangeStageSize = function(w, h)
{
   container_mc._x = lib.info.AlignInfo.xRatioToPixel(xPos);
   container_mc._y = lib.info.AlignInfo.yRatioToPixel(yPos);
};
myListener.OnGameEventShowWindow = function(WindowName, bShow)
{
   bShow = Number(bShow);
   if(WindowName.toLowerCase() == UIname.toLowerCase())
   {
      bWindowOpen = bShow;
      if(bWindowOpen)
      {
         UI._visible = true;
         lib.util.FrameSeeker.seek(container_mc,container_mc._currentframe,container_mc._totalframes);
         activeMc = container_mc[btn_array[4].name];
         activeMc.gotoAndStop(2);
         workMode = 1;
      }
      else
      {
         lib.util.FrameSeeker.seek(container_mc,container_mc._currentframe,1,off = function()
         {
            UI._visible = false;
         });
         workMode = 0;
         activeMc.gotoAndStop(1);
         activeMc.txt.textColor = outColor;
         if(activeMc._name != "center")
         {
            activeMc.txt._x = 15;
         }
         if(activeMc._name != "center")
         {
            activeMc.txt._y = 12;
         }
         activeMc = null;
      }
   }
};
var mode = 1;
myListener.OnGame_QuickMenu_SetMode = function(Mode, chatStrData)
{
   mode = Number(Mode);
   if(Mode == 1)
   {
      existTarget = 0;
      btn_array = marker_array;
      showMarker(0);
      container_mc.cross.cross_center._visible = true;
   }
   else if(Mode == 2)
   {
      existTarget = 1;
      btn_array = chat_array;
      showMarker(1);
      var _loc1_ = chatStrData.split("\t");
      if(_loc1_[_loc1_.length - 1] == "0" || _loc1_[_loc1_.length - 1] == "undefined" || _loc1_[_loc1_.length - 1] == "")
      {
         _loc1_.pop();
      }
      lib.util.ExtString.textCut(container_mc.chat1.txt,_loc1_[0],1);
      lib.util.ExtString.textCut(container_mc.chat2.txt,_loc1_[1],1);
      lib.util.ExtString.textCut(container_mc.chat3.txt,_loc1_[2],1);
      lib.util.ExtString.textCut(container_mc.chat4.txt,_loc1_[3],1);
      container_mc.cross.cross_center._visible = false;
   }
};
myListener.OnGame_QuickMenu_SetChatText = function(text1, text2, text3, text4)
{
   lib.util.ExtString.textCut(container_mc.chat1.txt,text1,1);
   lib.util.ExtString.textCut(container_mc.chat2.txt,text2,1);
   lib.util.ExtString.textCut(container_mc.chat3.txt,text3,1);
   lib.util.ExtString.textCut(container_mc.chat4.txt,text4,1);
};
myListener.OnGame_QuickMenu_SetInnerRadius = function(radius)
{
   minMove = Number(radius);
};
myListener.OnGame_QuickMenu_MouseMovedAmount = function(x, y)
{
   if(workMode)
   {
      var _loc6_ = Number(x);
      var _loc5_ = Number(y);
      var _loc8_ = Math.abs(_loc6_);
      var _loc7_ = Math.abs(_loc5_);
      var _loc3_ = gr(0,0,_loc6_,_loc5_);
      var _loc4_ = btn_array.length;
      if(_loc8_ <= minMove && _loc7_ <= minMove)
      {
         preActiveMc = activeMc;
         if(activeMc != null)
         {
            activeMc.gotoAndStop(1);
            activeMc.txt.textColor = outColor;
            if(activeMc._name != "center")
            {
               activeMc.txt._x = 15;
            }
            if(activeMc._name != "center")
            {
               activeMc.txt._y = 12;
            }
         }
         activeMc = container_mc[btn_array[4].name];
         if(preActiveMc != activeMc && activeMc._visible)
         {
            _root.ToGame_PlaySound(1001);
         }
         activeMc.gotoAndStop(2);
         activeMc.txt.textColor = overColor;
         if(activeMc._name != "center")
         {
            activeMc.txt._x = 15;
         }
         if(activeMc._name != "center")
         {
            activeMc.txt._y = 14;
         }
      }
      else
      {
         var _loc2_ = 0;
         while(_loc2_ < _loc4_)
         {
            if(_loc3_ >= btn_array[_loc2_].sA && _loc3_ <= btn_array[_loc2_].eA && btn_array[_loc2_].sA != null && btn_array[_loc2_].eA != null)
            {
               preActiveMc = activeMc;
               if(activeMc != null)
               {
                  activeMc.gotoAndStop(1);
                  activeMc.txt.textColor = outColor;
                  activeMc.txt._x = 15;
                  activeMc.txt._y = 12;
               }
               activeMc = container_mc[btn_array[_loc2_].name];
               if(preActiveMc != activeMc && activeMc._visible)
               {
                  _root.ToGame_PlaySound(1001);
               }
               activeMc.gotoAndStop(2);
               activeMc.txt.textColor = overColor;
               activeMc.txt._x = 15;
               activeMc.txt._y = 14;
               break;
            }
            _loc2_ = _loc2_ + 1;
         }
      }
   }
};
myListener.OnGame_QuickMenu_MouseDown = function()
{
   if(activeMc != null && activeMc._visible == true && activeMc._alpha != 0)
   {
      activeMc.onRelease();
   }
};
myListener.OnGameEventChangeUIMode = function()
{
   if(_global.gbUIMode)
   {
      if(bWindowOpen)
      {
         _root.OnGameEvent("OnGameEventShowUI","QuickMenu",false);
      }
   }
};
myListener.OnGame_Crosshair_Position = function(x, y)
{
   xPos = Number(x);
   yPos = Number(y);
   container_mc._x = lib.info.AlignInfo.zeroPointX + lib.info.AlignInfo.onePercentPixelW * xPos;
   container_mc._y = lib.info.AlignInfo.zeroPointY + lib.info.AlignInfo.onePercentPixelH * yPos;
};
var amIPartyMaster = 0;
myListener.OnGameEventAmIPartyMaster = function(bTrue)
{
   bTrue = Number(bTrue);
   amIPartyMaster = bTrue;
   if(bTrue && existTarget)
   {
      showMarker(1);
   }
   else
   {
      showMarker(0);
   }
};
myListener.OnGame_QuickMenu_SetTargetType = function(typeNum)
{
   typeNum = Number(typeNum);
   if(typeNum == -1)
   {
      existTarget = 0;
      showMarker(0);
   }
   else
   {
      existTarget = 1;
      showMarker(1);
   }
};
container_mc.mark1.onRelease = function()
{
   ToGame_QuickMenu_SelectMarker(0);
};
container_mc.mark2.onRelease = function()
{
   ToGame_QuickMenu_SelectMarker(1);
};
container_mc.mark3.onRelease = function()
{
   ToGame_QuickMenu_SelectMarker(2);
};
container_mc.mark4.onRelease = function()
{
   ToGame_QuickMenu_SelectMarker(3);
};
container_mc.removeTargetInfo.onRelease = function()
{
   ToGame_QuickMenu_ResetMarker();
};
container_mc.center.onRelease = function()
{
   ToGame_QuickMenu_SelectCenter();
};
container_mc.chat1.onRelease = function()
{
   ToGame_QuickMenu_SelectChat(0);
};
container_mc.chat2.onRelease = function()
{
   ToGame_QuickMenu_SelectChat(1);
};
container_mc.chat3.onRelease = function()
{
   ToGame_QuickMenu_SelectChat(2);
};
container_mc.chat4.onRelease = function()
{
   ToGame_QuickMenu_SelectChat(3);
};
_root.OnGameEvent("OnGame_QuickMenu_SetTargetType",-1);
_root.OnGameEvent("OnGameEventAmIPartyMaster",false);
fscommand("ToGame_QuickMenu_Init");
