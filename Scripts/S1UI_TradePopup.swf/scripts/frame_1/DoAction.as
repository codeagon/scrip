var UI = this;
UI._visible = false;
var UIname = "TradePopup";
this.bWindowOpen = true;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
container_mc.UIDrager.setData(UIname,container_mc);
var b_RecieveState = true;
var m_SteperTop = container_mc.numberSteper;
var m_SteperLeft = container_mc.GoldCurrencyInput;
var m_SteperRight = container_mc.TcatInput;
m_SteperRight.inputFd.pasteFromClipboard = pasteFromClipboard;
var s_PrevNum0 = "";
var s_PrevNum1 = "";
var s_PrevNum2 = "";
var HOPE_PRICE = lib.util.UIString.getUIString("$196005");
var x_btn = new lib.util.TxtBtn(container_mc.close_mc);
x_btn.setRelease(ToGame_TradePopup_CloseUI);
var gold_btn = new lib.util.TxtBtn(container_mc.btn_0.btn,container_mc.btn_0.txt);
gold_btn.setTextColor("0xA38F8F","0xFFFFFF","0xFFFFFF","0x485460");
gold_btn.btn.onRelease2 = btnRelease;
gold_btn.btn.onRollOver2 = btnRollOver;
gold_btn.btn.onRollOut2 = btnRollOut;
gold_btn.btn.onReleaseOutSide2 = btnReleaseOutSide;
var TCATTYPE = lib.gamedata.DefaultData.getDefaultUIData("TcatEnable").param1;
container_mc.tIcon.htmlText = lib.util.GoldCurrency.SetTCatText("",TCATTYPE);
function ToGame_TradePopup_Init()
{
   fscommand("ToGame_TradePopup_Init");
}
function ToGame_TradePopup_confirm()
{
   var _loc3_ = lib.util.ExtString.trimChar(m_SteperTop.text);
   var _loc2_ = lib.util.ExtString.trimChar(m_SteperLeft.total_nums);
   var _loc1_ = lib.util.ExtString.trimChar(m_SteperRight.text);
   getURL("FSCommand:ToGame_TradePopup_InputEvent","0\t" + _loc3_);
   if(container_mc.btn_0.btn.check.checked)
   {
      getURL("FSCommand:ToGame_TradePopup_InputEvent","1\t" + _loc2_);
   }
   if(container_mc.btn_1.btn.check.checked)
   {
      getURL("FSCommand:ToGame_TradePopup_InputEvent","2\t" + _loc1_);
   }
   getUrl("FSCommand:ToGame_TradePopup_InputEvent", "3\t1");
   fscommand("ToGame_TradePopup_confirm");
}
function ToGame_TradePopup_CloseUI()
{
   lib.manager.PopupManager.remove("tradePopup");
   fscommand("ToGame_TradePopup_CloseUI");
}
function SettotalNum()
{
   var _loc1_ = 0;
   var _loc3_ = 0;
   var _loc2_ = 0;
   if(m_SteperTop.text)
   {
      _loc1_ = lib.util.ExtString.trimChar(m_SteperTop.text);
   }
   if(m_SteperLeft.total_nums)
   {
      _loc3_ = lib.util.ExtString.trimChar(m_SteperLeft.total_nums);
   }
   if(m_SteperRight.text)
   {
      _loc2_ = lib.util.ExtString.trimChar(m_SteperRight.text);
   }
   container_mc.total_txt0.htmlText = HOPE_PRICE + "    " + lib.util.GoldCurrency.SetGoldText(_loc3_ * _loc1_,TCATTYPE);
   container_mc.total_txt1.htmlText = HOPE_PRICE + "    " + lib.util.GoldCurrency.SetTCatText(_loc2_ * _loc1_,TCATTYPE);
}
function SetInputFocus(_type, _enable)
{
   Selection.setFocus(null);
   if(_type == 0)
   {
      m_SteperLeft._txt0.type = _enable;
      m_SteperLeft._txt1.type = _enable;
      m_SteperLeft._txt2.type = _enable;
      if(_enable == "input")
      {
         m_SteperLeft._txt0.selectable = true;
         m_SteperLeft._txt1.selectable = true;
         m_SteperLeft._txt2.selectable = true;
         Selection.setFocus(m_SteperLeft._txt0);
      }
      else
      {
         m_SteperLeft._txt0.selectable = false;
         m_SteperLeft._txt1.selectable = false;
         m_SteperLeft._txt2.selectable = false;
      }
   }
   else
   {
      m_SteperRight.ext_textField.textField.type = _enable;
      if(_enable == "input")
      {
         m_SteperRight.ext_textField.textField.selectable = true;
         Selection.setFocus(m_SteperRight.ext_textField.textField);
      }
      else
      {
         m_SteperRight.ext_textField.textField.selectable = false;
      }
   }
}
function SetButtonEnabled()
{
   var _loc3_ = !(m_SteperTop.inputFd.text == "" || m_SteperTop.inputFd.text == undefined || m_SteperTop.text < m_SteperTop.ext_textField.min);
   var _loc1_ = m_SteperLeft.total_nums >= m_SteperLeft._min;
   var _loc2_ = !(m_SteperRight.inputFd.text == "" || m_SteperRight.inputFd.text == undefined || m_SteperRight.text < m_SteperRight.ext_textField.min);
   enter_btn.setEnabled(false);
   if(_loc3_)
   {
      if(container_mc.btn_0.btn.check.checked == true && _loc1_)
      {
         enter_btn.setEnabled(true);
         if(container_mc.btn_1.btn.check.checked == true && _loc2_ == false)
         {
            enter_btn.setEnabled(false);
         }
      }
      else if(container_mc.btn_1.btn.check.checked == true && _loc2_)
      {
         enter_btn.setEnabled(true);
         if(container_mc.btn_0.btn.check.checked == true && _loc1_ == false)
         {
            enter_btn.setEnabled(false);
         }
      }
   }
}
function checkBoxChanged(_changed)
{
   var _loc2_ = this;
   if(_changed == true)
   {
      container_mc["enable_" + _loc2_.Type]._visible = false;
      SetInputFocus(_loc2_.Type,"input");
   }
   else if(_changed == false)
   {
      container_mc["enable_" + _loc2_.Type]._visible = true;
      SetInputFocus(_loc2_.Type,"dynamic");
   }
   setGuideVisible();
   SetButtonEnabled();
}
function setGuideVisible()
{
   var _loc2_ = false;
   if(container_mc.btn_0.btn.check.checked == true && container_mc.btn_1.btn.check.checked == true)
   {
      _loc2_ = true;
   }
   var _loc1_ = container_mc.guide_mc;
   if(_loc2_)
   {
      container_mc.bg._height = 407 + _loc1_._height;
      container_mc.enterBtn._y = 361 + _loc1_._height;
      container_mc.cancelBtn._y = 361 + _loc1_._height;
   }
   else
   {
      container_mc.bg._height = 407;
      container_mc.enterBtn._y = 361;
      container_mc.cancelBtn._y = 361;
   }
   _loc1_._visible = _loc2_;
}
function btnRelease()
{
   var _loc2_ = this.check;
   _loc2_.onRelease();
}
function btnRollOver()
{
   var _loc2_ = this.check;
   _loc2_.onRollOver();
}
function btnRollOut()
{
   var _loc2_ = this.check;
   _loc2_.onRollOut();
}
function btnReleaseOutSide()
{
   var _loc2_ = this.check;
   _loc2_.onReleaseOutside();
}
function pasteFromClipboard(richClipboard, startIndex, endIndex)
{
}
if(TCATTYPE == "0")
{
   container_mc.btn_1._visible = false;
   container_mc.total_txt1._visible = false;
   container_mc.minTxt_1._visible = false;
   container_mc.averageTxt_1._visible = false;
   container_mc.tactTxt0._visible = false;
   container_mc.tactTxt1._visible = false;
   container_mc.tactTxt2._visible = false;
   container_mc.TcatInput._visible = false;
   container_mc.tIcon._visible = false;
}
else
{
   var TCat_btn = new lib.util.TxtBtn(container_mc.btn_1.btn,container_mc.btn_1.txt);
   TCat_btn.setTextColor("0x7A92AD","0xFFFFFF","0xFFFFFF","0x485460");
   TCat_btn.btn.onRelease2 = btnRelease;
   TCat_btn.btn.onRollOver2 = btnRollOver;
   TCat_btn.btn.onRollOut2 = btnRollOut;
   TCat_btn.btn.onReleaseOutSide2 = btnReleaseOutSide;
}
var enter_btn = container_mc.enterBtn.txtBtn;
enter_btn.setRelease(ToGame_TradePopup_confirm);
var cancel_btn = container_mc.cancelBtn.txtBtn;
cancel_btn.setRelease(ToGame_TradePopup_CloseUI);
enter_btn.setEnabled(false);
container_mc.guide_mc._visible = false;
m_SteperRight.right_mc._visible = false;
m_SteperRight.left_mc._visible = false;
m_SteperRight.bgMc._width = 215;
m_SteperRight.inputFd._width = 210;
m_SteperRight.inputFd_focus._width = 221;
var guideMessage = lib.util.UIString.getUIString("$196012");
container_mc.guide_mc.txt.htmlText = guideMessage;
var guideH = container_mc.guide_mc.txt.textHeight + 5;
container_mc.guide_mc.txt._height = guideH;
container_mc.guide_mc.bg._height = container_mc.guide_mc.txt._height + 8;
m_SteperTop.inputFd.pasteFromClipboard = pasteFromClipboard;
m_SteperRight.inputFd.pasteFromClipboard = pasteFromClipboard;
m_SteperLeft._txt0.pasteFromClipboard = pasteFromClipboard;
m_SteperLeft._txt1.pasteFromClipboard = pasteFromClipboard;
m_SteperLeft._txt2.pasteFromClipboard = pasteFromClipboard;
var UI_WIDTH = 743;
var UI_HEIGHT = 407;
myListener.OnGameEventShowWindow = function(WindowName, bShow)
{
   if(WindowName.toLowerCase() == UIname.toLowerCase())
   {
      bWidgetOpen = bShow;
      if(_global.gbUIMode && bWidgetOpen)
      {
         UI._visible = true;
         lib.manager.PopupManager.add("tradePopup",5,UI);
      }
      else
      {
         UI._visible = false;
         lib.manager.PopupManager.remove("tradePopup");
      }
   }
};
myListener.OnGameEventChangeUIMode = function(bShow)
{
   if(_global.gbUIMode && bWidgetOpen)
   {
      UI._visible = true;
      lib.manager.PopupManager.add("tradePopup",5,UI);
   }
   else
   {
      UI._visible = false;
      lib.manager.PopupManager.remove("tradePopup");
   }
};
myListener.OnGame_TradePopup_SetItemData = function(_item, _steper)
{
   var _loc2_ = lib.util.ExtString.split(_item,"\t");
   var _loc1_ = container_mc.item_mc;
   var _loc5_ = Boolean(Number(_loc2_[3]));
   _loc1_.index = _loc2_[0];
   lib.display.DrawBitmapData.draw(_loc1_.Icon,_loc2_[1],0,0,0,0,50,50,0.78);
   _loc1_.display = true;
   _loc1_.disable = _loc5_;
   _loc1_.grade = _loc2_[4];
   _loc1_.sealType = _loc2_[5];
   _loc1_.masterpiece = _loc2_[6];
   var _loc3_ = Number(_loc2_[7]);
   var _loc8_ = _loc1_.enchantFd;
   if(isNaN(_loc3_) == false && _loc3_ != -1 && _loc3_ != 0)
   {
      var _loc9_ = _loc5_ <= 0?21433:3615811;
      if(_loc3_ > 11 && _loc3_ < 15)
      {
         _loc9_ = _loc5_ <= 0?8915599:2299429;
      }
      else if(_loc3_ > 14)
      {
         _loc9_ = _loc5_ <= 0?10624002:4074792;
      }
      _loc8_.shadowColor = _loc9_;
      _loc8_.textColor = _loc5_ <= 0?14145495:7368816;
      _loc8_.text = "+" + _loc3_;
   }
   lib.manager.ToolTip.add(_loc1_.SLOT,"0",6,_loc1_.Icon);
   container_mc.item_txt.setText(_loc2_[2]);
   container_mc.item_txt.textColor = lib.info.TextColor["RAREGRADE" + _loc1_.grade];
   var _loc4_ = lib.util.ExtString.split(_steper,"\t");
   m_SteperTop.inputFd.type = "input";
   s_PrevNum0 = _loc4_[0];
   var _loc10_ = Number(_loc4_[0]);
   var _loc6_ = Number(_loc4_[1]);
   var _loc7_ = Number(_loc4_[2]);
   if(_loc6_ != undefined && _loc6_ != null)
   {
      m_SteperTop.min = _loc6_;
      if(_loc10_ == _loc6_)
      {
         m_SteperTop.left_mc.gotoAndStop(4);
         m_SteperTop.left_mc.enabled = false;
         m_SteperTop.min_mc.gotoAndStop(4);
         m_SteperTop.min_mc.enabled = false;
      }
      else
      {
         m_SteperTop.left_mc.gotoAndStop(1);
         m_SteperTop.left_mc.enabled = true;
         m_SteperTop.min_mc.gotoAndStop(1);
         m_SteperTop.min_mc.enabled = true;
      }
   }
   if(_loc7_ != undefined && _loc7_ != null)
   {
      m_SteperTop.max = _loc7_;
      if(_loc10_ == _loc7_)
      {
         m_SteperTop.right_mc.gotoAndStop(4);
         m_SteperTop.right_mc.enabled = false;
         m_SteperTop.max_mc.gotoAndStop(4);
         m_SteperTop.max_mc.enabled = false;
      }
      else
      {
         m_SteperTop.right_mc.gotoAndStop(1);
         m_SteperTop.right_mc.enabled = true;
         m_SteperTop.max_mc.gotoAndStop(1);
         m_SteperTop.max_mc.enabled = true;
      }
   }
   m_SteperTop.text = _loc4_[0];
};
myListener.OnGame_TradePopup_SetInputData = function(_type, _check, _steper)
{
   var _loc6_ = container_mc["btn_" + _type];
   var _loc3_ = _loc6_.btn.check;
   _loc3_.Type = _type;
   container_mc["enable_" + _type]._visible = Boolean((Number(_check) + 1) % 2);
   _loc3_.checked = Boolean(Number(_check));
   _loc3_.onChanged = checkBoxChanged;
   _loc3_.onChecked = checkBoxChanged;
   var _loc1_ = lib.util.ExtString.split(_steper,"\t");
   var _loc5_ = "";
   var _loc4_ = "";
   if(_type == 0)
   {
      s_PrevNum1 = _loc1_[2];
      m_SteperLeft;
      _loc5_ = lib.util.GoldCurrency.SetGoldText(_loc1_[0]);
      _loc4_ = lib.util.GoldCurrency.SetGoldText(_loc1_[1]);
      m_SteperLeft._func = function()
      {
         if(s_PrevNum1 == m_SteperLeft.total_nums)
         {
            return undefined;
         }
         s_PrevNum1 = _targetInput.total_nums;
         SetButtonEnabled();
         SettotalNum();
      };
      m_SteperLeft.min = _loc1_[3];
      m_SteperLeft.max = _loc1_[4];
      m_SteperLeft.total = _loc1_[2];
   }
   else
   {
      s_PrevNum2 = _loc1_[2];
      _loc5_ = lib.util.GoldCurrency.SetTCatText(_loc1_[0],TCATTYPE);
      _loc4_ = lib.util.GoldCurrency.SetTCatText(_loc1_[1],TCATTYPE);
      m_SteperRight.min = _loc1_[3];
      m_SteperRight.max = _loc1_[4];
      m_SteperRight.text = _loc1_[2];
   }
   if(_loc3_.checked)
   {
      SetInputFocus(_type,"input");
   }
   else
   {
      SetInputFocus(_type,"dynamic");
   }
   if(Number(_loc1_[0]) == 0)
   {
      container_mc["minTxt_" + _type].verticalAlign = "center";
      container_mc["minTxt_" + _type].textColor = 13421772;
      container_mc["minTxt_" + _type].text = "$196008";
   }
   else
   {
      container_mc["minTxt_" + _type].htmlText = _loc5_;
   }
   if(Number(_loc1_[1]) == 0)
   {
      container_mc["minTxt_" + _type].verticalAlign = "center";
      container_mc["averageTxt_" + _type].textColor = 13421772;
      container_mc["averageTxt_" + _type].text = "$196013";
   }
   else
   {
      container_mc["averageTxt_" + _type].htmlText = _loc4_;
   }
   SetButtonEnabled();
   SettotalNum();
   setGuideVisible();
   Selection.setFocus(null);
   Selection.setFocus(m_SteperTop.ext_textField.textField);
};
myListener.OnGame_TradePopup_SetInputState = function(_type, _state)
{
   if(_state)
   {
      SetInputFocus(_type,"input");
   }
   else
   {
      SetInputFocus(_type,"dynamic");
   }
};
m_SteperTop.onChanged = function()
{
   if(s_PrevNum0 == m_SteperTop.text)
   {
      return undefined;
   }
   s_PrevNum0 = m_SteperTop.text;
   SettotalNum();
   SetButtonEnabled();
};
m_SteperRight.onChanged = function()
{
   if(s_PrevNum2 == m_SteperRight.text)
   {
      return undefined;
   }
   s_PrevNum2 = m_SteperRight.text;
   SettotalNum();
   SetButtonEnabled();
};
m_SteperTop.ext_textField.onEnterKey = function()
{
   if(container_mc.btn_0.btn.check.checked)
   {
      SetInputFocus(0,"input");
   }
   else if(container_mc.btn_1.btn.check.checked)
   {
      SetInputFocus(1,"input");
   }
};
m_SteperLeft._txt2_txt.onEnterKey = function()
{
   if(container_mc.btn_1.btn.check.checked)
   {
      SetInputFocus(1,"input");
   }
   else
   {
      Selection.setFocus(null);
      ToGame_TradePopup_confirm();
   }
};
m_SteperRight.ext_textField.onEnterKey = function()
{
   Selection.setFocus(null);
   ToGame_TradePopup_confirm();
};
lib.manager.Focus.addFocusGroup(UIname,1,[m_SteperTop.ext_textField.textField,m_SteperLeft._txt0_txt,m_SteperLeft._txt1_txt,m_SteperLeft._txt2_txt,m_SteperRight.ext_textField.textField]);
SetInputFocus(0,"dynamic");
SetInputFocus(1,"dynamic");
ToGame_TradePopup_Init();
