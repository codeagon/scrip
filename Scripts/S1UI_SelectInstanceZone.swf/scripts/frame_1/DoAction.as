function clearInfo()
{
   clickStat = null;
   container_mc.scrollbar.pageSize = container_mc.contents_mc.content_mc._height;
   select_btn.setEnabled(false);
}
function ToGame_SelectInstanceZone_Select(channelId)
{
   getURL("FSCommand:ToGame_SelectInstanceZone_Select",channelId);
   trace("ToGame_SelectInstanceZone_Select : " + channelId);
}
function ToGame_SelectInstanceZone_CloseUI()
{
   fscommand("ToGame_SelectInstanceZone_CloseUI");
   trace("ToGame_SelectInstanceZone_CloseUI");
}
function ToGame_SelectInstanceZone_RequestSortData(sortType)
{
   getURL("FSCommand:ToGame_SelectInstanceZone_RequestSortData",sortType);
   trace("ToGame_SelectInstanceZone_RequestSortData : " + sortType);
}
function select()
{
   ToGame_SelectInstanceZone_Select(clickStat);
}
function closeUI()
{
   ToGame_SelectInstanceZone_CloseUI();
}
var UI = this;
UI._visible = false;
bWidgetOpen = false;
container_mc.title_txt.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
var myListener = new Object();
myListener.OnGameEventShowWindow = function(widgetName, bShow)
{
   if(widgetName.toLowerCase() == "selectinstancezone")
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
var colorStates_array = new Array(lib.info.TextColor.LIST_PERSONNEL_COMFORTABLE,lib.info.TextColor.LIST_PERSONNEL_SMOOTH,lib.info.TextColor.LIST_PERSONNEL_CROWD,lib.info.TextColor.LIST_PERSONNEL_FULL);
myListener.OnGame_SelectInstanceZone_SetData = function(dataList)
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
   var _loc5_ = 0;
   while(_loc5_ < _loc6_.length)
   {
      var _loc4_ = _loc6_[_loc5_].split("\t");
      if(_loc4_.length != 1)
      {
         var _loc3_ = container_mc.contents_mc.content_mc["line" + _loc5_];
         if(_loc5_ % 2 == 0)
         {
            frame = 1;
         }
         else
         {
            frame = 2;
         }
         _loc3_.bg_mc.gotoAndStop(frame);
         _loc3_.stat = _loc4_[0];
         _loc3_.states = Number(_loc4_[1]);
         _loc3_.id1_txt.text = _loc4_[0];
         if(Number(_loc4_[1]) == 0)
         {
            _loc3_.id2_txt.text = "쾌적";
         }
         else if(Number(_loc4_[1]) == 1)
         {
            _loc3_.id2_txt.text = "원활";
         }
         else if(Number(_loc4_[1]) == 2)
         {
            _loc3_.id2_txt.text = "혼잡";
         }
         else if(Number(_loc4_[1]) == 3)
         {
            _loc3_.id2_txt.text = "FULL";
         }
         _loc3_.id1_txt.textColor = colorStates_array[Number(_loc4_[1])];
         _loc3_.id2_txt.textColor = colorStates_array[Number(_loc4_[1])];
         _loc3_.hit_mc.onRollOver = function()
         {
            if(this._parent.stat != clickStat)
            {
               this._parent.effect_mc.gotoAndPlay("over");
            }
         };
         _loc3_.hit_mc.onRollOut = _loc3_.hit.onReleaseOutside = function()
         {
            if(this._parent.stat != clickStat)
            {
               this._parent.effect_mc.gotoAndPlay("out");
            }
         };
         _loc3_.hit_mc.onPress = function()
         {
            if(this._parent.stat != clickStat)
            {
               this._parent.effect_mc.gotoAndStop("active");
            }
         };
         _loc3_.hit_mc.onRelease = function()
         {
            if(this._parent.stat != clickStat)
            {
               container_mc.contents_mc.content_mc["line" + clickStat].effect_mc.gotoAndPlay("out");
               clickStat = this._parent.stat;
               this._parent.effect_mc.gotoAndStop("active");
               if(this._parent.states != 3)
               {
                  select_btn.setEnabled(true);
               }
               else
               {
                  select_btn.setEnabled(false);
               }
            }
            else
            {
               clickStat = null;
               this._parent.effect_mc.gotoAndStop(1);
               select_btn.setEnabled(false);
            }
         };
      }
      _loc5_ = _loc5_ + 1;
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
var ii = 0;
while(ii < 10)
{
   var bb = container_mc["sort" + ii + "_btn"];
   bb.stat = ii;
   bb.onRelease = function()
   {
      ToGame_SelectInstanceZone_RequestSortData(this.stat);
   };
   ii++;
}
var select_btn = new lib.util.TxtAniBtn(container_mc.select_mc,container_mc.select_txt,20,27,33,43);
var close_btn = new lib.util.TxtAniBtn(container_mc.close_mc,container_mc.close_txt,20,27,33,43);
var x_btn = new lib.util.TxtBtn(container_mc.x_mc);
select_btn.setEnabled(false);
select_btn.setRelease(select);
close_btn.setRelease(closeUI);
x_btn.setRelease(closeUI);
fscommand("ToGame_SelectInstanceZone_Init");
test1.onPress = function()
{
   var _loc2_ = "";
   var _loc1_ = 0;
   while(_loc1_ < 20)
   {
      _loc2_ = _loc2_ + (_loc1_ + "\t" + random(4) + "\n");
      _loc1_ = _loc1_ + 1;
   }
   myListener.OnGame_SelectInstanceZone_SetData(_loc2_);
};
