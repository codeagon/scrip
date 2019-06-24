function ToGame_DarkRiftBoard_CloseUI()
{
   fscommand("ToGame_DarkRiftBoard_CloseUI");
}
_global.gfxExtensions = true;
var UI = this;
UI._visible = false;
var UIname = "DarkRiftBoard";
this.bWindowOpen = false;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
container_mc.unionTitleFd.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
var WarningTime = 30;
var SubCount = 0;
var e_btn = container_mc.boardMc.btmMc.enter_btn.txtBtn;
e_btn.setRelease(ToGame_DarkRiftBoard_CloseUI);
myListener.OnGameEventShowWindow = function(WindowName, bShow)
{
   if(WindowName.toLowerCase() == UIname.toLowerCase())
   {
      bWindowOpen = bShow;
      if(bWindowOpen)
      {
         UI._visible = true;
      }
      else
      {
         UI._visible = false;
      }
   }
};
myListener.OnGameEventChangeUIMode = function()
{
   if(_global.gbUIMode)
   {
      container_mc.tabBtn._visible = true;
   }
   else
   {
      container_mc.tabBtn._visible = false;
   }
};
var GOLD_STR = lib.util.UIString.getUIString("$101087") + " ";
var EXP_STR = lib.util.UIString.getUIString("$101088") + " ";
var maxLen = 2;
myListener.OnGame_DarkRiftBoard_Result = function(index, tTxt, rTxt, rData, noneTxt)
{
   if(!container_mc._visible)
   {
      container_mc._visible = true;
      container_mc.gotoAndPlay(2);
   }
   var _loc7_ = mc["line" + index];
   if(!_loc7_)
   {
      _loc7_ = container_mc.boardMc.boxMc.attachMovie("lineMc","line" + index,container_mc.boardMc.boxMc.getNextHighestDepth());
   }
   _loc7_.txt0.setText(tTxt);
   _loc7_.txt1.setText(rTxt);
   lib.manager.ToolTip.add(_loc7_.hit,index + "\t1",6);
   _loc7_._y = 74 * index;
   _loc7_._alpha = 0;
   if(index > 2)
   {
      var _loc12_ = (index - 2) * 74;
      container_mc.boardMc.btmMc._y = 320 + _loc12_;
      container_mc.boardMc.midBg._height = 370 + _loc12_;
      container_mc.topBg._height = 430 + _loc12_;
      container_mc.btmBg._height = 430 + _loc12_;
      container_mc._y = - _loc12_ / 2;
   }
   var _loc14_ = 0.5 + index * 0.2;
   gs.TweenLite.to(_loc7_,0.3,{delay:_loc14_,_x:4,_alpha:100,ease:Regular.easeOut});
   var _loc9_ = lib.util.ExtString.split(rData,"\n");
   var _loc8_ = _loc9_.length;
   var _loc6_ = 0;
   if(noneTxt)
   {
      _loc7_.txt2.htmlText = noneTxt;
   }
   if(_loc8_ == 0)
   {
      _loc7_.txt2._visible = true;
      _loc7_.slotBg._visible = false;
      return undefined;
   }
   var _loc13_ = 0;
   if(_loc8_ > maxLen)
   {
      maxLen = _loc8_;
      _loc13_ = (maxLen - 2) * 65;
      var _loc10_ = _loc13_ / 2;
      container_mc.boardMc.txt0._x = 2 - _loc10_;
      container_mc.boardMc.txt1._x = 180 - _loc10_;
      container_mc.boardMc.txt2._x = 262 - _loc10_ + maxLen * 32;
      container_mc.boardMc.midBg._width = 465 + _loc13_;
      container_mc.boardMc.midBg._x = - _loc10_;
      container_mc.boardMc.boxMc._x = 2 - _loc10_;
      container_mc.btmBg._width = 634 + _loc13_;
      container_mc.btmBg._x = -84 - _loc10_;
      container_mc.boardMc.title_box._x = - _loc10_;
   }
   _loc7_.txt2._visible = false;
   _loc7_.slotBg._visible = true;
   _loc7_.slotBg.gotoAndStop(_loc8_);
   _loc6_ = 0;
   while(_loc6_ < _loc8_)
   {
      var _loc5_ = lib.util.ExtString.split(_loc9_[_loc6_],"\t");
      var _loc1_ = _loc7_.attachMovie("slotMc","slot" + _loc6_,_loc7_.getNextHighestDepth());
      _loc1_._x = 320 + _loc6_ * 65;
      _loc1_._y = 9;
      if(_loc5_[3] == "0")
      {
         _loc1_.grade._visible = false;
      }
      else
      {
         _loc1_.grade.gotoAndStop(Number(_loc5_[3]));
      }
      var _loc2_ = 0;
      var _loc3_ = _loc5_[2];
      var _loc4_ = _loc5_[4];
      if(_loc4_ == 1 || _loc4_ == 2)
      {
         _loc2_ = lib.util.GoldCurrency.SetGoldText(_loc3_,0,0,0,0);
         tooltipStr = "<font color=\'#" + lib.info.TextColor.GENERAL_MONEY.toString(16) + "\'>" + _loc2_ + "</font>";
         lib.manager.ToolTip.add(_loc1_,GOLD_STR + tooltipStr,1);
      }
      else if(_loc4_ == 3)
      {
         _loc2_ = lib.util.CurrencyFormat.makeComma(_loc3_);
         tooltipStr = "<font color=\'#" + lib.info.TextColor.GENERAL_EXP.toString(16) + "\'>" + _loc2_ + "</font>";
         lib.manager.ToolTip.add(_loc1_,EXP_STR + tooltipStr,1);
      }
      else if(_loc4_ == 4)
      {
         _loc2_ = lib.util.CurrencyFormat.makeComma(_loc3_);
         tooltipStr = "<font color=\'#00B4FF\'>" + lib.util.UIString.getUIString("$500063") + "</font>" + "<font color=\'#7d7d7d\'> : </font><font color=\'#007EFF\'>" + _loc2_ + "</font>";
         lib.manager.ToolTip.add(_loc1_,tooltipStr,1);
      }
      else if(_loc4_ == 5)
      {
         _loc2_ = lib.util.GoldCurrency.SetGoldText(_loc3_,0,0,0,1);
         tooltipStr = "<font color=\'#" + lib.info.TextColor.GENERAL_MONEY.toString(16) + "\'>" + _loc2_ + "</font>";
         lib.manager.ToolTip.add(_loc1_,GOLD_STR + tooltipStr,1);
      }
      else if(_loc4_ == 6)
      {
         _loc2_ = lib.util.CurrencyFormat.makeComma(_loc3_);
         tooltipStr = "<font color=\'#00BAFF\'>" + _loc2_ + "</font>";
         lib.manager.ToolTip.add(_loc1_,TIRED_STR + tooltipStr,1);
      }
      else
      {
         lib.manager.ToolTip.add(_loc1_,_loc5_[0] + "\t0",6);
         if(_loc3_ > 1)
         {
            _loc1_.num_txt.text = _loc3_;
         }
      }
      lib.display.DrawBitmapData.draw(_loc1_.img,_loc5_[1],0,0,0,0,54,54,0.84375);
      _loc6_ = _loc6_ + 1;
   }
};
infoBoard._visible = false;
container_mc._visible = false;
fscommand("ToGame_DarkRiftBoard_Init");
