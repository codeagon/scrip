class com.bluehole.tera.view.components.playGuide.DropDownFilter extends gfx.controls.DropdownMenu
{
   static var EVENT_CHANGED = "changed";
   static var EVENT_CHECKED = "checked";
   var defaultLabel = "필터";
   var filteringLabel = "필터링 적용중";
   var msg = "";
   var _rowCount = 20;
   function DropDownFilter()
   {
      super();
      this.paddingBottom = 8;
      this.paddingLeft = 1;
      this.paddingTop = 4;
   }
   function __set__dataProvider(value)
   {
      super.__set__dataProvider(value);
      var _loc3_ = 0;
      while(_loc3_ < this._dataProvider.length)
      {
         var _loc4_ = this.__get__dataProvider()[_loc3_];
         if(_loc4_.selected)
         {
            if(this.msg != "")
            {
               this.msg = this.msg + "\t";
            }
            this.msg = this.msg + _loc4_.id;
         }
         _loc3_ = _loc3_ + 1;
      }
      return this.__get__dataProvider();
   }
   function close()
   {
      super.close();
      var _loc5_ = "";
      var _loc3_ = 0;
      while(_loc3_ < this.__get__dataProvider().length)
      {
         var _loc4_ = this.__get__dataProvider()[_loc3_];
         if(_loc4_.selected)
         {
            if(_loc5_ != "")
            {
               _loc5_ = _loc5_ + "\t";
            }
            _loc5_ = _loc5_ + _loc4_.id;
         }
         _loc3_ = _loc3_ + 1;
      }
      if(this.msg != _loc5_)
      {
         this.msg = _loc5_;
         this.dispatchEvent({type:com.bluehole.tera.view.components.playGuide.DropDownFilter.EVENT_CHANGED,msg:this.msg});
      }
      this.updateLabel();
   }
   function configUI()
   {
      super.configUI();
      this.__set__disableFocus(true);
   }
   function updateLabel()
   {
      var _loc4_ = 0;
      var _loc2_ = 0;
      while(_loc2_ < this._dataProvider.length)
      {
         var _loc3_ = this._dataProvider[_loc2_];
         if(_loc3_.selected)
         {
            _loc4_ = _loc4_ + 1;
         }
         _loc2_ = _loc2_ + 1;
      }
      this.__set__label(_loc4_ != this._dataProvider.length?this.filteringLabel:this.defaultLabel);
   }
   function handleChange(event)
   {
      this.dispatchEvent({type:com.bluehole.tera.view.components.playGuide.DropDownFilter.EVENT_CHECKED,msg:this.__get__dataProvider()[event.index].id + "\t" + (!event.item.selected?0:1)});
      if(event.index == 0)
      {
         this.selectAllFilter(event.item.selected);
      }
      else if(event.item.selected == false)
      {
         this.__get__dataProvider()[0].selected = false;
         this._dropdown.invalidate();
      }
      else
      {
         var _loc3_ = true;
         var _loc2_ = 1;
         while(_loc2_ < this.__get__dataProvider().length)
         {
            var _loc4_ = this.__get__dataProvider()[_loc2_];
            _loc3_ = _loc3_ && _loc4_.selected;
            if(!_loc3_)
            {
               break;
            }
            _loc2_ = _loc2_ + 1;
         }
         this.__get__dataProvider()[0].selected = _loc3_;
         this._dropdown.invalidate();
      }
   }
   function changeFocus()
   {
      if(this._disabled)
      {
         return undefined;
      }
      if(this.focusIndicator == null)
      {
         this.setState(!(this._focused || this._displayFocus)?"out":"over");
      }
      if(this.focusIndicator != null)
      {
         if(this.focusIndicator._totalframes == 1)
         {
            this.focusIndicator._visible = this._focused;
         }
         else
         {
            this.focusIndicator.gotoAndPlay(!this._focused?"hide":"show");
         }
         if(this.pressedByKeyboard && !this._focused)
         {
            this.setState("kb_release");
            this.pressedByKeyboard = false;
         }
      }
   }
   function selectAllFilter(selectAll)
   {
      var _loc2_ = 0;
      while(_loc2_ < this.__get__dataProvider().length)
      {
         var _loc3_ = this.__get__dataProvider()[_loc2_];
         _loc3_.selected = selectAll;
         _loc2_ = _loc2_ + 1;
      }
      this._dropdown.invalidate();
   }
}
