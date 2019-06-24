function InGameStorePopUp_init()
{
   container_mc.popupType1.guideMc.guideTxt._height = 0;
   container_mc.popupType1._visible = false;
   var _loc3_ = 322;
   hit._height = 575;
   container_mc.popupType1.buyBtn._y = 335;
   var _loc2_ = _root.GetLoadedUI("ingamestore");
   var _loc4_ = _loc2_._x + _loc2_._width + _loc3_;
   if(Stage.width > _loc4_)
   {
      UI._x = _loc2_._x + _loc2_._width;
   }
   else
   {
      UI._x = _loc2_._x - _loc3_;
   }
   UI._y = _loc2_._y;
}
function ToGame_InGameStorePopUp_Init()
{
   fscommand("ToGame_InGameStorePopUp_Init");
}
function ToGame_InGameStorePopUp_CloseUI()
{
   fscommand("ToGame_InGameStorePopUp_CloseUI");
}
function ToGame_InGameStorePopUp_ComboBoxChange(_selectIndex)
{
   getURL("FSCommand:ToGame_InGameStorePopUp_ComboBoxChange",_selectIndex);
}
function ToGame_InGameStorePopUp_ItemClick(_itemID, _type)
{
   getURL("FSCommand:ToGame_InGameStorePopUp_ItemClick",_itemID + "\t" + _type);
}
function ToGame_InGameStorePopUp_ItemBuy()
{
   fscommand("ToGame_InGameStorePopUp_ItemBuy");
}
function creatSlot(_targetMc, _slotData)
{
   clearBox(_targetMc.slotBox);
   var _loc2_ = lib.util.ExtString.split(_slotData,"\t");
   var _loc1_ = _targetMc.slotBox.attachMovie("Slot_link","item",_targetMc.slotBox.getNextHighestDepth());
   var _loc4_ = _loc2_[0];
   _loc1_.index = _loc4_;
   _loc1_.draw(_loc2_[1]);
   _loc1_.num = _loc2_[2];
   _loc1_.SLOT.enabled = false;
   _loc1_.display = true;
   if(_loc2_[4] == 1)
   {
      _loc1_.impossible = true;
   }
   else if(_loc2_[4] == 2)
   {
      _loc1_.disable = true;
   }
   else
   {
      _loc1_.impossible = false;
      _loc1_.disable = false;
   }
   _loc1_.package_mc._visible = Boolean(Number(_loc2_[5]));
   _loc1_._width = 77;
   _loc1_._height = 71;
   lib.manager.ToolTip.add(_loc1_.SLOT,_loc2_[0],6,_loc1_.Icon);
   return _loc2_[3];
}
function createButton(_button, _itemID)
{
   clearBox(container_mc.popupType0.btnBox);
   var _loc5_ = lib.util.ExtString.split(_button,"\n");
   var _loc4_ = _loc5_.length;
   var _loc6_ = -92;
   var _loc2_ = 0;
   while(_loc2_ < _loc4_)
   {
      var _BSetData = lib.util.ExtString.split(_loc5_[_loc2_],"\t");
      var _loc1_ = container_mc.popupType0.btnBox.attachMovie("itemBtn","itemBtn" + _BSetData[0],_loc2_);
      var _loc3_ = new lib.util.TxtBtn(_loc1_.btn,_loc1_.txt);
      _loc1_.txt.text = _BSetData[1];
      _loc1_._x = _loc6_ * (_loc4_ - _loc2_);
      _loc1_._y = 4;
      if(_BSetData[2] == 0)
      {
         _loc3_.setEnabled(false);
         _loc1_.btn.gotoAndStop(4);
      }
      else
      {
         _loc3_.setRelease(function()
         {
            ToGame_InGameStorePopUp_ItemClick(_itemID,_BSetData[0]);
         }
         );
         _loc3_.setTextColor("0x83BBE4","0xFFFFFF","0xFFFFFF","0x485460");
      }
      _loc2_ = _loc2_ + 1;
   }
}
function clearBox(_ParentMc)
{
   for(str in _ParentMc)
   {
      var _loc1_ = _ParentMc[str];
      _loc1_.removeMovieClip();
   }
}
function SetHitSize(_OpenType)
{
}
function SetPosition()
{
   var _loc3_ = container_mc.popupType1.guideMc;
   var _loc1_ = 0;
   var _loc2_ = 0;
   _loc1_ = container_mc.popupType1.guideMc.guideTxt._height;
   _loc2_ = container_mc.popupType1.guideMc.listBox._height;
   if(_loc2_ < 40)
   {
      container_mc.popupType1.guideMc.listBox._visible = false;
   }
   else
   {
      container_mc.popupType1.guideMc.listBox._visible = true;
   }
   container_mc.popupType1.guideMc.listBox._y = _loc1_;
   _loc3_._height = _loc1_ + _loc2_;
   mScrollBar.scroll = 0;
   mScrollBar.pageSize = _loc3_._height + 30;
}
stop();
var UI = this;
UI._visible = false;
var UIname = "InGameStorePopUp";
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
this.bWidgetOpen = false;
container_mc.popupType1.UIDrager.setData(UIname,UI);
myListener.OnGameEventShowWindow = function(WindowName, bShow)
{
   if(WindowName.toLowerCase() == UIname.toLowerCase())
   {
      bWidgetOpen = bShow;
      if(bWidgetOpen)
      {
         UI._visible = true;
      }
      else
      {
         UI._visible = false;
      }
   }
};
var guideText_0 = "";
var guideText_1 = "";
var ITEMLINEHEIGHT = 25;
var mScrollBar = container_mc.popupType1.scrollbar;
var guideBox_Y = container_mc.popupType1.guideMc._y;
mScrollBar.addListener(container_mc.popupType1.guideMc);
container_mc.popupType1.guideMc.onScroll = function()
{
   container_mc.popupType1.guideMc._y = guideBox_Y - arguments[0];
};
mScrollBar.setWheel(container_mc.popupType1.guideMc);
mScrollBar.wheelDelta = 1;
mScrollBar.displaySize = container_mc.popupType1.maskMc._height;
mScrollBar.rowHeight = 200;
mScrollBar.scroll = 0;
mScrollBar.pageSize = 0;
var x_btn1 = new lib.util.TxtBtn(container_mc.popupType1.x_Btn);
x_btn1.setRelease(ToGame_InGameStorePopUp_CloseUI);
container_mc.popupType1.groupTxt1.txt4.text = lib.util.UIString.getUIString("$500044") + " " + lib.util.UIString.getUIString("$500026");
container_mc.popupType1.buyBtn.txt.text = lib.util.UIString.getUIString("$500045");
var _buyBtn = new lib.util.TxtBtn(container_mc.popupType1.buyBtn.btn,container_mc.popupType1.buyBtn.txt);
_buyBtn.setRelease(ToGame_InGameStorePopUp_ItemBuy);
_buyBtn.setTextColor("0xD7D7D7","0xFFFFFF","0xFFFFFF","0x485460");
container_mc.popupType0.txt4.text = lib.util.UIString.getUIString("$500044") + lib.util.UIString.getUIString("$500026");
myListener.OnGame_InGameStorePopUp_Buy = function(_itemData, _textData, _price, _comboBox, _comboBoxFocus, _button)
{
   InGameStorePopUp_init();
   var _loc1_ = container_mc.popupType1;
   _loc1_._visible = true;
   var _loc5_ = creatSlot(_loc1_,_itemData);
   var _loc3_ = lib.util.ExtString.split(_textData,"\t");
   _loc1_.txtName.htmlText = _loc5_;
   _loc1_.txtPrice.htmlText = _price;
   _loc1_.groupTxt0.num0.htmlText = _loc3_[0];
   _loc1_.groupTxt0.num1.htmlText = _loc3_[1];
   _loc1_.groupTxt0.num2.htmlText = _loc3_[2];
   _loc1_.groupTxt0.num3.htmlText = _loc3_[3];
   _loc1_.groupTxt0.num4.htmlText = _loc3_[4];
   _loc1_.groupTxt1.num5.htmlText = _loc3_[5];
   if(_loc3_[2] == "-1")
   {
      _loc1_.groupTxt0.txt2._visible = false;
      _loc1_.groupTxt0.num2._visible = false;
      _loc1_.groupTxt0.txt3._y = 55;
      _loc1_.groupTxt0.num3._y = 55;
      _loc1_.groupTxt0.txt4._y = 95;
      _loc1_.groupTxt0.num4._y = 95;
   }
   else
   {
      _loc1_.groupTxt0.txt2._visible = true;
      _loc1_.groupTxt0.num2._visible = true;
      _loc1_.groupTxt0.txt3._y = 75;
      _loc1_.groupTxt0.num3._y = 75;
      _loc1_.groupTxt0.txt4._y = 115;
      _loc1_.groupTxt0.num4._y = 115;
   }
   var _loc2_ = _loc1_.txtName._y;
   _loc1_.txtName._height = _loc1_.txtName.textHeight + 15;
   _loc2_ = _loc2_ + _loc1_.txtName._height;
   _loc1_.txtPrice._y = _loc1_.txtPrice._y = _loc2_;
   _loc2_ = _loc2_ + 25;
   _loc1_.comboBox._y = _loc2_;
   _loc2_ = _loc2_ + 35;
   _loc1_.groupTxt0._y = _loc1_.groupTxt1._y = _loc1_.groupBg._y = _loc2_;
   if(Boolean(_loc3_[5]))
   {
      _loc1_.groupTxt1._visible = true;
      _loc1_.groupBg._height = _loc1_.groupTxt0._height + _loc1_.groupTxt1._height + 25;
   }
   else
   {
      _loc1_.groupTxt1._visible = false;
      _loc1_.groupBg._height = _loc1_.groupTxt0._height + 25;
   }
   _loc2_ = _loc2_ + (_loc1_.groupBg._height + 10);
   if(_loc2_ > 335)
   {
      _loc2_ = 335;
   }
   _loc1_.buyBtn._y = _loc2_;
   var _loc4_ = _loc1_.comboBox;
   _loc4_.data = lib.util.ExtString.split(_comboBox,"\t");
   _loc4_.removeListener(comboListner);
   _loc4_.selectedIndex = _comboBoxFocus;
   _loc4_.addListener(comboListner);
   if(_comboBoxFocus != "-1")
   {
      _loc4_._visible = true;
   }
   else
   {
      _loc4_._visible = false;
   }
   SetPosition();
};
myListener.OnGame_InGameStorePopUp_ProductGuide = function(_HtmlTxt)
{
   container_mc.popupType1.guideMc.guideTxt.htmlText = _HtmlTxt;
   container_mc.popupType1.guideMc.guideTxt._height = container_mc.popupType1.guideMc.guideTxt.textHeight + 20;
   SetPosition();
};
myListener.OnGame_InGameStorePopUp_PackageGuide = function(_HtmlTxt)
{
   clearBox(container_mc.popupType1.guideMc.listBox);
   var _loc4_ = lib.util.ExtString.split(_HtmlTxt,"\n");
   var _loc5_ = _loc4_.length;
   var _loc1_ = 0;
   while(_loc1_ < _loc5_)
   {
      var _loc3_ = lib.util.ExtString.split(_loc4_[_loc1_],"\t");
      var _loc2_ = container_mc.popupType1.guideMc.listBox.attachMovie("lineMc","lineMc" + _loc1_,_loc1_);
      lib.manager.ToolTip.add(_loc2_.itemTxt,_loc3_[0],6);
      _loc2_.itemTxt.htmlText = _loc3_[1];
      _loc2_._y = ITEMLINEHEIGHT * (1 + _loc1_);
      _loc1_ = _loc1_ + 1;
   }
   SetPosition();
};
myListener.OnGame_InGameStorePopUp_VipMode = function(itemData, textData)
{
   container_mc.popupType1._visible = true;
   container_mc.popupType1.gotoAndStop(2);
   hit._height = 315;
   container_mc.popupType1.buyBtn._y = 250;
   var _loc2_ = creatSlot(container_mc.popupType1,itemData);
   container_mc.popupType1.txtName.htmlText = _loc2_;
   var _loc1_ = lib.util.ExtString.split(textData,"\t");
   container_mc.popupType1.num0.htmlText = _loc1_[0];
   container_mc.popupType1.num1.htmlText = _loc1_[1];
   container_mc.popupType1.num2.htmlText = _loc1_[2];
};
var comboListner = {};
comboListner.onChanged = function(_targetMc, _id, _index)
{
   if(_id == undefined)
   {
      return undefined;
   }
   ToGame_InGameStore_ItemComboBoxChange(_index,_targetMc.id);
};
InGameStorePopUp_init();
ToGame_InGameStorePopUp_Init();
