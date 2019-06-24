function ToGame_SkillUpGrade_Init()
{
   fscommand("ToGame_SkillUpGrade_Init");
}
function ToGame_SkillUpGrade_Enter()
{
   fscommand("ToGame_SkillUpGrade_Enter");
}
function ToGame_SkillUpGrade_Close()
{
   fscommand("ToGame_SkillUpGrade_Close");
}
function listReset(_Mc)
{
   for(var _loc2_ in _Mc)
   {
      if(typeof _Mc[_loc2_] == "movieclip")
      {
         _Mc[_loc2_].removeMovieClip();
      }
   }
}
function SetPosition(_num)
{
   if(_num < 50)
   {
      _num = 50;
   }
   var _loc1_ = container_mc.guideTxt.textHeight + 5;
   container_mc.guideTxt._height = _loc1_;
   container_mc.guideTxt._y = 115 + _num;
   container_mc.listMc1._y = 140 + _num + _loc1_;
}
var UI = this;
UI._visible = false;
var UIname = "SkillUpGrade";
this.bWindowOpen = false;
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
var AP_TXT = lib.util.UIString.getUIString("$590011");
var x_btn = new lib.util.TxtBtn(container_mc.xBtn);
x_btn.setRelease(ToGame_SkillUpGrade_Close);
var t_btn = container_mc.txtBtn0.txtBtn;
t_btn.setRelease(ToGame_SkillUpGrade_Enter);
myListener.OnGameEventShowWindow = function(_WindowName, _bShow)
{
   if(_WindowName.toLowerCase() == UIname.toLowerCase())
   {
      bWindowOpen = _bShow;
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
myListener.OnGameEventChangeUIMode = function(_bShow)
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
myListener.OnGame_SkillUpGrade_SetData = function(_NameTxt, _Img, _GuideText, _DataList)
{
   listReset(container_mc.listMc0);
   container_mc.nameTxt.htmlText = _NameTxt;
   container_mc.guideTxt.htmlText = _GuideText;
   var _loc5_ = lib.util.ExtString.split(_DataList,"\n");
   var _loc4_ = 0;
   lib.util.DrawBitmap.draw(container_mc.imgMc,_Img);
   container_mc.imgMc._height = 50;
   container_mc.imgMc._width = 50;
   var _loc1_ = 0;
   while(_loc1_ < _loc5_.length)
   {
      var _loc3_ = lib.util.ExtString.split(_loc5_[_loc1_],"\t");
      var _loc2_ = container_mc.listMc0.attachMovie("line0","line_" + _loc1_,container_mc.listMc0.getNextHighestDepth());
      _loc2_.txt0.setText(_loc3_[0]);
      _loc2_.txt1.setText(_loc3_[1]);
      _loc2_._y = _loc4_;
      _loc4_ = _loc4_ + 25;
      _loc1_ = _loc1_ + 1;
   }
   SetPosition(_loc4_);
};
myListener.OnGame_SkillUpGrade_SetPoint = function(_DataList)
{
   listReset(container_mc.listMc1);
   var _loc11_ = lib.util.ExtString.split(_DataList,"\n");
   var _loc12_ = 0;
   var _loc3_ = 0;
   while(_loc3_ < _loc11_.length)
   {
      var _loc2_ = lib.util.ExtString.split(_loc11_[_loc3_],"\t");
      var _loc1_ = container_mc.listMc1.attachMovie("line1","line_" + _loc3_,container_mc.listMc1.getNextHighestDepth());
      _loc1_._y = _loc12_;
      _loc12_ = _loc12_ + 40;
      _loc1_.txt.text = _loc2_[0];
      _loc1_.gagePlus.gotoAndStop(Number(_loc2_[5]) + 1);
      var _loc8_ = _loc2_[3];
      var _loc7_ = _loc2_[4];
      var _loc5_ = Number(_loc8_) + Number(_loc7_);
      var _loc9_ = undefined;
      _loc9_ = 50 + 50 * (Number(_loc5_) / 100);
      var _loc4_ = 252 * _loc8_ / _loc5_ * _loc9_ / 100;
      var _loc6_ = 252 * _loc7_ / _loc5_ * _loc9_ / 100;
      _loc1_.gageBar.box._width = _loc4_;
      _loc1_.gagePlus.box._width = _loc6_;
      _loc1_.gagePlus._x = _loc4_;
      _loc1_.gageBar.txt.setText(_loc2_[1]);
      var _loc10_ = Number(_loc2_[2]) <= 0?_loc2_[2]:"+" + _loc2_[2];
      _loc1_.gagePlus.txt.setText(_loc10_);
      _loc1_.gageBar.txt._x = Number(_loc4_ / 2) - _loc1_.gageBar.txt.textWidth / 2;
      _loc1_.gagePlus.txt._x = _loc6_ + 10;
      _loc3_ = _loc3_ + 1;
   }
};
myListener.OnGame_SkillUpGrade_SetTerms = function(_DataList)
{
   listReset(container_mc.listMc2);
   var _loc4_ = lib.util.ExtString.split(_DataList,"\n");
   var _loc5_ = 0;
   container_mc.testa.setText("asdfafsdfasdfsadfasdfasdfasdfsdf111222333");
   var _loc3_ = 0;
   while(_loc3_ < _loc4_.length)
   {
      var _loc2_ = lib.util.ExtString.split(_loc4_[_loc3_],"\t");
      var _loc1_ = container_mc.listMc2.attachMovie("line2","line_" + _loc3_,container_mc.listMc2.getNextHighestDepth());
      _loc1_._y = _loc5_;
      _loc5_ = _loc5_ + 35;
      _loc1_.gotoAndStop(Number(_loc2_[0]) + 1);
      _loc1_.txt.setText(_loc2_[1]);
      _loc1_.aaa.setText(_loc2_[1]);
      if(_loc2_[2])
      {
         lib.util.DrawBitmap.draw(_loc1_.imgMc,_loc2_[2]);
         _loc1_.imgMc._height = 24;
         _loc1_.imgMc._width = 24;
         _loc1_.txt._x = 60;
      }
      else
      {
         _loc1_.txt._x = 30;
      }
      _loc3_ = _loc3_ + 1;
   }
};
myListener.OnGame_SkillUpGrade_SetAP = function(_Num)
{
   container_mc.apTxt.htmlText = AP_TXT + " " + lib.util.CurrencyFormat.makeComma(_Num);
};
myListener.OnGame_SkillUpGrade_SetEnter = function(_Bool)
{
   t_btn.setEnabled(Boolean(Number(_Bool)));
};
ToGame_SkillUpGrade_Init();
