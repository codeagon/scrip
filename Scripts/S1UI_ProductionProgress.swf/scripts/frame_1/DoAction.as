function resultMessage(res)
{
   if(res)
   {
      container_mc.messageMc.result = "$154001";
      container_mc.gageBar.suMc.gotoAndPlay(2);
   }
   else
   {
      container_mc.messageMc.result = "$154002";
      container_mc.gageBar.faMc._visible = true;
      container_mc.gageBar.faMc.gotoAndPlay(2);
   }
   container_mc.messageMc.gotoAndPlay(2);
}
function clearProductionProgress()
{
   lib.util.ExtString.textCut(container_mc.nameFd,"",true);
   container_mc.slotMc.clear();
   container_mc.descFd.text = "";
   container_mc.gageBar.faMc._visible = false;
   myListener.OnGame_ProductionProgress_UpdateSuccess(0);
}
function ToGame_ProductionProgress_Init()
{
   fscommand("ToGame_ProductionProgress_Init");
}
var UI = this;
var UIname = "ProductionProgress";
var bWidgetOpen = true;
UI._visible = false;
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
var SPEED = 0.4;
myListener.OnGameEventShowWindow = function(widgetName, bShow)
{
   if(widgetName.toLowerCase() == UIname.toLowerCase())
   {
      bWidgetOpen = bShow;
      if(bWidgetOpen)
      {
         clearProductionProgress();
         ToGame_ProductionProgress_Init();
         UI._visible = true;
      }
      else
      {
         UI._visible = false;
      }
   }
};
myListener.OnGame_ProductionProgress_SetData = function(_data)
{
   var _loc1_ = lib.util.ExtString.split(_data,"\t");
   if(_loc1_.length > 0)
   {
      lib.util.ExtString.textCut(container_mc.nameFd,_loc1_[0],true);
      if(_loc1_[3] == undefined)
      {
         _loc1_[3] = 0;
      }
      var _loc2_ = lib.info.TextColor["RAREGRADE" + _loc1_[3]];
      container_mc.nameFd.textColor = _loc2_;
      container_mc.slotMc.draw(_loc1_[1]);
      container_mc.slotMc.grade = _loc1_[3];
      container_mc.descFd.text = _loc1_[2];
   }
};
myListener.OnGame_ProductionProgress_UpdateSuccess = function(percent)
{
   var _loc1_ = Math.min(100,Number(percent));
   container_mc.gageBar.faMc._visible = false;
   if(_loc1_ >= 100)
   {
      container_mc.gageBar.Bar_Mask._xscale = 100;
      resultMessage(true);
   }
   else
   {
      gs.TweenLite.killTweensOf(container_mc.gageBar.Bar_Mask,false);
      gs.TweenLite.to(container_mc.gageBar.Bar_Mask,SPEED,{_xscale:_loc1_});
   }
};
myListener.OnGame_ProductionProgress_UpdateFailure = function(percent)
{
   var _loc1_ = Math.min(100,Number(percent));
   if(_loc1_ >= 100)
   {
      gs.TweenLite.killTweensOf(container_mc.gageBar.Bar_Mask,false);
      gs.TweenLite.to(container_mc.gageBar.Bar_Mask,SPEED,{_xscale:0});
      resultMessage(false);
   }
};
container_mc.gageBar.Bar_Mask._xscale = 0;
container_mc.gageBar.faMc._visible = false;
container_mc.slotMc.SLOT.enabled = false;
