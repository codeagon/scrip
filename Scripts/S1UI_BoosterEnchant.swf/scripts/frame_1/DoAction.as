function clearInformation()
{
   dragTween.stop();
   maxSlot = 0;
   clickStat = null;
   clickSlot = null;
   mcMaker.clearMovie();
}
function ToGame_BoosterEnchant_Init()
{
   fscommand("ToGame_BoosterEnchant_Init");
}
function ToGame_BoosterEnchant_Execute()
{
   fscommand("ToGame_BoosterEnchant_Execute");
}
function ToGame_BoosterEnchant_RightClick(index)
{
   getURL("FSCommand:ToGame_BoosterEnchant_RightClick",index);
}
function ToGame_BoosterEnchant_CloseUI()
{
   fscommand("ToGame_BoosterEnchant_CloseUI");
}
var UI = this;
UI._visible = false;
var UIname = "BoosterEnchant";
var isItem = false;
var isMaterial = false;
var isFormula = false;
container_mc.booster__0.disableSlot = true;
container_mc.booster__0.FX_DISABLESLOT._visible = false;
container_mc.booster__0.slotDisable1._visible = true;
container_mc.booster__2.disableSlot = true;
container_mc.booster__2.slotDisable1._visible = false;
container_mc.booster__2.enabled = false;
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
myListener.OnGame_SetUIPosition = function(bLocked, _UIName, posXRatio, posYRatio)
{
   if(_UIName.toLowerCase() == UIname.toLowerCase())
   {
      var _loc2_ = - lib.info.AlignInfo.verticalSpace;
      if(UI._y < _loc2_)
      {
         UI._y = _loc2_;
      }
      var _loc3_ = lib.info.AlignInfo.uiScale(UIname,UI);
      var _loc1_ = lib.info.AlignInfo.UI_HEIGHT + lib.info.AlignInfo.verticalSpace - container_mc.UIDrager._height * (lib.info.AlignInfo.scaleRatio * _loc3_);
      if(UI._y > _loc1_)
      {
         UI._y = _loc1_;
      }
   }
};
myListener.OnGame_ScaleUI = function()
{
   var _loc2_ = - lib.info.AlignInfo.verticalSpace;
   if(UI._y < _loc2_)
   {
      UI._y = _loc2_;
   }
   var _loc3_ = lib.info.AlignInfo.uiScale(UIname,UI);
   var _loc1_ = lib.info.AlignInfo.UI_HEIGHT + lib.info.AlignInfo.verticalSpace - container_mc.UIDrager._height * (lib.info.AlignInfo.scaleRatio * _loc3_);
   if(UI._y > _loc1_)
   {
      UI._y = _loc1_;
   }
};
myListener.OnGame_BoosterEnchant_SetText = function(descText0, descText1, descText2, noticeText)
{
   if(descText0 == "" || descText0 == "undefined" || descText0 == undefined)
   {
      descText0 = "";
   }
   if(descText1 == "" || descText1 == "undefined" || descText1 == undefined)
   {
      descText1 = "";
   }
   if(descText2 == "" || descText2 == "undefined" || descText2 == undefined)
   {
      descText2 = "";
   }
   if(noticeText == "" || noticeText == "undefined" || noticeText == undefined)
   {
      noticeText = "";
   }
   container_mc.textFd0.htmlText = descText0;
   container_mc.textFd1.htmlText = descText1;
   container_mc.textFd2.htmlText = descText2;
   container_mc.noticeMc.textFd.htmlText = noticeText;
};
myListener.OnGame_BoosterEnchant_SetTargetItemSlot = function(slotData)
{
   var _loc2_ = lib.util.ExtString.split(slotData,"\t");
   var _loc1_ = container_mc.booster__1;
   if(_loc2_.length > 0)
   {
      _loc1_.draw(_loc2_[1]);
      lib.manager.ToolTip.add(_loc1_.SLOT,1,6,_loc1_.Icon);
      _loc1_.grade = _loc2_[3];
      _loc1_.sealType = _loc2_[4];
      _loc1_.masterpiece = _loc2_[5];
      if(_loc2_[2] != undefined)
      {
         _loc1_.impossible = Number(_loc2_[2]);
      }
      isItem = true;
      _loc1_.SLOT.enabled = true;
      container_mc.booster__0.disableSlot = false;
      container_mc.booster__0.slotDisable1._visible = false;
   }
   else
   {
      _loc1_.clear();
      _loc1_.impossible = false;
      _loc1_.draw("");
      lib.manager.ToolTip.remove(_loc1_.SLOT);
      executeBtn.setEnabled(false);
      isItem = false;
      myListener.OnGame_BoosterEnchant_SetFormulaItemSlot();
      myListener.OnGame_BoosterEnchant_SetMaterialItemSlot();
      container_mc.booster__0.disableSlot = true;
      container_mc.booster__0.FX_DISABLESLOT._visible = false;
      container_mc.booster__2.slotDisable1._visible = true;
      container_mc.booster__2.disableSlot = true;
      container_mc.booster__2.slotDisable1._visible = false;
   }
};
myListener.OnGame_BoosterEnchant_SetMaterialItemSlot = function(slotData)
{
   var _loc2_ = lib.util.ExtString.split(slotData,"\t");
   var _loc1_ = container_mc.booster__0;
   if(_loc2_.length > 0)
   {
      _loc1_.draw(_loc2_[1]);
      lib.manager.ToolTip.add(_loc1_.SLOT,0,6,_loc1_.Icon);
      _loc1_.grade = _loc2_[2];
      _loc1_.sealType = _loc2_[3];
      _loc1_.masterpiece = _loc2_[4];
      isMaterial = true;
      executeBtn.setEnabled(isFormula);
      if(_loc2_[5])
      {
         _loc1_.num_txt._visible = true;
         _loc1_.num = _loc2_[5];
      }
      else
      {
         _loc1_.num_txt._visible = false;
      }
      _loc1_.SLOT.enabled = true;
   }
   else
   {
      _loc1_.clear();
      _loc1_.draw("");
      lib.manager.ToolTip.remove(_loc1_.SLOT);
      executeBtn.setEnabled(false);
      isMaterial = false;
      if(isItem == false)
      {
         _loc1_.disableSlot = true;
         _loc1_.FX_DISABLESLOT._visible = false;
         _loc1_.slotDisable1._visible = true;
      }
   }
};
myListener.OnGame_BoosterEnchant_SetFormulaItemSlot = function(slotData)
{
   var _loc2_ = lib.util.ExtString.split(slotData,"\t");
   var _loc1_ = container_mc.booster__2;
   _loc1_.num = "";
   if(_loc2_.length > 0)
   {
      _loc1_.draw(_loc2_[1]);
      lib.manager.ToolTip.add(_loc1_.SLOT,2,6,_loc1_.Icon);
      _loc1_.num = _loc2_[2];
      _loc1_.grade = _loc2_[3];
      _loc1_.sealType = _loc2_[5];
      _loc1_.masterpiece = _loc2_[6];
      if(_loc2_[7] == undefined || _loc2_[7] == "undefined")
      {
         _loc2_[7] = 0;
      }
      _loc2_[7] = Number(_loc2_[7]);
      _loc1_.impossible = _loc2_[7];
      isFormula = !_loc2_[7];
      executeBtn.setEnabled(isMaterial && isFormula);
      _loc1_.disableSlot = false;
      _loc1_.slotDisable1._visible = false;
      _loc1_.SLOT.enabled = false;
      _loc1_.drag = false;
   }
   else
   {
      _loc1_.clear();
      _loc1_.draw("");
      _loc1_.impossible = false;
      lib.manager.ToolTip.remove(_loc1_.SLOT);
      isFormula = false;
      executeBtn.setEnabled(false);
      _loc1_.disableSlot = true;
      _loc1_.slotDisable1._visible = false;
   }
};
myListener.OnGame_MouseDown = function(button, target)
{
   if(button == 2 && target._name == "SLOT")
   {
      var _loc1_ = target._parent._name;
      if(_loc1_ == "booster__0")
      {
         ToGame_BoosterEnchant_RightClick(0);
      }
      if(_loc1_ == "booster__1")
      {
         ToGame_BoosterEnchant_RightClick(1);
      }
   }
};
var executeBtn = container_mc.executeBtn.txtBtn;
executeBtn.setRelease(ToGame_BoosterEnchant_Execute);
executeBtn.setEnabled(false);
var cancelBtn = container_mc.cancelBtn.txtBtn;
cancelBtn.setRelease(ToGame_BoosterEnchant_CloseUI);
var closeBtn = new lib.util.TxtBtn(container_mc.closeBtn);
closeBtn.setRelease(ToGame_BoosterEnchant_CloseUI);
ToGame_BoosterEnchant_Init();
