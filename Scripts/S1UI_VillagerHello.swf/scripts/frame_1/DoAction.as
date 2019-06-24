function clearInfo()
{
   list.dialog_txt.text = "";
   for(mc in list)
   {
      if(typeof list[mc] == "movieclip")
      {
         list[mc].removeMovieClip();
      }
   }
   scrollBar.__set__pageSize(0);
}
function getKeyStr(keycode)
{
   if(keycode == undefined || keycode == 0 || keycode == "")
   {
      return "";
   }
   var _loc2_ = lib.info.KeyMap.toKeyCode(keycode);
   return _loc2_;
}
function ToGame_VillagerHello_Init()
{
   fscommand("ToGame_VillagerHello_Init");
}
function ToGame_VillagerHello_CloseUI()
{
   fscommand("ToGame_VillagerHello_CloseUI");
}
function ToGame_VillagerHello_SelectDialogBtn(id)
{
   getURL("FSCommand:ToGame_VillagerHello_SelectDialogBtn",id);
}
function ToGame_VillagerHello_SelectMenuBtn(UIName)
{
   getURL("FSCommand:ToGame_VillagerHello_SelectMenuBtn",UIName);
}
function ToGame_VillagerHello_SelectQuestBtn(id)
{
   getURL("FSCommand:ToGame_VillagerHello_SelectQuestBtn",id);
}
function ToGame_VillagerMenu_RequestShowUISelectMenu(menuName, x, y)
{
   getURL("FSCommand:ToGame_VillagerMenu_RequestShowUISelectMenu",menuName + "\t" + x + "\t" + y);
}
function giveUp()
{
   ToGame_QuestJournal_GiveUp(clickQuest);
}
function closeUI()
{
   ToGame_VillagerHello_CloseUI();
}
var UI = this;
UI._visible = false;
var UIname = "VillagerHello";
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
container_mc.text_name.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
container_mc.text_name.textAutoSize = "shrink";
var list = container_mc.contents_mc.content_mc;
var scrollBar;
var ROWSPACE = 0;
var lineHeight = 30;
var contentsHeight = container_mc.contents_mc.mask_mc._height;
scrollBar = container_mc.scrollbar1;
var listObj = {};
scrollBar.addListener(listObj);
listObj.onScroll = function()
{
   list._y = - arguments[0];
};
scrollBar.setWheel(container_mc.contents_mc);
scrollBar.wheelDelta = 3;
scrollBar.__set__pageSize(0);
scrollBar.__set__displaySize(contentsHeight - 25);
scrollBar.defaultBarSizeRatio = 0.3333333333333333;
scrollBar.__set__rowHeight(lineHeight + ROWSPACE);
scrollBar.__set__scroll(0);
bWidgetOpen = false;
var myListener = new Object();
myListener.OnGame_VillagerHello_SetTitleText = function(str)
{
   container_mc.text_name.text = str;
};
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
var btnX = -14;
var btnYGap = 3;
var attachLine = 0;
var minKeyTextW = 14;
var maxBtnTextW = 305;
var maxKeyMcW = 80;
myListener.OnGame_VillagerHello_ButtonEffect = function(type, id, effect)
{
   var _loc2_ = undefined;
   if(type == "0")
   {
      _loc2_ = list["dialog_btn" + id];
   }
   else if(type == "1")
   {
      _loc2_ = list["villagerMenu_btn" + id];
   }
   else
   {
      _loc2_ = list["quest_btn" + id];
   }
   var _loc1_ = list["effectMc" + id];
   if(effect == "0")
   {
      _loc1_.removeMovieClip();
   }
   else if(!_loc1_)
   {
      _loc1_ = list.attachMovie("effectMc","effectMc" + id,list.getNextHighestDepth());
      _loc1_._x = _loc2_._x;
      _loc1_._y = _loc2_._y;
      _loc1_.hitTestDisable = true;
   }
};
myListener.OnGame_VillagerHello_SetDialog = function(dialogText, dialogBtnData, menuBtnData, questBtnData)
{
   clearInfo();
   list.dialog_txt.htmlText = dialogText;
   lib.util.ExtString.alignJoint(list.dialog_txt);
   list.dialog_txt._height = list.dialog_txt.textHeight + 5;
   attachLine = list.dialog_txt._y + list.dialog_txt._height + 25;
   var _loc18_ = dialogBtnData.split("\n");
   if(_loc18_[_loc18_.length - 1] == "0" || _loc18_[_loc18_.length - 1] == "undefined" || _loc18_[_loc18_.length - 1] == "")
   {
      _loc18_.splice(_loc18_.length - 1,1);
   }
   if(_loc18_.length >= 1)
   {
      list.blet1_mc._visible = true;
      var _loc10_ = 0;
      while(_loc10_ < _loc18_.length)
      {
         var _loc7_ = _loc18_[_loc10_].split("\t");
         var btn = list.attachMovie("dialog_btn","dialog_btn" + _loc7_[0],list.getNextHighestDepth());
         btn._y = attachLine;
         attachLine = attachLine + (btn._height + btnYGap);
         btn._x = btnX;
         btn.id = _loc7_[0];
         var _loc5_ = _loc7_[1];
         btn.txt._x = 20;
         btn.txt._width = 373;
         var _loc9_ = _loc5_.indexOf("#");
         if(_loc9_ != -1)
         {
            var _loc16_ = getKeyStr(_loc5_.substring(_loc9_ + 1));
            _loc5_ = _loc5_.substring(0,_loc9_);
            btn.txt.text = _loc5_;
            var _loc4_ = btn.txt.textWidth + 5;
            var _loc3_ = list.attachMovie("keyMc","keyMc",list.getNextHighestDepth());
            _loc3_.btn = btn;
            _loc3_.onRollOver = function()
            {
               this.btn.onRollOver();
            };
            _loc3_.onRollOut = btn.onReleaseOutside = function()
            {
               this.btn.onRollOut();
            };
            _loc3_.onPress = function()
            {
               this.btn.onPress();
            };
            _loc3_.onRelease = function()
            {
               this.btn.onRelease();
            };
            _loc3_._y = btn._y + 13;
            _loc3_.bg.hitTestDisable = true;
            _loc3_.textFd.text = _loc16_;
            var _loc6_ = Math.max(_loc3_.textFd.textWidth + 5,minKeyTextW);
            var _loc20_ = _loc6_ - minKeyTextW;
            var _loc13_ = 20 + _loc20_;
            var _loc19_ = _loc13_ + _loc4_;
            if(_loc19_ > 385)
            {
               _loc6_ = _loc13_ <= maxKeyMcW?_loc6_:74;
               _loc4_ = _loc13_ <= maxKeyMcW?385 - _loc13_:305;
            }
            btn.txt._width = _loc4_;
            _loc3_.textFd._width = _loc6_;
            _loc3_.textFd.setText(_loc16_);
            _loc3_.bg._width = _loc6_ + 6;
            _loc3_._x = btn._x + btn.txt._x + _loc4_;
         }
         btn.txt.setText(_loc5_);
         btn.onRollOver = function()
         {
            this.gotoAndStop(2);
            this.txt.textColor = lib.info.TextColor.UI_VILLAGERDIALOG_BTN_OVER;
         };
         btn.onRollOut = btn.onReleaseOutside = function()
         {
            this.gotoAndStop(1);
            this.txt.textColor = lib.info.TextColor.UI_VILLAGERDIALOG_BTN_NORMAL;
            this.txt._y = 11;
         };
         btn.onPress = function()
         {
            this.gotoAndStop(3);
            this.txt.textColor = lib.info.TextColor.UI_VILLAGERDIALOG_BTN_PRESS;
            this.txt._y = 12;
         };
         btn.onRelease = function()
         {
            ToGame_VillagerHello_SelectDialogBtn(this.id);
            this.txt.textColor = lib.info.TextColor.UI_VILLAGERDIALOG_BTN_OVER;
            this.txt._y = 11;
         };
         _loc10_ = _loc10_ + 1;
      }
      list.blet1_mc._y = attachLine + 7;
      attachLine = list.blet1_mc._y + list.blet1_mc._height + 9;
   }
   else
   {
      list.blet1_mc._visible = false;
   }
   var _loc15_ = menuBtnData.split("\n");
   if(_loc15_[_loc15_.length - 1] == "0" || _loc15_[_loc15_.length - 1] == "undefined" || _loc15_[_loc15_.length - 1] == "")
   {
      _loc15_.splice(_loc15_.length - 1,1);
   }
   if(_loc15_.length >= 1)
   {
      list.blet2_mc._visible = true;
      _loc10_ = 0;
      while(_loc10_ < _loc15_.length)
      {
         _loc7_ = _loc15_[_loc10_].split("\t");
         var btn = list.attachMovie("villagerMenu_btn","villagerMenu_btn" + _loc7_[0],list.getNextHighestDepth());
         btn._y = attachLine;
         attachLine = attachLine + (btn._height + btnYGap);
         btn._x = btnX;
         btn.id = _loc7_[0];
         btn.txt._x = 20;
         btn.txt._width = 373;
         _loc5_ = _loc7_[1];
         _loc9_ = _loc5_.indexOf("#");
         if(_loc9_ != -1)
         {
            _loc16_ = getKeyStr(_loc5_.substring(_loc9_ + 1));
            _loc5_ = _loc5_.substring(0,_loc9_);
            btn.txt.text = _loc5_;
            _loc4_ = btn.txt.textWidth + 5;
            _loc3_ = list.attachMovie("keyMc","keyMc",list.getNextHighestDepth());
            _loc3_._y = btn._y + 13;
            _loc3_.btn = btn;
            _loc3_.onRollOver = function()
            {
               this.btn.onRollOver();
            };
            _loc3_.onRollOut = btn.onReleaseOutside = function()
            {
               this.btn.onRollOut();
            };
            _loc3_.onPress = function()
            {
               this.btn.onPress();
            };
            _loc3_.onRelease = function()
            {
               this.btn.onRelease();
            };
            _loc3_._y = btn._y + 13;
            _loc3_.bg.hitTestDisable = true;
            _loc3_.textFd.text = _loc16_;
            _loc6_ = Math.max(_loc3_.textFd.textWidth + 5,minKeyTextW);
            _loc20_ = _loc6_ - minKeyTextW;
            _loc13_ = 20 + _loc20_;
            _loc19_ = _loc13_ + _loc4_;
            if(_loc19_ > 385)
            {
               _loc6_ = _loc13_ <= maxKeyMcW?_loc6_:74;
               _loc4_ = _loc13_ <= maxKeyMcW?385 - _loc13_:305;
            }
            btn.txt._width = _loc4_;
            _loc3_.textFd._width = _loc6_;
            _loc3_.textFd.setText(_loc16_);
            _loc3_.bg._width = _loc6_ + 6;
            _loc3_._x = btn._x + btn.txt._x + _loc4_;
         }
         btn.txt.setText(_loc5_);
         btn.onRollOver = function()
         {
            this.gotoAndStop(2);
            this.txt.textColor = lib.info.TextColor.UI_VILLAGERDIALOG_BTN_OVER;
         };
         btn.onRollOut = btn.onReleaseOutside = function()
         {
            this.gotoAndStop(1);
            this.txt.textColor = lib.info.TextColor.UI_VILLAGERDIALOG_BTN_NORMAL;
            this.txt._y = 11;
         };
         btn.onPress = function()
         {
            this.gotoAndStop(3);
            this.txt.textColor = lib.info.TextColor.UI_VILLAGERDIALOG_BTN_PRESS;
            this.txt._y = 12;
         };
         btn.onRelease = function()
         {
            this.txt.textColor = lib.info.TextColor.UI_VILLAGERDIALOG_BTN_OVER;
            this.txt._y = 11;
            openedUI = this.id;
            _root.currentNpcMenu = openedUI;
            ToGame_VillagerMenu_RequestShowUISelectMenu(this.id);
            ToGame_VillagerHello_SelectMenuBtn(this.id);
         };
         _loc10_ = _loc10_ + 1;
      }
      list.blet2_mc._y = attachLine + 7;
      attachLine = list.blet2_mc._y + list.blet2_mc._height + 9;
   }
   else
   {
      list.blet2_mc._visible = false;
   }
   if(_loc15_.length == 0)
   {
      list.blet1_mc._visible = false;
   }
   var _loc17_ = questBtnData.split("\n");
   if(_loc17_[_loc17_.length - 1] == "0" || _loc17_[_loc17_.length - 1] == "undefined" || _loc17_[_loc17_.length - 1] == "")
   {
      _loc17_.splice(_loc17_.length - 1,1);
   }
   if(_loc17_.length >= 1)
   {
      _loc10_ = 0;
      while(_loc10_ < _loc17_.length)
      {
         _loc7_ = _loc17_[_loc10_].split("\t");
         var btn = list.attachMovie("quest_btn","quest_btn" + _loc7_[0],list.getNextHighestDepth());
         btn._y = attachLine;
         attachLine = attachLine + (btn._height + btnYGap);
         btn._x = btnX;
         btn.id = _loc7_[0];
         var _loc11_ = Number(_loc7_[2]);
         if(_loc11_ == 0)
         {
            btn.questSymbol_mc.gotoAndStop(100);
            var _loc14_ = new TextFormat();
            _loc14_.align = "center";
            btn.txt.setTextFormat(_loc14_);
            btn.txt._x = 20;
         }
         else
         {
            btn.questSymbol_mc.gotoAndStop(_loc11_);
         }
         _loc5_ = _loc7_[1];
         _loc9_ = _loc5_.indexOf("#");
         if(_loc9_ != -1)
         {
            _loc16_ = getKeyStr(_loc5_.substring(_loc9_ + 1));
            _loc5_ = _loc5_.substring(0,_loc9_);
            btn.txt.text = _loc5_;
            _loc4_ = btn.txt.textWidth + 5;
            _loc3_ = list.attachMovie("keyMc","keyMc_0",list.getNextHighestDepth());
            _loc3_.btn = btn;
            _loc3_.onRollOver = function()
            {
               this.btn.onRollOver();
            };
            _loc3_.onRollOut = btn.onReleaseOutside = function()
            {
               this.btn.onRollOut();
            };
            _loc3_.onPress = function()
            {
               this.btn.onPress();
            };
            _loc3_.onRelease = function()
            {
               this.btn.onRelease();
            };
            _loc3_._y = btn._y + 13;
            _loc3_.bg.hitTestDisable = true;
            _loc3_.textFd.text = _loc16_;
            _loc6_ = Math.max(_loc3_.textFd.textWidth + 5,minKeyTextW);
            _loc20_ = _loc6_ - minKeyTextW;
            _loc13_ = 20 + _loc20_;
            _loc19_ = _loc13_ + _loc4_;
            var _loc8_ = _loc11_ != 0?355:375;
            if(_loc19_ > _loc8_)
            {
               var _loc12_ = _loc8_ - maxKeyMcW;
               if(_loc4_ > _loc12_)
               {
                  if(_loc13_ > maxKeyMcW)
                  {
                     _loc6_ = 74;
                     _loc4_ = _loc12_;
                  }
                  else
                  {
                     _loc4_ = _loc8_ - _loc6_ - 6;
                  }
               }
               else
               {
                  _loc6_ = _loc8_ - _loc4_ - 6;
               }
            }
            btn.txt._width = _loc4_;
            _loc3_.textFd._width = _loc6_;
            _loc3_.textFd.setText(_loc16_);
            _loc3_.bg._width = _loc6_ + 6;
            _loc3_._x = btn._x + btn.txt._x + _loc4_;
         }
         btn.txt.setText(_loc5_);
         btn.onRollOver = function()
         {
            this.gotoAndStop(2);
            this.txt.textColor = lib.info.TextColor.UI_VILLAGERDIALOG_BTN_OVER;
         };
         btn.onRollOut = btn.onReleaseOutside = function()
         {
            this.gotoAndStop(1);
            this.txt.textColor = lib.info.TextColor.UI_VILLAGERDIALOG_BTN_NORMAL;
            this.txt._y = 11;
         };
         btn.onPress = function()
         {
            this.gotoAndStop(3);
            this.txt.textColor = lib.info.TextColor.UI_VILLAGERDIALOG_BTN_PRESS;
            this.txt._y = 12;
         };
         btn.onRelease = function()
         {
            ToGame_VillagerHello_SelectQuestBtn(this.id);
            this.txt.textColor = lib.info.TextColor.UI_VILLAGERDIALOG_BTN_OVER;
            this.txt._y = 11;
         };
         _loc10_ = _loc10_ + 1;
      }
   }
   scrollBar.__set__pageSize(list._height);
};
_root.OnGameEvent("OnGame_VillagerHello_SetDialog","가나다라\r마바사아...","0\t자네 내말을 좀 더 들어보겠나?\n1\t대도시로 가는길을 알고싶나?","StoreWindow\t상점\nParcelPost\t소포\nErrandLog\t구매대행기록\nChapterHouse\t집회소\nWarehouseWindow\t창고\nVillagerDialog\t대사창","100\t퀘스트버튼0\t1\n200\t퀘스트버튼1\t2\n300\t퀘스트버튼2\t3\n400\t퀘스트버튼3\t4\n500\t퀘스트버튼4\t5\n600\t퀘스트버튼5\t6");
_global.EventBroadCaster.addListener(myListener);
var giveUp_btn = new lib.util.TxtAniBtn(container_mc.giveUp_mc,container_mc.giveUp_txt,20,27,33,43);
var close_btn = new lib.util.TxtAniBtn(container_mc.close_mc,container_mc.close_txt,20,27,33,43);
var x_btn = new lib.util.TxtBtn(container_mc.x_mc);
giveUp_btn.setEnabled(false);
learn_btn.setRelease(sendBack);
giveUp_btn.setRelease(giveUp);
close_btn.setRelease(closeUI);
x_btn.setRelease(closeUI);
detail._visible = false;
fscommand("ToGame_VillagerHello_Init");
