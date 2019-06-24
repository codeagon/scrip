class lib.util.Snapper extends lib.gfx.events.EventDispatcher
{
   var bletTickness = 2;
   var hitTestAreaTickness = 30;
   var snapAreaAdjust = 0.2;
   var adjustSnapPixel = 0;
   var adjustPixelX = 0;
   var adjustPixelY = 0;
   var bletColor = 3394815;
   var leftChild = null;
   var rightChild = null;
   var topChild = null;
   var bottomChild = null;
   var bDragging = false;
   var useUnionMove = true;
   var bUIDrager = false;
   function Snapper(target)
   {
      super();
      this._mc = target;
      this.checkUIDrager();
      this.createDragEvent();
      this.createChildOffsetPoint();
      this.setName(this._mc._name);
      this.drawBlet();
   }
   function getBletTickness()
   {
      return this.bletTickness;
   }
   function setBletTickness(tickness)
   {
      this.bletTickness = tickness;
      this.drawBlet();
   }
   function getHitTestTickness()
   {
      return this.hitTestAreaTickness;
   }
   function setHitTestTickness(tickness)
   {
      this.hitTestAreaTickness = tickness;
   }
   function getSnapOffset()
   {
      return this.adjustSnapPixel;
   }
   function setSnapOffset(offset)
   {
      this.adjustSnapPixel = offset;
   }
   function hitTestAndReturnDir(x, y, width, height)
   {
      var _loc3_ = new flash.geom.Rectangle(x,y,width,height);
      var _loc2_ = null;
      _loc2_ = this.getSnapAreaAt("left");
      if(_loc2_.intersects(_loc3_))
      {
         return "left";
      }
      _loc2_ = this.getSnapAreaAt("right");
      if(_loc2_.intersects(_loc3_))
      {
         return "right";
      }
      _loc2_ = this.getSnapAreaAt("top");
      if(_loc2_.intersects(_loc3_))
      {
         return "top";
      }
      _loc2_ = this.getSnapAreaAt("bottom");
      if(_loc2_.intersects(_loc3_))
      {
         return "bottom";
      }
      return null;
   }
   function addChildAt(snapWisher, direction)
   {
      if(snapWisher instanceof lib.util.Snapper)
      {
         var _loc6_ = this.getChildAt(direction);
         if(_loc6_ != null)
         {
            this.removeChildAt(direction);
         }
         if(direction == "left")
         {
            this.snapToLeft(snapWisher);
         }
         else if(direction == "right")
         {
            this.snapToRight(snapWisher);
         }
         else if(direction == "top")
         {
            this.snapToTop(snapWisher);
         }
         else if(direction == "bottom")
         {
            this.snapToBottom(snapWisher);
         }
         var _loc8_ = this.reversDir(direction);
         snapWisher.setParent(this);
         snapWisher.setParentDir(_loc8_);
         var _loc5_ = snapWisher.getChildAt(this.reversDir(direction)) != null;
         var _loc3_ = snapWisher.getChildAt(this.reversDir(direction));
         while(_loc5_)
         {
            snapWisher.removeChildAt(this.reversDir(direction));
            snapWisher.addChildAt(_loc3_,direction);
            if(_loc3_.getChildAt(this.reversDir(direction)) != null)
            {
               _loc5_ = true;
               _loc3_ = _loc3_.getChildAt(this.reversDir(direction));
            }
            else
            {
               _loc5_ = false;
            }
         }
         if(_loc6_ != null)
         {
            var _loc7_ = this.getChildAtFinal(direction);
            _loc7_.addChildAt(_loc6_,direction);
         }
      }
   }
   function getChildAt(direction)
   {
      var _loc2_ = null;
      if(direction == "left")
      {
         _loc2_ = this.getLeftSnapped();
      }
      else if(direction == "right")
      {
         _loc2_ = this.getRightSnapped();
      }
      else if(direction == "top")
      {
         _loc2_ = this.getTopSnapped();
      }
      else if(direction == "bottom")
      {
         _loc2_ = this.getBottomSnapped();
      }
      return _loc2_;
   }
   function getChildAtFinal(direction)
   {
      var _loc3_ = this.getChildAt(direction);
      while(_loc3_ != null)
      {
         var _loc2_ = _loc3_.getChildAt(direction);
         if(_loc2_ == null)
         {
            break;
         }
         _loc3_ = _loc2_;
      }
      return _loc3_;
   }
   function getChildAll()
   {
      var _loc2_ = new Array();
      var _loc6_ = this.getLeftSnapped();
      var _loc4_ = this.getRightSnapped();
      var _loc5_ = this.getTopSnapped();
      var _loc3_ = this.getBottomSnapped();
      if(_loc6_ != null)
      {
         _loc2_.push(_loc6_);
      }
      if(_loc4_ != null)
      {
         _loc2_.push(_loc4_);
      }
      if(_loc5_ != null)
      {
         _loc2_.push(_loc5_);
      }
      if(_loc3_ != null)
      {
         _loc2_.push(_loc3_);
      }
      return _loc2_;
   }
   function removeChildAt(direction)
   {
      var _loc3_ = this.getChildAt(direction);
      _loc3_.setParent(null);
      if(direction == "left")
      {
         this.unsnapToLeft();
      }
      else if(direction == "right")
      {
         this.unsnapToRight();
      }
      else if(direction == "top")
      {
         this.unsnapToTop();
      }
      else if(direction == "bottom")
      {
         this.unsnapToBottom();
      }
   }
   function removeChildAll()
   {
      this.removeChildAt("left");
      this.removeChildAt("right");
      this.removeChildAt("top");
      this.removeChildAt("bottom");
   }
   function showBlet(direction)
   {
      if(direction == "left")
      {
         this.leftBlet._visible = true;
      }
      else if(direction == "right")
      {
         this.rightBlet._visible = true;
      }
      else if(direction == "top")
      {
         this.topBlet._visible = true;
      }
      else if(direction == "bottom")
      {
         this.bottomBlet._visible = true;
      }
   }
   function hideBlet()
   {
      this.leftBlet._visible = false;
      this.rightBlet._visible = false;
      this.topBlet._visible = false;
      this.bottomBlet._visible = false;
   }
   function getRect(standardObject)
   {
      if(standardObject == undefined)
      {
         standardObject = this._mc._parent;
      }
      else if(standardObject == this)
      {
         standardObject = this._mc;
      }
      var _loc3_ = this._mc.getRect(standardObject);
      return _loc3_;
   }
   function move(x, y)
   {
      if(this.useUnionMove)
      {
         var _loc4_ = this.getChildAt("left");
         var _loc5_ = this.getChildAt("right");
         var _loc6_ = this.getChildAt("top");
         var _loc7_ = this.getChildAt("bottom");
         _loc4_.move(x - this.leftChildOffset.x,y - this.leftChildOffset.y);
         _loc5_.move(x - this.rightChildOffset.x,y - this.rightChildOffset.y);
         _loc6_.move(x - this.topChildOffset.x,y - this.topChildOffset.y);
         _loc7_.move(x - this.bottomChildOffset.x,y - this.bottomChildOffset.y);
      }
      this._mc._x = x;
      this._mc._y = y;
   }
   function offset(w, h)
   {
      if(this.useUnionMove)
      {
         var _loc4_ = this.getChildAll();
         var _loc2_ = 0;
         while(_loc2_ < _loc4_.length)
         {
            var _loc3_ = _loc4_[_loc2_];
            _loc3_.offset(w,h);
            _loc2_ = _loc2_ + 1;
         }
      }
      this._mc._x = this._mc._x + w;
      this._mc._y = this._mc._y + h;
   }
   function __get__x()
   {
      return this._mc._x;
   }
   function __get__y()
   {
      return this._mc._y;
   }
   function __get__width()
   {
      return this._mc._width;
   }
   function __get__height()
   {
      return this._mc._height;
   }
   function getName()
   {
      return this.name;
   }
   function setName(Name)
   {
      this.name = Name;
   }
   function getDragging()
   {
      return this.bDragging;
   }
   function setDragging(bTrue)
   {
      this.bDragging = bTrue;
   }
   function setParent(snapper)
   {
      this.myParent = snapper;
      if(snapper == undefined || snapper == null)
      {
         this.myParent = null;
      }
   }
   function getParent()
   {
      return this.myParent;
   }
   function removeParent()
   {
      if(this.myParentDir == "left")
      {
         this.myParent.removeChildAt("right");
      }
      else if(this.myParentDir == "right")
      {
         this.myParent.removeChildAt("left");
      }
      else if(this.myParentDir == "top")
      {
         this.myParent.removeChildAt("bottom");
      }
      else if(this.myParentDir == "bottom")
      {
         this.myParent.removeChildAt("top");
      }
      this.myParent = null;
   }
   function setParentDir(direction)
   {
      this.myParentDir = direction;
   }
   function getParentDir()
   {
      return this.myParentDir;
   }
   function isParentOf(target)
   {
      var _loc2_ = target.getParent();
      while(_loc2_ != null)
      {
         var _loc3_ = this != _loc2_?false:true;
         if(_loc3_)
         {
            return true;
         }
         _loc2_ = _loc2_.getParent();
      }
      return false;
   }
   function isUIDrager()
   {
      return this.bUIDrager;
   }
   function savePos()
   {
      if(this.useUnionMove)
      {
         var _loc2_ = this.getChildAt("left");
         var _loc3_ = this.getChildAt("right");
         var _loc4_ = this.getChildAt("top");
         var _loc5_ = this.getChildAt("bottom");
         if(_loc2_ != null)
         {
            _loc2_.savePos();
         }
         if(_loc3_ != null)
         {
            _loc3_.savePos();
         }
         if(_loc4_ != null)
         {
            _loc4_.savePos();
         }
         if(_loc5_ != null)
         {
            _loc5_.savePos();
         }
      }
      lib.info.AlignInfo.savePos(this._mc,1);
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
   }
   function snapToLeft(snapWisher)
   {
      var _loc4_ = snapWisher.getRect(snapWisher);
      var _loc3_ = this.getRect();
      snapWisher.move(_loc3_.xMin - (_loc3_.xMax - _loc3_.xMin) - this.getSnapOffset(),_loc3_.yMin);
      this.leftChild = snapWisher;
      this.adjustPixel(snapWisher);
      this.leftChildOffset.x = this.__get__x() - snapWisher.__get__x();
      this.leftChildOffset.y = this.__get__y() - snapWisher.__get__y();
   }
   function snapToRight(snapWisher)
   {
      var _loc4_ = snapWisher.getRect(snapWisher);
      var _loc3_ = this.getRect();
      snapWisher.move(_loc3_.xMax + this.getSnapOffset(),_loc3_.yMin);
      this.rightChild = snapWisher;
      this.adjustPixel(snapWisher);
      this.rightChildOffset.x = this.__get__x() - snapWisher.__get__x();
      this.rightChildOffset.y = this.__get__y() - snapWisher.__get__y();
   }
   function snapToTop(snapWisher)
   {
      var _loc5_ = snapWisher.getRect(snapWisher);
      var _loc4_ = snapWisher.getRect();
      var _loc3_ = this.getRect();
      snapWisher.move(_loc3_.xMin,_loc3_.yMin - (_loc4_.yMax - _loc4_.yMin) - this.getSnapOffset());
      this.topChild = snapWisher;
      this.adjustPixel(snapWisher);
      this.topChildOffset.x = this.__get__x() - snapWisher.__get__x();
      this.topChildOffset.y = this.__get__y() - snapWisher.__get__y();
   }
   function snapToBottom(snapWisher)
   {
      var _loc4_ = snapWisher.getRect(snapWisher);
      var _loc3_ = this.getRect();
      snapWisher.move(_loc3_.xMin,_loc3_.yMax + this.getSnapOffset());
      this.bottomChild = snapWisher;
      this.adjustPixel(snapWisher);
      this.bottomChildOffset.x = this.__get__x() - snapWisher.__get__x();
      this.bottomChildOffset.y = this.__get__y() - snapWisher.__get__y();
   }
   function unsnapToLeft()
   {
      this.leftChild = null;
      this.leftChildOffset.x = this.leftChildOffset.y = 0;
   }
   function unsnapToRight()
   {
      this.rightChild = null;
      this.rightChildOffset.x = this.rightChildOffset.y = 0;
   }
   function unsnapToTop()
   {
      this.topChild = null;
      this.topChildOffset.x = this.topChildOffset.y = 0;
   }
   function unsnapToBottom()
   {
      this.bottomChild = null;
      this.bottomChildOffset.x = this.bottomChildOffset.y = 0;
   }
   function unsnapAll()
   {
      this.unsnapToLeft();
      this.unsnapToRight();
      this.unsnapToTop();
      this.unsnapToBottom();
   }
   function getLeftSnapped()
   {
      return this.leftChild;
   }
   function getRightSnapped()
   {
      return this.rightChild;
   }
   function getTopSnapped()
   {
      return this.topChild;
   }
   function getBottomSnapped()
   {
      return this.bottomChild;
   }
   function createDragEvent()
   {
      var thisSnapper = this;
      if(this.bUIDrager)
      {
         this._UIDrager.onPress2 = function()
         {
            thisSnapper.setDragging(true);
            thisSnapper.removeParent();
            thisSnapper.dispatchEvent({type:lib.gfx.events.EventTypes.DRAG_BEGIN,target:thisSnapper});
         };
         this._UIDrager.onRelease2 = function()
         {
            thisSnapper.setDragging(false);
            thisSnapper.dispatchEvent({type:lib.gfx.events.EventTypes.DRAG_END,target:thisSnapper});
            if(thisSnapper.isUIDrager())
            {
               thisSnapper.savePos();
            }
         };
      }
      else
      {
         this._mc.onPress = function()
         {
            this.startDrag();
            thisSnapper.setDragging(true);
            thisSnapper.removeParent();
            thisSnapper.dispatchEvent({type:lib.gfx.events.EventTypes.DRAG_BEGIN,target:thisSnapper});
         };
         this._mc.onRelease = function()
         {
            this.stopDrag();
            thisSnapper.setDragging(false);
            thisSnapper.dispatchEvent({type:lib.gfx.events.EventTypes.DRAG_END,target:thisSnapper});
         };
      }
   }
   function drawBlet()
   {
      var _loc2_ = this.getRect(this);
      this.leftBlet.removeMovieClip();
      this.leftBlet = this._mc.createEmptyMovieClip("leftBlet",this._mc.getNextHighestDepth());
      this.drawRect(this.leftBlet,_loc2_.xMin - this.bletTickness,_loc2_.yMin,_loc2_.xMin,_loc2_.yMax);
      this.rightBlet.removeMovieClip();
      this.rightBlet = this._mc.createEmptyMovieClip("leftBlet",this._mc.getNextHighestDepth());
      this.drawRect(this.rightBlet,_loc2_.xMax,_loc2_.yMin,_loc2_.xMax + this.bletTickness,_loc2_.yMax);
      this.topBlet.removeMovieClip();
      this.topBlet = this._mc.createEmptyMovieClip("leftBlet",this._mc.getNextHighestDepth());
      this.drawRect(this.topBlet,_loc2_.xMin,_loc2_.yMin - this.bletTickness,_loc2_.xMax,_loc2_.yMin);
      this.bottomBlet.removeMovieClip();
      this.bottomBlet = this._mc.createEmptyMovieClip("leftBlet",this._mc.getNextHighestDepth());
      this.drawRect(this.bottomBlet,_loc2_.xMin,_loc2_.yMax,_loc2_.xMax,_loc2_.yMax + this.bletTickness);
      this.leftBlet._alpha = this.rightBlet._alpha = this.topBlet._alpha = this.bottomBlet._alpha = 70;
      this.hideBlet();
   }
   function drawRect(target, x1, y1, x2, y2)
   {
      target.beginFill(this.bletColor);
      target.moveTo(x1,y1);
      target.lineTo(x2,y1);
      target.lineTo(x2,y2);
      target.lineTo(x1,y2);
      target.lineTo(x1,y1);
   }
   function adjustPixel(snapWisher)
   {
      snapWisher.offset(this.adjustPixelX,this.adjustPixelY);
   }
   function createChildOffsetPoint()
   {
      this.leftChildOffset = new flash.geom.Point();
      this.rightChildOffset = new flash.geom.Point();
      this.topChildOffset = new flash.geom.Point();
      this.bottomChildOffset = new flash.geom.Point();
   }
   function checkUIDrager()
   {
      if(this._mc instanceof lib.controls.S_UIDrager)
      {
         this.bUIDrager = true;
         this._UIDrager = this._mc;
         this._mc = this._UIDrager.getDragTarget();
      }
   }
   function getSnapAreaAt(direction)
   {
      var _loc3_ = this.getRect();
      var _loc2_ = new flash.geom.Rectangle();
      if(direction == "left")
      {
         _loc2_.x = _loc3_.xMin - this.getHitTestTickness();
         _loc2_.y = _loc3_.yMin;
         _loc2_.width = this.getHitTestTickness();
         _loc2_.height = Math.abs(_loc3_.yMax - _loc3_.yMin);
         _loc2_.y = _loc2_.y + _loc2_.height / 2;
         _loc2_.y = _loc2_.y - _loc2_.height * this.snapAreaAdjust / 2;
         _loc2_.height = _loc2_.height * this.snapAreaAdjust;
      }
      else if(direction == "right")
      {
         _loc2_.x = _loc3_.xMax;
         _loc2_.y = _loc3_.yMin;
         _loc2_.width = this.getHitTestTickness();
         _loc2_.height = Math.abs(_loc3_.yMax - _loc3_.yMin);
         _loc2_.y = _loc2_.y + _loc2_.height / 2;
         _loc2_.y = _loc2_.y - _loc2_.height * this.snapAreaAdjust / 2;
         _loc2_.height = _loc2_.height * this.snapAreaAdjust;
      }
      else if(direction == "top")
      {
         _loc2_.x = _loc3_.xMin;
         _loc2_.y = _loc3_.yMin - this.getHitTestTickness();
         _loc2_.width = Math.abs(_loc3_.xMax - _loc3_.xMin);
         _loc2_.height = this.getHitTestTickness();
         _loc2_.x = _loc2_.x + _loc2_.width / 2;
         _loc2_.x = _loc2_.x - _loc2_.width * this.snapAreaAdjust / 2;
         _loc2_.width = _loc2_.width * this.snapAreaAdjust;
      }
      else if(direction == "bottom")
      {
         _loc2_.x = _loc3_.xMin;
         _loc2_.y = _loc3_.yMax;
         _loc2_.width = Math.abs(_loc3_.xMax - _loc3_.xMin);
         _loc2_.height = this.getHitTestTickness();
         _loc2_.x = _loc2_.x + _loc2_.width / 2;
         _loc2_.x = _loc2_.x - _loc2_.width * this.snapAreaAdjust / 2;
         _loc2_.width = _loc2_.width * this.snapAreaAdjust;
      }
      return _loc2_;
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
