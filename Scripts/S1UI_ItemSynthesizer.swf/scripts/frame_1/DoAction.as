function effectAnimation_SetFlag()
{
   bEffectEnd = true;
   effectAnimation_Start();
}
function effectAnimation_Type(mType, xPos, yPos)
{
   var _loc1_ = container_mc.effectBox.attachMovie("effect" + mType,"effectMc",container_mc.getNextHighestDepth());
   _loc1_._x = xPos;
   _loc1_._y = yPos;
}
function effectAnimation_Start()
{
   if(!(bResult && bEffectEnd))
   {
      return undefined;
   }
   bResult = false;
   bEffectEnd = false;
   var _loc4_ = 170;
   var _loc7_ = 200;
   var _loc6_ = 277;
   var _loc5_ = 0.25;
   if(bonusMessase)
   {
      _loc4_ = 240;
      _loc7_ = 182;
      _loc6_ = 258;
      _loc5_ = 0.3;
   }
   var _loc8_ = resultCount;
   var _loc2_ = lib.util.ExtString.split(String(_loc8_),"");
   var _loc3_ = _loc2_.length;
   container_mc.bonusBox.txt.htmlText = "";
   container_mc.bonusBox.txt.htmlText = container_mc.bonusBox.txt.htmlText + "<img src=\'numP\' width=\'33\' height=\'48\' vspace=\'2\'>";
   var _loc1_ = 0;
   while(_loc1_ < _loc3_)
   {
      container_mc.bonusBox.txt.htmlText = container_mc.bonusBox.txt.htmlText + ("<img src=\'num" + _loc2_[_loc1_] + "\' width=\'33\' height=\'48 vspace=\'-5\'>");
      _loc1_ = _loc1_ + 1;
   }
   gs.TweenLite.to(container_mc.bonusBox,_loc5_,{_alpha:100,_xscale:_loc4_,_yscale:_loc4_});
   effectAnimation_Type(1,-47,45);
   gs.TweenLite.to(container_mc.ItemSynthesizer__1,_loc5_,{_alpha:100,_x:_loc7_,_y:_loc6_,_xscale:_loc4_,_yscale:_loc4_,onComplete:effectAnimation_Result});
}
function effectAnimation_Result()
{
   gs.TweenLite.to(container_mc.bonusBox,0.2,{_xscale:100,_yscale:100});
   gs.TweenLite.to(container_mc.ItemSynthesizer__1,0.2,{_x:218,_y:297,_xscale:100,_yscale:100,onComplete:effectAnimation_End});
}
function effectAnimation_End()
{
   var _loc1_ = container_mc.ItemSynthesizer__1;
   bonusMessase = false;
   _loc1_._alpha = 100;
   _loc1_._x = 218;
   _loc1_._y = 297;
   _loc1_._xscale = 100;
   _loc1_._yscale = 100;
   prevCount = newCount;
   gs.TweenLite.to(container_mc.bonusBox,1,{delay:1,_alpha:0,onComplete:ToGame_ItemSynthesizer_End});
}
function clearEffect()
{
   bEffectEnd = false;
   bResult = false;
   gs.TweenLite.killTweensOf(container_mc.bonusBox,false);
   gs.TweenLite.killTweensOf(container_mc.ItemSynthesizer__1,false);
}
function ToGame_ItemSynthesizer_Init()
{
   fscommand("ToGame_ItemSynthesizer_Init");
}
function ToGame_ItemSynthesizer_TryCount(count)
{
   getURL("FSCommand:ToGame_ItemSynthesizer_TryCount",count);
}
function ToGame_ItemSynthesizer_Start()
{
   var _loc1_ = container_mc.amountSteper.text;
   if(_loc1_ == "" || _loc1_ == undefined)
   {
      return undefined;
   }
   getURL("FSCommand:ToGame_ItemSynthesizer_Start",_loc1_);
}
function ToGame_ItemSynthesizer_End()
{
   fscommand("ToGame_ItemSynthesizer_End");
}
function ToGame_ItemSynthesizer_Stop()
{
   if(!processFlag)
   {
      ToGame_ItemSynthesizer_Close();
   }
   else
   {
      fscommand("ToGame_ItemSynthesizer_Stop");
   }
}
function ToGame_ItemSynthesizer_Close()
{
   fscommand("ToGame_ItemSynthesizer_Close");
}
var UI = this;
UI._visible = false;
var UIname = "ItemSynthesizer";
var prevCount = 0;
var newCount = 0;
var processFlag = false;
var bonusMessase = false;
var STOP_STR = lib.util.UIString.getUIString("$472001");
var CLOSE_STR = lib.util.UIString.getUIString("$472002");
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
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
         clearEffect();
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
      clearEffect();
      UI._visible = false;
   }
};
var STATE_TYPE_NORMAL = 0;
var STATE_TYPE_IMPOSSIBLE = 1;
var STATE_TYPE_ALPHA = 2;
var STATE_ALPHA_VALUE = 50;
myListener.OnGame_ItemSynthesizer_SetMaterialItem = function(_icon, grade, amount, stateType)
{
   var _loc1_ = container_mc.ItemSynthesizer__0;
   grade = Number(grade);
   stateType = Number(stateType);
   if(_loc1_.iconName == _icon && _loc1_.grade == grade)
   {
      _loc1_.num = amount;
      _loc1_.impossible = STATE_TYPE_IMPOSSIBLE == stateType;
      _loc1_.Icon._alpha = STATE_TYPE_ALPHA != stateType?100:STATE_ALPHA_VALUE;
      return undefined;
   }
   _loc1_.remove();
   _loc1_.drag = false;
   _loc1_.effect = false;
   _loc1_.iconName = _icon;
   _loc1_.grade = grade;
   _loc1_.num = amount;
   _loc1_.draw(_icon);
   _loc1_.impossible = STATE_TYPE_IMPOSSIBLE == stateType;
   _loc1_.Icon._alpha = STATE_TYPE_ALPHA != stateType?100:STATE_ALPHA_VALUE;
   lib.manager.ToolTip.add(_loc1_.SLOT,0,6,_loc1_.Icon);
};
myListener.OnGame_ItemSynthesizer_SeProductItem = function(_icon, grade, amount, stateType)
{
   var _loc1_ = container_mc.ItemSynthesizer__1;
   stateType = Number(stateType);
   if(_loc1_.iconName == _icon && _loc1_.grade == grade)
   {
      _loc1_.num = amount;
      _loc1_.impossible = STATE_TYPE_IMPOSSIBLE == stateType;
      _loc1_.Icon._alpha = STATE_TYPE_ALPHA != stateType?100:STATE_ALPHA_VALUE;
      newCount = amount;
      return undefined;
   }
   prevCount = amount;
   gs.TweenLite.killTweensOf(_loc1_,false);
   _loc1_._x = 218;
   _loc1_._y = 297;
   _loc1_._xscale = _loc1_._yscale = 100;
   _loc1_._alpha = 100;
   _loc1_.remove();
   _loc1_.drag = false;
   _loc1_.effect = false;
   _loc1_.iconName = _icon;
   _loc1_.grade = grade;
   _loc1_.num = amount;
   _loc1_.draw(_icon);
   _loc1_.impossible = STATE_TYPE_IMPOSSIBLE == stateType;
   _loc1_.Icon._alpha = STATE_TYPE_ALPHA != stateType?100:STATE_ALPHA_VALUE;
   lib.manager.ToolTip.add(_loc1_.SLOT,1,6,_loc1_.Icon);
};
myListener.OnGame_ItemSynthesizer_SetCounter = function(currentCount, min, max)
{
   container_mc.amountSteper.setNumber(min,max,currentCount);
};
myListener.OnGame_ItemSynthesizer_SetBtnEnable = function(btnIndex, enable)
{
   var _loc1_ = btnIndex != "0"?cancelBtn:startBtn;
   enable = enable == "1";
   _loc1_.setEnabled(enable);
};
var resultCount = 0;
var bEffectEnd = false;
var bResult = false;
myListener.OnGame_ItemSynthesizer_Start = function()
{
   processFlag = true;
   bEffectEnd = false;
   bResult = false;
   gs.TweenLite.killTweensOf(container_mc.bonusBox,false);
   gs.TweenLite.killTweensOf(container_mc.ItemSynthesizer__1,false);
   effectAnimation_Type(0,-19,74);
   container_mc.bonusBox._alpha = 0;
   gs.TweenLite.to(container_mc.ItemSynthesizer__1,1,{_alpha:0,_x:223,_y:302,_xscale:80,_yscale:80,onComplete:effectAnimation_SetFlag});
   container_mc.amountSteper.hitTestDisable = true;
   cancelBtn.setText(STOP_STR);
   cancelBtn.setRelease(ToGame_ItemSynthesizer_Stop);
};
myListener.OnGame_ItemSynthesizer_SetResult = function(count)
{
   bResult = true;
   resultCount = Number(count);
   effectAnimation_Start();
};
myListener.OnGame_ItemSynthesizer_End = function()
{
   bResult = false;
   bEffectEnd = false;
   processFlag = false;
   container_mc.amountSteper.hitTestDisable = false;
   cancelBtn.setText(CLOSE_STR);
   cancelBtn.setRelease(ToGame_ItemSynthesizer_Close);
};
myListener.OnGame_ItemSynthesizer_Bonus = function()
{
   bonusMessase = true;
   effectAnimation_Start();
};
var startBtn = new lib.util.TxtBtn(container_mc.sBtn,container_mc.sTxt);
startBtn.setRelease(ToGame_ItemSynthesizer_Start);
var cancelBtn = new lib.util.TxtBtn(container_mc.cBtn,container_mc.cTxt);
cancelBtn.setRelease(ToGame_ItemSynthesizer_Close);
startBtn.setTextColor(lib.info.TextColor.BTN_UINIQUE_NORMAL,lib.info.TextColor.BTN_UINIQUE_OVER,lib.info.TextColor.BTN_UINIQUE_PRESS,lib.info.TextColor.BTN_UINIQUE_DISABLE);
cancelBtn.setTextColor(lib.info.TextColor.BTN_UINIQUE_NORMAL,lib.info.TextColor.BTN_UINIQUE_OVER,lib.info.TextColor.BTN_UINIQUE_PRESS,lib.info.TextColor.BTN_UINIQUE_DISABLE);
ToGame_ItemSynthesizer_Init();
