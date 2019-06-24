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
   else if(_loc7_ == 0)
   {
      mc._visible = false;
   }
   var _loc4_ = 0;
   while(_loc4_ < _loc7_)
   {
      var _loc3_ = lib.util.ExtString.split(dataList[_loc4_],"\t");
      var _loc2_ = mc.lineBox.attachMovie("line","line" + _loc4_,mc.lineBox.getNextHighestDepth());
      var _loc1_ = _loc2_.slot.attachMovie("Slot_link","item",_loc2_.slot.getNextHighestDepth());
      _loc2_._y = _loc4_ * LINE_H;
      _loc1_.index = _loc3_[0];
      _loc1_.draw(_loc3_[1]);
      _loc1_.SLOT.enabled = false;
      _loc1_.display = true;
      _loc1_.grade = _loc3_[4];
      _loc1_.sealType = _loc3_[5];
      _loc1_.masterpiece = _loc3_[6];
      var _loc5_ = "X " + _loc3_[3];
      _loc2_.nameTxt.setText(_loc3_[7]);
      _loc2_.numTxt.setText(_loc5_);
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
container_mc.groupMc0.txt.text = "확정 획득 보상";
container_mc.groupMc1.txt.text = "무작위 획득 보상";
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
