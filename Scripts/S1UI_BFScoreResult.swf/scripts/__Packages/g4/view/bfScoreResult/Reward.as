class g4.view.bfScoreResult.Reward extends g4.core.SimpleView
{
   function Reward(targetMovieClip)
   {
      super(targetMovieClip);
      this.configUI();
   }
   function configUI()
   {
      this.__get__targetMovieClip().text_title.verticalAlign = "center";
      this.__get__targetMovieClip().text_title.autoSize = "left";
      this.__get__targetMovieClip().text_title.text = lib.util.UIString.getUIString("$271038");
      this.__get__targetMovieClip().text_description.textAutoSize = "shrink";
      this.__get__targetMovieClip().text_description.text = "";
      this.__get__targetMovieClip().text_description.multiline = true;
      this.__get__targetMovieClip().text_description.wordWrap = true;
      this.rewardItem = new g4.view.bfScoreResult.RewardItem(this.__get__targetMovieClip().mc_reward_0);
      this.cleanUp();
   }
   function show()
   {
   }
   function setRewardData(hasReward, value)
   {
      this.cleanUp();
      if(hasReward)
      {
         var _loc3_ = lib.util.ExtString.split(value,"\n");
         if(_loc3_ == null || _loc3_.length == 0)
         {
            return undefined;
         }
         var _loc2_ = lib.util.ExtString.split(_loc3_[0],"\t");
         this.rewardItem.setData(Number(_loc2_[0]),String(_loc2_[1]),String(_loc2_[2]),Number(_loc2_[3]));
         this.setRewardVisible(true,false);
      }
      else
      {
         this.__get__targetMovieClip().text_description.text = value;
         this.setRewardVisible(false,true);
      }
   }
   function cleanUp()
   {
      this.setRewardVisible(false,false);
   }
   function setRewardVisible(visibleReward, visibleDescription)
   {
      this.__get__targetMovieClip().mc_reward_0._visible = visibleReward;
      this.__get__targetMovieClip().text_description._visible = visibleDescription;
   }
}
