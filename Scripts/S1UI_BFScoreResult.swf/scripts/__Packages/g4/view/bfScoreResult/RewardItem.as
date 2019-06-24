class g4.view.bfScoreResult.RewardItem extends g4.core.SimpleView
{
   var SHOW_DELAY = 0.05;
   var ICON_SIZE = 64;
   var index = 0;
   var actualIconSize = 64;
   function RewardItem(targetMovieClip, index)
   {
      super(targetMovieClip);
      this.index = index;
      this.configUI();
   }
   function configUI()
   {
      this.__get__targetMovieClip().mc.mc_tool_tip._alpha = 0;
      this.__get__targetMovieClip().mc.text_name.verticalAlign = "center";
      this.__get__targetMovieClip().mc.text_name.textAutoSize = "shrink";
      this.__get__targetMovieClip().mc.text_count.verticalAlign = "center";
      this.__get__targetMovieClip().mc.text_count.textAutoSize = "shrink";
      this.mc_icon_area = this.__get__targetMovieClip().mc.createEmptyMovieClip("mc_icon_area",this.__get__targetMovieClip().mc.getNextHighestDepth());
      this.mc_icon_area._x = this.__get__targetMovieClip().mc.mc_img._x;
      this.mc_icon_area._y = this.__get__targetMovieClip().mc.mc_img._y;
      this.actualIconSize = this.__get__targetMovieClip().mc.mc_img._width;
      this.__get__targetMovieClip().mc.mc_img.swapDepths(this.__get__targetMovieClip().mc.getNextHighestDepth());
      this.__get__targetMovieClip().mc.mc_img.removeMovieClip();
      this.cleanUp();
   }
   function cleanUp()
   {
      this.cleanUpData();
   }
   function setData(id, imgPath, name, count)
   {
      this.__get__targetMovieClip().mc.text_name.text = name;
      this.__get__targetMovieClip().mc.text_count.text = String(count);
      var _loc5_ = flash.display.BitmapData.loadBitmap(imgPath);
      this.mc_icon_area.clear();
      var _loc2_ = this.actualIconSize / this.ICON_SIZE;
      lib.display.DrawBitmapData.draw(this.mc_icon_area,_loc5_,0,0,0,0,this.actualIconSize,this.actualIconSize,_loc2_,_loc2_,false);
      var _loc4_ = "ToGame_ToolTip_RequestBFInfoBoardReward\t" + id;
      var _loc3_ = 100;
      lib.manager.ToolTip.add(this.__get__targetMovieClip().mc.mc_tool_tip,_loc4_,_loc3_);
   }
   function cleanUpData()
   {
      this.__get__targetMovieClip().mc.text_name.text = "";
      this.__get__targetMovieClip().mc.text_count.text = "";
      this.mc_icon_area.clear();
      lib.manager.ToolTip.remove(this.__get__targetMovieClip().mc.mc_tool_tip);
   }
}
