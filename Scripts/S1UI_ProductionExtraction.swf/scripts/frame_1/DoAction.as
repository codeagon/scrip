function clearItemSlot1()
{
   var _loc1_ = container_mc.ProductionExtraction__1;
   _loc1_.clear();
   _loc1_.Slot._visible = true;
   _loc1_.Slot.hideBg();
   lib.manager.ToolTip.remove(_loc1_.SLOT);
}
function clearItemSlot()
{
   extract_btn.setEnabled(false);
   var _loc1_ = container_mc.ProductionExtraction__0;
   _loc1_.clear();
   _loc1_.showBg();
   _loc1_.Slot._visible = true;
   _loc1_.Slot.hideBg();
   lib.manager.ToolTip.remove(_loc1_.SLOT);
}
function ToGame_ProductionExtraction_CloseUI()
{
   fscommand("ToGame_ProductionExtraction_CloseUI");
}
function ToGame_ProductionExtraction_StartExtract()
{
   fscommand("ToGame_ProductionExtraction_StartExtract");
}
function ToGame_ProductionExtraction_RightBtnClicked(_index)
{
   getURL("FSCommand:ToGame_ProductionExtraction_RightBtnClicked",_index);
}
function closeUI()
{
   ToGame_ProductionExtraction_CloseUI();
}
var UI = this;
UI._visible = false;
var UIname = "ProductionExtraction";
container_mc.text_name.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
container_mc.ProductionExtraction__0.showMoney(false);
var tf = container_mc.ProductionExtraction__0.down_txt.getTextFormat();
tf.align = "right";
container_mc.ProductionExtraction__0.down_txt.setNewTextFormat(tf);
container_mc.ProductionExtraction__0.drag = true;
container_mc.ProductionExtraction__0.Slot.hideBg();
var bWidgetOpen = false;
var myListener = new Object();
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
container_mc.ProductionExtraction__1.drag = true;
container_mc.ProductionExtraction__1.Slot.hideBg();
myListener.OnGame_ProductionExtraction_SetExtractionType = function(dataList)
{
   var _loc1_ = dataList.split("\t");
   if(_loc1_.length != 1)
   {
      container_mc.text_name.setText(_loc1_[0]);
      container_mc.guideTxt.htmlText = _loc1_[1];
   }
};
myListener.OnGame_ProductionExtraction_SetCatalystItemSlot = function(_dataList)
{
   var _loc2_ = _dataList.split("\t");
   if(_loc2_.length != 1)
   {
      if(_loc2_[0] != "0" && _loc2_[0] != "" && _loc2_[0] != "undefined")
      {
         var _loc1_ = container_mc.ProductionExtraction__1;
         _loc1_.id = _loc2_[0];
         _loc1_.draw(_loc2_[1]);
         _loc1_.showBg();
         _loc1_.drag = true;
         _loc1_.Slot.hideBg();
         lib.manager.ToolTip.add(_loc1_.SLOT,info[0],6,_loc1_.Slot.Icon);
      }
      else
      {
         clearItemSlot1();
      }
   }
   else
   {
      clearItemSlot1();
   }
};
myListener.OnGame_ProductionExtraction_SetItemSlot = function(dataList)
{
   var _loc2_ = dataList.split("\t");
   if(_loc2_.length != 1)
   {
      if(_loc2_[0] != "0" && _loc2_[0] != "" && _loc2_[0] != "undefined")
      {
         extract_btn.setEnabled(true);
         var _loc1_ = container_mc.ProductionExtraction__0;
         _loc1_.id = _loc2_[0];
         _loc1_.draw(_loc2_[1]);
         _loc1_.grade = _loc2_[4];
         _loc1_.sealType = _loc2_[5];
         _loc1_.masterpiece = _loc2_[6];
         _loc1_.setLineNum(2);
         _loc1_.upText = _loc2_[2];
         _loc1_.downText = _loc2_[3] + " " + lib.util.UIString.getUIString("$152003");
         _loc1_.showBg();
         _loc1_.drag = true;
         _loc1_.Slot.hideBg();
         lib.manager.ToolTip.add(_loc1_.SLOT,_loc2_[0],6,_loc1_.Slot.Icon);
      }
      else
      {
         clearItemSlot();
      }
   }
   else
   {
      clearItemSlot();
   }
};
_global.EventBroadCaster.addListener(myListener);
myListener.OnGame_MouseDown = function(button, target)
{
   if(button == 2)
   {
      if(container_mc.ProductionExtraction__0.SLOT == target)
      {
         ToGame_ProductionExtraction_RightBtnClicked("0");
      }
      if(container_mc.ProductionExtraction__1.SLOT == target)
      {
         ToGame_ProductionExtraction_RightBtnClicked("1");
      }
   }
};
var extract_btn = container_mc.txtBtn0.txtBtn;
var x_btn = new lib.util.TxtBtn(container_mc.x_mc);
extract_btn.setEnabled(false);
extract_btn.setRelease(aa = function()
{
   ToGame_ProductionExtraction_StartExtract();
});
close_btn.setRelease(closeUI);
x_btn.setRelease(closeUI);
clearItemSlot();
clearItemSlot1();
fscommand("ToGame_ProductionExtraction_Init");
