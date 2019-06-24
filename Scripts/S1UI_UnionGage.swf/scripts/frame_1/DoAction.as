function ToGame_UnionGage_ResultInfo()
{
   fscommand("ToGame_UnionGage_ResultInfo");
}
function PlayTweenMotion(_alphaNum)
{
}
_global.gfxExtensions = true;
var UI = this;
UI._visible = false;
var UIname = "UnionGage";
this.bWindowOpen = false;
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
container_mc.unionTitleFd.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
var INFOBTN_STR = lib.util.UIString.getUIString("$471138");
var dangerEffect;
var dangerMode = false;
var NPCGAGE_WID = 330;
var BATTLEGAGE_WID = 371;
var BATTLEGAGE_MAX = 7;
var BATTLEGAGE_X = 39;
var battleTotal = 100;
var tab_btn = container_mc.tabBtn.txtBtn;
myListener.OnGameEventShowWindow = function(WindowName, bShow)
{
   if(WindowName.toLowerCase() == UIname.toLowerCase())
   {
      bWindowOpen = bShow;
      if(bWindowOpen)
      {
         UI._visible = true;
      }
      else
      {
         UI._visible = false;
      }
   }
};
myListener.OnGameEventChangeUIMode = function()
{
   if(_global.gbUIMode)
   {
      container_mc.tabBtn._visible = true;
   }
   else
   {
      container_mc.tabBtn._visible = false;
   }
};
myListener.OnGame_UnionGage_SetNpcData = function(_imgUrl, _tooltipTxt, type)
{
   lib.manager.ToolTip.add(container_mc.imgBox,_tooltipTxt,1);
};
myListener.OnGame_UnionGage_SetNpcGage = function(_remainGage, _totalGage)
{
   container_mc.npcHp.text = int(_remainGage / _totalGage * 100) + "%";
   container_mc.npcGage._width = Number(_remainGage) / Number(_totalGage) * NPCGAGE_WID;
};
myListener.OnGame_UnionGage_SetBattleGage = function(_remainGage, _totalGage)
{
   _remainGage = _totalGage - _remainGage;
   var _loc1_ = Number(_remainGage) / Number(_totalGage);
   var _loc2_ = Math.round(_loc1_ * BATTLEGAGE_MAX);
   if(_loc2_ > 3)
   {
      container_mc.battleGage.gotoAndStop(1);
      container_mc.countTxt.textColor = "0x00E9B9";
   }
   else
   {
      container_mc.battleGage.gotoAndStop(2);
      container_mc.countTxt.textColor = "0xF40008";
   }
   container_mc.battleGage._x = BATTLEGAGE_X - BATTLEGAGE_WID + _loc1_ * BATTLEGAGE_WID;
   container_mc.countTxt.text = "x " + _loc2_;
};
myListener.OnGame_UnionGage_SetButton = function(_enable)
{
   if(_enable == 2)
   {
      container_mc.tabBtn._visible = false;
   }
   else
   {
      container_mc.tabBtn._visible = true;
      tab_btn.setEnabled(_enable);
   }
};
myListener.OnGame_UnionGage_SetKey = function(infoBtnKeyCode)
{
   if(infoBtnKeyCode != "" && infoBtnKeyCode != undefined)
   {
      tab_btn.setText(INFOBTN_STR + "(" + lib.info.KeyMap.toKeyCode(infoBtnKeyCode) + ")");
   }
};
tab_btn.setRelease(ToGame_UnionGage_ResultInfo);
fscommand("ToGame_UnionGage_Init");
