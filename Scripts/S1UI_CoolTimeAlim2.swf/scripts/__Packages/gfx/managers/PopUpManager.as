class gfx.managers.PopUpManager
{
   static var index = 0;
   function PopUpManager()
   {
   }
   static function createPopUp(context, linkage, initProperties, relativeTo)
   {
      var _loc3_ = context._parent;
      if(!_loc3_)
      {
         _loc3_ = context;
      }
      var _loc7_ = _loc3_.getNextHighestDepth();
      var _loc5_ = {_x:initProperties._x,_y:initProperties._y};
      if(relativeTo != undefined)
      {
         var _loc4_ = {x:initProperties._x,y:initProperties._y};
         relativeTo.localToGlobal(_loc4_);
         _loc3_.globalToLocal(_loc4_);
         if(initProperties._x != undefined)
         {
            initProperties._x = _loc4_.x;
         }
         if(initProperties._y != undefined)
         {
            initProperties._y = _loc4_.y;
         }
      }
      gfx.managers.PopUpManager.index = gfx.managers.PopUpManager.index + 1;
      var _loc2_ = gfx.core.UIComponent.createInstance(_loc3_,linkage,"popup" + gfx.managers.PopUpManager.index,_loc7_,initProperties);
      if(!_loc2_)
      {
         trace("PopUpManager: attachMovie failed. Suggest moving popup source inside a symbol. Trying (" + context + ") as context..");
         initProperties._x = _loc5_._x;
         initProperties._y = _loc5_._y;
         _loc2_ = gfx.managers.PopUpManager.createPopUpRetry(context,linkage,initProperties,relativeTo);
         if(!_loc2_)
         {
            trace("PopUpManager: failed all options.");
         }
         return _loc2_;
      }
      _loc2_.topmostLevel = true;
      return _loc2_;
   }
   static function destroyPopUp(popUp)
   {
      popUp.removeMovieClip();
   }
   static function movePopUp(context, popUp, relativeTo, x, y)
   {
      if(popUp == null)
      {
         return undefined;
      }
      var _loc2_ = context._parent;
      if(!_loc2_)
      {
         _loc2_ = context;
      }
      var _loc1_ = {x:x,y:y};
      relativeTo.localToGlobal(_loc1_);
      _loc2_.globalToLocal(_loc1_);
      popUp._x = _loc1_.x;
      popUp._y = _loc1_.y;
   }
   static function centerPopUp(popUp)
   {
      if(popUp == null)
      {
         return undefined;
      }
      popUp._x = Stage.width - popUp._width >> 1;
      popUp._y = Stage.height - popUp._height >> 1;
   }
   static function createPopUpRetry(context, linkage, initProperties, relativeTo)
   {
      var _loc4_ = context.getNextHighestDepth();
      if(relativeTo != null)
      {
         var _loc2_ = {x:initProperties._x,y:initProperties._y};
         relativeTo.localToGlobal(_loc2_);
         context.globalToLocal(_loc2_);
         if(initProperties._x != null)
         {
            initProperties._x = _loc2_.x;
         }
         if(initProperties._y != null)
         {
            initProperties._y = _loc2_.y;
         }
      }
      gfx.managers.PopUpManager.index = gfx.managers.PopUpManager.index + 1;
      var _loc3_ = context.attachMovie(linkage,"popup" + gfx.managers.PopUpManager.index,_loc4_,initProperties);
      _loc3_.topmostLevel = true;
      return _loc3_;
   }
}
