function buildList(_listDataArray)
{
   listReset(container_mc.list_mc.lineBox);
   scrollBar.pageSize = 0;
   scrollBar.scroll = 0;
   var _loc4_ = _listDataArray.length;
   var _loc2_ = 0;
   while(_loc2_ < _loc4_)
   {
      var _loc3_ = DungeonListData[_loc2_];
      var _loc1_ = undefined;
      _loc1_ = container_mc.list_mc.lineBox.attachMovie("line","line" + _loc2_,container_mc.list_mc.lineBox.getNextHighestDepth());
      _loc1_._y = lineH * _loc2_;
      _loc1_.index = _loc2_;
      _loc1_.userCheck = _loc3_[3];
      if(_loc1_.userCheck == 1)
      {
         _loc1_.gotoAndStop(2);
      }
      buildListSet(_loc1_,_loc3_);
      _loc2_ = _loc2_ + 1;
   }
}
function buildListSet(_lineMc, _dungeonData)
{
   _lineMc.ranktxt.text = "";
   _lineMc.index0 = _dungeonData[0];
   _lineMc.index1 = _dungeonData[1];
   _lineMc.index2 = _dungeonData[2];
   if(_lineMc.index0 != "" || _lineMc.index0 != undefined)
   {
      _lineMc.txt0.textAutoSize = "shrink";
      _lineMc.txt0.text = _lineMc.index0;
   }
   if(_lineMc.index1 != "" || _lineMc.index1 != undefined)
   {
      _lineMc.txt1.setText(_lineMc.index1);
   }
   if(_lineMc.index2 != "" || _lineMc.index2 != undefined)
   {
      _lineMc.txt2.setText(_lineMc.index2);
   }
}
function ToGame_DungeonRankResult_Init()
{
   fscommand("ToGame_DungeonRankResult_Init");
}
function ToGame_DungeonRankResult_CloseUI()
{
   fscommand("ToGame_DungeonRankResult_CloseUI");
}
function ToGame_DungeonRankResult_RequestRanking(_flag)
{
   getURL("FSCommand:ToGame_DungeonRankResult_RequestRanking",_flag);
}
function tab_request(_num, _noRequestEvent)
{
   if(_noRequestEvent == "0")
   {
      ToGame_DungeonRankResult_RequestRanking(_num);
   }
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
var UIname = "DungeonRankResult";
this.bWindowOpen = true;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
container_mc.UIDrager.setData(UIname,UI,container_mc.lock_mc);
container_mc.title_box.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
container_mc.title_box.verticalAlign = "center";
var TOTALLISTLINES = 11;
var DungeonListData = [];
var lineH = lib.manager.UISkin.LISTLINE_HEIGHT;
var recordEf_Bool = false;
var e_btn = container_mc.list_mc.enter_btn.txtBtn;
e_btn.setRelease(ToGame_DungeonRankResult_CloseUI);
container_mc.list_mc.tab_disable0._visible = false;
container_mc.list_mc.tab_disable1._visible = false;
var list_mcY = container_mc.list_mc.lineBox._y;
var scrollBar = container_mc.list_mc.scrollbar;
scrollBar.addListener(container_mc.list_mc.lineBox);
container_mc.list_mc.lineBox.onScroll = function()
{
   container_mc.list_mc.lineBox._y = list_mcY - arguments[0];
};
scrollBar.setWheel(container_mc.list_mc.lineBox);
scrollBar.wheelDelta = 1;
scrollBar.pageSize = 0;
scrollBar.displaySize = container_mc.list_mc.mask_mc._height;
scrollBar.defaultBarSizeRatio = 0.3333333333333333;
scrollBar.rowHeight = 30;
scrollBar.scroll = 0;
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
myListener.OnGame_DungeonRankResult_SetDungonName = function(_nameType)
{
   container_mc.bg_mc.title_box.text = _nameType;
};
myListener.OnGame_DungeonRankResult_SetList = function(_list, _flag, _type)
{
   var _loc6_ = lib.util.ExtString.split(_list,"\n");
   var _loc7_ = _loc6_.length;
   DungeonListData = [];
   container_mc.list_mc.tabBtn.tab.setRelease(tab_request);
   container_mc.list_mc.tabBtn.tab.setTab(_flag,1);
   if(_type == 1)
   {
      container_mc.list_mc["tab_disable" + _flag]._visible = true;
   }
   var _loc2_ = 0;
   while(_loc2_ < _loc7_)
   {
      DungeonListData[_loc2_] = [];
      var _loc4_ = lib.util.ExtString.split(_loc6_[_loc2_],"\t");
      var _loc5_ = _loc4_.length;
      var _loc1_ = 0;
      while(_loc1_ < _loc5_)
      {
         var _loc3_ = _loc4_[_loc1_];
         DungeonListData[_loc2_].push(_loc3_);
         _loc1_ = _loc1_ + 1;
      }
      _loc2_ = _loc2_ + 1;
   }
   buildList(DungeonListData);
   scrollBar.pageSize = container_mc.list_mc.lineBox._height;
   if(container_mc._currentframe < 2)
   {
      container_mc.gotoAndStop(2);
   }
};
myListener.OnGame_DungeonRankResult_SetBestScore = function(_list)
{
   var _loc1_ = lib.util.ExtString.split(_list,"\t");
   container_mc.list_mc.recordBox0.txt0.text = _loc1_[0];
   container_mc.list_mc.recordBox0.txt1.text = _loc1_[1];
   if(_loc1_[2] == 1)
   {
      container_mc.recordEffect.recordBox1.txt0.text = _loc1_[0];
      container_mc.recordEffect.recordBox1.txt1.text = _loc1_[1];
      container_mc.recordEffect.recordBox2.txt0.text = _loc1_[0];
      container_mc.recordEffect.recordBox2.txt1.text = _loc1_[1];
      recordEf_Bool = true;
   }
   else
   {
      recordEf_Bool = false;
   }
};
myListener.OnGame_DungeonRankResult_SetScore = function(_list)
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
};
myListener.OnGame_DungeonRankResult_SetGift = function(_itemList, _messge)
{
   listReset(container_mc.list_mc.slot_mc.itemListMc);
   var _loc5_ = lib.util.ExtString.split(_itemList,"\n");
   var _loc4_ = _loc5_.length;
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
      _loc1_.sealType = _loc2_[5];
      _loc1_.masterpiece = _loc2_[6];
      if(Number(_loc2_[3]))
      {
         _loc1_.num = _loc2_[3];
      }
      lib.manager.ToolTip.add(_loc1_.SLOT,_loc2_[0],6,_loc1_.Icon);
      _loc3_ = _loc3_ + 1;
   }
};
myListener.OnGame_DungeonRankResult_SetMvp = function(_userID)
{
   container_mc.list_mc.slot_mc.mvpMC.txt0.text = _userID;
   container_mc.list_mc.slot_mc.mvpMC.txt1.text = _userID + lib.util.UIString.getUIString("$460037");
   container_mc.list_mc.slot_mc.mvpMC._visible = true;
   var _loc1_ = (400 - container_mc.list_mc.slot_mc.mvpMC.txt1.textWidth) / 2;
   container_mc.list_mc.slot_mc.mvpMC.txt0._x = _loc1_;
   container_mc.list_mc.slot_mc.mvpMC.txt1._x = _loc1_;
   container_mc.list_mc.slot_mc.mvpMC.iconMc._x = _loc1_ - 28;
};
container_mc.list_mc.sortBtn.onSelected = function(_index)
{
   ToGame_DungeonRankResult_RequestSort(_index);
};
container_mc.list_mc.slot_mc.mvpMC._visible = false;
container_mc.list_mc.totalMc._visible = false;
container_mc.recordEffect._visible = false;
ToGame_DungeonRankResult_Init();
