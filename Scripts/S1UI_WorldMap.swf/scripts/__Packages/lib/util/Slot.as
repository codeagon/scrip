class lib.util.Slot extends MovieClip
{
   var canDrag = true;
   var isActive = false;
   var canEffect = true;
   var impossibleSlot = false;
   function Slot()
   {
      super();
      this.o = this;
      this.btnWork();
      this.init();
      this.o.num_txt.textColor = lib.info.TextColor.SLOT_NUMBER;
      this.GetNameWork();
   }
   function init()
   {
      this.o.FX_OVER._visible = false;
      this.o.FX_PRESS._visible = false;
      this.o.FX_ACTIVE._visible = false;
      this.o.FX_IMPOSSIBLE._visible = false;
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
   function draw(imgStr)
   {
      lib.util.DrawBitmap.draw(this.o.Icon,imgStr,50,50);
   }
   function clear()
   {
      lib.util.DrawBitmap.draw(this.o.Icon,"");
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
      return this.o.num_txt.text;
   }
   function __set__num(str)
   {
      str = String(str);
      var _loc2_ = new TextFormat();
      if(str.length >= 4)
      {
         _loc2_.size = 18;
         this.o.num_txt.setNewTextFormat(_loc2_);
      }
      else
      {
         _loc2_.size = 20;
         this.o.num_txt.setNewTextFormat(_loc2_);
      }
      this.o.num_txt.text = str;
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
      if(this.o.effect)
      {
         if(bTrue)
         {
            this.o.FX_IMPOSSIBLE._visible = true;
         }
         else
         {
            this.o.FX_IMPOSSIBLE._visible = false;
         }
      }
      return this.__get__impossible();
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
   function __get__active()
   {
      return this.isActive;
   }
   function __set__active(bTrue)
   {
      this.isActive = bTrue;
      if(this.o.effect)
      {
         if(bTrue)
         {
            this.o.FX_ACTIVE._visible = true;
         }
         else
         {
            this.o.FX_ACTIVE._visible = false;
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
      }
      else
      {
         this.saveOVER = this.o.FX_OVER._visible;
         this.savePRESS = this.o.FX_PRESS._visible;
         this.saveACTIVE = this.o.FX_ACTIVE._visible;
         this.saveIMPOSSIBLE = this.o.FX_IMPOSSIBLE._visible;
         this.o.FX_OVER._visible = false;
         this.o.FX_PRESS._visible = false;
         this.o.FX_ACTIVE._visible = false;
         this.o.FX_IMPOSSIBLE._visible = false;
      }
      return this.__get__effect();
   }
}
