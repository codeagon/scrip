function ToGame_Enchant_Init()
{
   fscommand("ToGame_Enchant_Init");
}
function ToGame_Enchant_CloseUI()
{
   lib.Debuger.trace("ToGame_Enchant_CloseUI");
   fscommand("ToGame_Enchant_CloseUI");
}
function ToGame_Enchant_ClickButton(id)
{
   lib.Debuger.trace("ToGame_Enchant_ClickButton : " + id);
   getURL("FSCommand:ToGame_Enchant_ClickButton",id);
}
function ToGame_Enchant_SelectedMaterialSlot(index)
{
   lib.Debuger.trace("ToGame_Enchant_SelectedMaterialSlot : " + index);
   getURL("FSCommand:ToGame_Enchant_SelectedMaterialSlot",index);
}
function ToGame_Enchant_EndPrograss()
{
   lib.Debuger.trace("ToGame_Enchant_EndPrograss");
   fscommand("ToGame_Enchant_EndPrograss");
}
function ToGame_Enchant_EndResultEffect()
{
   lib.Debuger.trace("ToGame_Enchant_EndResultEffect");
   fscommand("ToGame_Enchant_EndResultEffect");
}
function ToGame_Enchant_ClickMouseRightButton()
{
   lib.Debuger.trace("ToGame_Enchant_ClickMouseRightButton");
   fscommand("ToGame_Enchant_ClickMouseRightButton");
}
function finishPrograss()
{
   clearTimeout(timerId);
   timerId = null;
   container_mc.prograss.effect._x = 0;
   container_mc.prograss.effect._visible = false;
   ToGame_Enchant_EndPrograss();
}
function hideResultEffect()
{
   gs.TweenLite.to(container_mc.resultMc,0.5,{delay:1.5,_alpha:0,ease:easing.Strong.easeOut,onComplete:finishResultEffect});
}
function finishResultEffect()
{
   container_mc.button_0.txtBtn.setEnabled(container_mc.button_0.buttonState == BUTTON_STATE_NORMAL);
   container_mc.button_1.txtBtn.setEnabled(container_mc.button_1.buttonState == BUTTON_STATE_NORMAL);
   container_mc.targetSlot.drag = true;
   container_mc.resultMc._visible = false;
   ToGame_Enchant_EndResultEffect();
   container_mc.resultMc.gotoAndStop(1);
   container_mc.resultAniBg.gotoAndStop(1);
}
function clearAll()
{
   clearTargetItem();
   clearMaterialItemList();
   clearComponent();
}
function clearComponent()
{
   container_mc.button_0.txtBtn.setEnabled(false);
   container_mc.button_1.txtBtn.setEnabled(false);
   container_mc.button_0.buttonState = BUTTON_STATE_DISABLED;
   container_mc.button_1.buttonState = BUTTON_STATE_DISABLED;
   container_mc.button_0._y = container_mc.button_1._y = 570;
   container_mc.prograss.maskMc._xscale = 0;
   container_mc.prograss.effect._x = 0;
   container_mc.prograss.effect._visible = false;
   container_mc.materialTitleBg._visible = false;
   container_mc.tipIcon._visible = false;
   container_mc.tipIcon._y = 523;
   container_mc.successTF.text = "";
   container_mc.successTF._y = 523;
   container_mc.goldBg._visible = false;
   container_mc.goldBg._y = 517;
   container_mc.goldTF.text = "";
   container_mc.goldTF._y = 522;
   container_mc.guideTF._visible = true;
   container_mc.guideTF.htmlText = guideStr;
   container_mc.guideTF._y = 222;
   container_mc.bg._height = 635;
}
function clearTargetItem()
{
   container_mc.nameTF.text = "";
   container_mc.currentInfoTF.text = "";
   container_mc.nextInfoTF.text = "";
   container_mc.curTitleTF._visible = false;
   container_mc.nextTitleTF._visible = false;
   container_mc.proficiencyTF.text = "";
   container_mc.levelTF.text = "";
   container_mc.currentEnchant._visible = false;
   container_mc.nextEnchant._visible = false;
   var _loc1_ = container_mc.Enchant__0;
   _loc1_.id = undefined;
   _loc1_.clear();
   _loc1_.enchantTF.text = "";
   lib.manager.ToolTip.remove(_loc1_.SLOT);
   var _loc2_ = _loc1_.blink;
   if(undefined == _loc2_)
   {
      _loc2_ = _loc1_.attachMovie("slotBlink","blink",_loc1_.getNextHighestDepth());
      _loc2_.hitTestDisable = true;
      _loc2_._x = _loc1_.Icon._x;
      _loc2_._y = _loc1_.Icon._y;
   }
   _loc2_._visible = true;
}
function clearMaterialItemList()
{
   var _loc2_ = 0;
   while(_loc2_ < MAX_MATERIALSLOT)
   {
      var _loc1_ = container_mc["materialSlot_" + _loc2_];
      _loc1_.id = undefined;
      _loc1_.clear();
      _loc1_.enchantTF.text = "";
      _loc1_.keepCountTF.text = "";
      _loc1_.disable._visible = false;
      lib.manager.ToolTip.remove(_loc1_.SLOT);
      _loc1_._visible = false;
      _loc2_ = _loc2_ + 1;
   }
}
var UI = this;
var UIname = "Enchant";
UI._visible = false;
var bWidgetOpen = false;
var guideStr = lib.util.UIString.getUIString("$155004");
var maxGuideStr = lib.util.UIString.getUIString("$155005");
container_mc.button_0.txtBtn = new lib.util.TxtBtn(container_mc.button_0.mc,container_mc.button_0.tf);
container_mc.button_1.txtBtn = new lib.util.TxtBtn(container_mc.button_1.mc,container_mc.button_1.tf);
container_mc.button_0.buttonState = BUTTON_STATE_NORMAL;
container_mc.button_1.buttonState = BUTTON_STATE_NORMAL;
container_mc.button_0.txtBtn.setTextColor("0xEDE0AC","0xEDE0AC","0xEDE0AC","0x808080");
container_mc.button_1.txtBtn.setTextColor("0xEDE0AC","0xEDE0AC","0xEDE0AC","0x808080");
container_mc.button_0.mc.onRelease2 = function()
{
   ToGame_Enchant_ClickButton(0);
};
container_mc.button_1.mc.onRelease2 = function()
{
   ToGame_Enchant_ClickButton(1);
};
var closeButton = new lib.util.TxtBtn(container_mc.closeButton);
closeButton.setRelease(ToGame_Enchant_CloseUI);
var BUTTON_POS_Y = [490,570,670];
var GOLD_POS_Y = [450,450,550];
var GOLD_BG_POS_Y = [450,517];
var BUTTON_POS_X = [188,188,100];
var MAX_MATERIALSLOT = 8;
container_mc.Enchant__0.tooltipIndex = 0;
var i = 0;
while(i < MAX_MATERIALSLOT)
{
   var slot = container_mc["materialSlot_" + i];
   slot.index = i;
   slot.tooltipIndex = i + 1;
   slot.drag = false;
   slot.effect = false;
   slot.onRelease2 = function()
   {
      ToGame_Enchant_SelectedMaterialSlot(this.index);
   };
   i++;
}
container_mc.result._visible = false;
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
         if(null != timerId)
         {
            clearTimeout(timerId);
            timerId = null;
         }
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
      if(null != timerId)
      {
         clearTimeout(timerId);
         timerId = null;
      }
      UI._visible = false;
   }
};
myListener.OnGame_Enchant_SetTargetItem = function(itemId, img, grade, name, enchant, bMaxEnchant, currentLevel, maxLevel, currentInfo, nextInfo, currentProficiency, maxProficiency)
{
   clearTargetItem();
   grade = Number(grade);
   enchant = Number(enchant);
   bMaxEnchant = Boolean(Number(bMaxEnchant));
   currentProficiency = Number(currentProficiency);
   maxProficiency = Number(maxProficiency);
   var _loc9_ = lib.util.UIString.getUIString("$155008","currentLevel",currentLevel,"maxLevel",maxLevel);
   var _loc8_ = lib.util.UIString.getUIString("$155006","current",currentProficiency,"max",maxProficiency);
   container_mc.levelTF.htmlText = _loc9_;
   container_mc.proficiencyTF.htmlText = _loc8_;
   container_mc.nameTF.htmlText = name;
   container_mc.nameTF._visible = true;
   var _loc2_ = container_mc.Enchant__0;
   _loc2_.id = itemId;
   var _loc4_ = _loc2_.enchantTF;
   var _loc5_ = 21433;
   if(11 < enchant && enchant < 15)
   {
      _loc5_ = 8915599;
   }
   else if(14 < enchant)
   {
      _loc5_ = 10624002;
   }
   _loc4_.shadowColor = _loc5_;
   _loc4_.text = !(isNaN(enchant) || enchant < 1)?"+" + enchant:"";
   _loc4_.textColor = 14145495;
   var _loc6_ = enchant;
   var _loc10_ = !bMaxEnchant?enchant + 1:enchant;
   container_mc.currentEnchant.gotoAndStop(_loc6_ + 1);
   container_mc.nextEnchant.gotoAndStop(_loc10_ + 1);
   container_mc.currentEnchant._visible = true;
   container_mc.nextEnchant._visible = true;
   container_mc.curTitleTF._visible = true;
   container_mc.nextTitleTF._visible = true;
   container_mc.currentInfoTF.htmlText = currentInfo;
   container_mc.nextInfoTF.htmlText = nextInfo;
   container_mc.currentInfoTF._visible = !bMaxEnchant;
   container_mc.nextInfoTF._visible = !bMaxEnchant;
   container_mc.guideTF._visible = bMaxEnchant;
   container_mc.guideTF.htmlText = maxGuideStr;
   container_mc.guideTF._y = 275;
   _loc2_.draw(img,54,54);
   _loc2_.grade = grade;
   _loc2_.active = true;
   var _loc7_ = _loc2_.tooltipIndex;
   lib.manager.ToolTip.add(_loc2_.SLOT,itemId + "\t" + _loc7_,6);
   if(_loc2_.blink)
   {
      _loc2_.blink._visible = false;
   }
};
myListener.OnGame_Enchant_ClearTargetItem = function()
{
   clearAll();
};
myListener.OnGame_Enchant_SetMaterialItemList = function(itemParam, successedPercent, gold, bEnough, tooltipStr)
{
   clearMaterialItemList();
   lib.manager.ToolTip.remove(container_mc.tipIcon);
   container_mc.successTF.text = "";
   container_mc.goldTF.text = "";
   container_mc.tipIcon._visible = container_mc.goldBg._visible = true;
   container_mc.materialTitleBg._visible = true;
   var _loc16_ = !bEnough?-1:0;
   var _loc14_ = lib.util.GoldCurrency.SetGoldText(gold,0,0,_loc16_,0);
   container_mc.goldTF.htmlText = _loc14_;
   lib.manager.ToolTip.add(container_mc.tipIcon,tooltipStr,1);
   var _loc15_ = lib.util.UIString.getUIString("$155009","percent",successedPercent);
   container_mc.successTF.htmlText = _loc15_;
   var _loc13_ = lib.util.ExtString.split(itemParam,"\n");
   var _loc12_ = _loc13_.length;
   var _loc3_ = 0;
   while(_loc3_ < _loc12_)
   {
      var _loc2_ = lib.util.ExtString.split(_loc13_[_loc3_],"\t");
      var _loc7_ = _loc2_[0];
      var _loc8_ = _loc2_[1];
      var _loc11_ = Number(_loc2_[2]);
      var _loc4_ = Number(_loc2_[3]);
      var _loc5_ = Number(_loc2_[4]);
      var _loc10_ = Boolean(Number(_loc2_[5]));
      var _loc1_ = container_mc["materialSlot_" + _loc3_];
      _loc1_._visible = true;
      _loc1_.draw(_loc8_,54,54);
      _loc1_.grade = _loc11_;
      _loc1_.num = _loc4_;
      _loc1_.active = bSelected;
      _loc1_.disable._visible = _loc5_ < _loc4_;
      var _loc9_ = _loc5_ >= _loc4_?"#E08E15":"#C00005";
      _loc1_.keepCountTF.htmlText = "<font color=\'" + _loc9_ + "\'>" + lib.util.UIString.getUIString("$155007","count",_loc5_) + "</font>";
      lib.Debuger.trace("materialSlot.keepCountTF.text : " + _loc1_.keepCountTF.text);
      _loc1_.effect = _loc10_;
      var _loc6_ = _loc1_.tooltipIndex;
      lib.manager.ToolTip.add(_loc1_.SLOT,_loc7_ + "\t" + _loc6_,6);
      _loc3_ = _loc3_ + 1;
   }
   if(4 < _loc12_)
   {
      container_mc.button_0._y = container_mc.button_0._y + 100;
      container_mc.button_1._y = container_mc.button_1._y + 100;
      container_mc.tipIcon._y = container_mc.tipIcon._y + 100;
      container_mc.successTF._y = container_mc.successTF._y + 100;
      container_mc.goldTF._y = container_mc.goldTF._y + 100;
      container_mc.goldBg._y = container_mc.goldBg._y + 100;
      container_mc.bg._height = container_mc.bg._height + 100;
   }
};
var BUTTON_STATE_NORMAL = 0;
var BUTTON_STATE_DISABLED = 1;
myListener.OnGame_Enchant_SetButtonState = function(buttonParam)
{
   var _loc6_ = lib.util.ExtString.split(buttonParam,"\n");
   var _loc7_ = _loc6_.length;
   var _loc1_ = 0;
   while(_loc1_ < _loc7_)
   {
      var _loc2_ = container_mc["button_" + _loc1_];
      var _loc3_ = lib.util.ExtString.split(_loc6_[_loc1_],"\t");
      var _loc5_ = _loc3_[0];
      var _loc4_ = _loc3_[1];
      _loc2_.buttonState = _loc4_;
      _loc2_.txtBtn.setText(_loc5_);
      _loc2_.txtBtn.setEnabled(_loc4_ != BUTTON_STATE_DISABLED);
      _loc1_ = _loc1_ + 1;
   }
};
var timerId = null;
myListener.OnGame_Enchant_StartPrograss = function()
{
   gs.TweenLite.killTweensOf(container_mc.resultMc,false);
   container_mc.resultMc._visible = false;
   container_mc.resultMc.gotoAndStop(1);
   container_mc.resultAniBg.gotoAndStop(1);
   container_mc.effectAni.gotoAndPlay(2);
   container_mc.button_0.txtBtn.setEnabled(false);
   container_mc.button_1.txtBtn.setEnabled(false);
   container_mc.targetSlot.drag = false;
   if(null != timerId)
   {
      clearTimeout(timerId);
      timerId = null;
   }
   timerId = setTimeout(finishPrograss,2000);
};
myListener.OnGame_Enchant_SetResult = function(bSuccess)
{
   bSuccess = Boolean(Number(bSuccess));
   var _loc2_ = !bSuccess?3:2;
   container_mc.resultMc._alpha = 0;
   container_mc.resultMc._visible = true;
   container_mc.effectAni.gotoAndStop(1);
   container_mc.resultMc.gotoAndStop(_loc2_);
   container_mc.resultMc.tf.text = !bSuccess?lib.util.UIString.getUIString("$155011"):lib.util.UIString.getUIString("$155010");
   container_mc.m.gotoAndStop(_loc2_);
   gs.TweenLite.to(container_mc.resultMc,1,{_alpha:100,ease:easing.Strong.easeOut,onComplete:hideResultEffect});
};
myListener.OnGame_MouseDown = function(button, target)
{
   if(bWidgetOpen == false)
   {
      return undefined;
   }
   button = Number(button);
   if(button == 2)
   {
      if(target._parent._name == "Enchant__0")
      {
         var _loc2_ = target._parent.id;
         if(_loc2_ != undefined)
         {
            ToGame_Enchant_ClickMouseRightButton();
         }
      }
   }
};
clearAll();
ToGame_Enchant_Init();
