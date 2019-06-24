class com.bluehole.tera.control.LayoutActor extends gfx.core.UIComponent
{
   static var autoPositionActors = [];
   static var EVENT_POSITION_CHANGED = "positionChanged";
   static var EVENT_REQUEST_WIDGET_POSITION = "requestWidgetPosition";
   var notRatio = false;
   function LayoutActor(widget, widgetData)
   {
      super();
      this.updateWidgetInfo(widget,widgetData);
   }
   static function reflowAutoPositionActors(mode, rActors)
   {
      var _loc6_ = undefined;
      var _loc7_ = 12.5;
      var _loc8_ = 0.26;
      var _loc2_ = undefined;
      var _loc1_ = undefined;
      var _loc4_ = rActors != undefined?rActors:[];
      _loc1_ = 0;
      while(_loc1_ < com.bluehole.tera.control.LayoutActor.autoPositionActors.length)
      {
         if(_loc1_ == 0)
         {
            _loc6_ = _loc8_;
         }
         _loc2_ = (com.bluehole.tera.control.LayoutActor)com.bluehole.tera.control.LayoutActor.autoPositionActors[_loc1_];
         if(!(!_loc2_.isAutoPositionTarget(mode,_loc4_) || !_loc2_.__get__isOnStage()))
         {
            if(_loc2_.__get__widgetName() == "Inventory")
            {
               _loc2_.setPos(100,_loc7_);
            }
            else
            {
               if(_loc2_.setPos(_loc6_,_loc7_,1) && _loc1_ != 0)
               {
                  var _loc3_ = (com.bluehole.tera.control.LayoutActor)com.bluehole.tera.control.LayoutActor.autoPositionActors.shift();
                  if(_loc3_.__get__widgetName() == "Inventory")
                  {
                     com.bluehole.tera.control.LayoutActor.autoPositionActors.push(_loc3_);
                     _loc3_ = (com.bluehole.tera.control.LayoutActor)com.bluehole.tera.control.LayoutActor.autoPositionActors.shift();
                  }
                  _loc3_.hide();
                  com.bluehole.tera.control.LayoutActor.reflowAutoPositionActors(mode,_loc4_);
                  break;
               }
               var _loc5_ = {x:_loc2_.getWidgetEdges().xMax,y:0};
               _loc2_.widget._parent.localToGlobal(_loc5_);
               _loc6_ = (_loc5_.x - Stage.visibleRect.left) / Stage.visibleRect.width * 100 + _loc8_;
            }
         }
         _loc1_ = _loc1_ + 1;
      }
      _loc1_ = 0;
      while(_loc1_ < _loc4_.length)
      {
         com.bluehole.tera.control.LayoutActor.removeAutoPositionActor(_loc4_[_loc1_]);
         _loc1_ = _loc1_ + 1;
      }
   }
   static function addAutoPositionActor(actor)
   {
      var _loc1_ = com.bluehole.tera.control.LayoutActor.autoPositionActors.length - 1;
      while(_loc1_ >= 0)
      {
         if(com.bluehole.tera.control.LayoutActor.autoPositionActors[_loc1_] == actor)
         {
            com.bluehole.tera.control.LayoutActor.autoPositionActors.splice(_loc1_,1);
         }
         _loc1_ = _loc1_ - 1;
      }
      com.bluehole.tera.control.LayoutActor.autoPositionActors.push(actor);
   }
   static function removeAutoPositionActor(actor)
   {
      var _loc1_ = com.bluehole.tera.control.LayoutActor.autoPositionActors.length - 1;
      while(_loc1_ >= 0)
      {
         if(com.bluehole.tera.control.LayoutActor.autoPositionActors[_loc1_] == actor)
         {
            com.bluehole.tera.control.LayoutActor.autoPositionActors.splice(_loc1_,1);
         }
         _loc1_ = _loc1_ - 1;
      }
   }
   function __get__isOnStage()
   {
      return this.widget._parent != undefined;
   }
   function __get__isOut()
   {
      return com.bluehole.tera.managers.LayoutManager.isOut(this.widget);
   }
   function __get__moved()
   {
      return this.widget.container_mc.UIDrager.moved;
   }
   function __set__moved(value)
   {
      this.widgetData.moved = value;
      this.widget.container_mc.UIDrager.moved = value;
      return this.__get__moved();
   }
   function __get__widgetName()
   {
      return this.widgetData.Name;
   }
   function __get__group()
   {
      return this.widgetData.GROUP;
   }
   function __get__locked()
   {
      return this._locked;
   }
   function __set__locked(value)
   {
      this._locked = value;
      this.widgetData.locked = value;
      this.widget.container_mc.lock_mc.stat = !value?0:1;
      this.widget.container_mc.lock_mc.lock(value);
      return this.__get__locked();
   }
   function updateWidgetInfo(widget, widgetData)
   {
      this.widget = widget;
      this.widgetData = widgetData;
      this.__set__locked(0);
   }
   function init()
   {
      this.widget = null;
      this.widgetData = null;
   }
   function setPosition(xRatio, yRatio, notRatio)
   {
      if(isNaN(xRatio) || isNaN(yRatio))
      {
         xRatio = this.widgetData.xRatio;
         yRatio = this.widgetData.yRatio;
         this.savePos(xRatio,yRatio);
      }
      this.notRatio = notRatio;
      if(notRatio)
      {
         this.xRatio = this.widget._x = xRatio;
         this.yRatio = this.widget._y = yRatio;
      }
      else if(this.__get__group() == 1 && !this.__get__locked())
      {
         com.bluehole.tera.managers.LayoutManager.__get__instance().addAutoPositionActor(this);
      }
      else if(1 <= this.__get__group() && this.__get__group() < 50)
      {
         if(this.setPos(xRatio,yRatio))
         {
            this.setPos(this.widgetData.xRatio,this.widgetData.yRatio);
         }
      }
      else
      {
         this.setPos(0,0,0);
      }
      this.openAni();
   }
   function resetPosition()
   {
      this.__set__locked(0);
      this.__set__moved(false);
      this.savePos(this.widgetData.xRatio,this.widgetData.yRatio);
      if(this.__get__group() != 1)
      {
         this.setPosition(this.widgetData.xRatio,this.widgetData.yRatio);
      }
   }
   function resetLockedWidget()
   {
      if(this.__get__group() != 1 || this.__get__locked())
      {
         this.dispatchEvent({type:com.bluehole.tera.control.LayoutActor.EVENT_REQUEST_WIDGET_POSITION,widgetName:this.__get__widgetName()});
      }
   }
   function setLockEnable(enable)
   {
      this.widget.container_mc.lock_mc.setEnabled(enable);
   }
   function getWidgetEdges()
   {
      return com.bluehole.tera.managers.LayoutManager.getUIEdges(this.widget);
   }
   function setTop(normalLayer, battleLayer)
   {
      var _loc2_ = this.widget._parent;
      this.widget.swapDepths(_loc2_.getNextHighestDepth());
      if(_loc2_ == normalLayer || _loc2_ == battleLayer)
      {
         var _loc4_ = normalLayer.getDepth();
         var _loc3_ = battleLayer.getDepth();
         _loc2_.swapDepths(Math.max(_loc4_,_loc3_));
      }
   }
   function setPos(x, y, pivotType)
   {
      this.xRatio = x;
      this.yRatio = y;
      com.bluehole.tera.managers.LayoutManager.setUIPosition(this.widget,pivotType != undefined?pivotType:this.widgetData.PA,x,y);
      this.dispatchEvent({type:com.bluehole.tera.control.LayoutActor.EVENT_POSITION_CHANGED,widgetName:this.__get__widgetName()});
      return this.__get__isOut();
   }
   function savePos(x, y)
   {
      this.xRatio = x;
      this.yRatio = y;
      com.bluehole.tera.managers.LayoutManager.saveUIPositon(this.widget,this.widgetData.PA,this.__get__locked(),x,y);
   }
   function hide()
   {
      com.bluehole.tera.managers.LayoutManager.__get__instance().hideWidget(this.__get__widgetName(),false);
   }
   function openAni()
   {
      com.bluehole.tera.managers.LayoutManager.openingAni2(this.widget);
   }
   function isAutoPositionTarget(mode, removeFromAutoPositionArr)
   {
      if(mode == com.bluehole.tera.managers.LayoutManager.LAYOUT_REFLOW_MODE_UNLOCKED_UI)
      {
         if(this.__get__locked() != 0)
         {
            removeFromAutoPositionArr.push(this);
            return false;
         }
      }
      else if(mode == com.bluehole.tera.managers.LayoutManager.LAYOUT_REFLOW_MODE_UNMANAGED_UI)
      {
         if(this.__get__locked() == 0 && this.__get__moved())
         {
            this.setLockEnable(true);
            return false;
         }
         if(this.__get__locked() != 0)
         {
            removeFromAutoPositionArr.push(this);
            return false;
         }
      }
      this.setLockEnable(false);
      return true;
   }
}
