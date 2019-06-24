function ToGameSendBattleFieldListForGuildResult()
{
   if(clickStat != undefined && clickStat != "")
   {
      getURL("FSCommand:ToGameSendBattleFieldListForGuildResult",clickStat);
      lib.Debuger.trace("ToGameSendBattleFieldListForGuildResult  " + clickStat);
   }
}
function ToGame_BFListForGuildWnd_CloseUI()
{
   fscommand("ToGame_BFListForGuildWnd_CloseUI");
   lib.Debuger.trace("ToGame_BFListForGuildWnd_CloseUI");
}
function clearList()
{
   join_btn.setEnabled(false);
   clickStat = undefined;
   for(var _loc1_ in container_mc.content_mc)
   {
      if(typeof container_mc.content_mc[_loc1_] == "movieclip")
      {
         container_mc.content_mc[_loc1_].removeMovieClip();
      }
   }
   container_mc.scrollbar.pageSize = 0;
}
var UI = this;
UI._visible = false;
var UIname = "BFListForGuildWnd";
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
container_mc.title_txt.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
var clickStat;
var lineH;
var cotentsY = container_mc.content_mc._y;
myListener.OnGameEventShowWindow = function(WindowName, bShow)
{
   if(WindowName.toLowerCase() == UIname.toLowerCase())
   {
      bWindowOpen = bShow;
      if(_global.gbUIMode && bWindowOpen)
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
   if(_global.gbUIMode && bWindowOpen)
   {
      UI._visible = true;
   }
   else
   {
      UI._visible = false;
   }
};
myListener.OnGameEventSetBattleFieldListForGuild = function(memberList)
{
   clearList();
   var _loc6_ = memberList.split("\n");
   var _loc4_ = 0;
   while(_loc4_ < _loc6_.length)
   {
      var _loc3_ = _loc6_[_loc4_].split("\t");
      if(_loc3_.length != 1)
      {
         var _loc2_ = container_mc.content_mc.attachMovie("line","Menu_Btn" + _loc4_,container_mc.content_mc.getNextHighestDepth());
         if(lineH == undefined)
         {
            lineH = container_mc.scrollbar.rowHeight = _loc2_._height;
         }
         _loc2_._y = cotentsY + lineH * _loc4_;
         _loc2_.stat = _loc4_;
         _loc2_.id = _loc3_[0];
         _loc2_.id0_txt.text = _loc3_[1];
         _loc2_.id1_txt.text = _loc3_[2];
         var _loc5_ = _loc3_[3].split("/");
         _loc2_.usercolor = Number(_loc5_[0]) < Number(_loc5_[1])?lib.info.TextColor.FILL_SHORT:lib.info.TextColor.FILL_FULL;
         _loc2_.id2_txt.textColor = _loc2_.usercolor;
         _loc2_.id2_txt.text = _loc3_[3];
         _loc2_.id3_txt.text = _loc3_[4];
         if(Number(_loc3_[5]) == 1)
         {
            _loc2_.id3_txt.textColor = lib.info.TextColor.GENERAL_CRITICAL;
         }
         else
         {
            _loc2_.id3_txt.textColor = lib.info.TextColor.GENERAL_EQUIPPED;
         }
         _loc2_.onRollOver = function()
         {
            if(this.stat != clickStat)
            {
               this.effect_mc.gotoAndPlay("over");
               this.id0_txt.textColor = lib.info.TextColor.LIST_OVER;
               this.id1_txt.textColor = lib.info.TextColor.LIST_OVER;
            }
         };
         _loc2_.onRollOut = _loc2_.onReleaseOutside = function()
         {
            if(this.stat != clickStat)
            {
               this.effect_mc.gotoAndPlay("out");
               this.id0_txt.textColor = lib.info.TextColor.LIST_NORMAL;
               this.id1_txt.textColor = lib.info.TextColor.LIST_NORMAL;
            }
         };
         _loc2_.onPress = function()
         {
            if(this.stat != clickStat)
            {
               this.id0_txt.textColor = lib.info.TextColor.LIST_PRESS;
               this.id1_txt.textColor = lib.info.TextColor.LIST_PRESS;
            }
         };
         _loc2_.onRelease = function()
         {
            if(this.stat != clickStat)
            {
               container_mc.content_mc["Menu_Btn" + clickStat].effect_mc.gotoAndPlay("out");
               container_mc.content_mc["Menu_Btn" + clickStat].id0_txt.textColor = lib.info.TextColor.LIST_NORMAL;
               container_mc.content_mc["Menu_Btn" + clickStat].id1_txt.textColor = lib.info.TextColor.LIST_NORMAL;
               container_mc.content_mc["Menu_Btn" + clickStat].id2_txt.textColor = container_mc.content_mc["Menu_Btn" + clickStat].usercolor;
               clickStat = this.id;
               this.effect_mc.gotoAndStop("active");
               this.id0_txt.textColor = lib.info.TextColor.LIST_ACTIVE;
               this.id1_txt.textColor = lib.info.TextColor.LIST_ACTIVE;
               if(this.usercolor != lib.info.TextColor.FILL_FULL)
               {
                  this.id2_txt.textColor = lib.info.TextColor.LIST_ACTIVE;
               }
               join_btn.setEnabled(true);
            }
         };
      }
      _loc4_ = _loc4_ + 1;
   }
   container_mc.scrollbar.pageSize = container_mc.content_mc._height;
};
var join_btn = new lib.util.TxtAniBtn(container_mc.join_mc,container_mc.join_txt);
var close_btn = new lib.util.TxtAniBtn(container_mc.close_mc,container_mc.close_txt);
var x_btn = new lib.util.TxtBtn(container_mc.x_mc);
join_btn.setRelease(ToGameSendBattleFieldListForGuildResult);
close_btn.setRelease(ToGame_BFListForGuildWnd_CloseUI);
x_btn.setRelease(ToGame_BFListForGuildWnd_CloseUI);
join_btn.setEnabled(false);
container_mc.scrollbar.pageSize = 0;
container_mc.scrollbar.displaySize = container_mc.mask_mc._height;
container_mc.scrollbar.rowHeight = 0;
container_mc.content_mc.onScroll = function()
{
   this._y = - arguments[0];
};
container_mc.scrollbar.setWheel(container_mc.content_mc);
container_mc.scrollbar.addListener(container_mc.content_mc);
fscommand("ToGame_BFListForGuildWnd_Init");
