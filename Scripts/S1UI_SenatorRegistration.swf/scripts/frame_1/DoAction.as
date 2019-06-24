function ToGame_SenatorRegistration_Init()
{
   fscommand("ToGame_SenatorRegistration_Init");
}
function ToGame_SenatorRegistration_CloseUI()
{
   fscommand("ToGame_SenatorRegistration_CloseUI");
}
function ToGame_SenatorRegistration_Confirm()
{
   fscommand("ToGame_SenatorRegistration_Confirm");
}
var UI = this;
UI._visible = false;
var bWidgetOpen = false;
var UIname = "SenatorRegistration";
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
container_mc.title_txt.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
container_mc.explain_0.textColor = lib.info.TextColor.GENERAL_EXPLAIN_DETAIL;
container_mc.explain_1.textColor = lib.info.TextColor.GENERAL_EXPLAIN_DETAIL;
container_mc.explain_2.textColor = lib.info.TextColor.GENERAL_EXPLAIN_DETAIL;
container_mc.explain_3.textColor = lib.info.TextColor.GENERAL_EXPLAIN_DETAIL;
container_mc.selectedContinental.textColor = lib.info.TextColor.GENERAL_CONTENTS;
container_mc.selectedMethod.textColor = lib.info.TextColor.GENERAL_CONTENTS;
container_mc.regCost.textColor = lib.info.TextColor.GENERAL_CONTENTS;
container_mc.guide_txt.textColor = lib.info.TextColor.GENERAL_CONTENTS;
container_mc.guide_txt.verticalAlign = "center";
container_mc.guide_txt.htmlText = lib.util.UIString.getUIString("$451006","noticeColor",lib.info.TextColor.GENERAL_IMPOSSIBLE.toString(16));
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
var close_btn = container_mc.txtBtn1.txtBtn;
var apply_btn = container_mc.txtBtn0.txtBtn;
var x_btn = new lib.util.TxtBtn(container_mc.x_mc);
close_btn.setRelease(ToGame_SenatorRegistration_CloseUI);
apply_btn.setRelease(ToGame_SenatorRegistration_Confirm);
x_btn.setRelease(ToGame_SenatorRegistration_CloseUI);
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
myListener.OnGame_SenatorRegistration_SetData = function(continental, method, cost, selectedGuardList)
{
   container_mc.selectedContinental.setText(continental);
   var _loc5_ = Number(method) != 1?"$351018":"$351019";
   container_mc.selectedMethod.setText(lib.util.UIString.getUIString(_loc5_));
   var _loc4_ = selectedGuardList.split("\n");
   if(_loc4_[_loc4_.length - 1] == "0" || _loc4_[_loc4_.length - 1] == "undefined" || _loc4_[_loc4_.length - 1] == "")
   {
      _loc4_.pop();
   }
   var _loc1_ = 0;
   while(_loc1_ < 5)
   {
      var _loc3_ = container_mc["selectedGuard_" + (_loc1_ + 1)];
      _loc3_._visible = false;
      _loc1_ = _loc1_ + 1;
   }
   _loc1_ = 0;
   while(_loc1_ < _loc4_.length)
   {
      var _loc2_ = _loc4_[_loc1_].split("\t");
      if(_loc2_.length != 1)
      {
         _loc3_ = container_mc["selectedGuard_" + (_loc1_ + 1)];
         _loc3_._visible = true;
         _loc3_.num.text = _loc2_[0];
         _loc3_.txt.text = _loc2_[1];
      }
      _loc1_ = _loc1_ + 1;
   }
   container_mc.regCost.setText(cost);
};
ToGame_SenatorRegistration_Init();
var i = 0;
while(i < 5)
{
   var line = container_mc["selectedGuard_" + (i + 1)];
   line.num.text = "";
   line.txt.text = "";
   line.num.textColor = lib.info.TextColor.GENERAL_EXPLAIN_DETAIL;
   line.txt.textColor = lib.info.TextColor.GENERAL_CONTENTS;
   i++;
}
