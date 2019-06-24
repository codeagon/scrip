function ToGame_EventPopUp_Init()
{
   fscommand("ToGame_EventPopUp_Init");
}
function ToGame_EventPopUp_ClickEnter()
{
   getURL("FSCommand:ToGame_EventPopUp_ClickButton",0);
}
function ToGame_EventPopUp_ClickClose()
{
   getURL("FSCommand:ToGame_EventPopUp_ClickButton",1);
}
function CreatLine(mc, dataList, max)
{
   var _loc7_ = dataList.length;
   if(_loc7_ > max)
   {
      _loc7_ = max;
   }
   mc._visible = 0 < _loc7_;
   var _loc4_ = 0;
   while(_loc4_ < mc.createdSlotCount)
   {
      var _loc2_ = mc.lineBox["line" + _loc4_];
      _loc2_._visible = false;
      _loc4_ = _loc4_ + 1;
   }
   _loc4_ = 0;
   while(_loc4_ < _loc7_)
   {
      var _loc3_ = lib.util.ExtString.split(dataList[_loc4_],"\t");
      _loc2_ = mc.lineBox["line" + _loc4_];
      var _loc1_ = undefined;
      if(undefined == _loc2_)
      {
         _loc2_ = mc.lineBox.attachMovie("line","line" + _loc4_,mc.lineBox.getNextHighestDepth());
         mc.createdSlotCount = mc.createdSlotCount + 1;
         _loc1_ = _loc2_.slot.attachMovie("Slot_link","Slot",_loc2_.slot.getNextHighestDepth());
      }
      else
      {
         _loc1_ = _loc2_.slot.Slot;
      }
      _loc2_._visible = true;
      _loc2_._y = _loc4_ * LINE_H;
      _loc1_.index = _loc3_[0];
      _loc1_.draw(_loc3_[1]);
      _loc1_.SLOT.enabled = false;
      _loc1_.display = true;
      _loc1_.grade = _loc3_[4];
      _loc1_.sealType = _loc3_[5];
      _loc1_.masterpiece = _loc3_[6];
      var _loc6_ = "X " + _loc3_[3];
      _loc2_.nameTxt.setText(_loc3_[7]);
      _loc2_.numTxt.setText(_loc6_);
      if(_loc1_.grade == 0)
      {
         _loc2_.nameTxt.textColor = lib.info.TextColor.RAREGRADE0;
      }
      else if(_loc1_.grade == 1)
      {
         _loc2_.nameTxt.textColor = lib.info.TextColor.RAREGRADE1;
      }
      else if(_loc1_.grade == 2)
      {
         _loc2_.nameTxt.textColor = lib.info.TextColor.RAREGRADE2;
      }
      else if(_loc1_.grade == 3)
      {
         _loc2_.nameTxt.textColor = lib.info.TextColor.RAREGRADE3;
      }
      lib.manager.ToolTip.add(_loc1_,_loc3_[0],6);
      _loc4_ = _loc4_ + 1;
   }
}
function SetAlign()
{
   var _loc2_ = container_mc.groupMc0._y + container_mc.groupMc0._height;
   container_mc.groupMc1._y = _loc2_;
   var _loc1_ = _loc2_ + container_mc.groupMc1._height + 15;
   if(_loc1_ < 227)
   {
      _loc1_ == 227;
   }
   container_mc.btn0._y = _loc1_;
   container_mc.btn1._y = _loc1_;
   container_mc.bgMc._height = _loc1_ + 55;
}
var UI = this;
UI._visible = false;
var bWidgetOpen = false;
var UIname = "EventPopUp";
container_mc.UIDrager.setData(UIName,UI);
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
var FIX_MAX = 1;
var RAN_MAX = 5;
var LINE_H = 70;
var close_btn = container_mc.btn1.txtBtn;
close_btn.setRelease(ToGame_EventPopUp_ClickClose);
var enter_btn = container_mc.btn0.txtBtn;
enter_btn.setRelease(ToGame_EventPopUp_ClickEnter);
var x_btn = new lib.util.TxtBtn(container_mc.x_mc);
x_btn.setRelease(ToGame_EventPopUp_ClickClose);
myListener.OnGameEventShowWindow = function(widgetName, bShow)
{
   if(widgetName.toLowerCase() == UIname.toLowerCase())
   {
      bWidgetOpen = bShow;
      if(bWidgetOpen)
      {
         UI._visible = true;
      }
      else
      {
         UI._visible = false;
      }
   }
};
var str0 = lib.util.UIString.getUIString("$012072");
var str1 = lib.util.UIString.getUIString("$012073");
container_mc.groupMc0.txt.text = str0;
container_mc.groupMc1.txt.text = str1;
container_mc.groupMc0.createdSlotCount = 0;
container_mc.groupMc1.createdSlotCount = 0;
myListener.OnGame_EventPopUp_SetReward = function(fixData, ranData)
{
   var _loc2_ = lib.util.ExtString.split(fixData,"\n");
   var _loc1_ = lib.util.ExtString.split(ranData,"\n");
   CreatLine(container_mc.groupMc0,_loc2_,FIX_MAX);
   CreatLine(container_mc.groupMc1,_loc1_,RAN_MAX);
   SetAlign();
};
myListener.OnGame_EventPopUp_SetButton = function(index, enable)
{
   if(index == "0")
   {
      enter_btn.setEnabled(Boolean(Number(enable)));
   }
   else
   {
      close_btn.setEnabled(Boolean(Number(enable)));
   }
};
ToGame_EventPopUp_Init();
