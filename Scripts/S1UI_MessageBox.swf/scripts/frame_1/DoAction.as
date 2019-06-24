function setLifeTime(target)
{
   target.cnt = 0;
   target.onEnterFrame = function()
   {
      this.cnt = this.cnt + 1;
      if(this.cnt >= 24 * lifeTime)
      {
         delete this.onEnterFrame;
         normalFadeOut(this);
      }
   };
}
function normalFadeOut(target)
{
   var _loc2_ = new mx.transitions.Tween(target,"_alpha",mx.transitions.easing.Regular.easeOut,target._alpha,0,normalFadeOutTime,true);
   _loc2_.target = target;
   _loc2_.onMotionFinished = function()
   {
      this.target.removeMovieClip();
      currentNumOfMsg--;
   };
}
function pushedFadeOut(target)
{
   var _loc2_ = new mx.transitions.Tween(target,"_alpha",mx.transitions.easing.Regular.easeOut,target._alpha,0,pushedFadeOutTime,true);
   _loc2_.target = target;
   _loc2_.onMotionFinished = function()
   {
      this.target.removeMovieClip();
   };
}
function pushMessage(target)
{
   for(mc in systemMessageContainer)
   {
      if(typeof systemMessageContainer[mc] == "movieclip")
      {
         var _loc1_ = systemMessageContainer[mc];
         _loc1_.currentLine = _loc1_.currentLine + 1;
         var _loc2_ = new mx.transitions.Tween(_loc1_,"_y",mx.transitions.easing.Regular.easeOut,_loc1_._y,(- lineHeight) * _loc1_.currentLine,pushTime,true);
         if(_loc1_.currentLine == 1)
         {
            new mx.transitions.Tween(_loc1_,"_alpha",mx.transitions.easing.Regular.easeOut,_loc1_._alpha,100,pushTime,true);
         }
         else if(_loc1_.currentLine == maxLine + 1)
         {
            pushedFadeOut(_loc1_);
         }
      }
   }
}
function ToGameMessageBoxEvent(nMessageID, nReturnCode)
{
   getURL("FSCommand:ToGameMessageBoxEvent",nMessageID + "\t" + nReturnCode);
   trace("ToGameMessageBoxEvent:" + nMessageID + "\t" + nReturnCode);
}
var lifeTime = 4;
var lineHeight = 28;
var maxLine = 3;
var currentNumOfMsg = 0;
var fadeInTime = 0.3;
var normalFadeOutTime = 5;
var pushedFadeOutTime = fadeInTime;
var pushTime = 0.5;
var myListener = new Object();
myListener.OnGame_ChangeStageSize = function(w, h)
{
   systemMessageContainer._x = lib.info.AlignInfo.xRatioToPixel(50);
   systemMessageContainer._y = lib.info.AlignInfo.yRatioToPixel(30);
};
myListener.OnGame_SystemMessage_Add = function(str)
{
   var _loc2_ = systemMessageContainer.getNextHighestDepth();
   var _loc1_ = systemMessageContainer.attachMovie("formatedSystemMessage","formatedSystemMessage" + _loc2_,_loc2_);
   if(systemMessageContainer["formatedSystemMessage" + (_loc2_ - 1)])
   {
      _loc1_._y = systemMessageContainer["formatedSystemMessage" + (_loc2_ - 1)]._y + systemMessageContainer["formatedSystemMessage" + (_loc2_ - 1)]._height;
   }
   _loc1_._alpha = 0;
   _loc1_.currentLine = 0;
   _loc1_.txt.autoSize = true;
   _loc1_.txt.text = str;
   _loc1_.txt._x = (- _loc1_.txt._width) / 2;
   _loc1_.cnt = 0;
   setLifeTime(_loc1_);
   pushMessage(_loc1_);
};
myListener.OnGameEventShowMessageBox = function(nMessageId, nX, nY, nWidth, nHeight, strTitle, strMessage, bExitButton, nExitCode, nButtons, strFirstButton, strSecondButton)
{
   nMessageId = String(nMessageId);
   msgBoxArea.attachMovie("msgBox","msgBox" + nMessageId,msgBoxArea.getNextHighestDepth(),{_x:nX,_y:nY});
   msgBoxArea["msgBox" + nMessageId].text_title.text = strTitle;
   msgBoxArea["msgBox" + nMessageId].text_message.text = strMessage;
   msgBoxArea["msgBox" + nMessageId].btn_exit._visible = bExitButton;
   msgBoxArea["msgBox" + nMessageId].nExitCode = nExitCode;
   if(nButtons == 1)
   {
      msgBoxArea["msgBox" + nMessageId].text_btn1.text = strFirstButton;
      msgBoxArea["msgBox" + nMessageId].btn_2._visible = false;
      msgBoxArea["msgBox" + nMessageId].text_btn2._visible = false;
   }
   else
   {
      msgBoxArea["msgBox" + nMessageId].text_btn1.text = strFirstButton;
      msgBoxArea["msgBox" + nMessageId].text_btn2.text = strSecondButton;
   }
};
myListener.OnGameEventSetMessageBoxPosition = function(nMessageId, nX, nY)
{
   nMessageId = String(nMessageId);
   msgBoxArea["msgBox" + nMessageId]._x = nX;
   msgBoxArea["msgBox" + nMessageId]._y = nY;
};
myListener.OnGameEventSetMessageBoxTitle = function(nMessageId, strTitle)
{
   nMessageId = String(nMessageId);
   msgBoxArea["msgBox" + nMessageId].text_title.text = strTitle;
};
myListener.OnGameEventSetMessageBoxMessage = function(nMessageId, strMessage)
{
   nMessageId = String(nMessageId);
   msgBoxArea["msgBox" + nMessageId].text_message.text = strMessage;
};
myListener.OnGameEventMessageBoxRemove = function(nMessageId)
{
   nMessageId = String(nMessageId);
   msgBoxArea["msgBox" + nMessageId].removeMovieClip();
};
myListener.OnGameEventSystemMessageShow = function(nMessageId, nX, nY, strMessage, fontColor, fontSize, bBlink)
{
   nMessageId = String(nMessageId);
   bBlink = Number(bBlink);
   _root.debug3.text = "[시스템메시지] 메시지를 보여라 = nMessageId: " + nMessageId + ", strMessage: " + strMessage + ", bBlink: " + bBlink + "\r" + _root.debug3.text;
   var _loc4_ = "systemMessage" + nMessageId;
   var _loc2_ = undefined;
   if(bBlink)
   {
      _loc2_ = msgBoxArea.attachMovie("systemMessageBlink",_loc4_,msgBoxArea.getNextHighestDepth() + 1000);
      _loc2_.blink = 1;
   }
   else
   {
      _loc2_ = msgBoxArea.attachMovie("systemMessage",_loc4_,msgBoxArea.getNextHighestDepth() + 1000);
      _loc2_.blink = 0;
   }
   _root.debug3.text = _root.debug3.text + ("\nxRatio =" + nX + ", yRatio=" + nY);
   _root.debug3.text = _root.debug3.text + ("\nxPixel =" + lib.info.AlignInfo.xRatioToPixel(Number(nX)) + ", yPixel=" + lib.info.AlignInfo.yRatioToPixel(Number(nY)));
   _loc2_._x = lib.info.AlignInfo.xRatioToPixel(Number(nX));
   _loc2_._y = lib.info.AlignInfo.yRatioToPixel(Number(nY));
   var _loc5_ = new TextFormat();
   _loc5_.size = fontSize;
   _loc2_.mc_text.text_msg.autoSize = true;
   _loc2_.mc_text.text_msg.setNewTextFormat(_loc5_);
   _loc2_.mc_text.text_msg.text = strMessage;
   _loc2_.mc_text.text_msg.textColor = fontColor;
};
myListener.OnGame_SystemMessage_SetDropShadow = function(id, shadowAlpha, shadowAngle, shadowBlurX, shadowBlurY, shadowColor, shadowDistance, bHideText, shadowStrength)
{
   id = String(id);
   shadowAlpha = Number(shadowAlpha);
   shadowAngle = Number(shadowAngle);
   shadowBlurX = Number(shadowBlurX);
   shadowBlurY = Number(shadowBlurY);
   shadowColor = Number(shadowColor);
   shadowDistance = Number(shadowDistance);
   bHideText = Number(bHideText);
   shadowStrength = Number(shadowStrength);
   _root.debug3.text = _root.debug3.text + ("\nID =" + id);
   var _loc2_ = msgBoxArea["systemMessage" + id].mc_text.text_msg;
   _root.debug3.text = _root.debug3.text + ("\nobject =" + _loc2_);
   _loc2_.shadowAlpha = shadowAlpha;
   _loc2_.shadowAngle = shadowAngle;
   _loc2_.shadowBlurX = shadowBlurX;
   _loc2_.shadowBlurY = shadowBlurY;
   _loc2_.shadowColor = shadowColor;
   _loc2_.shadowDistance = shadowDistance;
   _loc2_.shadowHideObject = bHideText;
   _loc2_.shadowStrength = shadowStrength;
};
myListener.OnGameEventSystemMessageRemove = function(nMessageId)
{
   nMessageId = String(nMessageId);
   _root.debug3.text = "[시스템메시지] 제거해 = nMessageId: " + nMessageId + "\r" + _root.debug3.text;
   var _loc3_ = msgBoxArea["systemMessage" + nMessageId];
   if(_loc3_.blink == 0)
   {
      _loc3_.onEnterFrame = function()
      {
         this.nextFrame();
         if(this._currentframe == this._totalframes)
         {
            removeMovieClip(this);
            delete this.onEnterFrame;
         }
      };
   }
   else
   {
      _loc3_.removeMovieClip();
   }
};
myListener.OnGameEventSystemMessageUpdateMessage = function(nMessageId, strMessage)
{
   nMessageId = String(nMessageId);
   _root.debug3.text = "[시스템메시지] 업데이트 = nMessageId: " + nMessageId + ", strMessage: " + strMessage + "\r" + _root.debug3.text;
   var _loc3_ = "systemMessage" + nMessageId;
   msgBoxArea[_loc3_].mc_text.text_msg.text = strMessage;
};
_global.EventBroadCaster.addListener(myListener);
