function ToGame_Popup_Event(id)
{
   getURL("FSCommand:ToGame_Popup_Event",popUpID + "\t" + id);
   trace("ToGame_Popup_Event: " + popUpID + "\t" + id);
   _root.debug3.text = "[시스템팝업] 이벤트전송 = id: " + id + "\r" + _root.debug3.text;
}
function released(id)
{
   ToGame_Popup_Event(id);
}
function closeUI()
{
   ToGame_AgitSellConfirm_CloseUI();
}
function btnAlign(tg)
{
   if(!btn1.btn._visible)
   {
      tg.txtBtn0._x = -68;
   }
   else
   {
      tg.txtBtn0._x = 6.7;
   }
}
var UI = this;
UI._visible = true;
var UIname = "SystemPopup";
var popup = container_mc;
var popUpID;
popup._visible = false;
popup.message_txt.textColor = lib.info.TextColor.GENERAL_CONTENTS;
popup.count_txt.textColor = lib.info.TextColor.GENERAL_CONTENTS;
popup.message_txt.verticalAlign = "center";
bWindowOpen = true;
lib.manager.UISkin.drawBg(UIname,container_mc.uiBgMc);
var myListener = new Object();
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
var counterMake = UI.createEmptyMovieClip("counter",UI.getNextHighestDepth());
myListener.OnGame_Popup_Create = function(type, argu1, argu2, argu3, argu4, argu5, argu6, argu7, argu8, argu9, argu10)
{
   if(type == 0)
   {
      type = Number(type);
      popUpID = argu1;
      popup._visible = true;
      if(lib.manager.PopupManager.getPopup(argu1) != null)
      {
         getURL("FSCommand:popupmanager",lib.manager.PopupManager.getPopup(argu1));
         myListener.OnGame_Popup_Update(argu1,argu2,argu3,argu4,argu5,argu6,argu7,argu8,argu9,argu10);
      }
      else
      {
         myListener.OnGame_Popup_Update(argu1,argu2,argu3,argu4,argu5,argu6,argu7,argu8,argu9,argu10);
         lib.manager.PopupManager.add(argu1,type,popup);
      }
   }
};
myListener.OnGame_Popup_Update = function(argu1, argu2, argu3, argu4, argu5, argu6, argu7, argu8, argu9, argu10)
{
   if(lib.manager.PopupManager.getType(argu1) > 0)
   {
      return undefined;
   }
   popup.message_txt.htmlText = argu2;
   if(argu3 != undefined && argu3 != null && argu3 != "" && argu3 != Number(0))
   {
      delete counter.onEnterFrame;
      counter.totalTime = Number(argu3) * 1000;
      counter.startedTime = getTimer();
      counter.aimTime = counter.startedTime + counter.totalTime;
      counter.onEnterFrame = function()
      {
         var _loc2_ = getTimer();
         popup.count_txt.htmlText = lib.util.UIString.getUIString("$193001","secondColor",lib.info.TextColor.GENERAL_EMPHASIS.toString(16),"EndSec",Math.ceil((counter.aimTime - _loc2_) / 1000));
         if(counter.aimTime <= _loc2_)
         {
            popup.count_txt.htmlText = lib.util.UIString.getUIString("$193001","secondColor",lib.info.TextColor.GENERAL_EMPHASIS.toString(16),"EndSec",0);
            delete this.onEnterFrame;
         }
      };
   }
   else
   {
      delete counter.onEnterFrame;
      popup.count_txt.text = "";
   }
   if(argu5 != undefined && argu5 != null && argu5 != "")
   {
      btn0.setVisible(true);
      btn0.id = argu4;
      btn0.setText(argu5);
   }
   else
   {
      btn0.setVisible(false);
   }
   if(argu6 != undefined && argu7 != null && argu7 != "")
   {
      btn1.setVisible(true);
      btn1.id = argu6;
      btn1.setText(argu7);
   }
   else
   {
      btn1.setVisible(false);
   }
   if(btn0.btn._visible && btn1.btn._visible)
   {
      container_mc.firstFocus = container_mc.txtBtn1.btn;
      Selection.setFocus(container_mc.txtBtn1.btn);
   }
   else if(!btn0.btn._visible && btn1.btn._visible)
   {
      container_mc.firstFocus = container_mc.txtBtn1.btn;
      Selection.setFocus(container_mc.txtBtn1.btn);
   }
   else if(btn0.btn._visible && !btn1.btn._visible)
   {
      container_mc.firstFocus = container_mc.txtBtn0.btn;
      Selection.setFocus(container_mc.txtBtn0.btn);
   }
   btnAlign(popup);
};
myListener.OnGame_Popup_Remove = function(id)
{
   var _loc3_ = lib.manager.PopupManager.getType(id);
   if(_loc3_ == 0)
   {
      _root.debug3.text = "[팝업(시스템)] 제거를 원함 = type: 0, id: " + id + "\r" + _root.debug3.text;
      popup._visible = false;
      btn0.setVisible(false);
      btn1.setVisible(false);
      lib.manager.PopupManager.remove(id);
   }
};
_global.EventBroadCaster.addListener(myListener);
var btn0 = container_mc.txtBtn0.txtBtn;
var btn1 = container_mc.txtBtn1.txtBtn;
btn0.setVisible(false);
btn1.setVisible(false);
btn0.setRelease(abc = function()
{
   released(btn0.id);
});
btn1.setRelease(def = function()
{
   released(btn1.id);
});
lib.manager.Focus.addFocusGroup(UIname,1,[container_mc.txtBtn1.btn,container_mc.txtBtn0.btn]);
