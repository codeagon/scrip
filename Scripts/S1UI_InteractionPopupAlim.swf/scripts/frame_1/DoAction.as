function buildMessage(id, _title, _message)
{
   var _loc1_ = container_mc.attachMovie("messageBox","messageBox_" + id,container_mc.getNextHighestDepth());
   _loc1_.titleFd.setText(_title);
   _loc1_.messageFd.verticalAlign = "center";
   parseMessage(_loc1_.messageFd,_message);
   _loc1_.messageFd.textColor = lib.info.TextColor.GENERAL_NOTICE;
   _loc1_.id = id;
   messageStore.push(_loc1_);
   if(positions[0] == undefined)
   {
      positions[0] = bottomP;
   }
   _loc1_._y = positions[positions.length - 1] - _loc1_._height - SHOWSPACE;
   position(true);
   Popup_CenterOption();
}
function position(motion)
{
   var _loc5_ = 0;
   var _loc3_ = bottomP;
   var _loc2_ = 0;
   while(_loc2_ < messageStore.length)
   {
      var _loc1_ = messageStore[_loc2_];
      if(_loc1_ != undefined)
      {
         positions[_loc2_] = _loc3_ - _loc1_._height + SPACE;
         if(!motion)
         {
            _loc1_._y = _loc3_ - _loc1_._height + SPACE;
         }
         _loc1_._x = rightP;
         _loc3_ = positions[_loc2_];
      }
      _loc2_ = _loc2_ + 1;
   }
   if(motion)
   {
      boxMotion();
   }
}
function removeMessage(id)
{
   var _loc1_ = 0;
   while(_loc1_ < messageStore.length)
   {
      if(messageStore[_loc1_].id == Number(id))
      {
         messageStore[_loc1_].removeMovieClip();
         messageStore.splice(_loc1_,1);
         positions.splice(_loc1_,1);
         break;
      }
      _loc1_ = _loc1_ + 1;
   }
   position(true);
   Popup_CenterOption();
}
function boxMotion()
{
   var _loc1_ = 0;
   while(_loc1_ < messageStore.length)
   {
      var _loc2_ = messageStore[_loc1_];
      if(_loc2_ != undefined)
      {
         gs.TweenLite.killTweensOf(_loc2_,false);
         gs.TweenLite.to(_loc2_,SPEEDA,{_y:positions[_loc1_],ease:gs.easing.Back.easeOut});
         count++;
      }
      _loc1_ = _loc1_ + 1;
   }
}
function parseMessage(txtfd, _message)
{
   txtfd.setText(_message);
}
function Popup_CenterOption()
{
   var delay_num = 0;
   UI.onEnterFrame = null;
   UI.onEnterFrame = function()
   {
      delay_num++;
      if(delay_num > 0)
      {
         UI.onEnterFrame = null;
         var _loc1_ = lib.info.AlignInfo.scaleRatio;
         if(CenterOption_Flag == false)
         {
            UI._x = lib.info.AlignInfo.xRatioToPixel(100);
            UI._y = lib.info.AlignInfo.yRatioToPixel(100);
         }
         else if(CenterOption_Flag == true)
         {
            UI._x = lib.info.AlignInfo.xRatioToPixel(59);
            UI._y = lib.info.AlignInfo.yRatioToPixel(49);
         }
         UI._x = UI._x - 396 * _loc1_;
         UI._y = UI._y - 157 * _loc1_;
      }
   };
}
function centerHandler(value)
{
   if(value == 0)
   {
      myListener.OnGame_Popup_CenterOption("0");
   }
   else if(value == 1)
   {
      myListener.OnGame_Popup_CenterOption("1");
   }
}
function valueChangeHandler(event)
{
   if(event.key == lib.gamedata.CustomizedUIDataKey.INTERACTIONPOPUPALIM_CENTER_BOOLEAN)
   {
      centerHandler(event.value);
   }
}
function testbtn1func()
{
   myListener.OnGame_Popup_CenterOption("0");
}
function testbtn2func()
{
   myListener.OnGame_Popup_CenterOption("1");
}
var UI = this;
UI._visible = false;
var UIname = "InteractionPopUpAlim";
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
_global.gfxExtensions = true;
hit.hitTestDisable = true;
var SHOWSPACE = 50;
var SPEEDA = 0.5;
var SPACE = 0;
var RSPACE = 20;
var MAXLINES = 3;
var messageStore = [];
var rightP = 0;
var bottomP = -40;
var positions = [bottomP];
var bWidgetOpen = false;
var CenterOption_Flag = false;
myListener.OnGameEventShowWindow = function(widgetName, bShow)
{
   if(widgetName.toLowerCase() == UIname.toLowerCase())
   {
      bWidgetOpen = bShow;
      if(bWidgetOpen)
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
   if(!_global.gbUIMode)
   {
      container_mc._visible = true;
   }
   else
   {
      container_mc._visible = false;
   }
};
myListener.OnGame_ChangeStageSize = function(width, height)
{
   if(width == undefined || height == undefined)
   {
      return undefined;
   }
};
myListener.OnGame_Popup_Create = function()
{
   if(Number(arguments[0]) == 1 || Number(arguments[0]) == 7)
   {
      _root.OnGameEvent("OnGameEventShowUI",UIname,1);
      buildMessage(arguments[1],arguments[2],arguments[3]);
   }
};
myListener.OnGame_Popup_Remove = function(id)
{
   removeMessage(id);
};
myListener.OnGame_Popup_Update = function()
{
   var _loc3_ = 0;
   while(_loc3_ < messageStore.length)
   {
      var _loc2_ = messageStore[_loc3_];
      if(_loc2_.id == arguments[0])
      {
         _loc2_.titleFd.setText(arguments[1]);
         parseMessage(_loc2_.messageFd,arguments[2]);
         _loc2_.messageFd.textColor = lib.info.TextColor.GENERAL_NOTICE;
         _loc2_._alpha = 50;
         gs.TweenLite.killTweensOf(_loc2_,false);
         gs.TweenLite.to(_loc2_,1,{_alpha:100,ease:gs.easing.Strong.easeOut});
         return undefined;
      }
      _loc3_ = _loc3_ + 1;
   }
};
myListener.OnGame_InteractionPopupAlim_Update = function(id, _title, _message)
{
   _root.OnGameEvent("OnGameEventShowUI",UIname,1);
   buildMessage(id,_title,_message);
};
myListener.OnGame_InteractionPopupAlim_Remove = function(id)
{
   removeMessage(id);
};
myListener.OnGame_Popup_CenterOption = function(flag)
{
   if(flag == "0")
   {
      CenterOption_Flag = false;
   }
   else if(flag == "1")
   {
      CenterOption_Flag = true;
   }
   Popup_CenterOption();
};
myListener.OnGame_ChangeStageSize();
var customizeData = lib.gamedata.CustomizedUIDataCollection.getInstance();
customizeData.valueOf(lib.gamedata.CustomizedUIDataKey.INTERACTIONPOPUPALIM_CENTER_BOOLEAN,this,"centerHandler");
customizeData.addEventListener(gfx.events.EventTypes.VALUE_CHANGE,this,"valueChangeHandler");
var test_btn1 = testbtn1.txtBtn;
test_btn1.setRelease(function()
{
   testbtn1func();
}
);
var test_btn2 = testbtn2.txtBtn;
test_btn2.setRelease(function()
{
   testbtn2func();
}
);
