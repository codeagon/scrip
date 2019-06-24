class g4.view.bfScoreResult.BFScoreResult extends g4.core.View implements g4.gameInterface.IBFScoreResult
{
   function BFScoreResult(targetMovieClip)
   {
      super(targetMovieClip);
   }
   function getUIName()
   {
      return g4.view.ViewID.BF_SCORE_RESULT;
   }
   function configUI()
   {
      g4.view.bfScoreResult.BFScoreResultGlobals.bfScoreResult = this;
      var _loc2_ = this.__get__targetMovieClip().container_mc.mc_main;
      new g4.view.bfScoreResult.ScoreListHeader(_loc2_.mc_header);
      this.scoreList = new g4.view.bfScoreResult.ScoreList(_loc2_.mc_score_list);
      this.myScore = new g4.view.bfScoreResult.MyScore(_loc2_.mc_my_score);
      this.reward = new g4.view.bfScoreResult.Reward(_loc2_.mc_reward);
      _loc2_.mc_close_area.button_exit.txtBtn.setRelease(this.button_exit_clickHandler);
      this.contentClose();
   }
   function configGameInterface()
   {
      this.registerGameInterface("OnGame_BFInfoBoard_SetData",mx.utils.Delegate.create(this,this.OnGame_BFInfoBoard_SetData));
      this.registerGameInterface("OnGame_BFInfoBoard_Close",mx.utils.Delegate.create(this,this.OnGame_BFInfoBoard_Close));
      this.registerGameInterface("OnGame_BFInfoBoard_SetMyIndex",mx.utils.Delegate.create(this,this.OnGame_BFInfoBoard_SetMyIndex));
      this.registerGameInterface("OnGame_BFRewardItem_SetData",mx.utils.Delegate.create(this,this.OnGame_BFRewardItem_SetData));
      this.registerGameInterface("OnGame_BFScoreBoard_SetBattleState",mx.utils.Delegate.create(this,this.OnGame_BFScoreBoard_SetBattleState));
      this.registerGameInterface("OnGame_BFInfoBoard_SetEndTimer",mx.utils.Delegate.create(this,this.OnGame_BFInfoBoard_SetEndTimer));
   }
   function cleanUp()
   {
      this.__get__targetMovieClip().container_mc.mc_main.gotoAndStop(2);
      this.setVisibleExitButton(false);
      this.myScore.cleanUp();
   }
   function contentOpen()
   {
      this.__get__targetMovieClip().container_mc._visible = true;
      this.__get__targetMovieClip().hit._visible = true;
      this.__get__targetMovieClip().container_mc.mc_main.gotoAndPlay(2);
   }
   function contentClose()
   {
      this.__get__targetMovieClip().container_mc._visible = false;
      this.__get__targetMovieClip().hit._visible = false;
   }
   function setBattleState(state)
   {
      this.setVisibleExitButton(state > 0);
   }
   function setVisibleExitButton(visible)
   {
      this.__get__targetMovieClip().container_mc.mc_main.mc_close_area.button_exit._visible = visible;
   }
   function fromFrame(type)
   {
      switch(type)
      {
         case "startScoreList":
            this.scoreList.show();
            break;
         case "startMyScore":
            this.myScore.show();
            this.reward.show();
      }
   }
   function setExitTime(endTime)
   {
      var _loc4_ = (lib.controls.S_TxtBtn)this.__get__targetMovieClip().container_mc.mc_main.mc_close_area.button_exit;
      if(_loc4_ == null)
      {
         return undefined;
      }
      var _loc5_ = "";
      if(endTime == -1)
      {
         _loc5_ = lib.util.UIString.getUIString("$271012");
      }
      else
      {
         var _loc2_ = String(Math.floor(endTime / 60));
         var _loc3_ = String(endTime % 60);
         if(_loc2_.length == 1)
         {
            _loc2_ = "0" + _loc2_;
         }
         if(_loc3_.length == 1)
         {
            _loc3_ = "0" + _loc3_;
         }
         var _loc7_ = _loc2_ + ":" + _loc3_;
         _loc5_ = lib.util.UIString.getUIString("$271031","time",_loc7_);
      }
      _loc4_._label = _loc5_;
      _loc4_.draw();
   }
   function button_exit_clickHandler(event)
   {
      fscommand("ToGame_BFScoreBoard_CloseUI");
   }
   function OnGame_BFInfoBoard_SetData(bfMode, myTeamList, otherTeamList, battleTime, teamStrScore, outRemainTime, battleResult)
   {
      bfMode = Number(bfMode);
      battleResult = Number(battleResult);
      outRemainTime = Number(outRemainTime);
      var _loc2_ = 5;
      if(bfMode != _loc2_)
      {
         return undefined;
      }
      this.cleanUp();
      this.setExitTime(outRemainTime);
      this.scoreList.setScoreData(myTeamList,otherTeamList);
      this.myScore.setScoreData(myTeamList,otherTeamList);
      this.setBattleState(battleResult);
      this.contentOpen();
   }
   function OnGame_BFInfoBoard_Close()
   {
      this.contentClose();
   }
   function OnGame_BFInfoBoard_SetMyIndex(myIndex, myTeamIndex)
   {
      this.scoreList.setMyIndex(myIndex,myTeamIndex);
      this.myScore.setMyIndex(myIndex,myTeamIndex);
   }
   function OnGame_BFRewardItem_SetData(hasReward, value)
   {
      this.reward.setRewardData(hasReward,value);
   }
   function OnGame_BFScoreBoard_SetBattleState(state)
   {
      state = Number(state);
      this.setBattleState(state);
   }
   function OnGame_BFInfoBoard_SetEndTimer(outRemainTime)
   {
      outRemainTime = Number(outRemainTime);
      this.setExitTime(outRemainTime);
   }
}
