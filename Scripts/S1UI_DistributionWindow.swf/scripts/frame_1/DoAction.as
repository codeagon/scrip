function restchecknumFunc(_data)
{
   var _loc2_ = undefined;
   if(container_mc.popupType0._visible == true)
   {
      _loc2_ = container_mc.popupType0;
   }
   else if(container_mc.popupType1._visible == true)
   {
      _loc2_ = container_mc.popupType1;
   }
   if(DistributionWindow_Dice_Select == "2")
   {
      _loc2_.BgMc1._visible = false;
      _loc2_.BgMc1_1._visible = true;
   }
   else
   {
      _loc2_.BgMc1._visible = true;
      _loc2_.BgMc1_1._visible = false;
   }
   _loc2_.BgMc1.gotoAndStop(1);
   _loc2_.BgMc1_1.gotoAndStop(1);
   var _loc3_ = undefined;
   if(_data < restchecknum)
   {
      bgDisplay(Number(_data));
      restchecknum = _data;
      return undefined;
   }
   if(Number(restchecknum) + 1 != Number(_data))
   {
      bgDisplay(Number(_data) - 1);
   }
   restchecknum = _data;
   var _loc6_ = 100 - Number(restchecknum);
   _loc3_ = _loc2_.BgMc2.attachMovie("copyBg","copyBgMc" + restchecknum,_loc6_);
   var _loc5_ = Math.min(Number(restchecknum),restBgDisplyMax + 1);
   _loc3_._x = 50 + 4 * _loc5_;
   _loc3_._y = 50 + 4 * _loc5_;
   _loc3_._alp = 100 - 20 * _loc5_;
   _loc3_._dist = _loc5_ * 4;
   _loc3_._alpha = 30;
   _loc3_._isremove = restchecknum > restBgDisplyMax;
   _loc3_.onEnterFrame = function()
   {
      this._x = this._x + 0.3 * (this._dist - this._x);
      this._y = this._x;
      this._alpha = this._alpha + 0.2 * (this._alp - this._x);
      if(this._x - this._dist < 1)
      {
         this._x = this._y = this._dist;
         this._alpha = this._alp;
         delete this.onEnterFrame;
         if(this._isremove)
         {
            this.removeMovieClip();
         }
      }
   };
}
function playNextPop(_data)
{
   var _loc1_ = undefined;
   if(container_mc.popupType0._visible == true)
   {
      _loc1_ = container_mc.popupType0;
   }
   else if(container_mc.popupType1._visible == true)
   {
      _loc1_ = container_mc.popupType1;
   }
   if(DistributionWindow_Dice_Select == "2")
   {
      _loc1_.BgMc1._visible = false;
      _loc1_.BgMc1_1._visible = true;
   }
   else
   {
      _loc1_.BgMc1._visible = true;
      _loc1_.BgMc1_1._visible = false;
   }
   _loc1_.BgMc1.gotoAndPlay("start");
   _loc1_.BgMc1_1.gotoAndPlay("start");
   restchecknum = _data;
   bgDisplay(Number(restchecknum));
}
function bgDisplay(count)
{
   var _loc4_ = undefined;
   if(container_mc.popupType0._visible == true)
   {
      _loc4_ = container_mc.popupType0;
   }
   else if(container_mc.popupType1._visible == true)
   {
      _loc4_ = container_mc.popupType1;
   }
   var _loc1_ = 1;
   while(_loc1_ <= restBgDisplyMax)
   {
      var _loc2_ = _loc4_.BgMc2["copyBgMc" + _loc1_];
      if(_loc1_ > count)
      {
         delete register2.onEnterFrame;
         _loc2_.removeMovieClip();
      }
      else if(_loc2_ == undefined)
      {
         var _loc3_ = 100 - Number(_loc1_);
         if(DistributionWindow_Dice_Select == "2")
         {
            _loc2_ = _loc4_.BgMc2.attachMovie("copyBg2","copyBgMc" + _loc1_,_loc3_);
         }
         else
         {
            _loc2_ = _loc4_.BgMc2.attachMovie("copyBg","copyBgMc" + _loc1_,_loc3_);
         }
         _loc2_._x = 4 * _loc1_;
         _loc2_._y = 4 * _loc1_;
         _loc2_._alpha = 100 - 20 * _loc1_;
      }
      _loc1_ = _loc1_ + 1;
   }
}
function ToGame_DistributionWindow_DiceBiddng()
{
   lib.Debuger.trace("ToGame_DistributionWindow_DiceBiddng");
   fscommand("ToGame_DistributionWindow_DiceBiddng");
}
function ToGame_DistributionWindow_DiceBidWaiver()
{
   lib.Debuger.trace("ToGame_DistributionWindow_DieceBidWaiver");
   fscommand("ToGame_DistributionWindow_DiceBidWaiver");
}
function ToGame_DistributionWindow_GoldBiddng()
{
   fscommand("ToGame_DistributionWindow_GoldBiddng");
}
function ToGame_DistributionWindow_GoldBidWaiver()
{
   fscommand("ToGame_DistributionWindow_GoldBidWaiver");
}
function ToGame_DistributionWindow_Init()
{
   fscommand("ToGame_DistributionWindow_Init");
}
function ToGame_DistributionWindow_CloseUI()
{
   fscommand("ToGame_DistributionWindow_CloseUI");
}
function ToGame_DistributionWindow_PartyWindowRaidMemberOK(_index0)
{
   lib.Debuger.trace("ToGame_DistributionWindow_PartyWindowRaidMemberOK");
   lib.Debuger.trace("_index0 : " + _index0);
   lib.Debuger.trace("container_mc.popupType0.combobox.selected : " + container_mc.popupType0.combobox.selected);
   getURL("FSCommand:ToGame_DistributionWindow_PartyWindowRaidMemberOK",container_mc.popupType0.combobox.selected);
}
function ToGame_DistributionWindow_PartyWindowRaidMemberCancel()
{
   lib.Debuger.trace("ToGame_DistributionWindow_PartyWindowRaidMemberCancel");
   fscommand("ToGame_DistributionWindow_PartyWindowRaidMemberCancel");
}
stop();
var UI = this;
UI._visible = false;
var UIname = "DistributionWindow";
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
container_mc.popupType0.UIDrager.setData(UIname,UI);
container_mc.popupType1.UIDrager.setData(UIname,UI);
var str1 = lib.util.UIString.getUIString("$197001");
var str2_0 = lib.util.UIString.getUIString("$197002");
var str2_1 = lib.util.UIString.getUIString("$197003");
var str2_2 = lib.util.UIString.getUIString("$197004");
var str3 = lib.util.UIString.getUIString("$197005");
var str4 = lib.util.UIString.getUIString("$197011");
var str5 = lib.util.UIString.getUIString("$197012");
var str1_data = lib.util.UIString.getUIString("$197008");
var str2_data = lib.util.UIString.getUIString("$197009");
var DiceGage_Interval;
var DiceGage_Interval_num = 0;
var GoldAuction_MaxPrice = 0;
var Gage_Select = "0";
var btn_flag = "false";
var restchecknum = "0";
var restBgDisplyMax = 3;
var DistributionWindow_Dice_Select = "0";
container_mc.popupType0.combobox._visible = false;
container_mc.popupType0.GageBar._visible = false;
bWidgetOpen = true;
myListener.OnGameEventShowWindow = function(WindowName, bShow)
{
   if(WindowName.toLowerCase() == UIname.toLowerCase())
   {
      bWidgetOpen = bShow;
      if(bWidgetOpen)
      {
         UI._visible = true;
         DistributionWindow_init();
      }
      else
      {
         UI._visible = false;
      }
   }
};
DistributionWindow_init = function()
{
   container_mc.popupType0._visible = true;
   container_mc.popupType1._visible = false;
   DiceGage_Interval_num = 0;
   GoldAuction_Price = 0;
};
myListener.OnGame_DistributionWindow_Dice = function(_data, btnEnable)
{
   DistributionWindow_init();
   container_mc.popupType0._visible = true;
   container_mc.popupType1._visible = false;
   container_mc.hit.gotoAndStop(1);
   var _loc1_ = _data.split("\t");
   container_mc.popupType0.combobox._visible = false;
   container_mc.popupType0.GageBar._visible = false;
   container_mc.popupType0.Btn0._y = 164.8;
   container_mc.popupType0.Btn1._y = 164.8;
   container_mc.popupType0.combobox._y = 105;
   container_mc.popupType0.combo_txt._visible = false;
   container_mc.popupType0.BgMc3.gotoAndStop(1);
   if(_loc1_[9] == 1)
   {
      container_mc.popupType0.title_txt.text = str1;
      container_mc.popupType0.distribuon_icons.gotoAndStop(1);
      container_mc.popupType0.GageBar._visible = true;
      container_mc.popupType0.combobox._visible = false;
      DistributionWindow_Dice_Select = "0";
   }
   else if(_loc1_[9] == 2)
   {
      container_mc.popupType0.title_txt.text = str4;
      container_mc.popupType0.distribuon_icons.gotoAndStop(2);
      container_mc.popupType0.GageBar._visible = true;
      container_mc.popupType0.combobox._visible = false;
      DistributionWindow_Dice_Select = "1";
   }
   else if(_loc1_[9] == 3)
   {
      container_mc.popupType0.title_txt.text = str5;
      container_mc.popupType0.BgMc3.gotoAndStop(2);
      container_mc.popupType0.distribuon_icons.gotoAndStop(3);
      container_mc.popupType0.GageBar._visible = false;
      container_mc.popupType0.combobox._visible = true;
      DistributionWindow_Dice_Select = "2";
      container_mc.popupType0.Btn0._y = 221.8;
      container_mc.popupType0.Btn1._y = 221.8;
      container_mc.popupType0.combobox._y = 180;
      container_mc.popupType0.combo_txt._visible = true;
   }
   else
   {
      container_mc.popupType0.title_txt.text = str1;
      container_mc.popupType0.distribuon_icons.gotoAndStop(1);
      container_mc.popupType0.combobox._visible = false;
      container_mc.popupType0.GageBar._visible = false;
   }
   container_mc.popupType0.item.draw(_loc1_[0]);
   container_mc.popupType0.slot_txt.text = _loc1_[1];
   container_mc.popupType0.item.num_txt.text = _loc1_[2];
   container_mc.popupType0.item.grade = _loc1_[7];
   container_mc.popupType0.item.sealType = _loc1_[8];
   if(_loc1_[7] == "0")
   {
      container_mc.popupType0.slot_txt.textColor = lib.info.TextColor.RAREGRADE0;
   }
   else if(_loc1_[7] == "1")
   {
      container_mc.popupType0.slot_txt.textColor = lib.info.TextColor.RAREGRADE1;
   }
   else if(_loc1_[7] == "2")
   {
      container_mc.popupType0.slot_txt.textColor = lib.info.TextColor.RAREGRADE2;
   }
   else if(_loc1_[7] == "3")
   {
      container_mc.popupType0.slot_txt.textColor = lib.info.TextColor.RAREGRADE3;
   }
   lib.manager.ToolTip.add(container_mc.popupType0.item,_loc1_[4],6,container_mc.popupType0.item);
   if(_loc1_[3] == "0")
   {
      container_mc.popupType0.txt0.text = str2_0;
      container_mc.popupType0.txt0.textColor = 16777215;
      Gage_Select = "0";
   }
   else if(_loc1_[3] == "1")
   {
      container_mc.popupType0.txt0.text = str2_1;
      container_mc.popupType0.txt0.textColor = 16777215;
      Gage_Select = "0";
   }
   else if(_loc1_[3] == "2")
   {
      container_mc.popupType0.txt0.text = str2_2;
      container_mc.popupType0.txt0.textColor = 8447772;
      Gage_Select = "1";
   }
   if(_loc1_[4] == undefined || _loc1_[4] == "undefined" || _loc1_[4] == "")
   {
      container_mc.popupType0.data_txtmc.data_txt.text = "";
      container_mc.popupType0.data_txtmc._visible = false;
   }
   else if(_loc1_[4] == "0")
   {
      container_mc.popupType0.data_txtmc.data_txt.text = "";
      container_mc.popupType0.data_txtmc._visible = false;
      playNextPop(_loc1_[4]);
   }
   else
   {
      container_mc.popupType0.data_txtmc._visible = true;
      container_mc.popupType0.data_txtmc.data_txt.text = _loc1_[4];
      playNextPop(_loc1_[4]);
   }
   if(_loc1_[9] == "3")
   {
      btn1.setText(_loc1_[5]);
      btn2.setText(_loc1_[6]);
   }
   else
   {
      btn1.setText(lib.util.UIString.getUIString("$197006","keydata",_loc1_[5]));
      btn2.setText(lib.util.UIString.getUIString("$197007","keydata",_loc1_[6]));
   }
   if(btn_flag == "false")
   {
      btn1.setEnabled(false);
      btn2.setEnabled(false);
   }
   else if(btn_flag == "true")
   {
      btn1.setEnabled(true);
      btn2.setEnabled(true);
   }
   if(_loc1_[9] == "3")
   {
      btn1.setRelease(function()
      {
         ToGame_DistributionWindow_PartyWindowRaidMemberOK();
      }
      );
      btn2.setRelease(function()
      {
         ToGame_DistributionWindow_PartyWindowRaidMemberCancel();
      }
      );
   }
   else
   {
      btn1.setRelease(function()
      {
         ToGame_DistributionWindow_DiceBiddng();
      }
      );
      btn2.setRelease(function()
      {
         ToGame_DistributionWindow_DiceBidWaiver();
      }
      );
   }
   myListener.OnGame_DistributionWindow_BooleanBtn(btnEnable);
};
myListener.OnGame_DistributionWindow_DiceResttime = function(_time)
{
   DistributionWindow_Gage_IntervalStart(container_mc.popupType0,_time);
};
myListener.OnGame_DistributionWindow_Gold = function(_data, btnEnable)
{
   DistributionWindow_init();
   container_mc.popupType0._visible = false;
   container_mc.popupType1._visible = true;
   container_mc.hit.gotoAndStop(2);
   var _loc1_ = _data.split("\t");
   container_mc.popupType1.title_txt.text = str3;
   container_mc.popupType1.item.draw(_loc1_[0]);
   container_mc.popupType1.slot_txt.text = _loc1_[1];
   container_mc.popupType1.item.num_txt.text = _loc1_[2];
   container_mc.popupType1.item.grade = _loc1_[10];
   container_mc.popupType1.item.sealType = _loc1_[11];
   if(_loc1_[10] == "0")
   {
      container_mc.popupType1.slot_txt.textColor = lib.info.TextColor.RAREGRADE0;
   }
   else if(_loc1_[10] == "1")
   {
      container_mc.popupType1.slot_txt.textColor = lib.info.TextColor.RAREGRADE1;
   }
   else if(_loc1_[10] == "2")
   {
      container_mc.popupType1.slot_txt.textColor = lib.info.TextColor.RAREGRADE2;
   }
   else if(_loc1_[10] == "3")
   {
      container_mc.popupType1.slot_txt.textColor = lib.info.TextColor.RAREGRADE3;
   }
   lib.manager.ToolTip.add(container_mc.popupType1.item.SLOT,_loc1_[7],6,container_mc.popupType1.item);
   if(_loc1_[3] == "0")
   {
      container_mc.popupType1.txt0.text = "";
      Gage_Select = "0";
   }
   else if(_loc1_[3] == "1")
   {
      container_mc.popupType1.txt0.text = str2_1;
      container_mc.popupType1.txt0.textColor = 16777215;
      Gage_Select = "0";
   }
   else if(_loc1_[3] == "2")
   {
      container_mc.popupType1.txt0.text = str2_2;
      container_mc.popupType1.txt0.textColor = 8447772;
      Gage_Select = "1";
   }
   container_mc.popupType1.txt__0.text = _loc1_[4];
   var _loc2_ = lib.util.GoldCurrency.SetGoldText(_loc1_[5]);
   container_mc.popupType1.txt__2.htmlText = _loc2_;
   GoldAuction_MaxPrice = _loc1_[5];
   container_mc.popupType1.txt__2.autoSize = true;
   container_mc.popupType1.txt__2._x = 397 - container_mc.popupType1.txt__2._width - 15;
   container_mc.popupType1.ArrowIcon._x = container_mc.popupType1.txt__2._x - 30;
   var _loc3_ = lib.util.GoldCurrency.SetGoldText(_loc1_[6]);
   container_mc.popupType1.txt__1.htmlText = _loc3_;
   if(_loc1_[5] == _loc1_[6])
   {
      container_mc.popupType1.txt__1.textColor = 12845056;
   }
   else
   {
      container_mc.popupType1.txt__1.textColor = 16756787;
   }
   if(_loc1_[7] == undefined || _loc1_[7] == "undefined" || _loc1_[7] == "")
   {
      container_mc.popupType1.data_txtmc.data_txt.text = "";
      container_mc.popupType1.data_txtmc._visible = false;
   }
   else if(_loc1_[7] == "0")
   {
      container_mc.popupType1.data_txtmc.data_txt.text = "";
      container_mc.popupType1.data_txtmc._visible = false;
      playNextPop(_loc1_[7]);
   }
   else
   {
      container_mc.popupType1.data_txtmc._visible = true;
      container_mc.popupType1.data_txtmc.data_txt.text = _loc1_[7];
      playNextPop(_loc1_[7]);
   }
   btn3.setText(lib.util.UIString.getUIString("$197006","keydata",_loc1_[8]));
   btn4.setText(lib.util.UIString.getUIString("$197007","keydata",_loc1_[9]));
   if(btn_flag == "false")
   {
      btn3.setEnabled(false);
      btn4.setEnabled(false);
   }
   else if(btn_flag == "true")
   {
      btn3.setEnabled(true);
      btn4.setEnabled(true);
   }
   btn3.setRelease(function()
   {
      ToGame_DistributionWindow_GoldBiddng();
   }
   );
   btn4.setRelease(function()
   {
      ToGame_DistributionWindow_GoldBidWaiver();
   }
   );
   myListener.OnGame_DistributionWindow_BooleanBtn(btnEnable);
};
myListener.OnGame_DistributionWindow_GoldResttime = function(_time)
{
   DistributionWindow_Gage_IntervalStart(container_mc.popupType1,_time);
};
myListener.OnGame_DistributionWindow_GoldPriceInput = function(_data)
{
   container_mc.popupType1.txt__1.text = lib.util.CurrencyFormat.makeComma(_data);
   if(GoldAuction_MaxPrice == _data)
   {
      container_mc.popupType1.txt__1.textColor = 12845056;
   }
   else
   {
      container_mc.popupType1.txt__1.textColor = 16756787;
   }
};
myListener.OnGame_DistributionWindow_Gage = function(_time)
{
   container_mc.onEnterFrame = null;
   if(container_mc.popupType0._visible == true)
   {
      container_mc.popupType0.GageBar.gage0._visible = false;
      container_mc.popupType0.GageBar.gage1._visible = false;
      var _loc1_ = undefined;
      if(Gage_Select == "0")
      {
         _loc1_ = container_mc.popupType0.GageBar.gage0;
      }
      else if(Gage_Select == "1")
      {
         _loc1_ = container_mc.popupType0.GageBar.gage1;
      }
      _loc1_._visible = true;
      container_mc.popupType0.GageBar.effect._visible = true;
      container_mc.popupType0.GageBar.effect._x = _loc1_._x + _loc1_._width - 20;
      DistributionWindow_Gage_Start(_loc1_,container_mc.popupType0.GageBar.effect,_time);
   }
   else if(container_mc.popupType1._visible == true)
   {
      container_mc.popupType1.GageBar.gage1._visible = false;
      container_mc.popupType1.GageBar.gage0._visible = false;
      if(Gage_Select == "0")
      {
         _loc1_ = container_mc.popupType1.GageBar.gage0;
      }
      else if(Gage_Select == "1")
      {
         _loc1_ = container_mc.popupType1.GageBar.gage1;
      }
      _loc1_._visible = true;
      container_mc.popupType1.GageBar.effect._visible = true;
      container_mc.popupType1.GageBar.effect._x = _loc1_._x + _loc1_._width - 20;
      DistributionWindow_Gage_Start(_loc1_,container_mc.popupType1.GageBar.effect,_time);
   }
};
DistributionWindow_Gage_Start = function(target1, target2, _time)
{
   var num = 0;
   var _timenum = (_time / 1 + 0) * 24;
   UI.onEnterFrame = function()
   {
      num++;
      if(target1._xscale > 0)
      {
         var _loc1_ = (_time - DiceGage_Interval_num) * (100 / _time);
         target1._xscale = (_timenum - num) / _timenum * 100;
         if(num % 24 == 0)
         {
            if(target1._xscale < _loc1_)
            {
               _timenum = (_time / 1 + 0) * 26.5;
            }
         }
         target2._x = target1._x + target1._width - 20;
      }
      else
      {
         UI.onEnterFrame = null;
         num = 0;
      }
      if(target1._xscale <= 2)
      {
         target2._visible = false;
      }
   };
};
DistributionWindow_Gage_IntervalStart = function(target1, _time)
{
   target1.count_txt.text = str2_data + _time + str1_data;
};
myListener.OnGame_DistributionWindow_Hotkey2 = function(keydata)
{
   var _loc1_ = keydata.split("\t");
   if(_loc1_.length == 2)
   {
      btn1.setText(lib.util.UIString.getUIString("$197006","keydata",_loc1_[0]));
      btn2.setText(lib.util.UIString.getUIString("$197007","keydata",_loc1_[1]));
      btn3.setText(lib.util.UIString.getUIString("$197006","keydata",_loc1_[0]));
      btn4.setText(lib.util.UIString.getUIString("$197007","keydata",_loc1_[1]));
   }
   if(btn_flag == "false")
   {
      btn1.setEnabled(false);
      btn2.setEnabled(false);
      btn3.setEnabled(false);
      btn4.setEnabled(false);
   }
   else if(btn_flag == "true")
   {
      btn1.setEnabled(true);
      btn2.setEnabled(true);
      btn3.setEnabled(true);
      btn4.setEnabled(true);
   }
};
myListener.OnGame_DistributionWindow_BooleanBtn = function(flag)
{
   var _loc2_ = undefined;
   if(container_mc.popupType0._visible == true)
   {
      _loc2_ = container_mc.popupType0;
   }
   else if(container_mc.popupType1._visible == true)
   {
      _loc2_ = container_mc.popupType1;
   }
   btn1.setEnabled(Boolean(flag));
   btn2.setEnabled(Boolean(flag));
   btn3.setEnabled(Boolean(flag));
   btn4.setEnabled(Boolean(flag));
   if(flag == "0")
   {
      btn_flag = "false";
   }
   else if(flag == "1")
   {
      btn_flag = "true";
   }
};
myListener.OnGame_DistributionWindow_RestNum = function(_data)
{
   var _loc1_ = undefined;
   if(container_mc.popupType0._visible == true)
   {
      _loc1_ = container_mc.popupType0;
   }
   else if(container_mc.popupType1._visible == true)
   {
      _loc1_ = container_mc.popupType1;
   }
   if(_data == undefined || _data == "undefined" || _data == "")
   {
      _loc1_.data_txtmc.data_txt.text = "";
      _loc1_.data_txtmc._visible = false;
   }
   else if(_data == "0")
   {
      _loc1_.data_txtmc.data_txt.text = "";
      _loc1_.data_txtmc._visible = false;
      restchecknumFunc(_data);
   }
   else
   {
      _loc1_.data_txtmc._visible = true;
      _loc1_.data_txtmc.data_txt.text = _data;
      restchecknumFunc(_data);
   }
};
myListener.OnGame_DistributionWindow_PartyWindowRaidMember = function(_data)
{
   var _loc2_ = {};
   var _loc1_ = _data.split("\t");
   container_mc.popupType0.combobox.rowMax = _loc1_.length;
   if(_loc1_.length == 1)
   {
      container_mc.popupType0.combobox.data = [{label:_loc1_[0],id:1}];
   }
   else if(_loc1_.length == 2)
   {
      container_mc.popupType0.combobox.data = [{label:_loc1_[0],id:1},{label:_loc1_[1],id:2}];
   }
   else if(_loc1_.length == 3)
   {
      container_mc.popupType0.combobox.data = [{label:_loc1_[0],id:1},{label:_loc1_[1],id:2},{label:_loc1_[2],id:3}];
   }
   else if(_loc1_.length == 4)
   {
      container_mc.popupType0.combobox.data = [{label:_loc1_[0],id:1},{label:_loc1_[1],id:2},{label:_loc1_[2],id:3},{label:_loc1_[3],id:4}];
   }
   else if(_loc1_.length == 5)
   {
      container_mc.popupType0.combobox.data = [{label:_loc1_[0],id:1},{label:_loc1_[1],id:2},{label:_loc1_[2],id:3},{label:_loc1_[3],id:4},{label:_loc1_[4],id:5}];
   }
   else if(_loc1_.length == 6)
   {
      container_mc.popupType0.combobox.data = [{label:_loc1_[0],id:1},{label:_loc1_[1],id:2},{label:_loc1_[2],id:3},{label:_loc1_[3],id:4},{label:_loc1_[4],id:5},{label:_loc1_[5],id:6}];
   }
   else if(_loc1_.length == 7)
   {
      container_mc.popupType0.combobox.data = [{label:_loc1_[0],id:1},{label:_loc1_[1],id:2},{label:_loc1_[2],id:3},{label:_loc1_[3],id:4},{label:_loc1_[4],id:5},{label:_loc1_[5],id:6},{label:_loc1_[6],id:7}];
   }
   else if(_loc1_.length == 8)
   {
      container_mc.popupType0.combobox.data = [{label:_loc1_[0],id:1},{label:_loc1_[1],id:2},{label:_loc1_[2],id:3},{label:_loc1_[3],id:4},{label:_loc1_[4],id:5},{label:_loc1_[5],id:6},{label:_loc1_[6],id:7},{label:_loc1_[7],id:8}];
   }
   else if(_loc1_.length == 9)
   {
      container_mc.popupType0.combobox.data = [{label:_loc1_[0],id:1},{label:_loc1_[1],id:2},{label:_loc1_[2],id:3},{label:_loc1_[3],id:4},{label:_loc1_[4],id:5},{label:_loc1_[5],id:6},{label:_loc1_[6],id:7},{label:_loc1_[7],id:8},{label:_loc1_[8],id:9}];
   }
   else if(_loc1_.length == 10)
   {
      container_mc.popupType0.combobox.data = [{label:_loc1_[0],id:1},{label:_loc1_[1],id:2},{label:_loc1_[2],id:3},{label:_loc1_[3],id:4},{label:_loc1_[4],id:5},{label:_loc1_[5],id:6},{label:_loc1_[6],id:7},{label:_loc1_[7],id:8},{label:_loc1_[8],id:9},{label:_loc1_[9],id:10}];
   }
   else if(_loc1_.length == 11)
   {
      container_mc.popupType0.combobox.data = [{label:_loc1_[0],id:1},{label:_loc1_[1],id:2},{label:_loc1_[2],id:3},{label:_loc1_[3],id:4},{label:_loc1_[4],id:5},{label:_loc1_[5],id:6},{label:_loc1_[6],id:7},{label:_loc1_[7],id:8},{label:_loc1_[8],id:9},{label:_loc1_[9],id:10},{label:_loc1_[10],id:11}];
   }
   else if(_loc1_.length == 12)
   {
      container_mc.popupType0.combobox.data = [{label:_loc1_[0],id:1},{label:_loc1_[1],id:2},{label:_loc1_[2],id:3},{label:_loc1_[3],id:4},{label:_loc1_[4],id:5},{label:_loc1_[5],id:6},{label:_loc1_[6],id:7},{label:_loc1_[7],id:8},{label:_loc1_[8],id:9},{label:_loc1_[9],id:10},{label:_loc1_[10],id:11},{label:_loc1_[11],id:12}];
   }
   else if(_loc1_.length == 13)
   {
      container_mc.popupType0.combobox.data = [{label:_loc1_[0],id:1},{label:_loc1_[1],id:2},{label:_loc1_[2],id:3},{label:_loc1_[3],id:4},{label:_loc1_[4],id:5},{label:_loc1_[5],id:6},{label:_loc1_[6],id:7},{label:_loc1_[7],id:8},{label:_loc1_[8],id:9},{label:_loc1_[9],id:10},{label:_loc1_[10],id:11},{label:_loc1_[11],id:12},{label:_loc1_[12],id:13}];
   }
   else if(_loc1_.length == 14)
   {
      container_mc.popupType0.combobox.data = [{label:_loc1_[0],id:1},{label:_loc1_[1],id:2},{label:_loc1_[2],id:3},{label:_loc1_[3],id:4},{label:_loc1_[4],id:5},{label:_loc1_[5],id:6},{label:_loc1_[6],id:7},{label:_loc1_[7],id:8},{label:_loc1_[8],id:9},{label:_loc1_[9],id:10},{label:_loc1_[10],id:11},{label:_loc1_[11],id:12},{label:_loc1_[12],id:13},{label:_loc1_[13],id:14}];
   }
   else if(_loc1_.length == 15)
   {
      container_mc.popupType0.combobox.data = [{label:_loc1_[0],id:1},{label:_loc1_[1],id:2},{label:_loc1_[2],id:3},{label:_loc1_[3],id:4},{label:_loc1_[4],id:5},{label:_loc1_[5],id:6},{label:_loc1_[6],id:7},{label:_loc1_[7],id:8},{label:_loc1_[8],id:9},{label:_loc1_[9],id:10},{label:_loc1_[10],id:11},{label:_loc1_[11],id:12},{label:_loc1_[12],id:13},{label:_loc1_[13],id:14},{label:_loc1_[14],id:15}];
   }
   else if(_loc1_.length == 16)
   {
      container_mc.popupType0.combobox.data = [{label:_loc1_[0],id:1},{label:_loc1_[1],id:2},{label:_loc1_[2],id:3},{label:_loc1_[3],id:4},{label:_loc1_[4],id:5},{label:_loc1_[5],id:6},{label:_loc1_[6],id:7},{label:_loc1_[7],id:8},{label:_loc1_[8],id:9},{label:_loc1_[9],id:10},{label:_loc1_[10],id:11},{label:_loc1_[11],id:12},{label:_loc1_[12],id:13},{label:_loc1_[13],id:14},{label:_loc1_[14],id:15},{label:_loc1_[15],id:16}];
   }
   else if(_loc1_.length == 17)
   {
      container_mc.popupType0.combobox.data = [{label:_loc1_[0],id:1},{label:_loc1_[1],id:2},{label:_loc1_[2],id:3},{label:_loc1_[3],id:4},{label:_loc1_[4],id:5},{label:_loc1_[5],id:6},{label:_loc1_[6],id:7},{label:_loc1_[7],id:8},{label:_loc1_[8],id:9},{label:_loc1_[9],id:10},{label:_loc1_[10],id:11},{label:_loc1_[11],id:12},{label:_loc1_[12],id:13},{label:_loc1_[13],id:14},{label:_loc1_[14],id:15},{label:_loc1_[15],id:16},{label:_loc1_[16],id:17}];
   }
   else if(_loc1_.length == 18)
   {
      container_mc.popupType0.combobox.data = [{label:_loc1_[0],id:1},{label:_loc1_[1],id:2},{label:_loc1_[2],id:3},{label:_loc1_[3],id:4},{label:_loc1_[4],id:5},{label:_loc1_[5],id:6},{label:_loc1_[6],id:7},{label:_loc1_[7],id:8},{label:_loc1_[8],id:9},{label:_loc1_[9],id:10},{label:_loc1_[10],id:11},{label:_loc1_[11],id:12},{label:_loc1_[12],id:13},{label:_loc1_[13],id:14},{label:_loc1_[14],id:15},{label:_loc1_[15],id:16},{label:_loc1_[16],id:17},{label:_loc1_[17],id:18}];
   }
   else if(_loc1_.length == 19)
   {
      container_mc.popupType0.combobox.data = [{label:_loc1_[0],id:1},{label:_loc1_[1],id:2},{label:_loc1_[2],id:3},{label:_loc1_[3],id:4},{label:_loc1_[4],id:5},{label:_loc1_[5],id:6},{label:_loc1_[6],id:7},{label:_loc1_[7],id:8},{label:_loc1_[8],id:9},{label:_loc1_[9],id:10},{label:_loc1_[10],id:11},{label:_loc1_[11],id:12},{label:_loc1_[12],id:13},{label:_loc1_[13],id:14},{label:_loc1_[14],id:15},{label:_loc1_[15],id:16},{label:_loc1_[16],id:17},{label:_loc1_[17],id:18},{label:_loc1_[18],id:19}];
   }
   else if(_loc1_.length == 20)
   {
      container_mc.popupType0.combobox.data = [{label:_loc1_[0],id:1},{label:_loc1_[1],id:2},{label:_loc1_[2],id:3},{label:_loc1_[3],id:4},{label:_loc1_[4],id:5},{label:_loc1_[5],id:6},{label:_loc1_[6],id:7},{label:_loc1_[7],id:8},{label:_loc1_[8],id:9},{label:_loc1_[9],id:10},{label:_loc1_[10],id:11},{label:_loc1_[11],id:12},{label:_loc1_[12],id:13},{label:_loc1_[13],id:14},{label:_loc1_[14],id:15},{label:_loc1_[15],id:16},{label:_loc1_[16],id:17},{label:_loc1_[17],id:18},{label:_loc1_[18],id:19},{label:_loc1_[19],id:20}];
   }
   container_mc.popupType0.combobox.addListener(_loc2_);
};
var btn1 = container_mc.popupType0.Btn0.txtBtn;
var btn2 = container_mc.popupType0.Btn1.txtBtn;
var btn3 = container_mc.popupType1.Btn0.txtBtn;
var btn4 = container_mc.popupType1.Btn1.txtBtn;
btn1.setEnabled(false);
btn2.setEnabled(false);
btn3.setEnabled(false);
btn4.setEnabled(false);
DistributionWindow_init();
ToGame_DistributionWindow_Init();
