function ToGame_Social_Init()
{
   fscommand("ToGame_Social_Init");
}
function ToGame_Social_CloseUI()
{
   fscommand("ToGame_Social_CloseUI");
}
function ToGame_Social_ClickTab(_tabIndex, _noRequestEvent)
{
   if(_tabIndex != clickedTab)
   {
      container_mc.defaultStr._visible = false;
   }
   wordMcClear();
   clickedSlot = null;
   if(_noRequestEvent == 0)
   {
      getURL("FSCommand:ToGame_Social_ClickTab",_tabIndex);
   }
}
function ToGame_Social_SelectSlot(_ID)
{
   getURL("FSCommand:ToGame_Social_SelectSlot",_ID);
}
function ToGame_Social_UseSlot(_ID, _type)
{
   getURL("FSCommand:ToGame_Social_UseSlot",_ID + "\t" + _type);
}
function ToGame_Social_Register()
{
   if(registerBtn.btn.enabled != false)
   {
      var _loc1_ = wordTxt.textField.text;
      getURL("FSCommand:ToGame_Social_Register",_loc1_);
      clickedSlot.active = false;
      clickedSlot = null;
      wordMcClear();
   }
}
function ToGame_Social_Return()
{
   fscommand("ToGame_Social_Return");
   bReturn = true;
}
function listReset(_targetMc)
{
   for(var _loc2_ in _targetMc)
   {
      if(typeof _targetMc[_loc2_] == "movieclip")
      {
         _targetMc[_loc2_].removeMovieClip();
      }
   }
}
function setTypeOneList(_lData, _cData)
{
   var _listMc = container_mc.list.list;
   var _listInfo = new Array();
   var _loc21_ = new Array();
   var _loc16_ = lib.util.ExtString.split(_cData,"\n");
   var _categoryLength = _loc16_.length;
   if(_loc16_[_categoryLength - 1] == "0" || _loc16_[_categoryLength - 1] == "undefined" || _loc16_[_categoryLength - 1] == "")
   {
      _loc16_.splice(_categoryLength - 1,1);
      _categoryLength = _loc16_.length;
   }
   var _loc12_ = null;
   var _cMc = null;
   var _loc8_ = 0;
   var _loc14_ = 0;
   var i = 0;
   while(i < _categoryLength)
   {
      _loc12_ = lib.util.ExtString.split(_loc16_[i],"\t");
      _cMc = _listMc.attachMovie("category_mc","category__" + String(i),_listMc.getNextHighestDepth(),{_y:_loc14_,_width:SLOT_WIDTH * 2 + SLOT_SPACE});
      _cMc.txt.htmlText = _loc12_[CATEGORYINFO_TITLE];
      _loc8_ = Number(_loc12_[CATEGORYINFO_SLOTCOUNT]);
      if(_loc8_ % 2 != 0)
      {
         _loc8_ = _loc8_ + 1;
      }
      _loc8_ = _loc8_ / 2;
      _loc14_ = _loc14_ + (CATEGORY_HEIGHT + SLOT_SPACE + (SLOT_HEIGHT + SLOT_SPACE) * _loc8_);
      _listInfo[i] = [];
      i++;
   }
   var _loc15_ = lib.util.ExtString.split(_lData,"\n");
   var _listLength = _loc15_.length;
   if(_loc15_[_listLength - 1] == "0" || _loc15_[_listLength - 1] == "undefined" || _loc15_[_listLength - 1] == "")
   {
      _loc15_.splice(_listLength - 1,1);
      _listLength = _loc15_.length;
   }
   if(_listLength == 0)
   {
      container_mc.defaultStr._visible = true;
   }
   var _loc9_ = null;
   var _loc13_ = null;
   var _loc17_ = -1;
   i = 0;
   while(i < _listLength)
   {
      _loc9_ = lib.util.ExtString.split(_loc15_[i],"\t");
      _loc17_ = Number(_loc9_[SLOTINFO_CATEGORYINDEX]);
      _loc9_[SLOTINFO_INDEX] = i;
      _listInfo[_loc17_].push(_loc9_);
      _loc13_ = _listMc.attachMovie("Slot2_link","social__" + String(_loc9_[SLOTINFO_ID]),_listMc.getNextHighestDepth());
      _loc13_._visible = false;
      i++;
   }
   var delay = 0;
   _loc13_.onEnterFrame = function()
   {
      delay++;
      if(delay > 1)
      {
         delete this.onEnterFrame;
         var _loc8_ = 0;
         i = 0;
         while(i < _categoryLength)
         {
            _cMc = _listMc["category__" + String(i)];
            _loc8_ = _cMc._y + _cMc._height + SLOT_SPACE;
            var _loc2_ = 0;
            while(_loc2_ < _listInfo[i].length)
            {
               var _loc3_ = _listInfo[i][_loc2_];
               var _loc7_ = int(_loc2_ / 2);
               var _loc6_ = _loc2_ % 2;
               var _loc5_ = _loc6_ * (SLOT_WIDTH + SLOT_SPACE);
               var _loc4_ = _loc8_ + _loc7_ * (SLOT_HEIGHT + SLOT_SPACE);
               _list = _listMc["social__" + String(_loc3_[SLOTINFO_ID])];
               _list._x = _loc5_;
               _list._y = _loc4_;
               _list._visible = true;
               setSlot(_list,_loc3_);
               _loc2_ = _loc2_ + 1;
            }
            if(_listInfo[i].length % 2 == 1)
            {
               var _loc9_ = _listInfo[i].length;
               _loc7_ = int(_loc9_ / 2);
               _loc6_ = _loc9_ % 2;
               _loc5_ = _loc6_ * (SLOT_WIDTH + SLOT_SPACE);
               _loc4_ = _loc8_ + _loc7_ * (SLOT_HEIGHT + SLOT_SPACE);
               _list = _listMc.attachMovie("Slot2_link","social__" + String(_listLength),_listMc.getNextHighestDepth(),{_x:_loc5_,_y:_loc4_});
               setEmptySlot(_list);
               _listLength++;
            }
            i++;
         }
         _listMc.hit._height = _list._y + _list._height;
         listScroll.pageSize = _listMc._height + 3;
      }
   };
}
function setSlot(_slot, _info)
{
   _slot.setLineNum(2);
   _slot.SLOT.enabled = true;
   _slot.Slot.SLOT.enabled = true;
   _slot.Slot.num_txt._visible = false;
   _slot.center_txt._visible = true;
   _slot.showBg();
   _slot.Slot.hideBg();
   _slot.up_txt.htmlText = true;
   _slot.center_txt.htmlText = true;
   _slot.up_txt._y = _slot.up_txt._y + 7;
   _slot.center_txt._y = _slot.center_txt._y + 10;
   _slot._ID = _info[SLOTINFO_ID];
   _slot.draw(_info[SLOTINFO_ICONIMG]);
   _slot.upText = _info[SLOTINFO_TITLE];
   _slot.centerText = _info[SLOTINFO_WORD];
   _slot._impossibleNum = _info[SLOTINFO_IMPOSSIBLE];
   if(_info[SLOTINFO_IMPOSSIBLE] != "2")
   {
      _slot.center_txt.textColor = 15828736;
   }
   _slot.onEnterFrame = function()
   {
      delete this.onEnterFrame;
      if(this._impossibleNum == "2")
      {
         this.impossible = true;
      }
   };
   _slot.onRelease2 = function()
   {
      if(this != clickedSlot)
      {
         ToGame_Social_SelectSlot(this._ID);
         clickedSlot.active = false;
         this.active = true;
         clickedSlot = this;
         while(pressedSlots.length > 0)
         {
            var _loc3_ = pressedSlots.pop();
            _root.checkStartDrag(false,_loc3_,_loc3_.Slot.Icon);
         }
      }
   };
   _slot.onPress2 = function()
   {
      pressedSlots.push(this);
      if(this != pressedSlot)
      {
         pressedSlot.FX_PRESS._visible = false;
         pressedSlot = this;
      }
   };
   lib.manager.ToolTip.add(_slot.SLOT,_slot._ID,6,_slot.Slot.Icon);
}
function setEmptySlot(_slot)
{
   _slot.drag = false;
   _slot._idx = _listLength;
   _slot._ID = undefined;
   _slot.hideBg();
   _slot.SLOT.enabled = false;
   _slot.Slot.SLOT.enabled = false;
}
function wordMcClear()
{
   var _loc1_ = lib.util.UIString.getUIString("$510007");
   bReturn = false;
   wordMc.titleFd.text = _loc1_;
   wordTxt.text = "";
   wordTxt.textField.selectable = false;
   registerBtn.setEnabled(false);
   returnBtn.setEnabled(false);
}
var UI = this;
UI._visible = false;
var UIname = "Social";
var bWindowOpen = false;
var clickedSlot = null;
var clickedTab = -1;
container_mc.defaultStr._visible = false;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
var listMc = container_mc.list;
var listScroll = listMc.scroll;
var scrollTarget = listMc.list;
listScroll.addListener(scrollTarget);
var listY = scrollTarget._y;
scrollTarget.onScroll = function()
{
   this._y = listY - arguments[0];
};
listScroll.setWheel(scrollTarget);
listScroll.wheelDelta = 1;
listScroll.pageSize = 0;
listScroll.displaySize = listMc.mask_mc._height;
listScroll.defaultBarSizeRatio = 0.3333333333333333;
listScroll.rowHeight = 30;
listScroll.scroll = 0;
var wordMc = container_mc.word_mc;
var wordTxt = new lib.util.ExtTextField(wordMc.wordFd,0,wordMc.wordFd_focus);
wordMc.wordFd.pasteFromClipboard = function()
{
};
wordTxt.textField.selectable = false;
wordTxt.onChanged = function()
{
   lib.util.StrByteLen.getLenth3(wordMc.wordFd,maxChar);
   if(bReturn == false)
   {
      if(wordTxt.text == pWords)
      {
         registerBtn.setEnabled(false);
      }
      else
      {
         registerBtn.setEnabled(true);
      }
   }
};
var registerBtn = wordMc.registerBtn.txtBtn;
registerBtn.setRelease(ToGame_Social_Register);
registerBtn.setEnabled(false);
var returnBtn = wordMc.returnBtn.txtBtn;
returnBtn.setRelease(ToGame_Social_Return);
returnBtn.setEnabled(false);
var tabBtn = container_mc.tabBtn.tab;
tabBtn.setRelease(ToGame_Social_ClickTab);
var closeBtn = new lib.util.TxtBtn(container_mc.x_mc);
closeBtn.setRelease(ToGame_Social_CloseUI);
var guideMessage = lib.util.UIString.getUIString("$510005");
var guideMc = container_mc.guide_mc;
guideMc.txt.htmlText = guideMessage;
var guideH = guideMc.txt.textHeight + 5;
guideMc.txt._height = guideH;
guideMc.bg._height = guideMc.txt._height + 8;
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
myListener.OnGame_Social_SetTab = function(_tabData)
{
   var _loc3_ = lib.util.ExtString.split(_tabData,"\t");
   var _loc2_ = _loc3_.length;
   if(_loc3_[_loc2_ - 1] == "0" || _loc3_[_loc2_ - 1] == "undefined" || _loc3_[_loc2_ - 1] == "")
   {
      _loc3_.splice(_loc2_ - 1,1);
   }
   _loc2_ = _loc3_.length;
   var _loc1_ = 0;
   while(_loc1_ < _loc2_)
   {
      bSlot[_loc1_] = false;
      _loc1_ = _loc1_ + 1;
   }
   container_mc.tabBtn.clear();
   container_mc.tabBtn.labels = _loc3_;
   tabBtn = container_mc.tabBtn.tab;
   tabBtn.setRelease(ToGame_Social_ClickTab);
   tabBtn.setTab(0,1);
   clickedTab = 0;
};
myListener.OnGame_Social_SelectTab = function(_tabNum)
{
   _tabNum = Number(_tabNum);
   tabBtn.setTab(_tabNum,1);
   clickedTab = _tabNum;
};
var SLOT_WIDTH = 212;
var SLOT_HEIGHT = 62.5;
var SLOT_SPACE = 3;
var SLOT_COUNT_OF_ONEPAGE = 12;
var SLOTINFO_ID = 0;
var SLOTINFO_ICONIMG = 1;
var SLOTINFO_TITLE = 2;
var SLOTINFO_WORD = 3;
var SLOTINFO_IMPOSSIBLE = 4;
var SLOTINFO_CATEGORYINDEX = 5;
var SLOTINFO_INDEX = 6;
myListener.OnGame_Social_SetList = function(_type, _lData, _cData)
{
   var _loc2_ = container_mc.list.list;
   listReset(_loc2_);
   listScroll.pageSize = 0;
   listScroll.scroll = 0;
   _type = Number(_type);
   if(_type == 1)
   {
      setTypeOneList(_lData,_cData);
   }
   else
   {
      var _loc16_ = [];
      var _loc8_ = lib.util.ExtString.split(_lData,"\n");
      var _loc5_ = _loc8_.length;
      if(_loc8_[_loc5_ - 1] == "0" || _loc8_[_loc5_ - 1] == "undefined" || _loc8_[_loc5_ - 1] == "")
      {
         _loc8_.splice(_loc5_ - 1,1);
         _loc5_ = _loc8_.length;
      }
      if(_loc5_ == 0)
      {
         container_mc.defaultStr._visible = true;
      }
      var _loc7_ = null;
      var _loc3_ = null;
      var _loc6_ = 0;
      var _loc4_ = 0;
      var _loc1_ = 0;
      while(_loc1_ < _loc5_)
      {
         _loc7_ = lib.util.ExtString.split(_loc8_[_loc1_],"\t");
         _loc6_ = int(_loc1_ / 2);
         _loc4_ = _loc1_ % 2;
         _loc3_ = _loc2_.attachMovie("Slot2_link","social__" + String(_loc7_[SLOTINFO_ID]),_loc2_.getNextHighestDepth(),{_x:_loc4_ * (SLOT_WIDTH + SLOT_SPACE),_y:_loc6_ * (SLOT_HEIGHT + SLOT_SPACE)});
         setSlot(_loc3_,_loc7_);
         _loc1_ = _loc1_ + 1;
      }
      var _loc10_ = SLOT_COUNT_OF_ONEPAGE - _loc5_;
      if(_loc10_ > 0)
      {
         _loc1_ = _loc5_;
         while(_loc1_ < SLOT_COUNT_OF_ONEPAGE)
         {
            _loc6_ = int(_loc1_ / 2);
            _loc4_ = _loc1_ % 2;
            _loc3_ = _loc2_.attachMovie("Slot2_link","social__" + String(_loc1_),_loc2_.getNextHighestDepth(),{_x:_loc4_ * (SLOT_WIDTH + SLOT_SPACE),_y:_loc6_ * (SLOT_HEIGHT + SLOT_SPACE)});
            setEmptySlot(_loc3_);
            _loc1_ = _loc1_ + 1;
         }
         _loc5_ = SLOT_COUNT_OF_ONEPAGE;
      }
      else if(_loc5_ % 2 == 1)
      {
         _loc6_ = int(_loc5_ / 2);
         _loc4_ = _loc5_ % 2;
         _loc3_ = _loc2_.attachMovie("Slot2_link","social__" + String(_loc5_),_loc2_.getNextHighestDepth(),{_x:_loc4_ * (SLOT_WIDTH + SLOT_SPACE),_y:_loc6_ * (SLOT_HEIGHT + SLOT_SPACE)});
         setEmptySlot(_loc3_);
      }
      var _loc11_ = Number(_loc5_ - 1);
      var _loc12_ = int(_loc11_ / 2) * (SLOT_HEIGHT + SLOT_SPACE);
      _loc2_.hit._height = _loc12_ + SLOT_HEIGHT;
      if(_loc5_ <= SLOT_COUNT_OF_ONEPAGE)
      {
         listScroll.pageSize = _loc2_._height;
      }
      else
      {
         listScroll.pageSize = _loc2_._height + 3;
      }
   }
};
var pWords = "";
var bReturn = false;
myListener.OnGame_Social_SetWord = function(_title, _words)
{
   var _loc2_ = lib.util.UIString.getUIString("$510006");
   wordMc.titleFd.text = _title;
   pWords = _words;
   wordTxt.text = _words;
   Selection.setFocus(wordTxt.textField);
   wordTxt.textField.selectable = true;
   returnBtn.setEnabled(true);
   if(bReturn)
   {
      registerBtn.setEnabled(true);
      pWords = "";
      bReturn = false;
   }
};
var maxChar = 0;
myListener.OnGame_Social_SetMaxChar = function(_maxChar)
{
   maxChar = Number(_maxChar);
};
myListener.OnGame_Social_UpdateSlot = function(_lData)
{
   var _loc6_ = container_mc.list.list;
   var _loc4_ = lib.util.ExtString.split(_lData,"\n");
   var _loc5_ = _loc4_.length;
   if(_loc4_[_loc5_ - 1] == "0" || _loc4_[_loc5_ - 1] == "undefined" || _loc4_[_loc5_ - 1] == "")
   {
      _loc4_.splice(_loc5_ - 1,1);
      _loc5_ = _loc4_.length;
   }
   var _loc1_ = null;
   var _loc2_ = null;
   var _loc3_ = 0;
   while(_loc3_ < _loc5_)
   {
      _loc2_ = lib.util.ExtString.split(_loc4_[_loc3_],"\t");
      _loc1_ = _loc6_["social__" + String(_loc2_[SLOTINFO_ID])];
      _loc1_._ID = _loc2_[SLOTINFO_ID];
      _loc1_.draw(_loc2_[SLOTINFO_ICONIMG]);
      _loc1_.upText = _loc2_[SLOTINFO_TITLE];
      _loc1_.centerText = _loc2_[SLOTINFO_WORD];
      if(_loc2_[SLOTINFO_IMPOSSIBLE] == "2")
      {
         _loc1_.center_txt.textColor = lib.info.TextColor.SLOT_CENTER;
         _loc1_.impossible = true;
      }
      else
      {
         _loc1_.impossible = false;
         _loc1_.center_txt.textColor = 15828736;
      }
      _loc3_ = _loc3_ + 1;
   }
};
var rightClicked = false;
var targetID = null;
var rightClickedTarget = null;
myListener.OnGame_MouseDown = function(button, target)
{
   button = Number(button);
   if(button == 2)
   {
      if(target._parent._parent._parent._parent._parent.UIname == UIname)
      {
         rightClicked = true;
         rightClickedTarget = target._parent;
         targetID = rightClickedTarget._ID;
         rightClickedTarget.drag = false;
         if(targetID != undefined)
         {
            ToGame_Social_UseSlot(targetID,0);
         }
      }
   }
};
myListener.OnGame_MouseUp = function(button, target)
{
   button = Number(button);
   if(button == 2)
   {
      if(rightClicked)
      {
         rightClicked = false;
         rightClickedTarget.drag = true;
         if(targetID != undefined)
         {
            ToGame_Social_UseSlot(targetID,1);
         }
         rightClickedTarget = null;
         targetID = null;
      }
   }
};
var CATEGORYINFO_INDEX = 0;
var CATEGORYINFO_TITLE = 1;
var CATEGORYINFO_SLOTCOUNT = 2;
var CATEGORY_HEIGHT = 30;
var pressedSlot;
var pressedSlots = [];
ToGame_Social_Init();
