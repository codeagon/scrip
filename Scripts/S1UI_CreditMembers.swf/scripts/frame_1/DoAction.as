var UIname = "CreditMembers";
var UI = this;
UI._visible = false;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
var defaultSpeed = 2.5;
var speed = defaultSpeed;
var playing = false;
var isInited = false;
var SaveData = lib.gamedata.HistoryData.getHistoryData(UIname);
function Add(type, param1, param2, param3)
{
   var _loc1_ = container_mc.attachMovie("type" + type,param1 + param2,container_mc.getNextHighestDepth());
   _loc1_.type = Number(type);
   lib.Debuger.trace("mc   " + _loc1_);
   if(type == 5)
   {
      var _loc4_ = lib.util.DrawBitmap.makeMcAndDraw(_loc1_,param1,Number(param2),Number(param3));
      _loc4_._x = _loc4_._x - _loc4_._width / 2;
   }
   else if(type == 4)
   {
      _loc1_.t.text = param1;
      _loc1_.tt.text = param2;
      _loc1_.t._width = _loc1_.t.textWidth + 5;
      _loc1_.tt._width = _loc1_.tt.textWidth + 5;
      _loc1_.t._x = _loc1_.tt._x - _loc1_.t._width - 15;
      _loc1_.tt._x = 15;
   }
   else
   {
      _loc1_.t.text = param1;
      _loc1_.t._width = _loc1_.t.textWidth + 5;
      _loc1_.t._x = _loc1_.t._x - _loc1_.t._width / 2;
   }
   if(array.length != 0)
   {
      var _loc2_ = array[array.length - 1];
      _loc1_._y = _loc2_._y + _loc2_._height;
      if(_loc2_.type == 5)
      {
         _loc1_._y = _loc1_._y + 30;
      }
   }
   else
   {
      _loc1_._y = 0;
   }
   array.push(_loc1_);
}
function ToGame_CreditMembers_BackToLobby()
{
   fscommand("ToGame_CreditMembers_BackToLobby");
}
function ToGame_CreditMembers_EndRolling()
{
   fscommand("ToGame_CreditMembers_EndRolling");
}
function ToGame_CreditMembers_Init()
{
   fscommand("ToGame_CreditMembers_Init");
}
function resume()
{
   playing = !playing;
   if(!playing)
   {
      speed = defaultSpeed;
      btns.txt2.text = lib.util.UIString.getUIString("$014002");
   }
   else
   {
      speed = 0;
      btns.txt2.text = lib.util.UIString.getUIString("$014003");
   }
}
if(SaveData == undefined)
{
   SaveData = new Object();
}
container_mc.onEnterFrame = function()
{
   if(!isInited)
   {
      return undefined;
   }
   this._y = this._y - speed;
   var _loc4_ = array.length;
   var _loc3_ = null;
   var _loc2_ = 0;
   while(_loc2_ < _loc4_)
   {
      if(removeLine.hitTest(array[_loc2_]))
      {
         _loc3_ = _loc2_;
      }
      _loc2_ = _loc2_ + 1;
   }
   if(_loc3_ != null)
   {
      if(array[_loc3_].type == 5)
      {
         array[_loc3_].onEnterFrame = function()
         {
            this._alpha = this._alpha - 3;
            if(this._alpha <= 0)
            {
               delete this.onEnterFrame;
               this.removeMovieClip();
            }
         };
      }
      else
      {
         array[_loc3_].removeMovieClip();
      }
      array.splice(_loc3_,1);
   }
   if(array.length == 0)
   {
      ToGame_CreditMembers_EndRolling();
      delete this.onEnterFrame;
   }
};
myListener.OnGame_ScaleUI = function()
{
   myListener.OnGame_ChangeStageSize();
};
myListener.OnGame_ChangeStageSize = function(w, h)
{
   container_mc._x = lib.info.AlignInfo.xRatioToPixel(50);
   bg._width = Stage.width;
   bg._height = Stage.height;
   bg._x = lib.info.AlignInfo.xRatioToPixel(0);
   bg._y = lib.info.AlignInfo.yRatioToPixel(0);
   btns._y = lib.info.AlignInfo.yRatioToPixel(96);
   blindDown._width = Stage.width;
   blindUp._width = Stage.width;
   blindDown._x = lib.info.AlignInfo.xRatioToPixel(0);
   blindUp._x = lib.info.AlignInfo.xRatioToPixel(0);
   blindDown._y = lib.info.AlignInfo.yRatioToPixel(100) - blindDown._height;
   blindUp._y = lib.info.AlignInfo.yRatioToPixel(0);
   removeLine._y = lib.info.AlignInfo.yRatioToPixel(0);
};
bWidgetOpen = false;
myListener.OnGameEventShowWindow = function(widgetName, bShow)
{
   if(widgetName.toLowerCase() == UIname.toLowerCase())
   {
      bWidgetOpen = bShow;
      UI._visible = bWidgetOpen;
      if(bShow)
      {
         btns.onEnterFrame = function()
         {
            container_mc._alpha = container_mc._alpha + 5;
            if(container_mc._alpha >= 100)
            {
               delete this.onEnterFrame;
            }
         };
      }
      if(UI._visible == true)
      {
         SaveData.set_visible = true;
      }
      else
      {
         SaveData.set_visible = false;
      }
      lib.gamedata.HistoryData.addHistoryData(UIname,SaveData);
   }
};
myListener.OnGame_CreditMembers_AddLine = function(type, param1, param2, param3)
{
   isInited = true;
   Add(type,param1,param2,param3);
};
var array = new Array();
container_mc._y = lib.info.AlignInfo.yRatioToPixel(100);
container_mc._alpha = 0;
myListener.OnGame_ChangeStageSize();
ToGame_CreditMembers_Init();
var ChBtn_OverFrame = 8;
var ChBtn_EndFrame = 34;
var ChBtn_SubBtn1Check = false;
btns.ChBtn_Btn1.onRollOver = function()
{
   if(ChBtn_SubBtn1Check == false)
   {
      lib.util.FrameSeeker.seek(this.Btn2,1,ChBtn_OverFrame);
   }
};
btns.ChBtn_Btn1.onRollOut = function()
{
   if(ChBtn_SubBtn1Check == false)
   {
      if(this.Btn2._currentframe != ChBtn_EndFrame)
      {
         lib.util.FrameSeeker.seek(this.Btn2,ChBtn_OverFrame,1);
      }
   }
   else if(ChBtn_SubBtn1Check == true)
   {
      ChBtn_SubBtn1Check = false;
   }
};
btns.ChBtn_Btn1.onRelease = btns.ChBtn_Btn1.onReleaseOutside = function()
{
   if(ChBtn_SubBtn1Check == false)
   {
      lib.manager.UISound.play(lib.manager.UISound.MAIN_BTN);
      lib.util.FrameSeeker.seek(this.Btn2,ChBtn_OverFrame,ChBtn_EndFrame);
      ToGame_CreditMembers_BackToLobby();
   }
};
var ChBtn_SubBtn2Check = false;
btns.ChBtn_Btn2.onRollOver = function()
{
   if(ChBtn_SubBtn2Check == false)
   {
      lib.util.FrameSeeker.seek(this.Btn2,1,ChBtn_OverFrame);
   }
};
btns.ChBtn_Btn2.onRollOut = function()
{
   if(ChBtn_SubBtn2Check == false)
   {
      if(this.Btn2._currentframe != ChBtn_EndFrame)
      {
         lib.util.FrameSeeker.seek(this.Btn2,ChBtn_OverFrame,1);
      }
   }
   else if(ChBtn_SubBtn2Check == true)
   {
      ChBtn_SubBtn2Check = false;
   }
};
btns.ChBtn_Btn2.onRelease = btns.ChBtn_Btn2.onReleaseOutside = function()
{
   if(ChBtn_SubBtn2Check == false)
   {
      lib.manager.UISound.play(lib.manager.UISound.MAIN_BTN);
      lib.util.FrameSeeker.seek(this.Btn2,ChBtn_OverFrame,ChBtn_EndFrame);
      resume();
   }
};
var ChBtn_SubBtn3Check = false;
btns.ChBtn_Btn3.onRollOver = function()
{
   if(ChBtn_SubBtn1Check == false)
   {
      lib.util.FrameSeeker.seek(this.Btn2,1,ChBtn_OverFrame);
   }
};
btns.ChBtn_Btn3.onRollOut = function()
{
   if(ChBtn_SubBtn1Check == false)
   {
      if(this.Btn2._currentframe != ChBtn_EndFrame)
      {
         lib.util.FrameSeeker.seek(this.Btn2,ChBtn_OverFrame,1);
      }
   }
   else if(ChBtn_SubBtn1Check == true)
   {
      ChBtn_SubBtn1Check = false;
   }
};
btns.ChBtn_Btn3.onPress = function()
{
   lib.util.FrameSeeker.seek(this.Btn2,2,ChBtn_OverFrame);
   if(!playing)
   {
      speed = 0.5;
   }
};
btns.ChBtn_Btn3.onRelease = btns.ChBtn_Btn3.onReleaseOutside = function()
{
   if(ChBtn_SubBtn1Check == false)
   {
      lib.manager.UISound.play(lib.manager.UISound.MAIN_BTN);
      lib.util.FrameSeeker.seek(this.Btn2,ChBtn_OverFrame,ChBtn_EndFrame);
   }
   if(!playing)
   {
      speed = defaultSpeed;
   }
};
var ChBtn_SubBtn4Check = false;
btns.ChBtn_Btn4.onRollOver = function()
{
   if(ChBtn_SubBtn4Check == false)
   {
      lib.util.FrameSeeker.seek(this.Btn2,1,ChBtn_OverFrame);
   }
};
btns.ChBtn_Btn4.onRollOut = function()
{
   if(ChBtn_SubBtn4Check == false)
   {
      if(this.Btn2._currentframe != ChBtn_EndFrame)
      {
         lib.util.FrameSeeker.seek(this.Btn2,ChBtn_OverFrame,1);
      }
   }
   else if(ChBtn_SubBtn4Check == true)
   {
      ChBtn_SubBtn4Check = false;
   }
};
btns.ChBtn_Btn4.onPress = function()
{
   lib.util.FrameSeeker.seek(this.Btn2,2,ChBtn_OverFrame);
   if(!playing)
   {
      speed = 12;
   }
};
btns.ChBtn_Btn4.onRelease = btns.ChBtn_Btn4.onReleaseOutside = function()
{
   if(ChBtn_SubBtn4Check == false)
   {
      lib.manager.UISound.play(lib.manager.UISound.MAIN_BTN);
      lib.util.FrameSeeker.seek(this.Btn2,ChBtn_OverFrame,ChBtn_EndFrame);
   }
   if(!playing)
   {
      speed = defaultSpeed;
   }
};
bg.onRollOver = function()
{
};
bg.useHandCursor = false;
