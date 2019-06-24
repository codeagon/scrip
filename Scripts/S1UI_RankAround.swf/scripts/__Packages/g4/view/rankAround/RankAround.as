class g4.view.rankAround.RankAround extends g4.core.View implements g4.gameInterface.IRankAround
{
   var TEXT_COLOR_ME = 8447772;
   var TEXT_COLOR_DEFAULT = 10215423;
   var endTimerAlertSec = 30;
   var bBattle = false;
   function RankAround(targetMovieClip)
   {
      super(targetMovieClip);
      this.ToGame_RankAround_Init();
   }
   function getUIName()
   {
      return g4.view.ViewID.RANK_AROUND;
   }
   function configUI()
   {
      this.__get__targetMovieClip().container_mc.UIDrager.setData(this.getUIName(),this.__get__targetMovieClip());
      this.__get__targetMovieClip().container_mc.mc_time.text_title.verticalAlign = "center";
      this.__get__targetMovieClip().container_mc.mc_time.text_title.text = "";
      this.__get__targetMovieClip().container_mc.mc_time.text_state.verticalAlign = "center";
      this.__get__targetMovieClip().container_mc.mc_time.text_state.text = "";
      this.__get__targetMovieClip().container_mc.mc_time.text_time.verticalAlign = "center";
      this.__get__targetMovieClip().container_mc.mc_time.text_time.text = "";
      this.__get__targetMovieClip().container_mc.mc_time.text_time_warn.verticalAlign = "center";
      this.__get__targetMovieClip().container_mc.mc_time.text_time_warn.text = "";
      this.__get__targetMovieClip().container_mc.mc_score.mc_title.text_title.text = lib.util.UIString.getUIString("$274007");
      this.scoreRowArray = [this.__get__targetMovieClip().container_mc.mc_score.mc_row_0];
      this.cleanUpScore(this.__get__targetMovieClip().container_mc.mc_score.mc_row_0);
      this.__get__targetMovieClip().container_mc.mc_rank.mc_title.text_title.text = lib.util.UIString.getUIString("$274008");
      this.rankRowArray = [this.__get__targetMovieClip().container_mc.mc_rank.mc_rank_0,this.__get__targetMovieClip().container_mc.mc_rank.mc_rank_1,this.__get__targetMovieClip().container_mc.mc_rank.mc_rank_2,this.__get__targetMovieClip().container_mc.mc_rank.mc_rank_3,this.__get__targetMovieClip().container_mc.mc_rank.mc_rank_4];
      this.cleanUpRanks();
   }
   function configGameInterface()
   {
      this.registerGameInterface("OnGame_RankAround_SetScoreTitle",mx.utils.Delegate.create(this,this.OnGame_RankAround_SetScoreTitle));
      this.registerGameInterface("OnGame_RankAround_SetScoreValue",mx.utils.Delegate.create(this,this.OnGame_RankAround_SetScoreValue));
      this.registerGameInterface("OnGame_RankAround_SetRankList",mx.utils.Delegate.create(this,this.OnGame_RankAround_SetRankList));
      this.registerGameInterface("OnGame_BFScoreBoard_SetBattleState",mx.utils.Delegate.create(this,this.OnGame_BFScoreBoard_SetBattleState));
      this.registerGameInterface("OnGame_BFScoreBoard_SetTimer",mx.utils.Delegate.create(this,this.OnGame_BFScoreBoard_SetTimer));
      this.registerGameInterface("OnGame_BFScoreBoard_SetData",mx.utils.Delegate.create(this,this.OnGame_BFScoreBoard_SetData));
   }
   function setViewVisible(visible)
   {
      super.setViewVisible(visible);
   }
   function setScoreTitle(titleList)
   {
      var _loc6_ = lib.util.ExtString.split(titleList,"\t");
      var _loc8_ = this.scoreRowArray.length;
      var _loc5_ = this.scoreRowArray[0];
      var _loc10_ = _loc5_._x;
      var _loc9_ = _loc5_._y;
      var _loc7_ = 30;
      var _loc3_ = undefined;
      var _loc4_ = _loc6_.length;
      var _loc2_ = undefined;
      var _loc11_ = undefined;
      _loc2_ = _loc8_;
      while(_loc2_ < _loc4_)
      {
         _loc3_ = _loc5_.duplicateMovieClip("mc_row_" + _loc2_,this.__get__targetMovieClip().container_mc.mc_score.getNextHighestDepth());
         _loc3_._x = _loc10_;
         _loc3_._y = _loc9_ + _loc7_ * _loc2_;
         this.scoreRowArray.push(_loc3_);
         _loc2_ = _loc2_ + 1;
      }
      _loc11_ = this.scoreRowArray.length;
      _loc2_ = 0;
      while(_loc2_ < _loc11_)
      {
         if(_loc2_ < _loc4_)
         {
            this._setScoreTitle(this.scoreRowArray[_loc2_],_loc6_[_loc2_],_loc2_ == _loc4_ - 1);
         }
         else
         {
            this.cleanUpScore(this.scoreRowArray[_loc2_]);
         }
         _loc2_ = _loc2_ + 1;
      }
      var _loc12_ = 0;
      if(_loc4_ > 0)
      {
         var _loc14_ = this.scoreRowArray[_loc4_ - 1];
         var _loc13_ = 30;
         _loc12_ = _loc14_._y + _loc13_;
      }
      else
      {
         _loc12_ = 45;
      }
      this.__get__targetMovieClip().container_mc.mc_score.mc_bg._height = _loc12_;
      var _loc15_ = -6;
      this.__get__targetMovieClip().container_mc.mc_rank._y = this.__get__targetMovieClip().container_mc.mc_score._y + _loc12_ + _loc15_;
      this.__get__targetMovieClip().container_mc.UIDrager._height = this.__get__targetMovieClip().container_mc.mc_rank._y + this.__get__targetMovieClip().container_mc.mc_rank._height;
      this.__get__targetMovieClip().hit._height = this.__get__targetMovieClip().container_mc.mc_rank._y + this.__get__targetMovieClip().container_mc.mc_rank._height;
   }
   function _setScoreTitle(mc, title, isLastRow)
   {
      mc.text_name.text = title;
      this.setScoreValue(mc,0);
      mc.mc_bg._visible = !isLastRow;
      mc._visible = true;
   }
   function setScoreValue(mc, value)
   {
      if(isNaN(value))
      {
         mc.text_score.text = "0";
      }
      else
      {
         mc.text_score.text = lib.util.CurrencyFormat.makeComma(value);
      }
   }
   function cleanUpScore(mc)
   {
      mc.text_name.text = "";
      mc.text_score.text = "";
      mc.mc_bg._visible = false;
      mc._visible = false;
   }
   function cleanUpRanks()
   {
      var _loc2_ = undefined;
      var _loc3_ = this.rankRowArray.length;
      _loc2_ = 0;
      while(_loc2_ < _loc3_)
      {
         this.cleanUpRank(this.rankRowArray[_loc2_]);
         _loc2_ = _loc2_ + 1;
      }
      this.__get__targetMovieClip().container_mc.mc_rank.mc_icon_top._visible = false;
   }
   function cleanUpRank(mc)
   {
      mc.text_rank.text = "";
      mc.text_name.text = "";
      mc.text_score.text = "";
   }
   function setRankData(mc, rank, name, score, team, isMe, isLive)
   {
      mc.text_rank.text = rank;
      mc.text_name.text = name;
      mc.text_score.text = lib.util.CurrencyFormat.makeComma(score);
      if(isMe)
      {
         mc.text_rank.textColor = this.TEXT_COLOR_ME;
         mc.text_name.textColor = this.TEXT_COLOR_ME;
         mc.text_score.textColor = this.TEXT_COLOR_ME;
      }
      else
      {
         mc.text_rank.textColor = this.TEXT_COLOR_DEFAULT;
         mc.text_name.textColor = this.TEXT_COLOR_DEFAULT;
         mc.text_score.textColor = this.TEXT_COLOR_DEFAULT;
      }
   }
   function setEndTime(endTime)
   {
      if(endTime == -1)
      {
         return undefined;
      }
      var _loc3_ = undefined;
      var _loc5_ = undefined;
      var _loc4_ = Math.floor(endTime / 60);
      var _loc2_ = endTime % 60;
      if(_loc4_ < 10)
      {
         _loc3_ = "0" + _loc4_;
      }
      else
      {
         _loc3_ = String(_loc4_);
      }
      if(_loc2_ < 10)
      {
         _loc5_ = "0" + _loc2_;
      }
      else
      {
         _loc5_ = String(_loc2_);
      }
      if(this.bBattle && endTime <= this.endTimerAlertSec)
      {
         this.__get__targetMovieClip().container_mc.mc_time.text_time.text = "";
         this.__get__targetMovieClip().container_mc.mc_time.text_time_warn.text = _loc3_ + ":" + _loc5_;
      }
      else
      {
         this.__get__targetMovieClip().container_mc.mc_time.text_time.text = _loc3_ + ":" + _loc5_;
         this.__get__targetMovieClip().container_mc.mc_time.text_time_warn.text = "";
      }
   }
   function setTimeVisible(visible)
   {
      this.__get__targetMovieClip().container_mc.mc_time.text_time._visible = visible;
      this.__get__targetMovieClip().container_mc.mc_time.text_time_warn._visible = visible;
   }
   function OnGame_RankAround_SetScoreTitle(titleList)
   {
      this.setScoreTitle(titleList);
   }
   function OnGame_RankAround_SetScoreValue(scoreList)
   {
      var _loc3_ = lib.util.ExtString.split(scoreList,"\t");
      var _loc2_ = undefined;
      var _loc5_ = Math.min(_loc3_.length,this.scoreRowArray.length);
      var _loc4_ = 0;
      _loc2_ = 0;
      while(_loc2_ < _loc5_)
      {
         _loc4_ = _loc4_ + Number(_loc3_[_loc2_]);
         this.setScoreValue(this.scoreRowArray[_loc2_],Number(_loc3_[_loc2_]));
         _loc2_ = _loc2_ + 1;
      }
      var _loc6_ = lib.util.CurrencyFormat.makeComma(_loc4_);
      this.__get__targetMovieClip().container_mc.mc_score.mc_title.textField.text = _loc6_;
   }
   function OnGame_RankAround_SetRankList(dataRows)
   {
      var _loc6_ = lib.util.ExtString.split(dataRows,"\n");
      var _loc5_ = _loc6_.length;
      var _loc4_ = undefined;
      var _loc3_ = undefined;
      var _loc7_ = this.rankRowArray.length;
      _loc3_ = 0;
      while(_loc3_ < _loc7_)
      {
         _loc4_ = this.rankRowArray[_loc3_];
         if(_loc3_ < _loc5_)
         {
            var _loc2_ = lib.util.ExtString.split(_loc6_[_loc3_],"\t");
            this.setRankData(_loc4_,_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4] == 1,_loc2_[5] != 1);
            if(_loc2_[4] == 1)
            {
               this.__get__targetMovieClip().container_mc.mc_rank.mc_title.textField.text = _loc2_[0] + "/" + g4.model.GameModel.battleFieldModel.__get__playerCount();
            }
         }
         else
         {
            this.cleanUpRank(_loc4_);
         }
         _loc3_ = _loc3_ + 1;
      }
      this.__get__targetMovieClip().container_mc.mc_rank.mc_icon_top._visible = _loc5_ > 0;
   }
   function OnGame_BFScoreBoard_SetBattleState(state)
   {
      state = Number(state);
      var _loc2_ = this.__get__targetMovieClip().container_mc.mc_time;
      if(state == -1)
      {
         this.bBattle = false;
         _loc2_.text_state.text = lib.util.UIString.getUIString("$274004");
         this.setTimeVisible(false);
      }
      else if(state > 0)
      {
         this.bBattle = false;
         _loc2_.text_state.text = lib.util.UIString.getUIString("$274006");
         this.setTimeVisible(false);
      }
      else
      {
         this.bBattle = true;
         _loc2_.text_state.text = lib.util.UIString.getUIString("$274005");
         this.setTimeVisible(true);
      }
   }
   function OnGame_BFScoreBoard_SetTimer(endTime, runTime)
   {
      this.setEndTime(Number(endTime));
   }
   function OnGame_BFScoreBoard_SetData(batteMode, myScore, myGoalScore, otherScore, otherGoalScore, myBlink, otherBlink, endTime, warningTime, myTeamName, otherTeamName, myImg, otherImg)
   {
      warningTime = Number(warningTime);
      if(isNaN(warningTime) && warningTime > 0)
      {
         this.endTimerAlertSec = warningTime;
      }
      this.__get__targetMovieClip().container_mc.mc_time.text_title.text = lib.util.UIString.getUIString("$274003");
   }
   function ToGame_RankAround_Init()
   {
      fscommand("ToGame_RankAround_Init");
   }
}
