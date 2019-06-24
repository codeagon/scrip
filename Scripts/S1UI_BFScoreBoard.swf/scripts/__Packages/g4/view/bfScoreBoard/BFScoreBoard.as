class g4.view.bfScoreBoard.BFScoreBoard extends g4.core.View implements g4.gameInterface.IBFScoreBoard
{
   var BF_TYPE_HONOR = 0;
   var BF_TYPE_FIGHTING_SPIRIT = 1;
   var BF_TYPE_SATURATION = 2;
   var BF_TYPE_KUMAS_WORLD = 3;
   var BF_TYPE_PVE = 4;
   var BF_TYPE_CONFUSION = 5;
   var BF_TYPE_KUMAS_RENEWAL = 6;
   var BF_TYPE_HONOR_RENEWAL = 7;
   var _nGauge0 = -1;
   var _nGauge1 = -1;
   function BFScoreBoard($targetMovie)
   {
      super($targetMovie);
   }
   function getUIName()
   {
      return g4.view.ViewID.BF_SCORE_BOARD;
   }
   function configUI()
   {
      this.__get__targetMovieClip().container_mc.UIDrager.setData(this.getUIName(),this.__get__targetMovieClip());
      this.bInfo = (gfx.controls.Button)this.__get__targetMovieClip().container_mc.bInfo;
      this.bInfo._visible = false;
      lib.manager.ToolTip.add(this.bInfo,lib.util.UIString.getUIString("$273013"),1);
      this.tScoreA0 = (TextField)this.__get__targetMovieClip().container_mc.tScoreA0;
      this.tScoreA1 = (TextField)this.__get__targetMovieClip().container_mc.tScoreA1;
      this.tScoreB0 = (TextField)this.__get__targetMovieClip().container_mc.tScoreB0;
      this.tScoreB1 = (TextField)this.__get__targetMovieClip().container_mc.tScoreB1;
      this.tMaxB0 = (TextField)this.__get__targetMovieClip().container_mc.tMaxB0;
      this.tMaxB1 = (TextField)this.__get__targetMovieClip().container_mc.tMaxB1;
      this.mScoreC0 = (MovieClip)this.__get__targetMovieClip().container_mc.mScoreC0;
      this.mScoreC1 = (MovieClip)this.__get__targetMovieClip().container_mc.mScoreC1;
      this.tScoreC0 = (TextField)this.mScoreC0.tScoreC0;
      this.tScoreC1 = (TextField)this.mScoreC1.tScoreC1;
      this.tTime = (TextField)this.__get__targetMovieClip().container_mc.tTime;
      this.mTime = this.__get__targetMovieClip().container_mc.mTime;
      this.mRoundGroup = (MovieClip)this.__get__targetMovieClip().container_mc.mRoundGroup;
      this.mRoundGroup._visible = false;
      this.mWarning0 = (MovieClip)this.__get__targetMovieClip().container_mc.mWarning0;
      this.mWarning1 = (MovieClip)this.__get__targetMovieClip().container_mc.mWarning1;
      this.mWarning0._visible = this.mWarning1._visible = false;
      this.tRound0 = (TextField)this.__get__targetMovieClip().container_mc.tRound0;
      this.tRound1 = (TextField)this.__get__targetMovieClip().container_mc.tRound1;
      this.tRound0._visible = this.tRound1._visible = false;
      this.mStrongGroup = (MovieClip)this.__get__targetMovieClip().container_mc.mStrongGroup;
      this.mStrongGroup._visible = false;
      this.mStrongGroup2 = (MovieClip)this.__get__targetMovieClip().container_mc.mStrongGroup2;
      this.mStrongGroup2._visible = false;
      var _loc2_ = 0;
      while(_loc2_ < 3)
      {
         this.mStrongGroup["mStrong" + _loc2_].textField.text = _loc2_ + 1;
         this.mStrongGroup2["mStrong" + _loc2_].textField.text = _loc2_ + 1;
         this.mStrongGroup2["mStrong" + _loc2_].mBattle._visible = false;
         _loc2_ = _loc2_ + 1;
      }
      this.bInfo.addEventListener(gfx.events.EventTypes.CLICK,this,"ToGame_BFScoreBoard_RequestBFInfo");
      this.initInterval = setInterval(this,"initComp",100);
   }
   function initComp()
   {
      clearInterval(this.initInterval);
      this.ToGame_BFScoreBoard_Init();
      if(_global.gfxPlayer)
      {
         this.testInterval = setInterval(this,"testTick",500);
      }
   }
   function testTick()
   {
      clearInterval(this.testInterval);
      this.setViewVisible(true);
      this.OnGame_BFScoreBoard_SetData(this.BF_TYPE_HONOR);
      this.OnGame_BFScoreBoard_SetStrong(0,1);
      this.OnGame_BFScoreBoard_SetStrong(1,1,true);
      this.OnGame_BFScoreBoard_SetStrong(2,0,true);
   }
   function configGameInterface()
   {
      this.registerGameInterface("OnGame_BFScoreBoard_SetData",g4.util.Delegate.create(this,this.OnGame_BFScoreBoard_SetData));
      this.registerGameInterface("OnGame_BFScoreBoard_SetName",g4.util.Delegate.create(this,this.OnGame_BFScoreBoard_SetName));
      this.registerGameInterface("OnGame_BFScoreBoard_SetScore",g4.util.Delegate.create(this,this.OnGame_BFScoreBoard_SetScore));
      this.registerGameInterface("OnGame_BFScoreBoard_SetRound",g4.util.Delegate.create(this,this.OnGame_BFScoreBoard_SetRound));
      this.registerGameInterface("OnGame_BFScoreBoard_RoundScore",g4.util.Delegate.create(this,this.OnGame_BFScoreBoard_RoundScore));
      this.registerGameInterface("OnGame_BFScoreBoard_DepenceGage",g4.util.Delegate.create(this,this.OnGame_BFScoreBoard_DepenceGage));
      this.registerGameInterface("OnGame_BFScoreBoard_DangerEvent",g4.util.Delegate.create(this,this.OnGame_BFScoreBoard_DangerEvent));
      this.registerGameInterface("OnGame_BFScoreBoard_SetBonus",g4.util.Delegate.create(this,this.OnGame_BFScoreBoard_SetBonus));
      this.registerGameInterface("OnGame_BFScoreBoard_SetTimer",g4.util.Delegate.create(this,this.OnGame_BFScoreBoard_SetTimer));
      this.registerGameInterface("OnGame_BFScoreBoard_SetBattleState",g4.util.Delegate.create(this,this.OnGame_BFScoreBoard_SetBattleState));
      this.registerGameInterface("OnGame_BFScoreBoard_SetStrong",g4.util.Delegate.create(this,this.OnGame_BFScoreBoard_SetStrong));
      this.registerGameInterface("OnGame_BFInfoBoard_Close",g4.util.Delegate.create(this,this.OnGame_BFInfoBoard_Close));
      this.registerGameInterface("OnGame_BFScoreBoard_SetKey",g4.util.Delegate.create(this,this.OnGame_BFScoreBoard_SetKey));
      this.registerGameInterface("OnGame_BFInfoBoard_SetData",g4.util.Delegate.create(this,this.OnGame_BFInfoBoard_SetData));
      this.registerGameInterface("OnGame_BFScoreBoard_SetButton",g4.util.Delegate.create(this,this.OnGame_BFScoreBoard_SetButton));
      this.registerGameInterface("OnGame_BFScoreBoard_SetAbilityPoint",g4.util.Delegate.create(this,this.OnGame_BFScoreBoard_SetAbilityPoint));
      this.registerGameInterface("OnGame_BFScoreBoard_AddBuff",g4.util.Delegate.create(this,this.OnGame_BFScoreBoard_AddBuff));
      this.registerGameInterface("OnGame_BFScoreBoard_RemoveBuff",g4.util.Delegate.create(this,this.OnGame_BFScoreBoard_RemoveBuff));
   }
   function calcScore($myScore, $myGoalScore, $otherScore, $otherGoalScore)
   {
      this.tScoreB0.text = String($myScore);
      this.tMaxB0.text = "/" + String($myGoalScore);
      this.tScoreB1.text = String($otherScore);
      this.tMaxB1.text = "/" + String($otherGoalScore);
   }
   function getTimeString($time)
   {
      var _loc3_ = Math.floor($time / 60);
      var _loc2_ = $time % 60;
      var _loc1_ = "";
      if(_loc3_ < 10)
      {
         _loc1_ = "0";
      }
      _loc1_ = _loc1_ + (String(_loc3_) + " : ");
      if(_loc2_ < 10)
      {
         _loc1_ = _loc1_ + "0";
      }
      _loc1_ = _loc1_ + String(_loc2_);
      return _loc1_;
   }
   function setEndTime($time)
   {
      if($time == -1)
      {
         return undefined;
      }
      if(this._battleState == 0)
      {
         if(this._battleMode != this.BF_TYPE_HONOR && this._warningTime > $time)
         {
            this.tTime.textColor = lib.info.TextColor.GENERAL_CRITICAL;
         }
         else
         {
            this.tTime.textColor = 16777215;
         }
         this.tTime.text = this.getTimeString($time);
         this.mTime._visible = true;
      }
   }
   function setRunTime($time)
   {
      if($time == "" || $time == null)
      {
         return undefined;
      }
      var _loc3_ = lib.util.ExtString.split($time,"\t");
      var _loc4_ = Number(_loc3_[0]);
      var _loc2_ = Number(_loc3_[1]);
      if(_loc4_ != -1)
      {
         this.tRound0.text = "1R  " + this.getTimeString(_loc4_);
      }
      else
      {
         this.tRound0.text = "-";
      }
      if(_loc2_ != -1)
      {
         this.tRound1.text = "2R  " + this.getTimeString(_loc2_);
      }
      else
      {
         this.tRound1.text = "-";
      }
   }
   function OnGameEventShowWindow(windowName, bVisible)
   {
      if(windowName.toLowerCase() == this.getUIName().toLowerCase())
      {
         _root.OnGameEvent("OnGameEventShowUI","BFScoreInfo",bVisible);
         _root.OnGameEvent("OnGameEventShowUI","BFScoreResult",bVisible);
         this.setViewVisible(bVisible);
      }
   }
   function OnGame_BFScoreBoard_SetData($battleMode, $myScore, $myGoalScore, $otherScore, $otherGoalScore, $myBlnk, $otherBlink, $endTime, $warningTime, $myTeamName, $otherTeamName, $totalPlayerCount)
   {
      $battleMode = Number($battleMode);
      $myScore = Number($myScore);
      $myGoalScore = Number($myGoalScore);
      $otherScore = Number($otherScore);
      $otherGoalScore = Number($otherGoalScore);
      $myBlnk = Number($myBlnk);
      $otherBlink = Number($otherBlink);
      $endTime = Number($endTime);
      $warningTime = Number($warningTime);
      this._battleMode = $battleMode;
      this._warningTime = $warningTime;
      this.tTime.text = lib.util.UIString.getUIString("$274001");
      this.mTime._visible = false;
      lib.manager.ToolTip.remove(this.mTime);
      switch(this._battleMode)
      {
         case this.BF_TYPE_HONOR:
            this.tScoreA1._visible = _loc0_ = false;
            this.tScoreA0._visible = _loc0_;
            this.tScoreB1._visible = _loc0_ = true;
            this.tScoreB0._visible = _loc0_;
            this.tMaxB1._visible = _loc0_ = true;
            this.tMaxB0._visible = _loc0_;
            this.tScoreC1._visible = _loc0_ = false;
            this.tScoreC0._visible = _loc0_;
            this.calcScore($myScore,$myGoalScore,$otherScore,$otherGoalScore);
            this.mStrongGroup._visible = true;
            this.mStrongGroup2._visible = false;
            lib.manager.ToolTip.add(this.mTime,lib.util.UIString.getUIString("$274010"),1);
            break;
         case this.BF_TYPE_HONOR_RENEWAL:
            this.tScoreA1._visible = _loc0_ = false;
            this.tScoreA0._visible = _loc0_;
            this.tScoreB1._visible = _loc0_ = true;
            this.tScoreB0._visible = _loc0_;
            this.tMaxB1._visible = _loc0_ = true;
            this.tMaxB0._visible = _loc0_;
            this.tScoreC1._visible = _loc0_ = false;
            this.tScoreC0._visible = _loc0_;
            this.calcScore($myScore,$myGoalScore,$otherScore,$otherGoalScore);
            this.mStrongGroup._visible = false;
            this.mStrongGroup2._visible = true;
            var _loc2_ = 0;
            while(_loc2_ < 3)
            {
               this.mStrongGroup["mStrong" + _loc2_].mBattle._visible = false;
               this.mStrongGroup["mStrong" + _loc2_].mBattle.gotoAndStop(1);
               _loc2_ = _loc2_ + 1;
            }
            lib.manager.ToolTip.add(this.mTime,lib.util.UIString.getUIString("$274010"),1);
            break;
         case this.BF_TYPE_FIGHTING_SPIRIT:
            this.tScoreA1._visible = _loc0_ = true;
            this.tScoreA0._visible = _loc0_;
            this.tScoreB1._visible = _loc0_ = false;
            this.tScoreB0._visible = _loc0_;
            this.tMaxB1._visible = _loc0_ = false;
            this.tMaxB0._visible = _loc0_;
            this.tScoreC1._visible = _loc0_ = false;
            this.tScoreC0._visible = _loc0_;
            lib.manager.ToolTip.add(this.mTime,lib.util.UIString.getUIString("$274009"),1);
            break;
         case this.BF_TYPE_SATURATION:
            this.tScoreA1._visible = _loc0_ = false;
            this.tScoreA0._visible = _loc0_;
            this.tScoreB1._visible = _loc0_ = false;
            this.tScoreB0._visible = _loc0_;
            this.tMaxB1._visible = _loc0_ = false;
            this.tMaxB0._visible = _loc0_;
            this.tScoreC1._visible = _loc0_ = true;
            this.tScoreC0._visible = _loc0_;
            this.tRound1._visible = _loc0_ = true;
            this.tRound0._visible = _loc0_;
            lib.manager.ToolTip.add(this.mTime,lib.util.UIString.getUIString("$274009"),1);
            break;
         case this.BF_TYPE_KUMAS_WORLD:
            break;
         case this.BF_TYPE_PVE:
            this.tScoreA1._visible = _loc0_ = true;
            this.tScoreA0._visible = _loc0_;
            this.tScoreB1._visible = _loc0_ = false;
            this.tScoreB0._visible = _loc0_;
            this.tMaxB1._visible = _loc0_ = false;
            this.tMaxB0._visible = _loc0_;
            this.tScoreC1._visible = _loc0_ = false;
            this.tScoreC0._visible = _loc0_;
            break;
         case this.BF_TYPE_CONFUSION:
            this.tScoreA1._visible = _loc0_ = false;
            this.tScoreA0._visible = _loc0_;
            this.tScoreB1._visible = _loc0_ = true;
            this.tScoreB0._visible = _loc0_;
            this.tMaxB1._visible = _loc0_ = false;
            this.tMaxB0._visible = _loc0_;
            this.tScoreC1._visible = _loc0_ = false;
            this.tScoreC0._visible = _loc0_;
            this.calcScore($myScore,$myGoalScore,$otherScore,$otherGoalScore);
            this.mStrongGroup._visible = false;
            this.mStrongGroup2._visible = false;
            lib.manager.ToolTip.add(this.mTime,lib.util.UIString.getUIString("$274009"),1);
            break;
         case this.BF_TYPE_KUMAS_RENEWAL:
            this.tScoreA1._visible = _loc0_ = true;
            this.tScoreA0._visible = _loc0_;
            this.tScoreB1._visible = _loc0_ = false;
            this.tScoreB0._visible = _loc0_;
            this.tMaxB1._visible = _loc0_ = false;
            this.tMaxB0._visible = _loc0_;
            this.tScoreC1._visible = _loc0_ = false;
            this.tScoreC0._visible = _loc0_;
            lib.manager.ToolTip.add(this.mTime,lib.util.UIString.getUIString("$274009"),1);
      }
      if(this._battleMode == this.BF_TYPE_HONOR || this._battleMode == this.BF_TYPE_PVE)
      {
         this.calcScore($myScore,$myGoalScore,$otherScore,$otherGoalScore);
      }
      this.OnGame_BFScoreBoard_SetTimer($endTime,null);
   }
   function OnGame_BFScoreBoard_SetName($myTeamName, $otherTeamName)
   {
   }
   function OnGame_BFScoreBoard_SetScore($myScore, $myGoalScore, $otherScore, $otherGoalScore)
   {
      $myScore = Number($myScore);
      $myGoalScore = Number($myGoalScore);
      $otherScore = Number($otherScore);
      $otherGoalScore = Number($otherGoalScore);
      if(this._battleMode == this.BF_TYPE_HONOR || this._battleMode == this.BF_TYPE_PVE || this._battleMode == this.BF_TYPE_CONFUSION || this._battleMode == this.BF_TYPE_HONOR_RENEWAL)
      {
         this.calcScore($myScore,$myGoalScore,$otherScore,$otherGoalScore);
      }
   }
   function OnGame_BFScoreBoard_SetRound($myRound, $otherRound, $totalRound)
   {
   }
   function OnGame_BFScoreBoard_RoundScore($myRoundScore, $otherRoundScore)
   {
      this.mRoundGroup._visible = true;
      var _loc3_ = lib.util.ExtString.split($myRoundScore,"\t");
      var _loc4_ = lib.util.ExtString.split($otherRoundScore,"\t");
      var _loc6_ = 0;
      var _loc5_ = 0;
      var _loc2_ = 0;
      while(_loc2_ < 3)
      {
         (MovieClip)this.mRoundGroup["mBlue" + _loc2_].gotoAndStop(Number(_loc3_[_loc2_]) + 1);
         (MovieClip)this.mRoundGroup["mRed" + _loc2_].gotoAndStop(Number(_loc4_[_loc2_]) + 1);
         if(Number(_loc3_[_loc2_]) == 1)
         {
            _loc6_ = _loc6_ + 1;
         }
         if(Number(_loc4_[_loc2_]) == 1)
         {
            _loc5_ = _loc5_ + 1;
         }
         _loc2_ = _loc2_ + 1;
      }
      this.tScoreA0.text = String(_loc6_);
      this.tScoreA1.text = String(_loc5_);
   }
   function OnGame_BFScoreBoard_DepenceGage($focus, $remain, $total)
   {
      $focus = Number($focus);
      $remain = Number($remain);
      $total = Number($total);
      var _loc2_ = $remain / $total;
      _loc2_ = Math.round(_loc2_ * 100);
      var _loc6_ = $focus != 0?this._nGauge1:this._nGauge0;
      var _loc5_ = (TextField)this["tScoreC" + $focus];
      _loc5_.htmlText = String(_loc2_) + "<font size=\'15\'> %</font>";
      if(_loc2_ < _loc6_)
      {
         var _loc4_ = (MovieClip)this["mWarning" + $focus];
         if(!_loc4_._visible)
         {
            _loc4_._visible = true;
            _loc4_.gotoAndPlay(2);
         }
      }
      if($focus == 0)
      {
         this._nGauge0 = _loc2_;
      }
      else if($focus == 1)
      {
         this._nGauge1 = _loc2_;
      }
   }
   function OnGame_BFScoreBoard_DangerEvent($focus, $bool)
   {
      return undefined;
   }
   function OnGame_BFScoreBoard_SetBonus($team, $bonusText, $bonusScore)
   {
   }
   function OnGame_BFScoreBoard_SetTimer($endTime, $runTime)
   {
      this.setEndTime($endTime);
      this.setRunTime($runTime);
   }
   function OnGame_BFScoreBoard_SetBattleState($state, $fieldType)
   {
      this._battleState = Number($state);
      if(this._battleState == -1)
      {
         this.tTime.text = lib.util.UIString.getUIString("$274001");
         this.mTime._visible = false;
      }
      else if(this._battleState > 0)
      {
         this.tTime.text = lib.util.UIString.getUIString("$274002");
         this.mTime._visible = false;
      }
      else
      {
         this.tTime.text = "";
         this.mTime._visible = false;
      }
   }
   function OnGame_BFScoreBoard_SetStrong($index, $type, $inBattle)
   {
      $index = Number($index);
      $type = Number($type);
      if($inBattle == null)
      {
         $inBattle = false;
      }
      var _loc3_ = undefined;
      if(this._battleMode == this.BF_TYPE_HONOR)
      {
         _loc3_ = this.mStrongGroup;
      }
      else if(this._battleMode == this.BF_TYPE_HONOR_RENEWAL)
      {
         _loc3_ = this.mStrongGroup2;
      }
      var _loc4_ = $type + 1;
      if(this._battleMode == this.BF_TYPE_HONOR)
      {
         _loc3_["mStrong" + $index].textField.textColor = 16777215;
         _loc3_["mStrong" + $index].gotoAndStop(_loc4_);
      }
      else if(this._battleMode == this.BF_TYPE_HONOR_RENEWAL)
      {
         _loc3_["mStrong" + $index].gotoAndStop(_loc4_);
         _loc3_["mStrong" + $index].textField.text = $index + 1;
         _loc3_["mStrong" + $index].mBattle.mc.gotoAndStop(_loc4_);
         if($inBattle)
         {
            if(_loc3_["mStrong" + $index].mBattle._visible == false)
            {
               _loc3_["mStrong" + $index].mBattle._visible = true;
               _loc3_["mStrong" + $index].mBattle.gotoAndPlay(2);
               _loc3_["mStrong" + $index].textField._visible = false;
            }
         }
         else
         {
            _loc3_["mStrong" + $index].mBattle._visible = false;
            _loc3_["mStrong" + $index].mBattle.gotoAndStop(1);
            _loc3_["mStrong" + $index].textField._visible = true;
         }
      }
   }
   function OnGame_BFInfoBoard_Close()
   {
   }
   function OnGame_BFScoreBoard_SetKey($keyCode)
   {
   }
   function OnGame_BFInfoBoard_SetData($bfType, $myTeamList, $otherTeamList, $battleTime, $teamStrScore, $outRemainTime, $battleResult)
   {
   }
   function OnGame_BFScoreBoard_SetButton($button0, $button1, $button2, $button3)
   {
      $button0 = Number($button0);
      $button1 = Number($button1);
      $button2 = Number($button2);
      $button3 = Number($button3);
      this.bInfo._visible = $button1 == 1;
   }
   function OnGame_BFScoreBoard_SetAbilityPoint($point)
   {
   }
   function OnGame_BFScoreBoard_AddBuff($team, $id, $type, $img, $stack, $remain, $total)
   {
   }
   function OnGame_BFScoreBoard_RemoveBuff($team, $id, $type)
   {
   }
   function ToGame_BFScoreBoard_Init()
   {
      fscommand("ToGame_BFScoreBoard_Init");
   }
   function ToGame_BFScoreBoard_RequestBFInfo()
   {
      lib.manager.UISound.play("3023");
      fscommand("ToGame_BFScoreBoard_RequestBFInfo");
   }
   function ToGame_BFScoreBoard_RequestBFTeam()
   {
   }
   function ToGame_BFScoreBoard_RequestBFSkill()
   {
   }
   function ToGame_BFScoreBoard_RequestBFGuide()
   {
   }
   function ToGame_BFScoreBoard_CloseUI()
   {
   }
}
