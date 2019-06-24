function tweenEnd()
{
   gs.TweenLite.to(mc.effectBar,0.3,{_alpha:0,ease:Regular.easeOut});
}
function modeChange(target, num)
{
   if(target._alpha == num)
   {
      return undefined;
   }
   gs.TweenLite.killTweensOf(target,false);
   gs.TweenLite.to(target,0.3,{_alpha:num,ease:Regular.easeOut});
}
var UI = this;
UI._visible = false;
var UIname = "DungeonEventGage";
var bWindowOpen = true;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
container_mc0.UIDrager.setData(UIname,UI,container_mc0.lock_mc);
var wid = 372;
container_mc0.effectBar._alpha = 0;
container_mc1.maskMc._width = 3;
var FocusMc = container_mc;
container_mc0._visible = true;
container_mc1._visible = false;
myListener.OnGameEventShowWindow = function(WindowName, bShow)
{
   if(WindowName.toLowerCase() == UIname.toLowerCase())
   {
      bWindowOpen = Number(bShow);
      UI._visible = bShow;
      if(_global.gbUIMode)
      {
         container_mc0.bg_mc._visible = true;
      }
      else
      {
         container_mc0.bg_mc._visible = false;
         container_mc1.bg_mc._visible = false;
      }
   }
};
myListener.OnGameEventChangeUIMode = function()
{
   if(_global.gbUIMode)
   {
      container_mc0.bg_mc._visible = true;
   }
   else
   {
      container_mc0.bg_mc._visible = false;
      container_mc1.bg_mc._visible = false;
   }
};
myListener.OnGame_DungeonEventGage_Name = function(idx, nameStr)
{
   var _loc1_ = UI["container_mc" + idx];
   _loc1_.nameTxt.htmlText = nameStr;
};
myListener.OnGame_DungeonEventGage_AddGage = function()
{
   container_mc1._visible = true;
};
myListener.OnGame_DungeonEventGage_RemoveGage = function()
{
   container_mc1._visible = false;
};
myListener.OnGame_DungeonEventGage_Type = function(idx, typeNum)
{
   var _loc1_ = UI["container_mc" + idx];
   if(_loc1_.bar.gage)
   {
      _loc1_.bar.gage.removeMovieClip();
   }
   var _loc2_ = Number(typeNum) + 1;
   _loc1_.skinMc.gotoAndStop(_loc2_);
   _loc1_.effectBar.gotoAndStop(_loc2_);
   _loc1_.bar.attachMovie("gage" + typeNum,"gage",0);
};
myListener.OnGame_DungeonEventGage_Type();
myListener.OnGame_DungeonEventGage_Bar = function(idx, current, total)
{
   var _loc1_ = UI["container_mc" + idx];
   _loc1_.txt.text = current + " / " + total;
   var _loc2_ = current / total;
   var _loc3_ = _loc2_ * wid + 3;
   _loc1_.effectBar._x = _loc1_.maskMc._width;
   _loc1_.effectBar._alpha = 0;
   if(_loc2_ > 0.6)
   {
      modeChange(_loc1_.bar.gage.mc0,0);
      modeChange(_loc1_.bar.gage.mc1,0);
   }
   else if(_loc2_ > 0.3)
   {
      modeChange(_loc1_.bar.gage.mc0,0);
      modeChange(_loc1_.bar.gage.mc1,100);
   }
   else
   {
      modeChange(_loc1_.bar.gage.mc0,100);
      modeChange(_loc1_.bar.gage.mc1,100);
   }
   gs.TweenLite.killTweensOf(_loc1_.effectBar,false);
   gs.TweenLite.to(_loc1_.effectBar,0.3,{_x:_loc3_,_alpha:100,ease:Regular.easeOut,onComplete:tweenEnd});
   gs.TweenLite.killTweensOf(_loc1_.maskMc,false);
   gs.TweenLite.to(_loc1_.maskMc,0.3,{_width:_loc3_,ease:Regular.easeOut});
};
fscommand("ToGame_DungeonEventGage_Init");
