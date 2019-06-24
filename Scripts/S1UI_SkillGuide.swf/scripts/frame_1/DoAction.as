function MoveEvent(mc, pos)
{
   gs.TweenLite.to(mc,0.3,{_x:pos,ease:Regular.easeOut});
   if(pos == 0)
   {
      if(mc.kType == "0")
      {
         mc.iconMc.bg1._visible = false;
         mc.iconMc.bg2._visible = true;
      }
      else
      {
         mc.iconMc.gotoAndPlay(2);
      }
   }
}
function SetKey(keyCode, txt)
{
   var _loc1_ = lib.info.KeyMap.toKeyCode(keyCode);
   if(_loc1_ == undefined)
   {
      _loc1_ = "";
   }
   lib.Debuger.trace(_loc1_);
   return _loc1_;
}
var UI = this;
var UIname = "SkillGuide";
UI._visible = false;
var bWindowOpen = true;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
var skillMax = 5;
var SKILL_WID = 80;
var boxCount = 0;
var boxArr = [];
myListener.OnGameEventShowWindow = function(WindowName, bShow)
{
   if(WindowName.toLowerCase() == UIname.toLowerCase())
   {
      bWindowOpen = bShow;
      UI._visible = bShow;
      container_mc.bgMc._visible = false;
   }
};
myListener.OnGameEventChangeUIMode = function(bShow)
{
   if(_global.gbUIMode)
   {
      if(array.length >= 1)
      {
         container_mc.UIDrager._visible = true;
      }
   }
   else
   {
      container_mc.UIDrager._visible = false;
   }
};
myListener.OnGame_SkillGuide_Tip = function(str)
{
   if(str == "" || str == undefined)
   {
      container_mc.txt.text = "";
      container_mc.txtBg._visible = false;
   }
   else
   {
      container_mc.txt.autoSize = true;
      container_mc.txt.htmlText = str;
      container_mc.txtBg._visible = true;
      container_mc.txtBg._width = container_mc.txt.textWidth + 30;
   }
};
container_mc.bgMc._visible = false;
container_mc.txtBg._visible = false;
myListener.OnGame_SkillGuide_Add = function(id, type, keyTxt, img)
{
   var _loc1_ = container_mc.box.attachMovie("skillMc","skill" + id,boxCount);
   container_mc.bgMc._visible = true;
   if(img == undefined || img == "")
   {
      _loc1_.gotoAndStop(Number(type) + 4);
   }
   else
   {
      _loc1_.gotoAndStop(Number(type) + 1);
   }
   _loc1_._x = boxCount * SKILL_WID;
   _loc1_.kType = type;
   boxCount++;
   boxArr.push(_loc1_);
   lib.display.DrawBitmapData.draw(_loc1_.slotMc,img,0,0,0,0,42,42,0.65625);
   if(type == "0")
   {
      _loc1_.iconMc.txt.text = keyTxt;
      _loc1_.iconMc.bg2._visible = false;
      var _loc3_ = _loc1_.iconMc.txt.textWidth + 16;
      if(keyTxt.length > 7)
      {
         _loc1_.iconMc.bg0._width = _loc1_.iconMc.bg1._width = _loc1_.iconMc.bg2._width = 80;
         _loc1_.iconMc.bg0._x = _loc1_.iconMc.bg1._x = _loc1_.iconMc.bg2._x = -24;
         _loc1_.iconMc.txt.setText(keyTxt);
      }
      else if(keyTxt.length > 1)
      {
         _loc1_.iconMc.bg0._width = _loc1_.iconMc.bg1._width = _loc1_.iconMc.bg2._width = _loc3_ + 8;
         _loc1_.iconMc.bg0._x = _loc1_.iconMc.bg1._x = _loc1_.iconMc.bg2._x = 12 - _loc3_ / 2;
      }
      if(boxCount == 1)
      {
         _loc1_.iconMc.bg1._visible = false;
         _loc1_.iconMc.bg2._visible = true;
      }
      else
      {
         _loc1_.iconMc.bg1._visible = true;
         _loc1_.iconMc.bg2._visible = false;
      }
   }
   else if(boxCount == 1)
   {
      _loc1_.iconMc.gotoAndPlay(2);
   }
   if(checkCount > skillMax)
   {
      _loc1_._visible = false;
   }
};
myListener.OnGame_SkillGuide_Remove = function()
{
   var _loc4_ = boxArr[0];
   _loc4_.removeMovieClip();
   boxArr.shift();
   boxCount--;
   if(boxCount == 0)
   {
      container_mc.bgMc._visible = false;
      return undefined;
   }
   var _loc1_ = 0;
   while(_loc1_ < boxCount)
   {
      var _loc2_ = boxArr[_loc1_];
      var _loc3_ = _loc1_ * SKILL_WID;
      MoveEvent(_loc2_,_loc3_);
      _loc1_ = _loc1_ + 1;
   }
};
myListener.OnGame_SkillGuide_AllClear = function()
{
   var _loc1_ = 0;
   while(_loc1_ < boxCount)
   {
      var _loc2_ = boxArr[_loc1_];
      _loc2_.removeMovieClip();
      _loc1_ = _loc1_ + 1;
   }
   boxArr = [];
   boxCount = 0;
   container_mc.bgMc._visible = false;
};
