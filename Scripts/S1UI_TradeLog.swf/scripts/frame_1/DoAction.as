function clearInformation(target)
{
   for(var _loc2_ in target)
   {
      mc = target[_loc2_];
      if(typeof mc == "movieclip" && mc != target)
      {
         removeMovieClip(mc);
      }
   }
   selectLine = undefined;
}
function ToGameTradeLogView(index)
{
   getURL("FSCommand:ToGameTradeLogView",index);
   lib.Debuger.trace("ToGameTradeLogView" + index);
}
function ToGameTradeLogBringPage(pageNum)
{
   getURL("FSCommand:ToGameTradeLogBringPage",pageNum);
   lib.Debuger.trace("ToGameTradeLogBringPage:" + pageNum);
}
function ToGame_TradeLog_Init()
{
   fscommand("ToGame_TradeLog_Init");
   lib.Debuger.trace("ToGame_TradeLog_Init");
}
function ToGame_TradeLogWindow_Close()
{
   fscommand("ToGame_TradeLog_Close");
   lib.Debuger.trace("ToGame_TradeLog_Close");
}
function closeUI()
{
   ToGame_TradeLogWindow_Close();
}
var UI = this;
UI._visible = false;
var UIname = "TradeLog";
bWidgetOpen = false;
var con = this;
var page = 0;
var max = 0;
var slotName = "logLine";
var lightColor = 11645095;
var darkColor = 7368550;
var selectLine;
container_mc.text_name.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
container_mc.defaultStr.textColor = lib.info.TextColor.GENERAL_DISABLE;
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
container_mc.scaleExpander.scaleExpanderEventCheck(UI,UIname);
container_mc.defaultStr.setText(lib.util.UIString.getUIString("$111039"));
var alphaOutAmount = 20;
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
myListener.OnGameEventTradeLogSetData = function(maxPages, currentPage, currentPageDataList)
{
   container = container_mc.logLines_mc;
   clearInformation(container);
   container_mc.numberSteper.setPage(Number(currentPage),Number(maxPages));
   var _loc6_ = currentPageDataList.split("\n");
   if(_loc6_[_loc6_.length - 1] == "0" || _loc6_[_loc6_.length - 1] == "undefined" || _loc6_[_loc6_.length - 1] == undefined || _loc6_[_loc6_.length - 1] == "")
   {
      _loc6_.pop();
   }
   if(_loc6_[0] != undefined && _loc6_[0] != "")
   {
      container_mc.defaultStr._visible = false;
   }
   else
   {
      container_mc.defaultStr._visible = true;
   }
   var _loc3_ = 0;
   while(_loc3_ < _loc6_.length)
   {
      var _loc4_ = _loc6_[_loc3_].split("\t");
      if(_loc4_.length != 1)
      {
         var _loc9_ = _loc4_[0];
         var _loc7_ = _loc4_[1];
         var _loc8_ = _loc4_[2];
         var _loc5_ = container[slotName + "__" + _loc3_];
         var _loc2_ = slotName + "__" + _loc3_;
         if(_loc5_ == undefined)
         {
            _loc5_ = container.attachMovie("logLine",slotName + "__" + _loc3_,container.getNextHighestDepth());
            _loc5_._y = _loc5_._height * _loc3_;
         }
         container[_loc2_].id2_txt.textColor = container[_loc2_].id1_txt.textColor = lib.info.TextColor.LIST_NORMAL;
         container[_loc2_].id = _loc9_;
         container[_loc2_].id1_txt.text = _loc7_;
         container[_loc2_].id2_txt.text = _loc8_;
         container[_loc2_].stat = _loc3_;
         container[_loc2_].hit_mc.enabled = true;
         container[_loc2_].hit_mc.onRollOver = function()
         {
            if(this._parent != selectLine)
            {
               this._parent.id2_txt.textColor = this._parent.id1_txt.textColor = lib.info.TextColor.LIST_OVER;
               this._parent.effect_mc.gotoAndStop("over");
            }
         };
         container[_loc2_].hit_mc.onRollOut = container[_loc2_].hit_mc.onReleaseOutside = function()
         {
            if(this._parent != selectLine)
            {
               this._parent.id2_txt.textColor = this._parent.id1_txt.textColor = lib.info.TextColor.LIST_NORMAL;
               this._parent.effect_mc.gotoAndStop("out");
            }
            else
            {
               this._parent.effect_mc.gotoAndStop("active");
            }
         };
         container[_loc2_].hit_mc.onPress = function()
         {
            if(this._parent != selectLine)
            {
               this._parent.id2_txt.textColor = this._parent.id1_txt.textColor = lib.info.TextColor.LIST_ACTIVE;
               this._parent.effect_mc.gotoAndStop("active");
            }
         };
         container[_loc2_].hit_mc.onRelease = function()
         {
            if(this._parent != selectLine)
            {
               selectLine.effect_mc.gotoAndStop("out");
               selectLine.id2_txt.textColor = selectLine.id1_txt.textColor = lib.info.TextColor.LIST_NORMAL;
               selectLine = this._parent;
               this._parent.id2_txt.textColor = this._parent.id1_txt.textColor = lib.info.TextColor.LIST_ACTIVE;
            }
            ToGameTradeLogView(this._parent.id);
         };
         container[_loc2_].hit_mc.onReleaseOutside = function()
         {
            if(this._parent != selectLine)
            {
               this._parent.id2_txt.textColor = this._parent.id1_txt.textColor = lib.info.TextColor.LIST_NORMAL;
               this._parent.effect_mc.gotoAndStop("out");
            }
            else
            {
               this._parent.effect_mc.gotoAndStop("active");
            }
         };
      }
      _loc3_ = _loc3_ + 1;
   }
};
var x_btn = new lib.util.TxtBtn(container_mc.x_mc);
close_btn.setRelease(closeUI);
x_btn.setRelease(closeUI);
container_mc.numberSteper.onChanged = function(page)
{
   ToGameTradeLogBringPage(page);
};
container_mc.sortBtn.onSelected = function(index)
{
};
ToGame_TradeLog_Init();
