function clearInfo()
{
   clickStat = null;
   mcMaker.clearMovie();
   container_mc.scrollbar.pageSize = container_mc.contents_mc.content_mc._height;
   select_btn.setEnabled(false);
}
function ToGame_ChannelSelect_Select(channelId)
{
   getURL("FSCommand:ToGame_ChannelSelect_Select",channelId);
   trace("ToGame_ChannelSelect_Select : " + channelId);
}
function ToGame_ChannelSelect_CloseUI()
{
   fscommand("ToGame_ChannelSelect_CloseUI");
   trace("ToGame_ChannelSelect_CloseUI");
}
function select()
{
   ToGame_ChannelSelect_Select(clickStat);
}
function closeUI()
{
   ToGame_ChannelSelect_CloseUI();
}
var UI = this;
UI._visible = false;
bWidgetOpen = false;
container_mc.title_txt.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
container_mc.id2_txt.textColor = container_mc.id1_txt.textColor = lib.info.TextColor.GENERAL_NORMAL;
var myListener = new Object();
myListener.OnGameEventShowWindow = function(widgetName, bShow)
{
   if(widgetName.toLowerCase() == "channelselect")
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
var clickStat = null;
var mcMaker = new lib.util.McMaker();
myListener.OnGame_ChannelSelect_SetData = function(dataList)
{
   clearInfo();
   var _loc6_ = dataList.split("\n");
   if(_loc6_[_loc6_.length - 1] == "0" || _loc6_[_loc6_.length - 1] == "undefined" || _loc6_[_loc6_.length - 1] == "")
   {
      _loc6_.splice(_loc6_.length - 1,1);
   }
   if(_loc6_[0] != "0" && _loc6_[0] != "undefined" && _loc6_[0] != undefined)
   {
      mcMaker.createMovie("line",container_mc.contents_mc.content_mc,"line",0,0,1,_loc6_.length,0,0,0);
   }
   var _loc4_ = 0;
   while(_loc4_ < _loc6_.length)
   {
      var _loc5_ = _loc6_[_loc4_].split("\t");
      if(_loc5_.length != 1)
      {
         var _loc3_ = container_mc.contents_mc.content_mc["line" + _loc4_];
         _loc3_.stat = _loc4_;
         _loc3_.id = _loc5_[0];
         _loc3_.id2_txt.textColor = _loc3_.id1_txt.textColor = lib.info.TextColor.LIST_NORMAL;
         _loc3_.id1_txt.text = _loc5_[1];
         _loc3_.onRollOver = function()
         {
            this.id2_txt.textColor = this.id1_txt.textColor = lib.info.TextColor.LIST_OVER;
            if(this.stat != clickStat)
            {
               this.effect_mc.gotoAndPlay("over");
            }
         };
         _loc3_.onRollOut = _loc3_.onReleaseOutside = function()
         {
            this.id2_txt.textColor = this.id1_txt.textColor = lib.info.TextColor.LIST_NORMAL;
            if(this.stat != clickStat)
            {
               this.effect_mc.gotoAndPlay("out");
            }
         };
         _loc3_.onPress = function()
         {
            this.id2_txt.textColor = this.id1_txt.textColor = lib.info.TextColor.LIST_PRESS;
            if(this.stat != clickStat)
            {
               this.effect_mc.gotoAndStop("active");
            }
         };
         _loc3_.onRelease = function()
         {
            if(this.stat != clickStat)
            {
               this.id2_txt.textColor = this.id1_txt.textColor = lib.info.TextColor.LIST_ACTIVE;
               container_mc.contents_mc.content_mc["line" + clickStat].effect_mc.gotoAndStop(1);
               clickStat = this.id;
               this.effect_mc.gotoAndStop("active");
               select_btn.setEnabled(true);
            }
            else
            {
               this.id2_txt.textColor = this.id1_txt.textColor = lib.info.TextColor.LIST_NORMAL;
               clickStat = null;
               this.effect_mc.gotoAndStop(1);
               select_btn.setEnabled(false);
            }
         };
      }
      _loc4_ = _loc4_ + 1;
   }
   container_mc.scrollbar.pageSize = container_mc.contents_mc.content_mc._height;
   container_mc.scrollbar.displaySize = 560;
   container_mc.scrollbar.rowHeight = 30.3;
   container_mc.contents_mc.content_mc.onScroll = function(a, b, c)
   {
      this._y = - arguments[0];
   };
   container_mc.scrollbar.setWheel(container_mc.contents_mc);
   container_mc.scrollbar.addListener(container_mc.contents_mc.content_mc);
};
_global.EventBroadCaster.addListener(myListener);
var select_btn = new lib.util.TxtAniBtn(container_mc.select_mc,container_mc.select_txt,20,27,33,43);
var close_btn = new lib.util.TxtAniBtn(container_mc.close_mc,container_mc.close_txt,20,27,33,43);
var x_btn = new lib.util.TxtBtn(container_mc.x_mc);
select_btn.setEnabled(false);
select_btn.setRelease(select);
close_btn.setRelease(closeUI);
x_btn.setRelease(closeUI);
fscommand("ToGame_ChannelSelect_Init");
test1.onPress = function()
{
   var _loc2_ = "";
   var _loc1_ = 0;
   while(_loc1_ < 28)
   {
      _loc2_ = _loc2_ + (_loc1_ + "\t" + "전장은 좋아효" + _loc1_ + "\n");
      _loc1_ = _loc1_ + 1;
   }
   myListener.OnGame_ChannelSelect_SetData(_loc2_);
};
