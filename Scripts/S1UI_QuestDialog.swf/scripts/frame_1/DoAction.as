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
   list.aimContainer._visible = false;
   list.complete_txt._visible = false;
   list.noAccepted_txt._visible = false;
   list.questName_txt._visible = false;
   list.nameBg_mc._visible = false;
   list.groupMc._visible = false;
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
function ToGame_QuestDialog_SelectBtn(btnId)
{
   getURL("FSCommand:ToGame_QuestDialog_SelectBtn",btnId);
}
function ToGame_QuestDialog_CloseUI()
{
   fscommand("ToGame_QuestDialog_CloseUI");
}
function ToGame_QuestDialog_SelectApply()
{
   if(requitalSelect)
   {
      if(selectRequitalItemList.selectedSlot != null)
      {
         getURL("FSCommand:ToGame_QuestDialog_SelectApply",selectRequitalItemList.selectedSlot.id);
      }
   }
   else
   {
      fscommand("ToGame_QuestDialog_SelectApply");
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
   ToGame_QuestDialog_CloseUI();
}
var UI = this;
UI._visible = false;
var UIname = "QuestDialog";
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
var ft = list.aimContainer.txt.getTextFormat();
ft.tabStops = [150];
list.aimContainer.txt.setNewTextFormat(ft);
list.aimContainer._visible = false;
list.complete_txt._visible = false;
list.noAccepted_txt._visible = false;
list.questName_txt._visible = false;
list.nameBg_mc._visible = false;
list.groupMc._visible = false;
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
myListener.OnGame_QuestDialog_SetTitleText = function(str)
{
   container_mc.text_name.text = str;
};
myListener.OnGame_QuestDialog_CreateApplyBtn = function(bTrue, applyBtnStr)
{
   bTrue = Number(bTrue);
   if(bTrue)
   {
      apply_btn.setVisible(true);
      apply_btn.setEnabled(false,100);
      close_btn.setText("$181006");
      apply_btn.setText(applyBtnStr);
   }
   else
   {
      apply_btn.setVisible(false);
      close_btn.setText("$181003");
   }
};
myListener.OnGame_QuestDialog_SetDialogCompleted = function(storyGroup, questName, questType, htmlText)
{
   clearInformation();
   list.groupMc._visible = storyGroup != undefined && storyGroup != "";
   list.groupMc.txt.text = storyGroup;
   var _loc1_ = !list.groupMc._visible?null:list.groupMc;
   list.questName_txt.htmlText = questName;
   list.questName_txt._visible = questName != undefined && questName != "";
   list.nameBg_mc._visible = list.questName_txt._visible;
   list.nameBg_mc._y = _loc1_ == null?1:22;
   list.questName_txt._y = list.nameBg_mc._y + 12;
   _loc1_ = !list.questName_txt._visible?_loc1_:list.questName_txt;
   list.complete_txt._visible = true;
   list.complete_txt._y = _loc1_ == null?10:_loc1_._y + _loc1_._height + 15;
   _loc1_ = list.questCompleteMc;
   list.dialog_txt.htmlText = htmlText;
   list.dialog_txt._y = _loc1_._y + _loc1_._height + 10;
   lib.util.ExtString.alignJoint(list.dialog_txt);
   list.dialog_txt._visible = htmlText != "" && htmlText != undefined && htmlText != "undefined";
   list.dialog_txt._height = dialog.dialog_txt.textHeight + 5;
   scrollBar.__set__pageSize(list._height);
};
myListener.OnGame_QuestDialog_SetDialogNoAccepted = function(storyGroup, questName, htmlText, conditionQuest, questType)
{
   clearInformation();
   list.groupMc._visible = storyGroup != undefined && storyGroup != "";
   list.groupMc.txt.text = storyGroup;
   var _loc1_ = !list.groupMc._visible?null:list.groupMc;
   list.questName_txt.htmlText = questName;
   list.questName_txt._visible = questName != undefined && questName != "";
   list.nameBg_mc._visible = questName != undefined && questName != "";
   list.nameBg_mc._y = _loc1_ == null?1:22;
   list.questName_txt._y = list.nameBg_mc._y + 12;
   _loc1_ = !list.questName_txt._visible?_loc1_:list.questName_txt;
   list.noAccepted_txt._visible = true;
   list.noAccepted_txt._y = _loc1_ == null?10:_loc1_._y + _loc1_._height + 15;
   _loc1_ = list.noAccepted_txt;
   list.dialog_txt.htmlText = htmlText;
   list.dialog_txt._y = _loc1_ == null?10:_loc1_._y + _loc1_._height + 10;
   lib.util.ExtString.alignJoint(list.dialog_txt);
   list.dialog_txt._visible = true;
   list.dialog_txt._height = list.dialog_txt.textHeight + 5;
   var _loc5_ = list.dialog_txt._y + list.dialog_txt.textHeight + 15;
   if(conditionQuest != "" && conditionQuest != "undefined" && conditionQuest != undefined)
   {
      list.aimContainer._visible = true;
      list.aimContainer._y = _loc5_;
      list.aimContainer.title_txt._visible = true;
      list.aimContainer.txt.htmlText = conditionQuest;
      lib.util.ExtString.alignJoint(list.aimContainer.txt);
      list.aimContainer.txt._height = list.aimContainer.txt.textHeight + 5;
      list.aimContainer.txt._y = list.aimContainer.title_txt._y + list.aimContainer.title_txt._height + 15;
      list.aimContainer.bg._height = list.aimContainer.txt._y + list.aimContainer.txt._height + 30;
   }
   scrollBar.__set__pageSize(list._height);
};
var baseRequitalItemList = new lib.util.List(list.slots_mc,"baseRequitalItem",btnYGap);
var repeatRequitalItemList = new lib.util.List(list.slots2_mc,"repeatRequitalItem",btnYGap);
var selectRequitalItemList = new lib.util.List(list.slots3_mc,"selectRequitalItem",btnYGap);
var AddRequitalItemDataList = new lib.util.List(list.slots4_mc,"AddRequitalItem",btnYGap);
baseRequitalItemList.useTile = true;
repeatRequitalItemList.useTile = true;
selectRequitalItemList.useTile = true;
AddRequitalItemDataList.useTile = true;
var requitalSelect = null;
myListener.OnGame_QuestDialog_SetDialog = function(dialogText, dialogBtnData, bBaseRequitalComplete, baseRequitalItemData, repayMoney, bRepeatRequitalComplete, repeatRequitalCompleteNum, repeatRequitalItemData, bSelectableRequitalComplete, selectableRequitalCompleteNum, selectableRequitalItemData, bReduceRepeatQuestReward, questType, bAddRequitalComplete, AddRequitalItemData, rewardTitles, pointInfo, repayGoldType)
{
   clearInformation();
   bBaseRequitalComplete = Number(bBaseRequitalComplete);
   bRepeatRequitalComplete = Number(bRepeatRequitalComplete);
   repeatRequitalCompleteNum = Number(repeatRequitalCompleteNum);
   bSelectableRequitalComplete = Number(bSelectableRequitalComplete);
   selectableRequitalCompleteNum = Number(selectableRequitalCompleteNum);
   bReduceRepeatQuestReward = Number(bReduceRepeatQuestReward);
   bAddRequitalComplete = Number(bAddRequitalComplete);
   container_mc.darkBgMc._visible = questType == "5";
   list.dialog_txt.htmlText = dialogText;
   lib.util.ExtString.alignJoint(list.dialog_txt);
   list.dialog_txt._height = list.dialog_txt.textHeight + 5;
   attachLine = list.dialog_txt._y + list.dialog_txt._height + 25;
   readY = attachLine - 20;
   lib.util.ExtString.alignJoint(list.dialog_txt);
   if(pointInfo != "" && pointInfo != undefined)
   {
      var _loc23_ = list.attachMovie("pointguide","pointGuide",list.getNextHighestDepth());
      _loc23_.txt.htmlText = pointInfo;
      _loc23_.txt._height = _loc23_.txt.textHeight + 4;
      _loc23_._x = btnX + 12;
      _loc23_._y = attachLine + 15;
      attachLine = attachLine + (_loc23_._height + 20);
   }
   if(bBaseRequitalComplete >= 0 && (baseRequitalItemData != undefined && baseRequitalItemData != ""))
   {
      var _loc20_ = list.attachMovie("bosang","bosang",list.getNextHighestDepth());
      if(bBaseRequitalComplete == 0)
      {
         _loc20_.txt.text = lib.util.UIString.getUIString("$181016");
      }
      else
      {
         _loc20_.txt.text = lib.util.UIString.getUIString("$181016") + completeStr;
      }
      _loc20_.txt.textAutoSize = "shrink";
      _loc20_._x = -8;
      _loc20_._y = attachLine;
      attachLine = attachLine + (5 + _loc20_._height);
      list.slots_mc._y = attachLine;
      var _loc9_ = baseRequitalItemData.split("\n");
      if(_loc9_[_loc9_.length - 1] == "0" || _loc9_[_loc9_.length - 1] == "undefined" || _loc9_[_loc9_.length - 1] == "")
      {
         _loc9_.splice(_loc9_.length - 1,1);
      }
      if(_loc9_.length >= 1)
      {
         list.blet1_mc._visible = true;
         var _loc3_ = 0;
         while(_loc3_ < _loc9_.length)
         {
            var _loc8_ = _loc9_[_loc3_].split("\t");
            var slot = baseRequitalItemList.add(_loc8_[0],"Slot4_link");
            slot.guidNum_mc._visible = false;
            slot.BG.bg._visible = false;
            slot.effect = false;
            slot.img = _loc8_[1];
            var _loc7_ = Number(_loc8_[2]);
            var _loc15_ = Number(_loc8_[4]);
            var itemType = Number(_loc8_[6]);
            var _loc4_ = "";
            if(_loc7_ > 0)
            {
               _loc4_ = "+" + _loc7_ + _loc8_[3];
            }
            else
            {
               _loc4_ = _loc8_[3];
            }
            slot.upTxt = _loc4_;
            slot.downTxt = _loc15_;
            slot.useable = _loc8_[5];
            slot.itemType = _loc8_[6];
            slot.grade = _loc8_[7];
            slot._sealType = _loc8_[8];
            slot._masterpiece = _loc8_[9];
            var goldType = 0;
            if(_loc8_[11] != undefined && _loc8_[11] != "" && _loc8_[11] != "undefined")
            {
               goldType = Number(_loc8_[11]);
            }
            slot.goldType = goldType;
            SetMultiply(slot.multiply,Number(_loc8_[10]));
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
            _loc3_ = _loc3_ + 1;
         }
         list.slots_mc._y = attachLine;
         attachLine = attachLine + list.slots_mc._height;
      }
      attachLine = list.slots_mc._y + list.slots_mc._height + btnYGap;
   }
   if(bReduceRepeatQuestReward)
   {
      var _loc21_ = list.attachMovie("guide","reduceGuide",list.getNextHighestDepth());
      _loc21_.txt.text = lib.util.UIString.getUIString("$181019");
      _loc21_.txt._height = _loc21_.txt.textHeight + 4;
      _loc21_._x = btnX + 10;
      _loc21_._y = attachLine + 3;
      attachLine = attachLine + (_loc21_._height + 3);
   }
   if(bAddRequitalComplete >= 0 && (AddRequitalItemData != undefined && AddRequitalItemData != ""))
   {
      var _loc19_ = list.attachMovie("bosang","bosang4",list.getNextHighestDepth());
      _loc19_.type.gotoAndStop(3);
      if(bAddRequitalComplete == 0)
      {
         _loc19_.txt.text = lib.util.UIString.getUIString("$$091038");
      }
      else
      {
         _loc19_.txt.text = lib.util.UIString.getUIString("$$091039");
      }
      _loc19_.txt.textAutoSize = "shrink";
      _loc19_._x = -8;
      _loc19_._y = attachLine;
      attachLine = attachLine + (5 + _loc19_._height);
      list.slots4_mc._y = attachLine;
      var _loc12_ = AddRequitalItemData.split("\n");
      if(_loc12_[_loc12_.length - 1] == "0" || _loc12_[_loc12_.length - 1] == "undefined" || _loc12_[_loc12_.length - 1] == "")
      {
         _loc12_.splice(_loc12_.length - 1,1);
      }
      if(_loc12_.length >= 1)
      {
         list.blet1_mc._visible = true;
         _loc3_ = 0;
         while(_loc3_ < _loc12_.length)
         {
            _loc8_ = _loc12_[_loc3_].split("\t");
            var slot = AddRequitalItemDataList.add(_loc8_[0],"Slot4_link");
            slot.guidNum_mc._visible = false;
            slot.BG.bg._visible = false;
            slot.effect = false;
            slot.img = _loc8_[1];
            _loc7_ = Number(_loc8_[2]);
            _loc15_ = Number(_loc8_[4]);
            var itemType = Number(_loc8_[6]);
            var goldType = 0;
            if(_loc8_[11] != undefined && _loc8_[11] != "" && _loc8_[11] != "undefined")
            {
               goldType = Number(_loc8_[11]);
            }
            _loc4_ = "";
            if(_loc7_ > 0)
            {
               _loc4_ = "+" + _loc7_ + _loc8_[3];
            }
            else
            {
               _loc4_ = _loc8_[3];
            }
            slot.upTxt = _loc4_;
            slot.downTxt = _loc15_;
            slot.useable = _loc8_[5];
            slot.itemType = _loc8_[6];
            slot.grade = _loc8_[7];
            slot._sealType = _loc8_[8];
            slot._masterpiece = _loc8_[9];
            slot.goldType = goldType;
            SetMultiply(slot.multiply,Number(_loc8_[10]));
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
                  this.down_txt.textColor = 16777215;
                  if(this.useable != undefined)
                  {
                     this.impossible = Number(this.useable);
                  }
               }
            };
            _loc3_ = _loc3_ + 1;
         }
         list.slots4_mc._y = attachLine;
         attachLine = attachLine + list.slots4_mc._height;
      }
      attachLine = list.slots4_mc._y + list.slots4_mc._height + btnYGap * 2;
   }
   if(bRepeatRequitalComplete >= 0 && (repeatRequitalItemData != undefined && repeatRequitalItemData != ""))
   {
      var _loc22_ = list.attachMovie("bosang","bosang2",list.getNextHighestDepth());
      if(bRepeatRequitalComplete == 0)
      {
         _loc22_.txt.text = lib.util.UIString.getUIString("$181013","count",repeatRequitalCompleteNum);
      }
      else
      {
         _loc22_.txt.text = lib.util.UIString.getUIString("$181013","count",repeatRequitalCompleteNum) + completeStr;
      }
      _loc22_.txt.textAutoSize = "shrink";
      _loc22_._x = -8;
      _loc22_._y = attachLine + 10;
      attachLine = attachLine + (5 + _loc22_._height);
      list.slots2_mc._y = attachLine + 10;
      var _loc11_ = repeatRequitalItemData.split("\n");
      if(_loc11_[_loc11_.length - 1] == "0" || _loc11_[_loc11_.length - 1] == "undefined" || _loc11_[_loc11_.length - 1] == "")
      {
         _loc11_.splice(_loc11_.length - 1,1);
      }
      if(_loc11_.length >= 1)
      {
         _loc3_ = 0;
         while(_loc3_ < _loc11_.length)
         {
            _loc8_ = _loc11_[_loc3_].split("\t");
            var slot = repeatRequitalItemList.add(_loc8_[0],"Slot4_link");
            slot.guidNum_mc._visible = false;
            slot.BG.bg._visible = false;
            slot.effect = false;
            slot.img = _loc8_[1];
            _loc7_ = Number(_loc8_[2]);
            _loc15_ = Number(_loc8_[4]);
            var goldType = 0;
            if(_loc8_[11] != undefined && _loc8_[11] != "" && _loc8_[11] != "undefined")
            {
               this.goldType = Number(_loc8_[11]);
            }
            _loc4_ = "";
            if(_loc7_ > 0)
            {
               _loc4_ = "+" + _loc7_ + _loc8_[3];
            }
            else
            {
               _loc4_ = _loc8_[3];
            }
            slot.upTxt = _loc4_;
            slot.downTxt = _loc15_;
            slot.useable = _loc8_[5];
            slot.itemType = _loc8_[6];
            slot.grade = _loc8_[7];
            slot._sealType = _loc8_[8];
            slot._masterpiece = _loc8_[9];
            slot.goldType = goldType;
            SetMultiply(slot.multiply,Number(_loc8_[10]));
            if(_loc8_[6] == "2")
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
            _loc3_ = _loc3_ + 1;
         }
         attachLine = list.slots2_mc._y + list.slots2_mc._height + btnYGap * 4;
      }
   }
   if(bRepeatRequitalComplete >= 0 && repayMoney > 0)
   {
      var _loc26_ = list.attachMovie("repay","repay_mc",list.getNextHighestDepth());
      var goldType = 0;
      if(repayGoldType != "" && repayGoldtype != undefined && repayGoldtype != "undefined")
      {
         goldType = Number(repayGoldType);
      }
      var _loc16_ = lib.util.GoldCurrency.SetGoldText(repayMoney,0,0,0,goldType);
      _loc26_.txt.htmlText = _loc16_;
      _loc26_._x = btnX + 10;
      _loc26_._y = attachLine + 3;
      attachLine = attachLine + (_loc26_._height + btnYGap + 3);
   }
   if(bSelectableRequitalComplete >= 0 && (selectableRequitalItemData != undefined && selectableRequitalItemData != ""))
   {
      var _loc17_ = list.attachMovie("bosang","bosang3",list.getNextHighestDepth());
      _loc17_.type.gotoAndStop(2);
      if(bSelectableRequitalComplete == 0)
      {
         if(selectableRequitalCompleteNum <= 0)
         {
            _loc17_.txt.text = lib.util.UIString.getUIString("$181017");
         }
         else
         {
            _loc17_.txt.text = lib.util.UIString.getUIString("$181012","count",selectableRequitalCompleteNum);
         }
      }
      else if(selectableRequitalCompleteNum <= 0)
      {
         _loc17_.txt.text = lib.util.UIString.getUIString("$181017") + completeStr;
      }
      else
      {
         _loc17_.txt.text = lib.util.UIString.getUIString("$181012","count",selectableRequitalCompleteNum) + completeStr;
      }
      _loc17_.txt.textAutoSize = "shrink";
      _loc17_._x = -8;
      _loc17_._y = attachLine + 10;
      attachLine = attachLine + (5 + _loc17_._height);
      var _loc24_ = list.attachMovie("guide","guide_select",list.getNextHighestDepth());
      _loc24_.txt.text = "( " + lib.util.UIString.getUIString("$181015") + " )";
      _loc24_._x = btnX + 10;
      _loc24_._y = attachLine + 5;
      attachLine = attachLine + _loc24_._height;
      list.slots3_mc._y = attachLine + 10;
      var _loc13_ = selectableRequitalItemData.split("\n");
      if(_loc13_[_loc13_.length - 1] == "0" || _loc13_[_loc13_.length - 1] == "undefined" || _loc13_[_loc13_.length - 1] == "")
      {
         _loc13_.splice(_loc13_.length - 1,1);
      }
      if(_loc13_.length >= 1)
      {
         _loc3_ = 0;
         while(_loc3_ < _loc13_.length)
         {
            _loc8_ = _loc13_[_loc3_].split("\t");
            var slot = selectRequitalItemList.add(_loc8_[0],"Slot4_link");
            slot.guidNum_mc._visible = true;
            slot.img = _loc8_[1];
            _loc7_ = Number(_loc8_[2]);
            _loc15_ = Number(_loc8_[4]);
            var goldType = 0;
            if(_loc8_[11] != undefined && _loc8_[11] != "" && _loc8_[11] != "undefined")
            {
               goldType = Number(_loc8_[11]);
            }
            _loc4_ = "";
            if(_loc7_ > 0)
            {
               _loc4_ = "+" + _loc7_ + _loc8_[3];
            }
            else
            {
               _loc4_ = _loc8_[3];
            }
            slot.upTxt = _loc4_;
            slot.downTxt = _loc15_;
            slot.useable = _loc8_[5];
            slot.itemType = _loc8_[6];
            slot.grade = _loc8_[7];
            slot._sealType = _loc8_[8];
            slot._masterpiece = _loc8_[9];
            slot.goldType = goldType;
            SetMultiply(slot.multiply,Number(_loc8_[10]));
            if(_loc8_[6] == "2")
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
                  checkApplyEnable();
               };
            }
            _loc3_ = _loc3_ + 1;
         }
         attachLine = list.slots3_mc._y + list.slots3_mc._height + btnYGap * 4;
      }
   }
   var _loc10_ = dialogBtnData.split("\n");
   if(_loc10_[_loc10_.length - 1] == "0" || _loc10_[_loc10_.length - 1] == "undefined" || _loc10_[_loc10_.length - 1] == "")
   {
      _loc10_.splice(_loc10_.length - 1,1);
   }
   if(_loc10_.length >= 1)
   {
      list.blet1_mc._visible = true;
      _loc3_ = 0;
      while(_loc3_ < _loc10_.length)
      {
         _loc8_ = _loc10_[_loc3_].split("\t");
         var _loc2_ = list.attachMovie("dialog_btn","dialog_btn" + list.getNextHighestDepth(),list.getNextHighestDepth());
         _loc2_.stat = _loc3_;
         _loc2_._y = attachLine;
         attachLine = attachLine + (_loc2_._height + btnYGap);
         _loc2_._x = btnX;
         _loc2_.id = _loc8_[0];
         _loc2_.txt.text = _loc8_[1];
         _loc2_.onRollOver = function()
         {
            this.gotoAndStop(2);
            this.txt.textColor = lib.info.TextColor.UI_VILLAGERDIALOG_BTN_OVER;
         };
         _loc2_.onRollOut = _loc2_.onReleaseOutside = function()
         {
            this.gotoAndStop(1);
            this.txt.textColor = lib.info.TextColor.UI_VILLAGERDIALOG_BTN_NORMAL;
            this.txt._y = 11;
         };
         _loc2_.onPress = function()
         {
            this.gotoAndStop(3);
            this.txt.textColor = lib.info.TextColor.UI_VILLAGERDIALOG_BTN_PRESS;
            this.txt._y = 12;
         };
         _loc2_.onRelease = function()
         {
            ToGame_VillagerDialog_SelectBtn(this.id);
            this.txt.textColor = lib.info.TextColor.UI_VILLAGERDIALOG_BTN_OVER;
            this.txt._y = 11;
         };
         _loc3_ = _loc3_ + 1;
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
   var _loc14_ = rewardTitles.split("\t");
   _loc3_ = 0;
   while(_loc3_ < 3)
   {
      if(_loc14_[_loc3_] != "" && _loc14_[_loc3_] != undefined)
      {
         list["bosang" + (4 - _loc3_)].txt.text = _loc14_[_loc3_];
      }
      _loc3_ = _loc3_ + 1;
   }
};
var x_btn = new lib.util.TxtBtn(container_mc.x_mc);
var apply_btn = container_mc.applyBtn.txtBtn;
apply_btn.setVisible(false);
apply_btn.setRelease(ToGame_QuestDialog_SelectApply);
close_btn.setRelease(closeUI);
x_btn.setRelease(closeUI);
container_mc.darkBgMc._visible = false;
fscommand("ToGame_QuestDialog_Init");
