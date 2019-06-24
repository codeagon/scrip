function scrHandlerScroll()
{
   container_mc.eventBoard._y = 110 - arguments[0];
}
function closeHandler()
{
   myListener.OnGame_EventSystemAlim_SetEvent(0,4);
}
function ToGame_EventSystemAlim_RewordButtonClick(id)
{
   getURL("FSCommand:ToGame_EventSystemAlim_RewordButtonClick",id);
}
function ToGame_EventSystemAlim_Init()
{
   fscommand("ToGame_EventSystemAlim_Init");
}
function ToGame_EventSystemAlim_ViewMode(type)
{
   "ToGame_EventSystemAlim_ViewMode";
   type;
}
function setDrag(mc, func)
{
   mc.onRollOver = function()
   {
      UI.stopDrag();
      this.gotoAndStop(2);
   };
   mc.onRollOut = mc.onReleaseOutside = function()
   {
      UI.stopDrag();
      this.gotoAndStop(1);
   };
   mc.onPress = function()
   {
      clickX = UI._x;
      clickY = UI._y;
      var _loc3_ = lib.info.AlignInfo.yRatioToPixel(0);
      var _loc2_ = lib.info.AlignInfo.yRatioToPixel(100);
      UI.startDrag(false,-10,_loc3_ - 15,Stage.width - 30,_loc2_ - 50);
      this.gotoAndStop(1);
   };
   mc.onRelease = function()
   {
      UI.stopDrag();
      if(UI._x > clickX + 5 || UI._x < clickX - 5 || UI._y > clickY + 5 || UI._y < clickY - 5)
      {
         lib.info.AlignInfo.savePos(UI,true);
      }
      else
      {
         func();
      }
      this.gotoAndStop(1);
   };
}
function SearchLine(id)
{
   var _loc3_ = lineArr.length;
   var _loc1_ = 0;
   while(_loc1_ < _loc3_)
   {
      var _loc2_ = lineArr[_loc1_];
      if(_loc2_.ID == id)
      {
         return _loc2_;
      }
      _loc1_ = _loc1_ + 1;
   }
   return null;
}
function setLine(mc, str0, str1, count, total, clearMode, btnTxt, btnCreate)
{
   mc.gotoAndStop(Number(clearMode) + 1);
   mc.str1.verticalAlign = "center";
   mc.str0.htmlText = str0;
   mc.str1.htmlText = str1 + "(" + count + "/" + total + ")";
   var _loc2_ = mc.str1.textHeight;
   mc.str1._height = _loc2_ + 5;
   mc.bg._height = 55 + _loc2_;
   mc.btnMc._y = (mc.bg._height - 37) / 2 + 18;
   var _loc1_ = mc.btn;
   _loc1_.setText(btnTxt);
   if(btnCreate)
   {
      _loc1_.setRelease(function()
      {
         ToGame_EventSystemAlim_RewordButtonClick(mc.ID);
      }
      );
   }
}
function SetAlign()
{
   var _loc4_ = lineArr.length;
   var _loc3_ = 2;
   var _loc1_ = 0;
   while(_loc1_ < _loc4_)
   {
      var _loc2_ = lineArr[_loc1_];
      _loc2_._y = _loc3_;
      _loc2_.idx = _loc1_;
      _loc3_ = _loc3_ + _loc2_._height;
      _loc1_ = _loc1_ + 1;
   }
   container_mc.eventBoard.btm._y = _loc3_ + 4;
   container_mc.eventBoard._y = 110;
   scrollEnable = container_mc.eventBoard._height > 500;
   if(alimMode == 1)
   {
      scr._visible = scrollEnable;
   }
   else
   {
      scr._visible = false;
   }
   scr.__set__pageSize(container_mc.eventBoard._height);
}
function folderOn()
{
   alimMode = 1;
   container_mc.gotoAndStop(2);
   container_mc.eventBoard._visible = true;
   scr._visible = scrollEnable;
   changeMode();
}
function folderOff()
{
   alimMode = 0;
   container_mc.gotoAndStop(1);
   container_mc.eventBoard._visible = false;
   scr._visible = false;
   changeMode();
}
function changeMode()
{
   if(alimMode == 0)
   {
      ToGame_EventSystemAlim_ViewMode(0);
      setDrag(container_mc.btn,folderOn);
   }
   else
   {
      container_mc2.titleTxt.text = title_txt;
      container_mc2.timeTxt.text = time_txt;
      var _loc1_ = new lib.util.TxtBtn(container_mc.folderBtn);
      _loc1_.setRelease(folderOff);
      ToGame_EventSystemAlim_ViewMode(1);
      setDrag(container_mc.btn,folderOff);
   }
}
_global.gfxExtensions = true;
var UI = this;
var UIname = "EventSystemAlim";
this.bWindowOpen = false;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
var title_txt = "";
var time_txt = "";
var alimMode = 0;
var scrollEnable = false;
container_mc._visible = false;
container_mc.eventBoard._visible = false;
var bClose = new lib.util.TxtBtn(container_mc.bClose);
bClose.setRelease(closeHandler);
var scr = container_mc.scr;
scr.wheelDelta = 1;
scr.__set__pageSize(0);
scr.__set__displaySize(500);
scr.defaultBarSizeRatio = 0.3333333333333333;
scr.__set__rowHeight(10);
scr.__set__scroll(0);
scr._visible = false;
container_mc.eventBoard.onScroll = g4.util.Delegate.create(this,scrHandlerScroll);
scr.addListener(container_mc.eventBoard);
scr.setWheel(container_mc.eventBoard);
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
myListener.OnGameEventChangeUIMode = function(bShow)
{
   if(!_global.gbUIMode)
   {
      container_mc.bg._visible = false;
   }
   else
   {
      container_mc.bg._visible = true;
   }
};
var lineArr = [];
myListener.OnGame_EventSystemAlim_SetEvent = function(bool, count)
{
   container_mc._visible = Boolean(Number(bool));
   if(count > 0)
   {
      container_mc.countMc._visible = true;
      container_mc.countMc.txt.text = count;
   }
   else
   {
      container_mc.countMc._visible = false;
   }
};
myListener.OnGame_EventSystemAlim_EventList = function(eventData)
{
   var _loc5_ = lib.util.ExtString.split(eventData,"\n");
   var _loc6_ = _loc5_.length;
   myListener.OnGame_EventSystemAlim_EventAllClear();
   var _loc3_ = 0;
   while(_loc3_ < _loc6_)
   {
      var _loc1_ = lib.util.ExtString.split(_loc5_[_loc3_],"\t");
      var _loc2_ = container_mc.eventBoard.lineBox.attachMovie("line","line" + _loc3_,container_mc.eventBoard.lineBox.getNextHighestDepth());
      _loc2_.ID = _loc1_[0];
      lineArr.push(_loc2_);
      var _loc4_ = new lib.util.TxtBtn(_loc2_.btnMc.btn,_loc2_.btnMc.txt);
      _loc4_.setTextColor("0xFFFFFF","0xFFFFFF","0xFFFFFF","0x485460");
      _loc2_.btn = _loc4_;
      setLine(_loc2_,_loc1_[1],_loc1_[2],_loc1_[3],_loc1_[4],_loc1_[5],_loc1_[6],true);
      _loc3_ = _loc3_ + 1;
   }
   SetAlign();
};
myListener.OnGame_EventSystemAlim_EventUpDate = function(id, eventData)
{
   var _loc2_ = SearchLine(id);
   if(_loc2_)
   {
      var _loc1_ = lib.util.ExtString.split(eventData,"\t");
      setLine(_loc2_,_loc1_[0],_loc1_[1],_loc1_[2],_loc1_[3],_loc1_[4],_loc1_[5],false);
   }
   SetAlign();
};
myListener.OnGame_EventSystemAlim_EventClear = function(id)
{
   var _loc1_ = SearchLine(id);
   if(_loc1_)
   {
      lineArr.splice(_loc1_.idx,1);
      _loc1_.removeMovieClip();
      SetAlign();
   }
};
myListener.OnGame_EventSystemAlim_EventAllClear = function()
{
   var _loc3_ = lineArr.length;
   var _loc1_ = 0;
   while(_loc1_ < _loc3_)
   {
      var _loc2_ = lineArr[_loc1_];
      _loc2_.removeMovieClip();
      _loc1_ = _loc1_ + 1;
   }
   lineArr = [];
};
var clickX = 0;
var clickY = 0;
changeMode();
ToGame_EventSystemAlim_Init();
