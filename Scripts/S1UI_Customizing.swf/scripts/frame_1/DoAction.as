function setSlotInfo(_index, _info)
{
   var _loc2_ = container_mc[slotPrefix + _index];
   _loc2_._id = _index;
   _loc2_.draw(_info[0]);
   _loc2_.display = true;
   lib.manager.ToolTip.remove(_loc2_.SLOT);
   lib.manager.ToolTip.add(_loc2_.SLOT,_info[1],1,_loc2_.Icon);
   _loc2_.onRelease2 = function()
   {
      if(this == pSelectedSlot)
      {
         return undefined;
      }
      pSelectedSlot.active = false;
      this.active = true;
      pSelectedSlot = this;
      ToGame_Customizing_SelectSlot(this._id);
      enterBtn.setEnabled(true);
   };
}
function ToGame_Customizing_Init()
{
   lib.Debuger.trace("ToGame_Customizing_Init");
   fscommand("ToGame_Customizing_Init");
}
function ToGame_Customizing_CloseUI()
{
   lib.Debuger.trace("ToGame_Customizing_CloseUI");
   fscommand("ToGame_Customizing_CloseUI");
}
function ToGame_Customizing_confirm()
{
   lib.Debuger.trace("ToGame_Customizing_confirm");
   fscommand("ToGame_Customizing_confirm");
}
function ToGame_Customizing_SelectSlot(_index)
{
   lib.Debuger.trace("ToGame_Customizing_SelectSlot : " + _index);
   getURL("FSCommand:ToGame_Customizing_SelectSlot",_index);
}
var UI = this;
UI._visible = false;
var UIname = "Customizing";
this.bWindowOpen = false;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
var xBtn = new lib.util.TxtBtn(container_mc.xBtn);
xBtn.setRelease(ToGame_Customizing_CloseUI);
var enterBtn = container_mc.enterBtn.txtBtn;
enterBtn.setRelease(ToGame_Customizing_confirm);
var cancelBtn = container_mc.cancelBtn.txtBtn;
cancelBtn.setRelease(ToGame_Customizing_CloseUI);
enterBtn.setEnabled(false);
var slotPrefix = "slot__";
container_mc.titleFd.verticalAlign = "center";
container_mc.textFd0.verticalAlign = "center";
container_mc.textFd1.verticalAlign = "center";
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
myListener.OnGame_Customizing_SetTitle = function(_titleText)
{
   container_mc.titleFd.htmlText = _titleText;
   lib.Debuger.trace("_titleText : " + _titleText);
};
myListener.OnGame_Customizing_SetText = function(_text0, _text1)
{
   container_mc.textFd0.htmlText = _text0;
   container_mc.textFd1.htmlText = _text1;
};
var SLOT_COUNT = 7;
myListener.OnGame_Customizing_SetSlot = function(_slotData, _index)
{
   var _loc3_ = lib.util.ExtString.split(_slotData,"\n");
   var _loc4_ = _loc3_.length;
   if(_loc3_[_loc4_ - 1] == "undefined" || _loc3_[_loc4_ - 1] == "")
   {
      _loc3_.splice(_loc4_ - 1,1);
      _loc4_ = _loc3_.length;
   }
   var _loc1_ = 0;
   while(_loc1_ < SLOT_COUNT)
   {
      var _loc2_ = lib.util.ExtString.split(_loc3_[_loc1_],"\t");
      setSlotInfo(_loc1_,_loc2_);
      _loc1_ = _loc1_ + 1;
   }
   if(_index != null && _index != "" && _index != undefined && _index != "undefined")
   {
      pSelectedSlot = container_mc[slotPrefix + _index];
      pSelectedSlot.active = true;
      enterBtn.setEnabled(true);
   }
};
var pSelectedSlot = null;
ToGame_Customizing_Init();
