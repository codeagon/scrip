function drawBitmap(target, LinkageID)
{
   var _loc3_ = flash.display.BitmapData.loadBitmap(LinkageID);
   var _loc1_ = target.createEmptyMovieClip(LinkageID,1);
   _loc1_.attachBitmap(_loc3_,1);
   _loc1_._width = 48;
   _loc1_._height = 48;
   target.resourcID = LinkageID;
}
function ToGame_HomunIncubator_Take()
{
   fscommand("ToGame_HomunIncubator_Take");
}
function ToGame_HomunIncubator_Active()
{
   fscommand("ToGame_HomunIncubator_Active");
}
function ToGame_HomunIncubator_CloseUI()
{
   fscommand("ToGame_HomunIncubator_CloseUI");
}
function clearHomunSlot()
{
   selectSlot = undefined;
   var _loc2_ = 0;
   while(_loc2_ < SLOTCOUNT)
   {
      var _loc1_ = container_mc["HomunIncubator__" + _loc2_];
      _loc1_.clear();
      lib.manager.ToolTip.remove(_loc1_.SLOT);
      _loc1_.disableSlot = true;
      _loc2_ = _loc2_ + 1;
   }
   homunCount = 0;
}
var UI = this;
UI._visible = false;
bWidgetOpen = false;
var UIname = "HomunIncubator";
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
container_mc.text_name.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
container_mc.receipt_txt.verticalAlign = "bottom";
var SLOTCOUNT = 5;
var firstHpData = true;
var pastHp = 0;
var pastMaxHp = 0;
var currentEnergy = 0;
var demage = 0;
var heal = 0;
var skillValue = 0;
var preSkillValue = 0;
var firstSkillValueSetting = true;
var cubeState = 0;
var homunCount = 0;
var selectSlot;
var guideTxtY = container_mc.guide_txt._y;
var minuteColor = 10677578;
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
      UI._visible = false;
   }
};
myListener.OnGame_HomunIncubator_SetSkillValue = function(currentValue, maxValue)
{
   currentValue = Number(currentValue);
   if(firstSkillValueSetting)
   {
      preSkillValue = currentValue;
      skillValue = currentValue;
      firstSkillValueSetting = false;
   }
   else
   {
      preSkillValue = skillValue;
      skillValue = currentValue;
   }
   maxValue = Number(maxValue);
   if(currentValue == maxValue)
   {
      container_mc.hp_txt.textColor = lib.info.TextColor.FILL_FULL;
   }
   else
   {
      container_mc.hp_txt.textColor = lib.info.TextColor.FILL_SHORT;
   }
   container_mc.hp_mc.hpMask_mc._xscale = currentValue / maxValue * 100;
   container_mc.hp_txt.text = currentValue + " / " + maxValue;
};
myListener.OnGame_HomunIncubator_SetState = function(state)
{
   cubeState = Number(state);
   if(cubeState == 0)
   {
      container_mc.guide_txt._y = guideTxtY - 10;
      container_mc.guide_txt.text = "$161007";
      take_btn.setEnabled(false);
      active_btn.setEnabled(homunCount > 0);
      container_mc.timer_mc.timerMask_mc._xscale = 0;
   }
   else if(cubeState == 1)
   {
      container_mc.guide_txt._y = guideTxtY;
      container_mc.guide_txt.text = "$161008";
      take_btn.setEnabled(false);
      active_btn.setEnabled(false);
   }
   else if(cubeState == 2)
   {
      container_mc.guide_txt._y = guideTxtY - 10;
      var _loc1_ = skillValue - preSkillValue;
      container_mc.guide_txt.html = true;
      container_mc.guide_txt.htmlText = lib.util.UIString.getUIString("$161009");
      if(_loc1_ > 0)
      {
         container_mc.guide_txt.htmlText = container_mc.guide_txt.htmlText + lib.util.UIString.getUIString("$161011","color","#" + minuteColor.toString(16),"increase","+" + _loc1_);
      }
      active_btn.setEnabled(false);
      take_btn.setEnabled(true);
   }
   container_mc.timer_mc._visible = cubeState == 1;
};
myListener.OnGame_HomunIncubator_SetSlot = function(dataList)
{
   clearHomunSlot();
   var _loc4_ = dataList.split("\n");
   if(_loc4_[_loc4_.length - 1] == "undefined" || _loc4_[_loc4_.length - 1] == "")
   {
      _loc4_.splice(_loc4_.length - 1,1);
   }
   var _loc5_ = _loc4_.length;
   var _loc3_ = 0;
   while(_loc3_ < _loc5_)
   {
      var _loc1_ = _loc4_[_loc3_].split("\t");
      if(_loc1_.length != 1)
      {
         var _loc2_ = container_mc["HomunIncubator__" + _loc3_];
         _loc2_._visible = true;
         _loc2_.id = _loc1_[0];
         _loc2_.draw(_loc1_[1]);
         _loc2_.grade = _loc1_[3];
         lib.manager.ToolTip.add(_loc2_.SLOT,_loc1_[0],6,_loc2_.Icon);
         if(_loc1_[2] == "E")
         {
            if(_loc1_[1] != undefined && _loc1_[1] != "" && Number(_loc1_[1]) != 0)
            {
               homunCount++;
            }
            _loc2_.disableSlot = false;
         }
         else if(_loc1_[2] == "D")
         {
            _loc2_.disableSlot = true;
         }
      }
      _loc3_ = _loc3_ + 1;
   }
   myListener.OnGame_HomunIncubator_SetState(cubeState);
};
myListener.OnGame_HomunIncubator_SetProgress = function(currentTime, maxTime)
{
   if(cubeState == 1)
   {
      currentTime = Number(currentTime);
      var _loc1_ = Math.ceil(currentTime / 60);
      if(_loc1_ > 0 && _loc1_ < 10)
      {
         _loc1_ = "0" + _loc1_;
      }
      else if(_loc1_ <= 0)
      {
         _loc1_ = "00";
      }
      container_mc.guide_txt.html = true;
      container_mc.guide_txt.htmlText = lib.util.UIString.getUIString("$161010","MinuteColor",minuteColor.toString(16),"BuildedMinute",_loc1_,"AlertColor","cccccc");
      var _loc3_ = Number(maxTime) - Number(currentTime);
      var _loc4_ = _loc3_ / Number(maxTime) * 100;
      container_mc.timer_mc.timerMask_mc._xscale = _loc3_ / Number(maxTime) * 100;
      container_mc.timer_mc.timer_txt.text = int(_loc4_) + "%";
   }
};
var take_btn = container_mc.txtBtn0.txtBtn;
var active_btn = container_mc.txtBtn1.txtBtn;
var x_btn = new lib.util.TxtBtn(container_mc.x_mc);
take_btn.setEnabled(false);
active_btn.setEnabled(false);
take_btn.setRelease(ToGame_HomunIncubator_Take);
active_btn.setRelease(ToGame_HomunIncubator_Active);
close_btn.setRelease(ToGame_HomunIncubator_CloseUI);
x_btn.setRelease(ToGame_HomunIncubator_CloseUI);
container_mc.timer_mc._visible = false;
clearHomunSlot();
fscommand("ToGame_HomunIncubator_Init");
