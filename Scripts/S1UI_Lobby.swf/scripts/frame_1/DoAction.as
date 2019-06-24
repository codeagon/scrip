function ToGameLobbyRequestLogin()
{
   getURL("FSCommand:ToGameLobbyRequestLogin",container_mc.editId.text + "\t" + container_mc.editPw.text);
}
function ToGameLobbyCancelLogin()
{
   fscommand("ToGameLobbyCancelLogin");
}
var UI = this;
var UIname = "LOGIN";
container_mc.editId.text = "myxymg";
container_mc.id.text = "ID";
container_mc.pw.text = "PW";
var bWidgetOpen = false;
var myListener = new Object();
myListener.OnGameEventShowWindow = function(widgetName, bShow)
{
   if(widgetName.toLowerCase() == UIname.toLowerCase())
   {
      bWidgetOpen = bShow;
      if(bWidgetOpen)
      {
         UI._visible = true;
      }
      else
      {
         UI._visible = false;
      }
   }
};
myListener.OnGameEventSetLoginId = function(strId)
{
   UI.container_mc.editId.text = strId;
   UI.container_mc.editId.onChanged();
};
myListener.OnGame_KeyDown = function(code)
{
   if(code == 9)
   {
      var focus = eval(Selection.getFocus());
      if(focus == container_mc.editId)
      {
         Selection.setFocus(container_mc.editPw);
      }
   }
   else if(code == 13)
   {
      login_btn.btn.hit.onRelease();
   }
};
_global.EventBroadCaster.addListener(myListener);
var idReady = true;
var pwReady = false;
container_mc.editId.onChanged = function()
{
   if(lib.util.ExtString.trim(this.text) == "")
   {
      idReady = false;
      login_btn.setEnabled(false);
   }
   else
   {
      idReady = true;
      if(pwReady)
      {
         login_btn.setEnabled(true);
      }
   }
};
container_mc.editPw.onChanged = function()
{
   if(lib.util.ExtString.trim(this.text) == "")
   {
      pwReady = false;
      login_btn.setEnabled(false);
   }
   else
   {
      pwReady = true;
      if(idReady)
      {
         login_btn.setEnabled(true);
      }
   }
};
Selection.setFocus(container_mc.editPw);
var login_btn = new lib.util.TxtAniBtn(container_mc.login_mc,container_mc.login_txt,20,27,33,43);
var cancel_btn = new lib.util.TxtAniBtn(container_mc.cancel_mc,container_mc.cancel_txt,20,27,33,43);
login_btn.setEnabled(false);
login_btn.setRelease(abc = function()
{
   ToGameLobbyRequestLogin();
});
cancel_btn.setRelease(def = function()
{
   ToGameLobbyCancelLogin();
});
fscommand("ToGame_LOGIN_Init");
