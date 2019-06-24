function inputEvent(_bool)
{
   inputField.textField.selectable = _bool;
   container_mc.inputBtn._visible = _bool;
   container_mc.input_bg._visible = _bool;
   if(!_bool)
   {
      return undefined;
   }
   inputField.caption = lib.util.UIString.getUIString("$164006");
}
_global.gfxExtensions = true;
var UI = this;
UI._visible = false;
var UIname = "UnionInfo";
this.bWindowOpen = false;
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
container_mc.unionTitleFd.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
var NameTextLength_Local = 0;
var ConsulType = false;
var inputField = new lib.util.ExtTextField(container_mc.input_txt,0,container_mc.input_focus);
var scrollBar = container_mc.scrollbar;
var check_Btn = container_mc.checkBtn.txtBtn;
check_Btn.setRelease(function()
{
   myListener.ToGame_UnionInfo_CloseUI();
}
);
var input_Btn = container_mc.inputBtn.txtBtn;
input_Btn.setRelease(function()
{
   myListener.ToGame_UnionInfo_InputData();
}
);
var x_btn = new lib.util.TxtBtn(container_mc.x_mc);
x_btn.setRelease(function()
{
   myListener.ToGame_UnionInfo_CloseUI();
}
);
myListener.OnGameEventShowWindow = function(WindowName, bShow)
{
   if(WindowName.toLowerCase() == UIname.toLowerCase())
   {
      bWindowOpen = bShow;
      if(_global.gbUIMode && bWindowOpen)
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
   if(_global.gbUIMode && bWindowOpen)
   {
      UI._visible = true;
   }
   else
   {
      UI._visible = false;
   }
};
myListener.OnGame_UnionInfo_SetUnionTitle = function(_title, _img)
{
   container_mc.unionTitleFd.text = _title;
   lib.util.DrawBitmap.draw(container_mc.unionTitleBgMc,_img);
};
myListener.OnGame_UnionInfo_SetData = function(_text0, _text1)
{
   if(_text0 == undefined)
   {
      container_mc.txt0.htmlText = "";
   }
   else
   {
      container_mc.txt0.htmlText = _text0;
   }
   if(_text1 == undefined)
   {
      container_mc.txt1.htmlText = "";
   }
   else
   {
      container_mc.txt1.htmlText = _text1;
   }
};
myListener.OnGame_UnionInfo_SetInputData = function(_type, _data)
{
   ConsulType = Boolean(_type);
   inputEvent(ConsulType);
   if(_data == undefined)
   {
      container_mc.input_txt.htmlText = "";
   }
   else
   {
      container_mc.input_txt.htmlText = _data;
   }
   scrollBar.setTextField(container_mc.input_txt);
   scrollBar.scroll = 0;
   scrollBar.resize(scrollBar._height);
};
myListener.OnGame_UnionInfo_LengthLocal = function(lengthnum)
{
   NameTextLength_Local = lengthnum;
};
myListener.ToGame_UnionInfo_CloseUI = function()
{
   fscommand("ToGame_UnionInfo_CloseUI");
};
myListener.ToGame_UnionInfo_InputData = function()
{
   getURL("FSCommand:ToGame_UnionInfo_InputData",container_mc.input_txt.text);
};
inputField.onSetFocusEvent = function()
{
   if(this.text == this.caption)
   {
      this.textField.text = "";
   }
};
inputField.onKillFocusEvent = function()
{
   var _loc2_ = this.text;
   if(_loc2_ == this.caption)
   {
      _loc2_ = "";
   }
   _loc2_ = lib.util.ExtString.trim(_loc2_);
   _loc2_ = lib.util.ExtString.replace(_loc2_,"\r","");
   lib.util.StrByteLen.getLenth3(container_mc.input_txt,NameTextLength_Local);
};
inputField.onChanged = function()
{
   var _loc1_ = 0;
   if(NameTextLength_Local > 0)
   {
      _loc1_ = NameTextLength_Local;
   }
   else
   {
      _loc1_ = 500;
   }
   lib.util.StrByteLen.getLenth3(container_mc.input_txt,_loc1_);
};
inputEvent(false);
fscommand("ToGame_UnionInfo_Init");
