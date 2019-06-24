class g4.view.bfScoreResult.MyScore extends g4.core.SimpleView
{
   var FPS = 24;
   var TWEEN_DELAY_SEC = 0.2;
   var TEAM_TYPE_BLUE = 0;
   var TEAM_TYPE_RED = 1;
   var SCORE_COUNT = 5;
   var TWEEN_SEC = 0.8;
   var noData = true;
   var showEnabled = false;
   var regX = 0;
   function MyScore(targetMovieClip)
   {
      super(targetMovieClip);
      this.configUI();
   }
   function configUI()
   {
      this.__get__targetMovieClip().text_title.verticalAlign = "center";
      this.__get__targetMovieClip().text_title.autoSize = "left";
      this.__get__targetMovieClip().text_title.text = lib.util.UIString.getUIString("$271032");
      this.__get__targetMovieClip().mc_ranking.mc_text.text_rank.autoSize = "center";
      this.__get__targetMovieClip().mc_ranking.mc_text2.text_rank.autoSize = "center";
      this.regX = Math.floor(this.__get__targetMovieClip().mc_ranking._x - this.__get__targetMovieClip().mc_ranking.mc_text.text_rank.textWidth / 2);
      this.__get__targetMovieClip().text_ranking_total.autoSize = "left";
      this.updatePlayerCount();
      this.configScoreTextField(lib.util.UIString.getUIString("$271033"),this.__get__targetMovieClip().text_score_0_title,this.__get__targetMovieClip().text_score_0);
      this.configScoreTextField(lib.util.UIString.getUIString("$271034"),this.__get__targetMovieClip().text_score_1_title,this.__get__targetMovieClip().text_score_1);
      this.configScoreTextField(lib.util.UIString.getUIString("$271035"),this.__get__targetMovieClip().text_score_2_title,this.__get__targetMovieClip().text_score_2);
      this.configScoreTextField(lib.util.UIString.getUIString("$271036"),this.__get__targetMovieClip().text_score_3_title,this.__get__targetMovieClip().text_score_3);
      this.configScoreTextField(lib.util.UIString.getUIString("$271037"),this.__get__targetMovieClip().text_score_4_title,this.__get__targetMovieClip().text_score_4);
      this.cleanUp();
      this.cleanUpData();
      g4.model.GameModel.addEventListener(g4.view.ViewID.BF_SCORE_RESULT,g4.model.GameModelEventType.BATTLE_FIELD_PLAYER_COUNT_CHANGE,this,"model_battleFieldPlayerCountChangeHandler");
   }
   function configScoreTextField(titleText, textFieldTitle, textFieldValue)
   {
      textFieldTitle.verticalAlign = "center";
      textFieldTitle.textAutoSize = "shrink";
      textFieldTitle.text = titleText;
      textFieldTitle.multiline = true;
      textFieldTitle.wordWrap = true;
      textFieldValue.verticalAlign = "center";
      textFieldValue.autoSize = "center";
   }
   function cleanUp()
   {
      this.showEnabled = false;
      this.cleanUpData();
   }
   function cleanUpData()
   {
      this.noData = true;
      this.stopEnterFrame();
      this.__get__targetMovieClip().mc_ranking.gotoAndStop(1);
      this.setMyRank("-");
      this.__get__targetMovieClip().text_score_0.text = "";
      this.__get__targetMovieClip().text_score_1.text = "";
      this.__get__targetMovieClip().text_score_2.text = "";
      this.__get__targetMovieClip().text_score_3.text = "";
      this.__get__targetMovieClip().text_score_4.text = "";
   }
   function stopEnterFrame()
   {
      delete this.__get__targetMovieClip().onEnterFrame;
      this.tweenFuncArray = [];
   }
   function setScoreData(blueTeamScore, redTeamScore)
   {
      this.blueTeamScore = blueTeamScore;
      this.redTeamScore = redTeamScore;
   }
   function setMyIndex(myIndex, myTeamIndex)
   {
      var _loc5_ = undefined;
      if(myTeamIndex == this.TEAM_TYPE_BLUE)
      {
         _loc5_ = this.blueTeamScore;
      }
      else
      {
         _loc5_ = this.redTeamScore;
      }
      var _loc4_ = lib.util.ExtString.split(_loc5_,"\n");
      if(myIndex < 0 || myIndex > _loc4_.length - 1)
      {
         this.cleanUpData();
         return undefined;
      }
      var _loc2_ = lib.util.ExtString.split(_loc4_[myIndex],"\t");
      var _loc3_ = 2;
      this.setData(String(_loc2_[_loc3_ + 0]),Number(_loc2_[_loc3_ + 3]),Number(_loc2_[_loc3_ + 4]),Number(_loc2_[_loc3_ + 5]),Number(_loc2_[_loc3_ + 6]),Number(_loc2_[_loc3_ + 7]));
   }
   function setData(ranking, score0, score1, score2, score3, score4)
   {
      this.cleanUpData();
      this.setTweenMyRank(ranking,-1);
      this.setTweenMyScore(this.__get__targetMovieClip().text_score_0,score0,0);
      this.setTweenMyScore(this.__get__targetMovieClip().text_score_1,score1,1);
      this.setTweenMyScore(this.__get__targetMovieClip().text_score_2,score2,2);
      this.setTweenMyScore(this.__get__targetMovieClip().text_score_3,score3,3);
      this.setTweenMyScore(this.__get__targetMovieClip().text_score_4,score4,4);
      this.noData = false;
      this._show();
   }
   function show()
   {
      this.showEnabled = true;
      this._show();
   }
   function _show()
   {
      if(this.noData)
      {
         return undefined;
      }
      if(!this.showEnabled)
      {
         return undefined;
      }
      this.__get__targetMovieClip().onEnterFrame = mx.utils.Delegate.create(this,this.onEnterFrame_forTween);
   }
   function onEnterFrame_forTween()
   {
      if(this.tweenFuncArray == null || this.tweenFuncArray.length == 0)
      {
         this.stopEnterFrame();
      }
      var _loc3_ = true;
      var _loc2_ = this.tweenFuncArray.length;
      while((_loc2_ = _loc2_ - 1) >= 0)
      {
         if(this.tweenFuncArray.register2())
         {
            _loc3_ = false;
         }
         else
         {
            this.tweenFuncArray.splice(_loc2_,1);
         }
      }
      if(_loc3_)
      {
         this.stopEnterFrame();
      }
   }
   function setTweenMyRank(value, order)
   {
      var _loc4_ = this.SCORE_COUNT - (order + 1);
      var skipFrame = Math.ceil(this.FPS * this.TWEEN_DELAY_SEC * _loc4_);
      var _loc2_ = 1;
      if(value != "-")
      {
         _loc2_ = String(value).length;
      }
      var randValueMin = Math.pow(10,_loc2_ - 1);
      var randValueMax = randValueMin * 10 - 1;
      var tweenFrame = Math.ceil(this.FPS * this.TWEEN_SEC);
      this.setMyRank("-");
      var _loc3_ = mx.utils.Delegate.create(this,function()
      {
         if(skipFrame > 0)
         {
            skipFrame--;
            return true;
         }
         if(tweenFrame > 0)
         {
            tweenFrame--;
            this.setMyRank(String(this.randRange(randValueMin,randValueMax)));
            return true;
         }
         this.setMyRank(value);
         this.targetMovieClip.mc_ranking.gotoAndPlay(1);
         return false;
      }
      );
      this.tweenFuncArray.push(_loc3_);
   }
   function setMyRank(value)
   {
      if(value == "-")
      {
         value = "#";
      }
      else
      {
         value = "#" + value;
      }
      this.__get__targetMovieClip().mc_ranking.mc_text.text_rank.text = value;
      this.__get__targetMovieClip().mc_ranking.mc_text2.text_rank.text = value;
      var _loc4_ = this.__get__targetMovieClip().mc_ranking.mc_text.text_rank.textWidth;
      this.__get__targetMovieClip().mc_ranking._x = this.regX + _loc4_ / 2;
      var _loc5_ = -8;
      var _loc3_ = Math.floor(this.regX + _loc4_ + 4 + _loc5_);
      this.__get__targetMovieClip().mc_slash._x = _loc3_;
      _loc3_ = _loc3_ + Math.floor(this.__get__targetMovieClip().mc_slash._width + _loc5_);
      this.__get__targetMovieClip().text_ranking_total._x = _loc3_;
   }
   function setTweenMyScore(textField, finalValue, order)
   {
      if(isNaN(finalValue))
      {
         finalValue = 0;
      }
      var _loc4_ = this.SCORE_COUNT - (order + 1);
      var skipFrame = Math.ceil(this.FPS * this.TWEEN_DELAY_SEC * _loc4_);
      var _loc2_ = String(finalValue).length;
      var randValueMin = Math.pow(10,_loc2_ - 1);
      var randValueMax = randValueMin * 10 - 1;
      var tweenFrame = Math.ceil(this.FPS * this.TWEEN_SEC);
      textField.text = "0";
      var _loc3_ = mx.utils.Delegate.create(this,function()
      {
         if(skipFrame > 0)
         {
            skipFrame--;
            return true;
         }
         if(tweenFrame > 0)
         {
            tweenFrame--;
            textField.text = lib.util.CurrencyFormat.makeComma(this.randRange(randValueMin,randValueMax));
            return true;
         }
         textField.text = lib.util.CurrencyFormat.makeComma(finalValue);
         return false;
      }
      );
      this.tweenFuncArray.push(_loc3_);
   }
   function randRange(min, max)
   {
      return Math.floor(Math.random() * (max - min + 1)) + min;
   }
   function updatePlayerCount()
   {
      this.setTotalPlayerCount(g4.model.GameModel.battleFieldModel.__get__playerCount());
   }
   function setTotalPlayerCount(value)
   {
      if(value > 0)
      {
         this.__get__targetMovieClip().text_ranking_total.text = String(value);
      }
      else
      {
         this.__get__targetMovieClip().text_ranking_total.text = "";
      }
   }
   function model_battleFieldPlayerCountChangeHandler(event)
   {
      this.updatePlayerCount();
   }
}
