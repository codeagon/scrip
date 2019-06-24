function limitLength(txdMc, limitL)
{
   var _loc2_ = txdMc.length;
   var _loc3_ = txdMc.text;
   if(_loc2_ > limitL)
   {
      var _loc4_ = new String(_loc3_);
      var _loc1_ = new String();
      _loc1_ = _loc4_.substr(0,limitL);
      txdMc.text = _loc1_;
   }
}
function ToGame_CommunityWindowEdit_Init()
{
   fscommand("ToGame_CommunityWindowEdit_Init");
}
function ToGame_CommunityWindowEdit_CloseUI()
{
   fscommand("ToGame_CommunityWindowEdit_CloseUI");
}
function ToGame_CommunityWindowEdit_Enter()
{
   var _loc1_ = container_mc.inputTxt.text;
   if(_loc1_ == INPUT_TXT)
   {
      _loc1_ = "";
   }
   getURL("FSCommand:ToGame_CommunityWindowEdit_GroupName",_loc1_);
   fscommand("ToGame_CommunityWindowEdit_Enter");
}
function ToGame_CommunityWindowEdit_Check(idx, type)
{
   getURL("FSCommand:ToGame_CommunityWindowEdit_Check",idx + "\t" + type);
}
var UI = this;
UI._visible = false;
var bWidgetOpen = false;
var UIname = "CommunityWindowEdit";
container_mc.UIDrager.setData(UIName,UI);
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
var x_btn = new lib.util.TxtBtn(container_mc.xBtn);
x_btn.setRelease(ToGame_CommunityWindowEdit_CloseUI);
var Enter_btn = container_mc.btn0.txtBtn;
var Cancel_btn = container_mc.btn1.txtBtn;
Enter_btn.setRelease(ToGame_CommunityWindowEdit_Enter);
Cancel_btn.setRelease(ToGame_CommunityWindowEdit_CloseUI);
var list_mcY = container_mc.lineBox._y;
var scrollbar = container_mc.scrollbar;
scrollbar.addListener(container_mc.lineBox);
container_mc.lineBox.onScroll = function()
{
   container_mc.lineBox._y = list_mcY - arguments[0];
};
scrollbar.setWheel(container_mc.lineBox);
scrollbar.wheelDelta = 1;
scrollbar.pageSize = 0;
scrollbar.displaySize = 385;
scrollbar.defaultBarSizeRatio = 0.3333333333333333;
scrollbar.rowHeight = 30;
scrollbar.scroll = 0;
var lineH = 25;
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
var input_txt = new lib.util.ExtTextField(container_mc.inputTxt,0,container_mc.input_focus);
myListener.OnGame_CommunityWindowEdit_TitleName = function(str)
{
   container_mc.txt.text = str;
};
myListener.OnGame_CommunityWindowEdit_GroupName = function(str)
{
   input_txt.textField.text = str;
};
myListener.OnGame_CommunityWindowEdit_SetList = function(dataList)
{
   var _loc8_ = lib.util.ExtString.split(dataList,"\n");
   var _loc9_ = _loc8_.length;
   var _loc3_ = 0;
   while(_loc3_ < _loc9_)
   {
      var _loc4_ = lib.util.ExtString.split(_loc8_[_loc3_],"\t");
      var _loc6_ = _loc4_[0];
      var _loc7_ = _loc4_[1];
      var _loc5_ = _loc4_[2];
      var _loc2_ = container_mc.lineBox.attachMovie("lineMc","line_" + _loc3_,container_mc.lineBox.getNextHighestDepth());
      _loc2_._y = lineH * _loc3_;
      _loc2_.txt0.setText(_loc6_);
      _loc2_.txt1.setText(_loc7_);
      _loc2_.checkMode = Boolean(Number(_loc5_));
      _loc2_.id = _loc3_;
      _loc2_.onEnterFrame = function()
      {
         delete this.onEnterFrame;
         this.checkBox.checked = this.checkMode;
         this.checkBox.onChanged = function(changed)
         {
            ToGame_CommunityWindowEdit_Check(this._parent.id,this.checked);
         };
      };
      _loc3_ = _loc3_ + 1;
   }
   scrollbar.pageSize = container_mc.lineBox._height;
};
myListener.OnGame_CommunityWindowEdit_SetButton = function(bEnable)
{
   Enter_btn.setEnabled = Boolean(Number(bEnable));
};
var limitLen = 10;
var INPUT_TXT = lib.util.UIString.getUIString("$111110");
input_txt.caption = INPUT_TXT;
myListener.OnGame_CommunityWindowEdit_LengthLocal = function(num)
{
   limitLen = num;
   INPUT_TXT = lib.util.UIString.getUIString("$111102","count",num);
   input_txt.caption = INPUT_TXT;
};
input_txt.onChanged = function()
{
   limitLength(container_mc.inputTxt,limitLen);
};
input_txt.onEnterKey = function()
{
   Selection.setFocus(null);
};
ToGame_CommunityWindowEdit_Init();
