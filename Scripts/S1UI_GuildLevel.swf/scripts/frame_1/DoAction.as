function ToGame_GuildLevel_ChangeLevel(guildLevel, levelState)
{
   lib.Debuger.trace("ToGame_GuildLevel_ChangeLevel  :" + guildLevel + "\t" + levelState);
   getURL("FSCommand:ToGame_GuildLevel_ChangeLevel",guildLevel + "\t" + levelState);
}
function ToGame_GuildLevel_Init()
{
   lib.Debuger.trace("ToGame_GuildLevel_Init  ");
   fscommand("ToGame_GuildLevel_Init");
}
function ToGame_GuildLevel_CloseUI()
{
   lib.Debuger.trace("ToGame_GuildLevel_CloseUI  ");
   fscommand("ToGame_GuildLevel_CloseUI");
}
var UI = this;
var UIname = "GuildLevel";
var bWidgetOpen = false;
UI._visible = false;
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
container_mc.text_name.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
container_mc.explain_0.textColor = lib.info.TextColor.GENERAL_EXPLAIN_DETAIL;
container_mc.explain_1.textColor = lib.info.TextColor.GENERAL_EXPLAIN_DETAIL;
container_mc.explain_2.textColor = lib.info.TextColor.GENERAL_EXPLAIN_DETAIL;
container_mc.explain_3.textColor = lib.info.TextColor.GENERAL_EXPLAIN_DETAIL;
container_mc.explain_4.textColor = lib.info.TextColor.GENERAL_EXPLAIN_DETAIL;
container_mc.guildName.textColor = lib.info.TextColor.GENERAL_CONTENTS;
container_mc.guildMaster.textColor = lib.info.TextColor.GENERAL_CONTENTS;
container_mc.guildLevel.textColor = lib.info.TextColor.GENERAL_EMPHASIS;
container_mc.remainTerm.textColor = lib.info.TextColor.GENERAL_EMPHASIS;
container_mc.medals.textColor = lib.info.TextColor.GENERAL_EMPHASIS;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
var LINECOUNT = 15;
var listIns = new lib.controls.S_ListGrid(container_mc.contents_mc,LINECOUNT,container_mc.scrollbar);
listIns.onRelease = function()
{
   var _loc1_ = listIns.__get__selected();
   execBtn.setEnabled(_loc1_);
   delBtn.setEnabled(_loc1_);
   renameBtn.setEnabled(_loc1_);
};
var myGuildLevel;
var myMedals;
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
myListener.OnGame_GuildLevel_SetInfo = function(guildName, guildLevel, remainTerm, medals, guildimg, guildmaster)
{
   myGuildLevel = Number(guildLevel);
   myMedals = Number(medals);
   container_mc.guildName.text = guildName;
   container_mc.guildLevel.text = guildLevel;
   container_mc.remainTerm.text = remainTerm;
   container_mc.medals.htmlText = lib.util.CurrencyFormat.makeComma(String(medals)) + " <img src=\'medalImg\' vspace=\'-1\'>";
   lib.util.DrawBitmap.draw(container_mc.guildimgmc,guildimg,64,64);
   container_mc.guildMaster.text = guildmaster;
};
myListener.OnGame_GuildLevel_SetLevelList = function(_data)
{
   listIns.clear();
   var _loc10_ = lib.util.ExtString.split(_data,"\n");
   var _loc5_ = 0;
   while(_loc5_ < _loc10_.length)
   {
      var _loc6_ = lib.util.ExtString.split(_loc10_[_loc5_],"\t");
      var _loc3_ = Number(_loc6_[0]);
      var _loc9_ = myGuildLevel <= _loc3_?Number(_loc6_[1]):"-";
      var _loc7_ = Number(_loc6_[2]);
      var _loc8_ = !_loc7_?"$124009":"$124008";
      var _loc2_ = listIns.add({txt_0:_loc3_,txt_1:_loc9_});
      _loc2_.hit.enabled = false;
      if(_loc3_ == myGuildLevel)
      {
         listIns.setSelect(_loc2_.index);
      }
      _loc2_.btn._label = _loc8_;
      var _loc4_ = new lib.util.TxtBtn(_loc2_.btn.btn,_loc2_.btn.txt);
      _loc2_.btn.txt.text = _loc8_;
      _loc4_.btn.lv = _loc3_;
      _loc4_.btn.stat = _loc7_;
      _loc4_.btn.onRelease2 = function()
      {
         ToGame_GuildLevel_ChangeLevel(this.lv,this.stat);
      };
      _loc4_.setEnabled(_loc3_ >= myGuildLevel);
      if(_loc5_ == 0)
      {
         _loc4_.setVisible(false);
      }
      _loc5_ = _loc5_ + 1;
   }
};
var x_btn = new lib.util.TxtBtn(container_mc.x_mc);
close_btn.setRelease(ToGame_GuildLevel_CloseUI);
x_btn.setRelease(ToGame_GuildLevel_CloseUI);
ToGame_GuildLevel_Init();
