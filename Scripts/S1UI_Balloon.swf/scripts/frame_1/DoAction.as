function ToGame_Balloon_SetSize(idNsize)
{
   getURL("FSCommand:ToGame_Balloon_SetSize",idNsize);
}
function ToGame_Balloon_ExecuteRemove(id)
{
   getURL("FSCommand:ToGame_Balloon_ExecuteRemove",id);
}
function checkId(id)
{
   var _loc1_ = 0;
   while(_loc1_ < balloonManager.length)
   {
      if(balloonManager[_loc1_].id == id)
      {
         return _loc1_;
      }
      _loc1_ = _loc1_ + 1;
   }
   return null;
}
function setMessage(id, _message, type)
{
   var _loc3_ = checkId(id);
   var _loc2_ = undefined;
   if(_loc3_ == null)
   {
      _loc2_ = this.attachMovie(WIDGETNAMEIS,WIDGETNAMEIS + id,this.getNextHighestDepth(),{_x:-500,_y:-500});
      balloonManager.push(_loc2_);
      _loc2_.id = id;
      _loc2_.message = _message;
      _loc2_.type = type;
      _loc2_.onRelease = function()
      {
      };
      _loc2_.useHandCursor = false;
   }
   else
   {
      _loc2_ = balloonManager.splice(_loc3_,1)[0];
      _loc2_.swapDepths(this.getNextHighestDepth());
      balloonManager.push(_loc2_);
      updateMessage(_loc2_,_message,type);
   }
}
function updateMessage(mc, _message, chanel)
{
   var _loc2_ = g4.model.GameModel.chatModel.getChatColorByChannel(Number(chanel));
   mc.messageFd.htmlText = _message;
   mc.messageFd.autoSize = true;
   if(Number(chanel) != 99)
   {
      mc.messageFd.textColor = _loc2_;
   }
   var _loc4_ = new Color(mc.textBoxMc.lineMc);
   _loc4_.setRGB(_loc2_);
   var _loc3_ = Math.max(mc.messageFd.textWidth + LMARG * 2,MINIMUNSIZE + LMARG * 2);
   var _loc5_ = Math.min(mc.messageFd._height + TMARG * 2,MAXH);
   mc.textBoxMc._width = _loc3_;
   mc.textBoxMc._height = Math.max(_loc5_,MINH);
   mc.textBoxMc._x = (- _loc3_) / 2;
   mc.messageFd._x = (- mc.messageFd.textWidth) / 2 - 2;
   mc.messageFd._y = mc.textBoxMc._y - mc.textBoxMc._height / 2 - mc.messageFd._height / 2;
   ToGame_Balloon_SetSize(mc.id + "\t" + mc.textBoxMc._width + "\t" + mc.textBoxMc._height);
   mc.gotoAndPlay(2);
}
function clearBalloon(mc)
{
   var _loc3_ = checkId(mc.id);
   var _loc2_ = mc.id;
   balloonManager.splice(_loc3_,1);
   mc.removeMovieClip();
   ToGame_Balloon_ExecuteRemove(_loc2_);
}
_global.gfxExtensions = true;
var MAXLINES = 6;
var LMARG = 10;
var TMARG = 10;
var MINH = 32;
var MAXH = 500;
var ARROWMARG = 4;
var MINIMUNSIZE = 32;
var WIDGETNAMEIS = "Balloon";
var balloonId;
var balloonManager = [];
var widgetListener = new Object();
_global.EventBroadCaster.addListener(widgetListener);
widgetListener.OnGameEventShowWindow = function(widgetName, bShow)
{
   if(widgetName.toLowerCase() == WIDGETNAMEIS.toLowerCase())
   {
      if(_global.gbUIMode && bShow)
      {
         UI._visible = true;
      }
      else
      {
         UI._visible = false;
         for(var _loc2_ in balloonManager)
         {
            clearBalloon(balloonManager[_loc2_]);
         }
      }
   }
};
widgetListener.OnGame_Balloon_SetMessage = function(id, _message, chanel)
{
   setMessage(id,_message,chanel);
};
widgetListener.OnGame_Balloon_SetPosition = function(id, x, y)
{
   var _loc4_ = balloonManager[checkId(id)];
   if(!_loc4_._visible)
   {
      return undefined;
   }
   balloonManager[checkId(id)]._x = x;
   balloonManager[checkId(id)]._y = y;
   var _loc1_ = 1;
   var _loc3_ = balloonManager[checkId(id)].textBoxMc._width;
   var _loc5_ = balloonManager[checkId(id)].textBoxMc._height;
   if(x >= 1920 - _loc3_ / 2 - 3)
   {
      _loc1_ = 3;
   }
   else if(x <= _loc3_ / 2 + 3)
   {
      _loc1_ = 2;
   }
   else
   {
      _loc1_ = 1;
   }
   if(y <= _loc5_ + 1)
   {
      _loc1_ = 0;
   }
   else if(_loc1_ == 0)
   {
      _loc1_ = 1;
   }
   widgetListener.OnGame_Balloon_SetTail(id,_loc1_,0);
};
widgetListener.OnGame_Balloon_SetTail = function(id, _direction, _position)
{
   var _loc3_ = balloonManager[checkId(id)];
   if(!_loc3_._visible)
   {
      return undefined;
   }
   var _loc1_ = balloonManager[checkId(id)].arrowMc;
   var _loc2_ = balloonManager[checkId(id)].textBoxMc;
   switch(_direction)
   {
      case 0:
         _loc1_._rotation = 180;
         _loc1_._xscale = 100;
         _loc1_._x = _position + ARROWMARG;
         _loc1_._y = - _loc2_._height;
         break;
      case 1:
         _loc1_._rotation = 0;
         _loc1_._xscale = 100;
         _loc1_._x = _position + ARROWMARG;
         _loc1_._y = _loc2_._y;
         break;
      case 2:
         _loc1_._rotation = 0;
         _loc1_._xscale = 100;
         _loc1_._x = (- _loc2_._width) / 3 + ARROWMARG;
         _loc1_._y = _loc2_._y;
         break;
      case 3:
         _loc1_._rotation = 0;
         _loc1_._xscale = -100;
         _loc1_._x = _position;
         _loc1_._x = _loc2_._width / 3 + ARROWMARG;
         _loc1_._y = _loc2_._y;
   }
   _loc1_._visible = true;
};
widgetListener.OnGame_Balloon_SetVisible = function(id, __visible)
{
   balloonManager[checkId(id)]._visible = __visible;
};
stop();
