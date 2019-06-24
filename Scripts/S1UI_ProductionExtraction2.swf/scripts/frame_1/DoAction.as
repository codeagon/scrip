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
function ToGame_ProductionExtraction2_CloseUI()
{
   fscommand("ToGame_ProductionExtraction2_CloseUI");
}
function ToGame_ProductionExtraction2_StartExtract()
{
   fscommand("ToGame_ProductionExtraction2_StartExtract");
}
function ToGame_ProductionExtraction2_RightBtnClicked()
{
   fscommand("ToGame_ProductionExtraction2_RightBtnClicked");
}
function closeUI()
{
   ToGame_ProductionExtraction2_CloseUI();
}
var UI = this;
UI._visible = false;
var UIname = "ProductionExtraction2";
container_mc.text_name.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
container_mc.desc_txt.textColor = lib.info.TextColor.GENERAL_EXPLAIN_DETAIL;
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
container_mc.productionType_txt.verticalAlign = "center";
container_mc.ProductionExtraction__0.showMoney(false);
var tf = container_mc.ProductionExtraction__0.down_txt.getTextFormat();
tf.align = "right";
container_mc.ProductionExtraction__0.down_txt.setNewTextFormat(tf);
container_mc.ProductionExtraction__0.drag = true;
container_mc.ProductionExtraction__0.Slot.hideBg();
container_mc.slot2.setLineNum(2);
container_mc.slot2.effect = false;
container_mc.slot2.display = true;
container_mc.slot2.showGage();
container_mc.slot2.hideAllBg();
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
myListener.OnGame_ProductionExtraction2_SetExtractionType = function(dataList)
{
   var _loc1_ = dataList.split("\t");
   if(_loc1_.length != 1)
   {
      container_mc.text_name.setText(_loc1_[0]);
      container_mc.desc_txt.text = _loc1_[4];
      container_mc.slot2.upText = _loc1_[0];
      container_mc.slot2.draw(_loc1_[1]);
      container_mc.slot2.drag = false;
      container_mc.slot2.setGage(Number(_loc1_[2]),Number(_loc1_[3]));
   }
};
myListener.OnGame_ProductionExtraction2_SetItemSlot = function(dataList)
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
         ToGame_ProductionExtraction2_RightBtnClicked();
      }
   }
};
var extract_btn = container_mc.txtBtn0.txtBtn;
var x_btn = new lib.util.TxtBtn(container_mc.x_mc);
extract_btn.setEnabled(false);
extract_btn.setRelease(aa = function()
{
   ToGame_ProductionExtraction2_StartExtract();
});
close_btn.setRelease(closeUI);
x_btn.setRelease(closeUI);
clearItemSlot();
fscommand("ToGame_ProductionExtraction2_Init");
