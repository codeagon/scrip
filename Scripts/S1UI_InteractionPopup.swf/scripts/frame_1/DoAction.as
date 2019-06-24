function releaseBtn0()
{
   ToGame_Popup_Event(popup.id,popup.btn0Id);
}
function releaseBtn1()
{
   ToGame_Popup_Event(popup.id,popup.btn1Id);
}
function setPosition(target)
{
   target._x = lib.info.AlignInfo.zeroPointX + lib.info.AlignInfo.onePercentPixelW * 50;
   target._y = lib.info.AlignInfo.zeroPointY + lib.info.AlignInfo.onePercentPixelH * 45;
   if(target.diePopup != true)
   {
      com.bluehole.tera.managers.LayoutManager.setUIPosition(target,5,50,50);
   }
   else
   {
      lib.manager.UISkin.drawBg("revive",popup.bg);
      target._x = target._x - lib.manager.UISkin.NORMALPOPUP_WIDTH / 2 * lib.info.AlignInfo.scaleRatio;
      target._y = target._y - lib.manager.UISkin.NORMALPOPUP_HEIGHT / 2 * lib.info.AlignInfo.scaleRatio;
   }
   target._visible = true;
}
function ProcessPopupDepth(targetContainer)
{
   var _loc2_ = null;
   var _loc3_ = undefined;
   var _loc4_ = false;
   var _loc5_ = new Array();
   for(var _loc6_ in popup_array)
   {
      win = popup_array[_loc6_];
      if(win.hit.hitTest(_root._xmouse,_root._ymouse,true) && win._visible == true)
      {
         _loc4_ = true;
         _loc5_.push(win);
         if(_loc2_ == null)
         {
            _loc2_ = win.getDepth();
            _loc3_ = win;
         }
         else if(win.getDepth() > _loc2_)
         {
            _loc2_ = win.getDepth();
            _loc3_ = win;
         }
      }
   }
   _loc3_.swapDepths(targetContainer.getNextHighestDepth());
   return _loc4_;
}
function ToGame_Popup_Event(popupID, id)
{
   if(popup.txt_mc.checkBtn1._visible == false || popup.txt_mc.checkBtn1 == undefined)
   {
      getURL("FSCommand:ToGame_Popup_Event",popupID + "\t" + id);
   }
   else if(popup.txt_mc.checkBtn1._visible == true)
   {
      var _loc1_ = popup.txt_mc.checkBtn1.checked;
      getURL("FSCommand:ToGame_Popup_Event",popupID + "\t" + id + "\t" + _loc1_);
   }
}
function btnAlign(tg)
{
   if(!tg.txtBtn1.btn._visible)
   {
      tg.txtBtn0._x = 153;
   }
   else
   {
      tg.txtBtn0._x = 238;
   }
   if(!tg.txtBtn0.btn._visible)
   {
      tg.txtBtn1._x = 153;
   }
   else
   {
      tg.txtBtn1._x = 85;
   }
}
function setToggle(mc, str, type, tooltip)
{
   lib.Debuger.trace("str : " + str + ", type : " + type + ", tooltip : " + tooltip);
   mc.selected._visible = false;
   mc.setDisabled = function(bFlag)
   {
      if(bFlag)
      {
         mc.txt.textColor = BUTTON_TEXT_COLOR[BUTTON_STATE_DISABLE - 1];
         this.gotoAndStop(BUTTON_STATE_DISABLE);
      }
      else
      {
         mc.txt.textColor = BUTTON_TEXT_COLOR[BUTTON_STATE_NORMAL - 1];
         this.gotoAndStop(BUTTON_STATE_NORMAL);
      }
   };
   mc.isDisable = function()
   {
      return BUTTON_STATE_DISABLE == mc._currentframe;
   };
   mc.isReleased = function()
   {
      return BUTTON_STATE_RELEASE == mc._currentframe;
   };
   mc.onRollOver = function()
   {
      if(this.isDisable() || this.isReleased())
      {
         return undefined;
      }
      mc.txt.textColor = BUTTON_TEXT_COLOR[BUTTON_STATE_OVER - 1];
      mc.gotoAndStop(BUTTON_STATE_OVER);
   };
   mc.onRollOut = mc.onReleaseOutside = function()
   {
      if(this.isDisable() || this.isReleased())
      {
         return undefined;
      }
      mc.txt.textColor = BUTTON_TEXT_COLOR[BUTTON_STATE_NORMAL - 1];
      mc.gotoAndStop(BUTTON_STATE_NORMAL);
   };
   mc.onRelease = function()
   {
      if(this.isDisable() || this.isReleased())
      {
         return undefined;
      }
      var _loc3_ = (mc.idx + 1) % 2;
      var _loc2_ = this._parent["button" + _loc3_];
      _loc2_.txt.textColor = BUTTON_TEXT_COLOR[BUTTON_STATE_NORMAL - 1];
      _loc2_.gotoAndStop(BUTTON_STATE_NORMAL);
      _loc2_.selected._visible = false;
      mc.txt.textColor = BUTTON_TEXT_COLOR[BUTTON_STATE_RELEASE - 1];
      mc.gotoAndStop(BUTTON_STATE_RELEASE);
      mc.selected._visible = true;
      ToGame_Popup_SelectResurrect(this.idx);
   };
   if(tooltip)
   {
      lib.manager.ToolTip.add(mc,tooltip,1);
   }
   else
   {
      lib.manager.ToolTip.remove(mc);
   }
   mc.setDisabled(!Boolean(Number(type)));
   mc.txt.text = str;
}
function ToGame_Popup_SelectResurrect(selectedIdx)
{
   getURL("FSCommand:ToGame_Popup_SelectResurrect",selectedIdx);
}
var UI = this;
var UIname = "InteractionPopup";
var popup = null;
var popup_array = new Array();
var popupId_array = new Array();
var popupCnt = 0;
var deathPopupId = undefined;
popup.txt_mc.checkBtn1._visible = false;
popMc.txt_mc.checkBtn1._visible = false;
var popup_check = false;
var popup_htmlcheck = false;
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
myListener.OnGame_Popup_DisableBtnFocus = function(id)
{
   if(id == "" || id == undefined)
   {
      return undefined;
   }
   var _loc3_ = lib.manager.PopupManager.getType(id);
   if(_loc3_ == 1)
   {
      var _loc2_ = lib.manager.PopupManager.getPopup(id);
      _loc2_.disableFocus = true;
      _loc2_.firstFocus = undefined;
      Selection.setFocus(null);
   }
};
myListener.OnGame_Popup_Create = function(type, argu1, argu2, argu3, argu4, argu5, argu6, argu7, argu8, argu9, argu10, argu11, argu12, argu13, argu14)
{
   var _loc6_ = undefined;
   popup_check = false;
   _loc6_ = argu3.indexOf("<br>");
   if(_loc6_ == -1)
   {
      popup_htmlcheck = false;
   }
   else
   {
      popup_htmlcheck = true;
   }
   if(type == 1)
   {
      type = Number(type);
      if(popup.diePopup != true)
      {
         _root.OnGameEvent("OnGame_Popup_Remove",popup.id);
      }
      if(Number(argu12) == 0 || argu12 == undefined)
      {
         popupCnt = UI.getNextHighestDepth();
         popup = UI.attachMovie("interactionPopup","interactionPopup" + argu1,popupCnt,{_visible:false});
         popup.txt_mc.message_txt.textColor = lib.info.TextColor.GENERAL_CONTENTS;
         popup.count_txt.textColor = lib.info.TextColor.GENERAL_CONTENTS;
         popup._xscale = popup._yscale = lib.info.AlignInfo.scaleRatio * 100;
         UI.onEnterFrame = function()
         {
            if(popup.UIDrager.save != undefined)
            {
               popup.UIDrager.setData("interactionPopup" + argu1,popup);
               delete this.onEnterFrame;
            }
         };
         popup.id = argu1;
         lib.manager.PopupManager.add(argu1,type,popup);
         popup.x_btn = new lib.util.TxtBtn(popup.x_mc);
         popup.btn0.setVisible(false);
         popup.btn1.setVisible(false);
         popup.txtBtn0.onEnterFrame = function()
         {
            if(this.txt != undefined && this._parent.txtBtn1.txt != undefined)
            {
               popup.loaded = true;
               popup.btn0 = popup.txtBtn0.txtBtn;
               popup.btn1 = popup.txtBtn1.txtBtn;
               myListener.OnGame_Popup_Update(argu1,argu2,argu3,argu4,argu5,argu6,argu7,argu8,argu9,argu10,argu11,argu12,argu13,argu14);
               var id = popup.id;
               var btn0Id = popup.btn0Id;
               var btn1Id = popup.btn1Id;
               popup.btn0.setRelease(function()
               {
                  ToGame_Popup_Event(id,btn0Id);
               }
               );
               popup.btn1.setRelease(function()
               {
                  ToGame_Popup_Event(id,btn1Id);
               }
               );
               lib.manager.Focus.addFocusGroup(UIname,1,[popup.txtBtn1.btn,popup.txtBtn0.btn]);
               if(popup.btn0.btn._visible && popup.btn1.btn._visible)
               {
                  if(popup.disableFocus != true)
                  {
                     popup.firstFocus = popup.txtBtn1.btn;
                     Selection.setFocus(popup.txtBtn1.btn);
                  }
               }
               else if(!popup.btn0.btn._visible && popup.btn1.btn._visible)
               {
                  if(popup.disableFocus != true)
                  {
                     popup.firstFocus = popup.txtBtn1.btn;
                     Selection.setFocus(popup.txtBtn1.btn);
                  }
               }
               else if(popup.btn0.btn._visible && !popup.btn1.btn._visible)
               {
                  if(popup.disableFocus != true)
                  {
                     popup.firstFocus = popup.txtBtn0.btn;
                     Selection.setFocus(popup.txtBtn0.btn);
                  }
               }
               delete this.onEnterFrame;
            }
            popup.txt_mc.checkBtn1._visible = false;
            if(argu13 != "1")
            {
               popup.txt_mc.checkBtn1._visible = false;
            }
            else if(argu13 == "1")
            {
               popup.txt_mc.checkBtn1._visible = true;
               var _loc2_ = popup.txt_mc.message_txt;
               var _loc3_ = _loc2_.getLineMetrics(_loc2_.numLines - 1);
               popup.txt_mc.checkBtn1._y = _loc2_._y + _loc2_.textHeight - 16;
               popup.txt_mc.checkBtn1._x = _loc2_._x + _loc3_.x + _loc3_.width + 6;
               popup.txt_mc.checkBtn1.checked = Boolean(Number(argu14));
               popup_check = Boolean(Number(argu14));
            }
            popup.x_btn.btn.pop = popup;
            popup.x_btn.btn.onRelease2 = function()
            {
               ToGame_Popup_Event(this.pop.id,this._parent.btn0Id);
            };
            popup_array.push(popup);
            popupId_array.push(argu1);
            setPosition(popup);
         };
      }
      else if(Number(argu12) == 1)
      {
         popupCnt = UI.getNextHighestDepth();
         popup = UI.attachMovie("deathCheckPopup","interactionPopup" + argu1,popupCnt);
         popup._xscale = popup._yscale = lib.info.AlignInfo.scaleRatio * 100;
         popup.diePopup = true;
         UI.onEnterFrame = function()
         {
            if(popup.UIDrager.save != undefined)
            {
               popup.UIDrager.setData("interactionPopup" + argu1,popup);
               delete this.onEnterFrame;
            }
         };
         popup.id = argu1;
         deathPopupId = argu1;
         _root.die = true;
         lib.manager.PopupManager.add(argu1,type,popup);
         popup.x_btn = new lib.util.TxtBtn(popup.x_mc);
         popup.btn0.setVisible = function(flag)
         {
            popup.btn0._visible = flag;
         };
         popup.btn0.setText = function(str)
         {
            popup.btn0.labelTxt = str;
         };
         popup.btn0.setVisible(false);
         popup.btn0.pop = popup;
         popup.btn0.onRelease = function()
         {
            this.gotoAndStop(2);
            ToGame_Popup_Event(this.pop.id,this._parent.btn0Id);
         };
         popup.btn0.onRollOver = function()
         {
            this.gotoAndStop(2);
         };
         popup.btn0.onRollOut = popup.btn0.onReleaseOutside = function()
         {
            this.gotoAndStop(1);
         };
         popup.btn0.onPress = function()
         {
            this.gotoAndStop(3);
         };
         myListener.OnGame_Popup_Update(argu1,argu2,argu3,argu4,argu5,argu6,argu7,argu8,argu9,argu10,argu11);
         popup_array.push(popup);
         popupId_array.push(argu1);
         setPosition(popup);
         lib.manager.Focus.addFocusGroup(UIname,1,[popup.txtBtn1.btn,popup.txtBtn0.btn]);
         if(popup.btn0.btn._visible && popup.btn1.btn._visible)
         {
            if(popup.disableFocus != true)
            {
               popup.firstFocus = popup.txtBtn1.btn;
               Selection.setFocus(popup.txtBtn1.btn);
            }
         }
         else if(!popup.btn0.btn._visible && popup.btn1.btn._visible)
         {
            if(popup.disableFocus != true)
            {
               popup.firstFocus = popup.txtBtn1.btn;
               Selection.setFocus(popup.txtBtn1.btn);
            }
         }
         else if(popup.btn0.btn._visible && !popup.btn1.btn._visible)
         {
            if(popup.disableFocus != true)
            {
               popup.firstFocus = popup.txtBtn0.btn;
               Selection.setFocus(popup.txtBtn0.btn);
            }
         }
      }
      btnAlign(popup);
   }
};
myListener.OnGame_Popup_Update = function(argu1, argu2, argu3, argu4, argu5, argu6, argu7, argu8, argu9, argu10, argu11, argu12, argu13, argu14)
{
   if(lib.manager.PopupManager.getType(argu1) != 1)
   {
      return undefined;
   }
   var popup = lib.manager.PopupManager.getPopup(argu1);
   popup.title_txt.text = argu2;
   popup.txt_mc.message_txt.verticalAlign = "center";
   popup.txt_mc.message_txt.htmlText = argu3;
   if(!popup.diePopup)
   {
      if(popup.txt_mc.message_txt.textHeight > 85)
      {
         var _loc2_ = popup.txt_mc.message_txt.textHeight - 90;
         popup.txt_mc.message_txt._height = 95 + _loc2_;
         popup.count_txt._y = 152.5 + _loc2_;
         popup.bg._height = 237 + _loc2_;
         popup.txtBtn1._y = 186 + _loc2_;
         popup.txtBtn0._y = 186 + _loc2_;
      }
      else
      {
         popup.txt_mc.message_txt._height = 91;
         popup.count_txt._y = 152.5;
         popup.bg._height = 237;
         popup.txtBtn1._y = 186;
         popup.txtBtn0._y = 186;
      }
   }
   if(Number(argu6) != 1)
   {
      popup.x_btn.setVisible(false);
   }
   else
   {
      popup.x_btn.setVisible(true);
      popup.xId = argu7;
   }
   if(argu4 != undefined && argu4 != null && argu4 != "" && argu4 != Number(0))
   {
      delete popup.onEnterFrame;
      var _loc9_ = Number(argu4);
      popup.totalTime = Number(_loc9_) * 1000;
      popup.startedTime = getTimer();
      popup.aimTime = popup.startedTime + popup.totalTime;
      var _loc10_ = popup.aimTime;
      popup.count_txt.htmlText = argu5;
      popup.onEnterFrame = function()
      {
         var _loc3_ = getTimer();
         var _loc4_ = String(Math.ceil((popup.aimTime - _loc3_) / 1000));
         var _loc2_ = lib.util.ExtString.replace(argu5,"{sec}","<font color=\'#" + lib.info.TextColor.GENERAL_EMPHASIS.toString(16) + "\'>" + _loc4_ + "</font>");
         popup.count_txt.htmlText = _loc2_;
         if(popup.aimTime <= _loc3_)
         {
            _loc2_ = lib.util.ExtString.replace(argu5,"{sec}","<font color=\'#" + lib.info.TextColor.GENERAL_EMPHASIS.toString(16) + "\'>" + "0" + "</font>");
            popup.count_txt.htmlText = _loc2_;
            delete this.onEnterFrame;
         }
      };
   }
   else
   {
      delete popup.onEnterFrame;
      popup.count_txt.text = "";
   }
   if(argu9 != undefined && argu9 != null && argu9 != "")
   {
      popup.btn0.setVisible(true);
      popup.btn0Id = argu8;
      popup.btn0.setText(argu9);
   }
   else
   {
      popup.btn0.setVisible(false);
   }
   if(argu11 != undefined && argu11 != null && argu11 != "")
   {
      popup.btn1.setVisible(true);
      popup.btn1Id = argu10;
      popup.btn1.setText(argu11);
   }
   else
   {
      popup.btn1.setVisible(false);
   }
   btnAlign(popup);
};
myListener.OnGame_Popup_Remove = function(id)
{
   if(id == deathPopupId)
   {
      deathPopupId = undefined;
      _root.die = false;
   }
   var _loc4_ = lib.manager.PopupManager.getType(id);
   if(_loc4_ == 1)
   {
      var _loc2_ = 0;
      while(_loc2_ < popupId_array.length)
      {
         if(popupId_array[_loc2_] == id)
         {
            popup_array.splice(_loc2_,1);
            popupId_array.splice(_loc2_,1);
            Selection.setFocus(null);
         }
         _loc2_ = _loc2_ + 1;
      }
      lib.manager.PopupManager.remove(id);
   }
};
myListener.OnGame_MouseDown = function(button, target)
{
   ProcessPopupDepth(UI);
};
_global.EventBroadCaster.addListener(myListener);
btn0.onPress = function()
{
   _root.OnGameEvent("OnGame_Popup_Create","1","1002","Confirmation","Use this item? This process removes one <a href=\'asfunction:chatLinkAction,1#####183464\'><FONT color=\'#FFFFFF\'>&lt;Elite Status Voucher (360-day)&gt;</FONT></a> from your inventory. To proceed, check the confirmation box on the right, then click \'Confirm\' below.","0","Automatically completes in {sec} sec.","1","2","0","Cancel","1","Confirm","0","1","0");
   myListener.OnGame_Popup_DisableBtnFocus();
};
btn1.onPress = function()
{
   myListener.OnGame_Popup_ResurrectMenu("변경0\t1\n변경1\t1\n변경2\t1\n변경3\t1",0);
};
btn2.onPress = function()
{
   myListener.OnGame_Popup_ResurrectMenu("내용0\t1\n내용1\t1\n내용2\t1",2);
};
btn3.onPress = function()
{
   _root.OnGameEvent("OnGame_Popup_Create","1","1002","확인","30분 후에 자동으로 부활합니다.<br>지금 부활하시겠습니까?","0","3초 후 자동 완료 됩니다","0","2","1","지금 부활","0","","1","0","0");
   myListener.OnGame_Popup_ResurrectMenu("이재모0\t1\t툴팁툴팁1\n이재모1\t1\t툴팁툴팁2\n이재모2\t1\n이재모3\t1");
};
btn4.onPress = function()
{
   myListener.OnGame_Popup_Update("1002","확인","<font color=\'#CCCCCC\' size=\'16\'>잠시 후 아래 선택한 장소에서 자동으로 부활합니다.</font><br><font color=\'#FFFFFF\' size=\'18\'>부활까지 남은 시간</font><br><font color=\'#FF0000\' size=\'20\'>30</font><font color=\'#FFFFFF\' size=\'20\'>초</font>","0","","0","2","0","","1","","1",0,0);
};
btn5.onPress = function()
{
   myListener.OnGame_Popup_Update("1002","확인","<font color=\'#CCCCCC\' size=\'16\'>잠시 후<br> 아래 선택한<br> 장소에서 자동으로<br> 부활합니다.</font><br><font color=\'#FFFFFF\' size=\'18\'>부활까지 남은 시간</font><br><font color=\'#FF0000\' size=\'20\'>30</font><font color=\'#FFFFFF\' size=\'20\'>초</font>","0","","0","2","0","","1","","1",0,0);
};
var BUTTON_STATE_NORMAL = 1;
var BUTTON_STATE_OVER = 2;
var BUTTON_STATE_RELEASE = 3;
var BUTTON_STATE_DISABLE = 4;
var BUTTON_TEXT_COLOR = [16766015,16772264,16766015,7368816];
myListener.OnGame_Popup_ResurrectMenu = function(strData, num)
{
   if(!popup.diePopup)
   {
      return undefined;
   }
   lib.util.DrawBitmap.clear(popup.bg);
   var _loc7_ = flash.display.BitmapData.loadBitmap("siegeWarDeathBg");
   var _loc6_ = popup.bg.createEmptyMovieClip("siegeWarDeathBg",1);
   _loc6_.attachBitmap(_loc7_,1,"auto",true);
   var _loc5_ = popup.siegeWarButton;
   if(!_loc5_)
   {
      _loc5_ = popup.attachMovie("siegeWarButton","siegeWarButton",popup.getNextHighestDepth());
   }
   popup.UIDrager._height = 650;
   var dataValue = lib.util.ExtString.split(strData,"\n");
   var len = dataValue.length;
   _loc5_.onEnterFrame = function()
   {
      delete this.onEnterFrame;
      var _loc2_ = 0;
      while(_loc2_ < len)
      {
         var _loc4_ = lib.util.ExtString.split(dataValue[_loc2_],"\t");
         var _loc3_ = this["button" + _loc2_];
         _loc3_.idx = _loc2_;
         mc.idx = _loc2_;
         setToggle(_loc3_,_loc4_[0],_loc4_[1],_loc4_[2]);
         if(_loc2_ == num)
         {
            _loc3_.gotoAndStop(BUTTON_STATE_RELEASE);
            _loc3_.selected._visible = true;
         }
         _loc2_ = _loc2_ + 1;
      }
   };
};
