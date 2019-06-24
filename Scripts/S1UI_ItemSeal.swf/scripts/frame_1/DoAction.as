function ToGame_ItemSeal_Init()
{
   fscommand("ToGame_ItemSeal_Init");
}
function ToGame_ItemSeal_CloseUI()
{
   fscommand("ToGame_ItemSeal_CloseUI");
}
function ToGame_ItemSeal_RequestOptionList(id)
{
   getURL("FSCommand:ToGame_ItemSeal_RequestOptionList",id);
}
function ToGame_ItemSeal_ChangeOption()
{
   fscommand("ToGame_ItemSeal_ChangeOption");
}
function ToGame_ItemSeal_SaveOption()
{
   fscommand("ToGame_ItemSeal_SaveOption");
}
function ToGame_ItemSeal_CancelOption()
{
   container_mc.optionList._visible = false;
   fscommand("ToGame_ItemSeal_CancelOption");
}
function ToGame_ItemSeal_SelectOption(id)
{
   getURL("FSCommand:ToGame_ItemSeal_SelectOption",id);
}
function ToGame_ItemSeal_ClickOptionButton(buttonIndex)
{
   getURL("FSCommand:ToGame_ItemSeal_ClickOptionButton",buttonIndex);
}
function clearTargetItem()
{
   var _loc1_ = container_mc.targetItem;
   clearItem(_loc1_);
   _loc1_.itemSeal._visible = false;
   _loc1_.enchantTF.text = "";
   _loc1_.nameTF.text = "";
   _loc1_.levelTF.text = "";
}
function clearMaterialItem()
{
   var _loc1_ = container_mc.materialItem;
   clearItem(_loc1_);
   _loc1_.countTF.text = "x 0";
   container_mc.materialCountTF.text = "";
}
function clearItem(target)
{
   target.icon.clear();
   target.grade._visible = false;
   lib.manager.ToolTip.remove(target.hit);
}
function setTargetItemLevel(currentLevel, maxLevel)
{
   currentLevel = Number(currentLevel);
   maxLevel = Number(maxLevel);
   var _loc3_ = lib.util.UIString.getUIString("$640003","currentLevel",currentLevel,"maxLevel",maxLevel);
   container_mc.targetItem.levelTF.htmlText = _loc3_;
}
function setCurrentOptionListButtonEvent(target)
{
   var _loc2_ = target.button;
   _loc2_.onRollOver = function()
   {
      this.gotoAndStop(2);
   };
   _loc2_.onRollOut = _loc2_.onReleaseOutside = function()
   {
      this.gotoAndStop(1);
   };
   _loc2_.onPress = function()
   {
      this.gotoAndStop(3);
   };
   _loc2_.onRelease = function()
   {
      ToGame_ItemSeal_RequestOptionList(this._parent.id);
   };
}
function alignCurrentOptionList()
{
   var _loc6_ = container_mc.list_mc;
   var _loc1_ = 15;
   var _loc5_ = currentOptionList.length;
   container_mc.list_mc.bg._visible = container_mc.list_mc.line._visible = false;
   var _loc2_ = 0;
   while(_loc2_ < _loc5_)
   {
      var _loc4_ = currentOptionList[_loc2_];
      var _loc3_ = _loc6_["mc_" + _loc4_];
      _loc3_._y = _loc1_;
      _loc1_ = _loc1_ + _loc3_._height + 10;
      if(_loc2_ == lineCount)
      {
         container_mc.list_mc.bg._height = _loc1_;
         container_mc.list_mc.line._y = _loc1_;
         _loc1_ = _loc1_ + 15;
         container_mc.list_mc.bg._visible = container_mc.list_mc.line._visible = true;
      }
      _loc2_ = _loc2_ + 1;
   }
   listScrollbar.pageSize = _loc1_ + 25;
}
function clearAlignCurrentOptionList()
{
   var _loc3_ = container_mc.list_mc;
   var _loc2_ = 0;
   while(_loc2_ < currentOptionMaxCount)
   {
      var _loc1_ = _loc3_["mc_" + _loc2_];
      _loc1_.id = undefined;
      _loc1_.tf0.text = "";
      _loc1_.tf1.text = "";
      _loc2_ = _loc2_ + 1;
   }
}
function clearOptionList()
{
   selectedOptionIndex = 0;
   var _loc3_ = container_mc.optionList.list;
   var _loc2_ = 0;
   while(_loc2_ < createdOptionCount)
   {
      var _loc1_ = _loc3_["mc_" + _loc2_];
      _loc1_._visible = false;
      _loc1_.id = undefined;
      _loc1_.checked = false;
      _loc2_ = _loc2_ + 1;
   }
}
function alignOptionList()
{
   var _loc4_ = container_mc.optionList.list;
   var _loc3_ = 0;
   var _loc1_ = 0;
   while(_loc1_ < usedOptionCount)
   {
      var _loc2_ = _loc4_["mc_" + _loc1_];
      _loc2_._y = _loc3_;
      _loc3_ = _loc3_ + _loc2_.txt._height + 7;
      _loc1_ = _loc1_ + 1;
   }
   optionListScroll.pageSize = _loc3_ + 20;
}
function setOptionButtonMouseEvent(target)
{
   target.onRollOver = function()
   {
      if(4 == this._currentframe)
      {
         return undefined;
      }
      this.tf.textColor = "0xC4F5FF";
      this.gotoAndStop(2);
   };
   target.onRollOut = target.onReleaseOutside = function()
   {
      if(4 == this._currentframe)
      {
         return undefined;
      }
      var _loc2_ = mc.preFrame != 4?"0x80B5DE":"0xFFFFFF";
      this.tf.textColor = _loc2_;
      this.gotoAndStop(this.preFrame);
   };
   target.onPress = function()
   {
      if(4 == this._currentframe)
      {
         return undefined;
      }
      this.tf.textColor = "0xC4F5FF";
      this.gotoAndStop(3);
   };
   target.onRelease = function()
   {
      if(4 == this._currentframe)
      {
         return undefined;
      }
      ToGame_ItemSeal_ClickOptionButton(this.index);
   };
}
var UI = this;
UI._visible = false;
var UIname = "ItemSeal";
this.bWindowOpen = false;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
container_mc.UIDrager.setData(UIName,UI);
var tipStr = lib.util.UIString.getUIString("$640010");
container_mc.tipTF.htmlText = tipStr;
var optionListTipStr = lib.util.UIString.getUIString("$640008");
container_mc.optionList.tipTF.htmlText = optionListTipStr;
var usedOptionCount = 0;
var createdOptionCount = 0;
var currentOptionList = [];
var GAGE_WIDTH = 72;
var ICON_SIZE = 50;
var ICON_SCALE = ICON_SIZE / 60;
var nameTextColorByGrade = [lib.info.TextColor.RAREGRADE0,lib.info.TextColor.RAREGRADE1,lib.info.TextColor.RAREGRADE2,lib.info.TextColor.RAREGRADE3];
var textColor = [lib.info.TextColor.GENERAL_DISABLE,lib.info.TextColor.GENERAL_EMPHASIS,"0x6B5B39","0xDBB006"];
var x_btn = new lib.util.TxtBtn(container_mc.x_mc);
x_btn.setRelease(ToGame_ItemSeal_CloseUI);
var changeOptionButton = container_mc.changeOptionButton.txtBtn;
changeOptionButton.setRelease(ToGame_ItemSeal_ChangeOption);
changeOptionButton.setEnabled(false);
var saveOptionButton = container_mc.optionList.saveButton.txtBtn;
saveOptionButton.setRelease(ToGame_ItemSeal_SaveOption);
saveOptionButton.setEnabled(true);
var cancelOptionButton = container_mc.optionList.cancelButton.txtBtn;
cancelOptionButton.setRelease(ToGame_ItemSeal_CancelOption);
cancelOptionButton.setEnabled(true);
var list_mcY = container_mc.list_mc._y;
var listScrollbar = container_mc.scrollbar0;
listScrollbar.addListener(container_mc.list_mc);
container_mc.list_mc.onScroll = function()
{
   container_mc.list_mc._y = list_mcY - arguments[0];
};
listScrollbar.setWheel(container_mc.list_mc);
listScrollbar.wheelDelta = 1;
listScrollbar.pageSize = 0;
listScrollbar.displaySize = container_mc.mask_mc0._height;
listScrollbar.defaultBarSizeRatio = 0.3333333333333333;
listScrollbar.rowHeight = 30;
listScrollbar.scroll = 0;
var optionList = container_mc.optionList;
var optionListY = optionList.list._y;
var optionListScroll = optionList.scroll;
optionListScroll.addListener(optionList.list);
optionList.list.onScroll = function()
{
   optionList.list._y = optionListY - arguments[0];
};
optionListScroll.setWheel(optionList.list);
optionListScroll.wheelDelta = 1;
optionListScroll.pageSize = 0;
optionListScroll.displaySize = optionList.mask._height;
optionListScroll.defaultBarSizeRatio = 0.3333333333333333;
optionListScroll.rowHeight = 30;
optionListScroll.scroll = 0;
container_mc.optionList._visible = false;
container_mc.targetItem.nameTF.verticalAlign = "center";
myListener.OnGameEventShowWindow = function(_WindowName, _bShow)
{
   if(_WindowName.toLowerCase() == UIname.toLowerCase())
   {
      bWindowOpen = _bShow;
      if(_global.gbUIMode && bWindowOpen)
      {
         UI._visible = true;
      }
      else
      {
         UI._visible = false;
      }
   }
};
myListener.OnGameEventChangeUIMode = function(_bShow)
{
   if(_global.gbUIMode && bWindowOpen)
   {
      UI._visible = true;
   }
   else
   {
      UI._visible = false;
   }
};
myListener.OnGame_ItemSeal_SetTargetItem = function(id, name, img, grade, sealType, enchant, currentLevel, maxLevel)
{
   clearTargetItem();
   grade = Number(grade);
   sealType = Number(sealType);
   enchant = Number(enchant);
   var _loc6_ = flash.display.BitmapData.loadBitmap(img);
   var _loc1_ = container_mc.targetItem;
   _loc1_.grade._visible = 0 < grade;
   _loc1_.itemSeal._visible = 0 < sealType;
   _loc1_.grade.gotoAndStop(grade);
   _loc1_.itemSeal.gotoAndStop(sealType);
   lib.display.DrawBitmapData.draw(_loc1_.icon,_loc6_,0,0,0,0,ICON_SIZE,ICON_SIZE,ICON_SCALE);
   _loc1_.nameTF.setText(name);
   _loc1_.nameTF.textColor = nameTextColorByGrade[grade];
   if(0 < enchant)
   {
      var _loc3_ = impossible <= 0?21433:3615811;
      if(enchant > 11 && enchant < 15)
      {
         _loc3_ = impossible <= 0?8915599:2299429;
      }
      else if(enchant > 14)
      {
         _loc3_ = impossible <= 0?10624002:4074792;
      }
      _loc1_.enchantTF.shadowColor = _loc3_;
      _loc1_.enchantTF.textColor = impossible <= 0?14145495:7368816;
      _loc1_.enchantTF.text = "+" + enchant;
   }
   setTargetItemLevel(currentLevel,maxLevel);
   lib.manager.ToolTip.add(_loc1_.hit,id,6);
};
myListener.OnGame_ItemSeal_UpdateTargetItem = function(currentLevel, maxLevel)
{
   setTargetItemLevel(currentLevel,maxLevel);
};
myListener.OnGame_ItemSeal_SetMaterialItem = function(id, img, grade, needCount, count)
{
   clearMaterialItem();
   grade = Number(grade);
   needCount = Number(needCount);
   count = Number(count);
   var _loc5_ = flash.display.BitmapData.loadBitmap(img);
   var _loc1_ = container_mc.materialItem;
   _loc1_.grade._visible = 0 < grade;
   _loc1_.grade.gotoAndStop(grade);
   lib.display.DrawBitmapData.draw(_loc1_.icon,_loc5_,0,0,0,0,ICON_SIZE,ICON_SIZE,ICON_SCALE);
   var _loc3_ = lib.util.UIString.getUIString("$640004","count",count);
   container_mc.materialCountTF.text = _loc3_;
   _loc1_.needCountTF.text = "x " + needCount;
   _loc1_.needCountTF._width = _loc1_.needCountTF.textWidth + 5;
   _loc1_._x = 365 - (_loc1_._width - 5) / 2;
   lib.manager.ToolTip.add(_loc1_.hit,id,6);
};
myListener.OnGame_ItemSeal_UpdateMaterialItem = function(needCount, count)
{
   var _loc1_ = container_mc.materialItem;
   _loc1_.needCountTF.text = "x " + needCount;
   _loc1_.needCountTF._width = _loc1_.needCountTF.textWidth + 5;
   _loc1_._x = 365 - (_loc1_._width - 5) / 2;
   var _loc2_ = lib.util.UIString.getUIString("$640004","count",count);
   container_mc.materialCountTF.text = _loc2_;
};
var lineCount = 0;
myListener.OnGame_ItemSeal_SetCurrentOptionList = function(param, count)
{
   count = Number(count);
   count = !isNaN(count)?count:0;
   lineCount = count - 1;
   listScrollbar.pageSize = 0;
   listScrollbar.scroll = 0;
   currentOptionList = [];
   var _loc3_ = container_mc.list_mc;
   for(var _loc6_ in _loc3_)
   {
      if(typeof _loc3_[_loc6_] == "movieclip")
      {
         _loc3_[_loc6_].removeMovieClip();
      }
   }
   var _loc11_ = lib.util.ExtString.split(param,"\n");
   var _loc12_ = _loc11_.length;
   _loc6_ = 0;
   while(_loc6_ < _loc12_)
   {
      var _loc2_ = lib.util.ExtString.split(_loc11_[_loc6_],"\t");
      var _loc5_ = _loc2_[0];
      var _loc10_ = _loc2_[1];
      var _loc8_ = _loc2_[2];
      var _loc9_ = Number(_loc2_[3]);
      currentOptionList.push(_loc5_);
      var _loc1_ = _loc3_.attachMovie("optionMc","mc_" + _loc5_,_loc3_.getNextHighestDepth());
      setCurrentOptionListButtonEvent(_loc1_);
      _loc1_.id = _loc5_;
      _loc1_.tf0.text = _loc10_;
      _loc1_.tf1.text = _loc8_;
      _loc1_.tf0.textColor = _loc1_.tf1.textColor = textColor[_loc9_];
      var _loc7_ = _loc1_.tf1.numLines;
      var _loc4_ = _loc1_.tf1.textHeight;
      _loc1_.tf1._height = _loc4_ + 5;
      _loc1_.tf0._y = 1 >= _loc7_?0:_loc4_ / 2 - _loc1_.tf0.textHeight / 2;
      _loc1_.button._y = 1 >= _loc7_?-1:_loc4_ / 2 - _loc1_.button._height / 2;
      _loc6_ = _loc6_ + 1;
   }
   alignCurrentOptionList();
};
myListener.OnGame_ItemSeal_UpdateCurrentOptionList = function(id, str, textColorType)
{
   textColorType = Number(textColorType);
   var _loc5_ = container_mc.list_mc;
   var _loc1_ = _loc5_["mc_" + id];
   _loc1_.tf1.text = str;
   _loc1_.tf0.textColor = _loc1_.tf1.textColor = textColor[textColorType];
   var _loc3_ = _loc1_.tf1.numLines;
   var _loc2_ = _loc1_.tf1.textHeight;
   _loc1_.tf1._height = _loc2_ + 5;
   _loc1_.tf0._y = 1 >= _loc3_?0:_loc2_ / 2 - _loc1_.tf0.textHeight / 2;
   _loc1_.button._y = 1 >= _loc3_?-1:_loc2_ / 2 - _loc1_.button._height / 2;
   alignCurrentOptionList();
};
var selectedOptionIndex = 0;
myListener.OnGame_ItemSeal_SetOptionList = function(param, selectedId)
{
   clearOptionList();
   optionListScroll.pageSize = 0;
   optionListScroll.scroll = 0;
   var _loc7_ = lib.util.ExtString.split(param,"\n");
   usedOptionCount = _loc7_.length;
   var parent = container_mc.optionList.list;
   var _loc3_ = 0;
   while(_loc3_ < usedOptionCount)
   {
      var _loc4_ = lib.util.ExtString.split(_loc7_[_loc3_],"\t");
      var id = _loc4_[0];
      var _loc5_ = _loc4_[1];
      var _loc6_ = Number(_loc4_[2]);
      var _loc2_ = parent["mc_" + _loc3_];
      if(undefined == _loc2_)
      {
         _loc2_ = parent.attachMovie("Comp:S_RadioButton","mc_" + _loc3_,parent.getNextHighestDepth());
         _loc2_.index = _loc3_;
         createdOptionCount++;
         _loc2_.onChanged = function()
         {
            if(this.index == selectedOptionIndex)
            {
               this.checked = true;
               return undefined;
            }
            parent["mc_" + selectedOptionIndex].checked = false;
            selectedOptionIndex = this.index;
            ToGame_ItemSeal_SelectOption(this.id);
         };
      }
      _loc2_.id = id;
      _loc2_.txt.text = _loc5_;
      _loc2_.txt._height = _loc2_.txt.textHeight + 5;
      _loc2_.txt.textColor = textColor[_loc6_];
      _loc2_._visible = true;
      if(id == selectedId)
      {
         _loc2_.checked = true;
         selectedOptionIndex = _loc3_;
      }
      _loc3_ = _loc3_ + 1;
   }
   alignOptionList();
   container_mc.optionList._visible = true;
   hit.gotoAndStop(2);
};
myListener.OnGame_ItemSeal_SetButtonEnabled = function(bEnabled, buttonStr, tooltipStr)
{
   lib.manager.ToolTip.remove(container_mc.changeOptionButton);
   bEnabled = Boolean(Number(bEnabled));
   changeOptionButton.setEnabled(bEnabled);
   changeOptionButton.setText(buttonStr);
   if(undefined != tooltipStr && "undefined" != tooltipStr && "" != tooltipStr)
   {
      lib.manager.ToolTip.add(container_mc.changeOptionButton,tooltipStr,1);
   }
};
myListener.OnGame_ItemSeal_SetGuide = function(guideStr)
{
   container_mc.tipTF.htmlText = guideStr;
};
var buttonCount = 0;
var currentMaxCount = 0;
myListener.OnGame_ItemSeal_SetOptionButton = function(_currentNum, _maxNum)
{
   _currentNum = Number(_currentNum);
   currentMaxCount = Number(_maxNum);
   var _loc5_ = _currentNum - 1;
   var _loc2_ = 0;
   while(_loc2_ < buttonCount)
   {
      var _loc1_ = container_mc["option_button_" + _loc2_];
      _loc1_._visible = false;
      _loc2_ = _loc2_ + 1;
   }
   buttonCount = Math.max(buttonCount,currentMaxCount);
   _loc2_ = 0;
   while(_loc2_ < currentMaxCount)
   {
      _loc1_ = container_mc["option_button_" + _loc2_];
      if(undefined == _loc1_)
      {
         _loc1_ = container_mc.attachMovie("optionButton","option_button_" + _loc2_,container_mc.getNextHighestDepth());
         _loc1_._x = 106 + 23 * _loc2_;
         _loc1_._y = 170;
         _loc1_.index = _loc2_;
         var _loc3_ = String(Number(_loc1_.index) + 1);
         _loc1_.tf.text = _loc3_;
         setOptionButtonMouseEvent(_loc1_);
      }
      _loc1_._visible = true;
      _loc1_.preFrame = _loc2_ != _loc5_?1:4;
      var _loc4_ = _loc2_ != _loc5_?"0x80B5DE":"0xFFFFFF";
      _loc1_.tf.textColor = _loc4_;
      _loc1_.gotoAndStop(_loc1_.preFrame);
      _loc2_ = _loc2_ + 1;
   }
};
ToGame_ItemSeal_Init();
