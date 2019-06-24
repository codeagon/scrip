function ToGame_BFReward_CloseUI()
{
   lib.Debuger.trace("ToGame_BFReward_CloseUI  ");
   fscommand("ToGame_BFReward_CloseUI");
}
function ToGame_BFReward_Init()
{
   lib.Debuger.trace("ToGame_BFReward_Init");
   fscommand("ToGame_BFReward_Init");
}
function ToGame_BFReward_ConfirmReward()
{
   lib.Debuger.trace("ToGame_BFReward_ConfirmReward  ");
   fscommand("ToGame_BFReward_ConfirmReward");
}
var UI = this;
var bWidgetOpen = false;
var UIname = "BFReward";
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
container_mc.text_name.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
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
container_mc.countMc0.countFd.textColor = lib.info.TextColor.INPUT_ACTIVE;
container_mc.countMc1.countFd.textColor = lib.info.TextColor.INPUT_ACTIVE;
container_mc.countMc2.countFd.textColor = lib.info.TextColor.INPUT_ACTIVE;
container_mc.countMc3.countFd.textColor = lib.info.TextColor.GENERAL_EQUIPPED;
container_mc.countMc4.countFd.textColor = lib.info.TextColor.INPUT_ACTIVE;
container_mc.imgSlot.SLOT.enabled = false;
container_mc.countLb0.autoSize = true;
container_mc.countLb1.autoSize = true;
container_mc.countLb2.autoSize = true;
container_mc.countLb3.autoSize = true;
container_mc.countLb4.autoSize = true;
container_mc.countLb5.autoSize = true;
var maxLabelW = 0;
var n = 0;
while(n < 5)
{
   var countLb = container_mc["countLb" + n];
   maxLabelW = Math.max(countLb.textWidth,maxLabelW);
   n++;
}
myListener.OnGame_BFReward_SetData = function(item, winRew, contributionRew, guildRew, point)
{
   var _loc1_ = lib.util.ExtString.split(item,"\t");
   container_mc.imgSlot.draw(_loc1_[0]);
   container_mc.imgSlot.grade = _loc1_[1];
   container_mc.imgSlot.display = true;
   container_mc.countMc0.countFd.text = winRew;
   container_mc.countMc1.countFd.text = contributionRew;
   container_mc.countMc2.countFd.text = guildRew;
   container_mc.countMc3.countFd.text = Number(contributionRew) + Number(guildRew) + Number(winRew);
   container_mc.countMc4.countFd.text = point;
   container_mc.pointContainerMc._visible = Number(point) != -1;
   container_mc.countMc4._visible = Number(point) != -1;
   container_mc.countLb4._visible = Number(point) != -1;
};
var x_btn = new lib.util.TxtBtn(container_mc.x_mc);
x_btn.setRelease(ToGame_BFReward_CloseUI);
var confirm_btn = container_mc.txtBtn0.txtBtn;
confirm_btn.setRelease(ToGame_BFReward_ConfirmReward);
ToGame_BFReward_Init();
Selection.setFocus(container_mc.txtBtn0.btn);
