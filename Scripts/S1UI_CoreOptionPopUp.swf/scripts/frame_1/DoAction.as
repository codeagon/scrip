function ToGame_CoreOptionPopup_Init()
{
   fscommand("ToGame_CoreOptionPopup_Init");
}
function ToGame_CoreOptionPopup_Close()
{
   fscommand("ToGame_CoreOptionPopup_Close");
   lib.Debuger.trace("ToGame_CoreOptionPopup_Close  ");
}
function ToGame_CoreOptionPopup_Select()
{
   getURL("FSCommand:ToGame_CoreOptionPopup_Select",selectedOption);
   lib.Debuger.trace("ToGame_CoreOptionPopup_Select  " + selectedOption);
}
var UI = this;
UI._visible = false;
var bWidgetOpen = false;
var UIname = "CoreOptionPopup";
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
container_mc.text_name.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
container_mc.guideFd.verticalAlign = "center";
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
   container_mc.ToolTip._visible = bShow;
};
var minBgHeight = 200;
var tBgHeight = container_mc.bgMc._height;
var tHitH = hit._height;
var goldLby = container_mc.goldLb._y;
var goldFdy = container_mc.goldFd._y;
var btny = container_mc.txtBtn1._y;
var selectedOption;
myListener.OnGame_CoreOptionPopup_Option = function()
{
   var _loc6_ = arguments.length;
   var _loc5_ = minBgHeight;
   var _loc3_ = 0;
   while(_loc3_ < _loc6_)
   {
      if(arguments[_loc3_] == "" || arguments[_loc3_] == undefined)
      {
         break;
      }
      var _loc4_ = container_mc["optionBtn" + _loc3_];
      if(_loc4_ == undefined)
      {
         _loc4_ = container_mc.optionBtn0.duplicateMovieClip("optionBtn" + _loc3_,container_mc.getNextHighestDepth());
      }
      _loc4_._x = container_mc.optionBtn0._x;
      _loc4_._y = container_mc.optionBtn0._y + _loc3_ * 30;
      _loc4_.index = _loc3_;
      _loc4_.label = arguments[_loc3_];
      _loc5_ = _loc5_ + (container_mc.optionBtn0._height + 10);
      (lib.controls.S_CheckBox)_loc4_.onChanged = function(f)
      {
         container_mc["optionBtn" + selectedOption].checked = false;
         if(f)
         {
            selectedOption = this.index;
         }
         ok_btn.setEnabled(f != undefined);
      };
      _loc3_ = _loc3_ + 1;
   }
   var _loc7_ = Math.max(_loc5_,tBgHeight);
   container_mc.bgMc._height = _loc7_;
   container_mc.goldLb._y = goldLby + (_loc7_ - tBgHeight);
   container_mc.goldFd._y = goldFdy + (_loc7_ - tBgHeight);
   container_mc.txtBtn1._y = btny + (_loc7_ - tBgHeight);
   container_mc.txtBtn0._y = btny + (_loc7_ - tBgHeight);
   hit._height = tHitH + (_loc7_ - tBgHeight);
};
myListener.OnGame_CoreOptionPopup_Gold = function(gold)
{
   var _loc1_ = lib.util.GoldCurrency.SetGoldText(gold);
   container_mc.goldFd.htmlText = _loc1_;
};
myListener.OnGame_CoreOptionPopup_Select = function(index)
{
   if(index == undefined || index == "")
   {
      return undefined;
   }
   container_mc["optionBtn" + selectedOption].checked = false;
   selectedOption = index;
   container_mc["optionBtn" + selectedOption].checked = true;
   ok_btn.setEnabled(true);
};
var close_btn = container_mc.txtBtn0.txtBtn;
var ok_btn = container_mc.txtBtn1.txtBtn;
var x_btn = new lib.util.TxtBtn(container_mc.x_mc);
close_btn.setRelease(ToGame_CoreOptionPopup_Close);
x_btn.setRelease(ToGame_CoreOptionPopup_Close);
ok_btn.setRelease(ToGame_CoreOptionPopup_Select);
ok_btn.setEnabled(false);
ToGame_CoreOptionPopup_Init();
