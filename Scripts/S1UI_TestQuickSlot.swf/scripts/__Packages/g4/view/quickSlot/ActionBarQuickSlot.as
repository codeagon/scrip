class g4.view.quickSlot.ActionBarQuickSlot extends gfx.controls.ItemSlot implements gfx.interfaces.IListItemRenderer
{
   static var COOL_TIME_CHANGED = "coolTimeChanged";
   var bitmapName = "ONTIME";
   var boxWidth = 38;
   var dataChanged = false;
   var iconData = {};
   var iconDataChanged = false;
   var _dragEnabled = true;
   var _shortCut = "";
   function ActionBarQuickSlot()
   {
      super();
      this.scale9Grid = new flash.geom.Rectangle(0,0,1,1);
      this.iconLinkage = "SlotIcon";
   }
   function setListData(index, label, selected)
   {
      this.index = index;
      this.__set__selected(selected);
   }
   function setData(data)
   {
   }
   function toString()
   {
      return "[g4.view.quickSlot.ActionBarQuickSlot " + this._name + "]";
   }
   function configUI()
   {
      super.configUI();
      this.trackAsMenu = true;
      this._data = {};
      this.icons = this.icon;
      this.icon.addEventListener("dataChange",this,"icon_dataChangeHandler");
      this.countTF.hitTestDisable = true;
      this.coolTimeTF.hitTestDisable = true;
      this.coolTimeTF.textAutoSize = "shrink";
      this.shortCutTF.hitTestDisable = true;
      (g4.view.quickSlot.QuickSlotButton)this.button.boxWidth = (g4.view.quickSlot.QuickSlotButton)this.button.boxHeight = this.boxWidth;
      (g4.view.quickSlot.QuickSlotButton)this.button.setBitmap(this.bitmapName);
   }
   function draw()
   {
      super.draw();
      if(this.dataChanged)
      {
         this.dataChanged = false;
         if(this._data)
         {
            if(this.icon.__get__TEX() && this.icon.__get__TEX() != "")
            {
               (g4.view.quickSlot.QuickSlotButton)this.button.__set__effect(!this._data.effect?false:this._data.effect);
               (g4.view.quickSlot.QuickSlotButton)this.button.__set__active(!this._data.active?false:this._data.active);
               (g4.view.quickSlot.QuickSlotButton)this.button.__set__impossible(!this._data.impossible?false:this._data.impossible);
               (g4.view.quickSlot.QuickSlotButton)this.button.__set__playCoolTime(!this._data.playCoolTime?0:this._data.playCoolTime);
               (g4.view.quickSlot.QuickSlotButton)this.button.__set__playCoolTimeEffect(!this._data.playCoolTimeEffect?0:this._data.playCoolTimeEffect);
            }
         }
         else
         {
            this.iconDataChanged = false;
            this.cleanUpSlot();
         }
      }
      if(this.iconDataChanged)
      {
         this.iconDataChanged = false;
         this.icon.__set__luxury(this.iconData.luxury != undefined?this.iconData.luxury:false);
         this.icon.__set__grade(this.iconData.grade != undefined?this.iconData.grade:0);
         this.updateIconData();
      }
   }
   function update()
   {
      this.invalidateData();
   }
   function beginDrag()
   {
      delete this.onMouseMove;
      this.validateNow();
      this.dragOrigin = true;
      this.oriImpossible = (g4.view.quickSlot.QuickSlotButton)this.button.impossible;
      (g4.view.quickSlot.QuickSlotButton)this.button.__set__impossible(true);
      var _loc2_ = gfx.managers.DragManager.__get__instance().startDrag(this.button,this.iconLinkage,this.__get__data(),this,this.icons,true);
      _loc2_.iconWidth = this._data.iconWidth;
      _loc2_.iconHeight = this._data.iconHeight;
      _loc2_.TEX = this._data.TEX;
      _loc2_.grade = this._data.grade;
   }
   function allowDrop(data)
   {
      return this._dragEnabled && super.allowDrop(data);
   }
   function acceptDrop(data)
   {
      var _loc2_ = gfx.managers.DragManager.__get__instance().relatedObject;
      if(_loc2_ && _loc2_ instanceof g4.view.quickSlot.ActionBarQuickSlot)
      {
         if(this.icon.__get__TEX() == "")
         {
            _loc2_.cleanUpSlot();
         }
         else
         {
            _loc2_.data = this._data;
         }
      }
      this.__set__data(data);
      flash.external.ExternalInterface.call("slotDrop",this._name,this.index);
      this.dispatchEvent({type:"drop",data:data});
   }
   function cleanUpSlot()
   {
      var _loc2_ = (g4.view.quickSlot.QuickSlotButton)this.button;
      _loc2_.__set__effect(false);
      _loc2_.__set__active(false);
      _loc2_.__set__impossible(false);
      _loc2_.__set__playCoolTime(0);
      _loc2_.__set__playCoolTimeEffect(0);
      _loc2_.__set__black(false);
      this.icon.removeIcon();
      this.iconData = {};
      this._data = {};
      this.countTF.text = "";
      this.coolTimeTF.text = "";
   }
   function invalidateData()
   {
      this.dataChanged = true;
      this.invalidate();
   }
   function invalidateIcon()
   {
      this.iconDataChanged = true;
      this.invalidate();
   }
   function updateIconData()
   {
      this._data.luxury = this.icon.luxury;
      this._data.grade = this.icon.grade;
      this._data.TEX = this.icon.TEX;
      this._data.iconWidth = this.icon.iconWidth;
      this._data.iconHeight = this.icon.iconHeight;
   }
   function handlePress(event)
   {
      if(this.icon.__get__TEX() == "" || gfx.managers.DragManager.__get__instance().__get__inDrag())
      {
         return undefined;
      }
      if(this._dragEnabled && (event.button == undefined || event.button == 1))
      {
         Mouse.hide();
         flash.external.ExternalInterface.call("slotDragBegin",this._name,this.index);
         this.onMouseMove = this.beginDrag;
      }
      if(event.button == 2 && !(g4.view.quickSlot.QuickSlotButton)this.button.__get__black())
      {
         this.propagateEvent(event);
      }
   }
   function handleRelease(event)
   {
      delete this.onMouseMove;
      if(this.icon.__get__TEX() == "")
      {
         return undefined;
      }
      if(event.button == 2)
      {
         this.propagateEvent(event);
      }
   }
   function dragEnd(event)
   {
      if(this.dragOrigin)
      {
         Mouse.show();
         if(event.dropTarget == null && !event.cancelled)
         {
            this.cleanUpSlot();
            flash.external.ExternalInterface.call("slotDraw",this._name,this.index);
         }
         else if(event.cancelled)
         {
            (g4.view.quickSlot.QuickSlotButton)this.button.__set__impossible(this.oriImpossible);
            flash.external.ExternalInterface.call("slotDragCancelled",this._name,this.index);
         }
         this.dragOrigin = false;
         flash.external.ExternalInterface.call("slotDragEnd",this._name,this.index);
      }
   }
   function icon_dataChangeHandler(event)
   {
      this.updateIconData();
   }
   function __get__effect()
   {
      return (g4.view.quickSlot.QuickSlotButton)this.button.__get__effect();
   }
   function __set__effect(value)
   {
      this._data.effect = value;
      this.invalidateData();
      return this.__get__effect();
   }
   function __get__active()
   {
      return (g4.view.quickSlot.QuickSlotButton)this.button.__get__active();
   }
   function __set__active(value)
   {
      this._data.active = value;
      this.invalidateData();
      return this.__get__active();
   }
   function __get__impossible()
   {
      return (g4.view.quickSlot.QuickSlotButton)this.button.__get__impossible();
   }
   function __set__impossible(value)
   {
      this._data.impossible = value;
      this.invalidateData();
      return this.__get__impossible();
   }
   function __get__playCoolTime()
   {
      return (g4.view.quickSlot.QuickSlotButton)this.button.__get__playCoolTime();
   }
   function __set__playCoolTime(value)
   {
      this._data.playCoolTime = value;
      this.invalidateData();
      return this.__get__playCoolTime();
   }
   function __get__playCoolTimeEffect()
   {
      return (g4.view.quickSlot.QuickSlotButton)this.button.__get__playCoolTimeEffect();
   }
   function __set__playCoolTimeEffect(value)
   {
      this._data.playCoolTimeEffect = value;
      this.invalidateData();
      return this.__get__playCoolTimeEffect();
   }
   function __get__shortCut()
   {
      return this._shortCut;
   }
   function __set__shortCut(value)
   {
      this._shortCut = value;
      var _loc2_ = lib.info.KeyMap.toKeyCode(value);
      if("LeftMouseButton" == value)
      {
         _loc2_ = "L-Click";
         var _loc4_ = new TextFormat();
         _loc4_.align = "center";
         this.shortCutTF.setNewTextFormat(_loc4_);
      }
      else if("RightMouseButton" == value)
      {
         _loc2_ = "R-Click";
         _loc4_ = new TextFormat();
         _loc4_.align = "center";
         this.shortCutTF.setNewTextFormat(_loc4_);
      }
      this.shortCutTF.textAutoSize = "shrink";
      this.shortCutTF.text = _loc2_;
      return this.__get__shortCut();
   }
   function __get__luxury()
   {
      return this.icon.__get__luxury();
   }
   function __set__luxury(value)
   {
      this.iconData.luxury = value;
      this.invalidateIcon();
      return this.__get__luxury();
   }
   function __get__grade()
   {
      return this.icon.__get__grade();
   }
   function __set__grade(value)
   {
      if(this.icon.__get__grade() == value)
      {
         return undefined;
      }
      this.iconData.grade = value;
      this.invalidateIcon();
      return this.__get__grade();
   }
   function __get__dragEnabled()
   {
      return this._dragEnabled;
   }
   function __set__dragEnabled(value)
   {
      this.dragTarget.__set__dragEnabled(value);
      this._dragEnabled = value;
      return this.__get__dragEnabled();
   }
   function __get__black()
   {
      return (g4.view.quickSlot.QuickSlotButton)this.button.__get__black();
   }
   function __set__black(value)
   {
      (g4.view.quickSlot.QuickSlotButton)this.button.__set__black(value);
      return this.__get__black();
   }
}
