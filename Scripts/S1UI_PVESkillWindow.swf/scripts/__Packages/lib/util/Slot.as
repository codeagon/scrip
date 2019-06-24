class lib.util.Slot extends MovieClip
{
   var canDrag = true;
   var isActive = false;
   var canEffect = true;
   var impossibleSlot = false;
   var _disable = false;
   var _display = false;
   var _durability = 0;
   var _disableslot = false;
   var _sealType = 0;
   var bMasterpiece = 0;
   var bNew = 0;
   function Slot()
   {
      super();
      this.o = this;
      this.btnWork();
      this.init();
      this.o.num_txt.textColor = lib.info.TextColor.SLOT_NUMBER;
      this.o.num_txt.textAutoSize = "shrink";
      this.centerCount_txt = this.Count.txt;
      this.centerCount_txt.textAutoSize = "shrink";
      this.coolTimeDraw_mc = this.CoolTime;
      this.GetNameWork();
      this.onInit();
   }
   function setData(data)
   {
      this.clear();
      this.slotData = (lib.gamedata.GameDataCoolTimeable)data;
      this.slotData.addEventListener(lib.gfx.events.EventTypes.COOLTIME_START,this,"cooltimeHandler");
      this.slotData.addEventListener(lib.gfx.events.EventTypes.COOLTIME_END,this,"cooltimeHandler");
      this.slotData.addEventListener(lib.gfx.events.EventTypes.COOLTIME_TICK,this,"cooltimeHandler");
      this.slotData.addEventListener(lib.gfx.events.EventTypes.COOLTIME_UPDATE,this,"cooltimeHandler");
      if(data instanceof lib.gamedata.Item)
      {
         this.draw(data.getImg());
         this.id = data.getId();
         this.__set__grade(data.getGrade());
         this.__set__sealType(data.getSealType());
         this.__set__masterpiece(data.getMasterpiece());
         this.__set__num(data.getStackedNum());
         this.__set__New(data.getIsNew());
         var _loc4_ = data.getDisableState();
         if(_loc4_ == 1)
         {
            this.__set__impossible(true);
         }
         else if(_loc4_ == 2)
         {
            this.__set__disable(true);
         }
         else
         {
            this.__set__impossible(false);
            this.__set__disable(false);
         }
         this.__set__durability(data.getDurability());
         this.o.num_txt._visible = data.getStackable();
      }
      else if(data instanceof lib.gamedata.Skill)
      {
         this.draw(data.getImg());
         this.id = data.getId();
         var _loc3_ = data.getStackedNum();
         this.__set__num(!(_loc3_ == 0 || _loc3_ == "0")?_loc3_:"");
         _loc4_ = data.getDisableState();
         if(_loc4_ == 1)
         {
            this.__set__impossible(true);
         }
         else if(_loc4_ == 2)
         {
            this.__set__disable(true);
         }
         else
         {
            this.__set__impossible(false);
            this.__set__disable(false);
         }
      }
   }
   function getData()
   {
      return this.slotData;
   }
   function init()
   {
      this.o.ICONCLASS_DISPLAY._visible = false;
      this.o.ICONCLASS._visible = false;
      this.o.FX_OVER._visible = false;
      this.o.FX_PRESS._visible = false;
      this.o.FX_ACTIVE._visible = false;
      this.o.FX_IMPOSSIBLE._visible = false;
      this.o.FX_DISABLE._visible = false;
      this.o.FX_DISABLESLOT._visible = false;
      this.o.BG_FRAME._visible = false;
      this.o.BG_DISPLAY._visible = false;
      this.o.BG_EMPTY._visible = true && this.canDrag;
      this.o.up_txt.text = "";
      this.o.center_txt.text = "";
      this.o.down_txt.text = "";
      this.o.num_txt.text = "";
   }
   function btnWork()
   {
      this.setRollOver();
      this.setRollOut();
      this.setPress();
      this.setRelease();
      this.setReleaseOutside();
   }
   function GetNameWork()
   {
      this.o.SLOT.GetName = function()
      {
         if(this._parent._parent.FX_PRESS)
         {
            return this._parent._parent._name;
         }
         return this._parent._name;
      };
   }
   function draw(imgStr, w, h)
   {
      w = w != undefined?w:50;
      h = h != undefined?h:50;
      if(lib.util.DrawBitmap.draw(this.o.Icon,imgStr,w,h) != undefined)
      {
         this.o.BG_FRAME._visible = true;
         this.o.BG_EMPTY._visible = false;
         this.__set__impossible(this.impossible);
         return true;
      }
      return false;
   }
   function clear()
   {
      this.__set__New(0);
      this.__set__masterpiece(0);
      this.__set__sealType(0);
      this.__set__disable(false);
      this.__set__impossible(false);
      this.__set__durability(0);
      this.slotData.removeEventListener(lib.gfx.events.EventTypes.COOLTIME_START,this,"cooltimeHandler");
      this.slotData.removeEventListener(lib.gfx.events.EventTypes.COOLTIME_END,this,"cooltimeHandler");
      this.slotData.removeEventListener(lib.gfx.events.EventTypes.COOLTIME_TICK,this,"cooltimeHandler");
      this.slotData.removeEventListener(lib.gfx.events.EventTypes.COOLTIME_UPDATE,this,"cooltimeHandler");
      lib.manager.ToolTip.remove(this.o.SLOT);
      lib.util.DrawBitmap.draw(this.o.Icon,"");
      this.centerCount_txt.text = "";
      this.coolTimeDraw_mc.clear();
      this.slotData.removeCoolTime();
      this.slotData = null;
      this.o.num_txt.textColor = lib.info.TextColor.SLOT_NUMBER;
      this.init();
   }
   function setPress(func)
   {
      this.o.SLOT.onPress = function()
      {
         if(!_global.control)
         {
            if(this._parent.drag)
            {
               if(this._parent._parent.FX_PRESS)
               {
                  if(this._parent.Icon.TEX != undefined && this._parent.Icon.TEX != null && this._parent.Icon.TEX != "")
                  {
                     _root.checkStartDrag(true,this._parent._parent,this._parent.Icon);
                  }
               }
               else if(this._parent.Icon.TEX != undefined && this._parent.Icon.TEX != null && this._parent.Icon.TEX != "")
               {
                  _root.checkStartDrag(true,this._parent,this._parent.Icon);
               }
            }
            func();
            this._parent.onPress2();
         }
         if(this._parent.effect)
         {
            this._parent.FX_PRESS._visible = true;
            this._parent._parent.SLOT.onPress();
         }
      };
   }
   function setRelease(func)
   {
      this.o.SLOT.onRelease = function()
      {
         if(_global.control)
         {
            if(this._parent._parent.FX_PRESS)
            {
               if(this._parent.Icon.TEX != undefined && this._parent.Icon.TEX != null && this._parent.Icon.TEX != "")
               {
                  _root.ToGame_CTRLMouseDown(_root.currentUI._name,this._parent._parent.id);
               }
            }
            else if(this._parent.Icon.TEX != undefined && this._parent.Icon.TEX != null && this._parent.Icon.TEX != "")
            {
               _root.ToGame_CTRLMouseDown(_root.currentUI._name,this._parent.id);
            }
         }
         else
         {
            if(this._parent.drag)
            {
               if(this._parent._parent.FX_PRESS)
               {
                  _root.checkStartDrag(false,this._parent._parent,this._parent.Icon);
               }
               else
               {
                  _root.checkStartDrag(false,this._parent,this._parent.Icon);
               }
            }
            func();
            this._parent.onRelease2();
         }
         if(this._parent.effect)
         {
            this._parent.FX_PRESS._visible = false;
            this._parent._parent.SLOT.onRelease();
         }
      };
   }
   function setRollOver(func)
   {
      var _loc2_ = this;
      this.o.SLOT.onRollOver = function()
      {
         func();
         this._parent.onRollOver2();
         if(this._parent.effect)
         {
            this._parent._parent.FX_OVER._visible = true;
         }
      };
   }
   function setRollOut(func)
   {
      var _loc2_ = this;
      this.o.SLOT.onRollOut = function()
      {
         func();
         this._parent.onRollOut2();
         if(this._parent.effect)
         {
            this._parent._parent.FX_OVER._visible = false;
         }
      };
   }
   function setReleaseOutside(func)
   {
      this.o.SLOT.onReleaseOutside = function()
      {
         if(this._parent.drag)
         {
            if(this._parent._parent.FX_PRESS)
            {
               _root.checkStartDrag(false,this._parent._parent,this._parent.Icon);
            }
            else
            {
               _root.checkStartDrag(false,this._parent,this._parent.Icon);
            }
         }
         if(this._parent.effect)
         {
            this._parent.FX_PRESS._visible = false;
            this._parent._parent.FX_PRESS._visible = false;
            this._parent._parent.FX_OVER._visible = false;
         }
         func();
         this._parent.onReleseOutside2();
      };
   }
   function __get__num()
   {
      return this._num;
   }
   function __set__num(str)
   {
      if(str == undefined)
      {
         return undefined;
      }
      str = String(str);
      var _loc3_ = new TextFormat();
      if(str.length >= 4)
      {
         _loc3_.size = 18;
         this.o.num_txt.setNewTextFormat(_loc3_);
      }
      else
      {
         _loc3_.size = 20;
         this.o.num_txt.setNewTextFormat(_loc3_);
      }
      this._num = str;
      this.o.num_txt.text = str;
      this.o.num_txt.textColor = !(this.impossibleSlot || this._disable)?lib.info.TextColor.SLOT_NUMBER:lib.info.TextColor.SLOT_NUMBER_DISABLED;
      return this.__get__num();
   }
   function __get__TEX()
   {
      return this.o.Icon.TEX;
   }
   function __get__impossible()
   {
      return this.impossibleSlot;
   }
   function __set__impossible(bTrue)
   {
      this.impossibleSlot = bTrue;
      this.o.num_txt.textColor = !bTrue?lib.info.TextColor.SLOT_NUMBER:lib.info.TextColor.SLOT_NUMBER_DISABLED;
      var _loc3_ = new flash.geom.Transform(this.o.Icon);
      var _loc2_ = undefined;
      if(bTrue)
      {
         _loc2_ = lib.info.ColorTrans.slotImpossibleTrans();
      }
      else
      {
         _loc2_ = lib.info.ColorTrans.enableTrans();
      }
      _loc3_.colorTransform = _loc2_;
      return this.__get__impossible();
   }
   function __get__disable()
   {
      return this._disable;
   }
   function __set__disable(bTrue)
   {
      if(bTrue == undefined)
      {
         return undefined;
      }
      this._disable = bTrue;
      this.o.num_txt.textColor = !bTrue?lib.info.TextColor.SLOT_NUMBER:lib.info.TextColor.SLOT_NUMBER_DISABLED;
      var _loc4_ = new flash.geom.Transform(this.o.Icon);
      var _loc2_ = undefined;
      if(bTrue)
      {
         _loc2_ = lib.info.ColorTrans.slotDisableTrans();
      }
      else
      {
         _loc2_ = lib.info.ColorTrans.enableTrans();
      }
      _loc4_.colorTransform = _loc2_;
      return this.__get__disable();
   }
   function __get__durability()
   {
      return this._durability;
   }
   function __set__durability(index)
   {
      if(index == 1 || index == 2)
      {
         this._durability = index;
         var _loc4_ = this.getParentName();
         if(_loc4_ == "paperdoll")
         {
            _root.OnGameEvent("OnGame_PaperDoll_SetDurability",index,this.o.BG_FRAME);
         }
         else if(_loc4_ == "inventory")
         {
            _root.OnGameEvent("OnGame_InventoryWindow_SetDurability",index,this.o.BG_FRAME);
         }
         else if(_loc4_ == "warehousewindow")
         {
            _root.OnGameEvent("OnGame_WareHouse_SetDurability",index,this.o.BG_FRAME);
         }
      }
      else
      {
         this._durability = 0;
         if(this.o.BG_FRAME.DRB_Mc)
         {
            this.o.BG_FRAME.DRB_Mc.removeMovieClip();
         }
      }
      return this.__get__durability();
   }
   function getParentName()
   {
      var _loc6_ = String(this.o._parent);
      var _loc4_ = _loc6_.split(".");
      var _loc5_ = _loc4_.length;
      var _loc3_ = 0;
      while(_loc3_ < _loc5_)
      {
         var _loc2_ = _loc4_[_loc3_];
         _loc2_ = _loc2_.toLowerCase();
         if(_loc2_ == "paperdoll")
         {
            return "paperdoll";
         }
         if(_loc2_ == "inventory")
         {
            return "inventory";
         }
         if(_loc2_ == "warehousewindow")
         {
            return "warehousewindow";
         }
         _loc3_ = _loc3_ + 1;
      }
      return "";
   }
   function __set__disableSlot(bTrue)
   {
      this._disableslot = bTrue;
      this.o.FX_DISABLESLOT._visible = bTrue;
      this.o.BG_EMPTY._visible = !bTrue;
      this.o.SLOT.enabled = !bTrue;
      return this.__get__disableSlot();
   }
   function __get__disableSlot()
   {
      return this._disableslot;
   }
   function __get__drag()
   {
      return this.canDrag;
   }
   function __set__drag(bTrue)
   {
      this.canDrag = bTrue;
      return this.__get__drag();
   }
   function __set__display(bTrue)
   {
      if(bTrue == undefined)
      {
         return undefined;
      }
      this._display = bTrue;
      this.__set__drag(!bTrue);
      this.o.BG_DISPLAY._visible = bTrue;
      this.o.BG_FRAME._visible = !bTrue;
      this.__set__grade(this._grade);
      return this.__get__display();
   }
   function __get__display()
   {
      return this._display;
   }
   function __get__active()
   {
      return this.isActive;
   }
   function __set__active(bTrue)
   {
      if(bTrue == undefined)
      {
         return undefined;
      }
      this.isActive = bTrue;
      if(this.o.effect)
      {
         if(bTrue)
         {
            this.o.FX_ACTIVE._visible = true;
            if(this.o.FX_ACTIVE._totalframes != 1 && this.o.FX_ACTIVE._currentframe == 1)
            {
               this.o.FX_ACTIVE.gotoAndPlay(2);
            }
         }
         else
         {
            this.o.FX_ACTIVE._visible = false;
            if(this.o.FX_ACTIVE._totalframes != 1)
            {
               this.o.FX_ACTIVE.gotoAndStop(1);
            }
         }
      }
      return this.__get__active();
   }
   function __get__effect()
   {
      return this.canEffect;
   }
   function __set__effect(bTrue)
   {
      this.canEffect = bTrue;
      if(bTrue)
      {
         this.o.FX_OVER._visible = this.saveOVER;
         this.o.FX_PRESS._visible = this.savePRESS;
         this.o.FX_ACTIVE._visible = this.saveACTIVE;
         this.o.FX_IMPOSSIBLE._visible = this.saveIMPOSSIBLE;
         this.o.FX_DISABLE._visible = this.saveDISABLE;
      }
      else
      {
         this.saveOVER = this.o.FX_OVER._visible;
         this.savePRESS = this.o.FX_PRESS._visible;
         this.saveACTIVE = this.o.FX_ACTIVE._visible;
         this.saveIMPOSSIBLE = this.o.FX_IMPOSSIBLE._visible;
         this.saveDISABLE = this.o.FX_DISABLE._visible;
         this.o.FX_OVER._visible = false;
         this.o.FX_PRESS._visible = false;
         this.o.FX_ACTIVE._visible = false;
         this.o.FX_IMPOSSIBLE._visible = false;
         this.o.FX_DISABLE._visible = false;
      }
      return this.__get__effect();
   }
   function __set__grade(_g)
   {
      if(_g == undefined)
      {
         _g = 0;
      }
      this._grade = Number(_g);
      this.o.ICONCLASS_DISPLAY._visible = this.display;
      this.o.ICONCLASS._visible = !this.__get__display();
      var _loc2_ = !this._display?this.o.ICONCLASS:this.o.ICONCLASS_DISPLAY;
      _loc2_._visible = this._grade > 0;
      if(this._grade > 0)
      {
         _loc2_.gotoAndStop(this._grade);
      }
      return this.__get__grade();
   }
   function __get__grade()
   {
      return this._grade;
   }
   function onLoad()
   {
      if(this.__get__grade() != undefined)
      {
         this.__set__grade(this._grade);
      }
      if(this.__get__impossible())
      {
         this.__set__impossible(this.impossible);
      }
      if(this.__get__disable())
      {
         this.__set__disable(this.disable);
      }
      if(this.__get__display())
      {
         this.__set__display(this.display);
      }
      if(this.__get__active())
      {
         this.__set__active(this.active);
      }
      this.__set__num(this.num);
   }
   function onUnload()
   {
      this.clear();
   }
   function __get__sealType()
   {
      return this._sealType;
   }
   function __set__sealType(type)
   {
      var _loc3_ = undefined;
      this._sealType = Number(type);
      if(this._sealType == 0)
      {
         var _loc2_ = this[lib.util.SlotInnerAttacher.INNER_CONTAINER_TOP][lib.util.SlotInnerAttacher.ICON_SEAL];
         while(_loc2_ != undefined)
         {
            _loc2_.removeMovieClip();
            _loc2_ = this[lib.util.SlotInnerAttacher.INNER_CONTAINER_TOP][lib.util.SlotInnerAttacher.ICON_SEAL];
         }
         _loc2_ = this[lib.util.SlotInnerAttacher.INNER_CONTAINER_TOP][lib.util.SlotInnerAttacher.ICON_SEAL_ANCIENT];
         while(_loc2_ != undefined)
         {
            _loc2_.removeMovieClip();
            _loc2_ = this[lib.util.SlotInnerAttacher.INNER_CONTAINER_TOP][lib.util.SlotInnerAttacher.ICON_SEAL_ANCIENT];
         }
      }
      else if(this._sealType == 1)
      {
         _loc3_ = lib.util.SlotInnerAttacher.attach(this,lib.util.SlotInnerAttacher.ICON_SEAL,{align:"C",name:lib.util.SlotInnerAttacher.ICON_SEAL,depth:"top"});
      }
      else if(this._sealType == 2)
      {
         _loc3_ = lib.util.SlotInnerAttacher.attach(this,lib.util.SlotInnerAttacher.ICON_SEAL_ANCIENT,{align:"C",name:lib.util.SlotInnerAttacher.ICON_SEAL_ANCIENT,depth:"top"});
      }
      _loc3_.hitTestDisable = true;
      return this.__get__sealType();
   }
   function __get__masterpiece()
   {
      return this.bMasterpiece;
   }
   function __set__masterpiece(bTrue)
   {
      var _loc3_ = undefined;
      this.bMasterpiece = Number(bTrue);
      if(this.bMasterpiece == 1)
      {
         _loc3_ = lib.util.SlotInnerAttacher.attach(this,lib.util.SlotInnerAttacher.ICON_MASTERPIECE,{align:"BR",rightMargin:1,bottomMargin:1,name:lib.util.SlotInnerAttacher.ICON_MASTERPIECE,depth:"icon"});
      }
      else if(this.bMasterpiece == 2)
      {
         _loc3_ = lib.util.SlotInnerAttacher.attach(this,"wakeup",{align:"BR",rightMargin:1,bottomMargin:1,name:lib.util.SlotInnerAttacher.ICON_MASTERPIECE,depth:"icon"});
      }
      else
      {
         var _loc2_ = this[lib.util.SlotInnerAttacher.INNER_CONTAINER_ICON][lib.util.SlotInnerAttacher.ICON_MASTERPIECE];
         while(_loc2_ != undefined)
         {
            _loc2_.removeMovieClip();
            _loc2_ = this[lib.util.SlotInnerAttacher.INNER_CONTAINER_ICON][lib.util.SlotInnerAttacher.ICON_MASTERPIECE];
         }
      }
      _loc3_.hitTestDisable = true;
      return this.__get__masterpiece();
   }
   function __get__New()
   {
      return this.bNew;
   }
   function __set__New(bTrue)
   {
      this.bNew = Number(bTrue);
      var _loc3_ = this[lib.util.SlotInnerAttacher.INNER_CONTAINER_TOP][lib.util.SlotInnerAttacher.ICON_NEW];
      if(this.bNew == 1)
      {
         if(_loc3_ == undefined)
         {
            _loc3_ = lib.util.SlotInnerAttacher.attach(this,lib.util.SlotInnerAttacher.ICON_NEW,{align:"TL",leftMargin:2,topMargin:2,name:lib.util.SlotInnerAttacher.ICON_NEW,depth:"top"});
         }
         else
         {
            _loc3_.gotoAndPlay(2);
         }
      }
      else
      {
         var _loc2_ = this[lib.util.SlotInnerAttacher.INNER_CONTAINER_TOP][lib.util.SlotInnerAttacher.ICON_NEW];
         while(_loc2_ != undefined)
         {
            _loc2_.removeMovieClip();
            _loc2_ = this[lib.util.SlotInnerAttacher.INNER_CONTAINER_TOP][lib.util.SlotInnerAttacher.ICON_NEW];
         }
      }
      _loc3_.hitTestDisable = true;
      return this.__get__New();
   }
   function onInit()
   {
   }
   function cooltimeHandler(event)
   {
      var _loc3_ = event.target;
      if(event.type != lib.gfx.events.EventTypes.COOLTIME_START)
      {
         if(event.type == lib.gfx.events.EventTypes.COOLTIME_END)
         {
            this.centerCount_txt.text = "";
            this.coolTimeDraw_mc.clear();
         }
         else if(event.type == lib.gfx.events.EventTypes.COOLTIME_TICK)
         {
            this.centerCount_txt.text = _loc3_.getCoolTimeLocalizedRemain();
            lib.util.CoolTime.draw(this.coolTimeDraw_mc,50,50,360 - _loc3_.getCoolTimeDegree(),0,60,true);
         }
         else if(event.type == lib.gfx.events.EventTypes.COOLTIME_UPDATE)
         {
         }
      }
   }
   function hideAllBg()
   {
      this.o.BG_FRAME._visible = false;
      this.o.BG_EMPTY._visible = false;
      this.o.BG_DISPLAY._visible = false;
   }
   function hideBg()
   {
      this.o.BG_FRAME._visible = false;
      this.o.BG_EMPTY._visible = true;
      this.o.BG_DISPLAY._visible = false;
   }
   function showBg()
   {
      this.o.BG_FRAME._visible = true;
      this.o.BG_EMPTY._visible = false;
      this.o.BG_DISPLAY._visible = false;
   }
}
