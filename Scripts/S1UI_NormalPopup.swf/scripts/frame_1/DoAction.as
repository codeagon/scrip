function removeSameDepthPopup(type)
{
   if(type != 0 && type != 1)
   {
      var _loc2_ = 2;
      while(_loc2_ < 8)
      {
         var _loc4_ = lib.manager.PopupManager.getArray(_loc2_,1);
         if(_loc4_ != null)
         {
            var _loc3_ = UI["type" + prevPopUpType + "_btn0"].id;
            _root.debug3.text = "[팝업] 닫아야하는 팝업의 닫기이벤트 id = UI[\'type\'+prevPopUpType+\'_btn0\'].id: " + _loc3_ + "\r" + _root.debug3.text;
            released(prevPopUpID,_loc3_);
            myListener.OnGame_Popup_Remove(prevPopUpID);
            _root.debug3.text = "[팝업] 이미 떠있는 팝업이 밀려서 제거해야됨을 알림 = popupID: " + prevPopUpID + "\r" + _root.debug3.text;
         }
         _loc2_ = _loc2_ + 1;
      }
   }
}
function clearData(mc, type)
{
   mc.title_txt.text = "";
   mc.message_txt.htmlText = "";
   mc.count_txt.text = "";
   mc.inputFd.text = "";
   if(type != 2)
   {
      if(type != 3)
      {
         if(type == 4)
         {
            mc.item.clear();
         }
         else if(type == 5)
         {
            mc.inputFd0.text = "";
            mc.inputFd1.text = "";
            mc.item.clear();
         }
         else if(type == 6)
         {
            mc.combobox.clear();
         }
      }
   }
}
function setPosition(target)
{
   target._x = lib.info.AlignInfo.zeroPointX + lib.info.AlignInfo.onePercentPixelW * 50;
   target._y = lib.info.AlignInfo.zeroPointY + lib.info.AlignInfo.onePercentPixelH * 45;
   target._x = target._x - lib.manager.UISkin.NORMALPOPUP_WIDTH / 2 * lib.info.AlignInfo.scaleRatio;
   target._y = target._y - lib.manager.UISkin.NORMALPOPUP_HEIGHT / 2 * lib.info.AlignInfo.scaleRatio;
}
function ToGame_Popup_Event(popupId, id)
{
   delete UI.onKeyDown;
   switch(popUpType)
   {
      case 0:
         getURL("FSCommand:ToGame_Popup_Event",popupId + "\t" + id);
         break;
      case 1:
         getURL("FSCommand:ToGame_Popup_Event",popupId + "\t" + id);
         break;
      case 2:
         getURL("FSCommand:ToGame_Popup_Event",popupId + "\t" + id);
         break;
      case 3:
         var _loc4_ = lib.util.ExtString.trim(type3_textField.__get__text());
         getURL("FSCommand:ToGame_Popup_Event",popupId + "\t" + id + "\t" + _loc4_);
         break;
      case 4:
         if(popupType4.numberSteper._visible == true)
         {
            _loc4_ = lib.util.ExtString.trimChar(popupType4.numberSteper.ext_textField.text);
         }
         else
         {
            _loc4_ = popupType4.GoldCurrencyInput.total_nums;
         }
         getURL("FSCommand:ToGame_Popup_Event",popupId + "\t" + id + "\t" + _loc4_);
         break;
      case 5:
         _loc4_ = Number(lib.util.ExtString.trimChar(popupType5.numberSteper.ext_textField.text)) + "\t" + Number(popupType5.GoldCurrencyInput.total_nums);
         getURL("FSCommand:ToGame_Popup_Event",popupId + "\t" + id + "\t" + _loc4_);
         break;
      case 6:
         _loc4_ = popupType6.combobox.selected;
         getURL("FSCommand:ToGame_Popup_Event",popupId + "\t" + id + "\t" + _loc4_);
         break;
      case 7:
         _loc4_ = popupType6.combobox.selected;
         getURL("FSCommand:ToGame_Popup_Event",popupId + "\t" + id);
         lib.Debuger.trace("ToGame_Popup_Event: " + popupId + "\t" + id);
   }
   _root.debug3.text = "[팝업] 팝업버튼 이벤트 발생 = popUpID: " + popupId + ", 이벤트id: " + id + "\r" + _root.debug3.text;
}
function ToGame_Popup_Remove(id)
{
   getURL("FSCommand:ToGame_Popup_Remove",id);
}
function ToGame_Popup_InputEvent(id, inputIndex, _value, fd)
{
   test_txt9.text = "ToGame_Popup_InputEvent : " + _value;
   if(inputing)
   {
      inputing = false;
      return undefined;
   }
   if(_value != "" && _value != undefined)
   {
      var _loc2_ = lib.util.ExtString.trimChar(_value);
      inputing = true;
      fd.type = "dynamic";
      getURL("FSCommand:ToGame_Popup_InputEvent",id + "\t" + inputIndex + "\t" + _loc2_);
      test_txt10.text = "ToGame_Popup_InputEvent2 : " + inputIndex + "_" + _loc2_;
   }
   if(inputing == true)
   {
      inputing = false;
   }
}
function released(popupId, id)
{
   ToGame_Popup_Event(popupId,id);
}
function closeUI()
{
   ToGame_AgitSellConfirm_CloseUI();
}
function btnAlign(tg)
{
   if(tg.txtBtn1.btn && !tg.txtBtn1.btn._visible)
   {
      tg.txtBtn0._x = 153;
   }
   else if(tg.txtBtn1.btn)
   {
      tg.txtBtn0._x = 238;
   }
   if(tg.txtBtn0.btn && !tg.txtBtn0.btn._visible)
   {
      tg.txtBtn1._x = 153;
   }
   else if(tg.txtBtn0.btn)
   {
      tg.txtBtn1._x = 85;
   }
}
var UI = this;
UI._visible = true;
var UIname = "NormalPopup";
var popup_array = ["다른파일에","다른파일에","popupType2","popupType3","popupType4","popupType5","popupType6","popupType7"];
var i = 0;
while(i < popup_array.length)
{
   var popup = UI[popup_array[i]];
   popup._visible = false;
   popup.message_txt.verticalAlign = "center";
   popup.UIDrager.setData(popup._name,popup);
   if(i == 7)
   {
      lib.manager.UISkin.drawBg("retry",popup.bg);
   }
   else
   {
      lib.manager.UISkin.drawBg("popup",popup.bg);
   }
   popup.lock_mc._x = lib.manager.UISkin.NORMALLOCKBTNBYBG_X;
   popup.lock_mc._y = lib.manager.UISkin.LOCKBTNBYBG_Y;
   popup.x_mc._x = lib.manager.UISkin.NORMALXBTNBYBG_X;
   popup.x_mc._y = lib.manager.UISkin.XBTNBYBG_Y;
   if(i == 2)
   {
      popup.message_txt.textColor = lib.info.TextColor.GENERAL_CONTENTS;
      popup.count_txt.textColor = lib.info.TextColor.GENERAL_CONTENTS;
   }
   if(i == 3)
   {
      popup.message_txt.textColor = lib.info.TextColor.GENERAL_EXPLAIN_DETAIL;
   }
   if(i == 4)
   {
      popup.bg._height = 532;
      popup.message_txt.textColor = lib.info.TextColor.GENERAL_EXPLAIN_DETAIL;
      popup.txtLabel2.textColor = lib.info.TextColor.GENERAL_EXPLAIN_DETAIL;
   }
   else if(i == 5)
   {
      popup.bg._height = 564;
      popup.message_txt.textColor = lib.info.TextColor.GENERAL_EXPLAIN_DETAIL;
      popup.NumCheck1_txt.textColor = lib.info.TextColor.GENERAL_EXPLAIN_DETAIL;
      popup.NumCheck2_txt.textColor = lib.info.TextColor.GENERAL_EXPLAIN_DETAIL;
   }
   else if(i == 6)
   {
      popup.message_txt.textColor = lib.info.TextColor.GENERAL_EXPLAIN_DETAIL;
   }
   else if(i == 7)
   {
      popup.bg._height = 512;
      popup.bg._height = 512;
      popup.message_txt.textColor = lib.info.TextColor.GENERAL_CONTENTS;
   }
   i++;
}
popupType6.combobox.useBaseTextColor = false;
var totalPriceStr = lib.util.UIString.getUIString("$191004");
var eachPriceStr = lib.util.UIString.getUIString("$191005");
var popUpID;
var prevPopUpID;
var popUpType;
var prevPopUpType;
var recieveState = false;
var itmeSlot4TX = popupType4.item._x;
var itmeSlot5TX = popupType5.item._x;
var inputing = false;
lib.manager.Focus.addFocusGroup(UIname,1,[popupType2.txtBtn1.btn,popupType2.txtBtn0.btn]);
lib.manager.Focus.addFocusGroup(UIname,2,[popupType6.txtBtn1.btn,popupType6.txtBtn0.btn]);
lib.manager.Focus.addFocusGroup(UIname,3,[popupType4.GoldCurrencyInput._txt0,popupType4.GoldCurrencyInput._txt1,popupType4.GoldCurrencyInput._txt2]);
lib.manager.Focus.addFocusGroup(UIname,4,[popupType5.numberSteper.ext_textField.textField,popupType5.GoldCurrencyInput._txt0,popupType5.GoldCurrencyInput._txt1,popupType5.GoldCurrencyInput._txt2]);
bWidgetOpen = true;
var myListener = new Object();
myListener.OnGameEventShowWindow = function(WindowName, bShow)
{
   if(WindowName.toLowerCase() == UIname.toLowerCase())
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
var counterMake = UI.createEmptyMovieClip("counter",UI.getNextHighestDepth());
myListener.OnGame_Popup_Create = function(type, argu1, argu2, argu3, argu4, argu5, argu6, argu7, argu8, argu9, argu10, argu11, argu12, argu13, argu14, argu15, argu16, argu17, argu18, argu19, argu20, argu21, argu22)
{
   recieveState = false;
   if(type >= 2)
   {
      popupType3.inputFd.text = "";
      popupType5.inputFd1.text = "";
      prevPopUpType = popUpType;
      popUpType = type = Number(type);
      type = Number(type);
      var popup = UI[popup_array[type]];
      var _loc7_ = UI["type" + type + "_btn0"];
      var btn1 = UI["type" + type + "_btn1"];
      var _loc16_ = UI["type" + type + "_x"];
      prevPopUpID = popUpID;
      popUpID = argu1;
      if(lib.manager.PopupManager.getPopup(argu1) != null)
      {
         myListener.OnGame_Popup_Update(argu1,argu2,argu3,argu4,argu5,argu6,argu7,argu8,argu9,argu10,argu11,argu12,argu13,argu14,argu15,argu16,argu17,argu18,argu19,argu20,argu21);
      }
      else
      {
         removeSameDepthPopup(type);
         setPosition(popup);
         var _loc5_ = 0;
         while(_loc5_ < popup_array.length)
         {
            UI[popup_array[_loc5_]]._visible = false;
            _loc5_ = _loc5_ + 1;
         }
         popup._visible = true;
         popup.message_txt.verticalAlign = "center";
         popup.title_txt.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
         if(argu2 != undefined && argu2 != null)
         {
            popup.title_txt.html = true;
            popup.title_txt.htmlText = argu2;
         }
         if(argu3 != undefined && argu3 != null)
         {
            popup.message_txt.htmlText = argu3;
         }
         if(type == 2)
         {
            var _loc41_ = 0;
            if(popup.message_txt.textHeight > 85)
            {
               _loc41_ = popup.message_txt.textHeight - 85;
            }
            popup.message_txt._height = 90 + _loc41_;
            popup.count_txt._y = 152.5 + _loc41_;
            popup.bg._height = 512 + _loc41_;
            popup.txtBtn1._y = 186 + _loc41_;
            popup.txtBtn0._y = 186 + _loc41_;
            if(Number(argu5) != 1)
            {
               _loc16_.setVisible(false);
            }
            else
            {
               _loc16_.setVisible(true);
               _loc16_.id = argu6;
            }
            if(argu4 != undefined && argu4 != null && argu4 != "" && argu4 != Number(0))
            {
               delete counter.onEnterFrame;
               counter.totalTime = Number(argu4) * 1000;
               counter.startedTime = getTimer();
               counter.aimTime = counter.startedTime + counter.totalTime;
               counter.onEnterFrame = function()
               {
                  var _loc2_ = getTimer();
                  popup.count_txt.htmlText = lib.util.UIString.getUIString("$191003","secondColor",lib.info.TextColor.GENERAL_EMPHASIS.toString(16),"EndSec",Math.ceil((counter.aimTime - _loc2_) / 1000));
                  if(counter.aimTime <= _loc2_)
                  {
                     popup.count_txt.htmlText = lib.util.UIString.getUIString("$191003","secondColor",lib.info.TextColor.GENERAL_EMPHASIS.toString(16),"EndSec",0);
                     delete this.onEnterFrame;
                  }
               };
            }
            else
            {
               delete counter.onEnterFrame;
               popup.count_txt.text = "";
            }
            if(argu8 != undefined && argu8 != null && argu8 != "")
            {
               _loc7_.setVisible(true);
               _loc7_.id = argu7;
               _loc7_.setText(argu8);
            }
            else
            {
               _loc7_.setVisible(false);
            }
            if(argu10 != undefined && argu10 != null && argu10 != "")
            {
               btn1.setVisible(true);
               btn1.id = argu9;
               btn1.setText(argu10);
            }
            else
            {
               btn1.setVisible(false);
            }
            if(_loc7_.btn._visible && btn1.btn._visible)
            {
               popupType2.firstFocus = popupType2.txtBtn1.btn;
               Selection.setFocus(popupType2.txtBtn1.btn);
            }
            else if(!_loc7_.btn._visible && btn1.btn._visible)
            {
               popupType2.firstFocus = popupType2.txtBtn1.btn;
               Selection.setFocus(popupType2.txtBtn1.btn);
            }
            else if(_loc7_.btn._visible && !btn1.btn._visible)
            {
               popupType2.firstFocus = popupType2.txtBtn0.btn;
               Selection.setFocus(popupType2.txtBtn0.btn);
            }
         }
         else if(type == 3)
         {
            var strnum = 0;
            var strdata = "";
            var strlimit = argu5;
            if(Number(argu7) != 1)
            {
               _loc16_.setVisible(false);
            }
            else
            {
               _loc16_.setVisible(true);
               _loc16_.id = argu8;
            }
            if(argu10 != undefined && argu10 != null && argu10 != "")
            {
               _loc7_.setVisible(true);
               _loc7_.id = argu9;
               _loc7_.setText(argu10);
            }
            else
            {
               _loc7_.setVisible(false);
            }
            if(argu12 != undefined && argu12 != null && argu12 != "")
            {
               btn1.setVisible(true);
               btn1.id = argu11;
               btn1.setText(argu12);
            }
            else
            {
               btn1.setVisible(false);
            }
            if(!(argu5 != undefined && argu5 != null && argu5 != "" && argu5 != "null"))
            {
               type3_textField.__set__maxschar(0);
            }
            if(typebool != Number(1))
            {
               type3_textField.__set__maxschar(Number(argu5));
            }
            popupType3.inputFd.text = argu6;
            var _loc19_ = 0;
            if(popup.message_txt.textHeight > 45)
            {
               _loc19_ = popup.message_txt.textHeight - 45;
            }
            popup.message_txt._height = 50 + _loc19_;
            popupType3.categoryLine._y = 122 + _loc19_;
            if(argu13 != undefined && argu13 != "")
            {
               popupType3.inputFd._y = 167 + _loc19_;
               popupType3.inputFd_focus._y = 160 + _loc19_;
               popupType3.inputFd_bg._y = 163 + _loc19_;
               popupType3.txtBtn0._y = 206 + _loc19_;
               popupType3.txtBtn1._y = 206 + _loc19_;
               popupType3.categoryLine._visible = true;
               popupType3.bg._height = 532 + _loc19_;
               popupType3.titleFd._y = 137 + _loc19_;
               popupType3.titleFd.text = argu13;
               popupType3.titleFd.textColor = lib.info.TextColor.GENERAL_EXPLAIN_DETAIL;
            }
            else
            {
               popupType3.inputFd._y = 127 + _loc19_;
               popupType3.inputFd_focus._y = 120 + _loc19_;
               popupType3.inputFd_bg._y = 123 + _loc19_;
               popupType3.txtBtn0._y = 186 + _loc19_;
               popupType3.txtBtn1._y = 186 + _loc19_;
               popupType3.categoryLine._visible = false;
               popupType3.bg._height = 512 + _loc19_;
               popupType3.titleFd.text = "";
            }
            popupType3.delayEvent = false;
            popupType3.onEnterFrame = function()
            {
               delete this.onEnterFrame;
               this.delayEvent = true;
            };
            type3_textField.onChanged = function(changed)
            {
               if(!popupType3.delayEvent)
               {
                  popupType3.inputFd.text = "";
                  return undefined;
               }
               btn1.setEnabled(changed);
               if(Number(argu14) == Number(1))
               {
                  strnum = lib.util.StrByteLen.getLenth2(popupType3.inputFd.text);
                  if(strnum <= strlimit)
                  {
                     strdata = popupType3.inputFd.text;
                  }
                  if(strnum > strlimit)
                  {
                     popupType3.inputFd.text = "";
                     popupType3.inputFd.text = strdata;
                     Selection.setSelection(strlimit,strlimit);
                  }
               }
            };
            if(argu6 == "" || argu6 == undefined)
            {
               btn1.setEnabled(false);
            }
            else
            {
               btn1.setEnabled(true);
            }
            popupType3.inputFd.selectable = true;
            popupType3.firstFocus = popupType3.inputFd;
            Selection.setFocus(popupType3.inputFd);
            this.onKeyDown = function()
            {
               var _loc2_ = Key.getCode();
               var _loc3_ = String(Selection.getFocus());
               var _loc1_ = String(type3_textField.__get__textField());
               if(_loc2_ == 13 && _loc1_ == _loc3_ && type3_textField.__get__text() != "")
               {
                  Selection.setFocus(null);
                  released(popUpID,type3_btn1.id);
               }
               else if(_loc2_ == 9 && _loc1_ != _loc3_)
               {
                  Selection.setFocus(_loc1_);
               }
            };
         }
         else if(type == 4)
         {
            inputing = false;
            popupType4.numberSteper.inputFd.type = "input";
            if(argu4 != undefined && argu4 != null)
            {
               popupType4.item.slotID = argu4;
            }
            var _loc42_ = 0;
            if(argu18 != undefined && argu18 != "" && argu18 != "undefined")
            {
               _loc42_ = Number(argu18);
               popupType4.GoldCurrencyInput.setGoldType(_loc42_);
            }
            if(argu5 != undefined && argu5 != null)
            {
               var _loc11_ = argu5.split("\t");
               popupType4.item.draw(_loc11_[0]);
               popupType4.item.grade = _loc11_[5];
               popupType4.item.sealType = _loc11_[6];
               popupType4.item.masterpiece = _loc11_[7];
               lib.manager.ToolTip.add(popupType4.item.SLOT,argu4,6,popupType4.item.Icon);
               delete popupType4.item.SLOT.onPress;
               delete popupType4.item.SLOT.onRelease;
               delete popupType4.item.SLOT.onReleaseOutside;
               if(_loc11_[1] != undefined)
               {
                  popupType4.item.impossible = Number(_loc11_[1]);
               }
               var _loc34_ = Number(_loc11_[8]);
               if(isNaN(_loc34_) == false && _loc34_ != -1 && _loc34_ != 0)
               {
                  var _loc44_ = popupType4.item.enchantFd;
                  _loc44_._visible = true;
                  var _loc50_ = impossible <= 0?21433:3615811;
                  if(_loc34_ > 11 && _loc34_ < 15)
                  {
                     _loc50_ = impossible <= 0?8915599:2299429;
                  }
                  else if(_loc34_ > 14)
                  {
                     _loc50_ = impossible <= 0?10624002:4074792;
                  }
                  _loc44_.shadowColor = _loc50_;
                  _loc44_.textColor = impossible <= 0?14145495:7368816;
                  _loc44_.text = "+" + _loc34_;
               }
               else
               {
                  popupType4.item.enchantFd._visible = false;
               }
               popupType4.slotName_txt.text = "";
               popupType4.slotText_txt.text = "";
               if((_loc11_[2] == undefined || _loc11_[2] == "") && (_loc11_[3] == undefined || _loc11_[3] == ""))
               {
                  popupType4.item._x = lib.manager.UISkin.NORMALPOPUP_WIDTH / 2 - popupType4.item._width / 2;
                  popupType4.slotName_txt.text = "";
                  popupType4.slotText_txt.text = "";
                  lib.manager.ToolTip.remove(popupType4.item.SLOT);
                  if(argu17 == "1")
                  {
                     popupType4.numberSteper._visible = false;
                     popupType4.GoldCurrencyInput._visible = true;
                  }
                  else
                  {
                     popupType4.numberSteper._visible = true;
                     popupType4.GoldCurrencyInput._visible = false;
                  }
               }
               else
               {
                  popupType4.item._x = 47;
                  if(_loc11_[2] != undefined)
                  {
                     var _loc64_ = lib.info.TextColor["RAREGRADE" + Number(_loc11_[5])];
                     popupType4.slotName_txt.htmlText = _loc11_[2];
                     popupType4.slotName_txt.textColor = _loc64_;
                     popupType4.numberSteper._visible = false;
                     popupType4.GoldCurrencyInput._visible = true;
                  }
                  if(_loc11_[4] != undefined && _loc11_[4] != "")
                  {
                     var _loc54_ = lib.util.GoldCurrency.SetGoldText(_loc11_[3],0,0,0,_loc42_);
                     popupType4.slotText_txt.verticalAlign = "center";
                     popupType4.slotText_txt.htmlText = "<font color=\'#cccccc\'>" + _loc11_[4] + ": " + "</font>" + "<font color=\'#" + lib.info.TextColor.GENERAL_MONEY.toString(16) + "\'>" + _loc54_ + "</font>";
                     if(popupType4.slotText_txt.maxscroll > 1)
                     {
                        popupType4.slotText_txt.htmlText = "<font size=\'14\' color=\'#cccccc\'>" + _loc11_[4] + ": " + "</font>" + "<font size=\'14\' color=\'#" + lib.info.TextColor.GENERAL_MONEY.toString(16) + "\'>" + _loc54_ + "</font>";
                     }
                  }
                  else
                  {
                     _loc54_ = lib.util.GoldCurrency.SetGoldText(_loc11_[3],0,0,0,_loc42_);
                     popupType4.slotText_txt.verticalAlign = "center";
                     popupType4.slotText_txt.htmlText = "<font color=\'#cccccc\'>" + totalPriceStr + "</font> " + "<font color=\'#" + lib.info.TextColor.GENERAL_MONEY.toString(16) + "\'>" + _loc54_ + "</font>";
                     if(popupType4.slotText_txt.maxscroll > 1)
                     {
                        popupType4.slotText_txt.htmlText = "<font size=\'14\' color=\'#cccccc\'>" + totalPriceStr + "</font> " + "<font size=\'14\' color=\'#" + lib.info.TextColor.GENERAL_MONEY.toString(16) + "\'>" + _loc54_ + "</font>";
                     }
                  }
               }
            }
            if(argu6 != undefined && argu6 != null)
            {
               popupType4.numberSteper.min = Number(argu6);
            }
            if(argu7 != undefined && argu7 != null)
            {
               popupType4.numberSteper.max = Number(argu7);
            }
            popupType4.inputString0 = "";
            if(argu8 != undefined && argu8 != null)
            {
               popupType4.numberSteper.text = argu8;
               popupType4.inputString0 = argu8;
            }
            if(Number(argu9) != 1)
            {
               _loc16_.setVisible(false);
            }
            else
            {
               _loc16_.setVisible(true);
               _loc16_.id = argu10;
            }
            if(argu12 != undefined && argu12 != null && argu12 != "")
            {
               _loc7_.setVisible(true);
               _loc7_.id = argu11;
               _loc7_.setText(argu12);
            }
            else
            {
               _loc7_.setVisible(false);
            }
            if(argu14 != undefined && argu14 != null && argu14 != "")
            {
               btn1.setVisible(true);
               btn1.id = argu13;
               btn1.setText(argu14);
            }
            else
            {
               btn1.setVisible(false);
            }
            popupType4.GoldCurrencyInput.min = argu6;
            popupType4.GoldCurrencyInput.max = argu7;
            popupType4.GoldCurrencyInput.To_Func(function()
            {
               ToGame_Popup_InputEvent(popUpID,0,popupType4.GoldCurrencyInput.total_nums);
            }
            );
            if(argu8 != undefined && argu8 != null)
            {
               popupType4.GoldCurrencyInput.total = argu8;
               popupType4.inputString0 = argu8;
            }
            popupType4.GoldCurrencyInput._func = function()
            {
               btn1.setEnabled(popupType4.GoldCurrencyInput.total_nums >= popupType4.GoldCurrencyInput._min);
               if(recieveState && popupType4.inputString0 != popupType4.GoldCurrencyInput.total_nums)
               {
                  ToGame_Popup_InputEvent(popUpID,0,popupType4.GoldCurrencyInput.total_nums);
               }
            };
            popupType4.numberSteper.onChanged = function(changed)
            {
               btn1.setEnabled(changed);
               if(popupType4.numberSteper.inputFd.text == "" || popupType4.numberSteper.inputFd.text == undefined)
               {
                  return undefined;
               }
               if(inputing)
               {
                  popupType4.numberSteper.inputFd.text = popupType4.inputString0;
               }
               if(recieveState && popupType4.inputString0 != popupType4.numberSteper.inputFd.text)
               {
                  ToGame_Popup_InputEvent(popUpID,0,popupType4.numberSteper.inputFd.text,popupType4.numberSteper.inputFd);
               }
               popupType4.inputString0 = popupType4.numberSteper.inputFd.text;
            };
            popupType4.numberSteper.inputFd.selectable = true;
            if(popupType4.numberSteper._visible == true)
            {
               popupType4.firstFocus = popupType4.numberSteper.ext_textField.textField;
               Selection.setFocus(popupType4.numberSteper.ext_textField.textField);
            }
            else
            {
               popupType4.firstFocus = popupType4.GoldCurrencyInput._txt0;
               Selection.setFocus(popupType4.GoldCurrencyInput._txt0);
            }
            UI.onKeyDown = function()
            {
               if(popupType4.GoldCurrencyInput._visible == false)
               {
                  var _loc3_ = Key.getCode();
                  var _loc5_ = String(Selection.getFocus());
                  var _loc4_ = String(popupType4.numberSteper.ext_textField.textField);
                  var _loc1_ = popupType4.numberSteper.ext_textField.text;
                  var _loc8_ = popupType4.numberSteper.ext_textField.min;
                  var _loc7_ = popupType4.numberSteper.ext_textField.max;
                  var _loc2_ = _loc1_ != "" && _loc1_ >= _loc8_ && _loc1_ <= _loc7_;
                  if(_loc3_ == 13 && _loc4_ == _loc5_ && _loc2_)
                  {
                     if(popupType4.GoldCurrencyInput.total_nums < popupType4.GoldCurrencyInput._min)
                     {
                        return undefined;
                     }
                     Selection.setFocus(null);
                     released(popUpID,type4_btn1.id);
                  }
               }
               else if(popupType4.GoldCurrencyInput._visible == true)
               {
                  _loc3_ = Key.getCode();
                  _loc5_ = String(Selection.getFocus());
                  var _loc6_ = String(popupType4.GoldCurrencyInput._txt3);
                  if(_loc3_ == 13)
                  {
                     if(_loc6_ == _loc5_)
                     {
                        if(popupType4.GoldCurrencyInput.total_nums < popupType4.GoldCurrencyInput._min)
                        {
                           return undefined;
                        }
                        Selection.setFocus(null);
                        released(popUpID,type4_btn1.id);
                     }
                  }
               }
            };
            if(argu15 != undefined && argu15 != "" || argu16 != undefined && argu16 != "")
            {
               popupType4.categoryLine1._y = 190;
               popupType4.categoryLine1._visible = true;
               popupType4.message_txt._y = 205;
               popupType4.numberBgMc._y = 231;
               popupType4.txtLabel2._y = 238;
               popupType4.numberSteper._y = 234;
               popupType4.GoldCurrencyInput._y = 232;
               popupType4.txtBtn1._y = 268;
               popupType4.txtBtn0._y = 268;
               popupType4.bg._height = 593;
               popupType4.average_lb._visible = true;
               popupType4.average_txt._visible = true;
               popupType4.min_lb._visible = true;
               popupType4.min_txt._visible = true;
               if(Number(argu15) == 0)
               {
                  popupType4.min_txt.textColor = 13421772;
                  popupType4.min_txt.text = "$196008";
               }
               else
               {
                  var _loc66_ = lib.util.GoldCurrency.SetGoldText(argu15,0,0,0,_loc42_);
                  popupType4.min_txt.htmlText = _loc66_;
               }
               if(Number(argu16) == 0)
               {
                  popupType4.average_txt.textColor = 13421772;
                  popupType4.average_txt.text = "$196013";
               }
               else
               {
                  var _loc68_ = lib.util.GoldCurrency.SetGoldText(argu16,0,0,0,_loc42_);
                  popupType4.average_txt.htmlText = _loc68_;
               }
            }
            else
            {
               popupType4.categoryLine1._visible = false;
               popupType4.categoryLine1._y = 128;
               popupType4.message_txt._y = 143;
               popupType4.numberBgMc._y = 169;
               popupType4.txtLabel2._y = 176;
               popupType4.numberSteper._y = 172;
               popupType4.GoldCurrencyInput._y = 170;
               popupType4.txtBtn1._y = 206;
               popupType4.txtBtn0._y = 206;
               popupType4.bg._height = 532;
               popupType4.average_lb._visible = false;
               popupType4.average_txt._visible = false;
               popupType4.min_lb._visible = false;
               popupType4.min_txt._visible = false;
            }
         }
         else if(type == 5)
         {
            inputing = false;
            popupType5.numberSteper.inputFd.type = "input";
            _loc42_ = 0;
            if(argu22 != undefined && argu22 != "" && argu22 != "undefined")
            {
               _loc42_ = Number(argu22);
               popupType5.GoldCurrencyInput.setGoldType(_loc42_);
            }
            if(argu4 != undefined && argu4 != null)
            {
               popupType5.item.slotID = argu4;
            }
            if(argu5 != undefined && argu5 != null)
            {
               _loc11_ = argu5.split("\t");
               popupType5.item.draw(_loc11_[0]);
               popupType5.item.grade = _loc11_[5];
               popupType5.item.sealType = _loc11_[6];
               popupType5.item.masterpiece = _loc11_[7];
               lib.manager.ToolTip.add(popupType5.item.SLOT,argu4,6,popupType5.item.Icon);
               delete popupType5.item.SLOT.onPress;
               delete popupType5.item.SLOT.onRelease;
               delete popupType5.item.SLOT.onReleaseOutside;
               if(_loc11_[1] != undefined)
               {
                  popupType5.item.impossible = Number(_loc11_[1]);
               }
               _loc34_ = Number(_loc11_[8]);
               if(isNaN(_loc34_) == false && _loc34_ != -1 && _loc34_ != 0)
               {
                  _loc44_ = popupType5.item.enchantFd;
                  _loc44_._visible = true;
                  _loc50_ = impossible <= 0?21433:3615811;
                  if(_loc34_ > 11 && _loc34_ < 15)
                  {
                     _loc50_ = impossible <= 0?8915599:2299429;
                  }
                  else if(_loc34_ > 14)
                  {
                     _loc50_ = impossible <= 0?10624002:4074792;
                  }
                  _loc44_.shadowColor = _loc50_;
                  _loc44_.textColor = impossible <= 0?14145495:7368816;
                  _loc44_.text = "+" + _loc34_;
               }
               else
               {
                  popupType5.item.enchantFd._visible = false;
               }
               popupType5.slotName_txt.text = "";
               popupType5.slotText_txt.text = "";
               if((_loc11_[2] == undefined || _loc11_[2] == "") && (_loc11_[3] == undefined || _loc11_[3] == ""))
               {
                  popupType5.item._x = lib.manager.UISkin.NORMALPOPUP_WIDTH / 2 - popupType5.item._width / 2;
                  popupType5.slotName_txt.text = "";
                  popupType5.slotText_txt.text = "";
                  popupType5.inputFd1._visible = true;
                  popupType5.inputFd1_focus._visible = false;
                  popupType5.txtFdbg._visible = true;
                  popupType5.GoldCurrencyInput._visible = false;
               }
               else
               {
                  popupType5.item._x = 47;
                  if(_loc11_[2] != undefined)
                  {
                     _loc64_ = lib.info.TextColor["RAREGRADE" + Number(_loc11_[5])];
                     popupType5.slotName_txt.htmlText = _loc11_[2];
                     popupType5.slotName_txt.textColor = _loc64_;
                     popupType5.inputFd1._visible = false;
                     popupType5.inputFd1_focus._visible = false;
                     popupType5.txtFdbg._visible = false;
                     popupType5.GoldCurrencyInput._visible = true;
                  }
                  if(_loc11_[4] != undefined && _loc11_[4] != "")
                  {
                     _loc54_ = lib.util.GoldCurrency.SetGoldText(_loc11_[3],0,0,0,_loc42_);
                     popupType5.slotText_txt.verticalAlign = "center";
                     popupType5.slotText_txt.htmlText = "<font color=\'#cccccc\'>" + _loc11_[5] + ": " + "</font>" + "<font color=\'#" + lib.info.TextColor.GENERAL_MONEY.toString(16) + "\'>" + _loc54_ + "</font>";
                     if(popupType5.slotText_txt.maxscroll > 1)
                     {
                        popupType5.slotText_txt.htmlText = "<font size=\'14\' color=\'#cccccc\'>" + _loc11_[5] + ": " + "</font>" + "<font size=\'14\' color=\'#" + lib.info.TextColor.GENERAL_MONEY.toString(16) + "\'>" + _loc54_ + "</font>";
                     }
                  }
                  else
                  {
                     _loc54_ = lib.util.GoldCurrency.SetGoldText(_loc11_[3],0,0,0,_loc42_);
                     popupType5.slotText_txt.verticalAlign = "center";
                     popupType5.slotText_txt.htmlText = "<font color=\'#cccccc\'>" + totalPriceStr + "</font> " + "<font color=\'#" + lib.info.TextColor.GENERAL_MONEY.toString(16) + "\'>" + _loc54_ + "</font>";
                     if(popupType5.slotText_txt.maxscroll > 1)
                     {
                        popupType5.slotText_txt.htmlText = "<font size=\'14\' color=\'#cccccc\'>" + totalPriceStr + "</font> " + "<font size=\'14\' color=\'#" + lib.info.TextColor.GENERAL_MONEY.toString(16) + "\'>" + _loc54_ + "</font>";
                     }
                  }
               }
            }
            if(argu6 != undefined && argu6 != null)
            {
               popupType5.numberSteper.min = Number(argu6);
            }
            if(argu7 != undefined && argu7 != null)
            {
               popupType5.numberSteper.max = Number(argu7);
               popupType5.numberSteper._max = Number(argu7);
            }
            popupType5.inputString0 = "";
            if(argu8 != undefined && argu8 != null)
            {
               popupType5.numberSteper.text = argu8;
               popupType5.inputString0 = argu8;
            }
            if(argu9 != undefined && argu9 != null)
            {
               type51_textField.__set__min(Number(1));
            }
            if(argu10 != undefined && argu10 != null)
            {
               type51_textField.__set__max(Number(99900000000));
            }
            popupType5.inputString1 = "";
            if(argu11 != undefined && argu11 != null && type51_textField.__get__text() != argu11)
            {
               type51_textField.__set__text(argu11);
               popupType5.inputString1 = popupType5.inputFd1.text;
            }
            if(Number(argu12) != 1)
            {
               _loc16_.setVisible(false);
            }
            else
            {
               _loc16_.setVisible(true);
               _loc16_.id = argu13;
            }
            if(argu15 != undefined && argu15 != null && argu15 != "")
            {
               _loc7_.setVisible(true);
               _loc7_.id = argu14;
               _loc7_.setText(argu15);
            }
            else
            {
               _loc7_.setVisible(false);
            }
            if(argu17 != undefined && argu17 != null && argu17 != "")
            {
               btn1.setVisible(true);
               btn1.id = argu16;
               btn1.setText(argu17);
            }
            else
            {
               btn1.setVisible(false);
            }
            if(argu18 != undefined && argu18 != null && argu18 != "")
            {
               popupType5.NumCheck1_txt.text = argu18;
            }
            else
            {
               popupType5.NumCheck1_txt.text = lib.util.UIString.getUIString("$191001");
            }
            if(argu19 != undefined && argu19 != null && argu19 != "")
            {
               popupType5.NumCheck2_txt.text = argu19;
            }
            else
            {
               popupType5.NumCheck2_txt.text = lib.util.UIString.getUIString("$191002");
            }
            popupType5.GoldCurrencyInput.registeredMin = argu9;
            popupType5.GoldCurrencyInput.avg = argu10;
            popupType5.GoldCurrencyInput.To_Func(function()
            {
               ToGame_Popup_InputEvent(popUpID,1,popupType5.GoldCurrencyInput.total_nums);
            }
            );
            if(argu11 != undefined && argu11 != null)
            {
               popupType5.GoldCurrencyInput.total = argu11;
               popupType5.inputString1 = argu11;
            }
            popupType5.GoldCurrencyInput._func = function()
            {
               btn1.setEnabled(popupType5.GoldCurrencyInput.total_nums >= popupType5.GoldCurrencyInput._min);
               if(recieveState)
               {
                  ToGame_Popup_InputEvent(popUpID,1,popupType5.GoldCurrencyInput.total_nums);
               }
            };
            popupType5.numberSteper.onChanged = function(changed)
            {
               btn1.setEnabled(changed);
               if(popupType5.numberSteper.inputFd.text == "" || popupType5.numberSteper.inputFd.text == undefined)
               {
                  return undefined;
               }
               if(inputing)
               {
                  popupType5.numberSteper.inputFd.text = popupType5.inputString0;
               }
               if(recieveState && popupType5.inputString0 != popupType5.numberSteper.inputFd.text)
               {
                  ToGame_Popup_InputEvent(popUpID,0,popupType5.numberSteper.inputFd.text,popupType5.numberSteper.inputFd);
               }
               popupType5.inputString0 = popupType5.numberSteper.inputFd.text;
            };
            btn1.setEnabled(popupType5.numberSteper.text != 0 && popupType5.numberSteper.text != 0);
            popupType5.numberSteper.inputFd.selectable = true;
            UI.onKeyDown = function()
            {
               var _loc2_ = Key.getCode();
               var _loc1_ = String(Selection.getFocus());
               var _loc4_ = String(popupType5.numberSteper.inputFd);
               var _loc3_ = String(popupType5.GoldCurrencyInput._txt3);
               if(_loc2_ == 13)
               {
                  if(_loc4_ == _loc1_)
                  {
                     Selection.setFocus(popupType5.GoldCurrencyInput._txt0);
                     return undefined;
                  }
                  if(_loc3_ == _loc1_)
                  {
                     if(popupType5.GoldCurrencyInput.total_nums < popupType5.GoldCurrencyInput._min)
                     {
                        return undefined;
                     }
                     Selection.setFocus(null);
                     released(popUpID,type5_btn1.id);
                  }
               }
            };
            if(argu20 != undefined && argu20 != "" || argu21 != undefined && argu21 != "")
            {
               popupType5.onEnterFrame = null;
               popupType5.onEnterFrame = function()
               {
                  if(popupType5.inputFd1_focus != undefined)
                  {
                     if(popupType5.GoldCurrencyInput._visible == true)
                     {
                        popupType5.inputFd1_focus._visible = false;
                     }
                     if(popupType5.numberSteper._visible == true)
                     {
                        if(popupType5.GoldCurrencyInput._visible == true)
                        {
                           popupType5.firstFocus = popupType5.numberSteper.ext_textField.textField;
                           Selection.setFocus(popupType5.numberSteper.ext_textField.textField);
                        }
                        else
                        {
                           popupType5.firstFocus = popupType5.numberSteper.ext_textField.textField;
                           Selection.setFocus(popupType5.numberSteper.ext_textField.textField);
                        }
                     }
                     else
                     {
                        popupType5.firstFocus = popupType5.GoldCurrencyInput._txt0;
                        Selection.setFocus(popupType5.GoldCurrencyInput._txt0);
                     }
                     popupType5.onEnterFrame = null;
                  }
               };
               popupType5.categoryLine1._y = 190;
               popupType5.categoryLine1._visible = true;
               popupType5.message_txt._y = 204;
               popupType5.numberBgMc0._y = 231;
               popupType5.NumCheck1_txt._y = 236.5;
               popupType5.numberSteper._y = 232;
               popupType5.GoldCurrencyInput._y = 263;
               popupType5.numberBgMc1._y = 261;
               popupType5.NumCheck2_txt._y = 268.5;
               popupType5.txtFdbg._y = 265.8;
               popupType5.inputFd1._y = 269.5;
               popupType5.inputFd1_focus._y = 262.5;
               popupType5.txtBtn1._y = 298.5;
               popupType5.txtBtn0._y = 298.5;
               popupType5.bg._height = 624;
               popupType5.average_lb._visible = true;
               popupType5.average_txt._visible = true;
               popupType5.min_lb._visible = true;
               popupType5.min_txt._visible = true;
               if(Number(argu20) == 0)
               {
                  popupType5.min_txt.textColor = 13421772;
                  popupType5.min_txt.text = "$196008";
               }
               else
               {
                  _loc66_ = lib.util.GoldCurrency.SetGoldText(argu20,0,0,0,_loc42_);
                  popupType5.min_txt.htmlText = _loc66_;
               }
               if(Number(argu21) == 0)
               {
                  popupType5.average_txt.textColor = 13421772;
                  popupType5.average_txt.text = "$196013";
               }
               else
               {
                  _loc68_ = lib.util.GoldCurrency.SetGoldText(argu21,0,0,0,_loc42_);
                  popupType5.average_txt.htmlText = _loc68_;
               }
            }
            else
            {
               popupType5.onEnterFrame = null;
               popupType5.onEnterFrame = function()
               {
                  if(popupType5.inputFd1_focus != undefined)
                  {
                     if(popupType5.GoldCurrencyInput._visible == true)
                     {
                        popupType5.inputFd1_focus._visible = false;
                     }
                     if(popupType5.numberSteper._visible == true)
                     {
                        if(popupType5.GoldCurrencyInput._visible == true)
                        {
                           popupType5.firstFocus = popupType5.numberSteper.ext_textField.textField;
                           Selection.setFocus(popupType5.numberSteper.ext_textField.textField);
                        }
                        else
                        {
                           popupType5.firstFocus = popupType5.numberSteper.ext_textField.textField;
                           Selection.setFocus(popupType5.numberSteper.ext_textField.textField);
                        }
                     }
                     else
                     {
                        popupType5.firstFocus = popupType5.GoldCurrencyInput._txt0;
                        Selection.setFocus(popupType5.GoldCurrencyInput._txt0);
                     }
                     popupType5.onEnterFrame = null;
                  }
               };
               popupType5.categoryLine1._visible = false;
               popupType5.message_txt._y = 144;
               popupType5.numberBgMc0._y = 169;
               popupType5.NumCheck1_txt._y = 176;
               popupType5.numberSteper._y = 172;
               popupType5.GoldCurrencyInput._y = 202;
               popupType5.numberBgMc1._y = 201;
               popupType5.NumCheck2_txt._y = 208.5;
               popupType5.txtFdbg._y = 205;
               popupType5.inputFd1._y = 209;
               popupType5.inputFd1_focus._y = 203;
               popupType5.txtBtn1._y = 238;
               popupType5.txtBtn0._y = 238;
               popupType5.bg._height = 563;
               popupType5.average_lb._visible = false;
               popupType5.average_txt._visible = false;
               popupType5.min_lb._visible = false;
               popupType5.min_txt._visible = false;
            }
         }
         else if(type == 6)
         {
            if(argu4 != undefined && argu4 != null)
            {
               var _loc37_ = [];
               var _loc39_ = argu4.split("\n");
               var _loc14_ = _loc39_.shift();
               while(_loc14_ != undefined)
               {
                  var _loc4_ = _loc14_.split("\t");
                  if(_loc4_[0] != undefined && _loc4_[0] != "")
                  {
                     _loc37_.push({id:_loc4_[0],label:_loc4_[1]});
                  }
                  _loc14_ = _loc39_.shift();
               }
               if(argu5 != undefined && argu5 != null)
               {
                  popupType6.combobox.defaultSelect = Number(argu5);
               }
               popupType6.combobox.data = _loc37_;
            }
            if(Number(argu6) != 1)
            {
               _loc16_.setVisible(false);
            }
            else
            {
               _loc16_.setVisible(true);
               _loc16_.id = argu7;
            }
            if(argu9 != undefined && argu9 != null && argu9 != "")
            {
               _loc7_.setVisible(true);
               _loc7_.id = argu8;
               _loc7_.setText(argu9);
            }
            else
            {
               _loc7_.setVisible(false);
            }
            if(argu11 != undefined && argu11 != null && argu11 != "")
            {
               btn1.setVisible(true);
               btn1.id = argu10;
               btn1.setText(argu11);
            }
            else
            {
               btn1.setVisible(false);
            }
            if(_loc7_.btn._visible && btn1.btn._visible)
            {
               popupType6.firstFocus = popupType6.txtBtn1.btn;
               Selection.setFocus(popupType6.txtBtn1.btn);
            }
            else if(!_loc7_.btn._visible && btn1.btn._visible)
            {
               popupType6.firstFocus = popupType6.txtBtn1.btn;
               Selection.setFocus(popupType6.txtBtn1.btn);
            }
            else if(_loc7_.btn._visible && !btn1.btn._visible)
            {
               popupType6.firstFocus = popupType6.txtBtn0.btn;
               Selection.setFocus(popupType6.txtBtn0.btn);
            }
         }
         else if(type == 7)
         {
            popupType7.clear();
            if(argu4 != undefined && argu4 != null)
            {
               var _loc35_ = argu4.split("\n");
               var _loc38_ = _loc35_.length;
               var _loc40_ = 58;
               var _loc43_ = 249 - (_loc40_ * _loc38_ >> 1);
               _loc5_ = 0;
               while(_loc5_ < _loc38_)
               {
                  var _loc10_ = _loc35_[_loc5_].split("\t");
                  var _loc6_ = _loc10_[0];
                  var _loc3_ = _loc10_[1];
                  var _loc9_ = undefined;
                  var _loc8_ = 0;
                  var _loc27_ = undefined;
                  var _loc26_ = 0;
                  _loc27_ = _loc9_ = _loc43_ + _loc5_ * _loc40_;
                  var _loc30_ = flash.display.BitmapData.loadBitmap("slotFrame");
                  var _loc17_ = flash.display.BitmapData.loadBitmap(_loc3_);
                  lib.display.DrawBitmapData.draw(popupType7.buffContainer,_loc17_,_loc9_,_loc8_,0,0,50,50,0.8);
                  var _loc2_ = container_mc["btn" + _loc6_];
                  if(_loc2_ == undefined)
                  {
                     _loc2_ = popupType7.buffContainer.attachMovie("emptyBtn","btn" + _loc6_,popupType7.buffContainer.getNextHighestDepth());
                     _loc2_.onPress = function()
                     {
                     };
                     _loc2_.onRelease = function()
                     {
                     };
                  }
                  _loc2_.id = _loc6_;
                  _loc2_._x = _loc9_;
                  _loc2_._y = _loc8_;
                  _loc2_._visible = true;
                  var _loc15_ = _loc3_.indexOf("__",0) + 2;
                  var _loc31_ = _loc3_.substring(_loc15_,_loc3_.length);
                  lib.manager.ToolTip.add(_loc2_,_loc6_,12);
                  _loc5_ = _loc5_ + 1;
               }
               _loc16_.id = argu5;
               _loc7_.setVisible(true);
               _loc7_.id = argu6;
               _loc7_.setText(argu7);
               btn1.setVisible(true);
               btn1.id = argu8;
               btn1.setText(argu9);
            }
         }
         lib.manager.PopupManager.add(argu1,type,popup);
      }
   }
   btnAlign(popup);
};
myListener.OnGame_Popup_Update = function(argu1, argu2, argu3, argu4, argu5, argu6, argu7, argu8, argu9, argu10, argu11, argu12, argu13, argu14, argu15, argu16, argu17, argu18, argu19, argu20, argu21, argu22)
{
   if(lib.manager.PopupManager.getType(argu1) < 2)
   {
      return undefined;
   }
   var popup = lib.manager.PopupManager.getPopup(argu1);
   var _loc18_ = lib.manager.PopupManager.getType(argu1);
   var _loc3_ = UI["type" + _loc18_ + "_btn0"];
   var btn1 = UI["type" + _loc18_ + "_btn1"];
   var _loc8_ = UI["type" + _loc18_ + "_x"];
   popup.title_txt.html = true;
   popup.title_txt.htmlText = argu2;
   popup.message_txt.htmlText = argu3;
   if(_loc18_ == 2)
   {
      var _loc24_ = 0;
      if(popup.message_txt.textHeight > 85)
      {
         _loc24_ = popup.message_txt.textHeight - 85;
      }
      popup.message_txt._height = 90 + _loc24_;
      popup.count_txt._y = 152.5 + _loc24_;
      popup.bg._height = 512 + _loc24_;
      popup.txtBtn1._y = 186 + _loc24_;
      popup.txtBtn0._y = 186 + _loc24_;
      if(Number(argu5) != 1)
      {
         _loc8_.setVisible(false);
      }
      else
      {
         _loc8_.setVisible(true);
         _loc8_.id = argu6;
      }
      if(argu4 != undefined && argu4 != null && argu4 != "" && argu4 != Number(0))
      {
         delete counter.onEnterFrame;
         counter.totalTime = Number(argu4) * 1000;
         counter.startedTime = getTimer();
         counter.aimTime = counter.startedTime + counter.totalTime;
         counter.onEnterFrame = function()
         {
            var _loc2_ = getTimer();
            popup.count_txt.htmlText = lib.util.UIString.getUIString("$191003","secondColor",lib.info.TextColor.GENERAL_EMPHASIS.toString(16),"EndSec",Math.ceil((counter.aimTime - _loc2_) / 1000));
            if(counter.aimTime <= _loc2_)
            {
               popup.count_txt.htmlText = lib.util.UIString.getUIString("$191003","secondColor",lib.info.TextColor.GENERAL_EMPHASIS.toString(16),"EndSec",0);
               delete this.onEnterFrame;
            }
         };
      }
      else
      {
         delete counter.onEnterFrame;
         popup.count_txt.text = "";
      }
      if(argu8 != undefined && argu8 != null && argu8 != "")
      {
         _loc3_.setVisible(true);
         _loc3_.id = argu7;
         _loc3_.setText(argu8);
      }
      else
      {
         _loc3_.setVisible(false);
      }
      if(argu10 != undefined && argu10 != null && argu10 != "")
      {
         btn1.setVisible(true);
         btn1.id = argu9;
         btn1.setText(argu10);
      }
      else
      {
         btn1.setVisible(false);
      }
   }
   else if(_loc18_ == 3)
   {
      var strnum = 0;
      var strdata = "";
      var strlimit = argu5;
      if(Number(argu7) != 1)
      {
         _loc8_.setVisible(false);
      }
      else
      {
         _loc8_.setVisible(true);
         _loc8_.id = argu8;
      }
      if(argu10 != undefined && argu10 != null && argu10 != "")
      {
         _loc3_.setVisible(true);
         _loc3_.id = argu9;
         _loc3_.setText(argu10);
      }
      else
      {
         _loc3_.setVisible(false);
      }
      if(argu12 != undefined && argu12 != null && argu12 != "")
      {
         btn1.setVisible(true);
         btn1.id = argu11;
         btn1.setText(argu12);
      }
      else
      {
         btn1.setVisible(false);
      }
      if(typebool != Number(1))
      {
         type3_textField.__set__maxschar(Number(argu5));
      }
      popupType3.inputFd.text = argu6;
      var _loc7_ = 0;
      if(popup.message_txt.textHeight > 45)
      {
         _loc7_ = popup.message_txt.textHeight - 45;
      }
      popup.message_txt._height = 50 + _loc7_;
      popupType3.categoryLine._y = 122 + _loc7_;
      if(argu13 != undefined && argu13 != "")
      {
         popupType3.inputFd._y = 167 + _loc7_;
         popupType3.inputFd_focus._y = 160 + _loc7_;
         popupType3.inputFd_bg._y = 163 + _loc7_;
         popupType3.txtBtn0._y = 206 + _loc7_;
         popupType3.txtBtn1._y = 206 + _loc7_;
         popupType3.categoryLine._visible = true;
         popupType3.bg._height = 532 + _loc7_;
         popupType3.titleFd._y = 137 + _loc7_;
         popupType3.titleFd.text = argu13;
         popupType3.titleFd.textColor = lib.info.TextColor.GENERAL_EXPLAIN_DETAIL;
      }
      else
      {
         popupType3.inputFd._y = 127 + _loc7_;
         popupType3.inputFd_focus._y = 120 + _loc7_;
         popupType3.inputFd_bg._y = 123 + _loc7_;
         popupType3.txtBtn0._y = 186 + _loc7_;
         popupType3.txtBtn1._y = 186 + _loc7_;
         popupType3.categoryLine._visible = false;
         popupType3.bg._height = 512 + _loc7_;
         popupType3.titleFd.text = "";
      }
      type3_textField.onChanged = function(changed)
      {
         btn1.setEnabled(changed);
         if(Number(argu14) == Number(1))
         {
            strnum = lib.util.StrByteLen.getLenth2(popupType3.inputFd.text);
            if(strnum <= strlimit)
            {
               strdata = popupType3.inputFd.text;
            }
            if(strnum > strlimit)
            {
               popupType3.inputFd.text = "";
               popupType3.inputFd.text = strdata;
               Selection.setSelection(strlimit,strlimit);
            }
         }
      };
      if(argu6 == "" || argu6 == undefined)
      {
         btn1.setEnabled(false);
      }
      else
      {
         btn1.setEnabled(true);
      }
   }
   else if(_loc18_ == 4)
   {
      inputing = false;
      popupType4.numberSteper.inputFd.type = "input";
      var _loc25_ = 0;
      if(argu18 != undefined && argu18 != "" && argu18 != "undefined")
      {
         _loc25_ = Number(argu18);
         popupType4.GoldCurrencyInput.setGoldType(_loc25_);
      }
      if(argu4 != undefined && argu4 != null)
      {
         popupType4.item.slotID = argu4;
      }
      if(argu5 != undefined && argu5 != null)
      {
         var _loc4_ = argu5.split("\t");
         popupType4.item.draw(_loc4_[0]);
         popupType4.item.grade = _loc4_[5];
         popupType4.item.sealType = _loc4_[6];
         popupType4.item.masterpiece = _loc4_[7];
         lib.manager.ToolTip.add(popupType4.item.SLOT,argu4,6,popupType4.item.Icon);
         delete popupType4.item.SLOT.onPress;
         delete popupType4.item.SLOT.onRelease;
         delete popupType4.item.SLOT.onReleaseOutside;
         var _loc19_ = Number(_loc4_[8]);
         if(isNaN(_loc19_) == false && _loc19_ != -1 && _loc19_ != 0)
         {
            var _loc26_ = popupType4.item.enchantFd;
            _loc26_._visible = true;
            var _loc29_ = impossible <= 0?21433:3615811;
            if(_loc19_ > 11 && _loc19_ < 15)
            {
               _loc29_ = impossible <= 0?8915599:2299429;
            }
            else if(_loc19_ > 14)
            {
               _loc29_ = impossible <= 0?10624002:4074792;
            }
            _loc26_.shadowColor = _loc29_;
            _loc26_.textColor = impossible <= 0?14145495:7368816;
            _loc26_.text = "+" + _loc19_;
         }
         else
         {
            popupType4.item.enchantFd._visible = false;
         }
         if(_loc4_[1] != undefined)
         {
            popupType4.item.impossible = Number(_loc4_[1]);
         }
         popupType4.slotName_txt.text = "";
         popupType4.slotText_txt.text = "";
         if((_loc4_[2] == undefined || _loc4_[2] == "") && (_loc4_[3] == undefined || _loc4_[3] == ""))
         {
            popupType4.item._x = lib.manager.UISkin.NORMALPOPUP_WIDTH / 2 - popupType4.item._width / 2;
            popupType4.slotName_txt.text = "";
            popupType4.slotText_txt.text = "";
         }
         else
         {
            popupType4.item._x = 47;
            if(_loc4_[2] != undefined)
            {
               var _loc37_ = lib.info.TextColor["RAREGRADE" + _loc4_[5]];
               popupType4.slotName_txt.htmlText = _loc4_[2];
               popupType4.slotName_txt.textColor = _loc37_;
            }
            if(_loc4_[4] != undefined && _loc4_[4] != "")
            {
               var _loc32_ = lib.util.GoldCurrency.SetGoldText(_loc4_[3],0,0,0,_loc25_);
               popupType4.slotText_txt.verticalAlign = "center";
               popupType4.slotText_txt.htmlText = "<font color=\'#cccccc\'>" + _loc4_[4] + ": " + "</font>" + "<font color=\'#" + lib.info.TextColor.GENERAL_MONEY.toString(16) + "\'>" + _loc32_ + "</font>";
               if(popupType4.slotText_txt.maxscroll > 1)
               {
                  popupType4.slotText_txt.htmlText = "<font size=\'14\' color=\'#cccccc\'>" + _loc4_[4] + ": " + "</font>" + "<font size=\'14\' color=\'#" + lib.info.TextColor.GENERAL_MONEY.toString(16) + "\'>" + _loc32_ + "</font>";
               }
            }
            else
            {
               _loc32_ = lib.util.GoldCurrency.SetGoldText(_loc4_[3],0,0,0,_loc25_);
               popupType4.slotText_txt.verticalAlign = "center";
               popupType4.slotText_txt.htmlText = "<font color=\'#cccccc\'>" + totalPriceStr + "</font> " + "<font color=\'#" + lib.info.TextColor.GENERAL_MONEY.toString(16) + "\'>" + _loc32_ + "</font>";
               if(popupType4.slotText_txt.maxscroll > 1)
               {
                  popupType4.slotText_txt.htmlText = "<font size=\'14\' color=\'#cccccc\'>" + totalPriceStr + "</font> " + "<font size=\'14\' color=\'#" + lib.info.TextColor.GENERAL_MONEY.toString(16) + "\'>" + _loc32_ + "</font>";
               }
            }
         }
      }
      if(argu6 != undefined && argu6 != null && popupType4.numberSteper.min != Number(argu6))
      {
         popupType4.numberSteper.min = Number(argu6);
      }
      if(argu7 != undefined && argu7 != null && popupType4.numberSteper.max != Number(argu7))
      {
         popupType4.numberSteper.max = Number(argu7);
      }
      if(popupType4.numberSteper._visible)
      {
         if(argu8 != undefined && argu8 != null && popupType4.numberSteper.text != argu8)
         {
            popupType4.numberSteper.text = argu8;
            popupType4.inputString0 = argu8;
         }
      }
      else if(argu8 != undefined && argu8 != null && popupType4.GoldCurrencyInput.total_nums != argu8)
      {
         popupType4.inputString0 = argu8;
      }
      if(Number(argu9) != 1)
      {
         _loc8_.setVisible(false);
      }
      else
      {
         _loc8_.setVisible(true);
         _loc8_.id = argu10;
      }
      if(argu12 != undefined && argu12 != null && argu12 != "")
      {
         _loc3_.setVisible(true);
         _loc3_.id = argu11;
         _loc3_.setText(argu12);
      }
      else
      {
         _loc3_.setVisible(false);
      }
      if(argu14 != undefined && argu14 != null && argu14 != "")
      {
         btn1.setVisible(true);
         btn1.id = argu13;
         btn1.setText(argu14);
      }
      else
      {
         btn1.setVisible(false);
      }
      if(Number(argu15) == 0)
      {
         popupType4.min_txt.textColor = 13421772;
         popupType4.min_txt.text = "$196008";
      }
      else
      {
         var _loc38_ = lib.util.GoldCurrency.SetGoldText(argu15,0,0,0,_loc25_);
         popupType4.min_txt.htmlText = _loc38_;
      }
      if(Number(argu16) == 0)
      {
         popupType4.average_txt.textColor = 13421772;
         popupType4.average_txt.text = "$196013";
      }
      else
      {
         var _loc39_ = lib.util.GoldCurrency.SetGoldText(argu16,0,0,0,_loc25_);
         popupType4.average_txt.htmlText = _loc39_;
      }
   }
   else if(_loc18_ == 5)
   {
      inputing = false;
      if(popupType5._s == true)
      {
         popupType5.numberSteper.inputFd.type = "input";
      }
      _loc25_ = 0;
      if(argu22 != undefined && argu22 != "" && argu22 != "undefined")
      {
         _loc25_ = Number(argu22);
         popupType5.GoldCurrencyInput.setGoldType(_loc25_);
      }
      if(argu4 != undefined && argu4 != null)
      {
         popupType4.item.slotID = argu4;
      }
      if(argu5 != undefined && argu5 != null)
      {
         _loc4_ = argu5.split("\t");
         popupType5.item.draw(_loc4_[0]);
         popupType5.item.grade = _loc4_[5];
         popupType5.item.sealType = _loc4_[6];
         popupType5.item.masterpiece = _loc4_[7];
         lib.manager.ToolTip.add(popupType5.item.SLOT,argu4,6,popupType5.item.Icon);
         delete popupType5.item.SLOT.onPress;
         delete popupType5.item.SLOT.onRelease;
         delete popupType5.item.SLOT.onReleaseOutside;
         if(_loc4_[1] != undefined)
         {
            popupType5.item.impossible = Number(_loc4_[1]);
         }
         _loc19_ = Number(_loc4_[8]);
         if(isNaN(_loc19_) == false && _loc19_ != -1 && _loc19_ != 0)
         {
            _loc26_ = popupType5.item.enchantFd;
            _loc26_._visible = true;
            _loc29_ = impossible <= 0?21433:3615811;
            if(_loc19_ > 11 && _loc19_ < 15)
            {
               _loc29_ = impossible <= 0?8915599:2299429;
            }
            else if(_loc19_ > 14)
            {
               _loc29_ = impossible <= 0?10624002:4074792;
            }
            _loc26_.shadowColor = _loc29_;
            _loc26_.textColor = impossible <= 0?14145495:7368816;
            _loc26_.text = "+" + _loc19_;
         }
         else
         {
            popupType5.item.enchantFd._visible = false;
         }
         popupType5.slotName_txt.text = "";
         popupType5.slotText_txt.text = "";
         if((_loc4_[2] == undefined || _loc4_[2] == "") && (_loc4_[3] == undefined || _loc4_[3] == ""))
         {
            popupType5.item._x = lib.manager.UISkin.NORMALPOPUP_WIDTH / 2 - popupType5.item._width / 2;
            popupType5.slotName_txt.text = "";
            popupType5.slotText_txt.text = "";
         }
         else
         {
            popupType5.item._x = 47;
            if(_loc4_[2] != undefined)
            {
               _loc37_ = lib.info.TextColor["RAREGRADE" + Number(_loc4_[5])];
               popupType5.slotName_txt.htmlText = _loc4_[2];
               popupType5.slotName_txt.textColor = _loc37_;
            }
            if(_loc4_[4] != undefined && _loc4_[4] != "")
            {
               _loc32_ = lib.util.GoldCurrency.SetGoldText(_loc4_[3],0,0,0,_loc25_);
               popupType5.slotText_txt.verticalAlign = "center";
               popupType5.slotText_txt.htmlText = "<font color=\'#cccccc\'>" + _loc4_[4] + ": " + "</font>" + "<font color=\'#" + lib.info.TextColor.GENERAL_MONEY.toString(16) + "\'>" + _loc32_ + "</font>";
               if(popupType5.slotText_txt.maxscroll > 1)
               {
                  popupType5.slotText_txt.htmlText = "<font size=\'14\' color=\'#cccccc\'>" + _loc4_[4] + ": " + "</font>" + "<font size=\'14\' color=\'#" + lib.info.TextColor.GENERAL_MONEY.toString(16) + "\'>" + _loc32_ + "</font>";
               }
            }
            else
            {
               _loc32_ = lib.util.GoldCurrency.SetGoldText(_loc4_[3],0,0,0,_loc25_);
               popupType5.slotText_txt.verticalAlign = "center";
               popupType5.slotText_txt.htmlText = "<font color=\'#cccccc\'>" + totalPriceStr + "</font> " + "<font color=\'#" + lib.info.TextColor.GENERAL_MONEY.toString(16) + "\'>" + _loc32_ + "</font>";
               if(popupType5.slotText_txt.maxscroll > 1)
               {
                  popupType5.slotText_txt.htmlText = "<font size=\'14\' color=\'#cccccc\'>" + totalPriceStr + "</font> " + "<font size=\'14\' color=\'#" + lib.info.TextColor.GENERAL_MONEY.toString(16) + "\'>" + _loc32_ + "</font>";
               }
            }
         }
      }
      if(argu6 != undefined && argu6 != null && popupType5.numberSteper.min != Number(argu6))
      {
         popupType5.numberSteper.min = Number(argu6);
      }
      if(argu7 != undefined && argu7 != null && popupType5.numberSteper.max != Number(argu7))
      {
         popupType5.numberSteper.max = Number(argu7);
         popupType5.numberSteper._max = Number(argu7);
      }
      if(argu8 != undefined && argu8 != null && popupType5.numberSteper.text != argu8)
      {
         popupType5.numberSteper.inputFd.text = argu8;
         popupType5.inputString0 = argu8;
      }
      if(argu9 != undefined && argu9 != null && type51_textField.__get__min() != Number(argu9))
      {
         type51_textField.__set__min(Number(1));
      }
      if(argu10 != undefined && argu10 != null && type51_textField.__get__max() != Number(argu10))
      {
         type51_textField.__set__max(Number(99900000000));
      }
      popupType5.GoldCurrencyInput.registeredMin = argu9;
      popupType5.GoldCurrencyInput.avg = argu10;
      if(argu11 != undefined && argu11 != null && popupType5.GoldCurrencyInput.total_nums != argu11)
      {
         popupType5.inputString1 = argu11;
      }
      if(Number(argu12) != 1)
      {
         _loc8_.setVisible(false);
      }
      else
      {
         _loc8_.setVisible(true);
         _loc8_.id = argu13;
      }
      if(argu15 != undefined && argu15 != null && argu15 != "")
      {
         _loc3_.setVisible(true);
         _loc3_.id = argu14;
         _loc3_.setText(argu15);
      }
      else
      {
         _loc3_.setVisible(false);
      }
      if(argu17 != undefined && argu17 != null && argu17 != "")
      {
         btn1.setVisible(true);
         btn1.id = argu16;
         btn1.setText(argu17);
      }
      else
      {
         btn1.setVisible(false);
      }
      if(argu18 != undefined && argu18 != null && argu18 != "")
      {
         popupType5.NumCheck1_txt.text = argu18;
      }
      else
      {
         popupType5.NumCheck1_txt.text = lib.util.UIString.getUIString("$191001");
      }
      if(argu19 != undefined && argu19 != null && argu19 != "")
      {
         popupType5.NumCheck2_txt.text = argu19;
      }
      else
      {
         popupType5.NumCheck2_txt.text = lib.util.UIString.getUIString("$191002");
      }
      btn1.setEnabled(Number(popupType5.numberSteper.text) != 0 && Number(popupType5.numberSteper.text) != 0);
      if(Number(argu20) == 0)
      {
         popupType5.min_txt.textColor = 13421772;
         popupType5.min_txt.text = "$196008";
      }
      else
      {
         _loc38_ = lib.util.GoldCurrency.SetGoldText(argu20,0,0,0,_loc25_);
         popupType5.min_txt.htmlText = _loc38_;
      }
      if(Number(argu21) == 0)
      {
         popupType5.average_txt.textColor = 13421772;
         popupType5.average_txt.text = "$196013";
      }
      else
      {
         _loc39_ = lib.util.GoldCurrency.SetGoldText(argu21,0,0,0,_loc25_);
         popupType5.average_txt.htmlText = _loc39_;
      }
   }
   else if(_loc18_ == 6)
   {
      if(argu4 != undefined && argu4 != null)
      {
         var _loc20_ = [];
         var _loc22_ = argu4.split("\n");
         var _loc6_ = _loc22_.shift();
         while(_loc6_ != undefined)
         {
            var _loc2_ = _loc6_.split("\t");
            if(_loc2_[0] != undefined && _loc2_[0] != "")
            {
               _loc20_.push({id:_loc2_[0],label:_loc2_[1]});
            }
            _loc6_ = _loc22_.shift();
         }
         if(argu5 != undefined && argu5 != null)
         {
            popupType6.combobox.defaultSelect = Number(argu5);
         }
         popupType6.combobox.data = _loc20_;
      }
      if(Number(argu6) != 1)
      {
         _loc8_.setVisible(false);
      }
      else
      {
         _loc8_.setVisible(true);
         _loc8_.id = argu7;
      }
      if(argu9 != undefined && argu9 != null && argu9 != "")
      {
         _loc3_.setVisible(true);
         _loc3_.id = argu8;
         _loc3_.setText(argu9);
      }
      else
      {
         _loc3_.setVisible(false);
      }
      if(argu11 != undefined && argu11 != null && argu11 != "")
      {
         btn1.setVisible(true);
         btn1.id = argu10;
         btn1.setText(argu11);
      }
      else
      {
         btn1.setVisible(false);
      }
   }
   btnAlign(popup);
};
myListener.OnGame_Popup_Remove = function(id)
{
   var _loc1_ = lib.manager.PopupManager.getType(id);
   if(_loc1_ != 1 && _loc1_ != 0)
   {
      var _loc2_ = lib.manager.PopupManager.getPopup(id);
      if(_loc2_ != null)
      {
         Selection.setFocus(null);
         clearData(_loc2_,_loc1_);
         _loc2_._visible = false;
         UI["type" + _loc1_ + "_btn0"].setVisible(false);
         UI["type" + _loc1_ + "_btn1"].setVisible(false);
         lib.manager.PopupManager.remove(id);
      }
   }
};
myListener.OnGame_Popup_SetInputState = function(id, _state, index)
{
   var _loc1_ = Number(_state) != 1?false:true;
   sebugtx.text = sebugtx.text + ("_state  " + _state + "   index  " + index);
   var _loc2_ = lib.manager.PopupManager.getPopup(id);
   popupType5._s = _loc1_;
   switch(popUpType)
   {
      case 3:
         if(!_loc1_)
         {
            Selection.setFocus(null);
         }
         _loc2_.inputFd.selectable = _loc1_;
         break;
      case 4:
         if(!_loc1_)
         {
            Selection.setFocus(null);
            popupType4.numberSteper.right_mc.gotoAndStop(4);
            popupType4.numberSteper.left_mc.gotoAndStop(4);
            popupType4.numberSteper.min_mc.gotoAndStop(4);
            popupType4.numberSteper.max_mc.gotoAndStop(4);
         }
         popupType4.numberSteper.inputFd.selectable = _loc1_;
         popupType4.numberSteper.right_mc.enabled = _loc1_;
         popupType4.numberSteper.left_mc.enabled = _loc1_;
         popupType4.numberSteper.min_mc.enabled = _loc1_;
         popupType4.numberSteper.max_mc.enabled = _loc1_;
         break;
      case 5:
         if(Number(index) == 0)
         {
            if(!_loc1_)
            {
               Selection.setFocus(null);
               popupType5.numberSteper.right_mc.gotoAndStop(4);
               popupType5.numberSteper.left_mc.gotoAndStop(4);
               popupType5.numberSteper.min_mc.gotoAndStop(4);
               popupType5.numberSteper.max_mc.gotoAndStop(4);
            }
            popupType5.numberSteper.inputFd.type = "input";
            popupType5.GoldCurrencyInput._txt0.type = "input";
            popupType5.GoldCurrencyInput._txt1.type = "input";
            popupType5.GoldCurrencyInput._txt2.type = "input";
            popupType5.numberSteper.inputFd.selectable = _loc1_;
            popupType5.GoldCurrencyInput._txt0.selectable = _loc1_;
            popupType5.GoldCurrencyInput._txt1.selectable = _loc1_;
            popupType5.GoldCurrencyInput._txt2.selectable = _loc1_;
            popupType5.numberSteper.right_mc.enabled = _loc1_;
            popupType5.numberSteper.left_mc.enabled = _loc1_;
            popupType5.numberSteper.min_mc.enabled = _loc1_;
            popupType5.numberSteper.max_mc.enabled = _loc1_;
         }
         else
         {
            popupType5.numberSteper.inputFd.selectable = _loc1_;
            popupType5.GoldCurrencyInput._txt0.selectable = _loc1_;
            popupType5.GoldCurrencyInput._txt1.selectable = _loc1_;
            popupType5.GoldCurrencyInput._txt2.selectable = _loc1_;
            popupType5.GoldCurrencyInput.right_mc.enabled = _loc1_;
            popupType5.GoldCurrencyInput.left_mc.enabled = _loc1_;
            popupType5.GoldCurrencyInput.min_mc.enabled = _loc1_;
            popupType5.GoldCurrencyInput.max_mc.enabled = _loc1_;
            if(_loc1_)
            {
               Selection.setFocus(popupType5.numberSteper.inputFd);
               popupType5.numberSteper.inputFd.type = "input";
               popupType5.GoldCurrencyInput._txt0.type = "input";
               popupType5.GoldCurrencyInput._txt1.type = "input";
               popupType5.GoldCurrencyInput._txt2.type = "input";
            }
            else
            {
               Selection.setFocus(popupType5.GoldCurrencyInput._txt3);
               popupType5.numberSteper.inputFd.type = "dynamic";
               popupType5.GoldCurrencyInput._txt0.type = "dynamic";
               popupType5.GoldCurrencyInput._txt1.type = "dynamic";
               popupType5.GoldCurrencyInput._txt2.type = "dynamic";
               popupType5.GoldCurrencyInput.right_mc.gotoAndStop(4);
               popupType5.GoldCurrencyInput.left_mc.gotoAndStop(4);
               popupType5.GoldCurrencyInput.min_mc.gotoAndStop(4);
               popupType5.GoldCurrencyInput.max_mc.gotoAndStop(4);
            }
         }
   }
};
myListener.OnGame_Popup_SetReceiveState = function(id, _state)
{
   var _loc3_ = lib.manager.PopupManager.getPopup(id);
   recieveState = Number(_state);
   switch(popUpType)
   {
      case 3:
         popupType3.inputFd.onChanged = function()
         {
            ToGame_Popup_InputEvent(popUpID,0,this.text,this);
         };
         break;
      case 6:
         popupType6.onChanged = function()
         {
            ToGame_Popup_InputEvent(popUpID,0,arguments[2],this);
         };
         _loc3_.combobox.addListener(popupType6);
   }
};
_global.EventBroadCaster.addListener(myListener);
var type2_btn0 = popupType2.txtBtn0.txtBtn;
var type2_btn1 = popupType2.txtBtn1.txtBtn;
var type2_x = new lib.util.TxtBtn(popupType2.x_mc);
var type3_btn0 = popupType3.txtBtn0.txtBtn;
var type3_btn1 = popupType3.txtBtn1.txtBtn;
var type3_x = new lib.util.TxtBtn(popupType3.x_mc);
var type4_btn0 = popupType4.txtBtn0.txtBtn;
var type4_btn1 = popupType4.txtBtn1.txtBtn;
var type4_x = new lib.util.TxtBtn(popupType4.x_mc);
var type5_btn0 = popupType5.txtBtn0.txtBtn;
var type5_btn1 = popupType5.txtBtn1.txtBtn;
var type5_x = new lib.util.TxtBtn(popupType5.x_mc);
var type6_btn0 = popupType6.txtBtn0.txtBtn;
var type6_btn1 = popupType6.txtBtn1.txtBtn;
var type6_x = new lib.util.TxtBtn(popupType6.x_mc);
var type7_btn0 = new lib.util.TxtBtn(popupType7.txtBtn0,popupType7.btnText0);
type7_btn0.setTextColor(lib.info.TextColor.BTN_UINIQUE_NORMAL,lib.info.TextColor.BTN_UINIQUE_OVER,lib.info.TextColor.BTN_UINIQUE_PRESS,lib.info.TextColor.BTN_UINIQUE_DISABLE);
var type7_btn1 = new lib.util.TxtBtn(popupType7.txtBtn1,popupType7.btnText1);
type7_btn1.setTextColor(lib.info.TextColor.BTN_UINIQUE_NORMAL,lib.info.TextColor.BTN_UINIQUE_OVER,lib.info.TextColor.BTN_UINIQUE_PRESS,lib.info.TextColor.BTN_UINIQUE_DISABLE);
var type7_x = new lib.util.TxtBtn(popupType7.x_mc);
type2_btn0.setVisible(false);
type2_btn0.setVisible(false);
type3_btn0.setVisible(false);
type3_btn1.setVisible(false);
type4_btn0.setVisible(false);
type4_btn1.setVisible(false);
type5_btn0.setVisible(false);
type5_btn1.setVisible(false);
type6_btn0.setVisible(false);
type6_btn1.setVisible(false);
var type3_textField = new lib.util.ExtTextField(popupType3.inputFd,0,popupType3.inputFd_focus);
var type51_textField = new lib.util.ExtTextField(popupType5.inputFd1,1,popupType5.inputFd1_focus);
type2_btn0.setRelease(abc = function()
{
   released(popUpID,type2_btn0.id);
});
type2_btn1.setRelease(def = function()
{
   released(popUpID,type2_btn1.id);
});
type2_x.setRelease(type2Close = function()
{
   released(popUpID,type2_btn0.id);
});
type3_btn0.setRelease(ghi = function()
{
   released(popUpID,type3_btn0.id);
});
type3_btn1.setRelease(jkl = function()
{
   released(popUpID,type3_btn1.id);
});
type3_x.setRelease(type3Close = function()
{
   released(popUpID,type3_btn0.id);
});
type4_btn0.setRelease(mno = function()
{
   released(popUpID,type4_btn0.id);
});
type4_btn1.setRelease(pqr = function()
{
   released(popUpID,type4_btn1.id);
});
type4_x.setRelease(type4Close = function()
{
   released(popUpID,type4_btn0.id);
});
type5_btn0.setRelease(stu = function()
{
   released(popUpID,type5_btn0.id);
});
type5_btn1.setRelease(vwx = function()
{
   released(popUpID,type5_btn1.id);
});
type5_x.setRelease(type5Close = function()
{
   released(popUpID,type5_btn0.id);
});
type6_btn0.setRelease(yza = function()
{
   released(popUpID,type6_btn0.id);
});
type6_btn1.setRelease(bcd = function()
{
   released(popUpID,type6_btn1.id);
});
type6_x.setRelease(type6Close = function()
{
   released(popUpID,type6_btn0.id);
});
type7_x.setRelease(type7Close = function()
{
   released(popUpID,type7_x.id);
});
type7_btn0.setRelease(yza7 = function()
{
   released(popUpID,type7_btn0.id);
});
type7_btn1.setRelease(bcd7 = function()
{
   released(popUpID,type7_btn1.id);
});
Key.addListener(UI);
popupType4.slotName_txt.text = "";
popupType4.slotText_txt.text = "";
popupType5.slotName_txt.text = "";
popupType5.slotText_txt.text = "";
