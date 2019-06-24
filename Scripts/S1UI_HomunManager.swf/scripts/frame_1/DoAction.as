function ToGame_HomunManager_ShowHomun(bShow)
{
   getURL("FSCommand:ToGame_HomunManager_ShowHomun",bShow);
}
function ToGame_HomunManager_RotateHomun(pitch, yaw, roll)
{
   getURL("FSCommand:ToGame_HomunManager_RotateHomun",pitch + "\t" + yaw + "\t" + roll);
}
function ToGame_HomunManager_Repair()
{
   fscommand("ToGame_HomunManager_Repair");
}
function ToGame_HomunManager_RemoveOrb(orbId)
{
   var _loc1_ = 0;
   while(_loc1_ < orb_array.length)
   {
      if(orb_array[_loc1_].stat == orbSelectNum)
      {
         getURL("FSCommand:ToGame_HomunManager_RemoveOrb",orb_array[_loc1_].id);
      }
      _loc1_ = _loc1_ + 1;
   }
}
function ToGame_HomunManager_RemoveHomun()
{
   fscommand("ToGame_HomunManager_RemoveHomun");
}
function ToGame_HomunManager_CloseUI()
{
   fscommand("ToGame_HomunManager_CloseUI");
}
function ToGame_HomunManager_RightClick()
{
   fscommand("ToGame_HomunManager_RightClick");
}
function clearOrbSlot()
{
   orbSelectNum = null;
   orb_array = [];
   var _loc2_ = 1;
   while(_loc2_ < 6)
   {
      var _loc1_ = container_mc["HomunManager__" + _loc2_];
      _loc1_.clear();
      lib.manager.ToolTip.remove(_loc1_.SLOT);
      _loc1_.disableSlot = true;
      _loc2_ = _loc2_ + 1;
   }
   removeOrb_btn.setEnabled(false);
}
function enabledSpin(enable)
{
   if(enable == false)
   {
      container_mc.spinCont.leftBtn.gotoAndStop(4);
      container_mc.spinCont.RightBtn.gotoAndStop(4);
      container_mc.blindbtn._visible = true;
   }
   else
   {
      container_mc.spinCont.leftBtn.gotoAndStop(1);
      container_mc.spinCont.RightBtn.gotoAndStop(1);
      container_mc.blindbtn._visible = false;
   }
}
function removeOrb()
{
   ToGame_HomunManager_RemoveOrb(orbId);
}
var UI = this;
UI._visible = false;
var UIname = "HomunManager";
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
bWidgetOpen = false;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
container_mc.text_name.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
container_mc.repairCost_txt.textColor = lib.info.TextColor.GENERAL_MONEY;
container_mc.names_txt1.textColor = lib.info.TextColor.GENERAL_CONTENTS;
container_mc.endurance_txt.textColor = lib.info.TextColor.GENERAL_CONTENTS;
container_mc.explain_0.textColor = lib.info.TextColor.GENERAL_EXPLAIN_DETAIL;
container_mc.explain_1.textColor = lib.info.TextColor.GENERAL_EXPLAIN_DETAIL;
container_mc.explain_2.textColor = lib.info.TextColor.GENERAL_EXPLAIN_DETAIL;
container_mc.notice_txt.textColor = lib.info.TextColor.GENERAL_NOTICE;
container_mc.notice_txt.htmlText = "<img src=\'icon_notice\' vspace=\'-1\'> " + lib.util.UIString.getUIString("$162011");
var firstHpData = true;
var firstEnduranceData = true;
var pastHp = 0;
var pastMaxHp = 0;
var currentEnergy = 0;
var demage = 0;
var heal = 0;
var pastEndurance = 0;
var pastMaxEndurance = 0;
var currentEndurance100 = 0;
var enduranceDemage = 0;
var enduranceHeal = 0;
container_mc.endurance_mc.enduranceMask_mc._xscale = 0;
var orb_array = new Array();
var orbSelectNum = null;
var str_data1 = "";
var str_data2 = "";
myListener.OnGameEventShowWindow = function(widgetName, bShow)
{
   if(widgetName.toLowerCase() == UIname.toLowerCase())
   {
      bWidgetOpen = bShow;
      if(_global.gbUIMode && bWidgetOpen)
      {
         UI._visible = true;
         ToGame_HomunManager_ShowHomun(true);
      }
      else
      {
         UI._visible = false;
         ToGame_HomunManager_ShowHomun(false);
      }
   }
};
myListener.OnGameEventChangeUIMode = function(bShow)
{
   if(_global.gbUIMode && bWidgetOpen)
   {
      UI._visible = true;
      ToGame_HomunManager_ShowHomun(true);
   }
   else
   {
      UI._visible = false;
      ToGame_HomunManager_ShowHomun(false);
   }
};
myListener.OnGame_HomunManager_SetRepairCost = function(cost)
{
   var _loc1_ = lib.util.GoldCurrency.SetGoldText(cost);
   container_mc.repairCost_txt.setText(_loc1_);
   if(Number(cost) == 0)
   {
      repair_btn.setEnabled(false);
   }
   else
   {
      repair_btn.setEnabled(true);
   }
   myListener.OnGame_HomunManager_EnableRepair(enableRepair);
};
myListener.OnGame_HomunManager_SetName = function(name)
{
   str_data1 = name;
   container_mc.names_txt1.htmlText = str_data1 + " / " + str_data2 + " " + lib.util.UIString.getUIString("$162003");
};
myListener.OnGame_HomunManager_SetGrade = function(grade)
{
   str_data2 = grade;
   container_mc.names_txt1.htmlText = str_data1 + " / " + str_data2 + " " + lib.util.UIString.getUIString("$162003");
};
myListener.OnGame_HomunManager_SetRegion = function(region)
{
   container_mc.region_txt.text = region;
};
myListener.OnGame_HomunManager_SetEndurance = function(currentEndurance, maxEndurance)
{
   currentEndurance = Number(currentEndurance);
   maxEndurance = Number(maxEndurance);
   container_mc.endurance_mc.enduranceMask_mc._xscale = currentEndurance / maxEndurance * 100;
   container_mc.endurance_txt.text = currentEndurance + "/" + maxEndurance;
};
myListener.OnGame_HomunManager_SetHomunSlot = function(dataList)
{
   container_mc.HomunManager__6.clear();
   container_mc.HomunManager__6.SLOT.enabled = true;
   enabledSpin(false);
   var _loc1_ = dataList.split("\t");
   if(_loc1_.length != 1)
   {
      if(Number(_loc1_[1] == 0))
      {
         _loc1_[1] = undefined;
      }
      container_mc.HomunManager__6.draw(_loc1_[1]);
      container_mc.HomunManager__6.grade = _loc1_[2];
      container_mc.HomunManager__6.SLOT.enabled = true;
      lib.manager.ToolTip.add(container_mc.HomunManager__6.SLOT,_loc1_[0],6,container_mc.HomunManager__6.Icon);
      if(_loc1_[1] != "0" && _loc1_[1] != undefined && _loc1_[1] != null && _loc1_[1] != "")
      {
         enabledSpin(true);
         removeHomun_btn.setEnabled(true);
      }
      else
      {
         enabledSpin(false);
         container_mc.endurance_txt.text = "0 / 0";
         container_mc.endurance_mc.enduranceMask_mc._xscale = 0;
         removeHomun_btn.setEnabled(false);
         container_mc.HomunManager__6.SLOT.enabled = true;
      }
   }
   if(container_mc.HomunManager__6.TEX == undefined || container_mc.HomunManager__6.TEX == "")
   {
      container_mc.HomunManager__6.drag = true;
      container_mc.HomunManager__6.hideBg();
   }
};
myListener.OnGame_HomunManager_SetOrbSlot = function(dataList)
{
   clearOrbSlot();
   var _loc7_ = dataList.split("\n");
   if(_loc7_[_loc7_.length - 1] == "0" || _loc7_[_loc7_.length - 1] == "undefined" || _loc7_[_loc7_.length - 1] == "")
   {
      _loc7_.splice(_loc7_.length - 1,1);
   }
   var _loc8_ = _loc7_.length;
   var _loc5_ = 1;
   while(_loc5_ < 6)
   {
      var _loc4_ = _loc7_[_loc5_ - 1].split("\t");
      if(_loc4_.length != 1)
      {
         var _loc2_ = container_mc["HomunManager__" + _loc5_];
         _loc2_._visible = true;
         _loc2_.id = _loc4_[0];
         lib.manager.ToolTip.add(_loc2_.SLOT,_loc4_[0],6,_loc2_.Icon);
         _loc2_.enableStat = _loc4_[2];
         if(_loc4_[2] == "E")
         {
            _loc2_.draw(_loc4_[1]);
            _loc2_.grade = _loc4_[3];
            _loc2_.disableSlot = false;
         }
         else if(_loc4_[2] == "D")
         {
            _loc2_.disableSlot = true;
         }
         else
         {
            _loc2_.disableSlot = true;
         }
         orb_array.push(_loc2_);
      }
      _loc5_ = _loc5_ + 1;
   }
   _loc5_ = 0;
   while(_loc5_ < orb_array.length)
   {
      var _loc6_ = orb_array[_loc5_];
      _loc6_.stat = _loc5_;
      _loc6_.onRelease2 = function()
      {
         if(this.enableStat == "E" && (this.Icon.TEX != undefined && Number(this.Icon.TEX) != 0))
         {
            if(this.stat != orbSelectNum)
            {
               var _loc2_ = 0;
               while(_loc2_ < orb_array.length)
               {
                  if(orb_array[_loc2_].stat == orbSelectNum)
                  {
                     orb_array[_loc2_].active = false;
                  }
                  _loc2_ = _loc2_ + 1;
               }
               orbSelectNum = this.stat;
               this.active = true;
               removeOrb_btn.setEnabled(true);
            }
            else
            {
               this.active = false;
               orbSelectNum = null;
               removeOrb_btn.setEnabled(false);
            }
         }
      };
      _loc5_ = _loc5_ + 1;
   }
};
myListener.OnGame_MouseDown = function(button, target)
{
   if(button == 2 && target._name == "SLOT")
   {
      var _loc1_ = target._parent._name;
      if(_loc1_ == "HomunManager__6")
      {
         ToGame_HomunManager_RightClick();
      }
   }
};
var Btn0X = 81;
var Btn0Y = 526;
var Btn1X = 160;
var Btn1Y = 511;
var enableRepair;
myListener.OnGame_HomunManager_EnableRepair = function(enable)
{
   enableRepair = enable == "1";
   if(enable == "1")
   {
      container_mc.repairCost_txt._visible = true;
      container_mc.repairCost_bg._visible = true;
      container_mc.explain_1._visible = true;
      repair_btn.setVisible(true);
      container_mc.txtBtn0._x = Btn0X;
      container_mc.txtBtn0._y = Btn0Y;
   }
   else
   {
      container_mc.repairCost_txt._visible = false;
      container_mc.repairCost_bg._visible = false;
      container_mc.explain_1._visible = false;
      repair_btn.setVisible(false);
      container_mc.txtBtn0._x = Btn1X;
      container_mc.txtBtn0._y = Btn1Y;
   }
};
var repair_btn = container_mc.txtBtn1.txtBtn;
var removeOrb_btn = container_mc.txtBtn2.txtBtn;
var removeHomun_btn = container_mc.txtBtn0.txtBtn;
var x_btn = new lib.util.TxtBtn(container_mc.x_mc);
repair_btn.setEnabled(false);
removeOrb_btn.setEnabled(false);
removeHomun_btn.setEnabled(false);
myListener.OnGame_HomunManager_EnableRepair("0");
repair_btn.setRelease(ToGame_HomunManager_Repair);
removeOrb_btn.setRelease(removeOrb);
removeHomun_btn.setRelease(ToGame_HomunManager_RemoveHomun);
close_btn.setRelease(ToGame_HomunManager_CloseUI);
x_btn.setRelease(ToGame_HomunManager_CloseUI);
var i = 1;
while(i < 7)
{
   var slot = container_mc["HomunManager__" + i];
   slot.disable_mc._visible = true;
   if(i < 6)
   {
      slot.SLOT.enabled = false;
   }
   i++;
}
enabledSpin(false);
container_mc.HomunManager__6.SLOT.enabled = true;
container_mc.HomunManager__6.drag = true;
container_mc.HomunManager__6.hideBg();
fscommand("ToGame_HomunManager_Init");
