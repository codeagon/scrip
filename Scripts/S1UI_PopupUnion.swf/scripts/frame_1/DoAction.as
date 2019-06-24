function ToGame_PopupUnion_Init()
{
   fscommand("ToGame_PopupUnion_Init");
}
function ToGame_PopupUnion_Close()
{
   fscommand("ToGame_PopupUnion_Close");
}
function ToGame_PopupUnion_SelectBtn(index)
{
   lib.Debuger.trace("ToGame_PopupUnion_SelectBtn    " + index);
   getURL("FSCommand:ToGame_PopupUnion_SelectBtn",index);
}
function ToGame_PopupUnion_SelectInnerBtn(index)
{
   lib.Debuger.trace("ToGame_PopupUnion_SelectInnerBtn    " + index);
   getURL("FSCommand:ToGame_PopupUnion_SelectInnerBtn",index);
}
var UI = this;
UI._visible = false;
var bWidgetOpen = false;
var UIname = "PopupUnion";
container_mc.UIDrager.setData(UIName,UI);
container_mc.titleFd.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
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
myListener.OnGame_PopupUnion_SetTitle = function(titleStr)
{
   container_mc.titleFd.text = titleStr;
};
var tBodyH = container_mc.bodyFd._height;
var tBgH = container_mc.bgMc._height;
var tbtnY = 186;
var tHitH = hit._height;
var btnY = tbtnY;
var btns;
myListener.OnGame_PopupUnion_SetBody = function(bodyStr)
{
   if(bodyStr == undefined)
   {
      bodyStr = "아래 테스트 조건을 만족하여야 합니다.<br><br>  <img src=\'number1\' vspace=\'-5\'><font color=\'#80e71c\'>테스트 제일 조건 <font color=\'#ffb033\'>10</font><img src=\'Gold_smalltoken\'><font color=\'#d7d7d7\'>5</font><img src=\'Silver_smalltoken\'><font color=\'#c87551\'>10</font><img src=\'Copper_smalltoken\'></font> <img src=\'icon_conditionCheck_ok\' vspace=\'-5\'><br>  <img src=\'number2\' vspace=\'-5\'><font color=\'#c00005\'>테스트 제2 조건</font><img src=\'icon_conditionCheck_no\' vspace=\'-5\'><br><br><img src=\'icon_notice\'>테스트 조건을 만족하지 못합니다!!!!!<br><br><br><br>테스트";
   }
   container_mc.bodyFd.htmlText = bodyStr;
   var _loc1_ = Math.max(container_mc.bodyFd.textHeight + 14,tBodyH);
   container_mc.bodyFd._height = _loc1_;
   container_mc.bgMc._height = tBgH + (_loc1_ - tBodyH);
   btnY = tbtnY + (_loc1_ - tBodyH);
   for(var _loc2_ in btns)
   {
      btns[_loc2_]._y = btnY;
   }
   hit._height = tHitH + (_loc1_ - tBodyH);
};
myListener.OnGame_PopupUnion_SetBtn = function()
{
   var _loc3_ = 0;
   while(_loc3_ < btns.length)
   {
      var _loc5_ = container_mc["btn" + _loc3_];
      _loc5_.removeMovieClip();
      _loc3_ = _loc3_ + 1;
   }
   btns = [];
   var _loc6_ = 0;
   _loc3_ = 0;
   while(arguments[_loc3_] != undefined && arguments[_loc3_] != "")
   {
      _loc5_ = container_mc.attachMovie("Comp:S_TxtBtn","btn" + _loc3_,container_mc.getNextHighestDepth());
      _loc6_ = _loc5_._width;
      var _loc4_ = _loc5_.txtBtn;
      _loc4_.btn.index = _loc3_;
      _loc4_.setText(arguments[_loc3_]);
      btns.push(_loc5_);
      _loc5_._y = btnY;
      _loc4_.btn.onRelease2 = function()
      {
         ToGame_PopupUnion_SelectBtn(this.index);
      };
      _loc3_ = _loc3_ + 1;
   }
   var _loc7_ = 238 - (_loc6_ + 2) * btns.length / 2;
   _loc3_ = 0;
   while(_loc3_ < btns.length)
   {
      _loc5_ = container_mc["btn" + _loc3_];
      _loc5_._x = _loc7_ + (_loc6_ + 2) * _loc3_;
      _loc3_ = _loc3_ + 1;
   }
};
myListener.OnGame_PopupUnion_EnableBtn = function(index, enable)
{
   enable = Number(enable);
   var _loc1_ = container_mc["btn" + index];
   _loc1_.txtBtn.setEnabled(enable);
};
myListener.OnGame_PopupUnion_SetInnerBtn = function()
{
   var _loc6_ = 0;
   while(_loc6_ < btns.length)
   {
      var _loc3_ = container_mc["innerbtn" + _loc6_];
      _loc3_.removeMovieClip();
      _loc6_ = _loc6_ + 1;
   }
   var _loc5_ = 0;
   _loc6_ = 0;
   while(arguments[_loc6_] != undefined && arguments[_loc6_] != "")
   {
      _loc3_ = container_mc.attachMovie("Comp:TxtBtn2","innerbtn" + _loc6_,container_mc.getNextHighestDepth());
      _loc3_._width = 380;
      _loc3_._x = 47;
      _loc3_.resize();
      var _loc4_ = _loc3_.txtBtn;
      _loc4_.btn.index = _loc6_;
      _loc4_.setText(arguments[_loc6_]);
      _loc3_._y = container_mc.bodyFd._y + container_mc.bodyFd._height + 10 + (_loc3_._height + 7) * _loc6_;
      _loc5_ = _loc5_ + (_loc3_._height + 7);
      _loc4_.btn.onRelease2 = function()
      {
         ToGame_PopupUnion_SelectInnerBtn(this.index);
      };
      _loc6_ = _loc6_ + 1;
   }
   if(_loc5_ == 0)
   {
      return undefined;
   }
   _loc5_ = _loc5_ + 10;
   container_mc.bgMc._height = container_mc.bgMc._height + _loc5_;
   btnY = btnY + _loc5_;
   for(var _loc6_ in btns)
   {
      btns[_loc6_]._y = btnY;
   }
   hit._height = hit._height + _loc5_;
};
myListener.OnGame_PopupUnion_EnableInnerBtn = function(index, enable)
{
   enable = Number(enable);
   var _loc1_ = container_mc["innerbtn" + index];
   _loc1_.txtBtn.setEnabled(enable);
};
var xBtn = new lib.util.TxtBtn(container_mc.x_mc);
xBtn.setRelease(ToGame_PopupUnion_Close);
ToGame_PopupUnion_Init();
