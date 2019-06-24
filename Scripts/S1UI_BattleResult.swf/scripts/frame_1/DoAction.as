function ToGame_BattleResult_Init()
{
   fscommand("ToGame_BattleResult_Init");
}
function buildList(_SetData)
{
   listReset();
   var _loc11_ = lib.util.ExtString.split(_SetData,"\n");
   var _loc12_ = _loc11_.length;
   var _loc10_ = 34;
   var _loc5_ = 0;
   while(_loc5_ < _loc12_)
   {
      var _loc6_ = lib.util.ExtString.split(_loc11_[_loc5_],"\t");
      var _loc9_ = _loc6_.length;
      var _loc3_ = 0;
      var _loc8_ = COLUMS_DEFAULT.length;
      var _loc7_ = container_mc.attachMovie("line","line_" + _loc5_,container_mc.getNextHighestDepth());
      _loc7_._y = _loc10_;
      _loc10_ = _loc10_ + 32;
      var _loc1_ = 0;
      while(_loc1_ < _loc9_)
      {
         if(_loc1_ <= _loc8_)
         {
            var _loc4_ = _loc6_[_loc1_];
            var _loc2_ = COLUMS_DEFAULT[_loc1_];
            createText(_loc7_,"Txt_" + _loc1_,_loc4_,_loc3_,0,_loc2_,24);
            _loc3_ = _loc3_ + _loc2_;
         }
         _loc1_ = _loc1_ + 1;
      }
      _loc5_ = _loc5_ + 1;
   }
}
function createText(_targetMc, _targetName, _txt, _posX, _posY, _w, _h)
{
   var _loc1_ = (TextField)_targetMc[_targetName];
   if(!_loc1_)
   {
      _loc1_ = _targetMc.createTextField(_targetName,_targetMc.getNextHighestDepth(),_posX,_posY,_w,_h);
   }
   if(_txt == undefined)
   {
      _txt = "";
   }
   _loc1_.wordWrap = false;
   _loc1_.multiline = false;
   _loc1_.selectable = false;
   _loc1_.html = true;
   _loc1_.verticalAlign = "center";
   _loc1_.setNewTextFormat(textFormat);
   _loc1_.setText(_txt);
   _loc1_._y = 5;
   return _loc1_;
}
function listReset()
{
   var _loc1_ = container_mc;
   for(var _loc2_ in _loc1_)
   {
      if(typeof _loc1_[_loc2_] == "movieclip")
      {
         _loc1_[_loc2_].removeMovieClip();
      }
   }
   scrollBar.pageSize = 0;
   scrollBar.scroll = 0;
}
var UI = this;
UI._visible = false;
container_mc._visible = false;
var UIname = "BattleResult";
this.bWindowOpen = false;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
container_mc.UIDrager.setData(UIName,UI);
var textFormat = new TextFormat("$NormalFont",16,14145495,false,false,false,null,null,"center",5,5,0,0);
var LABELS_DEFAULT = ["$471131","$471132","$471133","$471134","$471135","$471136","$471137"];
var COLUMS_DEFAULT = [146,145,145,145,145,145,146];
var ColumsEdit = [];
var menuPosX = 0;
var z = 0;
while(z < 7)
{
   var _TXT = lib.util.UIString.getUIString(LABELS_DEFAULT[z]);
   var _WID = COLUMS_DEFAULT[z];
   createText(container_mc.line,"Txt_" + z,_TXT,menuPosX,0,_WID,24);
   menuPosX = menuPosX + _WID;
   z++;
}
myListener.OnGameEventShowWindow = function(widgetName, bShow)
{
   if(widgetName.toLowerCase() == UIname.toLowerCase())
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
myListener.OnGame_BattleResult_SetList = function(_List)
{
   container_mc.onEnterFrame = function()
   {
      delete container_mc.onEnterFrame;
      container_mc._visible = true;
      buildList(_List);
      hit._height = container_mc._height;
      UI._x = lib.info.AlignInfo.zeroPointX + lib.info.AlignInfo.onePercentPixelW * 50 - UI._width / 2;
      UI._y = lib.info.AlignInfo.zeroPointY + lib.info.AlignInfo.onePercentPixelH * 20;
   };
};
ToGame_BattleResult_Init();
