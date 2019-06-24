function ToGame_VideoList_Init()
{
   fscommand("ToGame_VideoList_Init");
   lib.Debuger.trace("ToGame_VideoList_Init");
}
function ToGame_VideoList_Close()
{
   fscommand("ToGame_VideoList_Close");
   lib.Debuger.trace("ToGame_VideoList_Close");
}
function ToGame_VideoList_VideoOn(id)
{
   getURL("FSCommand:ToGame_VideoList_VideoOn",id);
   lib.Debuger.trace("ToGame_VideoList_VideoOn  " + id);
}
function clearList()
{
   playBtn.setEnabled(false);
   selectVideoId = undefined;
   for(var _loc1_ in container_mc.logLines_mc)
   {
      if(typeof container_mc.logLines_mc[_loc1_] == "movieclip")
      {
         container_mc.logLines_mc[_loc1_].removeMovieClip();
      }
   }
   container_mc.scrollBar.scroll = 0;
}
function buildList(data_array)
{
   clearList();
   container = container_mc.logLines_mc;
   var _loc13_ = undefined;
   var _loc6_ = undefined;
   var _loc9_ = 0;
   var _loc3_ = 0;
   while(_loc3_ < data_array.length)
   {
      var _loc7_ = data_array[_loc3_].group;
      var id = data_array[_loc3_].id;
      var _loc11_ = data_array[_loc3_].videoName;
      var _loc12_ = data_array[_loc3_].videoState;
      var _loc8_ = data_array[_loc3_].videoImg;
      if(_loc13_ != _loc7_)
      {
         var _loc4_ = container._height - 35;
         if(_loc6_ != undefined)
         {
            var _loc10_ = container.attachMovie("line","line" + id,container.getNextHighestDepth());
            _loc10_._width = 973;
            _loc10_._y = _loc4_;
            _loc4_ = _loc4_ + 28;
         }
         else
         {
            _loc4_ = container._height;
         }
         _loc13_ = _loc7_;
         _loc6_ = container.attachMovie("pline","pvideoLine" + id,container.getNextHighestDepth());
         _loc6_._y = _loc4_;
         _loc6_.txt.setText(_loc7_);
         _loc9_ = 0;
      }
      var _loc2_ = container.attachMovie("box","videoBox" + id,container.getNextHighestDepth());
      _loc2_.id = id;
      _loc2_._y = _loc6_._y + 51 + int(_loc9_ / 3) * 260;
      _loc2_._x = 26 + _loc9_ % 3 * 330;
      _loc2_.txt.setText(_loc11_);
      _loc9_ = _loc9_ + 1;
      _loc2_.onRollOver = function()
      {
         this.gotoAndStop(2);
      };
      if(_loc12_ == 0)
      {
         _loc2_.txt.textColor = lib.info.TextColor.GENERAL_DISABLE;
         _loc2_.gotoAndStop(4);
         lib.util.DrawBitmap.draw(_loc2_.imgMc,"img://__Thumbnail_Video.Disable");
         _loc2_.enabled = false;
      }
      else if(_loc8_ == undefined || _loc8_ == "")
      {
         var _loc14_ = lib.util.DrawBitmap.draw(_loc2_.imgMc,"img://__Thumbnail_Video.Default");
      }
      else
      {
         lib.util.DrawBitmap.draw(_loc2_.imgMc,_loc8_);
      }
      _loc2_.onRollOut = _loc2_.onReleaseOutside = function()
      {
         this.gotoAndStop(1);
      };
      _loc2_.onPress = function()
      {
         this.gotoAndStop(3);
      };
      _loc2_.onRelease = function()
      {
         ToGame_VideoList_VideoOn(this.id);
         this.gotoAndStop(2);
      };
      _loc2_.onReleaseOutside = function()
      {
         this.gotoAndStop(1);
      };
      _loc3_ = _loc3_ + 1;
   }
   container_mc.scrollBar.pageSize = container._height - 35;
}
function closeUI()
{
   ToGame_VideoList_Close();
}
var UI = this;
UI._visible = false;
var UIname = "VideoList";
bWidgetOpen = false;
container_mc.texts_name.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
myListener.OnGameEventShowWindow = function(WindowName, bShow)
{
   if(WindowName.toLowerCase() == UIname.toLowerCase())
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
var videoDatas = [];
myListener.OnGame_VideoList_setData = function(listData)
{
   var _loc5_ = lib.util.ExtString.split(listData,"\n");
   var _loc6_ = undefined;
   var _loc4_ = 0;
   var _loc3_ = 0;
   while(_loc3_ < _loc5_.length)
   {
      var _loc2_ = lib.util.ExtString.split(_loc5_[_loc3_],"\t");
      if(_loc2_.length != 1)
      {
         var _loc1_ = {};
         _loc1_.group = _loc2_[0];
         _loc1_.id = _loc2_[1];
         _loc1_.videoName = _loc2_[2];
         _loc1_.videoState = _loc2_[3];
         _loc1_.videoImg = _loc2_[4];
         if(_loc6_ != _loc1_.group)
         {
            _loc6_ = _loc1_.group;
            if(_loc4_ == 0 || _loc4_ > 3)
            {
               videoDatas[videoDatas.length] = [];
               _loc4_ = 0;
            }
            _loc4_ = _loc4_ + 1;
         }
         videoDatas[videoDatas.length - 1].push(_loc1_);
      }
      _loc3_ = _loc3_ + 1;
   }
   container_mc.numberSteper.setPage(1,videoDatas.length,1);
   buildList(videoDatas[0]);
};
var x_btn = new lib.util.TxtBtn(container_mc.x_btn);
var playBtn = container_mc.txtBtn0.txtBtn;
container_mc.numberSteper.onChanged = function(page)
{
   buildList(videoDatas[page - 1]);
   container_mc.numberSteper.setPage(page,videoDatas.length,1);
};
playBtn.setRelease(ToGame_VideoList_VideoOn);
x_btn.setRelease(closeUI);
playBtn.setEnabled(false);
var containerY = container_mc.logLines_mc._y;
container_mc.scrollBar.addListener(container_mc.logLines_mc);
container_mc.logLines_mc.onScroll = function()
{
   this._y = containerY - arguments[0];
};
container_mc.scrollBar.setWheel(container_mc.logLines_mc);
container_mc.scrollBar.rowHeight = 50;
container_mc.scrollBar.displaySize = 620.5;
container_mc.scrollBar.scroll = 0;
ToGame_VideoList_Init();
