function ToGame_DungeonSimpleResult_Init()
{
   fscommand("ToGame_DungeonSimpleResult_Init");
}
function ToGame_DungeonSimpleResult_CloseUI()
{
   fscommand("ToGame_DungeonSimpleResult_CloseUI");
}
function ToGame_DungeonSimpleResult_GuildWar()
{
   fscommand("ToGame_DungeonSimpleResult_GuildWar");
}
function listReset(_lineMc)
{
   var _loc1_ = _lineMc;
   for(var _loc2_ in _loc1_)
   {
      if(typeof _loc1_[_loc2_] == "movieclip")
      {
         _loc1_[_loc2_].removeMovieClip();
      }
   }
}
var UI = this;
UI._visible = true;
var UIname = "DungeonSimpleResult";
this.bWindowOpen = true;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
container_mc.UIDrager.setData(UIname,UI,container_mc.lock_mc);
container_mc.title_box.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
container_mc.title_box.verticalAlign = "center";
var e_btn = container_mc.list_mc.enter_btn.txtBtn;
e_btn.setRelease(ToGame_DungeonSimpleResult_CloseUI);
var g_btn = container_mc.list_mc.guildWar_btn.txtBtn;
g_btn.setRelease(ToGame_DungeonSimpleResult_GuildWar);
myListener.OnGameEventShowWindow = function(_WindowName, _bShow)
{
   if(_WindowName.toLowerCase() == UIname.toLowerCase())
   {
      bWindowOpen = _bShow;
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
myListener.OnGame_DungeonSimpleResult_SetDungonName = function(_nameType)
{
   container_mc.bg_mc.title_box.text = _nameType;
};
myListener.OnGame_DungeonSimpleResult_SetScore = function(_list)
{
   listReset(container_mc.list_mc.scoreListMc);
   var _ScoreList = lib.util.ExtString.split(_list,"\n");
   var _listL = _ScoreList.length;
   var _frameCount = 0;
   var _index = 0;
   container_mc.list_mc.scoreListMc.onEnterFrame = function()
   {
      _frameCount++;
      if(_frameCount == 10)
      {
         container_mc.list_mc.gotoAndPlay(2);
         if(container_mc.list_mc.slot_mc.effect0)
         {
            container_mc.list_mc.slot_mc.effect0.gotoAndPlay(2);
         }
         if(container_mc.list_mc.slot_mc.effect1)
         {
            container_mc.list_mc.slot_mc.effect1.gotoAndPlay(2);
         }
         if(container_mc.list_mc.slot_mc.effect2)
         {
            container_mc.list_mc.slot_mc.effect2.gotoAndPlay(2);
         }
         if(container_mc.list_mc.slot_mc.effect3)
         {
            container_mc.list_mc.slot_mc.effect3.gotoAndPlay(2);
         }
      }
      if(_frameCount % 5 == 0 && _frameCount > 14)
      {
         if(_index < _listL - 1)
         {
            var _loc2_ = lib.util.ExtString.split(_ScoreList[_index],"\t");
            var _loc1_ = container_mc.list_mc.scoreListMc.attachMovie("scoreBox","scoreBox_" + _index,container_mc.list_mc.scoreListMc.getNextHighestDepth());
            _loc1_._y = _index * 38;
            _loc1_.clearMc.txt_motion.txt0.text = _loc2_[0];
            _loc1_.clearMc.txt_motion.txt1.text = _loc2_[1];
            _loc1_.clearMc.effect_motion.txt.text = _loc2_[1];
            _index++;
         }
         else
         {
            _loc2_ = lib.util.ExtString.split(_ScoreList[_listL - 1],"\t");
            container_mc.list_mc.totalMc.txt_motion.txt0.text = _loc2_[0];
            container_mc.list_mc.totalMc.txt_motion.txt1.text = _loc2_[1];
            container_mc.list_mc.totalMc.effect_motion.txt.text = _loc2_[1];
            container_mc.list_mc.totalMc._visible = true;
            container_mc.list_mc.totalMc.gotoAndPlay(2);
            container_mc.recordEffect._visible = recordEf_Bool;
            container_mc.recordEffect.gotoAndPlay(2);
            container_mc.recordEffect.newEffect1.gotoAndPlay(2);
            delete container_mc.list_mc.scoreListMc.onEnterFrame;
         }
      }
   };
   container_mc.gotoAndStop(2);
};
var defaultTxtY = container_mc.list_mc.slot_mc.txt._y;
myListener.OnGame_DungeonSimpleResult_SetGift = function(_itemList, _messge)
{
   listReset(container_mc.list_mc.slot_mc.itemListMc);
   var _loc5_ = lib.util.ExtString.split(_itemList,"\n");
   var _loc4_ = _loc5_.length;
   if(_loc4_ == 0 || _loc4_ == undefined || _loc4_ == null)
   {
      container_mc.list_mc.slot_mc.giftTxt._y = 0;
      container_mc.list_mc.slot_mc.giftBg._y = -5;
   }
   else
   {
      container_mc.list_mc.slot_mc.giftTxt._y = -45.8;
      container_mc.list_mc.slot_mc.giftBg._y = -50.5;
   }
   var _loc7_ = [165,95,75,46];
   var _loc6_ = [0,140,90,80];
   container_mc.list_mc.slot_mc.gotoAndStop(_loc4_ + 1);
   container_mc.list_mc.slot_mc.txt.htmlText = _messge;
   var _loc3_ = 0;
   while(_loc3_ < _loc4_)
   {
      var _loc2_ = lib.util.ExtString.split(_loc5_[_loc3_],"\t");
      var _loc1_ = container_mc.list_mc.slot_mc.itemListMc.attachMovie("Slot_link","item" + _loc3_,container_mc.list_mc.slot_mc.itemListMc.getNextHighestDepth());
      _loc1_._x = _loc7_[_loc4_ - 1] + _loc6_[_loc4_ - 1] * _loc3_;
      _loc1_.index = _loc2_[0];
      _loc1_.draw(_loc2_[1]);
      _loc1_.SLOT.enabled = false;
      _loc1_.display = true;
      _loc1_.grade = _loc2_[4];
      _loc1_.masterpiece = _loc2_[6];
      if(Number(_loc2_[3]))
      {
         _loc1_.num = _loc2_[3];
      }
      lib.manager.ToolTip.add(_loc1_.SLOT,_loc2_[0],6,_loc1_.Icon);
      _loc3_ = _loc3_ + 1;
   }
};
myListener.OnGame_DungeonSimpleResult_SetGiftSecond = function(gift)
{
   container_mc.list_mc.slot_mc.giftTxt.text = "";
   container_mc.list_mc.slot_mc.giftBg._visible = false;
   if(gift == "" || gift == undefined)
   {
      return undefined;
   }
   container_mc.list_mc.slot_mc.giftBg._visible = true;
   container_mc.list_mc.slot_mc.giftTxt.htmlText = gift;
};
myListener.OnGame_DungeonSimpleResult_SetGiftSecond();
myListener.OnGame_DungeonSimpleResult_SetMvp = function(_userID)
{
   container_mc.list_mc.slot_mc.mvpMC.txt0.text = _userID;
   container_mc.list_mc.slot_mc.mvpMC.txt1.text = _userID + lib.util.UIString.getUIString("$460037");
   container_mc.list_mc.slot_mc.mvpMC._visible = true;
   var _loc1_ = (400 - container_mc.list_mc.slot_mc.mvpMC.txt1.textWidth) / 2;
   container_mc.list_mc.slot_mc.mvpMC.txt0._x = _loc1_;
   container_mc.list_mc.slot_mc.mvpMC.txt1._x = _loc1_;
   container_mc.list_mc.slot_mc.mvpMC.iconMc._x = _loc1_ - 28;
};
myListener.OnGame_DungeonSimpleResult_GuildWarBtn = function(flag)
{
   var _loc1_ = Boolean(Number(flag));
   container_mc.list_mc.guildWar_btn._visible = _loc1_;
   if(_loc1_)
   {
      container_mc.list_mc.enter_btn._x = 497;
   }
   else
   {
      container_mc.list_mc.enter_btn._x = 590;
   }
};
myListener.OnGame_DungeonSimpleResult_GuildWarBtn(0);
container_mc.list_mc.sortBtn.onSelected = function(_index)
{
   ToGame_DungeonSimpleResult_RequestSort(_index);
};
container_mc.list_mc.slot_mc.mvpMC._visible = false;
container_mc.list_mc.totalMc._visible = false;
ToGame_DungeonSimpleResult_Init();
