class com.bluehole.tera.view.components.quickSlot.BaseQuickSlot extends com.bluehole.tera.view.core.WidgetContainer
{
   var sUIRotate = "DEFAULT";
   function BaseQuickSlot()
   {
      super();
   }
   function checkDragArea(bool)
   {
      if(!bool)
      {
         delete this.onMouseMove;
      }
      else
      {
         this.onMouseMove = function()
         {
            var _loc6_ = Stage.width;
            var _loc9_ = Stage.height;
            var _loc8_ = this._x;
            var _loc5_ = this._y;
            var _loc4_ = this.titleBtn.width >> 1;
            var _loc7_ = _loc6_ - _loc4_ * 4;
            var _loc3_ = {x:_loc8_,y:_loc5_};
            this.localToGlobal(_loc3_);
            var _loc2_ = undefined;
            if(_loc3_.x < _loc4_)
            {
               _loc2_ = "TO_THE_LEFT";
            }
            else if(_loc3_.x > _loc7_)
            {
               _loc2_ = "TO_THE_RIGHT";
            }
            else
            {
               _loc2_ = "DEFAULT";
            }
            if(this.sUIRotate != _loc2_)
            {
               this.sUIRotate = _loc2_;
               this.setUIPosition(this.sUIRotate);
            }
         };
      }
   }
   function setUIPosition(sPosition)
   {
   }
   function setElementPosition(sPosition)
   {
   }
   function handleTitleDragStart()
   {
      super.handleTitleDragStart();
      this.checkDragArea(true);
   }
   function handleTitleDragStop()
   {
      super.handleTitleDragStop();
      this.checkDragArea(false);
   }
}
