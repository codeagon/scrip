function getKeyStr(keycode)
{
   if(keycode == undefined || keycode == 0 || keycode == "")
   {
      return "";
   }
   var _loc2_ = lib.info.KeyMap.toKeyCode(keycode);
   return _loc2_;
}
function slotHandlerRelease($target)
{
   getURL("FSCommand:ToGame_VillagerDialog_SelectItem",selectRequitalItemList.selectedSlot.id);
}
function checkApplyEnable()
{
   if(allRead)
   {
      if(requitalSelect)
      {
         if(selectRequitalItemList.selectedSlot != null)
         {
            apply_btn.setEnabled(true);
         }
         else
         {
            apply_btn.setEnabled(false,100);
         }
      }
      else
      {
         apply_btn.setEnabled(true);
      }
   }
}
function clearInformation()
{
   allRead = false;
   list.dialog_txt.text = "";
   list.questName_txt.text = "";
   list.nameBg_mc._visible = false;
   baseRequitalItemList.clear();
   repeatRequitalItemList.clear();
   selectRequitalItemList.clear();
   AddRequitalItemDataList.clear();
   baseRequitalItemList.gold = 0;
   repeatRequitalItemList.gold = 0;
   selectRequitalItemList.gold = 0;
   AddRequitalItemDataList.gold = 0;
   for(mc in list)
   {
      if(typeof list[mc] == "movieclip")
      {
         if(list[mc]._name != "slots_mc" && list[mc]._name != "slots2_mc")
         {
            list[mc].removeMovieClip();
         }
      }
   }
   selectRequitalItemList.selectedSlot = null;
   scrollBar.__set__pageSize(0);
   requitalSelect = null;
}
function ToGame_VillagerDialog_SelectBtn(btnId)
{
   getURL("FSCommand:ToGame_VillagerDialog_SelectBtn",btnId);
}
function ToGame_VillagerDialog_CloseUI()
{
   fscommand("ToGame_VillagerDialog_CloseUI");
}
function ToGame_VillagerDialog_SelectApply()
{
   if(requitalSelect)
   {
      if(selectRequitalItemList.selectedSlot != null)
      {
         getURL("FSCommand:ToGame_VillagerDialog_SelectApply",selectRequitalItemList.selectedSlot.id);
      }
   }
   else
   {
      fscommand("ToGame_VillagerDialog_SelectApply");
   }
}
function ToGame_RewardItem_RequestPreview(id)
{
   getURL("FSCommand:ToGame_RewardItem_RequestPreview",id);
}
function preViewEvent(_targetMc)
{
   var _loc2_ = _targetMc.SLOT;
   _loc2_.onRollOver = function()
   {
      myListener.OnGame_MouseDown = function(button)
      {
         if(button == 2 && _global.control)
         {
            var _loc3_ = "";
            var _loc2_ = _targetMc.img.split("__");
            if(_loc2_.length > 1)
            {
               _loc3_ = _loc2_[1];
            }
            ToGame_RewardItem_RequestPreview(_loc3_);
         }
      };
   };
   _loc2_.onRollOut = _loc2_.onReleaseOutside = function()
   {
      myListener.OnGame_MouseDown = null;
   };
}
function SetMultiply(_targetMc, _num)
{
   if(_num > 1)
   {
      _targetMc._visible = true;
      _targetMc.txt.textAutoSize = "shrink";
      _targetMc.txt.htmlText = "<img src=\'multIcon\' vspace=\'-2\'>" + _num;
   }
   else
   {
      _targetMc._visible = false;
   }
}
function closeUI()
{
   ToGame_VillagerDialog_CloseUI();
}
var UI = this;
UI._visible = false;
var UIname = "VillagerDialog";
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
container_mc.text_name.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
container_mc.text_name.textAutoSize = "shrink";
var completeStr = lib.util.UIString.getUIString("$181018");
var bWidgetOpen = false;
var allRead = false;
var readY = 0;
var btnX = -14;
var btnYGap = 2;
var attachLine = 0;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
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
   if(scrollBar.__get__scroll() != 0 && scrollBar.__get__scrollMax() != 0)
   {
      if(list._y <= 575 - readY)
      {
         allRead = true;
         container_mc.doScroll_mc.gotoAndStop(1);
      }
      checkApplyEnable();
   }
};
scrollBar.setWheel(container_mc.contents_mc);
scrollBar.wheelDelta = 3;
scrollBar.__set__pageSize(0);
scrollBar.__set__displaySize(contentsHeight - 25);
scrollBar.__set__rowHeight(lineHeight + ROWSPACE);
scrollBar.__set__scroll(0);
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
         container_mc.doScroll_mc.gotoAndStop(1);
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
myListener.OnGame_VillagerDialog_SetTitleText = function(str)
{
   container_mc.text_name.text = str;
};
myListener.OnGame_VillagerDialog_CreateApplyBtn = function(bTrue, applyBtnStr)
{
   bTrue = Number(bTrue);
   if(bTrue)
   {
      var _loc10_ = container_mc.applyBtn;
      var _loc8_ = _loc10_.keyMc;
      if(_loc8_ != undefined)
      {
         _loc8_.removeMovieClip();
      }
      _loc10_.txt._width = 421;
      _loc10_.txt._x = 10;
      apply_btn.setVisible(true);
      apply_btn.setEnabled(false,100);
      close_btn.setText("$181006");
      var _loc6_ = applyBtnStr.indexOf("#");
      if(_loc6_ != -1)
      {
         _loc8_ = _loc10_.attachMovie("keyMc","keyMc",_loc10_.getNextHighestDepth());
         _loc8_._y = 9;
         var _loc9_ = getKeyStr(applyBtnStr.substring(_loc6_ + 1));
         applyBtnStr = applyBtnStr.substring(0,_loc6_);
         _loc10_.txt.text = applyBtnStr;
         var _loc3_ = _loc10_.txt.textWidth + 5;
         _loc8_.bg.hitTestDisable = true;
         _loc8_.textFd.text = _loc9_;
         var _loc1_ = Math.max(_loc8_.textFd.textWidth + 5,14);
         var _loc11_ = _loc1_ - 14;
         var _loc4_ = 20 + _loc11_;
         var _loc2_ = _loc4_ + _loc3_;
         var _loc7_ = 427;
         if(_loc2_ > _loc7_)
         {
            _loc1_ = _loc4_ <= 80?_loc1_:74;
            _loc3_ = _loc4_ <= 80?_loc7_ - _loc4_:347;
         }
         _loc10_.txt._width = _loc3_;
         _loc2_ = Math.min(_loc2_,427);
         _loc10_.txt._x = 10 + (427 - _loc2_) / 2;
         _loc8_.textFd._width = _loc1_;
         _loc8_.textFd.setText(_loc9_);
         _loc8_.bg._width = _loc1_ + 6;
         _loc8_._x = _loc10_.txt._x + _loc3_;
      }
      _loc10_.txt.setText(applyBtnStr);
   }
   else
   {
      _loc10_ = container_mc.applyBtn;
      _loc8_ = _loc10_.keyMc;
      if(_loc8_ != undefined)
      {
         _loc8_.removeMovieClip();
      }
      apply_btn.setVisible(false);
      close_btn.setText("$181003");
   }
};
var baseRequitalItemList = new lib.util.List(list.slots_mc,"baseRequitalItem",btnYGap);
var repeatRequitalItemList = new lib.util.List(list.slots2_mc,"repeatRequitalItem",btnYGap);
var selectRequitalItemList = new lib.util.List(list.slots3_mc,"selectRequitalItem",btnYGap);
var AddRequitalItemDataList = new lib.util.List(list.slots4_mc,"AddRequitalItem",btnYGap);
baseRequitalItemList.useTile = true;
repeatRequitalItemList.useTile = true;
selectRequitalItemList.useTile = true;
AddRequitalItemDataList.useTile = true;
var DARK_TYPE = "5";
var requitalSelect = null;
myListener.OnGame_VillagerDialog_SetDialog = function(dialogText, questName, dialogBtnData, bBaseRequitalComplete, baseRequitalItemData, repayMoney, bRepeatRequitalComplete, repeatRequitalCompleteNum, repeatRequitalItemData, bSelectableRequitalComplete, selectableRequitalCompleteNum, selectableRequitalItemData, bReduceRepeatQuestReward, questType, bAddRequitalComplete, AddRequitalItemData, rewardTitles, pointInfo)
{
   clearInformation();
   bBaseRequitalComplete = Number(bBaseRequitalComplete);
   bRepeatRequitalComplete = Number(bRepeatRequitalComplete);
   repeatRequitalCompleteNum = Number(repeatRequitalCompleteNum);
   bSelectableRequitalComplete = Number(bSelectableRequitalComplete);
   selectableRequitalCompleteNum = Number(selectableRequitalCompleteNum);
   bReduceRepeatQuestReward = Number(bReduceRepeatQuestReward);
   bAddRequitalComplete = Number(bAddRequitalComplete);
   container_mc.darkBgMc._visible = questType == DARK_TYPE;
   list.questName_txt.text = questName;
   list.questName_txt._visible = questName != undefined && questName != "";
   list.nameBg_mc._visible = questName != undefined && questName != "";
   list.dialog_txt._y = !list.questName_txt._visible?10:list.questName_txt._y + list.questName_txt._height + 12;
   list.dialog_txt.htmlText = dialogText;
   lib.util.ExtString.alignJoint(list.dialog_txt);
   list.dialog_txt._height = list.dialog_txt.textHeight + 5;
   attachLine = list.dialog_txt._y + list.dialog_txt._height + 25;
   readY = attachLine - 20;
   lib.util.ExtString.alignJoint(list.dialog_txt);
   if(pointInfo != "" && pointInfo != undefined)
   {
      var _loc31_ = list.attachMovie("pointguide","pointGuide",list.getNextHighestDepth());
      _loc31_.txt.htmlText = pointInfo;
      _loc31_.txt._height = _loc31_.txt.textHeight + 4;
      _loc31_._x = btnX + 12;
      _loc31_._y = attachLine + 15;
      attachLine = attachLine + (_loc31_._height + 20);
   }
   if(bBaseRequitalComplete >= 0 && (baseRequitalItemData != undefined && baseRequitalItemData != ""))
   {
      var _loc28_ = list.attachMovie("bosang","bosang",list.getNextHighestDepth());
      if(bBaseRequitalComplete == 0)
      {
         _loc28_.txt.text = lib.util.UIString.getUIString("$181016");
      }
      else
      {
         _loc28_.txt.text = lib.util.UIString.getUIString("$181016") + completeStr;
      }
      _loc28_.txt.textAutoSize = "shrink";
      _loc28_._x = -8;
      _loc28_._y = attachLine;
      attachLine = attachLine + (5 + _loc28_._height);
      list.slots_mc._y = attachLine;
      var _loc15_ = baseRequitalItemData.split("\n");
      if(_loc15_[_loc15_.length - 1] == "0" || _loc15_[_loc15_.length - 1] == "undefined" || _loc15_[_loc15_.length - 1] == "")
      {
         _loc15_.splice(_loc15_.length - 1,1);
      }
      if(_loc15_.length >= 1)
      {
         list.blet1_mc._visible = true;
         var _loc4_ = 0;
         while(_loc4_ < _loc15_.length)
         {
            var _loc10_ = _loc15_[_loc4_].split("\t");
            var slot = baseRequitalItemList.add(_loc10_[0],"Slot4_link");
            slot.guidNum_mc._visible = false;
            slot.BG.bg._visible = false;
            slot.effect = false;
            slot.img = _loc10_[1];
            var _loc13_ = Number(_loc10_[2]);
            var _loc22_ = Number(_loc10_[4]);
            var itemType = Number(_loc10_[6]);
            var goldType = 0;
            if(_loc10_[11] != undefined && _loc10_[11] != "" && _loc10_[11] != "undefined")
            {
               goldType = Number(_loc10_[11]);
            }
            var _loc8_ = "";
            if(_loc13_ > 0)
            {
               _loc8_ = "+" + _loc13_ + _loc10_[3];
            }
            else
            {
               _loc8_ = _loc10_[3];
            }
            slot.upTxt = _loc8_;
            slot.downTxt = _loc22_;
            slot.useable = _loc10_[5];
            slot.itemType = _loc10_[6];
            slot.grade = _loc10_[7];
            slot._sealType = _loc10_[8];
            slot._masterpiece = _loc10_[9];
            slot.goldType = goldType;
            SetMultiply(slot.multiply,Number(_loc10_[10]));
            if(itemType == 2)
            {
               baseRequitalItemList.gold = 1;
            }
            slot.onEnterFrame = function()
            {
               if(this.drag)
               {
                  delete this.onEnterFrame;
                  this.draw(this.img);
                  this.display = true;
                  lib.util.ExtString.textCut(this.up_txt,this.upTxt);
                  this.grade = this.grade;
                  this.sealType = this._sealType;
                  this.masterpiece = this._masterpiece;
                  if(this.itemType == 2)
                  {
                     this.setLineNum(3);
                     this.upText = "";
                     var _loc4_ = lib.util.GoldCurrency.SetGoldText(this.downTxt,0,0,0,this.goldType);
                     this.center_txt.htmlText = _loc4_;
                     if(bReduceRepeatQuestReward)
                     {
                        this.center_txt.textColor = lib.info.TextColor.GENERAL_IMPOSSIBLE;
                     }
                     this.showMoney(false);
                     this.money_mc._x = this.center_txt._x + this.center_txt.textWidth + 6;
                     this.money_mc._y = this.center_txt._y + 2;
                     lib.manager.ToolTip.add(this.SLOT,lib.util.UIString.getUIString("$101087") + " " + this.center_txt.htmlText,1);
                  }
                  else if(this.itemType == 3)
                  {
                     this.setLineNum(3);
                     this.upText = "";
                     this.centerText = lib.util.CurrencyFormat.makeComma(this.downTxt);
                     this.center_txt.textColor = lib.info.TextColor.GENERAL_EXP;
                     if(bReduceRepeatQuestReward)
                     {
                        this.center_txt.textColor = lib.info.TextColor.GENERAL_IMPOSSIBLE;
                     }
                     var _loc3_ = this.attachMovie("symbol_xp","symbol_xp",this.getNextHighestDepth());
                     _loc3_._x = this.center_txt._x + this.center_txt.textWidth + 6;
                     _loc3_._y = this.center_txt._y;
                     _loc3_.hitTestDisable = true;
                     lib.manager.ToolTip.add(this.SLOT,lib.util.UIString.getUIString("$101088") + " " + this.center_txt.htmlText,1);
                  }
                  else if(this.itemType == 4)
                  {
                     this.setLineNum(3);
                     this.upText = "";
                     this.centerText = lib.util.CurrencyFormat.makeComma(this.downTxt);
                     this.center_txt.textColor = lib.info.TextColor.GENERAL_POLICYPOINT;
                     if(bReduceRepeatQuestReward)
                     {
                        this.center_txt.textColor = lib.info.TextColor.GENERAL_IMPOSSIBLE;
                     }
                     var _loc2_ = this.attachMovie("symbol_p","symbol_p",this.getNextHighestDepth());
                     _loc2_._x = this.center_txt._x + this.center_txt.textWidth + 6;
                     _loc2_._y = this.center_txt._y;
                     _loc2_.hitTestDisable = true;
                     lib.manager.ToolTip.add(this.SLOT,lib.util.UIString.getUIString("$101089") + " " + this.center_txt.htmlText,1);
                  }
                  else if(this.itemType == 5)
                  {
                     this.draw("img://__Icon_Items.ReputationXP_Tex");
                     this.setLineNum(2);
                     this.upText = this.upTxt;
                     this.up_txt.textColor = 46335;
                     this.downText = lib.util.CurrencyFormat.makeComma(this.downTxt);
                     this.down_txt.textColor = 32511;
                     if(bReduceRepeatQuestReward)
                     {
                        this.down_txt.textColor = 32511;
                     }
                     _loc3_ = this.attachMovie("symbol_rp_xp","symbol_rp_xp",this.getNextHighestDepth());
                     this.down_txt._width = 123;
                     _loc3_._x = this.down_txt._x + this.down_txt._width + 1;
                     _loc3_._y = this.down_txt._y;
                     _loc3_.hitTestDisable = true;
                     lib.manager.ToolTip.add(this.SLOT,lib.util.UIString.getUIString("$102185") + " " + "<font color=\'#00B4FF\'>" + this.upTxt + "<font color=\'#7d7d7d\'>" + " / " + "<font color=\'#007EFF\'>" + this.downTxt + "</font>",1);
                  }
                  else if(this.itemType == 6)
                  {
                     this.draw("img://__Icon_Items.ReputationPoint_Tex");
                     this.setLineNum(2);
                     this.upText = this.upTxt;
                     this.up_txt.textColor = 46335;
                     this.downText = lib.util.CurrencyFormat.makeComma(this.downTxt);
                     this.down_txt.textColor = 32511;
                     if(bReduceRepeatQuestReward)
                     {
                        this.down_txt.textColor = 32511;
                     }
                     _loc3_ = lib.util.DrawBitmap.makeMcAndDraw(this,"img://__Icon_Items.ReputationPointCoin");
                     this.down_txt._width = 123;
                     _loc3_._x = this.down_txt._x + this.down_txt._width + 1;
                     _loc3_._y = this.down_txt._y;
                     _loc3_.hitTestDisable = true;
                     lib.manager.ToolTip.add(this.SLOT,lib.util.UIString.getUIString("$102186") + " " + "<font color=\'#00B4FF\'>" + this.upTxt + "<font color=\'#7d7d7d\'>" + " / " + "<font color=\'#007EFF\'>" + this.downTxt + "</font>",1);
                  }
                  else if(this.itemType == 7)
                  {
                     this.draw("img://__Icon_Items.UnionPoint_Tex");
                     this.setLineNum(2);
                     this.upText = this.upTxt;
                     this.up_txt.textColor = 46335;
                     this.downText = lib.util.CurrencyFormat.makeComma(this.downTxt);
                     this.down_txt.textColor = 32511;
                     if(bReduceRepeatQuestReward)
                     {
                        this.down_txt.textColor = 32511;
                     }
                     _loc3_ = lib.util.DrawBitmap.makeMcAndDraw(this,"img://__Icon_Items.UnionPointCoin");
                     this.down_txt._width = 123;
                     _loc3_._x = this.down_txt._x + this.down_txt._width + 1;
                     _loc3_._y = this.down_txt._y;
                     _loc3_.hitTestDisable = true;
                  }
                  else if(this.itemType == 8)
                  {
                     this.setLineNum(3);
                     this.center_txt.htmlText = this.upTxt;
                     this.upText = "";
                     this.center_txt._y = 10;
                     this.center_txt._height = 40;
                     this.center_txt.verticalAlign = "center";
                     if(slot.id == -1)
                     {
                        lib.manager.ToolTip.add(this.SLOT,this.center_txt.htmlText,1);
                     }
                     else
                     {
                        lib.manager.ToolTip.add(this.SLOT,this.id + "\t8",6,this.Slot.Icon);
                     }
                  }
                  else
                  {
                     preViewEvent(this);
                     this.setLineNum(2);
                     if(this.downTxt > 0)
                     {
                        this.downText = lib.util.UIString.getUIString("$181002","ItemCount",this.downTxt);
                     }
                     else
                     {
                        this.downText = "";
                     }
                     lib.manager.ToolTip.add(this.SLOT,this.id + "\t" + this.itemType,6,this.Slot.Icon);
                  }
                  this.down_txt.textColor = 16777215;
                  if(this.useable != undefined)
                  {
                     this.impossible = Number(this.useable);
                  }
               }
            };
            _loc4_ = _loc4_ + 1;
         }
         list.slots_mc._y = attachLine;
         attachLine = attachLine + list.slots_mc._height;
      }
      attachLine = list.slots_mc._y + list.slots_mc._height + btnYGap;
   }
   if(bReduceRepeatQuestReward)
   {
      var _loc29_ = list.attachMovie("guide","reduceGuide",list.getNextHighestDepth());
      _loc29_.txt.text = lib.util.UIString.getUIString("$181019");
      _loc29_.txt._height = _loc29_.txt.textHeight + 4;
      _loc29_._x = btnX + 10;
      _loc29_._y = attachLine + 3;
      attachLine = attachLine + (_loc29_._height + 3);
   }
   if(bAddRequitalComplete >= 0 && (AddRequitalItemData != undefined && AddRequitalItemData != ""))
   {
      var _loc27_ = list.attachMovie("bosang","bosang4",list.getNextHighestDepth());
      _loc27_.type.gotoAndStop(3);
      if(bAddRequitalComplete == 0)
      {
         _loc27_.txt.text = lib.util.UIString.getUIString("$091038");
      }
      else
      {
         _loc27_.txt.text = lib.util.UIString.getUIString("$091039");
      }
      _loc27_.txt.textAutoSize = "shrink";
      _loc27_._x = -8;
      _loc27_._y = attachLine;
      attachLine = attachLine + (5 + _loc27_._height);
      list.slots4_mc._y = attachLine;
      var _loc18_ = AddRequitalItemData.split("\n");
      if(_loc18_[_loc18_.length - 1] == "0" || _loc18_[_loc18_.length - 1] == "undefined" || _loc18_[_loc18_.length - 1] == "")
      {
         _loc18_.splice(_loc18_.length - 1,1);
      }
      if(_loc18_.length >= 1)
      {
         list.blet1_mc._visible = true;
         _loc4_ = 0;
         while(_loc4_ < _loc18_.length)
         {
            _loc10_ = _loc18_[_loc4_].split("\t");
            var slot = AddRequitalItemDataList.add(_loc10_[0],"Slot4_link");
            slot.guidNum_mc._visible = false;
            slot.BG.bg._visible = false;
            slot.effect = false;
            var goldType = 0;
            if(_loc10_[11] != undefined && _loc10_[11] != "" && _loc10_[11] != "undefined")
            {
               goldType = Number(_loc10_[11]);
            }
            slot.img = _loc10_[1];
            _loc13_ = Number(_loc10_[2]);
            _loc22_ = Number(_loc10_[4]);
            var itemType = Number(_loc10_[6]);
            _loc8_ = "";
            if(_loc13_ > 0)
            {
               _loc8_ = "+" + _loc13_ + _loc10_[3];
            }
            else
            {
               _loc8_ = _loc10_[3];
            }
            slot.upTxt = _loc8_;
            slot.downTxt = _loc22_;
            slot.useable = _loc10_[5];
            slot.itemType = _loc10_[6];
            slot.grade = _loc10_[7];
            slot._sealType = _loc10_[8];
            slot._masterpiece = _loc10_[9];
            slot.goldType = goldType;
            SetMultiply(slot.multiply,Number(_loc10_[10]));
            if(itemType == 2)
            {
               AddRequitalItemDataList.gold = 1;
            }
            slot.onEnterFrame = function()
            {
               if(this.drag)
               {
                  delete this.onEnterFrame;
                  this.draw(this.img);
                  this.display = true;
                  lib.util.ExtString.textCut(this.up_txt,this.upTxt);
                  this.grade = this.grade;
                  this.sealType = this._sealType;
                  this.masterpiece = this._masterpiece;
                  if(this.itemType == 2)
                  {
                     this.setLineNum(3);
                     this.upText = "";
                     var _loc4_ = lib.util.GoldCurrency.SetGoldText(this.downTxt,0,0,0,this.goldType);
                     this.center_txt.htmlText = _loc4_;
                     if(bReduceRepeatQuestReward)
                     {
                        this.center_txt.textColor = lib.info.TextColor.GENERAL_IMPOSSIBLE;
                     }
                     this.showMoney(false);
                     this.money_mc._x = this.center_txt._x + this.center_txt.textWidth + 6;
                     this.money_mc._y = this.center_txt._y + 2;
                     lib.manager.ToolTip.add(this.SLOT,lib.util.UIString.getUIString("$101087") + " " + this.center_txt.htmlText,1);
                  }
                  else if(this.itemType == 3)
                  {
                     this.setLineNum(3);
                     this.upText = "";
                     this.centerText = lib.util.CurrencyFormat.makeComma(this.downTxt);
                     this.center_txt.textColor = lib.info.TextColor.GENERAL_EXP;
                     if(bReduceRepeatQuestReward)
                     {
                        this.center_txt.textColor = lib.info.TextColor.GENERAL_IMPOSSIBLE;
                     }
                     var _loc3_ = this.attachMovie("symbol_xp","symbol_xp",this.getNextHighestDepth());
                     _loc3_._x = this.center_txt._x + this.center_txt.textWidth + 6;
                     _loc3_._y = this.center_txt._y;
                     _loc3_.hitTestDisable = true;
                     lib.manager.ToolTip.add(this.SLOT,lib.util.UIString.getUIString("$101088") + " " + this.center_txt.htmlText,1);
                  }
                  else if(this.itemType == 4)
                  {
                     this.setLineNum(3);
                     this.upText = "";
                     this.centerText = lib.util.CurrencyFormat.makeComma(this.downTxt);
                     this.center_txt.textColor = lib.info.TextColor.GENERAL_POLICYPOINT;
                     if(bReduceRepeatQuestReward)
                     {
                        this.center_txt.textColor = lib.info.TextColor.GENERAL_IMPOSSIBLE;
                     }
                     var _loc2_ = this.attachMovie("symbol_p","symbol_p",this.getNextHighestDepth());
                     _loc2_._x = this.center_txt._x + this.center_txt.textWidth + 6;
                     _loc2_._y = this.center_txt._y;
                     _loc2_.hitTestDisable = true;
                     lib.manager.ToolTip.add(this.SLOT,lib.util.UIString.getUIString("$101089") + " " + this.center_txt.htmlText,1);
                  }
                  else if(this.itemType == 5)
                  {
                     this.draw("img://__Icon_Items.ReputationXP_Tex");
                     this.setLineNum(2);
                     this.upText = this.upTxt;
                     this.up_txt.textColor = 46335;
                     this.downText = lib.util.CurrencyFormat.makeComma(this.downTxt);
                     this.down_txt.textColor = 32511;
                     if(bReduceRepeatQuestReward)
                     {
                        this.down_txt.textColor = 32511;
                     }
                     _loc3_ = this.attachMovie("symbol_rp_xp","symbol_rp_xp",this.getNextHighestDepth());
                     this.down_txt._width = 123;
                     _loc3_._x = this.down_txt._x + this.down_txt._width + 1;
                     _loc3_._y = this.down_txt._y;
                     _loc3_.hitTestDisable = true;
                     lib.manager.ToolTip.add(this.SLOT,lib.util.UIString.getUIString("$102185") + " " + "<font color=\'#00B4FF\'>" + this.upTxt + "<font color=\'#7d7d7d\'>" + " / " + "<font color=\'#007EFF\'>" + this.downTxt + "</font>",1);
                  }
                  else if(this.itemType == 6)
                  {
                     this.draw("img://__Icon_Items.ReputationPoint_Tex");
                     this.setLineNum(2);
                     this.upText = this.upTxt;
                     this.up_txt.textColor = 46335;
                     this.downText = lib.util.CurrencyFormat.makeComma(this.downTxt);
                     this.down_txt.textColor = 32511;
                     if(bReduceRepeatQuestReward)
                     {
                        this.down_txt.textColor = 32511;
                     }
                     _loc3_ = lib.util.DrawBitmap.makeMcAndDraw(this,"img://__Icon_Items.ReputationPointCoin");
                     this.down_txt._width = 123;
                     _loc3_._x = this.down_txt._x + this.down_txt._width + 1;
                     _loc3_._y = this.down_txt._y;
                     _loc3_.hitTestDisable = true;
                     lib.manager.ToolTip.add(this.SLOT,lib.util.UIString.getUIString("$102186") + " " + "<font color=\'#00B4FF\'>" + this.upTxt + "<font color=\'#7d7d7d\'>" + " / " + "<font color=\'#007EFF\'>" + this.downTxt + "</font>",1);
                  }
                  else if(this.itemType == 7)
                  {
                     this.draw("img://__Icon_Items.UnionPoint_Tex");
                     this.setLineNum(2);
                     this.upText = this.upTxt;
                     this.up_txt.textColor = 46335;
                     this.downText = lib.util.CurrencyFormat.makeComma(this.downTxt);
                     this.down_txt.textColor = 32511;
                     if(bReduceRepeatQuestReward)
                     {
                        this.down_txt.textColor = 32511;
                     }
                     _loc3_ = lib.util.DrawBitmap.makeMcAndDraw(this,"img://__Icon_Items.UnionPointCoin");
                     this.down_txt._width = 123;
                     _loc3_._x = this.down_txt._x + this.down_txt._width + 1;
                     _loc3_._y = this.down_txt._y;
                     _loc3_.hitTestDisable = true;
                  }
                  else if(this.itemType == 8)
                  {
                     this.setLineNum(3);
                     this.center_txt.htmlText = this.upTxt;
                     this.upText = "";
                     this.center_txt._y = 10;
                     this.center_txt._height = 40;
                     this.center_txt.verticalAlign = "center";
                     if(slot.id == -1)
                     {
                        lib.manager.ToolTip.add(this.SLOT,this.center_txt.htmlText,1);
                     }
                     else
                     {
                        lib.manager.ToolTip.add(this.SLOT,this.id + "\t8",6,this.Slot.Icon);
                     }
                  }
                  else
                  {
                     preViewEvent(this);
                     this.setLineNum(2);
                     if(this.downTxt > 0)
                     {
                        this.downText = lib.util.UIString.getUIString("$181002","ItemCount",this.downTxt);
                     }
                     else
                     {
                        this.downText = "";
                     }
                     lib.manager.ToolTip.add(this.SLOT,this.id + "\t" + this.itemType,6,this.Slot.Icon);
                  }
                  if(!(this.itemType == 5 || this.itemType == 6 || this.itemType == 7))
                  {
                     this.down_txt.textColor = 16777215;
                  }
                  if(this.useable != undefined)
                  {
                     this.impossible = Number(this.useable);
                  }
               }
            };
            _loc4_ = _loc4_ + 1;
         }
         list.slots4_mc._y = attachLine;
         attachLine = attachLine + list.slots4_mc._height;
      }
      attachLine = list.slots4_mc._y + list.slots4_mc._height + btnYGap * 2;
   }
   if(bRepeatRequitalComplete >= 0 && (repeatRequitalItemData != undefined && repeatRequitalItemData != ""))
   {
      var _loc30_ = list.attachMovie("bosang","bosang2",list.getNextHighestDepth());
      if(bRepeatRequitalComplete == 0)
      {
         _loc30_.txt.text = lib.util.UIString.getUIString("$181013","count",repeatRequitalCompleteNum);
      }
      else
      {
         _loc30_.txt.text = lib.util.UIString.getUIString("$181013","count",repeatRequitalCompleteNum) + completeStr;
      }
      _loc30_.txt.textAutoSize = "shrink";
      _loc30_._x = -8;
      _loc30_._y = attachLine + 10;
      attachLine = attachLine + (5 + _loc30_._height);
      list.slots2_mc._y = attachLine + 10;
      var _loc17_ = repeatRequitalItemData.split("\n");
      if(_loc17_[_loc17_.length - 1] == "0" || _loc17_[_loc17_.length - 1] == "undefined" || _loc17_[_loc17_.length - 1] == "")
      {
         _loc17_.splice(_loc17_.length - 1,1);
      }
      if(_loc17_.length >= 1)
      {
         _loc4_ = 0;
         while(_loc4_ < _loc17_.length)
         {
            _loc10_ = _loc17_[_loc4_].split("\t");
            var slot = repeatRequitalItemList.add(_loc10_[0],"Slot4_link");
            slot.guidNum_mc._visible = false;
            slot.BG.bg._visible = false;
            slot.effect = false;
            slot.img = _loc10_[1];
            _loc13_ = Number(_loc10_[2]);
            _loc22_ = Number(_loc10_[4]);
            var goldType = 0;
            if(_loc10_[11] != undefined && _loc10_[11] != "" && _loc10_[11] != "undefined")
            {
               goldType = Number(_loc10_[11]);
            }
            _loc8_ = "";
            if(_loc13_ > 0)
            {
               _loc8_ = "+" + _loc13_ + _loc10_[3];
            }
            else
            {
               _loc8_ = _loc10_[3];
            }
            slot.upTxt = _loc8_;
            slot.downTxt = _loc22_;
            slot.useable = _loc10_[5];
            slot.itemType = _loc10_[6];
            slot.grade = _loc10_[7];
            slot._sealType = _loc10_[8];
            slot._masterpiece = _loc10_[9];
            slot.goldType = goldType;
            SetMultiply(slot.multiply,Number(_loc10_[10]));
            if(_loc10_[6] == "2")
            {
               repeatRequitalItemList.gold = 1;
            }
            slot.onEnterFrame = function()
            {
               if(this.drag)
               {
                  delete this.onEnterFrame;
                  this.draw(this.img);
                  this.display = true;
                  lib.util.ExtString.textCut(this.up_txt,this.upTxt);
                  this.grade = this.grade;
                  this.sealType = this._sealType;
                  this.masterpiece = this._masterpiece;
                  if(this.itemType == 2)
                  {
                     this.setLineNum(3);
                     this.upText = "";
                     var _loc4_ = lib.util.GoldCurrency.SetGoldText(this.downTxt,0,0,0,this.goldType);
                     this.center_txt.htmlText = _loc4_;
                     this.showMoney(false);
                     this.money_mc._x = this.center_txt._x + this.center_txt.textWidth + 6;
                     this.money_mc._y = this.center_txt._y + 2;
                     lib.manager.ToolTip.add(this.SLOT,lib.util.UIString.getUIString("$101087") + " " + this.center_txt.htmlText,1);
                  }
                  else if(this.itemType == 3)
                  {
                     this.setLineNum(3);
                     this.upText = "";
                     this.centerText = lib.util.CurrencyFormat.makeComma(this.downTxt);
                     this.center_txt.textColor = lib.info.TextColor.GENERAL_EXP;
                     var _loc3_ = this.attachMovie("symbol_xp","symbol_xp",this.getNextHighestDepth());
                     _loc3_._x = this.center_txt._x + this.center_txt.textWidth + 6;
                     _loc3_._y = this.center_txt._y;
                     _loc3_.hitTestDisable = true;
                     lib.manager.ToolTip.add(this.SLOT,lib.util.UIString.getUIString("$101088") + " " + this.center_txt.htmlText,1);
                  }
                  else if(this.itemType == 4)
                  {
                     this.setLineNum(3);
                     this.upText = "";
                     this.centerText = lib.util.CurrencyFormat.makeComma(this.downTxt);
                     this.center_txt.textColor = lib.info.TextColor.GENERAL_POLICYPOINT;
                     var _loc2_ = this.attachMovie("symbol_p","symbol_p",this.getNextHighestDepth());
                     _loc2_._x = this.center_txt._x + this.center_txt.textWidth + 6;
                     _loc2_._y = this.center_txt._y;
                     _loc2_.hitTestDisable = true;
                     lib.manager.ToolTip.add(this.SLOT,lib.util.UIString.getUIString("$101089") + " " + this.center_txt.htmlText,1);
                  }
                  else if(this.itemType == 5)
                  {
                     this.draw("img://__Icon_Items.ReputationXP_Tex");
                     this.setLineNum(2);
                     this.upText = this.upTxt;
                     this.up_txt.textColor = 46335;
                     this.downText = lib.util.CurrencyFormat.makeComma(this.downTxt);
                     this.down_txt.textColor = 32511;
                     _loc3_ = this.attachMovie("symbol_rp_xp","symbol_rp_xp",this.getNextHighestDepth());
                     this.down_txt._width = 123;
                     _loc3_._x = this.down_txt._x + this.down_txt._width + 1;
                     _loc3_._y = this.down_txt._y;
                     _loc3_.hitTestDisable = true;
                     lib.manager.ToolTip.add(this.SLOT,lib.util.UIString.getUIString("$102185") + " " + "<font color=\'#00B4FF\'>" + this.upTxt + "<font color=\'#7d7d7d\'>" + " / " + "<font color=\'#007EFF\'>" + this.downTxt + "</font>",1);
                  }
                  else if(this.itemType == 6)
                  {
                     this.draw("img://__Icon_Items.ReputationPoint_Tex");
                     this.setLineNum(2);
                     this.upText = this.upTxt;
                     this.up_txt.textColor = 46335;
                     this.downText = lib.util.CurrencyFormat.makeComma(this.downTxt);
                     this.down_txt.textColor = 32511;
                     _loc3_ = lib.util.DrawBitmap.makeMcAndDraw(this,"img://__Icon_Items.ReputationPointCoin");
                     this.down_txt._widht = 123;
                     _loc3_._x = this.down_txt._x + this.down_txt._width + 1;
                     _loc3_._y = this.down_txt._y;
                     _loc3_.hitTestDisable = true;
                     lib.manager.ToolTip.add(this.SLOT,lib.util.UIString.getUIString("$102186") + " " + "<font color=\'#00B4FF\'>" + this.upTxt + "<font color=\'#7d7d7d\'>" + " / " + "<font color=\'#007EFF\'>" + this.downTxt + "</font>",1);
                  }
                  else if(this.itemType == 7)
                  {
                     this.draw("img://__Icon_Items.UnionPoint_Tex");
                     this.setLineNum(2);
                     this.upText = this.upTxt;
                     this.up_txt.textColor = 46335;
                     this.downText = lib.util.CurrencyFormat.makeComma(this.downTxt);
                     this.down_txt.textColor = 32511;
                     _loc3_ = lib.util.DrawBitmap.makeMcAndDraw(this,"img://__Icon_Items.UnionPointCoin");
                     this.down_txt._widht = 123;
                     _loc3_._x = this.down_txt._x + this.down_txt._width + 1;
                     _loc3_._y = this.down_txt._y;
                     _loc3_.hitTestDisable = true;
                  }
                  else if(this.itemType == 8)
                  {
                     this.setLineNum(3);
                     this.center_txt.htmlText = this.upTxt;
                     this.upText = "";
                     this.center_txt._y = 10;
                     this.center_txt._height = 40;
                     this.center_txt.verticalAlign = "center";
                     if(slot.id == -1)
                     {
                        lib.manager.ToolTip.add(this.SLOT,this.center_txt.htmlText,1);
                     }
                     else
                     {
                        lib.manager.ToolTip.add(this.SLOT,this.id + "\t8",6,this.Slot.Icon);
                     }
                  }
                  else
                  {
                     preViewEvent(this);
                     this.setLineNum(2);
                     if(this.downTxt > 0)
                     {
                        this.downText = lib.util.UIString.getUIString("$181002","ItemCount",this.downTxt);
                     }
                     else
                     {
                        this.downText = "";
                     }
                     lib.manager.ToolTip.add(this.SLOT,this.id + "\t" + this.itemType,6,this.Slot.Icon);
                  }
                  this.down_txt.textColor = 16777215;
                  if(this.useable != undefined)
                  {
                     this.impossible = Number(this.useable);
                  }
               }
            };
            _loc4_ = _loc4_ + 1;
         }
         attachLine = list.slots2_mc._y + list.slots2_mc._height + btnYGap * 4;
      }
   }
   if(bRepeatRequitalComplete >= 0 && repayMoney > 0)
   {
      var _loc34_ = list.attachMovie("repay","repay_mc",list.getNextHighestDepth());
      var goldType = 0;
      var _loc23_ = lib.util.GoldCurrency.SetGoldText(repayMoney,0,0,0,goldType);
      _loc34_.txt.htmlText = _loc23_;
      _loc34_._x = btnX + 10;
      _loc34_._y = attachLine + 3;
      attachLine = attachLine + (_loc34_._height + btnYGap + 3);
   }
   if(bSelectableRequitalComplete >= 0 && (selectableRequitalItemData != undefined && selectableRequitalItemData != ""))
   {
      var _loc25_ = list.attachMovie("bosang","bosang3",list.getNextHighestDepth());
      _loc25_.type.gotoAndStop(2);
      if(bSelectableRequitalComplete == 0)
      {
         if(selectableRequitalCompleteNum <= 0)
         {
            _loc25_.txt.text = lib.util.UIString.getUIString("$181017");
         }
         else
         {
            _loc25_.txt.text = lib.util.UIString.getUIString("$181012","count",selectableRequitalCompleteNum);
         }
      }
      else if(selectableRequitalCompleteNum <= 0)
      {
         _loc25_.txt.text = lib.util.UIString.getUIString("$181017") + completeStr;
      }
      else
      {
         _loc25_.txt.text = lib.util.UIString.getUIString("$181012","count",selectableRequitalCompleteNum) + completeStr;
      }
      _loc25_.txt.textAutoSize = "shrink";
      _loc25_._x = -8;
      _loc25_._y = attachLine + 10;
      attachLine = attachLine + (5 + _loc25_._height);
      var _loc32_ = list.attachMovie("guide","guide_select",list.getNextHighestDepth());
      _loc32_.txt.text = "( " + lib.util.UIString.getUIString("$181015") + " )";
      _loc32_._x = btnX + 10;
      _loc32_._y = attachLine + 5;
      attachLine = attachLine + _loc32_._height;
      list.slots3_mc._y = attachLine + 10;
      var _loc19_ = selectableRequitalItemData.split("\n");
      if(_loc19_[_loc19_.length - 1] == "0" || _loc19_[_loc19_.length - 1] == "undefined" || _loc19_[_loc19_.length - 1] == "")
      {
         _loc19_.splice(_loc19_.length - 1,1);
      }
      if(_loc19_.length >= 1)
      {
         _loc4_ = 0;
         while(_loc4_ < _loc19_.length)
         {
            _loc10_ = _loc19_[_loc4_].split("\t");
            var slot = selectRequitalItemList.add(_loc10_[0],"Slot4_link");
            slot.guidNum_mc._visible = true;
            slot.img = _loc10_[1];
            _loc13_ = Number(_loc10_[2]);
            _loc22_ = Number(_loc10_[4]);
            var goldType = 0;
            if(_loc10_[11] != undefined && _loc10_[11] != "" && _loc10_[11] != "undefined")
            {
               goldType = Number(_loc10_[11]);
            }
            _loc8_ = "";
            if(_loc13_ > 0)
            {
               _loc8_ = "+" + _loc13_ + _loc10_[3];
            }
            else
            {
               _loc8_ = _loc10_[3];
            }
            slot.upTxt = _loc8_;
            slot.downTxt = _loc22_;
            slot.useable = _loc10_[5];
            slot.itemType = _loc10_[6];
            slot.grade = _loc10_[7];
            slot._sealType = _loc10_[8];
            slot._masterpiece = _loc10_[9];
            slot.goldType = goldType;
            SetMultiply(slot.multiply,Number(_loc10_[10]));
            if(_loc10_[6] == "2")
            {
               selectRequitalItemList.gold = 1;
            }
            slot.onEnterFrame = function()
            {
               if(this.drag)
               {
                  delete this.onEnterFrame;
                  this.draw(this.img);
                  this.display = false;
                  if(this.useable != undefined)
                  {
                     this.impossible = Number(this.useable);
                  }
                  lib.util.ExtString.textCut(this.up_txt,this.upTxt);
                  this.grade = this.grade;
                  this.sealType = this._sealType;
                  this.masterpiece = this._masterpiece;
                  if(this.itemType == 2)
                  {
                     this.setLineNum(3);
                     this.upText = "";
                     var _loc4_ = lib.util.GoldCurrency.SetGoldText(this.downTxt,0,0,0,this.goldType);
                     this.center_txt.htmlText = _loc4_;
                     this.showMoney(false);
                     this.money_mc._x = this.center_txt._x + this.center_txt.textWidth + 6;
                     this.money_mc._y = this.center_txt._y + 2;
                     lib.manager.ToolTip.add(this.SLOT,lib.util.UIString.getUIString("$101087") + " " + this.center_txt.htmlText,1);
                  }
                  else if(this.itemType == 3)
                  {
                     this.setLineNum(3);
                     this.upText = "";
                     this.centerText = lib.util.CurrencyFormat.makeComma(this.downTxt);
                     this.center_txt.textColor = lib.info.TextColor.GENERAL_EXP;
                     var _loc3_ = this.attachMovie("symbol_xp","symbol_xp",this.getNextHighestDepth());
                     _loc3_._x = this.center_txt._x + this.center_txt.textWidth + 6;
                     _loc3_._y = this.center_txt._y;
                     _loc3_.hitTestDisable = true;
                     lib.manager.ToolTip.add(this.SLOT,lib.util.UIString.getUIString("$101088") + " " + this.center_txt.htmlText,1);
                  }
                  else if(this.itemType == 4)
                  {
                     this.setLineNum(3);
                     this.upText = "";
                     this.centerText = lib.util.CurrencyFormat.makeComma(this.downTxt);
                     this.center_txt.textColor = lib.info.TextColor.GENERAL_POLICYPOINT;
                     var _loc2_ = this.attachMovie("symbol_p","symbol_p",this.getNextHighestDepth());
                     _loc2_._x = this.center_txt._x + this.center_txt.textWidth + 6;
                     _loc2_._y = this.center_txt._y;
                     _loc2_.hitTestDisable = true;
                     lib.manager.ToolTip.add(this.SLOT,lib.util.UIString.getUIString("$101089") + " " + this.center_txt.htmlText,1);
                  }
                  else if(this.itemType == 5)
                  {
                     this.draw("img://__Icon_Items.ReputationXP_Tex");
                     this.setLineNum(2);
                     this.upText = this.upTxt;
                     this.up_txt.textColor = 32511;
                     this.centerText = lib.util.CurrencyFormat.makeComma(this.downTxt);
                     this.center_txt.textColor = 32511;
                     _loc3_ = this.attachMovie("symbol_rp_xp","symbol_rp_xp",this.getNextHighestDepth());
                     _loc3_._x = this.center_txt._x + this.center_txt._width + 1;
                     _loc3_._y = this.center_txt._y;
                     _loc3_.hitTestDisable = true;
                     lib.manager.ToolTip.add(this.SLOT,lib.util.UIString.getUIString("$102185") + " " + "<font color=\'#00B4FF\'>" + this.upTxt + "<font color=\'#7d7d7d\'>" + " / " + "<font color=\'#007EFF\'>" + this.downTxt + "</font>",1);
                  }
                  else if(this.itemType == 6)
                  {
                     this.draw("img://__Icon_Items.ReputationPoint_Tex");
                     this.setLineNum(2);
                     this.upText = this.upTxt;
                     this.up_txt.textColor = 32511;
                     this.centerText = lib.util.CurrencyFormat.makeComma(this.downTxt);
                     this.center_txt.textColor = 32511;
                     _loc3_ = lib.util.DrawBitmap.makeMcAndDraw(this,"img://__Icon_Items.ReputationCoin");
                     _loc3_._x = this.center_txt._x + this.center_txt._width + 1;
                     _loc3_._y = this.center_txt._y;
                     _loc3_.hitTestDisable = true;
                     lib.manager.ToolTip.add(this.SLOT,lib.util.UIString.getUIString("$102186") + " " + "<font color=\'#00B4FF\'>" + this.upTxt + "<font color=\'#7d7d7d\'>" + " / " + "<font color=\'#007EFF\'>" + this.downTxt + "</font>",1);
                  }
                  else if(this.itemType == 7)
                  {
                     this.draw("img://__Icon_Items.UnionPoint_Tex");
                     this.setLineNum(2);
                     this.upText = this.upTxt;
                     this.up_txt.textColor = 32511;
                     this.centerText = lib.util.CurrencyFormat.makeComma(this.downTxt);
                     this.center_txt.textColor = 32511;
                     _loc3_ = lib.util.DrawBitmap.makeMcAndDraw(this,"img://__Icon_Items.UnionPointCoin");
                     _loc3_._x = this.center_txt._x + this.center_txt._width + 1;
                     _loc3_._y = this.center_txt._y;
                     _loc3_.hitTestDisable = true;
                  }
                  else if(this.itemType == 8)
                  {
                     this.setLineNum(3);
                     this.center_txt.htmlText = this.upTxt;
                     this.upText = "";
                     this.center_txt._y = 10;
                     this.center_txt._height = 40;
                     this.center_txt.verticalAlign = "center";
                     if(slot.id == -1)
                     {
                        lib.manager.ToolTip.add(this.SLOT,this.center_txt.htmlText,1);
                     }
                     else
                     {
                        lib.manager.ToolTip.add(this.SLOT,this.id + "\t8",6,this.Slot.Icon);
                     }
                  }
                  else
                  {
                     preViewEvent(this);
                     this.setLineNum(2);
                     if(this.downTxt > 0)
                     {
                        this.downText = lib.util.UIString.getUIString("$181002","ItemCount",this.downTxt);
                     }
                     else
                     {
                        this.downText = "";
                     }
                     lib.manager.ToolTip.add(this.SLOT,this.id + "\t" + this.itemType,6,this.Slot.Icon);
                  }
                  this.down_txt.textColor = 16777215;
                  this.drag = false;
               }
            };
            if(bSelectableRequitalComplete > 0)
            {
               requitalSelect = 1;
               slot.onRelease2 = function()
               {
                  if(selectRequitalItemList.selectedSlot != null)
                  {
                     selectRequitalItemList.selectedSlot.active = 0;
                     selectRequitalItemList.selectedSlot.guidNum_mc.gotoAndStop(1);
                  }
                  this.active = 1;
                  this.guidNum_mc.gotoAndStop(2);
                  selectRequitalItemList.selectedSlot = this;
                  slotHandlerRelease(this);
                  checkApplyEnable();
               };
            }
            _loc4_ = _loc4_ + 1;
         }
         attachLine = list.slots3_mc._y + list.slots3_mc._height + btnYGap * 4;
      }
   }
   var _loc16_ = dialogBtnData.split("\n");
   if(_loc16_[_loc16_.length - 1] == "0" || _loc16_[_loc16_.length - 1] == "undefined" || _loc16_[_loc16_.length - 1] == "")
   {
      _loc16_.splice(_loc16_.length - 1,1);
   }
   if(_loc16_.length >= 1)
   {
      list.blet1_mc._visible = true;
      _loc4_ = 0;
      while(_loc4_ < _loc16_.length)
      {
         _loc10_ = _loc16_[_loc4_].split("\t");
         var btn = list.attachMovie("dialog_btn","dialog_btn" + list.getNextHighestDepth(),list.getNextHighestDepth());
         btn.stat = _loc4_;
         btn._y = attachLine;
         attachLine = attachLine + (btn._height + btnYGap);
         btn._x = btnX;
         btn.id = _loc10_[0];
         btn.txt.text = _loc10_[1];
         var _loc3_ = _loc10_[1];
         var _loc9_ = _loc3_.indexOf("#");
         if(_loc9_ != -1)
         {
            var _loc14_ = getKeyStr(_loc3_.substring(_loc9_ + 1));
            _loc3_ = _loc3_.substring(0,_loc9_);
            btn.txt.text = _loc3_;
            var _loc6_ = btn.txt.textWidth + 5;
            var _loc2_ = list.attachMovie("keyMc","keyMc",list.getNextHighestDepth());
            _loc2_.btn = btn;
            _loc2_.onRollOver = function()
            {
               this.btn.onRollOver();
            };
            _loc2_.onRollOut = btn.onReleaseOutside = function()
            {
               this.btn.onRollOut();
            };
            _loc2_.onPress = function()
            {
               this.btn.onPress();
            };
            _loc2_.onRelease = function()
            {
               this.btn.onRelease();
            };
            _loc2_._y = btn._y + 13;
            _loc2_.bg.hitTestDisable = true;
            _loc2_.textFd.text = _loc14_;
            var _loc5_ = Math.max(_loc2_.textFd.textWidth + 5,14);
            var _loc24_ = _loc5_ - 14;
            var _loc7_ = 20 + _loc24_;
            var _loc21_ = _loc7_ + _loc6_;
            if(_loc21_ > 385)
            {
               _loc5_ = _loc7_ <= 80?_loc5_:74;
               _loc6_ = _loc7_ <= 80?385 - _loc7_:305;
            }
            btn.txt._width = _loc6_;
            _loc2_.textFd._width = _loc5_;
            _loc2_.textFd.setText(_loc14_);
            _loc2_.bg._width = _loc5_ + 6;
            _loc2_._x = btn._x + btn.txt._x + _loc6_;
         }
         btn.txt.setText(_loc3_);
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
            ToGame_VillagerDialog_SelectBtn(this.id);
            this.txt.textColor = lib.info.TextColor.UI_VILLAGERDIALOG_BTN_OVER;
            this.txt._y = 11;
         };
         _loc4_ = _loc4_ + 1;
      }
   }
   scrollBar.__set__pageSize(list._height);
   if(575 < readY)
   {
      container_mc.doScroll_mc.gotoAndPlay(2);
      apply_btn.setEnabled(false,100);
   }
   else
   {
      container_mc.doScroll_mc.gotoAndStop(1);
      allRead = true;
      checkApplyEnable();
   }
   if(bSelectableRequitalComplete > 0)
   {
      apply_btn.setEnabled(false,100);
   }
   var _loc20_ = rewardTitles.split("\t");
   _loc4_ = 0;
   while(_loc4_ < 3)
   {
      if(_loc20_[_loc4_] != "" && _loc20_[_loc4_] != undefined)
      {
         list["bosang" + (4 - _loc4_)].txt.text = _loc20_[_loc4_];
      }
      _loc4_ = _loc4_ + 1;
   }
};
var x_btn = new lib.util.TxtBtn(container_mc.x_mc);
var apply_btn = new lib.util.TxtBtn(container_mc.applyBtn.btn,container_mc.applyBtn.txt);
apply_btn.setVisible(false);
apply_btn.setRelease(ToGame_VillagerDialog_SelectApply);
close_btn.setRelease(closeUI);
x_btn.setRelease(closeUI);
container_mc.darkBgMc._visible = false;
fscommand("ToGame_VillagerDialog_Init");
