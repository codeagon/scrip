class gfx.controls.DropdownMenu extends gfx.controls.Button
{
   var isOpen = false;
   var direction = "down";
   var _dropdownWidth = -1;
   var _rowCount = 5;
   var _labelField = "label";
   var _selectedIndex = -1;
   var margin = 1;
   var paddingTop = 0;
   var paddingBottom = 0;
   var paddingLeft = 0;
   var paddingRight = 0;
   var thumbOffsetTop = 0;
   var thumbOffsetBottom = 0;
   var thumbSizeFactor = 1;
   var offsetX = 0;
   var offsetY = 0;
   var extent = 0;
   var _dropdown = null;
   function DropdownMenu()
   {
      super();
      this.__set__dataProvider([]);
   }
   function __get__dropdown()
   {
      if(!this._dropdown)
      {
         this.createDropDown();
      }
      return this._dropdown;
   }
   function __set__dropdown(value)
   {
      this.inspectableDropdown = value;
      if(this.initialized)
      {
         this.createDropDown();
      }
      return this.__get__dropdown();
   }
   function __get__itemRenderer()
   {
      return this._dropdown.itemRenderer;
   }
   function __set__itemRenderer(value)
   {
      this.inspectableItemRenderer = value;
      if(this._dropdown)
      {
         this._dropdown.itemRenderer = this.inspectableItemRenderer;
      }
      return this.__get__itemRenderer();
   }
   function __get__scrollBar()
   {
      return this._dropdown.scrollBar;
   }
   function __set__scrollBar(value)
   {
      this.inspectableScrollBar = value;
      if(this._dropdown)
      {
         this._dropdown.scrollBar = this.inspectableScrollBar;
      }
      return this.__get__scrollBar();
   }
   function __get__dropdownWidth()
   {
      return this._dropdownWidth;
   }
   function __set__dropdownWidth(value)
   {
      this._dropdownWidth = value;
      return this.__get__dropdownWidth();
   }
   function __get__rowCount()
   {
      return this._rowCount;
   }
   function __set__rowCount(value)
   {
      this._rowCount = value;
      if(this._dropdown != null && this._dropdown.hasOwnProperty("rowCount"))
      {
         this._dropdown.rowCount = value;
      }
      return this.__get__rowCount();
   }
   function __get__dataProvider()
   {
      return this._dataProvider;
   }
   function __set__dataProvider(value)
   {
      if(this._dataProvider == value)
      {
         return undefined;
      }
      if(this._dataProvider != null)
      {
         this._dataProvider.removeEventListener("change",this,"onDataChange");
      }
      this._dataProvider = value;
      gfx.data.DataProvider.initialize(this._dataProvider);
      this._dataProvider.addEventListener("change",this,"onDataChange");
      if(this._dropdown != null)
      {
         this._dropdown.dataProvider = this._dataProvider;
      }
      this.__set__selectedIndex(0);
      this.updateSelectedItem();
      return this.__get__dataProvider();
   }
   function __get__selectedIndex()
   {
      return this._selectedIndex;
   }
   function __set__selectedIndex(value)
   {
      this._selectedIndex = value;
      if(this._dropdown != null)
      {
         this._dropdown.selectedIndex = value;
      }
      this.updateSelectedItem();
      return this.__get__selectedIndex();
   }
   function __get__labelField()
   {
      return this._labelField;
   }
   function __set__labelField(value)
   {
      this._labelField = value;
      if(this._dropdown != null)
      {
         this._dropdown.labelField = this._labelField;
      }
      this.updateLabel();
      return this.__get__labelField();
   }
   function __get__labelFunction()
   {
      return this._labelFunction;
   }
   function __set__labelFunction(value)
   {
      this._labelFunction = value;
      if(this._dropdown != null)
      {
         this._dropdown.labelFunction = this._labelFunction;
      }
      this.updateLabel();
      return this.__get__labelFunction();
   }
   function itemToLabel(item)
   {
      if(item == null)
      {
         return "";
      }
      if(this._labelFunction != null)
      {
         return this._labelFunction(item);
      }
      if(this._labelField != null && item[this._labelField] != null)
      {
         return item[this._labelField];
      }
      return item.toString();
   }
   function open()
   {
      if(!this._dropdown)
      {
         this.createDropDown();
         if(!this._dropdown)
         {
            this.isOpen = false;
            return undefined;
         }
      }
      this.openImpl();
   }
   function close()
   {
      if(!this.isOpen)
      {
         return undefined;
      }
      this.isOpen = false;
      if(this._dropdown == null)
      {
         return undefined;
      }
      this._dropdown.visible = false;
      this.onMouseDown = null;
      this.__set__selected(false);
   }
   function invalidateData()
   {
      this._dataProvider.requestItemAt(this._selectedIndex,this,"populateText");
   }
   function setSize(width, height)
   {
      super.setSize(width,height);
      if(this._dropdown != null && this._dropdownWidth == -1)
      {
         this._dropdown.width = this.__width;
      }
   }
   function handleInput(details, pathToFocus)
   {
      var _loc3_ = undefined;
      if(this._dropdown != null && this.isOpen)
      {
         _loc3_ = this._dropdown.handleInput(details);
         if(_loc3_)
         {
            return true;
         }
      }
      _loc3_ = super.handleInput(details,pathToFocus);
      var _loc5_ = details.value == "keyDown";
      if((var _loc0_ = details.navEquivalent) === gfx.ui.NavigationCode.ESCAPE)
      {
         if(this.isOpen)
         {
            if(_loc5_)
            {
               this.close();
            }
            return true;
         }
      }
      return _loc3_;
   }
   function removeMovieClip()
   {
      if(this._dropdown)
      {
         this._dropdown.removeMovieClip();
      }
      super.removeMovieClip();
   }
   function toString()
   {
      return "[Scaleform DropdownMenu " + this._name + "]";
   }
   function createDropDown()
   {
      if(this._dropdown == this.inspectableDropdown)
      {
         return undefined;
      }
      if(this._dropdown != null)
      {
         this._dropdown.removeMovieClip();
      }
      if(typeof this.inspectableDropdown == "string")
      {
         this._dropdown = (MovieClip)this._parent[this.inspectableDropdown];
         if(this._dropdown == null)
         {
            this._dropdown = gfx.managers.PopUpManager.createPopUp(this,this.inspectableDropdown.toString(),{itemRenderer:this.inspectableItemRenderer,paddingTop:this.paddingTop,paddingBottom:this.paddingBottom,paddingLeft:this.paddingLeft,paddingRight:this.paddingRight,thumbOffsetTop:this.thumbOffsetTop,thumbOffsetBottom:this.thumbOffsetBottom,thumbSizeFactor:this.thumbSizeFactor,margin:this.margin});
            this._dropdown.scrollBar = this.inspectableScrollBar;
         }
      }
      else if(this.inspectableDropdown instanceof MovieClip)
      {
         this._dropdown = (MovieClip)this._dropdown;
      }
      if(this._dropdown == null)
      {
         return undefined;
      }
      this._dropdown.addEventListener("itemClick",this,"handleChange");
      this._dropdown.labelField = this._labelField;
      this._dropdown.labelFunction = this._labelFunction;
      this._dropdown.dataProvider = this._dataProvider;
      this._dropdown.selectedIndex = this._selectedIndex;
      this._dropdown.visible = false;
      this._dropdown.focusTarget = this;
      if(this._dropdown.wrapping != null)
      {
         this._dropdown.wrapping = "stick";
      }
      if(this._dropdown.autoRowCount != null)
      {
         this._dropdown.autoRowCount = true;
      }
      if(this._dropdown.rowCount != null)
      {
         this._dropdown.rowCount = Math.min(this._dataProvider.length,this._rowCount);
      }
      if(this._dropdownWidth != 0)
      {
         this._dropdown.width = this._dropdownWidth != -1?this._dropdownWidth:this.__width + this.extent;
      }
   }
   function openImpl()
   {
      if(this.isOpen)
      {
         return undefined;
      }
      this.isOpen = true;
      if(this._dropdownWidth != this._dropdown.width)
      {
         this._dropdown.width = this._dropdownWidth != -1?this._dropdownWidth:this.__width + this.extent;
      }
      if(this._rowCount != this._dropdown.rowCount)
      {
         this._dropdown.rowCount = Math.min(this._dataProvider.length,this._rowCount);
      }
      this._dropdown.validateNow();
      this.onMouseDown = this.handleStageClick;
      this.__set__selected(true);
      this._dropdown.selectedIndex = this._selectedIndex;
      this._dropdown.scrollToIndex(this._selectedIndex);
      var _loc3_ = this.offsetX * (100 / this._xscale);
      var _loc2_ = this.offsetY * (100 / this._yscale);
      gfx.managers.PopUpManager.movePopUp(this,(MovieClip)this._dropdown,this,_loc3_,this.direction != "down"?- this._dropdown.height - _loc2_:this.__height + _loc2_);
      this._dropdown.visible = true;
   }
   function configUI()
   {
      if(this.bindingEnabled)
      {
         flash.external.ExternalInterface.call("__registerControl",this._name,this,"DropdownMenu");
         this.addEventListener("select",this,"dispatchEventToGame");
         this.bindingEnabled = false;
      }
      super.configUI();
      this.addEventListener("click",this,"toggleMenu");
      this.toggle = false;
   }
   function changeFocus()
   {
      super.changeFocus();
      if(this.isOpen && this._dropdown != null)
      {
         this.close();
      }
   }
   function updateSelectedItem()
   {
      this.invalidateData();
   }
   function updateLabel()
   {
      this.__set__label(this.itemToLabel(this.selectedItem));
   }
   function populateText(item)
   {
      this.selectedItem = item;
      this.updateLabel();
      this.dispatchEvent({type:"change",index:this._selectedIndex,data:item});
   }
   function handleChange(event)
   {
      var _loc2_ = this._dropdown.selectedIndex;
      this._selectedIndex = _loc2_;
      this.close();
      this.updateSelectedItem();
   }
   function onDataChange(event)
   {
      this.updateSelectedItem();
   }
   function toggleMenu(event)
   {
      !!this._selected?this.close():this.open();
   }
   function handleStageClick(event)
   {
      if(this.hitTest(_root._xmouse,_root._ymouse,true))
      {
         return undefined;
      }
      this.close();
   }
   function hitTest(x, y, shapeFlag)
   {
      return super.hitTest(x,y,shapeFlag) || (!(this._dropdown && this.isOpen)?false:this._dropdown.hitTest(x,y,shapeFlag));
   }
}
