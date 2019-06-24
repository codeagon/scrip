function ToGame_Teleport_Init()
{
   fscommand("ToGame_Teleport_Init");
}
function ToGame_Teleport_CloseUI()
{
   fscommand("ToGame_Teleport_CloseUI");
}
function ToGame_Teleport_RequestLogList(index)
{
   getURL("FSCommand:ToGame_Teleport_RequestLogList",index);
}
function ToGame_Teleport_RequestAdd()
{
   fscommand("ToGame_Teleport_RequestAdd");
}
function ToGame_Teleport_RequestRemove(index)
{
   getURL("FSCommand:ToGame_Teleport_RequestRemove",index);
}
function ToGame_Teleport_RequestDbclickList(index)
{
   getURL("FSCommand:ToGame_Teleport_RequestDbclickList",index);
}
function test_dbclick_interval_func(index)
{
   container_mc.onEnterFrame = null;
   container_mc.onEnterFrame = function()
   {
      container_mc.test_dbclicktime_count = container_mc.test_dbclicktime_count + 1;
      if(container_mc.test_dbclicktime_count > 30)
      {
         lib.Debuger.trace("click error!!");
         container_mc.onEnterFrame = null;
         container_mc.test_dbclicktime_count = 0;
         container_mc.test_btn_dbnumber = 0;
      }
      else if(container_mc.test_btn_dbnumber == 2)
      {
         if(container_mc.test_dbclicktime_count < container_mc.test_dbclicktime_maxcount)
         {
            lib.Debuger.trace("db click!!");
            container_mc.onEnterFrame = null;
            container_mc.test_dbclicktime_count = 0;
            container_mc.test_btn_dbnumber = 0;
            ToGame_Teleport_RequestDbclickList(index);
         }
      }
   };
}
var UI = this;
UI._visible = false;
var UIname = "Teleport";
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
bWidgetOpen = false;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
var scrollBar = container_mc.scrollbar;
var listObj = {};
scrollBar.addListener(listObj);
var list_mcY = container_mc.list_mc._y;
listObj.onScroll = function()
{
   container_mc.list_mc._y = list_mcY - arguments[0];
};
scrollBar.setWheel(container_mc.list_mc);
scrollBar.wheelDelta = 1;
scrollBar.pageSize = 0;
scrollBar.displaySize = container_mc.mask_mc._height;
scrollBar.defaultBarSizeRatio = 0.3333333333333333;
scrollBar.rowHeight = 30;
scrollBar.scroll = 0;
var lineContainer = container_mc.list_mc;
var lineName = "line";
var list = new lib.util.List(lineContainer,lineName,0);
var clickStat = null;
var clickId = null;
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
container_mc.test_btn_dbcheck = null;
container_mc.test_btn_dbnumber = 0;
container_mc.test_dbclicktime_maxcount = 10;
container_mc.test_dbclicktime_count = 0;
container_mc.test_dbclick_interval;
myListener.OnGame_Teleport_SetLogList = function(listData)
{
   list.clear();
   clickStat = clickId = null;
   var _loc5_ = listData.split("\n");
   if(_loc5_[_loc5_.length - 1] == "0" || _loc5_[_loc5_.length - 1] == "undefined" || _loc5_[_loc5_.length - 1] == "")
   {
      _loc5_.pop();
   }
   if(_loc5_[0] != undefined && _loc5_[0] != "")
   {
      container_mc.defaultStr._visible = false;
   }
   else
   {
      container_mc.defaultStr._visible = true;
   }
   var _loc4_ = 0;
   while(_loc4_ < _loc5_.length)
   {
      var _loc3_ = _loc5_[_loc4_].split("\t");
      if(_loc3_.length != 1)
      {
         lineName = "line";
         var _loc2_ = list.add(_loc3_[0],lineName);
         _loc2_.stat = _loc4_;
         _loc2_.id = _loc3_[0];
         _loc2_.txt0.setText(_loc3_[1]);
         _loc2_.txt1.setText(_loc3_[2]);
         var _loc6_ = new lib.util.TxtBtn(_loc2_.btn.btn,_loc2_.btn.txt);
         _loc2_.btn.btn.onRelease2 = function()
         {
            if(clickStat != this._parent._parent.stat)
            {
               list.getItem(clickId).effect_mc.gotoAndStop("out");
               this._parent._parent.effect_mc.gotoAndStop("active");
               clickStat = this._parent._parent.stat;
               clickId = this._parent._parent.id;
            }
            ToGame_Teleport_RequestDbclickList(this._parent._parent.id);
         };
         _loc2_.btn.btn.onRollOver2 = function()
         {
            if(clickStat != this._parent._parent.stat)
            {
               this._parent._parent.effect_mc.gotoAndStop("over");
            }
         };
         _loc2_.btn.btn.onRollOut2 = _loc2_.btn.btn.onReleaseOutside2 = function()
         {
            if(clickStat != this._parent._parent.stat)
            {
               this._parent._parent.effect_mc.gotoAndStop("out");
            }
         };
         _loc2_.hit_mc.onRollOver = function()
         {
            if(clickStat != this._parent.stat)
            {
               this._parent.effect_mc.gotoAndStop("over");
            }
         };
         _loc2_.hit_mc.onRollOut = _loc2_.hit_mc.onReleaseOutside = function()
         {
            if(clickStat != this._parent.stat)
            {
               this._parent.effect_mc.gotoAndStop("out");
            }
         };
         _loc2_.hit_mc.onRelease = function()
         {
            if(clickStat != this._parent.stat)
            {
               lib.Debuger.trace("!!");
               list.getItem(clickId).effect_mc.gotoAndStop("out");
               this._parent.effect_mc.gotoAndStop("active");
               clickStat = this._parent.stat;
               clickId = this._parent.id;
            }
            if(clickStat == this._parent.stat)
            {
               lib.Debuger.trace("check");
               if(container_mc.test_btn_dbcheck != this._parent.id)
               {
                  container_mc.test_dbclicktime_count = 0;
                  container_mc.test_btn_dbnumber = 0;
               }
               if(container_mc.test_btn_dbnumber == 2)
               {
                  container_mc.test_btn_dbnumber = 0;
               }
               container_mc.test_btn_dbcheck = this._parent.id;
               container_mc.test_btn_dbnumber = container_mc.test_btn_dbnumber + 1;
               test_dbclick_interval_func(this._parent.id);
            }
         };
      }
      _loc4_ = _loc4_ + 1;
   }
   scrollBar.pageSize = container_mc.list_mc._height;
};
myListener.OnGame_Teleport_UpdateLogList = function(listData)
{
};
myListener.OnGame_Teleport_AddLogList = function(listData)
{
};
myListener.OnGame_Teleport_RemoveLogList = function(id)
{
};
myListener.OnGame_Teleport_ClearLogList = function()
{
   list.clear();
};
container_mc.sortBtn.onSelected = function(index)
{
   ToGame_Teleport_RequestLogList(index);
};
ToGame_Teleport_Init();
var x_btn = new lib.util.TxtBtn(container_mc.x_mc);
var btn0 = container_mc.txtBtn0.txtBtn;
var btn1 = container_mc.txtBtn1.txtBtn;
x_btn.setRelease(ToGame_Teleport_CloseUI);
btn0.setRelease(ToGame_Teleport_RequestAdd);
btn1.setRelease(function()
{
   ToGame_Teleport_RequestRemove(clickId);
}
);
