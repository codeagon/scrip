class com.bluehole.tera.control.LayoutActor extends gfx.core.UIComponent
{
   static var EVENT_POSITION_CHANGED = "positionChanged";
   static var EVENT_REQUEST_WIDGET_POSITION = "requestWidgetPosition";
   var notRatio = false;
   var isOpening = false;
   var noScaleWidgets = ["expbar","awesomeframe","playguide"];
   var noScaleGroup = [55,58,61];
   function LayoutActor(widget, widgetData)
   {
      super();
      this.updateWidgetInfo(widget,widgetData);
   }
   static function reflowAutoPositionActors(mode, rActors)
   {
      var _loc13_ = 0.26;
      var _loc9_ = _loc13_;
      var _loc8_ = 12.5;
      var _loc1_ = undefined;
      var _loc2_ = com.bluehole.tera.control.LayoutActor.autoPositionActors.__get__iterator();
      var _loc5_ = rActors != undefined?rActors:[];
      var _loc6_ = undefined;
      while(_loc2_.hasNext())
      {
         _loc1_ = (com.bluehole.tera.control.LayoutActor)_loc2_.next();
         if(!(!_loc1_.isAutoPositionTarget(mode,_loc5_) || !_loc1_.__get__isOnStage()))
         {
            if(_loc1_.__get__widgetName() == "Inventory")
            {
               _loc6_ = _loc1_;
               _loc1_.setPos(100,_loc8_);
            }
            else
            {
               if(_loc1_.setPos(_loc9_,_loc8_))
               {
                  if(_loc6_)
                  {
                     com.bluehole.tera.control.LayoutActor.addAutoPositionActor(_loc6_);
                  }
                  _loc2_ = com.bluehole.tera.control.LayoutActor.autoPositionActors.iterator;
                  var _loc3_ = (com.bluehole.tera.control.LayoutActor)_loc2_.next();
                  if(_loc3_ != _loc1_ || _loc2_.hasNext() && _loc2_.next() != _loc6_)
                  {
                     com.bluehole.tera.control.LayoutActor.removeAutoPositionActor(_loc3_);
                     _loc3_.hide();
                     com.bluehole.tera.control.LayoutActor.reflowAutoPositionActors(mode,_loc5_);
                  }
                  break;
               }
               var _loc7_ = {x:_loc1_.getWidgetEdges().xMax,y:0};
               _loc1_.widget._parent.localToGlobal(_loc7_);
               _loc9_ = (_loc7_.x - Stage.visibleRect.left) / Stage.visibleRect.width * 100 + _loc13_;
            }
         }
      }
      var _loc4_ = 0;
      while(_loc4_ < _loc5_.length)
      {
         com.bluehole.tera.control.LayoutActor.removeAutoPositionActor(_loc5_[_loc4_]);
         _loc4_ = _loc4_ + 1;
      }
   }
   static function addAutoPositionActor(actor)
   {
      if(!com.bluehole.tera.control.LayoutActor.autoPositionActors)
      {
         com.bluehole.tera.control.LayoutActor.autoPositionActors = new com.bluehole.tera.utils.List();
      }
      com.bluehole.tera.control.LayoutActor.autoPositionActors.add(actor);
   }
   static function removeAutoPositionActor(actor)
   {
      com.bluehole.tera.control.LayoutActor.autoPositionActors.remove(actor);
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
         com.bluehole.tera.control.LayoutActor.addAutoPositionActor(this);
         com.bluehole.tera.control.LayoutActor.reflowAutoPositionActors(com.bluehole.tera.managers.LayoutManager.LAYOUT_REFLOW_MODE_UNMANAGED_UI);
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
         this.widget._x = 0;
         this.widget._y = 0;
      }
      this.openAni();
      this.dispatchEvent({type:com.bluehole.tera.control.LayoutActor.EVENT_POSITION_CHANGED,widgetName:this.__get__widgetName(),target:this});
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
   function setScaleRatio(scaleRatio)
   {
      if(this.__get__group() < 50)
      {
         this.setScale(this.widget,scaleRatio);
      }
      else
      {
         var _loc2_ = this.scaleChildren.__get__iterator();
         while(_loc2_.hasNext())
         {
            this.setScale((MovieClip)this.widget[_loc2_.next()],scaleRatio);
         }
      }
   }
   function setPos(x, y, pivotType)
   {
      this.xRatio = x;
      this.yRatio = y;
      com.bluehole.tera.managers.LayoutManager.setUIPosition(this.widget,pivotType != undefined?pivotType:this.widgetData.PA,x,y);
      return this.__get__isOut();
   }
   function savePos(x, y)
   {
      this.xRatio = x;
      this.yRatio = y;
      com.bluehole.tera.managers.LayoutManager.saveUIPositon(this.widget,this.widgetData.PA,this.__get__locked(),x,y);
   }
   function setScale(target, scaleRatio)
   {
      if(this.isNoScaleWidget())
      {
         return undefined;
      }
      com.bluehole.tera.managers.LayoutManager.scaleUI(target,this.widgetData.SA,scaleRatio);
   }
   function isNoScaleWidget()
   {
      var _loc2_ = undefined;
      _loc2_ = 0;
      while(_loc2_ < this.noScaleGroup.length)
      {
         if(Number(this.widgetData.GROUP) == Number(this.noScaleGroup[_loc2_]))
         {
            return true;
         }
         _loc2_ = _loc2_ + 1;
      }
      _loc2_ = 0;
      while(_loc2_ < this.noScaleWidgets.length)
      {
         if(this.__get__widgetName().toLowerCase() == this.noScaleWidgets[_loc2_])
         {
            return true;
         }
         _loc2_ = _loc2_ + 1;
      }
      return false;
   }
   function hide()
   {
      com.bluehole.tera.managers.LayoutManager.__get__instance().hideWidget(this,false);
   }
   function openAni()
   {
      if(!this.isOpening)
      {
         this.isOpening = true;
         com.bluehole.tera.managers.LayoutManager.openingAni2(this.widget,this.openAni_completeHandler);
      }
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
   function openAni_completeHandler(e)
   {
      this.isOpening = false;
   }
}
