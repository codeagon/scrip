class g4.view.bfScoreResult.ScoreList extends g4.core.SimpleView
{
   var SCORE_ITEM_COUNT = 15;
   var ROW_DISPLAY_DELAY = 800;
   var TEAM_TYPE_BLUE = 0;
   var TEAM_TYPE_RED = 1;
   function ScoreList(targetMovieClip)
   {
      super(targetMovieClip);
      this.configUI();
   }
   function configUI()
   {
      this.itemAArray = [];
      this.itemBArray = [];
      var _loc2_ = undefined;
      var _loc3_ = this.SCORE_ITEM_COUNT;
      _loc2_ = 0;
      while(_loc2_ < _loc3_)
      {
         this.itemAArray.push(new g4.view.bfScoreResult.ScoreListItem(this.__get__targetMovieClip()["item_a_" + _loc2_],_loc2_));
         this.itemBArray.push(new g4.view.bfScoreResult.ScoreListItem(this.__get__targetMovieClip()["item_b_" + _loc2_],_loc2_));
         _loc2_ = _loc2_ + 1;
      }
      this.cleanUp();
   }
   function cleanUp()
   {
      this.cleanUpUIState();
   }
   function cleanUpUIState()
   {
      var _loc3_ = undefined;
      var _loc2_ = undefined;
      var _loc4_ = this.SCORE_ITEM_COUNT;
      _loc2_ = 0;
      while(_loc2_ < _loc4_)
      {
         _loc3_ = (g4.view.bfScoreResult.ScoreListItem)this.itemAArray[_loc2_];
         _loc3_.cleanUpUIState();
         _loc3_ = (g4.view.bfScoreResult.ScoreListItem)this.itemBArray[_loc2_];
         _loc3_.cleanUpUIState();
         _loc2_ = _loc2_ + 1;
      }
   }
   function show()
   {
      this.cleanUpUIState();
      this.showRows();
   }
   function setScoreData(blueTeamScore, redTeamScore)
   {
      this._setScoreData(blueTeamScore,this.itemAArray);
      this._setScoreData(redTeamScore,this.itemBArray);
   }
   function _setScoreData(dataList, itemArray)
   {
      var _loc6_ = lib.util.ExtString.split(dataList,"\n");
      var _loc7_ = _loc6_.length;
      var _loc2_ = undefined;
      var _loc5_ = undefined;
      var _loc3_ = 2;
      var _loc4_ = undefined;
      _loc4_ = 0;
      while(_loc4_ < this.SCORE_ITEM_COUNT)
      {
         _loc5_ = (g4.view.bfScoreResult.ScoreListItem)itemArray[_loc4_];
         if(_loc4_ < _loc7_)
         {
            _loc2_ = lib.util.ExtString.split(_loc6_[_loc4_],"\t");
            _loc5_.setData(String(_loc2_[_loc3_ + 0]),Number(_loc2_[_loc3_ + 2]),String(_loc2_[_loc3_ + 1]),Number(_loc2_[_loc3_ + 3]),Number(_loc2_[_loc3_ + 4]),Number(_loc2_[_loc3_ + 5]),Number(_loc2_[_loc3_ + 6]),Number(_loc2_[_loc3_ + 7]));
         }
         else
         {
            _loc5_.cleanUpData();
         }
         _loc4_ = _loc4_ + 1;
      }
   }
   function showRows()
   {
      var _loc3_ = undefined;
      var _loc2_ = undefined;
      var _loc4_ = this.SCORE_ITEM_COUNT;
      _loc2_ = 0;
      while(_loc2_ < _loc4_)
      {
         _loc3_ = (g4.view.bfScoreResult.ScoreListItem)this.itemAArray[_loc2_];
         _loc3_.show();
         _loc3_ = (g4.view.bfScoreResult.ScoreListItem)this.itemBArray[_loc2_];
         _loc3_.show();
         _loc2_ = _loc2_ + 1;
      }
   }
   function setMyIndex(myIndex, myTeamIndex)
   {
      var _loc2_ = undefined;
      _loc2_ = 0;
      while(_loc2_ < this.SCORE_ITEM_COUNT)
      {
         (g4.view.bfScoreResult.ScoreListItem)this.itemAArray[_loc2_].setHighlight(myTeamIndex == this.TEAM_TYPE_BLUE && _loc2_ == myIndex);
         (g4.view.bfScoreResult.ScoreListItem)this.itemBArray[_loc2_].setHighlight(myTeamIndex == this.TEAM_TYPE_RED && _loc2_ == myIndex);
         _loc2_ = _loc2_ + 1;
      }
   }
}
