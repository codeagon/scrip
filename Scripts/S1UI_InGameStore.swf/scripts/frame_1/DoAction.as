function SetBtmPosition()
{
   if(container_mc.moneyBtn0._visible == false && container_mc.moneyBtn1._visible == false)
   {
      if(container_mc.moneyBox.MoneyIcon1)
      {
         container_mc.moneyBox._x = 285;
      }
      else
      {
         container_mc.moneyBox._x = 710;
      }
   }
   else
   {
      container_mc.moneyBox._x = 17;
   }
}
function ToGame_InGameStore_CloseUI()
{
   fscommand("ToGame_InGameStore_CloseUI");
}
function ToGame_InGameStore_Init()
{
   fscommand("ToGame_InGameStore_Init");
}
function ToGame_InGameStore_ComboBoxChange(_selectIndex, _comboType)
{
   getURL("FSCommand:ToGame_InGameStore_ComboBoxChange",_selectIndex + "\t" + _comboType);
}
function ToGame_InGameStore_TabClick(_index, _tabType)
{
   myListener.OnGame_InGameStore_TabFocus(_index,_tabType);
   getURL("FSCommand:ToGame_InGameStore_TabClick",_index + "\t" + _tabType);
}
function ToGame_InGameStore_PageChange(_indexPage)
{
   getURL("FSCommand:ToGame_InGameStore_PageChange",_indexPage);
}
function ToGame_InGameStore_ItemClick(_itemID, _type)
{
   getURL("FSCommand:ToGame_InGameStore_ItemClick",_itemID + "\t" + _type);
}
function ToGame_InGameStore_ItemDetailView(_itemID)
{
   getURL("FSCommand:ToGame_InGameStore_ItemDetailView",_itemID);
}
function ToGame_InGameStore_ItemComboBoxChange(_selectIndex, itemID)
{
   getURL("FSCommand:ToGame_InGameStore_ItemComboBoxChange",_selectIndex + "\t" + itemID);
}
function ToGame_InGameStore_AllBuy()
{
   fscommand("ToGame_InGameStore_AllBuy");
}
function ToGame_InGameStore_CoinReflesh()
{
   fscommand("ToGame_InGameStore_CoinReflesh");
}
function ToGame_InGameStore_CoinCharge()
{
   fscommand("ToGame_InGameStore_CoinCharge");
}
function TabBoxCreate(_Type, _Data, _WidthSize, _ReNewal)
{
   var _loc9_ = container_mc["tabBox" + _Type];
   var _loc3_ = _Data.Idx;
   if(_ReNewal)
   {
      var _loc10_ = _loc9_["icon" + _loc3_];
      _loc10_.removeMovieClip();
      if(_Data.Txt == null || _Data.Txt == undefined)
      {
         return undefined;
      }
   }
   var _loc1_ = undefined;
   var _loc8_ = "tabBtn" + _Data.Icon;
   var _loc11_ = "icon" + _loc3_;
   if(_Type > 1)
   {
      _loc8_ = "tabBtnSub";
   }
   _loc1_ = _loc9_.attachMovie(_loc8_,_loc11_,_loc3_);
   _loc1_.txt.text = _Data.Txt;
   _loc1_.iconType = _Data.Icon;
   _loc1_.id = _loc3_;
   _loc1_.tp = _Type;
   var _loc5_ = _WidthSize;
   var _loc6_ = _loc1_.txt.textWidth + 10;
   if(_loc6_ > _loc5_)
   {
      _loc1_.txt._width = _loc6_;
      _loc5_ = _loc6_ + 10;
      _loc1_.btn._width = _loc5_;
   }
   if(_Type < 2 && _Data.Num > 0)
   {
      var _loc7_ = _loc1_.attachMovie("newMc","new" + _Data.Idx,_loc3_ + 100);
      _loc7_.txt.text = _Data.Num;
      _loc7_._x = _loc1_.btn._width - 42;
   }
   if(_Data.Icon != 2)
   {
      setTabButton(_Type,_loc1_,true);
   }
   else
   {
      setTabButton(_Type,_loc1_,false);
   }
}
function setTabButton(_type, _Mc, _enable)
{
   var _loc1_ = new lib.util.TxtBtn(_Mc.btn,_Mc.txt);
   if(_enable)
   {
      _loc1_.setRelease(function()
      {
         ToGame_InGameStore_TabClick(_Mc.id,_Mc.tp);
      }
      );
      if(_type > 1)
      {
         _loc1_.setTextColor("0x638AAB","0xA9DFED","0xA9DFED","0x485460");
      }
      else
      {
         _loc1_.setTextColor("0xD7D7D7","0xFFFFFF","0xFFFFFF","0x485460");
      }
   }
   _loc1_.setEnabled(_enable);
}
function setItemButton(_Mc, _enable)
{
   var _loc1_ = new lib.util.TxtBtn(_Mc.btn,_Mc.txt);
   if(_enable)
   {
      _loc1_.setRelease(function()
      {
         ToGame_InGameStore_ItemClick(_Mc.id,_Mc.tp);
      }
      );
      _loc1_.setTextColor("0x83BBE4","0xFFFFFF","0xFFFFFF","0x485460");
   }
   _loc1_.setEnabled(_enable);
}
function setTabBoxPosition(_Type, _Align)
{
   var _loc4_ = [];
   var _loc7_ = [];
   var _loc5_ = container_mc["tabBox" + _Type];
   var _loc1_ = undefined;
   var _loc3_ = 0;
   for(str in _loc5_)
   {
      _loc1_ = _loc5_[str];
      _loc4_.unshift(_loc1_);
      _loc7_.unshift(_loc1_.btn);
   }
   var _loc8_ = _loc4_.length;
   var _loc2_ = 0;
   while(_loc2_ < _loc8_)
   {
      _loc1_ = _loc4_[_loc2_];
      if(_Align == -1)
      {
         _loc3_ = _loc3_ - (_loc1_._width + 2);
      }
      _loc1_._x = _loc3_;
      if(_Align == 1)
      {
         _loc3_ = _loc3_ + (_loc1_._width + 2);
      }
      _loc2_ = _loc2_ + 1;
   }
   setTabGroup(type,_loc7_);
}
function setComboBoxPosition()
{
   container_mc.tabTxt0.text = lib.util.UIString.getUIString("$500002");
   container_mc.tabTxt1.text = lib.util.UIString.getUIString("$500003");
   container_mc.tabTxt2.text = lib.util.UIString.getUIString("$500004");
   container_mc.comboBox0._x = container_mc.tabTxt0.textWidth + 25;
}
function clearBox(_ParentMc)
{
   for(str in _ParentMc)
   {
      var _loc1_ = _ParentMc[str];
      _loc1_.removeMovieClip();
   }
}
var UI = this;
UI._visible = false;
var UIname = "InGameStore";
this.bWindowOpen = false;
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
myListener.OnGameEventShowWindow = function(WindowName, bShow)
{
   if(WindowName.toLowerCase() == UIname.toLowerCase())
   {
      bWindowOpen = bShow;
      if(_global.gbUIMode && bWindowOpen)
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
   if(_global.gbUIMode && bWindowOpen)
   {
      UI._visible = true;
   }
   else
   {
      UI._visible = false;
   }
};
var mCurrentPage;
var mMaxPage;
var mPosX;
var mTab0 = [];
var mTab1 = [];
var mTab2 = [];
var mTab3 = [];
var mComBoData = [];
container_mc.btmBox0._visible = false;
container_mc.btmBox1._visible = false;
var iconTable = 4;
var iconMax = 16;
var STABSIZE = 68;
var MTABSIZE = 139;
var TCATTEXT = lib.util.UIString.getUIString("$500044");
var COINTEXT = lib.util.UIString.getUIString("$500043");
var BTNTEXT_0 = lib.util.UIString.getUIString("$500056");
var BTNTEXT_1 = lib.util.UIString.getUIString("$500057");
var x_btn = new lib.util.TxtBtn(container_mc.x_Btn);
x_btn.setRelease(ToGame_InGameStore_CloseUI);
var btm_btn = new lib.util.TxtBtn(container_mc.btmBox1.btmBtn.btn,container_mc.btmBox1.btmBtn.txt);
btm_btn.setTextColor("0x83BBE4","0xFFFFFF","0xFFFFFF","0x485460");
btm_btn.setRelease(ToGame_InGameStore_AllBuy);
var money_btn0 = new lib.util.TxtBtn(container_mc.moneyBtn0.btn,container_mc.moneyBtn0.txt);
money_btn0.setTextColor("0xD7D7D7","0xFFFFFF","0xFFFFFF","0x485460");
money_btn0.setRelease(ToGame_InGameStore_CoinReflesh);
var money_btn1 = new lib.util.TxtBtn(container_mc.moneyBtn1.btn,container_mc.moneyBtn1.txt);
money_btn1.setTextColor("0xD7D7D7","0xFFFFFF","0xFFFFFF","0x485460");
money_btn1.setRelease(ToGame_InGameStore_CoinCharge);
var TcatDisable = lib.gamedata.DefaultData.getDefaultUIData("TcatEnable").param0;
var TCATTYPE = lib.gamedata.DefaultData.getDefaultUIData("TcatEnable").param1;
TCATTYPE = 1;
myListener.OnGame_InGameStore_SetTab = function(_listData, _tabType)
{
   var _loc7_ = lib.util.ExtString.split(_listData,"\n");
   var _loc6_ = _loc7_.length;
   var _loc8_ = undefined;
   var _loc4_ = undefined;
   clearBox(container_mc["tabBox" + _tabType]);
   mPosX = 0;
   if(_loc6_ == 0)
   {
      return undefined;
   }
   switch(_tabType)
   {
      case 0:
         _loc8_ = 1;
         _loc4_ = MTABSIZE;
         break;
      case 1:
         _loc8_ = -1;
         _loc4_ = MTABSIZE;
         break;
      case 2:
         _loc8_ = 1;
         _loc4_ = STABSIZE;
         break;
      case 3:
         _loc8_ = -1;
         _loc4_ = STABSIZE;
   }
   var _loc3_ = 0;
   while(_loc3_ < _loc6_)
   {
      var _loc2_ = lib.util.ExtString.split(_loc7_[_loc3_],"\t");
      var _loc1_ = new Object();
      _loc1_.Idx = _loc2_[0];
      _loc1_.Txt = _loc2_[1];
      _loc1_.Icon = _loc2_[2];
      _loc1_.Num = _loc2_[3];
      TabBoxCreate(_tabType,_loc1_,_loc4_,false);
      _loc3_ = _loc3_ + 1;
   }
   setTabBoxPosition(_tabType,_loc8_);
};
myListener.OnGame_InGameStore_UpDateTab = function(_listData, _tabType)
{
   var _loc2_ = lib.util.ExtString.split(_listData,"\t");
   switch(_tabType)
   {
      case 0:
         _Align = 1;
         _WidthSize = MTABSIZE;
         break;
      case 1:
         _Align = -1;
         _WidthSize = MTABSIZE;
         break;
      case 2:
         _Align = 1;
         _WidthSize = STABSIZE;
         break;
      case 3:
         _Align = -1;
         _WidthSize = STABSIZE;
   }
   var _loc1_ = new Object();
   _loc1_.Idx = _loc2_[0];
   _loc1_.Txt = _loc2_[1];
   _loc1_.Icon = _loc2_[2];
   _loc1_.Num = _loc2_[3];
   TabBoxCreate(_tabType,_loc1_,_WidthSize,true);
   setTabBoxPosition(_tabType,_Align);
};
myListener.OnGame_InGameStore_TabFocus = function(_index, _tabType)
{
   var _loc3_ = container_mc["tabBox" + _tabType];
   var _loc2_ = undefined;
   if(_loc3_["icon" + _index].iconType == 3)
   {
      _loc3_["icon" + _index].btn.gotoAndStop(2);
      return undefined;
   }
   for(str in _loc3_)
   {
      _loc2_ = _loc3_[str];
      if(_tabType > 1)
      {
         _loc2_.txt.textColor = "0x638AAB";
      }
      else
      {
         _loc2_.txt.textColor = "0xD7D7D7";
      }
      _loc2_.btn.hitTestDisable = false;
      _loc2_.btn.gotoAndStop(1);
   }
   if(_index == -1)
   {
      return undefined;
   }
   _loc3_["icon" + _index].btn.hitTestDisable = true;
   var _delay = 0;
   _loc3_.onEnterFrame = function()
   {
      _delay++;
      if(_delay > 1)
      {
         this["icon" + _index].txt.textColor = "0xFFFFFF";
         this["icon" + _index].btn.gotoAndStop(3);
         if(_tabType == 0)
         {
            myListener.OnGame_InGameStore_TabFocus(-1,1);
         }
         else if(_tabType == 1)
         {
            myListener.OnGame_InGameStore_TabFocus(-1,0);
         }
         delete this.onEnterFrame;
      }
   };
};
myListener.OnGame_InGameStore_SetComboBox = function(_listData, _selectIndex, _comboType)
{
   var _loc2_ = Number(_comboType);
   var _loc1_ = container_mc["comboBox" + _loc2_];
   _loc1_.Type = _loc2_;
   mComBoData[_loc2_] = lib.util.ExtString.split(_listData,"\t");
   _loc1_.data = mComBoData[_loc2_];
   _loc1_.removeListener(comboListner);
   _loc1_.selectedIndex = _selectIndex;
   _loc1_.addListener(comboListner);
};
myListener.OnGame_InGameStore_ListFocus = function(_index)
{
   var _loc1_ = container_mc.listBox["itemMc" + _index];
   if(!_loc1_)
   {
      return undefined;
   }
   _loc1_.bg.gotoAndStop(2);
};
myListener.OnGame_InGameStore_AddList = function(_index, _slotData, _price, _guide, _comboBox, _comboBoxFocus, _button)
{
   _index = Number(_index);
   if(_index >= iconMax)
   {
      return undefined;
   }
   var _loc13_ = container_mc.listBox;
   if(_loc13_["itemMc" + _index])
   {
      _loc13_["itemMc" + _index].removeMovieClip();
   }
   var _loc4_ = _loc13_.attachMovie("itemMc","itemMc" + _index,iconMax - _index);
   var _loc10_ = lib.util.ExtString.split(_slotData,"\t");
   var _loc7_ = _loc4_.slotBox.attachMovie("Slot_link","item" + _index,_index);
   var _itemID = _loc10_[0];
   var _loc15_ = _loc10_[2];
   _loc7_.index = _itemID;
   _loc7_.draw(_loc10_[1]);
   if(_loc15_ != -1)
   {
      _loc7_.num = _loc15_;
   }
   _loc7_.SLOT.enabled = false;
   _loc7_.display = true;
   if(_loc10_[4] == 1)
   {
      _loc7_.impossible = true;
   }
   else if(_loc10_[4] == 2)
   {
      _loc7_.disable = true;
   }
   else
   {
      _loc7_.impossible = false;
      _loc7_.disable = false;
   }
   _loc7_.package_mc._visible = Boolean(Number(_loc10_[5]));
   _loc7_._width = 76;
   _loc7_._height = 70;
   lib.manager.ToolTip.add(_loc7_.SLOT,_itemID,6,_loc7_.Icon);
   var _loc12_ = lib.util.ExtString.split(_guide,"\t");
   var _loc17_ = lib.util.ExtString.split(_comboBox,"\t");
   var _loc14_ = "";
   _loc4_.guideTxt.setText(_loc12_[0]);
   _loc4_.moneyTxt.htmlText = _price;
   lib.util.DrawBitmap.draw(_loc4_.typeBox,_loc12_[1]);
   _loc4_.typeBox.hitTestDisable = true;
   _loc4_.comboBox.Type = _num;
   if(Number(_loc12_[3]))
   {
      _loc4_.checkBox._visible = true;
      _loc4_.checkBox.id = _itemID;
      _loc4_.checkBox.ck = _loc12_[4];
      _loc4_.checkBox.onEnterFrame = function()
      {
         this.onChanged = function(changed)
         {
            if(changed == true)
            {
               getURL("FSCommand:ToGame_InGameStore_ItemCheck",this.id + "\t1");
            }
            else if(changed == false)
            {
               getURL("FSCommand:ToGame_InGameStore_ItemCheck",this.id + "\t0");
            }
         };
         this.checked = Boolean(Number(this.ck));
         delete this.onEnterFrame;
      };
   }
   else
   {
      _loc4_.checkBox._visible = false;
   }
   if(_loc12_[2])
   {
      _loc4_.nameTxt.htmlText = _loc12_[2] + " ";
      _loc14_ = _loc12_[2] + " ";
      _loc4_.eventBg._visible = true;
      _loc4_.eventBg._width = _loc4_.nameTxt.textWidth;
   }
   else
   {
      _loc4_.eventBg._visible = false;
   }
   _loc4_.comboBox._visible = false;
   _loc4_.comboTxt._visible = false;
   if(_comboBoxFocus != "-1")
   {
      _loc4_.comboTxt._visible = true;
      _loc4_.comboBox.id = _itemID;
      _loc4_.comboBox.dt = _loc17_;
      _loc4_.comboBox.fc = Number(_comboBoxFocus);
      var _delayCount = 0;
      _loc4_.comboBox.onEnterFrame = function()
      {
         if(_delayCount == 0)
         {
            this.data = this.dt;
            this.removeListener(comboListner2);
            this.selectedIndex = this.fc;
            this.addListener(comboListner2);
         }
         else if(_delayCount == 1)
         {
            this._visible = true;
            delete this.onEnterFrame;
         }
         _delayCount++;
      };
   }
   _loc14_ = _loc14_ + _loc10_[3];
   _loc4_.nameTxt.setText(_loc14_);
   var _loc11_ = lib.util.ExtString.split(_button,"\n");
   var _loc8_ = _loc11_.length;
   var _loc3_ = 0;
   while(_loc3_ < _loc8_)
   {
      var _loc5_ = lib.util.ExtString.split(_loc11_[_loc3_],"\t");
      var _loc2_ = _loc4_.btnBox.attachMovie("itemBtn","itemBtn" + _loc5_[0],_loc3_);
      _loc2_.id = _itemID;
      _loc2_.tp = _loc5_[0];
      _loc2_.txt.text = _loc5_[1];
      var _loc6_ = int(258 / _loc8_);
      _loc2_.btn._width = _loc6_;
      _loc2_.txt._width = _loc2_.btn._width - 10;
      _loc2_._x = _loc3_ * _loc6_ + 2;
      if(_loc5_[2] == 0)
      {
         setItemButton(_loc2_,false);
         _loc2_.btn.gotoAndStop(4);
      }
      else
      {
         setItemButton(_loc2_,true);
      }
      _loc3_ = _loc3_ + 1;
   }
   _loc4_._x = _loc4_._width * (_index % iconTable) + 2;
   _loc4_._y = _loc4_._height * int(_index / iconTable) + 2;
   var _loc16_ = new lib.util.TxtBtn(_loc4_.bg);
   _loc16_.setRelease(function()
   {
      ToGame_InGameStore_ItemDetailView(_itemID);
   }
   );
};
myListener.OnGame_InGameStore_DelList = function(_index)
{
   var _loc1_ = container_mc.listBox;
   if(_loc1_["itemMc" + _index])
   {
      _loc1_["itemMc" + _index].removeMovieClip();
   }
};
myListener.OnGame_InGameStore_UpDateList = function(_index, _text)
{
   var _loc1_ = container_mc.listBox;
   if(_loc1_["itemMc" + _index])
   {
      _loc1_["itemMc" + _index].nameTxt.htmlText = _text;
   }
};
myListener.OnGame_InGameStore_SetCoin = function(_textData0, _textData1)
{
   var _loc5_ = container_mc.moneyBox;
   clearBox(_loc5_);
   if(_textData0)
   {
      var _loc4_ = lib.util.ExtString.split(_textData0,"\t");
      var _loc2_ = _loc5_.attachMovie("moneyMc","MoneyIcon0",1);
      _loc2_.gotoAndStop(1);
      if(_loc4_[0] == "-1")
      {
         _loc2_.txt0.htmlText = TCATTEXT;
      }
      else
      {
         _loc2_.txt0.htmlText = _loc4_[0];
      }
      _loc2_.txt1.htmlText = _loc4_[1];
   }
   if(_textData1)
   {
      var _loc3_ = lib.util.ExtString.split(_textData1,"\t");
      var _loc1_ = _loc5_.attachMovie("moneyMc","MoneyIcon1",2);
      _loc1_.gotoAndStop(2);
      if(_loc3_[0] == "-1")
      {
         _loc1_.txt0.htmlText = COINTEXT;
      }
      else
      {
         _loc1_.txt0.htmlText = _loc3_[0];
      }
      _loc1_.txt1.htmlText = _loc3_[1];
      _loc1_._x = 425;
   }
   SetBtmPosition();
};
myListener.OnGame_InGameStore_SetPageInfo = function(_curPage, _maxPage)
{
   if(_curPage == -1)
   {
      container_mc.btmBox0._visible = false;
      container_mc.btmBox1._visible = true;
   }
   else
   {
      container_mc.btmBox0._visible = true;
      container_mc.btmBox1._visible = false;
      mCurrentPage = Number(_curPage);
      mMaxPage = Number(_maxPage);
      container_mc.btmBox0.numberSteper.setPage(mCurrentPage,mMaxPage);
   }
};
myListener.OnGame_InGameStore_DefaultReflesh = function(_Mode)
{
   container_mc.moneyBtn0._visible = true;
   container_mc.moneyBtn0.txt.textAutoSize = "shrink”";
   container_mc.moneyBtn0.txt.htmlText = BTNTEXT_0;
   container_mc.moneyBtn0.iconMc._x = (100 - container_mc.moneyBtn0.txt.textWidth) / 2 + 7;
   if(_Mode == 0)
   {
      container_mc.moneyBtn0.iconMc.gotoAndStop(2);
      money_btn0.setEnabled(false);
   }
   else if(_Mode == 1)
   {
      container_mc.moneyBtn0.iconMc.gotoAndStop(1);
      money_btn0.setEnabled(true);
   }
   else
   {
      container_mc.moneyBtn0._visible = false;
   }
   SetBtmPosition();
};
myListener.OnGame_InGameStore_DefaultCharge = function(_Mode)
{
   container_mc.moneyBtn1._visible = true;
   container_mc.moneyBtn1.txt.textAutoSize = "shrink”";
   container_mc.moneyBtn1.txt.htmlText = BTNTEXT_1;
   container_mc.moneyBtn1.iconMc._x = (100 - container_mc.moneyBtn0.txt.textWidth) / 2 + 7;
   if(_Mode == 0)
   {
      container_mc.moneyBtn1.iconMc.gotoAndStop(2);
      money_btn1.setEnabled(false);
   }
   else if(_Mode == 1)
   {
      container_mc.moneyBtn1.iconMc.gotoAndStop(1);
      money_btn1.setEnabled(true);
   }
   else
   {
      container_mc.moneyBtn1._visible = false;
   }
   SetBtmPosition();
};
var comboListner = {};
comboListner.onChanged = function(_targetMc, _id, _index)
{
   if(_id == undefined)
   {
      return undefined;
   }
   ToGame_InGameStore_ComboBoxChange(_index,_targetMc.Type);
};
container_mc.btmBox0.numberSteper.onChanged = function(_page)
{
   ToGame_InGameStore_PageChange(_page);
};
var comboListner2 = {};
comboListner2.onChanged = function(_targetMc, _id, _index)
{
   if(_id == undefined)
   {
      return undefined;
   }
   ToGame_InGameStore_ItemComboBoxChange(_index,_targetMc.id);
};
myListener.OnGame_InGameStore_DefaultReflesh(1);
myListener.OnGame_InGameStore_DefaultCharge(1);
setComboBoxPosition();
ToGame_InGameStore_Init();
