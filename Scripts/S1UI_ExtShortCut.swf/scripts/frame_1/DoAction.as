function setUImode(bShow)
{
   container_mc.bgLayer.clear();
   if(bShow)
   {
      lib.display.DrawBitmapData.draw(container_mc.bgLayer,shortCutBgBm,0,0,0,0,717,134);
   }
}
function slotBuild()
{
   var _loc1_ = 0;
   while(_loc1_ < NUM_SLOT)
   {
      var _loc2_ = _loc1_ + startIndex;
      var _loc6_ = _loc1_ % lineNum * SPACE + SLOTINITX;
      var _loc4_ = int(_loc1_ / lineNum) * SPACE + SLOTINITY;
      var _loc5_ = createSlotBtn(_loc2_,_loc6_,_loc4_);
      var _loc8_ = createTextfield("keyFd__" + _loc2_,_loc6_ + 2,_loc4_ + 3,50,21,keyTextFormat);
      var _loc7_ = createTextfield("amountFd__" + _loc2_,_loc6_ + 1,_loc4_ + 34,50,28,amountTextFormat);
      var _loc3_ = {pX:_loc6_,pY:_loc4_};
      slotData[_loc1_] = _loc3_;
      _loc1_ = _loc1_ + 1;
   }
}
function createSlotBtn(slotIndex, pX, pY)
{
   var _loc2_ = container_mc.slotLayer.attachMovie("btn","shortcut__" + slotIndex,container_mc.slotLayer.getNextHighestDepth());
   _loc2_.btnName = "SHORTCUTSLOTBTN";
   _loc2_.index = slotIndex;
   _loc2_.trackAsMenu = true;
   _loc2_._x = pX;
   _loc2_._y = pY;
   setSlotEvent(_loc2_);
   _loc2_.GetName = function()
   {
      return this._name;
   };
   return _loc2_;
}
function setRollOver(btn)
{
   btn.onRollOver = function()
   {
      if(dragFlag || _root.gbDraggingTile)
      {
         var _loc4_ = this._x;
         var _loc3_ = this._y;
         drawSlots();
         lib.display.DrawBitmapData.draw(container_mc.slotLayer,"slotOver",_loc4_,_loc3_,0,0,55,55);
      }
   };
}
function setRollOut(btn)
{
   btn.onRollOut = function()
   {
      if(dragFlag)
      {
         drawSlots();
      }
   };
}
function setPress(btn)
{
   btn.onPress = function()
   {
      pressedBtn = this;
   };
}
function setDragOut(btn)
{
   btn.onDragOut = function()
   {
      if(lockFlag)
      {
         return undefined;
      }
      if(pressedBtn == this)
      {
         dragFlag = true;
         if(this.TEX != undefined)
         {
            var _loc3_ = this.index - startIndex;
            var _loc5_ = this._x + 2;
            var _loc4_ = this._y + 2;
            btnImpossible = slotData[_loc3_].disable;
            slotData[_loc3_].disable = 1;
            drawSlots();
            _global.StartIconDrag(this,this.TEX);
         }
      }
   };
}
function setReleaseOutSide(btn)
{
   btn.onReleaseOutside = function()
   {
      dragFlag = false;
      pressedBtn = null;
      drawSlots();
   };
}
function setRelease(btn)
{
   btn.onRelease = function()
   {
      pressedBtn = null;
      dragFlag = false;
      onRollOver(this.index);
   };
}
function setSlotEvent(btn)
{
   setRollOver(btn);
   setRollOut(btn);
   setPress(btn);
   setDragOut(btn);
   setReleaseOutSide(btn);
   setRelease(btn);
}
function createTextfield(tname, tx, ty, tw, th, tforamt)
{
   var _loc1_ = container_mc[tname];
   if(_loc1_ == undefined)
   {
      _loc1_ = container_mc.createTextField(tname,container_mc.getNextHighestDepth(),tx,ty,tw,th);
      _loc1_.hitTestDisable = true;
      _loc1_.border = false;
      _loc1_.background = false;
      _loc1_.selectable = false;
      _loc1_.wordWrap = false;
      _loc1_.type = "dynamic";
      _loc1_.multiline = false;
      _loc1_.html = true;
      _loc1_.antiAliasType = "normal";
      _loc1_.setNewTextFormat(tforamt);
      _loc1_._visible = false;
      _loc1_.shadowColor = 0;
      _loc1_.shadowBlurX = 1.7;
      _loc1_.shadowBlurY = 1.7;
      _loc1_.shadowStrength = 5;
      _loc1_.shadowDistance = 0;
      _loc1_.shadowAngle = 90;
   }
   _loc1_._x = tx;
   _loc1_._y = ty;
   return _loc1_;
}
function drawSlots()
{
   var _loc6_ = container_mc.slotLayer;
   _loc6_.clear();
   var _loc1_ = 0;
   while(_loc1_ < NUM_SLOT)
   {
      var _loc3_ = slotData[_loc1_].pX;
      var _loc2_ = slotData[_loc1_].pY;
      var _loc7_ = slotData[_loc1_].iconBm;
      var _loc5_ = slotData[_loc1_].grade;
      var _loc4_ = slotData[_loc1_].disable;
      lib.display.DrawBitmapData.draw(_loc6_,_loc7_,_loc3_ + 2,_loc2_ + 2,0,0,52,52,0.785);
      if(_loc5_ > 0)
      {
         lib.display.DrawBitmapData.draw(_loc6_,UI["gradeBm" + _loc5_],_loc3_ + 4,_loc2_ + 3,0,0,16,16);
      }
      if(_loc4_ > 0)
      {
         lib.display.DrawBitmapData.draw(_loc6_,UI["disableBm" + _loc4_],_loc3_ + 3,_loc2_ + 2,0,0,50,50);
      }
      _loc1_ = _loc1_ + 1;
   }
}
function clearSlot(slotIndex)
{
   slotIndex = Number(slotIndex);
   var _loc2_ = slotIndex - startIndex;
   delete container_mc.slotLayer["shortcut__" + slotIndex].TEX;
   var _loc5_ = slotData[_loc2_].pX;
   var _loc4_ = slotData[_loc2_].pY;
   var _loc3_ = {pX:_loc5_,pY:_loc4_};
   slotData[_loc2_] = [];
   slotData[_loc2_] = _loc3_;
   drawSlots();
   container_mc.slotLayer["FX_ACTIVE" + slotIndex].removeMovieClip();
   container_mc["amountFd__" + slotIndex]._visible = false;
   container_mc["amountFd__" + slotIndex].text = "";
   coolTimeManager.removeCoolTimeInstance(container_mc["coolTime_ani" + slotIndex]);
   container_mc["effect_use" + slotIndex].removeMovieClip();
}
function setUseEffect(slotIndex)
{
   var _loc2_ = slotIndex - startIndex;
   var _loc4_ = slotData[_loc2_].pX;
   var _loc3_ = slotData[_loc2_].pY;
   var _loc1_ = container_mc.slotLayer["effect_use" + slotIndex];
   if(_loc1_ != undefined)
   {
      _loc1_.removeMovieClip();
   }
   _loc1_ = container_mc.slotLayer.attachMovie("useMc","effect_use" + slotIndex,container_mc.slotLayer.getNextHighestDepth());
   lib.display.DrawBitmapData.draw(_loc1_,slotData[_loc2_].iconName,0,0,0,0,52,52,0.785);
   _loc1_._width = _loc1_._height = 30;
   _loc1_._x = _loc4_ + 10;
   _loc1_._y = _loc3_ + 10;
   gs.TweenLite.to(_loc1_,0.5,{_x:_loc4_ + 3,_y:_loc3_ + 3,_width:49,_height:49,ease:gs.easing.Bounce.easeOut,overwrite:1,onComplete:onFinish,onCompleteParams:[_loc1_]});
}
function onFinish(mc)
{
   mc.removeMovieClip();
}
function setEffectMcMode()
{
   var _loc1_ = 0;
   while(_loc1_ < NUM_SLOT)
   {
      var _loc2_ = _loc1_ + startIndex;
      var _loc4_ = slotData[_loc1_].pX;
      var _loc3_ = slotData[_loc1_].pY;
      var _loc6_ = container_mc["coolTime_ani" + _loc2_];
      _loc6_._x = _loc4_ + 3;
      _loc6_._y = _loc3_ + 3;
      var _loc5_ = container_mc.slotLayer["FX_ACTIVE" + _loc2_];
      _loc5_._x = _loc4_ - 4;
      _loc5_._y = _loc3_ - 6;
      _loc1_ = _loc1_ + 1;
   }
}
function setSlotPos()
{
   var _loc1_ = 0;
   while(_loc1_ < NUM_SLOT)
   {
      var _loc4_ = _loc1_ + startIndex;
      if(transformState == 0 || transformState == 2)
      {
         var _loc3_ = int(_loc1_ / lineNum) * SPACE * -1 + SPACE + SLOTINITY;
         var _loc2_ = _loc1_ % lineNum * SPACE + SLOTINITX;
      }
      else
      {
         _loc3_ = _loc1_ % lineNum * SPACE + SLOTINITX;
         _loc2_ = int(_loc1_ / lineNum) * SPACE + SLOTINITY;
      }
      var _loc5_ = container_mc.slotLayer["shortcut__" + _loc4_];
      var _loc7_ = container_mc["keyFd__" + _loc4_];
      var _loc6_ = container_mc["amountFd__" + _loc4_];
      _loc5_._x = _loc3_;
      _loc5_._y = _loc2_;
      _loc7_._x = _loc3_ + 3;
      _loc7_._y = _loc2_ + 3;
      _loc6_._x = _loc3_ + 1;
      _loc6_._y = _loc2_ + 34;
      slotData[_loc1_].pX = _loc3_;
      slotData[_loc1_].pY = _loc2_;
      _loc1_ = _loc1_ + 1;
   }
}
function checkPosAndTransform()
{
   var _loc3_ = UI._x;
   preTransformState = transformState;
   if(preTransformState == 2)
   {
      var _loc5_ = lib.info.AlignInfo.uiScale(UIname,UI);
      var _loc4_ = lib.info.AlignInfo.uiScaleLimit(lib.info.AlignInfo.scaleRatio * _loc5_);
      _loc3_ = UI._x + 134 * _loc4_;
   }
   var _loc1_ = lib.info.AlignInfo.xPixelToRatio(_loc3_);
   var _loc2_ = leftMargin * UI._xscale;
   if(_loc1_ < _loc2_)
   {
      transformState = 0;
   }
   else if(_loc1_ >= _loc2_ && _loc1_ < 95)
   {
      transformState = 1;
   }
   else if(_loc1_ >= 95)
   {
      transformState = 2;
   }
   if(preTransformState == transformState)
   {
      return undefined;
   }
   if(transformState == 0)
   {
      sd.saveData(lib.gamedata.CustomizedUIDataKey.CHAT_WHISPER_VISIBLE,random(999));
      container_mc.bgLayer.UIDrager.adjustDragLimit(0,0,0,-10);
      UIdata.PA = 1;
      container_mc.bgLayer._rotation = 90;
      container_mc.bgLayer._x = 137;
      container_mc.text_pageNum._x = 35;
      container_mc.text_pageNum._y = 31;
      setSlotPos();
      setEffectMcMode();
      drawSlots();
   }
   else if(transformState == 1)
   {
      container_mc.bgLayer._rotation = 0;
      container_mc.bgLayer._x = 0;
      container_mc.text_pageNum._x = 20;
      container_mc.text_pageNum._y = 46;
      setSlotPos();
      setEffectMcMode();
      drawSlots();
      container_mc.bgLayer.UIDrager.adjustDragLimit(0,hit._width,0,7);
      UIdata.PA = 8;
   }
   else if(transformState == 2)
   {
      container_mc.bgLayer._rotation = 90;
      container_mc.bgLayer._x = 137;
      container_mc.text_pageNum._x = 35;
      container_mc.text_pageNum._y = 31;
      setSlotPos();
      setEffectMcMode();
      drawSlots();
      container_mc.bgLayer.UIDrager.adjustDragLimit(0,hit._width - 134,0,-10);
      UIdata.PA = 8;
   }
   if(dragPressed)
   {
      container_mc.bgLayer.UIDrager.onPress();
   }
}
var strList;
var UI = this;
UI._visible = false;
var bWidgetOpen = false;
var UIname = "ExtShortCut";
setUImode(false);
var slotData = new Array();
var coolTimeManager = lib.util.CoolTimeManger.getInstance();
container_mc.bgLayer.UIDrager.setData(UIname,UI,container_mc.lock_mc);
container_mc.bgLayer.UIDrager.adjustDragLimit(-60,0,0,11);
var NUM_SLOT = 24;
var startIndex = 50;
var lineNum = 12;
var lockFlag = false;
var dragFlag = false;
var SLOTINITX = 17;
var SLOTINITY = 9;
var SPACE = 57;
var slotRow = 12;
var slotColum = 2;
var keyTextFormat = new TextFormat("$NormalFont",12,16777215,false,false,false,null,null,"right",0,0,0,0);
var amountTextFormat = new TextFormat("$NormalFont",16,16777215,false,false,false,null,null,"right",0,0,0,0);
var shortCutBgBm = flash.display.BitmapData.loadBitmap("bg");
var slotFrameBm = flash.display.BitmapData.loadBitmap("slotFrame");
var slotOverBm = flash.display.BitmapData.loadBitmap("slotOver");
var disableBm1 = flash.display.BitmapData.loadBitmap("slotImpossible");
var disableBm2 = flash.display.BitmapData.loadBitmap("slotDisable");
var gradeBm1 = flash.display.BitmapData.loadBitmap("grade1");
var gradeBm2 = flash.display.BitmapData.loadBitmap("grade2");
var gradeBm3 = flash.display.BitmapData.loadBitmap("grade3");
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
myListener.OnGameEventShowWindow = function(widgetName, bShow)
{
   if(widgetName.toLowerCase() == UIname.toLowerCase())
   {
      var _loc2_ = new lib.controls.CustomScaleEvent();
      _loc2_.CustomScaleEventCheck(UI,UIname);
      bWidgetOpen = Number(bShow);
      if(bWidgetOpen)
      {
         UI._visible = true;
         setUImode(_global.gbUIMode);
      }
      else
      {
         UI._visible = false;
      }
   }
};
myListener.OnGameEventChangeUIMode = function(bShow)
{
   bShow = Number(bShow);
   myListener.OnGame_ShortCut_SetLock(!bShow);
   setUImode(bShow);
   if(bShow)
   {
      myListener.OnGame_MouseDown = function(button, target)
      {
         button = Number(button);
         delete tempDragOveredBtn;
         if(button == 2)
         {
            if(target.btnName == "SHORTCUTSLOTBTN")
            {
               var targetIndex = target.index;
               ToGameUseShortCut(targetIndex,0);
            }
         }
         myListener.OnGame_MouseUp = function(button, target)
         {
            if(pressedBtn && dragFlag)
            {
               var _loc1_ = pressedBtn.index - startIndex;
               slotData[_loc1_].disable = btnImpossible;
               btnImpossible = 0;
               pressedBtn = null;
               dragFlag = false;
               drawSlots();
            }
            button = Number(button);
            if(button == 2)
            {
               ToGameUseShortCut(targetIndex,1);
            }
            delete myListener.OnGame_MouseUp;
         };
      };
      myListener.OnGame_MouseMove = function(target)
      {
         if(_root.gbDraggingTile || dragFlag)
         {
            if(target.btnName == "SHORTCUTSLOTBTN")
            {
               if(tempDragOveredBtn == target)
               {
                  return undefined;
               }
               tempDragOveredBtn.onRollOut();
               if(target.isPressed)
               {
                  return undefined;
               }
               tempDragOveredBtn = target;
               target.onRollOver();
            }
         }
      };
   }
   else
   {
      delete myListener.OnGame_MouseDown;
      delete myListener.OnGame_MouseUp;
      delete myListener.OnGame_MouseMove;
   }
};
var tempDragOveredBtn;
var pressedBtn = null;
var btnImpossible = 0;
slotBuild();
myListener.OnGameEventSetShortCut = function(slotIndex, iconName, itemAmount, grade)
{
   slotIndex = Number(slotIndex);
   if(slotIndex < startIndex)
   {
      return undefined;
   }
   var _loc1_ = slotIndex - startIndex;
   var _loc3_ = container_mc["amountFd__" + slotIndex];
   _loc3_._visible = itemAmount != -1 && itemAmount != undefined;
   _loc3_.text = itemAmount;
   var _loc2_ = container_mc.slotLayer["shortcut__" + slotIndex];
   lib.manager.ToolTip.add(_loc2_,slotIndex,6);
   _loc2_.TEX = iconName;
   if(slotData[_loc1_].iconName == iconName && slotData[_loc1_].grade == grade)
   {
      return undefined;
   }
   if(slotData[_loc1_].iconName != iconName)
   {
      var _loc10_ = flash.display.BitmapData.loadBitmap(iconName);
   }
   var _loc9_ = slotData[_loc1_].pX;
   var _loc8_ = slotData[_loc1_].pY;
   var _loc4_ = {slotIndex:slotIndex,iconName:iconName,grade:grade,iconBm:_loc10_,pX:_loc9_,pY:_loc8_};
   slotData[_loc1_] = _loc4_;
   drawSlots();
};
myListener.OnGame_ShortCut_SetDisable = function(slotIndex, type)
{
   slotIndex = Number(slotIndex);
   if(slotIndex < startIndex)
   {
      return undefined;
   }
   var _loc2_ = slotIndex - startIndex;
   type = Number(type);
   if(slotData[_loc2_].disable == type)
   {
      return undefined;
   }
   slotData[_loc2_].disable = type;
   drawSlots();
};
myListener.OnGameEventClearShortCut = function(slotIndex)
{
   slotIndex = Number(slotIndex);
   if(slotIndex < startIndex)
   {
      return undefined;
   }
   var _loc2_ = container_mc["amountFd__" + slotIndex];
   _loc2_._visible = false;
   clearSlot(slotIndex);
   var _loc3_ = container_mc.slotLayer["shortcut__" + slotIndex];
   lib.manager.ToolTip.remove(_loc3_);
};
myListener.OnGame_ShortCut_SetKeyMap = function(dataList)
{
   var _loc5_ = dataList.split("\t");
   if(_loc5_[_loc5_.length - 1] == "0" || _loc5_[_loc5_.length - 1] == "undefined" || _loc5_[_loc5_.length - 1] == "")
   {
      _loc5_.splice(_loc5_.length - 1,1);
   }
   var _loc6_ = _loc5_.length;
   var _loc2_ = 0;
   while(_loc2_ < _loc6_)
   {
      if(_loc2_ >= startIndex && _loc2_ < startIndex + NUM_SLOT)
      {
         var _loc3_ = _loc5_[_loc2_];
         var _loc4_ = container_mc["keyFd__" + _loc2_];
         var _loc1_ = lib.info.KeyMap.toKeyCode(_loc3_);
         if("LeftMouseButton" == _loc3_)
         {
            _loc1_ = "L-Click";
         }
         if("RightMouseButton" == _loc3_)
         {
            _loc1_ = "R-Click";
         }
         if(lib.util.ExtString.isOverLenght(_loc4_,_loc1_))
         {
            _loc1_ = "";
         }
         if(_loc1_ == undefined || _loc1_ == "")
         {
            _loc1_ = _loc3_;
         }
         _loc4_.text = _loc1_;
         _loc4_._visible = true;
      }
      _loc2_ = _loc2_ + 1;
   }
};
myListener.OnGameEventUseShortCutSuccessed = function(slotIndex)
{
   slotIndex = Number(slotIndex);
   if(slotIndex < startIndex)
   {
      return undefined;
   }
   setUseEffect(slotIndex);
};
myListener.OnGame_ShortCut_CoolTime = function(slotIndex, remain, total)
{
   slotIndex = Number(slotIndex);
   if(slotIndex < startIndex)
   {
      return undefined;
   }
   var _loc4_ = slotIndex - startIndex;
   remain = Number(remain);
   total = Number(total);
   var _loc8_ = slotData[_loc4_].pX;
   var _loc7_ = slotData[_loc4_].pY;
   var container = container_mc;
   var _loc2_ = container["coolTime_ani" + slotIndex];
   var iconName = slotData[_loc4_].iconName;
   if(_loc2_ == undefined)
   {
      _loc2_ = container.attachMovie("coolTime_ani","coolTime_ani" + slotIndex,container.getNextHighestDepth());
      _loc2_.iconName = iconName;
      _loc2_.hitTestDisable = true;
      _loc2_._x = _loc8_ + 1;
      _loc2_._y = _loc7_ + 1;
      _loc2_.onFinished = function()
      {
         var _loc2_ = container.attachMovie("effect_standby","effect_standby" + slotIndex,container.getNextHighestDepth());
         _loc2_._x = this._x;
         _loc2_._y = this._y;
         lib.util.DrawBitmap.makeMcAndDraw(_loc2_.a_mc,this.iconName,50,50);
         lib.util.DrawBitmap.makeMcAndDraw(_loc2_.b_mc,this.iconName,50,50);
         lib.util.DrawBitmap.makeMcAndDraw(_loc2_.c_mc,this.iconName,50,50);
      };
   }
   if(remain <= 0 || total <= 0)
   {
      if(_loc2_.coolTime != undefined)
      {
         coolTimeManager.removeCoolTimeInstance(_loc2_);
         var _loc3_ = container.attachMovie("effect_standby","effect_standby" + slotIndex,container.getNextHighestDepth());
         _loc3_.blendMode = "add";
         _loc3_.hitTestDisable = true;
         _loc3_._x = _loc2_._x;
         _loc3_._y = _loc2_._y;
         lib.util.DrawBitmap.makeMcAndDraw(_loc3_.a_mc,iconName,60,60);
         lib.util.DrawBitmap.makeMcAndDraw(_loc3_.b_mc,iconName,60,60);
         lib.util.DrawBitmap.makeMcAndDraw(_loc3_.c_mc,iconName,60,60);
      }
   }
   else
   {
      _loc2_.setCoolTime(remain,total);
      _loc2_.iconName = iconName;
      coolTimeManager.addCoolTimeInstance(_loc2_);
   }
};
myListener.OnGame_ShortCut_SetToggle = function(slotIndex, bTrue)
{
   slotIndex = Number(slotIndex);
   if(slotIndex < startIndex)
   {
      return undefined;
   }
   var _loc2_ = slotIndex - startIndex;
   bTrue = Number(bTrue);
   if(bTrue == slotData[_loc2_].bToggle)
   {
      return undefined;
   }
   var _loc7_ = slotData[_loc2_].pX;
   var _loc6_ = slotData[_loc2_].pY;
   slotData[_loc2_].bToggle = bTrue;
   var _loc3_ = container_mc.slotLayer;
   if(bTrue)
   {
      if(_loc3_["FX_ACTIVE" + slotIndex] == undefined)
      {
         var _loc5_ = _loc3_.attachMovie("FX_ACTIVE","FX_ACTIVE" + slotIndex,_loc3_.getNextHighestDepth());
         _loc5_._x = _loc7_ - 4;
         _loc5_._y = _loc6_ - 6;
         _loc5_.hitTestDisable = true;
      }
   }
   else
   {
      _loc3_["FX_ACTIVE" + slotIndex].removeMovieClip();
   }
};
container_mc.bgLayer.UIDrager.onPress2 = function()
{
   dragPressed = true;
   this.onEnterFrame = function()
   {
      checkPosAndTransform();
   };
};
container_mc.bgLayer.UIDrager.onRelease2 = function()
{
   dragPressed = false;
   delete this.onEnterFrame;
   if(transformState == 0)
   {
      lib.info.AlignInfo.savePos(UI,1,UI._x);
   }
};
var dragPressed = false;
var slotWidth = container_mc.SC_default.shortcut__0._width - 3;
var preTransformState = null;
var transformState = null;
var leftMargin = 0.05;
container_mc.bgLayer.UIDrager.onRelease2 = function()
{
   if(transformState == 2)
   {
      var _loc3_ = lib.info.AlignInfo.uiScale(UIname,UI);
      var _loc2_ = lib.info.AlignInfo.uiScaleLimit(lib.info.AlignInfo.scaleRatio * _loc3_);
      lib.Debuger.trace("lib.info.AlignInfo.horizontalSpace : " + lib.info.AlignInfo.horizontalSpace);
      var _loc1_ = lib.info.AlignInfo.horizontalSpace + UI._x + 134 * _loc2_;
      lib.Debuger.trace("sampleX : " + _loc1_);
      lib.info.AlignInfo.savePos(UI,1,_loc1_);
   }
};
var firtstPositioning = true;
myListener.OnGame_SetUIPosition = function(bLocked, _UIName, posXRatio, posYRatio)
{
   if(_UIName.toLowerCase() == UIname.toLowerCase())
   {
      if(posXRatio >= 95)
      {
         var _loc2_ = lib.info.AlignInfo.uiScale(UIname,UI);
         var _loc1_ = lib.info.AlignInfo.uiScaleLimit(lib.info.AlignInfo.scaleRatio * _loc2_);
         UI._x = UI._x - _loc1_ * 134;
         firtstPositioning = false;
         transformState = 2;
         container_mc.bgLayer._rotation = 90;
         container_mc.bgLayer._x = 137;
         container_mc.text_pageNum._x = 35;
         container_mc.text_pageNum._y = 31;
         setSlotPos();
         setEffectMcMode();
         drawSlots();
         container_mc.bgLayer.UIDrager.adjustDragLimit(0,hit._width - 134,0,-10);
         UIdata.PA = 8;
      }
      checkPosAndTransform();
   }
   fscommand("OnGame_SetUIPosition");
};
myListener.OnGame_ResetUIPosition = function()
{
   UIdata.PA = 8;
   if(transformState == 0)
   {
      UI._rotation = 0;
   }
   checkPosAndTransform();
   fscommand("OnGame_ResetUIPosition");
};
myListener.OnGame_ChangeStageSize = function(w, h)
{
   checkPosAndTransform();
   fscommand("OnGame_ChangeStageSize");
};
