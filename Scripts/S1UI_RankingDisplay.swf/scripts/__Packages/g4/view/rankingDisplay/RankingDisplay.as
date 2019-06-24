class g4.view.rankingDisplay.RankingDisplay extends g4.core.View implements g4.gameInterface.IRankingDisplay
{
   var SOUND_ID = 2046;
   function RankingDisplay(targetMovieClip)
   {
      super(targetMovieClip);
   }
   function getUIName()
   {
      return g4.view.ViewID.RANKING_DISPLAY;
   }
   function configUI()
   {
      this.__get__targetMovieClip().container_mc.UIDrager.setData(this.getUIName(),this.__get__targetMovieClip());
      this.__get__targetMovieClip().container_mc.text_total.verticalAlign = "center";
      this.updatePlayerCount();
      this.__get__targetMovieClip().container_mc.mc_my_ranking.mc_text.text_rank.verticalAlign = "center";
      this.__get__targetMovieClip().container_mc.mc_my_ranking.mc_text2.text_rank.verticalAlign = "center";
      this.setMyRanking("-",false);
   }
   function configGameInterface()
   {
      this.registerGameInterface("OnGame_RankAround_SetRankList",mx.utils.Delegate.create(this,this.OnGame_RankAround_SetRankList));
      g4.model.GameModel.addEventListener(g4.view.ViewID.RANKING_DISPLAY,g4.model.GameModelEventType.BATTLE_FIELD_PLAYER_COUNT_CHANGE,this,"model_battleFieldPlayerCountChangeHandler");
   }
   function updatePlayerCount()
   {
      this.setTotalPlayerCount(g4.model.GameModel.battleFieldModel.__get__playerCount());
   }
   function setTotalPlayerCount(value)
   {
      if(value > 0)
      {
         this.__get__targetMovieClip().container_mc.text_total.text = String(value);
      }
      else
      {
         this.__get__targetMovieClip().container_mc.text_total.text = "";
      }
   }
   function setMyRanking(value, bPlaySoundAndTween)
   {
      if(value == this.myRankingValue)
      {
         return undefined;
      }
      this.myRankingValue = value;
      var _loc3_ = undefined;
      if(this.myRankingValue == "-")
      {
         _loc3_ = "#";
      }
      else
      {
         _loc3_ = "#" + this.myRankingValue;
      }
      var _loc2_ = this.__get__targetMovieClip().container_mc.mc_my_ranking;
      _loc2_.mc_text.text_rank.text = _loc3_;
      _loc2_.mc_text2.text_rank.text = _loc3_;
      var _loc4_ = this.__get__targetMovieClip().container_mc.text_total._x;
      var _loc5_ = _loc2_.mc_text.text_rank.textWidth;
      var _loc6_ = -26;
      _loc2_._x = Math.floor(_loc4_ - _loc5_ / 2 + _loc6_);
      if(bPlaySoundAndTween)
      {
         lib.manager.UISound.play(this.SOUND_ID);
         _loc2_.gotoAndPlay(2);
      }
      else
      {
         _loc2_.gotoAndStop(_loc2_._totalframes);
      }
   }
   function OnGame_RankAround_SetRankList(dataRows)
   {
      var _loc4_ = lib.util.ExtString.split(dataRows,"\n");
      var _loc6_ = _loc4_.length;
      var _loc8_ = undefined;
      var _loc2_ = undefined;
      var _loc5_ = _loc6_;
      _loc2_ = 0;
      while(_loc2_ < _loc5_)
      {
         var _loc3_ = lib.util.ExtString.split(_loc4_[_loc2_],"\t");
         if(_loc3_[4] == 1)
         {
            this.setMyRanking(_loc3_[0],true);
            return undefined;
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function model_battleFieldPlayerCountChangeHandler(event)
   {
      this.updatePlayerCount();
   }
}
