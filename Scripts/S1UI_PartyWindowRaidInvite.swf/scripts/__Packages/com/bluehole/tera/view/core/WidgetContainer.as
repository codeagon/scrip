class com.bluehole.tera.view.core.WidgetContainer extends gfx.core.UIComponent
{
   var _offsetTop = 0;
   var _offsetBottom = 0;
   var _offsetLeft = 0;
   var _offsetRight = 0;
   var adjustLeft = 0;
   var adjustRight = 0;
   var adjustTop = 0;
   var adjustBottom = 0;
   var originalAlpha = 100;
   var _title = "Title";
   var _allowResize = true;
   function WidgetContainer()
   {
      super();
      this.UI = this._parent;
      this.globalEventListener = new Object();
      this.UI.myListener = this.globalEventListener;
      this.UI.bWidgetOpen = false;
      this.UI._visible = false;
   }
   function __get__title()
   {
      return this._title;
   }
   function __set__title(value)
   {
      this._title = value;
      this.invalidate();
      return this.__get__title();
   }
   function __get__allowResize()
   {
      return this._allowResize;
   }
   function __set__allowResize(value)
   {
      this._allowResize = value;
      this.invalidate();
      return this.__get__allowResize();
   }
   function toString()
   {
      return "[com.bluehole.tera.view.core.WidgetContainer " + this._name + "]";
   }
   function configUI()
   {
      super.configUI();
      this.container = this;
      if(_global.EventBroadCaster)
      {
         _global.EventBroadCaster.addListener(this.globalEventListener);
      }
      this.configEvents();
      this.background.hitTestDisable = true;
      this.hit._visible = this.hit.tabEnabled = this.hit.focusEnabled = false;
      this.constraints = new gfx.utils.Constraints(this);
      if(this.background)
      {
         this.constraints.addElement(this.background,gfx.utils.Constraints.ALL);
      }
      if(this.hit)
      {
         this.constraints.addElement(this.hit,gfx.utils.Constraints.ALL);
      }
      if(this.titleBtn)
      {
         this.constraints.addElement(this.titleBtn,gfx.utils.Constraints.LEFT | gfx.utils.Constraints.RIGHT);
         this.titleBtn.addEventListener("press",this,"handleTitleDragStart");
         this.titleBtn.addEventListener("click",this,"handleTitleDragStop");
         this.titleBtn.addEventListener("releaseOutside",this,"handleTitleDragStop");
      }
      if(this.closeBtn)
      {
         this.constraints.addElement(this.closeBtn,gfx.utils.Constraints.RIGHT);
         this.closeBtn.addEventListener("click",this,"closeBtn_clickHandler");
      }
      lib.Debuger.trace("loadCallback : " + this._name);
      flash.external.ExternalInterface.call("loadCallback",this._name,targetPath(this),this);
   }
   function draw()
   {
      if(this.titleBtn)
      {
         this.titleBtn.__set__label(this._title);
      }
      this.constraints.update(this.__width,this.__height);
   }
   function onUnload()
   {
      lib.Debuger.trace("unLoadCallback : " + this._name);
      flash.external.ExternalInterface.call("unLoadCallback",this._name,targetPath(this),this);
   }
   function adjustDragLimit(left, right, top, bottom)
   {
      this.adjustLeft = left;
      this.adjustRight = right;
      this.adjustTop = top;
      this.adjustBottom = bottom;
   }
   function configEvents()
   {
      var thisObject = this;
      this.globalEventListener.OnGameEventShowWindow = function(widgetName, bShow, expandOption)
      {
         if(widgetName.toLowerCase() == thisObject.UI.UIname.toLowerCase())
         {
            thisObject.UI.bWidgetOpen = Number(bShow);
            thisObject.UI._visible = Boolean(bShow);
         }
      };
      this.globalEventListener.OnGameEventChangeUIMode = function(bShow)
      {
         thisObject.UI._visible = thisObject.UIModeVisibility();
      };
   }
   function UIModeVisibility()
   {
      return true;
   }
   function configForm()
   {
      this.constraints.update(this.__width,this.__height);
      this._minWidth = !!this._minWidth?Math.max(this.__width,this._minWidth):this.__width;
      this._minHeight = !!this._minHeight?Math.max(this.__height,this._minHeight):this.__height;
      if(this._maxWidth < 0)
      {
         this._maxWidth = this._minWidth;
      }
      else
      {
         this._maxWidth = !!this._maxWidth?Math.max(this._minWidth,this._maxWidth):Infinity;
      }
      if(this._maxHeight < 0)
      {
         this._maxHeight = this._minHeight;
      }
      else
      {
         this._maxHeight = !!this._maxHeight?Math.max(this._minHeight,this._maxHeight):Infinity;
      }
      this.setSize(this._minWidth,this._minHeight);
   }
   function getDragLeft()
   {
      var _loc3_ = undefined;
      var _loc2_ = this.getUIParentLeftTop();
      _loc3_ = Math.ceil(Stage.visibleRect.topLeft.x - _loc2_.x);
      return _loc3_;
   }
   function getDragTop()
   {
      var _loc3_ = undefined;
      var _loc2_ = this.getUIParentLeftTop();
      _loc3_ = Math.ceil(Stage.visibleRect.topLeft.y - _loc2_.y);
      return _loc3_;
   }
   function getDragRight()
   {
      var _loc3_ = undefined;
      var _loc2_ = this.getUIParentLeftTop();
      _loc3_ = Math.floor(Stage.visibleRect.bottomRight.x - _loc2_.x - this.__get__width() * this.UI._xscale * 0.01);
      return _loc3_;
   }
   function getDragBottom()
   {
      var _loc3_ = undefined;
      var _loc2_ = this.getUIParentLeftTop();
      _loc3_ = Math.floor(Stage.visibleRect.bottomRight.y - _loc2_.y - this.__get__height() * this.UI._yscale * 0.01);
      return _loc3_;
   }
   function getUIParentLeftTop()
   {
      var _loc3_ = undefined;
      var _loc2_ = undefined;
      if(typeof this.UI._parent == "Widget")
      {
         _loc2_ = this.UI._parent._parent;
      }
      else
      {
         _loc2_ = this.UI._parent;
      }
      _loc3_ = {x:_loc2_._x,y:_loc2_._y};
      _loc2_.localToGlobal(_loc3_);
      return _loc3_;
   }
   function saveUIPosition()
   {
      lib.Debuger.trace("WidgetContainer - saveUIPosition : " + this.UI.UIname);
      var _loc4_ = _root.GetRegisterUIData(this.UI.UIname);
      var _loc3_ = this.lock_mc == undefined?1:this.lock_mc._currentframe - 1;
      com.bluehole.tera.managers.LayoutManager.saveUIPositon(this.UI,_loc4_.PA,_loc3_);
   }
   function handleTitleDragStart()
   {
      this._alpha = 70;
      this.UI.startDrag(false,this.getDragLeft(),this.getDragTop(),this.getDragRight(),this.getDragBottom());
   }
   function handleTitleDragStop()
   {
      this._alpha = 100;
      this.stopDrag();
      this.saveUIPosition();
   }
   function handleResizeDragStart()
   {
      this.dragProps = [this._parent._xmouse - (this._x + this._width),this._parent._ymouse - (this._y + this._height)];
      this.onMouseMove = this.handleResize;
   }
   function handleResizeDragStop()
   {
      this.onMouseMove = null;
      delete this.onMouseMove;
   }
   function handleResize()
   {
      this.setSize(Math.max(this._minWidth,Math.min(this._maxWidth,this._parent._xmouse - this._x - this.dragProps[0])),Math.max(this._minHeight,Math.min(this._maxHeight,this._parent._ymouse - this._y - this.dragProps[1])));
   }
   function closeBtn_clickHandler()
   {
      this._visible = false;
   }
}
