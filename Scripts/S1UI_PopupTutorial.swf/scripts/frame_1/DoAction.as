function ToGame_PopupTutorial_BtnEvent(index)
{
   lib.Debuger.trace("ToGame_PopupTutorial_BtnEvent  " + index);
   getURL("FSCommand:ToGame_PopupTutorial_BtnEvent",index);
}
function ToGame_PopupTutorial_Close()
{
   lib.Debuger.trace("ToGame_PopupTutorial_Close  ");
   fscommand("ToGame_PopupTutorial_Close");
}
var UI = this;
UI._visible = false;
var bWidgetOpen = false;
var UIname = "PopupTutorial";
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
var SkinType;
var GUIDESTR0 = "$462009";
var GUIDESTR1 = "$462010";
var TITLE0 = "$462001";
var TITLE1 = "$462002";
container_mc.guideFd.verticalAlign = "center";
myListener.OnGame_PopupTutorial_Layout = function(_SkinType)
{
   SkinType = Number(_SkinType);
   container_mc.bg0._visible = SkinType == 0;
   container_mc.bg1._visible = SkinType == 1;
   container_mc.bg0.mc0._visible = false;
   container_mc.bg0.mc1._visible = false;
   container_mc.bg1.mc0._visible = false;
   container_mc.bg1.mc1._visible = false;
   Btn0.setVisible(SkinType == 0);
   Btn1.setVisible(SkinType == 0);
   Btn2.setVisible(SkinType == 1);
   Btn3.setVisible(SkinType == 1);
   if(SkinType == 0)
   {
      container_mc.txtBtn0.tabIndex = 0;
      container_mc.txtBtn1.tabIndex = 1;
      container_mc.text_name0.text = TITLE0;
      container_mc.guideFd.text = GUIDESTR0;
   }
   else if(SkinType == 1)
   {
      container_mc.txtBtn2.tabIndex = 0;
      container_mc.txtBtn3.tabIndex = 1;
      container_mc.text_name0.text = TITLE1;
      container_mc.guideFd.text = GUIDESTR1;
   }
};
var closeBtn = new lib.util.TxtBtn(container_mc.close_mc);
var Btn0 = new lib.util.TxtBtn(container_mc.txtBtn0);
var Btn1 = new lib.util.TxtBtn(container_mc.txtBtn1);
var Btn2 = new lib.util.TxtBtn(container_mc.txtBtn2);
var Btn3 = new lib.util.TxtBtn(container_mc.txtBtn3);
closeBtn.setRelease(function()
{
   ToGame_PopupTutorial_Close();
}
);
Btn0.setRelease(function()
{
   ToGame_PopupTutorial_BtnEvent(0);
}
);
Btn1.setRelease(function()
{
   ToGame_PopupTutorial_BtnEvent(1);
}
);
Btn2.setRelease(function()
{
   ToGame_PopupTutorial_BtnEvent(0);
}
);
Btn3.setRelease(function()
{
   ToGame_PopupTutorial_BtnEvent(1);
}
);
Btn0.setRollOver(function()
{
   container_mc.bg0.mc0._visible = true;
}
);
Btn1.setRollOver(function()
{
   container_mc.bg0.mc1._visible = true;
}
);
Btn2.setRollOver(function()
{
   container_mc.bg1.mc0._visible = true;
}
);
Btn3.setRollOver(function()
{
   container_mc.bg1.mc1._visible = true;
}
);
Btn0.setRollOut(function()
{
   container_mc.bg0.mc0._visible = false;
}
);
Btn1.setRollOut(function()
{
   container_mc.bg0.mc1._visible = false;
}
);
Btn2.setRollOut(function()
{
   container_mc.bg1.mc0._visible = false;
}
);
Btn3.setRollOut(function()
{
   container_mc.bg1.mc1._visible = false;
}
);
container_mc.bg0._visible = false;
container_mc.bg1._visible = false;
Btn0.setVisible(false);
Btn1.setVisible(false);
Btn2.setVisible(false);
Btn3.setVisible(false);
fscommand("ToGame_PopupTutorial_Init");
