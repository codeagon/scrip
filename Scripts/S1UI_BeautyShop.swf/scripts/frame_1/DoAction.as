function configUI()
{
   configRoulette();
   var _loc5_ = [UI.container_mc.mc_select_result.mc_slot_0,UI.container_mc.mc_select_result.mc_slot_1];
   var _loc1_ = undefined;
   var _loc2_ = undefined;
   var _loc6_ = _loc5_.length;
   _loc2_ = 0;
   while(_loc2_ < _loc6_)
   {
      _loc1_ = _loc5_[_loc2_];
      var _loc4_ = _loc1_.mc_image._x;
      var _loc3_ = _loc1_.mc_image._y;
      _loc1_.mc_image.swapDepths(_loc1_.getNextHighestDepth());
      _loc1_.mc_image.removeMovieClip();
      _loc1_.mc_image = null;
      _loc1_.mc_image = _loc1_.createEmptyMovieClip("mc_image",_loc1_.getNextHighestDepth());
      _loc1_.mc_image._x = _loc4_;
      _loc1_.mc_image._y = _loc3_;
      _loc1_.button.swapDepths(_loc1_.getNextHighestDepth());
      _loc2_ = _loc2_ + 1;
   }
   UI.container_mc.mc_select_result.mc_slot_0.button.label = lib.util.UIString.getUIString("$740018");
   UI.container_mc.mc_select_result.mc_slot_0.button.addEventListener("click",UI,"selectResultButton0_clickHandler");
   UI.container_mc.mc_select_result.mc_slot_1.button.label = lib.util.UIString.getUIString("$740019");
   UI.container_mc.mc_select_result.mc_slot_1.button.addEventListener("click",UI,"selectResultButton1_clickHandler");
   ToGame_BeautyShop_Init();
}
function configRoulette()
{
   var _loc4_ = container_mc.mc_roulette.rouletteMc.list_mc;
   rouletteContainer = _loc4_.createEmptyMovieClip("rouletteContainer",_loc4_.getNextHighestDepth());
   rouletteSlotFinal = _loc4_.createEmptyMovieClip("rouletteSlotFinal",_loc4_.getNextHighestDepth());
   rouletteContainer1 = rouletteContainer.createEmptyMovieClip("rouletteContainer1",rouletteContainer.getNextHighestDepth());
   rouletteContainer2 = rouletteContainer.createEmptyMovieClip("rouletteContainer2",rouletteContainer.getNextHighestDepth());
   var _loc2_ = undefined;
   var _loc1_ = undefined;
   var _loc3_ = ROULETTE_ITEM_COUNT;
   _loc1_ = 0;
   while(_loc1_ < _loc3_)
   {
      _loc2_ = rouletteContainer1.createEmptyMovieClip("slot_" + _loc1_,rouletteContainer1.getNextHighestDepth());
      _loc2_._y = ROULETTE_SLOT_SIZE * _loc1_;
      rouletteSlotArray1.push(_loc2_);
      _loc2_ = rouletteContainer2.createEmptyMovieClip("slot_" + _loc1_,rouletteContainer2.getNextHighestDepth());
      _loc2_._y = ROULETTE_SLOT_SIZE * _loc1_;
      rouletteSlotArray2.push(_loc2_);
      _loc1_ = _loc1_ + 1;
   }
}
function hideEvent(bHide)
{
   _root.container_logout_mc._visible = !bHide;
   _root.container_mainmenu_mc._visible = !bHide;
   _root.container_question_mc._visible = !bHide;
   _root.container_villager_mc._visible = !bHide;
   _root.container_battleUp_mc._visible = !bHide;
   _root.container_normal_mc._visible = !bHide;
   _root.container_battle_mc._visible = !bHide;
   _root.container_overlayMap_mc._visible = !bHide;
   _root.container_chat_mc._visible = !bHide;
   _root.container_inGameMovie_mc._visible = !bHide;
}
function cleanUp()
{
   clearTimeoutRoulette();
   this.onEnterFrame = null;
}
function isAllowedItemCheck()
{
   return limit_num > 0;
}
function listClear(pMc)
{
   for(var _loc2_ in pMc)
   {
      if(typeof pMc[_loc2_] == "movieclip")
      {
         pMc[_loc2_].removeMovieClip();
      }
   }
}
function updateUIByCount()
{
   if(isAllowedItemCheck())
   {
      container_mc.mc_list.text_count_1.text = count_num;
      container_mc.mc_list.text_count_1._x = container_mc.mc_list.text_count_2._x - container_mc.mc_list.text_count_1._width;
      container_mc.mc_list.text_count_0._x = container_mc.mc_list.text_count_1._x - container_mc.mc_list.text_count_0._width;
   }
   enterBtn.setEnabled(itemCount > 0 && count_num == limit_num);
   updateInfoText();
}
function startRoulette(firstTime)
{
   fscommand("ToGame_BeautyShop_StartRoulette");
   itemCountWhenStart = itemCount;
   setUIMode(UI_MODE_ROULETTE);
   cleanUpRoulette();
   if(firstTime)
   {
      var _loc4_ = undefined;
      var _loc5_ = RoulettArr.length;
      var _loc3_ = undefined;
      var _loc2_ = undefined;
      var _loc6_ = ROULETTE_ITEM_COUNT;
      _loc2_ = 0;
      while(_loc2_ < _loc6_)
      {
         _loc3_ = RoulettArr[_loc2_ % _loc5_];
         _loc4_ = rouletteSlotArray1[_loc2_];
         drawWithScaling(_loc4_,_loc3_.img,_loc3_.$color,ROULETTE_SLOT_SIZE,ROULETTE_SLOT_SIZE);
         _loc4_ = rouletteSlotArray2[_loc2_];
         drawWithScaling(_loc4_,_loc3_.img,_loc3_.$color,ROULETTE_SLOT_SIZE,ROULETTE_SLOT_SIZE);
         _loc2_ = _loc2_ + 1;
      }
   }
   if(limit_num == 1)
   {
      rouletteScrollEnd1();
      return undefined;
   }
   updateByRouletteScrollValue();
   playArrow(true);
   this.onEnterFrame = updateRouletteScrollValue;
   rouletteTimeoutID1 = setTimeout(gfx.utils.Delegate.create(this,rouletteScrollEnd1),ROULETTE_PLAY_SEC * 1000);
}
function cleanUpRoulette()
{
   clearTimeoutRoulette();
   playArrow(false);
   rouletteScrollValue = 0;
   rouletteSpeed = ROULETTE_SPEED_MIN;
   rouletteSlotFinal.clear();
   continueBtn.setEnabled(false);
   reselectBtn.setEnabled(false);
}
function playArrow(bPlay)
{
   if(bPlay)
   {
      container_mc.mc_roulette.rouletteMc.mc_arrow_left.gotoAndPlay(2);
      container_mc.mc_roulette.rouletteMc.mc_arrow_right.gotoAndPlay(2);
      container_mc.mc_roulette.rouletteMc.mc_blur_effect.gotoAndPlay(2);
   }
   else
   {
      container_mc.mc_roulette.rouletteMc.mc_arrow_left.gotoAndStop(1);
      container_mc.mc_roulette.rouletteMc.mc_arrow_right.gotoAndStop(1);
      container_mc.mc_roulette.rouletteMc.mc_blur_effect.gotoAndStop(1);
   }
}
function updateRouletteScrollValue()
{
   rouletteScrollValue = rouletteScrollValue + rouletteSpeed;
   rouletteSpeed = rouletteSpeed + ROULETTE_SPEED_ADD;
   if(rouletteSpeed > ROULETTE_SPEED_MAX)
   {
      rouletteSpeed = ROULETTE_SPEED_MAX;
   }
   updateByRouletteScrollValue();
}
function updateByRouletteScrollValue()
{
   rouletteContainer1._y = calculateScrollValue(rouletteScrollValue,ROULETTE_MASK_HEIGHT,rouletteContentHeight);
   rouletteContainer2._y = calculateScrollValue(rouletteScrollValue - rouletteContentHeight,ROULETTE_MASK_HEIGHT,rouletteContentHeight);
   var _loc1_ = 100 * rouletteSpeed / ROULETTE_SPEED_MAX;
   if(_loc1_ != rouletteFilterValue)
   {
      rouletteFilterValue = _loc1_;
      container_mc.mc_roulette.rouletteMc.mc_blur_effect._alpha = rouletteFilterValue;
   }
}
function calculateScrollValue(scrollPosition, scrollableHeight, contentHeight)
{
   var _loc1_ = contentHeight * 2;
   var _loc2_ = (- Math.floor((scrollPosition - scrollableHeight) / _loc1_) + 1) * _loc1_;
   return scrollPosition + _loc2_;
}
function rouletteScrollEnd1()
{
   rouletteTimeoutID2 = setTimeout(gfx.utils.Delegate.create(this,rouletteScrollEnd2),ROULETTE_STOP_DELAY_SEC * 1000);
   container_mc.mc_effect_final.gotoAndPlay(3);
   ToGame_BeautyShop_PlayStart();
}
function rouletteScrollEnd2()
{
   this.onEnterFrame = null;
   rouletteScrollValue = 0;
   rouletteSpeed = 0;
   updateByRouletteScrollValue();
   playArrow(false);
   if(itemCountWhenStart == itemCount)
   {
      setItemCount(itemCount - 1);
   }
   continueBtn.setEnabled(itemCount > 0 && count_num == limit_num);
   reselectBtn.setEnabled(true);
   if(UI.isSelectResult)
   {
      setUIMode(UI_MODE_SELECT_RESULT);
   }
}
function clearTimeoutRoulette()
{
   if(rouletteTimeoutID1 != 0)
   {
      clearTimeout(rouletteTimeoutID1);
      rouletteTimeoutID1 = 0;
   }
   if(rouletteTimeoutID2 != 0)
   {
      clearTimeout(rouletteTimeoutID2);
      rouletteTimeoutID2 = 0;
   }
}
function setItemCount(value)
{
   if(isNaN(value) || value < 0)
   {
      value = 0;
   }
   itemCount = value;
   container_mc.slotNum.text = String(itemCount);
   updateUIByCount();
}
function setUIMode(uiMode)
{
   if(currentUIMode == UI_MODE_SELECT_RESULT)
   {
      _selectResult(-1);
   }
   currentUIMode = uiMode;
   if(currentUIMode == UI_MODE_LIST)
   {
      container_mc.mc_list._visible = true;
      container_mc.mc_roulette._visible = false;
      container_mc.mc_select_result._visible = false;
      setCloseButtonEnabled(true);
   }
   else if(currentUIMode == UI_MODE_ROULETTE)
   {
      container_mc.mc_list._visible = false;
      container_mc.mc_roulette._visible = true;
      container_mc.mc_select_result._visible = false;
      setCloseButtonEnabled(false);
   }
   else if(currentUIMode == UI_MODE_SELECT_RESULT)
   {
      container_mc.mc_list._visible = false;
      container_mc.mc_roulette._visible = false;
      container_mc.mc_select_result._visible = true;
      setCloseButtonEnabled(false);
   }
   updateInfoText();
   updateTitleText();
}
function setCloseButtonEnabled(bEnabled)
{
   xBtn.setEnabled(bEnabled);
}
function updateInfoText()
{
   var _loc1_ = "";
   if(currentUIMode == UI_MODE_LIST)
   {
      if(isAllowedItemCheck() && count_num < limit_num)
      {
         _loc1_ = lib.util.UIString.getUIString("$740015");
      }
      else
      {
         _loc1_ = lib.util.UIString.getUIString("$740005");
      }
   }
   else if(currentUIMode == UI_MODE_ROULETTE)
   {
      if(isAllowedItemCheck())
      {
         _loc1_ = lib.util.UIString.getUIString("$740006");
      }
      else
      {
         _loc1_ = lib.util.UIString.getUIString("$740016");
      }
   }
   else if(currentUIMode == UI_MODE_SELECT_RESULT)
   {
      _loc1_ = lib.util.UIString.getUIString("$740020");
   }
   container_mc.text_info.text = _loc1_;
   container_mc.text_info._x = textInfoRegX + Math.floor((textInfoRegWidth - container_mc.text_info.textWidth) / 2);
   container_mc.mc_exclamation_mark._x = container_mc.text_info._x - container_mc.mc_exclamation_mark._width;
}
function updateTitleText()
{
   if(currentUIMode == UI_MODE_SELECT_RESULT)
   {
      container_mc.titleFd.text = lib.util.UIString.getUIString("$740021");
   }
   else
   {
      container_mc.titleFd.htmlText = titleText;
   }
}
function ToGame_BeautyShop_Init()
{
   fscommand("ToGame_BeautyShop_Init");
}
function ToGame_BeautyShop_CloseUI()
{
   fscommand("ToGame_BeautyShop_CloseUI");
}
function ToGame_BeautyShop_confirm()
{
   startRoulette(true);
}
function ToGame_BeautyShop_RandomSlotSelect(_id)
{
   getURL("FSCommand:ToGame_BeautyShop_RandomSlotSelect",_id);
}
function ToGame_BeautyShop_RandomSlotClick(_id, _type)
{
   getURL("FSCommand:ToGame_BeautyShop_RandomSlotClick",_id);
}
function ToGame_BeautyShop_PlayStart()
{
   fscommand("ToGame_BeautyShop_PlayStart");
}
function ToGame_BeautyShop_Continue()
{
   startRoulette(false);
}
function ToGame_BeautyShop_Reselect()
{
   fscommand("ToGame_BeautyShop_GotoList");
   setUIMode(UI_MODE_LIST);
}
function RoulettCheck(id)
{
   var _loc2_ = RoulettArr.length;
   var _loc1_ = 0;
   _loc1_ = 0;
   while(_loc1_ < _loc2_)
   {
      if(RoulettArr[_loc1_].id == id)
      {
         return RoulettArr[_loc1_];
      }
      _loc1_ = _loc1_ + 1;
   }
   return undefined;
}
function RoulettDelete(mc)
{
   mc.$checked = false;
   var _loc3_ = RoulettArr.length;
   var _loc1_ = 0;
   _loc1_ = 0;
   while(_loc1_ < _loc3_)
   {
      if(RoulettArr[_loc1_].id == mc.id)
      {
         RoulettArr.splice(_loc1_,1);
         break;
      }
      _loc1_ = _loc1_ + 1;
   }
   if(isAllowedItemCheck())
   {
      mc.checkMc.gotoAndStop(1);
      updateNumberOfCheckedItems();
   }
}
function AddRoulettItem(mc)
{
   mc.$checked = true;
   var _loc2_ = RoulettCheck(mc.id);
   if(_loc2_ != undefined)
   {
      return undefined;
   }
   RoulettArr.push(mc);
   if(isAllowedItemCheck())
   {
      updateNumberOfCheckedItems();
   }
}
function updateNumberOfCheckedItems()
{
   var _loc1_ = undefined;
   var _loc2_ = RoulettArr.length;
   _loc1_ = 0;
   while(_loc1_ < _loc2_)
   {
      RoulettArr[_loc1_].checkMc.gotoAndStop(_loc1_ + 2);
      _loc1_ = _loc1_ + 1;
   }
}
function drawWithScaling(mc, bitmapID, color, width, height)
{
   if(mc == null)
   {
      return undefined;
   }
   mc.clear();
   if(isNaN(width) || width <= 0 || isNaN(height) || height <= 0)
   {
      return undefined;
   }
   if(bitmapID == null || bitmapID.length == 0 || bitmapID == 0 || bitmapID == "0")
   {
      var _loc7_ = convertColorValue(color);
      mc.beginFill(_loc7_,100);
      mc.moveTo(0,0);
      mc.lineTo(width,0);
      mc.lineTo(width,height);
      mc.lineTo(0,height);
      mc.lineTo(0,0);
      mc.endFill();
   }
   else
   {
      var _loc5_ = flash.display.BitmapData.loadBitmap(bitmapID);
      var _loc6_ = new flash.geom.Matrix();
      _loc6_.createBox(width / _loc5_.width,height / _loc5_.height);
      mc.beginBitmapFill(_loc5_,_loc6_,false,true);
      mc.moveTo(0,0);
      mc.lineTo(width,0);
      mc.lineTo(width,height);
      mc.lineTo(0,height);
      mc.lineTo(0,0);
      mc.endFill();
   }
}
function convertColorValue(value)
{
   if(value == null || value.length == 0)
   {
      return 0;
   }
   var _loc1_ = value.split(",");
   if(_loc1_.length != 3)
   {
      return 0;
   }
   return Number(_loc1_[0]) << 16 | Number(_loc1_[1]) << 8 | Number(_loc1_[2]);
}
function selectResult(value)
{
   if(value != 0 && value != 1)
   {
      value = 1;
   }
   _selectResult(value);
   getURL("FSCommand:ToGame_SelectResult",String(value));
}
function _selectResult(value)
{
   if(value == 0)
   {
      UI.container_mc.mc_select_result.mc_slot_0.button.selected = true;
      UI.container_mc.mc_select_result.mc_slot_1.button.selected = false;
   }
   else if(value == 1)
   {
      UI.container_mc.mc_select_result.mc_slot_0.button.selected = false;
      UI.container_mc.mc_select_result.mc_slot_1.button.selected = true;
   }
   else
   {
      UI.container_mc.mc_select_result.mc_slot_0.button.selected = false;
      UI.container_mc.mc_select_result.mc_slot_1.button.selected = false;
   }
}
function selectResultOK()
{
   fscommand("ToGame_SelectResultOK");
   setUIMode(UI_MODE_LIST);
}
function selectResultButton0_clickHandler(event)
{
   selectResult(0);
}
function selectResultButton1_clickHandler(event)
{
   selectResult(1);
}
var UI = this;
UI._visible = false;
var UIname = "BeautyShop";
this.bWindowOpen = false;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
var xBtn = new lib.util.TxtBtn(container_mc.xBtn);
xBtn.setRelease(ToGame_BeautyShop_CloseUI);
container_mc.mc_list.enterTxt.text = lib.util.UIString.getUIString("$740001");
var enterBtn = new lib.util.TxtBtn(container_mc.mc_list.enterBtn,container_mc.mc_list.enterTxt);
enterBtn.setRelease(ToGame_BeautyShop_confirm);
container_mc.mc_roulette.continueTxt.text = lib.util.UIString.getUIString("$740002");
var continueBtn = new lib.util.TxtBtn(container_mc.mc_roulette.continueBtn,container_mc.mc_roulette.continueTxt);
continueBtn.setRelease(ToGame_BeautyShop_Continue);
container_mc.mc_roulette.reselectTxt.text = lib.util.UIString.getUIString("$740003");
var reselectBtn = new lib.util.TxtBtn(container_mc.mc_roulette.reselectBtn,container_mc.mc_roulette.reselectTxt);
reselectBtn.setRelease(ToGame_BeautyShop_Reselect);
enterBtn.setEnabled(false);
continueBtn.setEnabled(false);
reselectBtn.setEnabled(false);
enterBtn.setTextColor("0xDEC049","0xFFFFFF","0xDEC049","0x666666");
continueBtn.setTextColor("0xDEC049","0xFFFFFF","0xDEC049","0x666666");
reselectBtn.setTextColor("0xDEC049","0xFFFFFF","0xDEC049","0x666666");
var slotPrefix = "slot__";
container_mc.titleFd.verticalAlign = "center";
container_mc.titleFd.htmlText = "";
var titleText = "";
var UI_TYPE_HAIR = 0;
var UI_TYPE_COLOR = 1;
var currentUIType = 0;
var UI_MODE_LIST = 0;
var UI_MODE_ROULETTE = 1;
var UI_MODE_SELECT_RESULT = 2;
var currentUIMode = UI_MODE_LIST;
container_mc.slotNum.verticalAlign = "center";
container_mc.text_info.textAutoSize = "shrink";
container_mc.text_info.verticalAlign = "center";
container_mc.text_info.autoSize = "none";
container_mc.text_info.multiline = true;
container_mc.text_info.wordWrap = true;
var textInfoRegX = container_mc.text_info._x;
var textInfoRegWidth = container_mc.text_info._width;
container_mc.mc_list.listMc._visible = false;
container_mc.mc_list.text_no_select.autoSize = "right";
container_mc.mc_list.text_no_select.verticalAlign = "center";
container_mc.mc_list.text_no_select.text = lib.util.UIString.getUIString("$740010");
container_mc.mc_list.text_count_0.autoSize = "right";
container_mc.mc_list.text_count_0.verticalAlign = "center";
container_mc.mc_list.text_count_0.text = lib.util.UIString.getUIString("$740004");
container_mc.mc_list.text_count_1.autoSize = "right";
container_mc.mc_list.text_count_1.verticalAlign = "center";
container_mc.mc_list.text_count_2.autoSize = "right";
container_mc.mc_list.text_count_2.verticalAlign = "center";
updateUIByCount();
setUIMode(UI_MODE_LIST);
container_mc.mc_list.mc_guide.text_title.verticalAlign = "center";
container_mc.mc_list.mc_guide.text_title.text = lib.util.UIString.getUIString("$740007");
container_mc.mc_list.mc_guide.text_preview.verticalAlign = "center";
container_mc.mc_list.mc_guide.text_preview.text = lib.util.UIString.getUIString("$740008");
container_mc.mc_list.mc_guide.text_select.verticalAlign = "center";
container_mc.mc_list.mc_guide.text_select.text = lib.util.UIString.getUIString("$740009");
var guideCloseButton = new lib.util.TxtBtn(container_mc.mc_list.mc_guide.mc_close_button);
guideCloseButton.setRelease(function()
{
   container_mc.mc_list.mc_guide._visible = false;
}
);
var ROULETTE_SLOT_SIZE = 83;
var ROULETTE_ITEM_COUNT = 5;
var ROULETTE_PLAY_SEC = 3;
var ROULETTE_STOP_DELAY_SEC = 0.5;
var ROULETTE_SPEED_MIN = 2;
var ROULETTE_SPEED_MAX = 30;
var ROULETTE_SPEED_ADD = 1;
var ROULETTE_MASK_HEIGHT = 150;
var ROULETTE_FILTER_MAX = 300;
var rouletteSlotArray1 = [];
var rouletteSlotArray2 = [];
var rouletteContainer;
var rouletteContainer1;
var rouletteContainer2;
var rouletteSlotFinal;
var rouletteContentHeight = ROULETTE_SLOT_SIZE * ROULETTE_ITEM_COUNT;
var rouletteFilterValue = 100;
var rouletteScrollValue = 0;
var rouletteSpeed = 0;
var rouletteTimeoutID1 = 0;
var rouletteTimeoutID2 = 0;
var RESULT_SLOT_SIZE = 92;
var isSelectResult = false;
container_mc.mc_select_result.text_ok.text = lib.util.UIString.getUIString("$740017");
var button_finalOK = new lib.util.TxtBtn(container_mc.mc_select_result.button_ok,container_mc.mc_select_result.text_ok);
button_finalOK.setRelease(selectResultOK);
button_finalOK.setTextColor("0xDEC049","0xFFFFFF","0xDEC049","0x666666");
myListener.OnGameEventShowWindow = function(widgetName, bShow)
{
   if(widgetName.toLowerCase() == UIname.toLowerCase())
   {
      bWidgetOpen = bShow;
      if(_global.gbUIMode && bWidgetOpen)
      {
         UI._visible = true;
         hideEvent(true);
      }
      else
      {
         UI._visible = false;
         hideEvent(false);
         cleanUp();
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
      UI._visible = false;
   }
};
myListener.OnGame_BeautyShop_SetTitle = function(value)
{
   UI.titleText = value;
   updateTitleText();
};
myListener.OnGame_BeautyShop_SetType = function(_type)
{
   currentUIType = Number(_type);
};
var listY = container_mc.mc_list.listMc.slotBox._y;
var scrollBar = container_mc.mc_list.listMc.scroll;
container_mc.mc_list.listMc.slotBox.onScroll = function()
{
   container_mc.mc_list.listMc.slotBox._y = listY - arguments[0];
};
scrollBar.addListener(container_mc.mc_list.listMc.slotBox);
scrollBar.setWheel(container_mc.mc_list.listMc.slotBox);
scrollBar.wheelDelta = 1;
scrollBar.pageSize = 0;
scrollBar.displaySize = container_mc.mc_list.listMc.maskMc._height;
scrollBar.defaultBarSizeRatio = 0.3333333333333333;
scrollBar.rowHeight = 64;
var count_num = 0;
var limit_num = 0;
var itemCount = 0;
var itemCountWhenStart = 0;
myListener.OnGame_BeautyShop_FocusItem = function(_id, _img, _count, isSelectResult)
{
   var _loc1_ = container_mc.slot;
   _loc1_.draw(_img);
   _loc1_.drag = false;
   _loc1_.active = false;
   setItemCount(Number(_count));
   lib.manager.ToolTip.remove(_loc1_.SLOT);
   lib.manager.ToolTip.add(_loc1_.SLOT,_id,6,_loc1_.Icon);
   if(isSelectResult == undefined || isSelectResult == 0 || isSelectResult == false)
   {
      UI.isSelectResult = false;
   }
   else
   {
      UI.isSelectResult = true;
   }
};
myListener.OnGame_BeautyShop_SelectCount = function(_num)
{
   limit_num = _num;
   if(isAllowedItemCheck())
   {
      container_mc.mc_list.text_count_2.text = "/ " + limit_num;
      container_mc.mc_list.text_count_0._visible = true;
      container_mc.mc_list.text_count_1._visible = true;
      container_mc.mc_list.text_count_2._visible = true;
      container_mc.mc_list.text_no_select._visible = false;
   }
   else
   {
      container_mc.mc_list.text_count_0._visible = false;
      container_mc.mc_list.text_count_1._visible = false;
      container_mc.mc_list.text_count_2._visible = false;
      container_mc.mc_list.text_no_select._visible = true;
   }
   updateUIByCount();
};
var prevSlotFocus;
var RoulettArr = [];
myListener.OnGame_BeautyShop_SetRandomSlot = function(_slotData, _default)
{
   container_mc.mc_list.listMc._visible = true;
   RoulettArr = [];
   var _loc7_ = container_mc.mc_list.listMc.slotBox;
   var _loc6_ = undefined;
   var _loc8_ = undefined;
   var _loc9_ = undefined;
   var _loc14_ = undefined;
   var _loc11_ = undefined;
   if(currentUIType == UI_TYPE_HAIR)
   {
      _loc6_ = 64;
      _loc8_ = 5;
      _loc9_ = 70;
      _loc14_ = 1;
      _loc11_ = "colorSlot0";
   }
   else
   {
      _loc6_ = 32;
      _loc8_ = 9;
      _loc9_ = 38;
      _loc14_ = 1;
      _loc11_ = "colorSlot1";
   }
   scrollBar.rowHeight = _loc6_;
   count_num = 0;
   listClear(_loc7_);
   var _loc10_ = [];
   if(_default)
   {
      _loc10_ = lib.util.ExtString.split(_default,"\t");
   }
   var _loc12_ = lib.util.ExtString.split(_slotData,"\n");
   var _loc13_ = _loc12_.length;
   var _loc3_ = 0;
   while(_loc3_ < _loc13_)
   {
      var _loc4_ = lib.util.ExtString.split(_loc12_[_loc3_],"\t");
      var _loc2_ = _loc7_.attachMovie(_loc11_,"slot" + _loc3_,_loc7_.getNextHighestDepth());
      _loc2_.id = _loc4_[0];
      _loc2_.img = _loc4_[1];
      _loc2_.$color = _loc4_[2];
      _loc2_.$checked = false;
      PosX = int(_loc3_ % _loc8_) * _loc9_;
      PosY = int(_loc3_ / _loc8_) * _loc9_;
      _loc2_._x = PosX;
      _loc2_._y = PosY;
      if(isAllowedItemCheck())
      {
         _loc2_.checkMc._visible = true;
         if(_loc10_[0] == _loc3_)
         {
            _loc10_.shift();
            AddRoulettItem(_loc2_);
            count_num++;
         }
      }
      else
      {
         _loc2_.checkMc._visible = false;
         AddRoulettItem(_loc2_);
      }
      drawWithScaling(_loc2_.iconMc,_loc2_.img,_loc2_.$color,_loc6_,_loc6_);
      _loc2_.SLOT.onRelease = function()
      {
         var _loc2_ = this._parent;
         if(_loc2_.bgMc._currentframe == 3)
         {
            _loc2_.bgMc.gotoAndStop(1);
            prevSlotFocus = null;
            ToGame_BeautyShop_RandomSlotSelect(-1);
         }
         else
         {
            prevSlotFocus.bgMc.gotoAndStop(1);
            prevSlotFocus = _loc2_;
            ToGame_BeautyShop_RandomSlotSelect(_loc2_.id);
            _loc2_.bgMc.gotoAndStop(3);
         }
      };
      _loc2_.SLOT.onRollOver = function()
      {
         var _loc2_ = this._parent;
         if(_loc2_.bgMc._currentframe == 3)
         {
            return undefined;
         }
         _loc2_.bgMc.gotoAndStop(2);
      };
      _loc2_.SLOT.onRollOut = _loc2_.SLOT.onReleaseOutside = function()
      {
         var _loc2_ = this._parent;
         if(_loc2_.bgMc._currentframe == 3)
         {
            return undefined;
         }
         _loc2_.bgMc.gotoAndStop(1);
      };
      _loc3_ = _loc3_ + 1;
   }
   scrollBar.scroll = 0;
   scrollBar.pageSize = _loc7_._height;
   updateUIByCount();
};
myListener.OnGame_BeautyShop_SetResult = function(id, oldImagePath, oldColor)
{
   var _loc1_ = RoulettCheck(id);
   if(UI.isSelectResult)
   {
      drawWithScaling(UI.container_mc.mc_select_result.mc_slot_0.mc_image,oldImagePath,oldColor,RESULT_SLOT_SIZE,RESULT_SLOT_SIZE);
      UI.container_mc.mc_select_result.mc_slot_1.mc_image.clear();
      if(_loc1_ != null)
      {
         drawWithScaling(UI.container_mc.mc_select_result.mc_slot_1.mc_image,_loc1_.img,_loc1_.$color,RESULT_SLOT_SIZE,RESULT_SLOT_SIZE);
      }
      selectResult(1);
   }
   else
   {
      if(_loc1_ == null)
      {
         rouletteSlotFinal.clear();
      }
      else
      {
         drawWithScaling(rouletteSlotFinal,_loc1_.img,_loc1_.$color,ROULETTE_SLOT_SIZE,ROULETTE_SLOT_SIZE);
         drawWithScaling(rouletteSlotArray1[0],_loc1_.img,_loc1_.$color,ROULETTE_SLOT_SIZE,ROULETTE_SLOT_SIZE);
      }
      setCloseButtonEnabled(true);
   }
};
myListener.OnGame_MouseDown = function(button, target)
{
   if(button == 2 && target._name == "SLOT")
   {
      if(!isAllowedItemCheck())
      {
         return undefined;
      }
      var _loc1_ = target._parent;
      if(_loc1_.id != undefined)
      {
         if(_loc1_.$checked)
         {
            RoulettDelete(_loc1_);
            ToGame_BeautyShop_RandomSlotClick(_loc1_.id,0);
         }
         else
         {
            if(count_num == limit_num)
            {
               return undefined;
            }
            AddRoulettItem(_loc1_);
            ToGame_BeautyShop_RandomSlotClick(_loc1_.id,1);
         }
         count_num = RoulettArr.length;
         updateUIByCount();
      }
   }
};
configUI();
