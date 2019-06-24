class gfx.core.UIComponent extends MovieClip
{
   var initialized = false;
   var __width = NaN;
   var __height = NaN;
   var _disabled = false;
   var _focused = false;
   var _displayFocus = false;
   var sizeIsInvalid = false;
   function UIComponent()
   {
      super();
      gfx.events.EventDispatcher.initialize(this);
   }
   function onLoad()
   {
      this.onLoadImpl();
   }
   function onLoadImpl()
   {
      if(this.initialized)
      {
         return undefined;
      }
      if(isNaN(this.__width))
      {
         this.__width = this._width;
      }
      if(isNaN(this.__height))
      {
         this.__height = this._height;
      }
      this.initialized = true;
      this.configUI();
      this.validateNow();
      if(this._focused && Selection.getFocus() == null)
      {
         gfx.managers.FocusHandler.__get__instance().onSetFocus(null,this);
      }
   }
   static function createInstance(context, symbol, name, depth, initObj)
   {
      var _loc1_ = context.attachMovie(symbol,name,depth,initObj);
      if(_loc1_.invalidate)
      {
         _loc1_.invalidate();
      }
      return _loc1_;
   }
   function __get__disabled()
   {
      return this._disabled;
   }
   function __set__disabled(value)
   {
      this._disabled = value;
      super.enabled = !value;
      this.useHandCursor = !value;
      this.invalidate();
      return this.__get__disabled();
   }
   function __get__visible()
   {
      return this._visible;
   }
   function __set__visible(value)
   {
      if(this._visible == value)
      {
         return undefined;
      }
      this._visible = value;
      if(!this.initialized)
      {
         return undefined;
      }
      var _loc3_ = !value?"hide":"show";
      this.dispatchEvent({type:_loc3_});
      return this.__get__visible();
   }
   function __get__width()
   {
      return this.__width;
   }
   function __set__width(value)
   {
      this.setSize(value,this.__height || this._height);
      return this.__get__width();
   }
   function __get__height()
   {
      return this.__height;
   }
   function __set__height(value)
   {
      this.setSize(this.__width || this._width,value);
      return this.__get__height();
   }
   function setSize(width, height)
   {
      if(this.__width == width && this.__height == height)
      {
         return undefined;
      }
      this.__width = width;
      this.__height = height;
      this.sizeIsInvalid = true;
      this.invalidate();
   }
   function __get__focused()
   {
      return this._focused;
   }
   function __set__focused(value)
   {
      if(value == this._focused)
      {
         return undefined;
      }
      this._focused = value;
      if(!value && Selection.getFocus() == this)
      {
         Selection.setFocus(null);
      }
      else if(value && Selection.getFocus() != this)
      {
         Selection.setFocus(this);
      }
      this.changeFocus();
      var _loc3_ = !value?"focusOut":"focusIn";
      this.dispatchEvent({type:_loc3_});
      return this.__get__focused();
   }
   function __get__displayFocus()
   {
      return this._displayFocus;
   }
   function __set__displayFocus(value)
   {
      if(value == this._displayFocus)
      {
         return undefined;
      }
      this._displayFocus = value;
      this.changeFocus();
      return this.__get__displayFocus();
   }
   function handleInput(details, pathToFocus)
   {
      if(pathToFocus != null && pathToFocus.length > 0)
      {
         var _loc2_ = pathToFocus[0].handleInput(details,pathToFocus.slice(1));
         if(_loc2_)
         {
            return _loc2_;
         }
      }
      return false;
   }
   function invalidate()
   {
      if(this.invalidationIntervalID)
      {
         return undefined;
      }
      this.invalidationIntervalID = setInterval(this,"validateNow",1);
   }
   function validateNow()
   {
      clearInterval(this.invalidationIntervalID);
      delete this.invalidationIntervalID;
      if(!this.initialized)
      {
         this.onLoadImpl();
         return undefined;
      }
      this.draw();
      this.sizeIsInvalid = false;
   }
   function toString()
   {
      return "[Scaleform UIComponent " + this._name + "]";
   }
   function dispatchEventToGame(event)
   {
      flash.external.ExternalInterface.call("__handleEvent",this._name,event);
   }
   function configUI()
   {
   }
   function initSize()
   {
      var _loc3_ = this.__width != 0?this.__width:this._width;
      var _loc2_ = this.__height != 0?this.__height:this._height;
      this._xscale = this._yscale = 100;
      this.setSize(_loc3_,_loc2_);
   }
   function draw()
   {
   }
   function changeFocus()
   {
   }
   function onMouseWheel(delta, target)
   {
      if(this.__get__visible() && this.hitTest(_root._xmouse,_root._ymouse,true))
      {
         var _loc3_ = Mouse.getTopMostEntity();
         while(_loc3_)
         {
            if(_loc3_ == this)
            {
               this.scrollWheel(delta <= 0?-1:1);
               break;
            }
            _loc3_ = _loc3_._parent;
         }
      }
   }
   function scrollWheel(delta)
   {
   }
}
