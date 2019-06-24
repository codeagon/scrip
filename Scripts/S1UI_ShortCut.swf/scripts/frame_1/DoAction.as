function setUImode(bShow)
{
   container_mc.bgLayer.pageDownBtn._visible = bShow;
   container_mc.bgLayer.pageUpBtn._visible = bShow;
   container_mc.bgLayer.generalBtn._visible = bShow;
   container_mc.bgLayer.extAddOnBtn._visible = bShow;
   container_mc.bgLayer.unLockBtn._visible = bShow;
   container_mc.bgLayer.expansionBtn._visible = bShow;
   container_mc.bgLayer.extAddOffBtn._visible = bShow;
   container_mc.bgLayer.lockBtn._visible = bShow;
   container_mc.bgLayer.clear();
   if(bShow)
   {
      setShortCutMode();
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
   lib.display.DrawBitmapData.draw(_loc1_,slotData[index].iconName,0,0,0,0,52,52,0.785);
   _loc1_._width = _loc1_._height = 30;
   _loc1_._x = _loc4_ + 10;
   _loc1_._y = _loc3_ + 10;
   gs.TweenLite.to(_loc1_,0.5,{_x:_loc4_ + 3,_y:_loc3_ + 3,_width:49,_height:49,ease:gs.easing.Bounce.easeOut,overwrite:1,onComplete:onFinish,onCompleteParams:[_loc1_]});
}
function onFinish(mc)
{
   mc.removeMovieClip();
}
function setExpandMode()
{
   container_mc.bgLayer.generalBtn._visible = !expSlotFlag;
   container_mc.bgLayer.expansionBtn._visible = expSlotFlag;
   var _loc1_ = expSlotFlag != 0?lib.info.ToolTipStr.SHORTCUTFULL:lib.info.ToolTipStr.SHORTCUTOFF;
   if(expSlotFlag)
   {
      lib.manager.ToolTip.remove(container_mc.bgLayer.generalBtn);
      lib.manager.ToolTip.add(container_mc.bgLayer.expansionBtn,_loc1_,1);
   }
   else
   {
      lib.manager.ToolTip.remove(container_mc.bgLayer.expansionBtn);
      lib.manager.ToolTip.add(container_mc.bgLayer.generalBtn,_loc1_,1);
   }
   expandSlot();
}
function expandSlot()
{
   if(expSlotFlag)
   {
      container_mc.bgLayer.generalBtn._x = container_mc.bgLayer.expansionBtn._x = OPTIONBTNINITX1;
      container_mc.bgLayer.extAddOnBtn._x = container_mc.bgLayer.extAddOffBtn._x = OPTIONBTNINITX1 + OPTIONBTNSPACE;
      container_mc.bgLayer.unLockBtn._x = container_mc.bgLayer.lockBtn._x = OPTIONBTNINITX1 + OPTIONBTNSPACE * 2;
      slotRow = EXTSLOTROW;
      hit.gotoAndStop(2);
   }
   else
   {
      container_mc.bgLayer.generalBtn._x = container_mc.bgLayer.expansionBtn._x = OPTIONBTNINITX0;
      container_mc.bgLayer.extAddOnBtn._x = container_mc.bgLayer.extAddOffBtn._x = OPTIONBTNINITX0 + OPTIONBTNSPACE;
      container_mc.bgLayer.unLockBtn._x = container_mc.bgLayer.lockBtn._x = OPTIONBTNINITX0 + OPTIONBTNSPACE * 2;
      slotRow = DEFAULTSLOTROW;
      hit.gotoAndStop(1);
   }
   setSlotPos();
   setEffectMcMode();
   ToGameRequestShortCutPage(Number(container_mc.text_pageNum.text));
}
function setEffectMcMode()
{
   var _loc1_ = 0;
   while(_loc1_ < NUM_SLOT)
   {
      var _loc5_ = slotData[_loc1_].pX;
      var _loc4_ = slotData[_loc1_].pY;
      var _loc2_ = container_mc["coolAniMc" + _loc1_];
      _loc2_._x = _loc5_ + 3;
      _loc2_._y = _loc4_ + 3;
      var _loc3_ = container_mc.slotLayer["FX_ACTIVE" + _loc1_];
      _loc3_._x = _loc5_ - 4;
      _loc3_._y = _loc4_ - 6;
      if(_loc1_ > 11 && _loc1_ < EXTSLOTSTARTINDEX)
      {
         if(expSlotFlag && _loc2_.coolTime != undefined)
         {
            _loc2_._visible = true;
         }
         else
         {
            _loc2_._visible = false;
         }
         if(expSlotFlag && slotData[_loc1_].bToggle)
         {
            _loc3_._visible = true;
         }
         else
         {
            _loc3_._visible = false;
         }
      }
      _loc1_ = _loc1_ + 1;
   }
}
function setSlotPos()
{
   var _loc1_ = 0;
   for(; _loc1_ < NUM_SLOT; _loc1_ = _loc1_ + 1)
   {
      if(transformState == 0 || transformState == 2)
      {
         var _loc3_ = int(_loc1_ / 6) * SPACE * -1 + 57;
         var _loc2_ = _loc1_ % 6 * SPACE + 66;
         if(_loc1_ >= EXTSLOTSTARTINDEX)
         {
            _loc2_ = (_loc1_ - EXTSLOTSTARTINDEX + slotRow) * SPACE + 7 + 66;
            _loc3_ = 0;
         }
         else if(_loc1_ >= EXTSLOTROW)
         {
            _loc3_ = _loc3_ + 2 * SPACE;
            _loc2_ = _loc2_ + 6 * SPACE;
         }
      }
      else
      {
         _loc3_ = _loc1_ % 6 * SPACE + SLOTINITX;
         _loc2_ = int(_loc1_ / 6) * SPACE + SLOTINITY;
         if(_loc1_ >= EXTSLOTSTARTINDEX)
         {
            _loc3_ = (_loc1_ - EXTSLOTSTARTINDEX + slotRow) * SPACE + SLOTINITX + 7;
            _loc2_ = SPACE + SLOTINITY;
         }
         else if(_loc1_ >= EXTSLOTROW)
         {
            _loc3_ = _loc3_ + 6 * SPACE;
            _loc2_ = _loc2_ - 2 * SPACE;
         }
      }
      var _loc5_ = container_mc.slotLayer["shortcut__" + _loc1_];
      var _loc6_ = container_mc["keyFd__" + _loc1_];
      var _loc4_ = container_mc["amountFd__" + _loc1_];
      if(!expSlotFlag)
      {
         if(_loc1_ >= 12 && _loc1_ < EXTSLOTSTARTINDEX)
         {
            _loc5_._visible = false;
            _loc6_._visible = false;
            _loc4_._visible = false;
            continue;
         }
      }
      _loc5_._visible = true;
      _loc6_._visible = true;
      _loc4_._visible = _loc4_.text != -1 && _loc4_.text != undefined;
      _loc5_._x = _loc3_;
      _loc5_._y = _loc2_;
      _loc6_._x = _loc3_ + 3;
      _loc6_._y = _loc2_ + 3;
      _loc4_._x = _loc3_ + 1;
      _loc4_._y = _loc2_ + 34;
      slotData[_loc1_].pX = _loc3_;
      slotData[_loc1_].pY = _loc2_;
   }
}
function setShortCutMode()
{
   container_mc.bgLayer.clear();
   var _loc1_ = !(shortCutType == 0 && UImode == 1)?false:true;
   container_mc.bgLayer.pageDownBtn._visible = _loc1_;
   container_mc.bgLayer.pageUpBtn._visible = _loc1_;
   container_mc.bgLayer.generalBtn._visible = _loc1_;
   container_mc.bgLayer.extAddOnBtn._visible = _loc1_;
   container_mc.bgLayer.unLockBtn._visible = _loc1_;
   container_mc.bgLayer.expansionBtn._visible = _loc1_;
   container_mc.bgLayer.extAddOffBtn._visible = _loc1_;
   container_mc.bgLayer.lockBtn._visible = _loc1_;
   if(_loc1_)
   {
      setExtShortCut();
      setLockBtn();
      setExpandMode();
      lib.display.DrawBitmapData.draw(container_mc.bgLayer,shortCutBgBm,0,0,0,0,69,113);
   }
}
function setExtShortCut()
{
   var _loc1_ = addOnFlag != 0?lib.info.ToolTipStr.SHORTEXTDISABLE:lib.info.ToolTipStr.SHORTEXTENABLE;
   container_mc.bgLayer.extAddOffBtn._visible = !addOnFlag;
   container_mc.bgLayer.extAddOnBtn._visible = addOnFlag;
   if(addOnFlag)
   {
      lib.manager.ToolTip.remove(container_mc.bgLayer.extAddOffBtn);
      lib.manager.ToolTip.add(container_mc.bgLayer.extAddOnBtn,_loc1_,1);
   }
   else
   {
      lib.manager.ToolTip.remove(container_mc.bgLayer.extAddOnBtn);
      lib.manager.ToolTip.add(container_mc.bgLayer.extAddOffBtn,_loc1_,1);
   }
}
function setLockBtn()
{
   var _loc1_ = lockFlag != 0?lib.info.ToolTipStr.SHORTCUTLOCK:lib.info.ToolTipStr.SHORTCUTUNLOCK;
   container_mc.bgLayer.unLockBtn._visible = !lockFlag;
   container_mc.bgLayer.lockBtn._visible = lockFlag;
   if(lockFlag)
   {
      lib.manager.ToolTip.remove(container_mc.bgLayer.unLockBtn);
      lib.manager.ToolTip.add(container_mc.bgLayer.lockBtn,_loc1_,1);
   }
   else
   {
      lib.manager.ToolTip.remove(container_mc.bgLayer.lockBtn);
      lib.manager.ToolTip.add(container_mc.bgLayer.unLockBtn,_loc1_,1);
   }
}
function setPageNum(pageNum)
{
   container_mc.text_pageNum.text = pageNum;
   clearAllSlot();
   ToGameRequestShortCutPage(pageNum);
}
function ToGameUseShortCut(slotIndex, type)
{
   if(slotIndex == undefined)
   {
      return undefined;
   }
   getURL("FSCommand:ToGameUseShortCut",slotIndex + "\t" + type);
   lib.Debuger.trace("ToGameUseShortCut  " + slotIndex + "\t" + type);
}
function ToGameSetShortCutMode(ModeNum)
{
   ModeNum = Number(ModeNum);
   lib.manager.UISound.play(lib.manager.UISound.SHORTCUT_EXTEND);
   getURL("FSCommand:ToGameSetShortCutMode",ModeNum);
}
function ToGameSetShortCutLock(bLock)
{
   bLock = Number(bLock);
   lib.manager.UISound.play(lib.manager.UISound.SHORTCUT_BLOCK);
   getURL("FSCommand:ToGameSetShortCutLock",bLock);
}
function ToGameRequestShortCutPage(PageNum)
{
   lib.Debuger.trace("ToGameRequestShortCutPage  " + PageNum);
   getURL("FSCommand:ToGameRequestShortCutPage",PageNum);
}
function ToGameRequestShortCutToolTip(SlotIndex, _tg)
{
   getURL("FSCommand:ToGameRequestShortCutToolTip",SlotIndex);
}
function ToGame_ShortCut_EnableExtShortCut(enable)
{
   getURL("FSCommand:ToGame_ShortCut_EnableExtShortCut",enable);
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
function clearAllSlot()
{
   container_mc.slotLayer.clear();
   var _loc1_ = 0;
   while(_loc1_ < NUM_SLOT)
   {
      clearSlot(_loc1_);
      _loc1_ = _loc1_ + 1;
   }
}
function slotBuild()
{
   lib.display.DrawBitmapData.draw(container_mc.slotLayer,pageBgBm,27,40,0,0,28,28);
   var _loc1_ = 0;
   while(_loc1_ < NUM_SLOT)
   {
      var _loc5_ = _loc1_ % 6 * SPACE + SLOTINITX;
      var _loc3_ = int(_loc1_ / 6) * SPACE + SLOTINITY;
      if(_loc1_ >= EXTSLOTSTARTINDEX)
      {
         _loc5_ = (_loc1_ - EXTSLOTSTARTINDEX + slotRow) * SPACE + SLOTINITX + 7;
         _loc3_ = SPACE + SLOTINITY;
      }
      else if(_loc1_ >= EXTSLOTROW)
      {
         _loc5_ = _loc5_ + 6 * SPACE;
         _loc3_ = _loc3_ - 2 * SPACE;
      }
      var _loc4_ = createSlotBtn(_loc1_,_loc5_,_loc3_);
      var _loc7_ = createTextfield("keyFd__" + _loc1_,_loc5_ + 2,_loc3_ + 3,50,21,keyTextFormat);
      var _loc6_ = createTextfield("amountFd__" + _loc1_,_loc5_ + 1,_loc3_ + 34,50,28,amountTextFormat);
      var _loc2_ = {pX:_loc5_,pY:_loc3_};
      slotData[_loc1_] = _loc2_;
      _loc1_ = _loc1_ + 1;
   }
}
function createSlotBtn(slotIndex, pX, pY)
{
   var _loc2_ = container_mc.slotLayer.attachMovie("btn","shortcut__" + slotIndex,container_mc.slotLayer.getNextHighestDepth());
   _loc2_.btnName = "SHORTCUTSLOTBTN";
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
            var _loc4_ = this._x + 2;
            var _loc3_ = this._y + 2;
            btnImpossible = slotData[this.index].disable;
            slotData[this.index].disable = 1;
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
   var _loc6_ = container_mc.slotLayer;
   _loc6_.clear();
   if(transformState == 1)
   {
      lib.display.DrawBitmapData.draw(container_mc.slotLayer,pageBgBm,27,40,0,0,28,28);
   }
   else
   {
      lib.display.DrawBitmapData.draw(container_mc.slotLayer,pageBgBm,42.5,26,0,0,28,28);
   }
   var _loc1_ = 0;
   for(; _loc1_ < NUM_SLOT; _loc1_ = _loc1_ + 1)
   {
      if(!expSlotFlag)
      {
         if(_loc1_ > 11 && _loc1_ < EXTSLOTSTARTINDEX)
         {
            continue;
         }
      }
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
         continue;
      }
   }
}
function clearSlot(slotIndex)
{
   slotIndex = Number(slotIndex);
   delete container_mc.slotLayer["shortcut__" + slotIndex].TEX;
   var _loc4_ = slotData[slotIndex].pX;
   var _loc3_ = slotData[slotIndex].pY;
   var _loc2_ = {pX:_loc4_,pY:_loc3_,bToggle:false};
   slotData[slotIndex] = [];
   slotData[slotIndex] = _loc2_;
   drawSlots();
   container_mc.slotLayer["FX_ACTIVE" + slotIndex].removeMovieClip();
   container_mc["amountFd__" + slotIndex]._visible = false;
   container_mc["amountFd__" + slotIndex].text = "";
   coolTimeManager.removeCoolTimeInstance(container_mc["coolAniMc" + slotIndex]);
   container_mc["effect_use" + slotIndex].removeMovieClip();
}
function checkPosAndTransform()
{
   var _loc3_ = UI._x;
   var _loc1_ = lib.info.AlignInfo.xPixelToRatio(_loc3_);
   preTransformState = transformState;
   var _loc2_ = leftMargin * UI._xscale;
   if(_loc1_ < _loc2_)
   {
      transformState = 0;
   }
   else if(_loc1_ >= _loc2_ && _loc1_ < 92)
   {
      transformState = 1;
   }
   else if(_loc1_ >= 92)
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
      container_mc.bgLayer._rotation = 90;
      container_mc.bgLayer._x = 113;
      container_mc.text_pageNum._x = 35;
      container_mc.text_pageNum._y = 31;
      setSlotPos();
      setEffectMcMode();
      drawSlots();
      container_mc.bgLayer.UIDrager.adjustDragLimit(-20,0,0,-10);
      UIdata.PA = 1;
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
      container_mc.bgLayer.UIDrager.adjustDragLimit(0,0,0,-10);
      UIdata.PA = 8;
   }
   else if(transformState == 2)
   {
      container_mc.bgLayer._rotation = 90;
      container_mc.bgLayer._x = 113;
      container_mc.text_pageNum._x = 35;
      container_mc.text_pageNum._y = 31;
      setSlotPos();
      setEffectMcMode();
      drawSlots();
      container_mc.bgLayer.UIDrager.adjustDragLimit(0,-25,0,-10);
      UIdata.PA = 8;
   }
   if(dragPressed)
   {
      container_mc.bgLayer.UIDrager.onPress();
   }
   if(container_mc.slotLayer.blinMc)
   {
      container_mc.slotLayer.blinMc._x = container_mc.slotLayer["shortcut__" + container_mc.slotLayer.blinMc.index]._x + 28;
      container_mc.slotLayer.blinMc._y = container_mc.slotLayer["shortcut__" + container_mc.slotLayer.blinMc.index]._y + 27;
   }
}
var UI = this;
var UIname = "ShortCut";
UI._visible = false;
var bWidgetOpen = false;
var NUM_SLOT = 27;
var slotData = new Array();
var coolTimeManager = lib.util.CoolTimeManger.getInstance();
var DEFAULTSLOTROW = 6;
var EXTSLOTROW = 12;
var shortCutBgObj = new lib.display.BitMapObject("shortbg",container_mc.bgLayer,0,0,0,0,70,125);
var pageBgObj = new lib.display.BitMapObject("pageBG",container_mc.bgLayer,26,42,0,0,32,32);
var OPTIONBTNINITX0 = 417;
var OPTIONBTNINITX1 = 757;
var OPTIONBTNSPACE = 38;
var expSlotFlag = true;
var addOnFlag = false;
var lockFlag = false;
var dragFlag = false;
var itemGradeBm = new Array();
var shortCutBgBm = flash.display.BitmapData.loadBitmap("bg");
var pageBgBm = flash.display.BitmapData.loadBitmap("pageBg");
var frameBm = flash.display.BitmapData.loadBitmap("slotFrame");
var overBm = flash.display.BitmapData.loadBitmap("slotOver");
var disableBm1 = flash.display.BitmapData.loadBitmap("slotImpossible");
var disableBm2 = flash.display.BitmapData.loadBitmap("slotDisable");
var gradeBm1 = flash.display.BitmapData.loadBitmap("grade1");
var gradeBm2 = flash.display.BitmapData.loadBitmap("grade2");
var gradeBm3 = flash.display.BitmapData.loadBitmap("grade3");
var totalSlotCount = NUM_SLOT;
var SLOTINITX = 66;
var SLOTINITY = 0;
var SPACE = 57;
var EXTSLOTSTARTINDEX = 24;
var EXTSLOTCOUNT = 3;
var slotRow = 6;
var slotColum = 2;
var keyTextFormat = new TextFormat("$NormalFont",12,16777215,false,false,false,null,null,"right",0,0,0,0);
var amountTextFormat = new TextFormat("$NormalFont",16,16777215,false,false,false,null,null,"right",0,0,0,0);
var ICON_LENGTH = 52;
var GRADE_LENGTH = 16;
container_mc.bgLayer.UIDrager.setData(UIname,UI);
container_mc.bgLayer.UIDrager.adjustDragLimit(0,0,0,-10);
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
myListener.OnGameEventShowWindow = function(widgetName, bShow)
{
   if(widgetName.toLowerCase() == UIname.toLowerCase())
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
var firtstPositioning = true;
myListener.OnGame_SetUIPosition = function(bLocked, _UIName, posXRatio, posYRatio)
{
   if(_UIName.toLowerCase() == UIname.toLowerCase())
   {
      if(posXRatio <= 6 && transformState == 1)
      {
         UIdata.PA = 1;
         UI._x = UI._x + UI.hit._width / 2 * lib.info.AlignInfo.scaleRatio;
         UI._y = UI._y + UI.hit._height * lib.info.AlignInfo.scaleRatio;
         firtstPositioning = false;
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
var UImode = false;
myListener.OnGameEventChangeUIMode = function(bShow)
{
   bShow = Number(bShow);
   UImode = bShow;
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
               slotData[pressedBtn.index].disable = btnImpossible;
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
      pressedBtn = null;
   }
};
var tempDragOveredBtn;
myListener.OnGameEventSetShortCut = function(slotIndex, iconName, itemAmount, grade)
{
   slotIndex = Number(slotIndex);
   clearSlot(slotIndex);
   if(slotIndex >= NUM_SLOT)
   {
      return undefined;
   }
   if(!expSlotFlag)
   {
      if(slotIndex >= 12 && slotIndex < EXTSLOTSTARTINDEX)
      {
         return undefined;
      }
   }
   var _loc3_ = container_mc["amountFd__" + slotIndex];
   _loc3_._visible = itemAmount != -1 && itemAmount != undefined;
   _loc3_.text = itemAmount;
   var _loc2_ = container_mc.slotLayer["shortcut__" + slotIndex];
   lib.manager.ToolTip.add(_loc2_,slotIndex,6);
   _loc2_.TEX = iconName;
   if(slotData[slotIndex].iconName == iconName && slotData[slotIndex].grade == grade)
   {
      return undefined;
   }
   if(slotData[slotIndex].iconName != iconName)
   {
      var _loc9_ = flash.display.BitmapData.loadBitmap(iconName);
   }
   var _loc8_ = slotData[slotIndex].pX;
   var _loc7_ = slotData[slotIndex].pY;
   var _loc4_ = {slotIndex:slotIndex,iconName:iconName,grade:grade,iconBm:_loc9_,pX:_loc8_,pY:_loc7_};
   slotData[slotIndex] = [];
   slotData[slotIndex] = _loc4_;
   drawSlots();
};
myListener.OnGame_ShortCut_SetDisable = function(slotIndex, type)
{
   slotIndex = Number(slotIndex);
   if(slotIndex >= NUM_SLOT)
   {
      return undefined;
   }
   type = Number(type);
   if(slotData[slotIndex].disable == type)
   {
      return undefined;
   }
   slotData[slotIndex].disable = type;
   drawSlots();
};
myListener.OnGameEventClearShortCut = function(slotIndex)
{
   slotIndex = Number(slotIndex);
   if(slotIndex >= NUM_SLOT)
   {
      return undefined;
   }
   var _loc2_ = container_mc["amountFd__" + slotIndex];
   _loc2_._visible = false;
   clearSlot(slotIndex);
   var _loc3_ = container_mc.slotLayer["shortcut__" + slotIndex];
   lib.manager.ToolTip.remove(_loc3_);
};
myListener.OnGameEventUseShortCutSuccessed = function(index)
{
   index = Number(index);
   if(Number(index) >= NUM_SLOT)
   {
      return undefined;
   }
   if(!expSlotFlag)
   {
      if(index > 12 && index < EXTSLOTSTARTINDEX)
      {
         return undefined;
      }
   }
   setUseEffect(index);
};
myListener.OnGame_ShortCut_SetToggle = function(slotIndex, bTrue)
{
   slotIndex = Number(slotIndex);
   if(slotIndex >= NUM_SLOT)
   {
      return undefined;
   }
   bTrue = Number(bTrue);
   if(bTrue == slotData[slotIndex].bToggle)
   {
      return undefined;
   }
   var _loc6_ = slotData[slotIndex].pX;
   var _loc5_ = slotData[slotIndex].pY;
   slotData[slotIndex].bToggle = bTrue;
   var _loc2_ = container_mc.slotLayer;
   if(bTrue)
   {
      if(_loc2_["FX_ACTIVE" + slotIndex] == undefined)
      {
         var _loc4_ = _loc2_.attachMovie("FX_ACTIVE","FX_ACTIVE" + slotIndex,_loc2_.getNextHighestDepth());
         _loc4_._x = _loc6_ - 4;
         _loc4_._y = _loc5_ - 6;
         _loc4_.hitTestDisable = true;
      }
   }
   else
   {
      _loc2_["FX_ACTIVE" + slotIndex].removeMovieClip();
   }
   if(!expSlotFlag)
   {
      if(slotIndex > 11 && slotIndex < EXTSLOTSTARTINDEX)
      {
         _loc2_["FX_ACTIVE" + slotIndex]._visible = false;
      }
   }
};
myListener.OnGameEventChangeShortCutPage = function(pageNum)
{
   container_mc.text_pageNum.text = pageNum;
};
myListener.OnGame_ShortCut_SetKeyMap = function(dataList)
{
   var _loc5_ = lib.util.ExtString.split(dataList,"\t");
   var _loc6_ = _loc5_.length;
   var _loc2_ = 0;
   while(_loc2_ < NUM_SLOT)
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
      if(_loc1_ == undefined || _loc1_ == "")
      {
         _loc1_ = _loc3_;
      }
      _loc4_.text = _loc1_;
      if(!expSlotFlag)
      {
         if(_loc2_ > 11 && _loc2_ < EXTSLOTSTARTINDEX)
         {
            _loc4_._visible = false;
         }
      }
      _loc2_ = _loc2_ + 1;
   }
};
myListener.OnGame_ShortCut_SetBlink = function(index, blink)
{
   var _loc1_ = container_mc.slotLayer;
   if(Number(blink))
   {
      _loc1_.blinMc.removeMovieClip();
      if(Number(index) >= 12 && !expSlotFlag)
      {
         return undefined;
      }
      if(_loc1_["shortcut__" + index] == undefined)
      {
         return undefined;
      }
      var _loc2_ = _loc1_.attachMovie("blink","blinMc",_loc1_.getNextHighestDepth());
      _loc2_.hitTestDisable = false;
      _loc2_.index = index;
      _loc2_._x = _loc1_["shortcut__" + index]._x + 28;
      _loc2_._y = _loc1_["shortcut__" + index]._y + 27;
   }
   else
   {
      _loc1_.blinMc.removeMovieClip();
   }
};
myListener.OnGame_ShortCut_SetExpandMode = function(mode)
{
   expSlotFlag = Number(mode);
   setExpandMode();
};
container_mc.bgLayer.expansionBtn.onRelease = container_mc.bgLayer.generalBtn.onRelease = function()
{
   expSlotFlag = !expSlotFlag;
   ToGameSetShortCutMode(expSlotFlag);
   setExpandMode();
};
var shortCutType = 0;
myListener.OnGame_ShortCut_SetShortCutMode = function(type)
{
   shortCutType = Number(type);
   setShortCutMode();
};
myListener.OnGame_ShortCut_SetLock = function(lock)
{
   lockFlag = Number(lock);
   setLockBtn();
};
myListener.OnGame_ShortCut_SetExtShortCut = function(__enable)
{
   addOnFlag = Number(__enable);
   setExtShortCut();
};
container_mc.bgLayer.extAddOffBtn.onRelease = container_mc.bgLayer.extAddOnBtn.onRelease = function()
{
   addOnFlag = !addOnFlag;
   ToGame_ShortCut_EnableExtShortCut(addOnFlag);
   setExtShortCut();
};
container_mc.bgLayer.unLockBtn.onRelease = container_mc.bgLayer.lockBtn.onRelease = function()
{
   lockFlag = !lockFlag;
   ToGameSetShortCutLock(lockFlag);
   setLockBtn();
};
container_mc.bgLayer.pageDownBtn.onRelease = function()
{
   var _loc1_ = Number(container_mc.text_pageNum.text);
   _loc1_ = _loc1_ - 1;
   if(_loc1_ < 1)
   {
      _loc1_ = 10;
   }
   setPageNum(_loc1_);
};
container_mc.bgLayer.pageUpBtn.onRelease = function()
{
   var _loc1_ = Number(container_mc.text_pageNum.text);
   _loc1_ = _loc1_ + 1;
   if(_loc1_ > 10)
   {
      _loc1_ = 1;
   }
   setPageNum(_loc1_);
};
var pressedBtn = null;
var btnImpossible = 0;
myListener.OnGame_ShortCut_CoolTime = function(slotIndex, remain, total)
{
   slotIndex = Number(slotIndex);
   if(slotIndex >= NUM_SLOT)
   {
      return undefined;
   }
   remain = Number(remain);
   total = Number(total);
   var _loc6_ = slotData[slotIndex].pX;
   var _loc5_ = slotData[slotIndex].pY;
   var iconName = slotData[slotIndex].iconName;
   if(!expSlotFlag)
   {
      if(slotIndex > 11 && slotIndex < EXTSLOTSTARTINDEX)
      {
         return undefined;
      }
   }
   var _loc2_ = container_mc["coolAniMc" + slotIndex];
   if(remain <= 0 || total <= 0)
   {
      if(_loc2_.coolTime != undefined)
      {
         coolTimeManager.removeCoolTimeInstance(_loc2_);
         var _loc3_ = container_mc.attachMovie("effect_standby","effect_standby" + slotIndex,container_mc.getNextHighestDepth());
         _loc3_._x = _loc6_ + 1;
         _loc3_._y = _loc5_ + 1;
         lib.util.DrawBitmap.makeMcAndDraw(_loc3_.a_mc,iconName,50,50);
         lib.util.DrawBitmap.makeMcAndDraw(_loc3_.b_mc,iconName,50,50);
         lib.util.DrawBitmap.makeMcAndDraw(_loc3_.c_mc,iconName,50,50);
         _loc2_.removeMovieClip();
      }
   }
   else
   {
      if(_loc2_ == undefined)
      {
         _loc2_ = container_mc.attachMovie("coolTime_ani","coolAniMc" + slotIndex,container_mc.getNextHighestDepth());
         _loc2_.iconName = iconName;
         _loc2_._x = _loc6_ + 1;
         _loc2_._y = _loc5_ + 1;
         _loc2_.hitTestDisable = true;
         _loc2_.onFinished = function()
         {
            lib.Debuger.trace("onFinish");
            var _loc2_ = container_mc.attachMovie("effect_standby","effect_standby" + slotIndex,container_mc.getNextHighestDepth());
            _loc2_._x = this._x;
            _loc2_._y = this._y;
            lib.util.DrawBitmap.makeMcAndDraw(_loc2_.a_mc,this.iconName,50,50);
            lib.util.DrawBitmap.makeMcAndDraw(_loc2_.b_mc,this.iconName,50,50);
            lib.util.DrawBitmap.makeMcAndDraw(_loc2_.c_mc,this.iconName,50,50);
         };
      }
      _loc2_.setCoolTime(remain,total);
      coolTimeManager.addCoolTimeInstance(_loc2_);
   }
};
slotBuild();
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
var leftMargin = 0.007;
