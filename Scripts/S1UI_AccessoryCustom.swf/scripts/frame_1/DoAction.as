function setTextTitle(textField, stringID)
{
   textField.textAutoSize = "shrink";
   textField.wordWrap = false;
   textField.multiline = false;
   textField.text = lib.util.UIString.getUIString(stringID);
}
function ToGame_AccessoryCustom_Init()
{
   fscommand("ToGame_AccessoryCustom_Init");
}
function ToGame_AccessoryCustom_Close()
{
   fscommand("ToGame_AccessoryCustom_Exit");
}
function ToGame_AccessoryCustom_Default()
{
   fscommand("ToGame_AccessoryCustom_Default");
}
function ToGame_AccessoryCustom_Enter()
{
   fscommand("ToGame_AccessoryCustom_Enter");
}
function ToGame_AccessoryCustom_Category(index)
{
   getURL("FSCommand:ToGame_AccessoryCustom_Category",index);
}
function ToGame_AccessoryCustom_SildeChange(group, idx, num)
{
   lib.Debuger.trace("ToGame_AccessoryCustom_SildeChange" + group + "/" + idx + " / " + num);
   getURL("FSCommand:ToGame_AccessoryCustom_SildeChange",group + "\t" + idx + "\t" + num);
}
function updateInfoText()
{
   var _loc1_ = false;
   if(hasItem && !sliderEnable)
   {
      _loc1_ = true;
   }
   mc_right.mc_item_area.text_cannot_edit._visible = _loc1_;
}
function SetSlide()
{
   var _loc3_ = saveData.length;
   var _loc2_ = 0;
   while(_loc2_ < _loc3_)
   {
      var _loc1_ = saveData[_loc2_].split("\t");
      buildSlider(_loc1_[0],_loc1_[1],_loc1_[2],_loc1_[3],_loc1_[4],_loc1_[5],_loc1_[6],_loc1_[7],_loc1_[8]);
      _loc2_ = _loc2_ + 1;
   }
}
function buildSlider(group, index, sliderName, min, minT, max, maxT, current, level)
{
   var _loc2_ = mc_right.mc_slider_area["sGroup" + group]["slider" + index];
   _loc2_.showSpaceBar = false;
   _loc2_.returnLevel = true;
   _loc2_.isRealTime = true;
   _loc2_.groupNum = group;
   _loc2_.idx = index;
   _loc2_._width = 307;
   _loc2_.addValue = 0;
   var _loc3_ = current;
   if(min < 0)
   {
      _loc2_.addValue = min;
      _loc3_ = _loc3_ - min;
   }
   _loc2_.setData(min,minT,max,maxT,_loc3_,level);
   _loc2_.drager_mc.valueMc.txt.text = current;
   _loc2_.onChanged = function(_value, _mc)
   {
      var _loc2_ = Number(_value) + Number(this.addValue);
      ToGame_AccessoryCustom_SildeChange(this.groupNum,this.idx,_loc2_);
   };
   _loc2_.bg_mc._visible = false;
   _loc2_.setEnable(sliderEnable);
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
var UI = this;
UI._visible = false;
var UIname = "AccessoryCustom";
this.bWindowOpen = false;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
mc_right.mc_item_area.text_cannot_edit.text = lib.util.UIString.getUIString("$750001");
var tf = new TextFormat();
tf.align = "center";
mc_right.mc_item_area.text_info.setNewTextFormat(tf);
mc_right.mc_item_area.text_info.verticalAlign = "center";
mc_right.mc_item_area.text_info.textAutoSize = "shrink";
mc_right.mc_item_area.text_info.wordWrap = true;
mc_right.mc_item_area.text_info.multiline = true;
mc_right.mc_item_area.text_info.text = lib.util.UIString.getUIString("$750005");
setTextTitle(mc_right.mc_item_area.text_title,"$750006");
setTextTitle(mc_right.mc_slider_area.text_title_size,"$750007");
setTextTitle(mc_right.mc_slider_area.text_title_position,"$750008");
setTextTitle(mc_right.mc_slider_area.text_title_rotation,"$750009");
mc_right.mc_button_area.closeBtn.txt.setText(lib.util.UIString.getUIString("$750002"));
var close_Btn = new lib.util.TxtBtn(mc_right.mc_button_area.closeBtn.btn,mc_right.mc_button_area.closeBtn.txt);
close_Btn.setRelease(ToGame_AccessoryCustom_Close);
mc_right.mc_button_area.defaultBtn.txt.setText(lib.util.UIString.getUIString("$750003"));
var default_Btn = new lib.util.TxtBtn(mc_right.mc_button_area.defaultBtn.btn,mc_right.mc_button_area.defaultBtn.txt);
default_Btn.setRelease(ToGame_AccessoryCustom_Default);
mc_right.mc_button_area.enterBtn.txt.setText(lib.util.UIString.getUIString("$750004"));
var enter_Btn = new lib.util.TxtBtn(mc_right.mc_button_area.enterBtn.btn,mc_right.mc_button_area.enterBtn.txt);
enter_Btn.setRelease(ToGame_AccessoryCustom_Enter);
var comboMc = mc_right.mc_item_area.comboBox;
comboMc._visible = false;
comboMc.onChanged = function(This, selected, selectedIndex)
{
   var _loc1_ = undefined;
   ToGame_AccessoryCustom_Category(selected);
};
comboMc.addListener(mc_right.mc_item_area.comboBox);
myListener.OnGameEventShowWindow = function(_WindowName, _bShow)
{
   if(_WindowName.toLowerCase() == UIname.toLowerCase())
   {
      bWindowOpen = _bShow;
      if(_global.gbUIMode && bWindowOpen)
      {
         UI._visible = true;
         hideEvent(true);
      }
      else
      {
         UI._visible = false;
         hideEvent(false);
      }
   }
};
myListener.OnGame_ChangeStageSize = function()
{
   var _loc1_ = lib.info.AlignInfo.xRatioToPixel(100);
   var _loc2_ = lib.info.AlignInfo.yRatioToPixel(0);
   var _loc3_ = lib.info.AlignInfo.yRatioToPixel(100);
   mc_right._x = _loc1_;
   mc_right._y = _loc2_;
   mc_right.mc_button_area._y = _loc3_ - 30;
};
myListener.OnGame_AccessoryCustom_SetSlideData = function(dataList)
{
   saveData = dataList.split("\n");
   SetSlide();
};
myListener.OnGame_AccessoryCustom_SlideUpData = function(group, index, num)
{
   var _loc1_ = mc_right.mc_slider_area["sGroup" + group]["slider" + index];
   _loc1_.currentV = Number(num) - Number(_loc1_.addValue);
   _loc1_.setSlider();
   _loc1_.drager_mc.valueMc.txt.text = Number(num);
};
myListener.OnGame_AccessoryCustom_SetFocusItem = function(id, img, str)
{
   lib.display.DrawBitmapData.draw(mc_right.mc_item_area.itemSlot,img,0,0,0,0,50,50,0.78125);
   mc_right.mc_item_area.itemTxt.htmlText = str;
   hasItem = id != 0;
   updateInfoText();
};
myListener.OnGame_AccessoryCustom_SetCategory = function(dataList)
{
   comboMc.data = dataList.split("\t");
};
myListener.OnGame_AccessoryCustom_SetEnable = function(bool)
{
   sliderEnable = Boolean(Number(bool));
   SetSlide();
   if(sliderEnable)
   {
      mc_right.mc_slider_area._alpha = 100;
   }
   else
   {
      mc_right.mc_slider_area._alpha = 50;
   }
   updateInfoText();
};
myListener.OnGame_AccessoryCustom_SetButton = function(index, bool)
{
   if(index == 0)
   {
      default_Btn.setEnabled(Boolean(Number(bool)));
   }
   else
   {
      enter_Btn.setEnabled(Boolean(Number(bool)));
   }
};
var hasItem = false;
var sliderEnable = true;
var saveData = [];
myListener.OnGame_ChangeStageSize();
ToGame_AccessoryCustom_Init();
