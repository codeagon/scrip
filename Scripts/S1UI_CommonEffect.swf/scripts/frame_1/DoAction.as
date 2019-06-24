var UI = this;
UI._visible = false;
var UIname = "CommonEffect";
this.bWindowOpen = false;
var myListener = new Object();
function ToGame_Init()
{
   fscommand("ToGame_CommonEffect_Init");
}
function test()
{
   UI._visible = true;
   myListener.OnGame_CommonEffect_ShowAchievmentGrade(1);
}
if(_global.EventBroadCaster)
{
   _global.EventBroadCaster.addListener(myListener);
}
myListener.OnGameEventShowWindow = function(_WindowName, _bShow)
{
   if(_WindowName.toLowerCase() == UIname.toLowerCase())
   {
      bWindowOpen = _bShow;
      container_mc.lock_mc._x = 937;
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
myListener.OnGame_CommonEffect_ShowAchievmentGrade = function(nGrade)
{
   if(nGrade == 0)
   {
      return undefined;
   }
   var _loc1_ = container_mc.attachMovie("AchievmentGrade","achievmentGrade",container_mc.getNextHighestDepth());
   _loc1_.mark0.gotoAndStop(Number(nGrade) + 1);
   _loc1_.mark1.gotoAndStop(Number(nGrade) + 1);
};
ToGame_Init();
