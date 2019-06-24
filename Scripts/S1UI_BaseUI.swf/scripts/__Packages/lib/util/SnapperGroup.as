class lib.util.SnapperGroup extends gfx.events.EventDispatcher implements mx.utils.Collection
{
   var tickInterval = 1;
   var bletTickness = 3;
   var hitTestAreaTickness = 30;
   var adjustSnapPixel = 0;
   var adjustPixelX = 0;
   var adjustPixelY = 0;
   function SnapperGroup()
   {
      super();
      this.snappers = new Array();
      this.tickArray = new Array();
   }
   function add(obj)
   {
      if(obj instanceof lib.util.Snapper)
      {
         return this.addItem(obj);
      }
      if(typeof obj == "movieclip")
      {
         return this.addItem(new lib.util.Snapper(obj));
      }
      return false;
   }
   function addItem(snapper)
   {
      var _loc3_ = false;
      if(snapper != null && snapper instanceof lib.util.Snapper)
      {
         if(this.contains(snapper))
         {
            this.removeItem(snapper);
         }
         snapper.addEventListener(gfx.events.EventTypes.DRAG_BEGIN,this,"dragBeginHandler");
         snapper.addEventListener(gfx.events.EventTypes.DRAG_END,this,"dragEndHandler");
         snapper.adjustErrorPixel(this.adjustPixelX,this.adjustPixelY);
         snapper.setHitTestTickness(this.hitTestAreaTickness);
         snapper.setSnapOffset(this.adjustSnapPixel);
         snapper.setBletTickness(this.bletTickness);
         this.snappers.push(snapper);
         _loc3_ = true;
      }
      return _loc3_;
   }
   function removeItem(snapper)
   {
      var _loc2_ = false;
      var _loc3_ = this.getItem(snapper);
      if(_loc3_ > -1)
      {
         snapper.removeEventListener(gfx.events.EventTypes.DRAG_BEGIN,this,"dragBeginHandler");
         snapper.removeEventListener(gfx.events.EventTypes.DRAG_END,this,"dragEndHandler");
         this.snappers.splice(_loc3_,1);
         _loc2_ = true;
      }
      return _loc2_;
   }
   function contains(snapper)
   {
      return this.getItem(snapper) > -1;
   }
   function getItemAt(index)
   {
      return this.snappers[index];
   }
   function getIterator()
   {
      return new mx.utils.IteratorImpl(this);
   }
   function getLength()
   {
      return this.snappers.length;
   }
   function isEmpty()
   {
      return this.snappers.length == 0;
   }
   function clear()
   {
      var _loc3_ = this.getIterator();
      while(_loc3_.hasNext())
      {
         var _loc2_ = _loc3_.next();
         _loc2_.removeChildAll();
      }
      this.snappers = new Array();
      this.draggigSnapper = null;
      this.hideBlet();
      this.removeTickEvent();
   }
   function setBletTickness(tickness)
   {
      this.bletTickness = tickness;
      var _loc3_ = this.getIterator();
      while(_loc3_.hasNext())
      {
         var _loc2_ = _loc3_.next();
         _loc2_.setBletTickness(tickness);
      }
   }
   function setHitTestTickness(tickness)
   {
      this.hitTestAreaTickness = tickness;
      var _loc3_ = this.getIterator();
      while(_loc3_.hasNext())
      {
         var _loc2_ = _loc3_.next();
         _loc2_.setHitTestTickness(tickness);
      }
   }
   function setSnapOffset(offset)
   {
      this.adjustSnapPixel = offset;
      var _loc3_ = this.getIterator();
      while(_loc3_.hasNext())
      {
         var _loc2_ = _loc3_.next();
         _loc2_.setSnapOffset(offset);
      }
   }
   function adjustErrorPixel(x, y)
   {
      if(x != undefined)
      {
         this.adjustPixelX = x;
      }
      if(y != undefined)
      {
         this.adjustPixelY = y;
      }
      var _loc3_ = this.getIterator();
      while(_loc3_.hasNext())
      {
         var _loc2_ = _loc3_.next();
         _loc2_.adjustErrorPixel(x,y);
      }
   }
   function getItem(snapper)
   {
      var _loc3_ = -1;
      var _loc2_ = 0;
      while(_loc2_ < this.snappers.length)
      {
         if(this.snappers[_loc2_] == snapper)
         {
            _loc3_ = _loc2_;
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
      return _loc3_;
   }
   function dragBeginHandler(event)
   {
      this.draggigSnapper = event.target;
      this.createTickEvent();
      this.dispatchEvent({type:gfx.events.EventTypes.DRAG_BEGIN,target:event.target});
   }
   function dragEndHandler(event)
   {
      this.removeTickEvent();
      this.addChildAction();
      this.hideBlet();
      this.draggigSnapper = null;
      this.unionMove();
      this.dispatchEvent({type:gfx.events.EventTypes.DRAG_END,target:event.target});
   }
   function createTickEvent()
   {
      this.tickArray[0] = this.tickInterval;
      this.tickInterval = setInterval(this,"tickEvent",20);
   }
   function tickEvent()
   {
      this.unionMove();
      this.showBlet();
   }
   function unionMove()
   {
      this.draggigSnapper.move(this.draggigSnapper.__get__x(),this.draggigSnapper.__get__y());
   }
   function showBlet()
   {
      var _loc5_ = null;
      var _loc4_ = this.getIterator();
      while(_loc4_.hasNext())
      {
         var _loc2_ = _loc4_.next();
         if(_loc2_ != this.draggigSnapper && !this.draggigSnapper.isParentOf(_loc2_))
         {
            var _loc3_ = _loc2_.hitTestAndReturnDir(this.draggigSnapper.__get__x(),this.draggigSnapper.__get__y(),this.draggigSnapper.__get__width(),this.draggigSnapper.__get__height());
            if(_loc3_ != null)
            {
               if(_loc2_ != this.showingBletOwner || _loc3_ != this.showingBletDir)
               {
                  this.hideBlet();
               }
               _loc2_.showBlet(_loc3_);
               this.showingBletOwner = _loc2_;
               this.showingBletDir = _loc5_ = _loc3_;
            }
         }
      }
      if(_loc5_ == null)
      {
         this.hideBlet();
      }
   }
   function removeTickEvent()
   {
      clearInterval(this.tickInterval);
      this.tickArray.pop();
   }
   function hideBlet()
   {
      this.showingBletOwner.hideBlet();
      this.showingBletOwner = null;
      this.showingBletDir = null;
   }
   function addChildAction()
   {
      var _loc2_ = this.showingBletOwner;
      var _loc3_ = this.showingBletDir;
      if(_loc2_ != null)
      {
         if(_loc2_.getParent() != null)
         {
            var _loc4_ = _loc2_.getParent();
            if(_loc4_.getChildAt(this.reversDir(_loc3_)) == _loc2_)
            {
               _loc2_ = _loc4_;
               _loc3_ = this.reversDir(_loc3_);
            }
         }
         _loc2_.addChildAt(this.draggigSnapper,_loc3_);
      }
   }
   function reversDir(direction)
   {
      if(direction == "left")
      {
         return "right";
      }
      if(direction == "right")
      {
         return "left";
      }
      if(direction == "top")
      {
         return "bottom";
      }
      if(direction == "bottom")
      {
         return "top";
      }
      return null;
   }
}
