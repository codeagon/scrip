function ToGame_SoloDungeon_ButtonClick(idx)
{
   getURL("FSCommand:ToGame_SoloDungeon_ButtonClick",idx);
}
function setLine(dataList)
{
   var _loc4_ = lib.util.ExtString.split(dataList,"\n");
   var _loc3_ = 0;
   var _loc5_ = _loc4_.length;
   var _loc2_ = 0;
   while(_loc2_ < _loc5_)
   {
      var _loc1_ = createLine(_loc2_,_loc4_[_loc2_]);
      _loc1_._y = _loc3_;
      _loc1_.lineBg._y = _loc1_._height - 35;
      _loc3_ = _loc3_ + (_loc1_._height + 10);
      _loc2_ = _loc2_ + 1;
   }
   return _loc3_;
}
function createLine(index, lineData)
{
   var _loc2_ = lib.util.ExtString.split(lineData,"\t");
   var _loc1_ = resultMc.boxMc.attachMovie("lineMc","line" + index,resultMc.boxMc.getNextHighestDepth());
   _loc1_.txt0.autoSize = "left";
   _loc1_.txt0.wordWrap = true;
   _loc1_.txt0.verticalAlign = "center";
   _loc1_.txt0.text = _loc2_[0];
   _loc1_.txt1.text = _loc2_[1];
   _loc1_.txt3.text = "x" + _loc2_[3];
   _loc1_.gradeMc.gotoAndStop(Number(_loc2_[2]));
   return _loc1_;
}
function updateHitHeight()
{
   hit._height = container_mc.resultMc._y + container_mc.resultMc._height;
}
_global.gfxExtensions = true;
var UI = this;
UI._visible = false;
var UIname = "SoloDungeon";
this.bWindowOpen = false;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
var e_btn = container_mc.resultMc.btn.txtBtn;
e_btn.setRelease(function()
{
   ToGame_SoloDungeon_ButtonClick();
}
);
myListener.OnGameEventShowWindow = function(WindowName, bShow)
{
   if(WindowName.toLowerCase() == UIname.toLowerCase())
   {
      bWindowOpen = bShow;
      if(bWindowOpen)
      {
         UI._visible = true;
      }
      else
      {
         UI._visible = false;
         missionY = 45;
         missionMc._visible = false;
         container_mc.resultMc.hitTestDisable = true;
         resultMc._visible = false;
         resultMc._y = 0;
         dungeonResult._visible = false;
      }
   }
};
myListener.OnGameEventChangeUIMode = function()
{
   if(!_global.gbUIMode)
   {
   }
};
myListener.OnGame_SoloDungeon_UpDate = function(id, mission, missionState, isClear, per, stateType)
{
   missionMc._visible = true;
   var _loc1_ = container_mc.missionMc["line" + id];
   if(!_loc1_)
   {
      _loc1_ = container_mc.missionMc.attachMovie("lineMc2","line" + id,container_mc.missionMc.getNextHighestDepth());
      _loc1_.hitTestDisable = true;
      _loc1_.txt0.autoSize = "left";
      _loc1_.txt0.wordWrap = true;
      _loc1_.txt0.htmlText = mission;
      if(stateType == 0)
      {
         _loc1_.mState._visible = true;
         _loc1_.mState2._visible = false;
         _loc1_.stateRenderer = _loc1_.mState;
      }
      else
      {
         _loc1_.mState._visible = false;
         _loc1_.mState2._visible = true;
         _loc1_.stateRenderer = _loc1_.mState2;
      }
      _loc1_.stateRenderer.txt.txt.text = missionState;
      _loc1_._x = 36;
      _loc1_._y = missionY;
      missionY = _loc1_._y + _loc1_.txt0.textHeight + 20;
      container_mc.missionMc.bg._height = missionY + 10;
      container_mc.resultMc._y = container_mc.missionMc.bg._y + missionY + 20;
      hit._height = missionY;
      _loc1_.checkBox._visible = false;
   }
   else
   {
      updateSoloDungeon(_loc1_,missionState,isClear,per);
   }
};
var updateSoloDungeon = function(mRenderer, mState, mClear, per)
{
   if(mRenderer.stateRenderer.txt.txt != mState)
   {
      mRenderer.stateRenderer.gotoAndStop(per);
      mRenderer.stateRenderer.txt.txt.text = mState;
   }
   var _loc2_ = Boolean(mClear == 2);
   mRenderer.checkBox._visible = _loc2_;
   mRenderer.checkBox.checked = _loc2_;
};
myListener.OnGame_SoloDungeon_AllClear = function()
{
   for(var _loc2_ in container_mc.missionMc)
   {
      var _loc1_ = container_mc.missionMc[_loc2_];
      if(typeof _loc1_ == "movieclip")
      {
         _loc1_.removeMovieClip();
      }
   }
   missionMc._visible = false;
   missionY = 34;
   resultMc._y = 0;
};
myListener.OnGame_SoloDungeon_SuccessResult = function(str, dataList, count)
{
   lib.manager.UISound.play("3105");
   resultMc.gotoAndStop(2);
   resultMc._visible = true;
   container_mc.resultMc.hitTestDisable = false;
   container_mc.resultMc.wing.hitTestDisable = true;
   resultMc.txt.text = lib.util.UIString.getUIString("$461047") + count + lib.util.UIString.getUIString("$461048");
   var _loc1_ = setLine(dataList);
   resultMc.rewardTxt.text = "X" + count;
   resultMc.btn._y = resultMc.boxMc._y + _loc1_ + 15;
   resultMc.bg._height = resultMc.boxMc._y + _loc1_ + 15 + 37 + 15;
   updateHitHeight();
};
myListener.OnGame_SoloDungeon_FailResult = function(str, dataList)
{
   lib.manager.UISound.play("3016");
   resultMc.gotoAndStop(1);
   resultMc._visible = true;
   container_mc.resultMc.hitTestDisable = false;
   resultMc.txt.text = lib.util.UIString.getUIString("$461047") + "0" + lib.util.UIString.getUIString("$461048");
   var _loc1_ = setLine(dataList);
   resultMc.btn._y = resultMc.boxMc._y + _loc1_ + 15;
   resultMc.bg._height = resultMc.boxMc._y + _loc1_ + 15 + 37 + 15;
   updateHitHeight();
};
myListener.OnGame_SoloDungeon_CloseResult = function()
{
   resultMc._visible = false;
   container_mc.resultMc.hitTestDisable = true;
};
myListener.OnGame_SoloDungeon_DungeonResult = function($clearTime, $bestTime, $isBest)
{
   missionMc._visible = false;
   resultMc._visible = false;
   dungeonResult._visible = true;
   dungeonResult.dungeonResult($clearTime,$bestTime,$isBest);
};
myListener.OnGame_SoloDungeon_SetContinueBtnVisibility = function(visibility)
{
   return undefined;
};
var LINE_H = 45;
var missionY;
var missionMc = container_mc.missionMc;
var resultMc = container_mc.resultMc;
var dungeonResult = (g4.view.soloDungeon.SoloDungeon_DungeonResult)container_mc.dungeonResult;
missionY = 45;
missionMc._visible = false;
missionMc.bg.hitTestDisable = true;
resultMc._visible = false;
resultMc.hitTestDisable = true;
resultMc.bg.hitTestDisable = true;
resultMc._y = 0;
dungeonResult._visible = false;
dungeonResult.initButton(ToGame_SoloDungeon_ButtonClick);
dungeonResult._y = 0;
fscommand("ToGame_SoloDungeon_Init");
