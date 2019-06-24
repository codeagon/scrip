function setQuantityBtn()
{
   container_mc.numberSteper.min = 0;
   container_mc.numberSteper.max = Number(maxGambleNumber);
   container_mc.numberSteper.min = 1;
   container_mc.numberSteper.onChanged = function(changed)
   {
      if(changed)
      {
         currentGambleNum = Number(container_mc.numberSteper.text);
         ToGame_PandoraBox_SetGambleNum(currentGambleNum);
      }
      left_btn.setEnabled(changed && currentGambleNum != 0);
   };
}
function setNumStepperEnable(bTrue)
{
   if(!bTrue)
   {
      container_mc.numberSteper._alpha = 80;
      container_mc.numberSteper.onRelease = function()
      {
      };
   }
   else
   {
      container_mc.numberSteper._alpha = 100;
      delete container_mc.numberSteper.onRelease;
   }
}
function ToGame_PandoraBox_Init()
{
   fscommand("ToGame_PandoraBox_Init");
   trace("ToGame_PandoraBox_Init");
}
function ToGame_PandoraBox_SetGambleNum(num)
{
   getURL("FSCommand:ToGame_PandoraBox_SetGambleNum",num);
   trace("ToGame_PandoraBox_SetGambleNum : " + num);
}
function ToGame_PandoraBox_Start()
{
   container_mc._alpha = 0;
   getURL("FSCommand:ToGame_PlaySound",1018);
   trace("ToGame_PlaySound   1018");
   fscommand("ToGame_PandoraBox_Start");
   trace("ToGame_PandoraBox_Start");
   container_mc.message_txt.htmlText = "$211003";
   container_mc.message_txt.textColor = 16777215;
   container_mc.PandoraBox__0.drag = false;
   setNumStepperEnable(false);
   gambleEffectCnt = 0;
   result = null;
   right_btn.setEnabled(false);
   left_btn.setEnabled(false);
}
function ToGame_PandoraBox_Continue()
{
   container_mc._alpha = 0;
   fscommand("ToGame_PandoraBox_Continue");
   trace("ToGame_PandoraBox_Continue");
   container_mc.PandoraBox__0.drag = false;
   container_mc.message_txt.htmlText = "$211003";
   container_mc.message_txt.textColor = 16777215;
   gambleEffectCnt = 0;
   result = null;
   right_btn.setEnabled(false);
   left_btn.setEnabled(false);
}
function ToGame_PandoraBox_Stop()
{
   continue_btn.setEnabled(false);
   stop_btn.setEnabled(false);
   fscommand("ToGame_PandoraBox_Stop");
   trace("ToGame_PandoraBox_Stop");
}
function ToGame_PandoraBox_CloseUI()
{
   fscommand("ToGame_PandoraBox_CloseUI");
   trace("ToGame_PandoraBox_CloseUI");
}
function start()
{
   ToGame_PandoraBox_Start();
}
function closeUI()
{
   ToGame_PandoraBox_CloseUI();
}
var UI = this;
UI._visible = false;
var UIname = "PandoraBox";
container_mc.title_txt.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
container_mc.pbgmc.hitTestDisable = true;
var type1Str = lib.util.UIString.getUIString("$211001");
var type2Str = lib.util.UIString.getUIString("$211011");
var type3Str = lib.util.UIString.getUIString("$211012");
bWidgetOpen = false;
container_mc.PandoraBox__0.drag = false;
var dataName = "PandoraBox__";
var maxGambleNumber = null;
var currentGambleNum = null;
var gambleItemId = null;
var gambleItemName = "";
var gambleEffectCnt = 0;
var gambleEffectAimCnt = 4;
var type = 0;
var result = null;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
myListener.OnGame_PandoraBox_SetType = function(_type)
{
   type = Number(_type);
   if(type == 1)
   {
      container_mc.message_txt.htmlText = type1Str;
      container_mc.numberSteper._visible = true;
   }
   else if(type == 2)
   {
      container_mc.message_txt.htmlText = type2Str;
      container_mc.numberSteper._visible = false;
   }
   else if(type == 3)
   {
      container_mc.message_txt.htmlText = type3Str;
      container_mc.numberSteper._visible = false;
   }
   container_mc.message_txt.textColor = 16777215;
};
myListener.OnGame_PandoraBox_SetMode(1);
myListener.OnGameEventShowWindow = function(widgetName, bShow)
{
   if(widgetName.toLowerCase() == "pandorabox")
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
   return undefined;
};
myListener.OnGame_PandoraBox_SetItemSlot = function(itemId, img, itemName, maxGambleNum, useable, grade, sealType, bMasterpiece)
{
   maxGambleNumber = maxGambleNum;
   gambleItemId = itemId;
   gambleItemName = itemName;
   container_mc.numberSteper._visible = true;
   lib.util.DrawBitmap.draw(container_mc.PandoraBox__0.Icon,img,50,50);
   container_mc.PandoraBox__0.id = itemId;
   lib.manager.ToolTip.add(container_mc.PandoraBox__0.SLOT,itemId,6,container_mc.PandoraBox__0.Icon);
   if(itemName != "" && itemName != undefined)
   {
      container_mc.message_txt.htmlText = "$211002";
   }
   if(useable != undefined)
   {
      container_mc.PandoraBox__0.impossible = Number(useable);
   }
   container_mc.PandoraBox__0.drag = true;
   container_mc.PandoraBox__0.grade = grade;
   container_mc.PandoraBox__0.sealType = sealType;
   container_mc.PandoraBox__0.masterpiece = bMasterpiece;
   container_mc.PandoraBox__0.BG_EMPTY._visible = false;
   currentGambleNum = 1;
   setQuantityBtn();
   container_mc.numberSteper.ext_textField.text = currentGambleNum;
   container_mc.title_txt.text = "$211004";
   left_btn.txt.text = "$211006";
   right_btn.txt.text = "$211008";
   left_btn.setRelease(start);
   right_btn.setRelease(closeUI);
   right_btn.setEnabled(true);
   left_btn.setEnabled(true);
   setNumStepperEnable(true);
};
myListener.OnGame_PandoraBox_SetResult = function(result, multiplyNum)
{
   result = Number(result);
   UI.result = result;
   var _loc2_ = lib.info.TextColor["RAREGRADE" + container_mc.PandoraBox__0.grade].toString(16);
   container_mc.message_txt.htmlText = lib.util.UIString.getUIString("$211010","color","#" + _loc2_,"ItemName",gambleItemName,"GambleTime",multiplyNum);
   if(result)
   {
      container_mc._alpha = 100;
      container_mc.title_txt.text = "$211005";
      container_mc.PandoraBox__0.drag = true;
      container_mc.message_txt._visible = true;
      left_btn.txt.text = "$211007";
      right_btn.txt.text = "$211009";
      right_btn.setEnabled(true);
      left_btn.setEnabled(true);
      left_btn.btn.gotoAndStop(1);
      left_btn.setRelease(a = function()
      {
         ToGame_PandoraBox_Continue();
      });
      right_btn.setRelease(b = function()
      {
         ToGame_PandoraBox_Stop();
      });
      setNumStepperEnable(false);
   }
   else
   {
      ToGame_PandoraBox_CloseUI();
   }
};
setNumStepperEnable(false);
container_mc.message_txt._visible = true;
var right_btn = new lib.util.TxtBtn(container_mc.right_mc,container_mc.right_txt);
var left_btn = new lib.util.TxtBtn(container_mc.left_mc,container_mc.left_txt);
var x_btn = new lib.util.TxtBtn(container_mc.x_mc);
right_btn.setTextColor(lib.info.TextColor.BTN_UINIQUE_NORMAL,lib.info.TextColor.BTN_UINIQUE_OVER,lib.info.TextColor.BTN_UINIQUE_PRESS,lib.info.TextColor.BTN_UINIQUE_DISABLE);
left_btn.setTextColor(lib.info.TextColor.BTN_UINIQUE_NORMAL,lib.info.TextColor.BTN_UINIQUE_OVER,lib.info.TextColor.BTN_UINIQUE_PRESS,lib.info.TextColor.BTN_UINIQUE_DISABLE);
left_btn.setEnabled(false);
start_btn.setRelease(start);
continue_btn.setRelease(a = function()
{
   ToGame_PandoraBox_Continue();
});
stop_btn.setRelease(b = function()
{
   ToGame_PandoraBox_Stop();
});
right_btn.setRelease(closeUI);
x_btn.setRelease(closeUI);
container_mc._alpha = 100;
container_mc.PandoraBox__0.BG_EMPTY._visible = false;
fscommand("ToGame_PandoraBox_Init");
