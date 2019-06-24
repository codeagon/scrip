function ToGame_GuildCrest_RegisterCrest()
{
   getURL("FSCommand:ToGame_GuildCrest_Register",selected);
}
function ToGame_GuildCrest_RemoveCrest()
{
   fscommand("ToGame_GuildCrest_RemoveCrest");
}
function ToGame_GuildCrest_Init()
{
   fscommand("ToGame_GuildCrest_Init");
}
function ToGame_GuildCrest_CloseUI()
{
   fscommand("ToGame_GuildCrest_CloseUI");
}
function closeUI()
{
   ToGame_GuildCrest_CloseUI();
}
var UI = this;
UI._visible = false;
var UIname = "GuildCrest";
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
var con = this;
var bWidgetOpen = false;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
container_mc.text_name.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
container_mc.guideFd2.textColor = lib.info.TextColor.GENERAL_NOTICE;
container_mc.explain_0.textColor = lib.info.TextColor.GENERAL_EXPLAIN_DETAIL;
container_mc.explain_1.textColor = lib.info.TextColor.GENERAL_EXPLAIN_DETAIL;
container_mc.guideFd0.verticalAlign = "bottom";
container_mc.guideFd1.verticalAlign = "bottom";
container_mc.guideFd2.htmlText = lib.util.UIString.getUIString("$125007","fontColor1","8dd5e0","fontColor2","3fcbe4","fontColor3","8dd5e0","fontColor4","3fcbe4","fontColor5","8dd5e0","fontColor6","3fcbe4","fontColor7","8dd5e0");
container_mc.crestReg__0.effect = false;
container_mc.crestReg__0.drag = false;
container_mc.crestReg__0.hideBg();
var baseY = container_mc.list_mc._y;
var scrollBar = container_mc.scrollbar;
container_mc.list_mc.onScroll = function()
{
   container_mc.list_mc._y = baseY - arguments[0];
};
scrollBar.setWheel(container_mc.list_mc);
scrollBar.addListener(container_mc.list_mc);
scrollBar.wheelDelta = 1;
scrollBar.pageSize = 0;
scrollBar.displaySize = container_mc.mask_mc._height;
scrollBar.defaultBarSizeRatio = 0.3333333333333333;
scrollBar.rowHeight = 30;
scrollBar.scroll = 0;
var crestList = new lib.util.List(container_mc.list_mc,"crest__");
crestList.columnCount = 7;
crestList.xGap = 5.7;
crestList.yGap = 5.7;
var selected = null;
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
myListener.OnGame_GuildCrest_SetRegsteredCrest = function(img)
{
   container_mc.crestReg__0.draw(img);
   container_mc.crestReg__0.drag = false;
   container_mc.crestReg__0.hideBg();
};
myListener.OnGame_GuildCrest_SetCrestList = function(dataList)
{
   crestList.clear();
   selected = null;
   reg_btn.setEnabled(false);
   var _loc5_ = lib.util.ExtString.split(dataList,"\n");
   var _loc4_ = 0;
   while(_loc4_ < _loc5_.length)
   {
      var _loc3_ = _loc5_[_loc4_].split("\t");
      if(_loc3_.length != 1)
      {
         var id = _loc3_[0];
         var _loc2_ = crestList.add(id,"Slot_link");
         _loc2_.draw(_loc3_[1]);
         _loc2_.drag = false;
         _loc2_.hideBg();
         _loc2_.onPress2 = function()
         {
            if(selected != this.id)
            {
               this.active = true;
               if(selected != null)
               {
                  crestList.getItem(selected).active = false;
               }
               selected = this.id;
               reg_btn.setEnabled(true);
            }
            else
            {
               this.active = false;
               selected = null;
               reg_btn.setEnabled(false);
            }
         };
      }
      _loc4_ = _loc4_ + 1;
   }
   scrollBar.pageSize = container_mc.list_mc._height;
};
var flagMode = false;
myListener.OnGame_GuildCrest_FlagMode = function(bTrue)
{
   if(Number(bTrue) == 0)
   {
      return undefined;
   }
   flagMode = true;
   container_mc.crestReg__0._xscale = container_mc.crestReg__0._yscale = 200;
   container_mc.crestReg__0._x = 183;
   container_mc.crestReg__0._y = 122;
   container_mc.text_name.text = "$125009";
   container_mc.explain_0.text = "$125010";
   container_mc.explain_1.text = "$125011";
   container_mc.guideFd2.htmlText = lib.util.UIString.getUIString("$125012","fontColor1","8dd5e0","fontColor2","3fcbe4","fontColor3","8dd5e0","fontColor4","3fcbe4","fontColor5","8dd5e0","fontColor6","3fcbe4","fontColor7","8dd5e0");
   remove_btn.setText("$125013");
   reg_btn.setText("$125014");
};
var x_btn = new lib.util.TxtBtn(container_mc.x_mc);
var remove_btn = container_mc.txtBtn1.txtBtn;
var reg_btn = container_mc.txtBtn2.txtBtn;
reg_btn.setEnabled(false);
x_btn.setRelease(closeUI);
remove_btn.setRelease(ToGame_GuildCrest_RemoveCrest);
reg_btn.setRelease(ToGame_GuildCrest_RegisterCrest);
ToGame_GuildCrest_Init();
