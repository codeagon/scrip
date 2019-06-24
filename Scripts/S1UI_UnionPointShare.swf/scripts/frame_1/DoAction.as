function ToGame_UnionPointShare_Init()
{
   fscommand("ToGame_UnionPointShare_Init");
   lib.Debuger.trace("ToGame_UnionPointShare_Init");
}
function ToGame_UnionPointShare_Close()
{
   fscommand("ToGame_UnionPointShare_Close");
   lib.Debuger.trace("ToGame_UnionPointShare_Close");
}
function ToGame_UnionPointShare_Mode(_value)
{
   getURL("FSCommand:ToGame_UnionPointShare_Mode",_value);
   lib.Debuger.trace("ToGame_UnionPointShare_Mode " + _value);
}
function ToGame_UnionPointShare_Confirm()
{
   var _loc1_ = !container_mc.radioBtn0.checked?container_mc.numberSteper.text + "\t" + container_mc.autoTxtFd.text:container_mc.numberSteper.text;
   getURL("FSCommand:ToGame_UnionPointShare_Confirm",_loc1_);
   lib.Debuger.trace("ToGame_UnionPointShare_Confirm " + _loc1_);
}
function ToGame_UnionPointShare_SearchName(str)
{
   getURL("FSCommand:ToGame_UnionPointShare_SearchName",str);
   lib.Debuger.trace("ToGame_UnionPointShare_SearchName " + str);
}
function ToGame_UnionPointShare_InputPoint(point)
{
   if(point == "" || point == undefined)
   {
      point = 0;
   }
   getURL("FSCommand:ToGame_UnionPointShare_InputPoint",point);
   lib.Debuger.trace("ToGame_UnionPointShare_InputPoint " + point);
}
var UI = this;
UI._visible = false;
var bWidgetOpen = false;
var UIname = "UnionPointShare";
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
container_mc.title_txt.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
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
container_mc.numberSteper.min = 0;
container_mc.numberSteper.max = 1000000;
container_mc.autoTxtFd.extTextFd.caption = lib.util.UIString.getUIString("$471105");
var tempName = "";
container_mc.autoTxtFd.onChanged = function(str)
{
   if(NameTextLength_Local < lib.util.StrByteLen.getLenth2(str))
   {
      container_mc.autoTxtFd.inputFd.text = tempName;
      return undefined;
   }
   tempName = str;
   txtBtn0.setEnabled(container_mc.numberSteper.ext_textField.changed && container_mc.numberSteper.text != "0" && (container_mc.autoTxtFd.text != "" && str != " "));
   ToGame_UnionPointShare_SearchName(str);
};
var shareCount = 0;
myListener.OnGame_UnionPointShare_Justice = function(remainPoint, memberCount)
{
   container_mc.radioBtn0.checked = true;
   container_mc.radioBtn1.checked = false;
   container_mc.lb2._visible = true;
   container_mc.lb3._visible = true;
   container_mc.txtFd2._visible = true;
   container_mc.txtFd3._visible = true;
   container_mc.autoTxtFd.inputFd.type = "dynamic";
   container_mc.autoTxtFd.inputFd.selectable = false;
   container_mc.subTitleLb.text = "$471096";
   lb0.text = "$471098";
   lb1.text = "$471099";
   lb2.text = "$471100";
   lb3.text = "$471101";
   container_mc.autoTxtFd.inputFd.text = container_mc.autoTxtFd.extTextFd.caption;
   container_mc.autoTxtFd.inputFd.textColor = 14145495;
   container_mc.autoTxtFd.bgMc._visible = false;
   shareCount = Number(memberCount);
   container_mc.numberSteper.min = 1;
   container_mc.numberSteper.max = remainPoint;
   container_mc.numberSteper.text = 0;
   container_mc.numberSteper.onChanged = function(changed)
   {
      if(changed)
      {
         ToGame_UnionPointShare_InputPoint(this.text);
      }
      txtBtn0.setEnabled(changed);
   };
   remainPoint = lib.util.CurrencyFormat.makeComma(remainPoint);
   memberCount = "<font color=\'#80E71C\'>" + lib.util.CurrencyFormat.makeComma(memberCount) + "</font>" + lib.util.UIString.getUIString("$123042");
   var _loc4_ = "<font color=\'#80E71C\'>0</font><img src=\'img://__Icon_Items.UnionpointCoin\' width=\'20\' height=\'20\' vspace=\'-2\'>";
   container_mc.txtFd3.htmlText = _loc4_;
   container_mc.txtFd2.htmlText = memberCount;
   container_mc.pointFd.htmlText = remainPoint + "<img src=\'img://__Icon_Items.UnionpointCoin\' width=\'20\' height=\'20\' vspace=\'-2\'>";
   txtBtn0.setEnabled(false);
};
myListener.OnGame_UnionPointShare_SetEachPoint = function(point)
{
   var _loc1_ = "<font color=\'#80E71C\'>" + lib.util.CurrencyFormat.makeComma(point) + "</font><img src=\'img://__Icon_Items.UnionpointCoin\' width=\'20\' height=\'20\' vspace=\'-2\'>";
   container_mc.txtFd3.htmlText = _loc1_;
};
myListener.OnGame_UnionPointShare_Individual = function(remainPoint)
{
   container_mc.radioBtn0.checked = false;
   container_mc.radioBtn1.checked = true;
   container_mc.lb2._visible = false;
   container_mc.lb3._visible = false;
   container_mc.txtBg0._visible = true;
   container_mc.txtFd2._visible = false;
   container_mc.txtFd3._visible = false;
   container_mc.autoTxtFd.inputFd.type = "input";
   container_mc.autoTxtFd.inputFd.selectable = true;
   container_mc.autoTxtFd.bgMc._visible = true;
   container_mc.subTitleLb.text = "$471097";
   tempName = "";
   container_mc.autoTxtFd.inputFd.text = "$471107";
   container_mc.autoTxtFd.inputFd.textColor = lib.info.TextColor.INPUT_DEFAULT;
   container_mc.numberSteper.min = 1;
   container_mc.numberSteper.max = remainPoint;
   container_mc.numberSteper.text = 0;
   container_mc.numberSteper.onChanged = function(changed)
   {
      if(changed)
      {
         ToGame_UnionPointShare_InputPoint(this.text);
      }
      txtBtn0.setEnabled(container_mc.autoTxtFd.text != "" && changed);
   };
   remainPoint = lib.util.CurrencyFormat.makeComma(remainPoint);
   container_mc.pointFd.htmlText = remainPoint + "<img src=\'img://__Icon_Items.UnionpointCoin\' width=\'20\' height=\'20\' vspace=\'-2\'>";
   txtBtn0.setEnabled(false);
};
myListener.OnGame_UnionPointShare_SearchNameResult = function(_data)
{
   _data = lib.util.ExtString.split(_data,"\t");
   container_mc.autoTxtFd.searchResult(_data);
};
myListener.OnGame_UnionPointShare_spendPoint = function(point)
{
   container_mc.spendPointFd.htmlText = point + "<img src=\'img://__Icon_Items.UnionpointCoin\' width=\'20\' height=\'20\' vspace=\'-2\'>";
};
myListener.OnGame_UnionPointShare_LengthLocal = function(lengthnum)
{
   NameTextLength_Local = Number(lengthnum);
};
var xBtn = new lib.util.TxtBtn(container_mc.x_mc);
var txtBtn0 = container_mc.txtBtn0.txtBtn;
var txtBtn1 = container_mc.txtBtn1.txtBtn;
txtBtn0.setEnabled(false);
xBtn.setRelease(ToGame_UnionPointShare_Close);
txtBtn1.setRelease(ToGame_UnionPointShare_Close);
txtBtn0.setRelease(ToGame_UnionPointShare_Confirm);
container_mc.radioBtn0.onChanged = function()
{
   container_mc.radioBtn1.checked = false;
   ToGame_UnionPointShare_Mode(0);
};
container_mc.radioBtn1.onChanged = function()
{
   container_mc.radioBtn0.checked = false;
   ToGame_UnionPointShare_Mode(1);
};
ToGame_UnionPointShare_Init();
