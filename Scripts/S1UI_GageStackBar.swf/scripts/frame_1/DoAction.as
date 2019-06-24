function gageHandlerShow($value)
{
   $value = Number($value);
   showGauge = $value == 1;
   if(bWidgetOpen && showGauge)
   {
      UI._visible = true;
   }
   else
   {
      UI._visible = false;
   }
}
function valueHandlerChange(event)
{
   if(event.key == lib.gamedata.CustomizedUIDataKey.GLADI_STACK_BOOLEAN)
   {
      gageHandlerShow(Number(event.value));
   }
}
function ToGame_GageStackBar_Init()
{
   fscommand("ToGame_GageStackBar_Init");
}
function init()
{
   container_mc.effectMc._visible = false;
   SetGage(0);
   container_mc.txt.text = "0";
}
function SetGage(bChangeText)
{
   var _loc2_ = 0;
   var _loc4_ = 4;
   if(currentStack == MAX_STACK_NUM)
   {
      _loc4_ = 1;
   }
   else if(currentStack > 2)
   {
      _loc4_ = 2;
   }
   else if(currentStack > 0)
   {
      _loc4_ = 3;
   }
   container_mc.markMc.gotoAndStop(Number(currentStack) + 1);
   container_mc.gotoAndStop(Number(currentStack) + 1);
   if(bChangeText)
   {
      container_mc.txt.text = String(currentStack);
   }
   _loc2_ = 0;
   while(_loc2_ < MAX_STACK_NUM)
   {
      var _loc1_ = container_mc["stack" + _loc2_];
      if(_loc2_ < currentStack)
      {
         _loc1_.gotoAndStop(_loc4_);
         gs.TweenLite.killTweensOf(_loc1_.aniMc,false);
         gs.TweenLite.killTweensOf(_loc1_,false);
         gs.TweenLite.to(_loc1_,0.5,{_alpha:100});
         if(_loc2_ == currentStack - 1)
         {
            _loc1_.aniMc.gotoAndPlay(2);
         }
         else if(stackCount == 10)
         {
            _loc1_.aniMc.gotoAndPlay(20);
         }
         else
         {
            _loc1_.aniMc.gotoAndStop(1);
         }
      }
      else
      {
         _loc1_._alpha = 0;
      }
      _loc2_ = _loc2_ + 1;
   }
   if(currentStack == MAX_STACK_NUM)
   {
      EffectOn();
   }
   else
   {
      container_mc.effectMc._visible = false;
   }
}
function EffectOn()
{
   gs.TweenLite.killTweensOf(container_mc.effectMc,false);
   container_mc.effectMc._alpha = 0;
   container_mc.effectMc._visible = true;
   gs.TweenLite.to(container.effectMc,0.5,{_alpha:100,ease:Strong.easeIn,onComplete:EffectOff2});
}
function EffectOff()
{
   gs.TweenLite.to(container.effectMc,0.3,{_alpha:0,ease:Strong.easeIn});
}
function DangerEvent()
{
   var _loc1_ = 0;
   var _loc3_ = !bDanger?1:40;
   _loc1_ = 0;
   while(_loc1_ < currentStack)
   {
      var _loc2_ = container_mc["stack" + _loc1_];
      _loc2_.aniMc.gotoAndPlay(_loc3_);
      _loc1_ = _loc1_ + 1;
   }
}
function ClearEvent()
{
   if(currentStack == MAX_STACK_NUM)
   {
      EffectOn();
   }
   countDown = currentStack;
   var _loc1_ = 0;
   _loc1_ = 0;
   while(_loc1_ < currentStack)
   {
      var _loc2_ = container_mc["stack" + _loc1_];
      var _loc3_ = (10 - _loc1_) / 20;
      var _loc4_ = (10 - _loc1_) / 40;
      _loc2_.aniMc.gotoAndStop(70);
      gs.TweenLite.to(_loc2_.aniMc,0.1,{delay:_loc4_,onComplete:ClearEnd1});
      gs.TweenLite.to(_loc2_,1,{delay:_loc3_,_alpha:0,ease:Strong.easeOut,onComplete:ClearEnd2,onCompleteParams:[_loc2_]});
      _loc1_ = _loc1_ + 1;
   }
}
function ClearEnd(mc)
{
   mc.gotoAndStop(4);
   mc.aniMc.gotoAndStop(1);
}
function ClearEnd1()
{
   container_mc.markMc.gotoAndStop(countDown);
   container_mc.gotoAndStop(countDown);
   countDown--;
   container_mc.txt.text = String(countDown);
}
stop();
var UI = this;
UI._visible = false;
var UIname = "GageStackBar";
var bWidgetOpen = false;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
var MAX_STACK_NUM = 10;
var currentStack = 0;
var bDanger = false;
var countDown = 0;
var STACK_MODE_NORMAL = 0;
var STACK_MODE_RED = 1;
var STACK_MODE_NONE_FRAME = 1;
var STACK_MODE_NORMAL_FRAME = 2;
var STACK_MODE_RED_FRAME = 3;
var UI_TYPE = "0";
var wizardStack = [0,0,0];
var showGauge;
var customizeData = lib.gamedata.CustomizedUIDataCollection.getInstance();
customizeData.addEventListener(gfx.events.EventTypes.VALUE_CHANGE,this,"valueHandlerChange");
customizeData.valueOf(lib.gamedata.CustomizedUIDataKey.GLADI_STACK_BOOLEAN,this,"gageHandlerShow");
myListener.OnGameEventShowWindow = function(_WindowName, _bShow)
{
   if(_WindowName.toLowerCase() == UIname.toLowerCase())
   {
      bWidgetOpen = _bShow;
      if(bWidgetOpen)
      {
         if(showGauge)
         {
            UI._visible = true;
         }
         else
         {
            UI._visible = false;
         }
      }
      else
      {
         UI._visible = false;
      }
   }
};
myListener.OnGame_GageStackBar_Type = function(type)
{
   UI.gotoAndStop(Number(type) + 1);
   container_mc.UIDrager.setData(UIname,UI,container_mc.lock_mc);
   UI_TYPE = type;
   if(type == "1")
   {
      container_mc.ball0.gotoAndStop(1);
      container_mc.ball1.gotoAndStop(2);
      container_mc.ball2.gotoAndStop(3);
   }
   else
   {
      init();
   }
};
myListener.OnGame_GageStackBar_Update = function(stackNum, stackMode)
{
   if(UI_TYPE == "1")
   {
      container_mc["ball" + stackMode].maskMc.gotoAndStop(Number(stackNum) + 1);
      wizardStack[stackMode] = stackNum;
      if(stackNum == 4)
      {
         container_mc["ball" + stackMode].effectMc.gotoAndPlay(2);
      }
      else
      {
         container_mc["ball" + stackMode].effectMc.gotoAndPlay(1);
      }
      return undefined;
   }
   var _loc3_ = true;
   stackNum = Number(stackNum);
   if(currentStack == stackNum)
   {
      return undefined;
   }
   if(stackNum <= 0)
   {
      _loc3_ = false;
      ClearEvent();
   }
   currentStack = stackNum;
   stackMode = Number(stackMode);
   var _loc4_ = STACK_MODE_NORMAL != stackMode?STACK_MODE_RED_FRAME:STACK_MODE_NORMAL_FRAME;
   SetGage(_loc3_);
};
myListener.OnGame_GageStackBar_SetEffect = function(bEffect)
{
   bEffect = Boolean(Number(bEffect));
   if(bDanger == bEffect)
   {
      return undefined;
   }
   bDanger = bEffect;
   DangerEvent();
};
ToGame_GageStackBar_Init();
