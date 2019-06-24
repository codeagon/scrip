function SetPosition(target)
{
   var _loc2_ = container_Width - 160;
   var _loc3_ = container_Width / 2;
   if(_loc2_ < target._x)
   {
      target.btn._x = -150;
   }
   if(_loc3_ > target._x && target._x > 150)
   {
      target.btn._x = -150;
   }
}
var UI = this;
UI._visible = false;
var UIname = "BFResurrectionMap";
bWidgetOpen = false;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
myListener.OnGameEventShowWindow = function(widgetName, bShow)
{
   if(widgetName.toLowerCase() == UIname.toLowerCase())
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
var PositionInit = false;
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
var container_Width = 0;
var container_Height = 0;
container_mc._visible = false;
myListener.OnGame_BFResurrectionMap_Init = function(bgImg)
{
   container_mc._visible = false;
   lib.util.DrawBitmap.draw(container_mc.bgMc,bgImg);
   container_mc.bgMc._width = container_mc.bgMc._width * 0.7;
   container_mc.bgMc._height = container_mc.bgMc._height * 0.7;
   container_Width = container_mc.bgMc._width + 14;
   container_Height = container_mc.bgMc._height - 106;
   container_mc.maskMc._width = container_Width;
   container_mc.maskMc._height = container_Height - 73;
   container_mc.BG._width = hit._width = container_Width;
   container_mc.BG._height = hit._height = container_Height;
   container_mc.tipMc._y = container_Height - 50;
   container_mc.tipMc.txt._width = container_Width - 10;
   var _count = 0;
   if(!PositionInit)
   {
      PositionInit = true;
      container_mc.bgMc.onEnterFrame = function()
      {
         _count++;
         if(_count > 2)
         {
            _count = 0;
            delete container_mc.bgMc.onEnterFrame;
            container_mc._x = hit._x = (- container_Width) / 2;
            container_mc._y = hit._y = (- container_Height) / 2;
            container_mc._visible = true;
         }
      };
   }
   else
   {
      container_mc._visible = true;
   }
};
myListener.OnGame_BFResurrectionMap_AddImage = function(dataList)
{
   var _loc6_ = dataList.split("\n");
   var _loc7_ = _loc6_.length;
   var _loc3_ = 0;
   while(_loc3_ < _loc7_)
   {
      var _loc4_ = _loc6_[_loc3_].split("\t");
      var _loc2_ = container_mc.pointBox.attachMovie("pointMc","pointMc" + _loc3_,_loc3_);
      var _loc5_ = _loc4_[3];
      _loc2_._x = Number(_loc4_[1]) * 0.7;
      _loc2_._y = Number(_loc4_[2]) * 0.7;
      if(_loc5_ == "1")
      {
         _loc2_.gotoAndStop(2);
         _loc2_.btn.idx = _loc4_[0];
         _loc2_.btn.onRollOver = function()
         {
            this.gotoAndStop(2);
         };
         _loc2_.btn.onRollOut = function()
         {
            this.gotoAndStop(1);
         };
         _loc2_.btn.onPress = function()
         {
            this.gotoAndStop(3);
         };
         _loc2_.btn.onRelease = _loc2_.btn.onReleaseOutside = function()
         {
            this.gotoAndStop(1);
            myListener.ToGame_BFResurrectionMap_CheckPoint(this.idx);
         };
         _loc2_.onEnterFrame = function()
         {
            SetPosition(this);
            delete this.onEnterFrame;
         };
      }
      _loc3_ = _loc3_ + 1;
   }
};
myListener.ToGame_BFResurrectionMap_CheckPoint = function(id)
{
   getURL("FSCommand:ToGame_BFResurrectionMap_CheckPoint",id);
};
fscommand("ToGame_BFResurrectionMap_init");
