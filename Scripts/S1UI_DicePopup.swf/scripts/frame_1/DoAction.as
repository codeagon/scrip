function ToGame_DicePopup_Biddng()
{
   lib.Debuger.trace("ToGame_DicePopup_Biddng");
   fscommand("ToGame_DicePopup_Biddng");
}
function ToGame_DicePopup_BidWaiver()
{
   lib.Debuger.trace("ToGame_DicePopup_BidWaiver");
   fscommand("ToGame_DicePopup_BidWaiver");
}
function ToGame_GoldAuctionPopup_Biddng()
{
   lib.Debuger.trace("ToGame_GoldAuctionPopup_Biddng");
   fscommand("ToGame_GoldAuctionPopup_Biddng");
}
function ToGame_GoldAuctionPopup_BidWaiver()
{
   lib.Debuger.trace("ToGame_GoldAuctionPopup_BidWaiver");
   fscommand("ToGame_GoldAuctionPopup_BidWaiver");
}
stop();
var UI = this;
UI._visible = true;
var UIname = "DicePopup";
var axis = new lib.util.AxisResetter();
var str1 = "주사위굴림";
var str2_0 = "귀속없음";
var str2_1 = "착용 시 귀속";
var str2_2 = "획득 시 귀속";
var str3 = "골드 경매";
var DiceGage_Interval;
var DiceGage_Interval_num = 0;
var GoldAuction_MaxPrice = 0;
var Gage_Select = "0";
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
DicePopup_init = function()
{
   lib.Debuger.trace("DicePopup_init");
   UI.popupType0._visible = false;
   UI.popupType1._visible = false;
   clearInterval(DiceGage_Interval);
   DiceGage_Interval_num = 0;
   GoldAuction_Price = 0;
};
setPosition = function(target)
{
   lib.Debuger.trace("setPosition");
   target._x = lib.info.AlignInfo.zeroPointX + lib.info.AlignInfo.onePercentPixelW * 50;
   target._y = lib.info.AlignInfo.zeroPointY + lib.info.AlignInfo.onePercentPixelH * 45;
   target._x = target._x - target.hit._width / 2 * lib.info.AlignInfo.scaleRatio;
   target._y = target._y - target.hit._height / 2 * lib.info.AlignInfo.scaleRatio;
   UI.popupType0.UIDrager.setData(UI.popupType0._name,UI.popupType0);
   UI.popupType0.UIDrager.adjustDragLimit(-250,260,0,290 * lib.info.AlignInfo.scaleRatio);
   UI.popupType1.UIDrager.setData(UI.popupType1._name,UI.popupType1);
   UI.popupType1.UIDrager.adjustDragLimit(-250,250,0,250 * lib.info.AlignInfo.scaleRatio);
};
myListener.OnGame_ChangeStageSize = function(w, h)
{
   lib.Debuger.trace("OnGame_ChangeStageSize");
   UI.popupType0._x = lib.info.AlignInfo.zeroPointX + lib.info.AlignInfo.onePercentPixelW * 50;
   UI.popupType0._y = lib.info.AlignInfo.zeroPointY + lib.info.AlignInfo.onePercentPixelH * 45;
};
myListener.OnGame_DicePopup_Create = function(_data)
{
   lib.Debuger.trace("OnGame_DicePopup_Create");
   DicePopup_init();
   UI.popupType0._visible = true;
   setPosition(UI.popupType0);
   var _loc1_ = _data.split("\t");
   UI.popupType0.title_txt.text = str1;
   UI.popupType0.item.draw(_loc1_[0]);
   UI.popupType0.slot_txt.text = _loc1_[1];
   UI.popupType0.item.num_txt.text = _loc1_[2];
   lib.manager.ToolTip.add(UI.popupType0.item,_loc1_[2],6,UI.popupType0.item);
   if(_loc1_[3] == "0")
   {
      UI.popupType0.txt0.text = "";
      Gage_Select = "0";
   }
   else if(_loc1_[3] == "1")
   {
      UI.popupType0.txt0.text = str2_1;
      Gage_Select = "0";
   }
   else if(_loc1_[3] == "2")
   {
      UI.popupType0.txt0.text = str2_2;
      Gage_Select = "1";
   }
   var _loc3_ = UI.popupType0.Btn0.txtBtn;
   _loc3_.setRelease(function()
   {
      ToGame_DicePopup_Biddng();
   }
   );
   var _loc2_ = UI.popupType0.Btn1.txtBtn;
   _loc2_.setRelease(function()
   {
      ToGame_DicePopup_BidWaiver();
   }
   );
};
myListener.OnGame_DicePopup_Resttime = function(_time)
{
   lib.Debuger.trace("OnGame_DicePopup_Resttime : " + _time);
   DiceGage_Interval_num = 0;
   clearInterval(DiceGage_Interval);
   DiceGage_Interval = setInterval(DiceGoldPopup_Gage_IntervalStart,1000,UI.popupType0,_time);
   myListener.OnGame_DiceGoldPopup_Gage(_time);
};
myListener.OnGame_GoldAuctionPopup_Create = function(_data)
{
   lib.Debuger.trace("OnGame_GoldAuctionPopup_Create");
   DicePopup_init();
   UI.popupType1._visible = true;
   setPosition(UI.popupType1);
   var _loc1_ = _data.split("\t");
   UI.popupType1.title_txt.text = str3;
   UI.popupType1.item.draw(_loc1_[0]);
   UI.popupType1.slot_txt.text = _loc1_[1];
   UI.popupType1.item.num_txt.text = _loc1_[2];
   lib.manager.ToolTip.add(UI.popupType1.item,_loc1_[7],6,UI.popupType1.item);
   if(_loc1_[3] == "0")
   {
      UI.popupType1.txt0.text = "";
      Gage_Select = "0";
   }
   else if(_loc1_[3] == "1")
   {
      UI.popupType1.txt0.text = str2_1;
      Gage_Select = "0";
   }
   else if(_loc1_[3] == "2")
   {
      UI.popupType1.txt0.text = str2_2;
      Gage_Select = "1";
   }
   UI.popupType1.txt__0.text = _loc1_[4];
   UI.popupType1.txt__2.text = lib.util.CurrencyFormat.makeComma(_loc1_[5]);
   GoldAuction_MaxPrice = _loc1_[5];
   UI.popupType1.txt__2.autoSize = true;
   UI.popupType1.txt__2._x = UI.popupType1._width - UI.popupType1.txt__2._width - 40;
   UI.popupType1.ArrowIcon._x = UI.popupType1.txt__2._x - 30;
   UI.popupType1.txt__1.text = lib.util.CurrencyFormat.makeComma(_loc1_[6]);
   if(_loc1_[5] == _loc1_[6])
   {
      UI.popupType1.txt__1.textColor = 12845056;
   }
   else
   {
      UI.popupType1.txt__1.textColor = 16756787;
   }
   var _loc3_ = UI.popupType1.Btn0.txtBtn;
   _loc3_.setRelease(function()
   {
      ToGame_GoldAuctionPopup_Biddng();
   }
   );
   var _loc2_ = UI.popupType1.Btn1.txtBtn;
   _loc2_.setRelease(function()
   {
      ToGame_GoldAuctionPopup_BidWaiver();
   }
   );
};
myListener.OnGame_GoldAuctionPopup_Resttime = function(_time)
{
   lib.Debuger.trace("OnGame_GoldAuctionPopup_Resttime : " + _time);
   DiceGage_Interval_num = 0;
   clearInterval(DiceGage_Interval);
   DiceGage_Interval = setInterval(DiceGoldPopup_Gage_IntervalStart,1000,UI.popupType1,_time);
   myListener.OnGame_DiceGoldPopup_Gage(_time);
};
myListener.OnGame_GoldAuctionPopup_PriceInput = function(_data)
{
   lib.Debuger.trace("OnGame_GoldAuctionPopup_PriceInput : " + _data);
   UI.popupType1.txt__1.text = lib.util.CurrencyFormat.makeComma(_data);
   if(GoldAuction_MaxPrice == _data)
   {
      UI.popupType1.txt__1.textColor = 12845056;
   }
   else
   {
      UI.popupType1.txt__1.textColor = 16756787;
   }
};
myListener.OnGame_DiceGoldPopup_Gage = function(_time)
{
   lib.Debuger.trace("OnGame_DiceGoldPopup_Gage");
   UI.onEnterFrame = null;
   if(UI.popupType0._visible == true)
   {
      UI.popupType0.GageBar.gage0._visible = false;
      UI.popupType0.GageBar.gage1._visible = false;
      var _loc1_ = undefined;
      if(Gage_Select == "0")
      {
         _loc1_ = UI.popupType0.GageBar.gage0;
      }
      else if(Gage_Select == "1")
      {
         _loc1_ = UI.popupType0.GageBar.gage1;
      }
      _loc1_._visible = true;
      UI.popupType0.GageBar.effect._visible = true;
      UI.popupType0.GageBar.effect._x = _loc1_._x + _loc1_._width - 20;
      DiceGoldPopup_Gage_Start(_loc1_,UI.popupType0.GageBar.effect,_time);
   }
   else if(UI.popupType1._visible == true)
   {
      UI.popupType1.GageBar.gage1._visible = false;
      UI.popupType1.GageBar.gage0._visible = false;
      if(Gage_Select == "0")
      {
         _loc1_ = UI.popupType1.GageBar.gage0;
      }
      else if(Gage_Select == "1")
      {
         _loc1_ = UI.popupType1.GageBar.gage1;
      }
      _loc1_._visible = true;
      UI.popupType1.GageBar.effect._visible = true;
      UI.popupType1.GageBar.effect._x = _loc1_._x + _loc1_._width - 20;
      DiceGoldPopup_Gage_Start(_loc1_,UI.popupType1.GageBar.effect,_time);
   }
};
DiceGoldPopup_Gage_Start = function(target1, target2, _time)
{
   var num = 0;
   var _timenum = (_time / 1000 + 0.5) * 24;
   UI.onEnterFrame = function()
   {
      num++;
      if(target1._xscale > 0)
      {
         target1._xscale = (_timenum - num) / _timenum * 100;
         target2._x = target1._x + target1._width - 20;
      }
      else
      {
         lib.Debuger.trace("end");
         UI.onEnterFrame = null;
         num = 0;
      }
      if(target1._xscale <= 2)
      {
         target2._visible = false;
      }
   };
};
DiceGoldPopup_Gage_IntervalStart = function(target1, _time)
{
   if(_time / 1000 > DiceGage_Interval_num)
   {
      DiceGage_Interval_num++;
   }
   else
   {
      clearInterval(DiceGage_Interval);
   }
   target1.count_txt.text = "남은시간 : " + (_time / 1000 - DiceGage_Interval_num) + "초";
};
myListener.OnGame_DiceGoldPopup_Hotkey = function(keynum)
{
   lib.Debuger.trace("OnGame_DiceGoldPopup_Hotkey");
   var _loc1_ = lib.info.KeyMap.toKeyCode(keynum);
   lib.Debuger.trace("keynum : " + keynum);
   lib.Debuger.trace("keystring : " + _loc1_);
   if(_loc1_ == "33")
   {
      if(UI.popupType0._visible == true)
      {
         ToGame_DicePopup_Biddng();
      }
      else
      {
         ToGame_GoldAuctionPopup_Biddng();
      }
   }
   else if(keynum == "34")
   {
      if(UI.popupType0._visible == true)
      {
         ToGame_DicePopup_BidWaiver();
      }
      else
      {
         ToGame_GoldAuctionPopup_BidWaiver();
      }
   }
};
DicePopup_init();
