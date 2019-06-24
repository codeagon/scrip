function ToGame_SenatorPledge_CloseUI()
{
   fscommand("ToGame_SenatorPledge_CloseUI");
   trace("ToGame_SenatorPledge_CloseUI");
}
function closeUI()
{
   ToGame_SenatorPledge_CloseUI();
}
var UI = this;
UI._visible = false;
var UIname = "SenatorPledge";
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
var con = this;
container_mc.text_name.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
container_mc.pledge_txt.textColor = lib.info.TextColor.GENERAL_CONTENTS;
bWidgetOpen = false;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
container_mc.scrollbar.setTextField(container_mc.pledge_txt);
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
myListener.OnGame_SenatorPledge_SetData = function(titleStr, pledgeStr)
{
   container_mc.text_name.text = titleStr;
   container_mc.pledge_txt.text = pledgeStr;
};
var x_btn = new lib.util.TxtBtn(container_mc.x_mc);
x_btn.setRelease(closeUI);
fscommand("ToGame_SenatorPledge_Init");
