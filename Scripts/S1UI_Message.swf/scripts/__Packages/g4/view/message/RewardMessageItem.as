class g4.view.message.RewardMessageItem extends gfx.core.UIComponent
{
   var delay = 3000;
   var sizeScale = 0.5;
   var gradeScale = 0.75;
   function RewardMessageItem()
   {
      super();
   }
   function onLoad()
   {
      this.textField.verticalAlign = "center";
      g4.util.UIUtil.setTextFieldStyle(this.textField,g4.util.UIUtil.TEXT_FIELD_STYLE_1);
   }
   function setRewardData($data)
   {
      this.resetData();
      if($data.substring(1,5) == "item")
      {
         var _loc9_ = $data.indexOf("<");
         var _loc8_ = $data.indexOf(">") + 1;
         var _loc10_ = $data.substring(_loc9_,_loc8_);
         var _loc3_ = lib.util.ExtString.findTag(_loc10_,"item");
         var _loc2_ = _loc3_[0].src;
         var _loc6_ = Number(_loc3_[0].grade);
         var _loc7_ = Number(_loc3_[0].count);
         var _loc5_ = lib.util.ExtString.split($data,"\t")[1];
         if(_loc7_ > 0)
         {
            _loc5_ = _loc5_ + ("(" + _loc7_ + ")");
         }
         this.textField.textAutoSize = "none";
         this.textField.htmlText = _loc5_;
         if(this.textField.numLines > 2)
         {
            this.textField.textAutoSize = "shrink";
         }
         if(_loc2_.indexOf("Icon_Achievement") != -1)
         {
            _loc2_ = _loc2_ + "_U";
            this.sizeScale = 0.35555555555555557;
         }
         else
         {
            this.sizeScale = 0.5;
         }
         lib.display.DrawBitmapData.draw(this.mImg,_loc2_,0,0,0,0,32,32,this.sizeScale);
         if(_loc6_ > 0)
         {
            this.mGrade._visible = true;
            this.mGrade.gotoAndStop(_loc6_);
         }
         else
         {
            this.mGrade._visible = false;
         }
         this.mEffect.gotoAndPlay(2);
      }
      g4.util.TweenX.killTweenOf(this);
      this._alpha = 100;
      this.__set__visible(true);
   }
   function expire()
   {
      g4.util.TweenX.to(this,0.5,{_alpha:0},gs.easing.Linear.easeNone,this);
   }
   function onComplete()
   {
      this._alpha = 100;
      this.__set__visible(false);
      this.dispatchEvent({type:gfx.events.EventTypes.COMPLETE});
   }
   function resetData()
   {
      g4.util.TweenX.killTweenOf(this);
      this._alpha = 100;
      this.__set__visible(false);
      this._y = 0;
   }
}
