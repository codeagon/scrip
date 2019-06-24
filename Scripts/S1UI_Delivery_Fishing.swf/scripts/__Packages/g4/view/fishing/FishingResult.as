class g4.view.fishing.FishingResult extends gfx.core.UIComponent
{
   function FishingResult()
   {
      super();
   }
   function onLoad()
   {
      this.items_pool = [];
      this.items_active = [];
   }
   function resetItems()
   {
      while(this.items_active.length > 0)
      {
         var _loc2_ = (MovieClip)this.items_active.pop();
         _loc2_._visible = false;
         this.items_pool.push(_loc2_);
      }
   }
   function getItem()
   {
      var _loc2_ = undefined;
      if(this.items_pool.length > 0)
      {
         _loc2_ = (MovieClip)this.items_pool.pop();
      }
      else
      {
         var _loc3_ = this.mAddPoint.getNextHighestDepth();
         _loc2_ = this.mAddPoint.attachMovie("FishingResultItem","item" + _loc3_,_loc3_);
      }
      this.items_active.push(_loc2_);
      _loc2_._visible = true;
      return _loc2_;
   }
   function setResult($result, $resultItem)
   {
      if($result == 0)
      {
         this.mText.gotoAndStop(2);
         this.mText.textField.text = "낚시 실패";
         this.mAddPoint._visible = false;
      }
      else if($result == 1)
      {
         this.mText.gotoAndStop(1);
         this.mText.textField.text = "낚시 성공";
         this.mAddPoint._visible = true;
         this.resetItems();
         var _loc7_ = lib.util.ExtString.split($resultItem,"\n");
         var _loc6_ = _loc7_.length;
         var _loc5_ = 350 - (_loc6_ * 64 + (_loc6_ - 1) * 2) / 2;
         var _loc4_ = 0;
         while(_loc4_ < _loc6_)
         {
            var _loc2_ = lib.util.ExtString.split(_loc7_[_loc4_],"\t");
            var _loc3_ = this.getItem();
            _loc3_._x = _loc5_;
            _loc5_ = _loc5_ + 66;
            _loc3_.mGrade.gotoAndStop(_loc2_[3]);
            lib.util.DrawBitmap.draw(_loc3_.mAddPoint,_loc2_[1],60,60);
            if(_loc2_[2] != null && _loc2_[2] > 1)
            {
               _loc3_.tQuantity.text = _loc2_[2];
            }
            else
            {
               _loc3_.tQuantity.text = "";
            }
            _loc4_ = _loc4_ + 1;
         }
      }
      this.gotoAndPlay(2);
   }
   function animComp()
   {
      this.__set__visible(false);
      this.dispatchEvent({type:gfx.events.EventTypes.COMPLETE});
   }
}
