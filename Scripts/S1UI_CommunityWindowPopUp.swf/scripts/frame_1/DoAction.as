function ToGame_CommunityWindowPopUp_Init()
{
   fscommand("ToGame_CommunityWindowPopUp_Init");
}
function ToGame_CommunityWindowPopUp_CloseUI()
{
   fscommand("ToGame_CommunityWindowPopUp_CloseUI");
}
function ToGame_CommunityWindowPopUp_RequestSelect(index)
{
   getURL("FSCommand:ToGame_CommunityWindowPopUp_RequestSelect",index);
}
function ToGame_CommunityWindowPopUp_RequestEnter()
{
   var _loc2_ = container_mc.inputTxt0.text;
   var _loc1_ = container_mc.inputTxt1.text;
   if(_loc1_ == "" || _loc1_ == undefined)
   {
      _loc1_ = DEFAULT_STR1;
   }
   getURL("FSCommand:ToGame_CommunityWindowPopUp_RequestEnter",_loc2_ + "\t" + _loc1_);
}
function ToGame_CommunityWindowPopUp_CodeEnter()
{
   var _loc1_ = container_mc.inputTxt0.text;
   getURL("FSCommand:ToGame_CommunityWindowPopUp_CodeEnter",_loc1_);
}
function ToGame_CommunityWindowPopUp_CodeCancel()
{
   fscommand("ToGame_CommunityWindowPopUp_CodeCancel");
}
function ToGame_CommunityWindowPopUp_InviteEnter()
{
   fscommand("ToGame_CommunityWindowPopUp_InviteEnter");
}
function ToGame_CommunityWindowPopUp_ComboBox(idx)
{
   getURL("FSCommand:ToGame_CommunityWindowPopUp_ComboBox",idx);
}
function btnInit(_type)
{
   var _loc1_ = container_mc["selectBtn" + _type];
   _loc1_.focusMc.gotoAndStop(1);
   _loc1_.overMc0._alpha = 50;
}
function initPage_Request()
{
   container_mc.onEnterFrame = function()
   {
      delete container_mc.onEnterFrame;
      var _loc1_ = new lib.util.ExtTextField(container_mc.inputTxt0,0,container_mc.inputFocus0);
      var messageInput = new lib.util.ExtTextField(container_mc.inputTxt1,0,container_mc.inputFocus1);
      _loc1_.caption = DEFAULT_STR0;
      messageInput.caption = DEFAULT_STR1;
      Selection.setFocus(_loc1_.textField);
      _loc1_.onEnterKey = function()
      {
         Selection.setFocus(messageInput.textField);
      };
      messageInput.onEnterKey = function()
      {
         Selection.setFocus(null);
      };
      lib.manager.Focus.addFocusGroup(UIname,1,[_loc1_.textField,messageInput.textField]);
      _loc1_.onChanged = function()
      {
         limitLength(container_mc.inputTxt0,25);
         if(container_mc.inputTxt0.text == "")
         {
            request_btn.setEnabled(false);
         }
         else
         {
            request_btn.setEnabled(true);
         }
      };
      messageInput.onChanged = function()
      {
         limitLength(container_mc.inputTxt1,20);
      };
      request_btn = container_mc.btn0.txtBtn;
      request_btn.setRelease(ToGame_CommunityWindowPopUp_RequestEnter);
      btnArray = [request_btn];
      request_btn.setEnabled(false);
   };
}
function limitLength(txdMc, limitLen)
{
   var _loc2_ = txdMc.length;
   var _loc3_ = txdMc.text;
   if(_loc2_ > limitLen)
   {
      var _loc4_ = new String(_loc3_);
      var _loc1_ = new String();
      _loc1_ = _loc4_.substr(0,limitLen);
      txdMc.text = _loc1_;
   }
}
function initPage_Input()
{
   comboMc = container_mc.comboBox;
   container_mc.tipMc._visible = false;
   container_mc.onEnterFrame = function()
   {
      delete container_mc.onEnterFrame;
      checkEnter_btn = container_mc.btn0.txtBtn;
      checkEnter_btn.setRelease(ToGame_CommunityWindowPopUp_CodeEnter);
      checkEnter_btn.setEnabled(false);
      var _loc2_ = container_mc.btn1.txtBtn;
      _loc2_.setRelease(ToGame_CommunityWindowPopUp_CodeCancel);
      btnArray = [checkEnter_btn,_loc2_];
      var _loc1_ = new lib.util.ExtTextField(container_mc.inputTxt0,0,container_mc.inputFocus0);
      _loc1_.onEnterKey = function()
      {
         Selection.setFocus(null);
      };
      _loc1_.onChanged = function()
      {
         limitLength(container_mc.inputTxt0,25);
         if(container_mc.inputTxt0.text != "" && comboIndex != 0)
         {
            checkEnter_btn.setEnabled(true);
         }
         else
         {
            checkEnter_btn.setEnabled(false);
         }
      };
   };
}
function initPage_Invite()
{
   comboMc = container_mc.comboBox;
   container_mc.onEnterFrame = function()
   {
      delete container_mc.onEnterFrame;
      var _loc1_ = container_mc.btn0.txtBtn;
      _loc1_.setRelease(ToGame_CommunityWindowPopUp_InviteEnter);
      btnArray = [_loc1_];
   };
}
var UI = this;
UI._visible = false;
var bWidgetOpen = false;
var UIname = "CommunityWindowPopUp";
container_mc.UIDrager.setData(UIName,UI);
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
var x_btn = new lib.util.TxtBtn(container_mc.x_mc);
x_btn.setRelease(ToGame_CommunityWindowPopUp_CloseUI);
var Bg_H = [266,292,376];
var popUpMode = 0;
var btnArray = [];
var COUNT_STR = lib.util.UIString.getUIString("$111092");
var DEFAULT_STR0 = lib.util.UIString.getUIString("$111066");
var DEFAULT_STR1 = lib.util.UIString.getUIString("$111095");
var TIP_STR = lib.util.UIString.getUIString("$111093");
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
myListener.OnGame_CommunityWindowPopUp_SetMode = function(index)
{
   container_mc.gotoAndStop(Number(index) + 1);
   hit._height = Bg_H[index];
   popUpMode = index;
   btnArray = [];
   if(index == 0)
   {
      initPage_Request();
   }
   else if(index == 1)
   {
      initPage_Input();
   }
   else
   {
      initPage_Invite();
   }
   container_mc._visible = true;
};
myListener.OnGame_CommunityWindowPopUp_SetName = function(str)
{
   container_mc.inputTxt0.textColor = lib.info.TextColor.INPUT_ACTIVE;
   container_mc.inputTxt0.text = str;
   request_btn.setEnabled(true);
};
myListener.OnGame_CommunityWindowPopUp_SetMemo = function(str)
{
   container_mc.inputTxt1.textColor = lib.info.TextColor.INPUT_ACTIVE;
   container_mc.inputTxt1.text = str;
};
myListener.OnGame_CommunityWindowPopUp_SetTitle = function(str)
{
   container_mc.titleTxt.htmlText = str;
};
myListener.OnGame_CommunityWindowPopUp_CheckText = function(str)
{
   container_mc.tip.htmlText = str;
   if(str == "" || str == undefined)
   {
      container_mc.tipMc._visible = false;
   }
   else
   {
      container_mc.tipMc._visible = true;
   }
};
myListener.OnGame_CommunityWindowPopUp_buttonEnable = function(index, type)
{
   var _loc1_ = btnArray[Number(index)];
   if(_loc1_)
   {
      _loc1_.setEnabled(Boolean(Number(type)));
   }
};
var codeData = "";
myListener.OnGame_CommunityWindowPopUp_InviteCode = function(str, current, max)
{
   var _loc1_ = COUNT_STR;
   _loc1_ = _loc1_ + ("<font color=\'#80e71c\'>" + current + "</font>/" + max);
   container_mc.codeTxt.text = str;
   container_mc.codeTxt1.htmlText = _loc1_;
};
var comboListner = {};
myListener.OnGame_CommunityWindowPopUp_ComboBox = function(arr, mainStr)
{
   var _loc4_ = "";
   var dataArr = [];
   if(popUpMode == 1)
   {
      if(mainStr)
      {
         _loc4_ = [mainStr];
      }
      else
      {
         _loc4_ = [lib.util.UIString.getUIString("$111109")];
      }
      _loc4_ = _loc4_ + ("\t" + arr);
      dataArr = lib.util.ExtString.split(_loc4_,"\t");
   }
   else if(popUpMode == 2)
   {
      _loc4_ = [lib.util.UIString.getUIString("$111107")];
      if(arr == undefined || arr == "")
      {
         dataArr[0] = _loc4_;
         dataArr[1] = lib.util.UIString.getUIString("$111106");
      }
      else
      {
         _loc4_ = _loc4_ + ("\t" + arr);
         dataArr = lib.util.ExtString.split(_loc4_,"\t");
      }
   }
   comboMc.onEnterFrame = function()
   {
      delete this.onEnterFrame;
      this.data = dataArr;
      this.selectedIndex = 0;
      this.addListener(comboListner);
      var _loc4_ = comboMc.containerMc;
      var _loc5_ = comboMc.length;
      var _loc3_ = 0;
      while(_loc3_ < _loc5_)
      {
         var _loc2_ = _loc4_["line" + _loc3_];
         if(popUpMode == 2)
         {
            delete register2.onPress;
            delete register2.onRollOut;
            delete register2.onRollOver;
            delete register2.onRelease;
            delete register2.onRollOut;
            delete register2.onReleaseOutside;
         }
         _loc2_._y = _loc2_._y - 24;
         _loc3_ = _loc3_ + 1;
      }
   };
};
var request_btn;
var comboMc = null;
var comboIndex = 0;
comboListner.onChanged = function(mc, id, index)
{
   if(popUpMode == 1)
   {
      comboIndex = index;
      if(container_mc.inputTxt0.text != "" && comboIndex != 0)
      {
         checkEnter_btn.setEnabled(true);
      }
      else
      {
         checkEnter_btn.setEnabled(false);
      }
   }
   ToGame_CommunityWindowPopUp_ComboBox(index);
};
container_mc._visible = false;
ToGame_CommunityWindowPopUp_Init();
