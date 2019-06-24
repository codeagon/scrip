function setItemGradeBitmapData()
{
   var _loc3_ = flash.display.BitmapData.loadBitmap("grade1");
   var _loc1_ = flash.display.BitmapData.loadBitmap("grade2");
   var _loc2_ = flash.display.BitmapData.loadBitmap("grade3");
   itemGradeBm.push(_loc3_);
   itemGradeBm.push(_loc1_);
   itemGradeBm.push(_loc2_);
}
function setUImode(bShow)
{
   setBgLayer(bShow);
   container_mc.titleFd._visible = bShow;
}
function setBgLayer(bShow)
{
   container_mc.bgLayer.clear();
   var _loc2_ = 0;
   if(slotTotalCount > slotTotalCount2)
   {
      _loc2_ = slotTotalCount;
   }
   else
   {
      _loc2_ = slotTotalCount2;
   }
   if(bShow)
   {
      lib.display.DrawBitmapData.draw(container_mc.bgLayer,iconBm,14,0,0,0,26,26);
      var _loc1_ = 26 + _loc2_ * SPACE;
      if(slotTotalCount > 0 && slotTotalCount2 > 0)
      {
         lib.display.DrawBitmapData.draw(container_mc.bgLayer,bgBm10,0,0,0,0,_loc1_ - 14,156);
         lib.display.DrawBitmapData.draw(container_mc.bgLayer,bgBm11,_loc1_ - 14,0,0,0,14,156);
      }
      else
      {
         lib.display.DrawBitmapData.draw(container_mc.bgLayer,bgBm0,0,0,0,0,_loc1_ - 14,96);
         lib.display.DrawBitmapData.draw(container_mc.bgLayer,bgBm1,_loc1_ - 14,0,0,0,14,96);
      }
   }
}
function clearSlot(slotIndex)
{
   var _loc3_ = null;
   var _loc5_ = null;
   var _loc4_ = null;
   var _loc13_ = 0;
   var _loc11_ = 0;
   container_mc.slotLayer.clear();
   if(slotIndex == undefined)
   {
      var _loc2_ = 0;
      while(_loc2_ < slotTotalCount)
      {
         _loc3_ = container_mc.slotLayer["PCInventory__" + _loc2_];
         _loc5_ = container_mc["keyFd__" + _loc2_];
         _loc4_ = container_mc["amountFd__" + _loc2_];
         lib.manager.ToolTip.remove(_loc3_);
         _loc13_ = slotData[_loc2_].pX;
         _loc11_ = slotData[_loc2_].pY;
         var _loc8_ = {pX:_loc13_,pY:_loc11_,disable:0,bActive:0,remain:0,total:0};
         slotData[_loc2_] = _loc8_;
         _loc5_.text = _loc4_.text = "";
         _loc3_._visible = _loc5_._visible = _loc4_._visible = false;
         container_mc.slotLayer["FX_ACTIVE" + _loc2_].removeMovieClip();
         coolTimeManager.removeCoolTimeInstance(container_mc["coolTime_ani" + _loc2_]);
         container_mc.slotLayer["effect_use" + _loc2_].removeMovieClip();
         _loc2_ = _loc2_ + 1;
      }
      if(slotTotalCount2 == 0)
      {
         return undefined;
      }
      var _loc7_ = slotTotalCount2 + lineMax;
      var _loc1_ = lineMax;
      while(_loc1_ < _loc7_)
      {
         _loc3_ = container_mc.slotLayer["PCInventory__" + _loc1_];
         _loc5_ = container_mc["keyFd__" + _loc1_];
         _loc4_ = container_mc["amountFd__" + _loc1_];
         lib.manager.ToolTip.remove(_loc3_);
         _loc13_ = slotData[_loc1_].pX;
         _loc11_ = slotData[_loc1_].pY;
         _loc8_ = {pX:_loc13_,pY:_loc11_,disable:0,bActive:0,remain:0,total:0};
         slotData[_loc1_] = _loc8_;
         _loc5_.text = _loc4_.text = "";
         _loc3_._visible = _loc5_._visible = _loc4_._visible = false;
         container_mc.slotLayer["FX_ACTIVE" + _loc1_].removeMovieClip();
         coolTimeManager.removeCoolTimeInstance(container_mc["coolTime_ani" + _loc1_]);
         container_mc.slotLayer["effect_use" + _loc1_].removeMovieClip();
         _loc1_ = _loc1_ + 1;
      }
   }
   else
   {
      _loc3_ = container_mc.slotLayer["PCInventory__" + slotIndex];
      _loc5_ = container_mc["keyFd__" + slotIndex];
      _loc4_ = container_mc["amountFd__" + slotIndex];
      lib.manager.ToolTip.remove(_loc3_);
      _loc13_ = slotData[slotIndex].pX;
      _loc11_ = slotData[slotIndex].pY;
      _loc8_ = {pX:_loc13_,pY:_loc11_,disable:0,bActive:0,remain:0,total:0};
      slotData[slotIndex] = _loc8_;
      _loc5_.text = _loc4_.text = "";
      _loc3_._visible = _loc5_._visible = _loc4_._visible = false;
      container_mc.slotLayer["FX_ACTIVE" + slotIndex].removeMovieClip();
      coolTimeManager.removeCoolTimeInstance(container_mc["coolTime_ani" + slotIndex]);
      container_mc.slotLayer["effect_use" + slotIndex].removeMovieClip();
      drawSlots();
   }
}
function DragSize()
{
   var _loc1_ = 0;
   var _loc2_ = 95;
   if(slotTotalCount > slotTotalCount2)
   {
      _loc1_ = 26 + slotTotalCount * SPACE;
   }
   else
   {
      _loc1_ = 26 + slotTotalCount2 * SPACE;
   }
   if(slotTotalCount > 0 && slotTotalCount2 > 0)
   {
      _loc2_ = 156;
   }
   container_mc.UIDrager._width = _loc1_;
   container_mc.UIDrager._height = _loc2_;
   container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
   setBgLayer(true);
   container_mc.titleFd._visible = true;
}
function createTextfield(tname, tx, ty, tw, th, tforamt)
{
   var _loc1_ = container_mc.createTextField(tname,container_mc.getNextHighestDepth(),tx,ty,tw,th);
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
   _loc1_._x = tx;
   _loc1_._y = ty;
   return _loc1_;
}
function createSlotBtn(slotIndex, pX, pY)
{
   var _loc2_ = container_mc.slotLayer.attachMovie("btn","PCInventory__" + slotIndex,container_mc.slotLayer.getNextHighestDepth());
   _loc2_.btnName = "PCINVENTORYSLOTBTN";
   _loc2_.trackAsMenu = true;
   _loc2_.index = slotIndex;
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
      this.isPressed = true;
   };
}
function setDragOut(btn)
{
   btn.onDragOut = function()
   {
      if(this.isPressed == true)
      {
         this.isPressed = false;
         dragFlag = true;
         if(this.TEX != undefined)
         {
            var _loc4_ = this._x + 2;
            var _loc3_ = this._y + 2;
            slotData[this.index].disableType = 1;
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
      this.isPressed = false;
      drawSlots();
   };
}
function setRelease(btn)
{
   btn.onRelease = function()
   {
      this.isPressed = false;
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
function drawSlots()
{
   var _loc3_ = container_mc.slotLayer;
   _loc3_.clear();
   var _loc1_ = 0;
   while(_loc1_ < slotTotalCount)
   {
      var _loc5_ = slotData[_loc1_].pX;
      var _loc4_ = slotData[_loc1_].pY;
      if(slotData[_loc1_].img != undefined)
      {
         lib.display.DrawBitmapData.draw(_loc3_,slotData[_loc1_].imgBm,_loc5_ + 2,_loc4_ + 2,0,0,52,52,0.785);
      }
      if(slotData[_loc1_].grade != undefined)
      {
         var _loc6_ = Number(slotData[_loc1_].grade);
         lib.display.DrawBitmapData.draw(_loc3_,itemGradeBm[_loc6_ - 1],_loc5_ + 4,_loc4_ + 3,0,0,16,16);
      }
      if(slotData[_loc1_].disable == 1)
      {
         lib.display.DrawBitmapData.draw(_loc3_,slotImpossibleBm,_loc5_ + 3,_loc4_ + 2,0,0,50,50);
      }
      else if(slotData[_loc1_].disable == 2)
      {
         lib.display.DrawBitmapData.draw(_loc3_,slotDisableBm,_loc5_ + 3,_loc4_ + 2,0,0,50,50);
      }
      _loc1_ = _loc1_ + 1;
   }
   if(slotTotalCount2 == 0)
   {
      return undefined;
   }
   var _loc7_ = slotTotalCount2 + lineMax;
   var _loc2_ = lineMax;
   while(_loc2_ < _loc7_)
   {
      _loc5_ = slotData[_loc2_].pX;
      _loc4_ = slotData[_loc2_].pY;
      if(slotData[_loc2_].img != undefined)
      {
         lib.display.DrawBitmapData.draw(_loc3_,slotData[_loc2_].imgBm,_loc5_ + 2,_loc4_ + 2,0,0,52,52,0.785);
      }
      if(slotData[_loc2_].grade != undefined)
      {
         _loc6_ = Number(slotData[_loc1_].grade);
         lib.display.DrawBitmapData.draw(_loc3_,itemGradeBm[_loc6_ - 1],_loc5_ + 4,_loc4_ + 3,0,0,16,16);
      }
      if(slotData[_loc2_].disable == 1)
      {
         lib.display.DrawBitmapData.draw(_loc3_,slotImpossibleBm,_loc5_ + 3,_loc4_ + 2,0,0,50,50);
      }
      else if(slotData[_loc2_].disable == 2)
      {
         lib.display.DrawBitmapData.draw(_loc3_,slotDisableBm,_loc5_ + 3,_loc4_ + 2,0,0,50,50);
      }
      _loc2_ = _loc2_ + 1;
   }
}
function setUseEffect(index)
{
   var _loc4_ = slotData[index].pX;
   var _loc3_ = slotData[index].pY;
   var _loc1_ = container_mc.slotLayer["effect_use" + index];
   if(_loc1_ != undefined)
   {
      _loc1_.removeMovieClip();
   }
   _loc1_ = container_mc.slotLayer.attachMovie("useTest","effect_use" + index,container_mc.slotLayer.getNextHighestDepth());
   lib.display.DrawBitmapData.draw(_loc1_,slotData[index].img,0,0,0,0,52,52,0.785);
   _loc1_._width = _loc1_._height = 30;
   _loc1_._x = _loc4_ + 10;
   _loc1_._y = _loc3_ + 10;
   gs.TweenLite.to(_loc1_,0.5,{_x:_loc4_ + 3,_y:_loc3_ + 3,_width:49,_height:49,ease:gs.easing.Bounce.easeOut,overwrite:1,onComplete:onFinish,onCompleteParams:[_loc1_]});
}
function onFinish(mc)
{
   mc.removeMovieClip();
}
function ToGame_PCInventory_Init()
{
   fscommand("ToGame_PCInventory_Init");
}
function ToGame_PCInventory_RightClickSlot(slotName)
{
   getURL("FSCommand:ToGame_PCInventory_RightClickSlot",slotName);
}
function ToGame_PCInventory_LeftClickSlot(slotName)
{
   getURL("FSCommand:ToGame_PCInventory_LeftClickSlot",slotName);
}
var itemGradeBm = new Array();
var slotFrameBm = flash.display.BitmapData.loadBitmap("slotFrame");
var slotOverBm = flash.display.BitmapData.loadBitmap("slotOver");
var slotPressBm = flash.display.BitmapData.loadBitmap("slotPress");
var slotImpossibleBm = flash.display.BitmapData.loadBitmap("slotImpossible");
var slotDisableBm = flash.display.BitmapData.loadBitmap("slotDisable");
var iconBm = flash.display.BitmapData.loadBitmap("icon");
var slotBgBm = flash.display.BitmapData.loadBitmap("slotBg");
var titleBgBm = flash.display.BitmapData.loadBitmap("titleBg");
var bgBm0 = flash.display.BitmapData.loadBitmap("bg_0");
var bgBm1 = flash.display.BitmapData.loadBitmap("bg_1");
var bgBm10 = flash.display.BitmapData.loadBitmap("bg_10");
var bgBm11 = flash.display.BitmapData.loadBitmap("bg_11");
var coolTimeManager = lib.util.CoolTimeManger.getInstance();
setItemGradeBitmapData();
var UI = this;
UI._visible = false;
var UIname = "PCInventory";
var bWidgetOpen = false;
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
myListener.OnGameEventShowWindow = function(widgetName, bShow)
{
   if(widgetName.toLowerCase() == "pcinventory")
   {
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
   setUImode(bShow);
   if(bShow)
   {
      myListener.OnGame_MouseDown = function(button, target)
      {
         button = Number(button);
         delete tempDragOveredBtn;
         if(target.btnName == "PCINVENTORYSLOTBTN")
         {
            var _loc1_ = target.index;
            if(button == 2)
            {
               ToGame_PCInventory_RightClickSlot("PCInventory__" + _loc1_);
            }
            else if(button == 1)
            {
               ToGame_PCInventory_LeftClickSlot("PCInventory__" + _loc1_);
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
var lineMax = 20;
var slotTotalCount = 0;
var slotTotalCount2 = 0;
var SLOTINITX = 13;
var SLOTINITY = 32;
var SPACE = 57;
var LINESPACE = 62;
var keyTextFormat = new TextFormat("$NormalFont",12,16777215,false,false,false,null,null,"right",0,0,0,0);
var amountTextFormat = new TextFormat("$NormalFont",16,16777215,false,false,false,null,null,"right",0,0,0,0);
var slotData = new Array();
myListener.OnGame_PCInventory_SlotSize = function(total, total2)
{
   total = Number(total);
   total2 = Number(total2);
   clearSlot();
   slotTotalCount = total;
   slotTotalCount2 = 0;
   var _loc1_ = 0;
   while(_loc1_ < slotTotalCount)
   {
      var _loc4_ = container_mc.slotLayer["PCInventory__" + _loc1_];
      var _loc7_ = container_mc["keyFd__" + _loc1_];
      var _loc6_ = container_mc["amountFd__" + _loc1_];
      var _loc2_ = SPACE * _loc1_ + SLOTINITX;
      var _loc5_ = SLOTINITY;
      var _loc9_ = {pX:_loc2_,pY:_loc5_,type:0,bActive:0,remain:0,total:0};
      slotData[_loc1_] = _loc9_;
      if(_loc4_ == undefined)
      {
         _loc4_ = createSlotBtn(_loc1_,_loc2_,_loc5_);
         _loc7_ = createTextfield("keyFd__" + _loc1_,_loc2_ + 2,_loc5_ + 3,50,21,keyTextFormat);
         _loc6_ = createTextfield("amountFd__" + _loc1_,_loc2_ + 1,_loc5_ + 34,50,28,amountTextFormat);
      }
      else
      {
         _loc4_._x = _loc2_;
         _loc4_._y = _loc5_;
         _loc7_._x = _loc2_ + 2;
         _loc7_._y = _loc5_ + 3;
         _loc6_._x = _loc2_ + 1;
         _loc6_._y = _loc5_ + 34;
      }
      _loc4_._visible = _loc7_._visible = _loc6_._visible = true;
      _loc1_ = _loc1_ + 1;
   }
   if(total2 > 0)
   {
      slotTotalCount2 = total2;
      var _loc8_ = 0;
      while(_loc8_ < slotTotalCount2)
      {
         var _loc3_ = Number(_loc8_) + lineMax;
         _loc4_ = container_mc.slotLayer["PCInventory__" + _loc3_];
         _loc7_ = container_mc["keyFd__" + _loc3_];
         _loc6_ = container_mc["amountFd__" + _loc3_];
         _loc2_ = SPACE * _loc8_ + SLOTINITX;
         _loc5_ = SLOTINITY;
         if(slotTotalCount > 0)
         {
            _loc5_ = SLOTINITY + LINESPACE;
         }
         _loc9_ = {pX:_loc2_,pY:_loc5_,type:0,bActive:0,remain:0,total:0};
         slotData[_loc3_] = _loc9_;
         if(_loc4_ == undefined)
         {
            _loc4_ = createSlotBtn(_loc3_,_loc2_,_loc5_);
            _loc7_ = createTextfield("keyFd__" + _loc3_,_loc2_ + 2,_loc5_ + 3,50,21,keyTextFormat);
            _loc6_ = createTextfield("amountFd__" + _loc3_,_loc2_ + 1,_loc5_ + 34,50,28,amountTextFormat);
         }
         else
         {
            _loc4_._x = _loc2_;
            _loc4_._y = _loc5_;
            _loc7_._x = _loc2_ + 2;
            _loc7_._y = _loc5_ + 3;
            _loc6_._x = _loc2_ + 1;
            _loc6_._y = _loc2_ + 34;
         }
         _loc4_._visible = _loc7_._visible = _loc6_._visible = true;
         _loc8_ = _loc8_ + 1;
      }
   }
   DragSize();
};
myListener.OnGame_PCInventory_SetKeyMap = function(dataList)
{
   var _loc5_ = lib.util.ExtString.split("\t");
   var _loc6_ = _loc5_.length;
   var _loc2_ = 0;
   while(_loc2_ < _loc6_)
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
      if(lib.util.ExtString.isOverLenght(slot.shortcut_txt,_loc1_))
      {
         _loc1_ = "";
      }
      _loc4_._visible = _loc1_ != "" && _loc1_ != undefined;
      _loc4_.text = _loc1_;
      _loc2_ = _loc2_ + 1;
   }
};
myListener.OnGame_PCInventory_ClearSlot = function(index)
{
   if(index == undefined)
   {
      clearSlot();
   }
   else
   {
      clearSlot(index);
   }
};
myListener.OnGame_PCInventory_SetSlot = function(index, img, count, _remainTime, _totalTime, disable, active, grade)
{
   index = Number(index);
   active = Number(active);
   _remainTime = Number(_remainTime);
   _totalTime = Number(_totalTime);
   var _loc6_ = container_mc.slotLayer;
   var _loc8_ = slotData[index].pX;
   var _loc7_ = slotData[index].pY;
   var _loc11_ = _loc6_["PCInventory__" + index];
   var _loc12_ = container_mc["amountFd__" + index];
   if(count != -1)
   {
      _loc12_.text = count;
   }
   else
   {
      _loc12_.text = "";
   }
   if(slotData[index].bActive != active)
   {
      slotData[index].bActive = active;
      if(active)
      {
         var _loc9_ = _loc6_.attachMovie("FX_ACTIVE","FX_ACTIVE" + index,_loc6_.getNextHighestDepth());
         _loc9_._x = _loc8_ - 4;
         _loc9_._y = _loc7_ - 6;
         _loc9_.hitTestDisable = true;
      }
      else
      {
         _loc6_["FX_ACTIVE" + index].removeMovieClip();
      }
   }
   if(slotData[index].remain != _remainTime || _remainTime == -1)
   {
      var _loc2_ = container_mc["coolTime_ani" + index];
      if(_loc2_ == undefined)
      {
         _loc2_ = container_mc.attachMovie("coolTime_ani","coolTime_ani" + index,container_mc.getNextHighestDepth());
         _loc2_.hitTestDisable = true;
         _loc2_._x = _loc8_ + 3;
         _loc2_._y = _loc7_ + 3;
         _loc2_.onFinished = function()
         {
            var _loc2_ = container_mc.attachMovie("effect_standby","effect_standby" + index,container_mc.getNextHighestDepth());
            _loc2_._x = this._x;
            _loc2_._y = this._y;
            lib.util.DrawBitmap.makeMcAndDraw(_loc2_.a_mc,slotData[index].img,50,50);
            lib.util.DrawBitmap.makeMcAndDraw(_loc2_.b_mc,slotData[index].img,50,50);
            lib.util.DrawBitmap.makeMcAndDraw(_loc2_.c_mc,slotData[index].img,50,50);
         };
      }
      if(_remainTime <= 0 || _totalTime <= 0)
      {
         if(_loc2_.coolTime != undefined)
         {
            coolTimeManager.removeCoolTimeInstance(_loc2_);
            var _loc4_ = container_mc.attachMovie("effect_standby","effect_standby" + index,container_mc.getNextHighestDepth());
            _loc4_.hitTestDisable = false;
            _loc4_._x = _loc2_._x;
            _loc4_._y = _loc2_._y;
            lib.util.DrawBitmap.makeMcAndDraw(_loc4_.a_mc,img,60,60);
            lib.util.DrawBitmap.makeMcAndDraw(_loc4_.b_mc,img,60,60);
            lib.util.DrawBitmap.makeMcAndDraw(_loc4_.c_mc,img,60,60);
         }
      }
      else
      {
         _loc2_._x = _loc8_ + 3;
         _loc2_._y = _loc7_ + 3;
         _loc2_.setCoolTime(_remainTime,_totalTime);
         coolTimeManager.addCoolTimeInstance(_loc2_);
      }
   }
   if(slotData[index].img == img && slotData[index].disable == disable && slotData[index].grade == grade)
   {
      return undefined;
   }
   if(img != undefined && img != "" && img != slotData[index].img)
   {
      _loc11_.TEX = img;
      slotData[index].img = img;
      slotData[index].imgBm = flash.display.BitmapData.loadBitmap(img);
      lib.manager.ToolTip.add(_loc11_,index,6);
   }
   if(slotData[index].disable != disable)
   {
      slotData[index].disable = disable;
   }
   if(slotData[index].grade != grade)
   {
      slotData[index].grade = grade;
   }
   drawSlots();
};
var dragFlag = false;
myListener.OnGame_PCInventory_Used = function(slotIndex)
{
   slotIndex = Number(slotIndex);
   setUseEffect(slotIndex);
};
ToGame_PCInventory_Init();
