class g4.view.bfScoreResult.ScoreListItem extends g4.core.SimpleView
{
   var SHOW_DELAY = 0.03;
   var index = 0;
   var timeoutID = 0;
   var noData = true;
   function ScoreListItem(targetMovieClip, index)
   {
      super(targetMovieClip);
      this.index = index;
      this.configUI();
   }
   function configUI()
   {
      this.configTextField(this.__get__targetMovieClip().mc_row.mc_normal);
      this.configTextField(this.__get__targetMovieClip().mc_row.mc_me);
      this.cleanUpUIState();
      this.cleanUpData();
   }
   function configTextField(mc)
   {
      mc.text_ranking.verticalAlign = "center";
      mc.text_name.verticalAlign = "center";
      mc.text_score_a.verticalAlign = "center";
      mc.text_score_b.verticalAlign = "center";
      mc.text_score_c.verticalAlign = "center";
      mc.text_score_d.verticalAlign = "center";
      mc.text_score.verticalAlign = "center";
   }
   function show()
   {
      var _loc2_ = this.SHOW_DELAY * this.index * 1000;
      this.cleanUpTimeout();
      this.timeoutID = setTimeout(mx.utils.Delegate.create(this,this._show),_loc2_);
   }
   function cleanUpTimeout()
   {
      if(this.timeoutID != 0)
      {
         clearTimeout(this.timeoutID);
      }
      this.timeoutID = 0;
   }
   function cleanUpUIState()
   {
      this.cleanUpTimeout();
      this.__get__targetMovieClip().gotoAndStop(2);
   }
   function setHighlight(value)
   {
      if(value)
      {
         this.__get__targetMovieClip().mc_row.mc_me._visible = true;
         this.__get__targetMovieClip().mc_row.mc_normal._visible = false;
         this.__get__targetMovieClip().mc_row.mc_me.mc_bg.play();
      }
      else
      {
         this.__get__targetMovieClip().mc_row.mc_me._visible = false;
         this.__get__targetMovieClip().mc_row.mc_normal._visible = true;
         this.__get__targetMovieClip().mc_row.mc_me.mc_bg.stop();
      }
   }
   function _show()
   {
      if(this.noData)
      {
         return undefined;
      }
      this.__get__targetMovieClip().gotoAndPlay(3);
   }
   function setData(ranking, clazz, userName, kill, attack, healing, technique, totalScore)
   {
      this._setData(this.__get__targetMovieClip().mc_row.mc_normal,ranking,clazz,userName,kill,attack,healing,technique,totalScore);
      this._setData(this.__get__targetMovieClip().mc_row.mc_me,ranking,clazz,userName,kill,attack,healing,technique,totalScore);
      this.noData = false;
   }
   function _setData(mc, ranking, clazz, userName, kill, attack, healing, technique, totalScore)
   {
      mc.mc_class.gotoAndStop(clazz + 1);
      mc.text_ranking.text = ranking;
      mc.text_name.text = userName;
      mc.text_score_a.text = lib.util.CurrencyFormat.makeComma(kill);
      mc.text_score_b.text = lib.util.CurrencyFormat.makeComma(attack);
      mc.text_score_c.text = lib.util.CurrencyFormat.makeComma(healing);
      mc.text_score_d.text = lib.util.CurrencyFormat.makeComma(technique);
      mc.text_score.text = lib.util.CurrencyFormat.makeComma(totalScore);
   }
   function cleanUpData()
   {
      this.setHighlight(false);
      this._cleanUpData(this.__get__targetMovieClip().mc_row.mc_normal);
      this._cleanUpData(this.__get__targetMovieClip().mc_row.mc_mc);
      this.noData = true;
   }
   function _cleanUpData(mc)
   {
      mc.mc_class.gotoAndStop(1);
      mc.text_ranking.text = "";
      mc.text_name.text = "";
      mc.text_score_a.text = "";
      mc.text_score_b.text = "";
      mc.text_score_c.text = "";
      mc.text_score_d.text = "";
      mc.text_score.text = "";
   }
}
