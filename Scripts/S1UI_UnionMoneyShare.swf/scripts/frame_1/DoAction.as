function ToGame_UnionMoneyShare_Init()
{
   fscommand("ToGame_UnionMoneyShare_Init");
   lib.Debuger.trace("ToGame_UnionMoneyShare_Init");
}
function ToGame_UnionMoneyShare_Close()
{
   fscommand("ToGame_UnionMoneyShare_Close");
   lib.Debuger.trace("ToGame_UnionMoneyShare_Close");
}
function ToGame_UnionMoneyShare_InputMoney(money)
{
   getURL("FSCommand:ToGame_UnionMoneyShare_InputMoney",money);
   lib.Debuger.trace("ToGame_UnionMoneyShare_InputMoney  " + money);
}
function ToGame_UnionMoneyShare_Send()
{
   var _loc2_ = container_mc.targetMc.selected != undefined?container_mc.targetMc.selected:-1;
   var _loc3_ = !messageTxtFd.changed?"":messageTxtFd.text;
   var _loc1_ = _loc2_ + "\t" + Number(container_mc.onlineCheck.checked) + "\t" + container_mc.goldInput.total_nums + "\t" + _loc3_;
   getURL("FSCommand:ToGame_UnionMoneyShare_Send",_loc1_);
   lib.Debuger.trace("ToGame_UnionMoneyShare_Send  " + _loc1_);
}
var UI = this;
UI._visible = false;
var bWidgetOpen = false;
var UIname = "UnionMoneyShare";
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
container_mc.title_txt0.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
var NameTextLength_Local = 0;
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
container_mc.goldInput._func = function()
{
   lib.Debuger.trace("container_mc.goldInput.total_nums  " + container_mc.goldInput.total_nums);
   ToGame_UnionMoneyShare_InputMoney(container_mc.goldInput.total_nums);
};
myListener.OnGame_UnionMoneyShare_DefaultSetting = function(targets, selectTargetIndex, onlineState, _date, _message, money, moneyMin, moneyMax, chargeRate)
{
   container_mc.targetMc.cation = lib.util.UIString.getUIString("$471092");
   container_mc.targetMc.data = lib.util.ExtString.split(targets,"\t");
   if(Number(selectTargetIndex) >= 0)
   {
      container_mc.targetMc.setSelectedIndex(Number(selectTargetIndex));
   }
   container_mc.onlineCheck.checked = onlineState == "1";
   container_mc.dateFd.text = _date;
   if(_message != undefined && _message != "")
   {
      container_mc.messageFd.htmlText = _message;
   }
   container_mc.goldInput.max = moneyMax;
   container_mc.goldInput.min = moneyMin;
   container_mc.goldInput.total = money;
   container_mc.chargeLb.text = lib.util.UIString.getUIString("$471093") + " (" + chargeRate + "%)";
};
myListener.OnGame_UnionMoneyShare_Charge = function(charge)
{
   container_mc.chargeFd.htmlText = lib.util.GoldCurrency.SetGoldText(charge);
};
var inputTextMax = 100;
myListener.OnGame_UnionMoneyShare_LengthLocal = function(len)
{
   inputTextMax = Number(len);
};
container_mc.scrollbar.setTextField(container_mc.messageFd);
var messageTxtFd = new lib.util.ExtTextField(container_mc.messageFd,0,container_mc.messageFd_focus);
messageTxtFd.onChanged = messageTxtFd.onKillFocusEvent = function()
{
   lib.util.StrByteLen.getLenth3(container_mc.messageFd,inputTextMax);
};
messageTxtFd.caption = lib.util.UIString.getUIString("$471094");
var xBtn = new lib.util.TxtBtn(container_mc.x_mc);
var sendBtn = container_mc.txtBtn0.txtBtn;
var cancelBtn = container_mc.txtBtn1.txtBtn;
xBtn.setRelease(ToGame_UnionMoneyShare_Close);
sendBtn.setRelease(ToGame_UnionMoneyShare_Send);
cancelBtn.setRelease(ToGame_UnionMoneyShare_Close);
ToGame_UnionMoneyShare_Init();
