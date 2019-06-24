function ToGame_NoteRead_Init()
{
   lib.Debuger.trace("ToGame_NoteRead_Init");
   fscommand("ToGame_NoteRead_Init");
}
function ToGame_NoteRead_CloseUI()
{
   lib.Debuger.trace("ToGame_NoteRead_CloseUI");
   fscommand("ToGame_NoteRead_CloseUI");
}
function ToGame_NoteRead_Remove()
{
   lib.Debuger.trace("ToGame_NoteRead_Remove");
   fscommand("ToGame_NoteRead_Remove");
}
function ToGame_NoteRead_Reply()
{
   lib.Debuger.trace("ToGame_NoteRead_Reply");
   fscommand("ToGame_NoteRead_Reply");
}
var UI = this;
UI._visible = false;
var bWidgetOpen = false;
var UIname = "NoteRead";
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
container_mc.title_txt.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
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
myListener.OnGame_NoteRead_SetMessage = function(fromName, toName, date, _message)
{
   container_mc.sendNameFd.text = fromName;
   container_mc.recieveNameFd.text = toName;
   container_mc.dateFd.text = date;
   container_mc.messageFd.text = _message;
};
var close_btn = new lib.util.TxtAniBtn(container_mc.close_mc,container_mc.close_txt,20,27,33,43);
var reply_btn = new lib.util.TxtAniBtn(container_mc.reply_mc,container_mc.reply_txt,20,27,33,43);
var remove_btn = new lib.util.TxtAniBtn(container_mc.remove_mc,container_mc.remove_txt,20,27,33,43);
var x_btn = new lib.util.TxtBtn(container_mc.x_mc);
close_btn.setRelease(ToGame_NoteRead_CloseUI);
reply_btn.setRelease(ToGame_NoteRead_Reply);
x_btn.setRelease(ToGame_NoteRead_CloseUI);
remove_btn.setRelease(ToGame_NoteRead_Remove);
container_mc.scrollbar.setTextField(container_mc.messageFd);
