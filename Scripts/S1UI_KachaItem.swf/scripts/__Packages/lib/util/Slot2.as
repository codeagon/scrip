class lib.util.Slot2 extends MovieClip
{
   static var test = "Slot2";
   var canDrag = true;
   var isActive = false;
   var canEffect = true;
   var impossibleSlot = false;
   var _disable = false;
   var _display = false;
   var _lineNum = 3;
   var _empty = false;
   var _sealType = 0;
   var bMasterpiece = 0;
   function Slot2()
   {
      super();
      this.o = this;
      this.createLoadChecker();
      this.btnWork();
      this.o.up_txt.textColor = lib.info.TextColor.SLOT_NAME;
      this.o.center_txt.textColor = lib.info.TextColor.SLOT_CENTER;
      this.o.down_txt.textColor = lib.info.TextColor.SLOT_MONEY;
      this.txt_array = new Array();
      this.txt_array[0] = this.o.up_txt;
      this.txt_array[1] = this.o.center_txt;
      this.txt_array[2] = this.o.down_txt;
      this.GetNameWork();
      this.resize();
      this.clear();
   }
   function clear()
   {
      this.__set__masterpiece(0);
      this.__set__sealType(0);
      this.__set__disable(false);
      this.__set__impossible(false);
      lib.util.DrawBitmap.draw(this.o.Slot.Icon,"");
      this.o.FX_OVER._visible = false;
      this.o.FX_PRESS._visible = false;
      this.o.FX_ACTIVE._visible = false;
      this.o.FX_IMPOSSIBLE._visible = false;
      this.o.FX_DISABLE._visible = false;
      this.o.FX_DRAGABLE._visible = false;
      this.o.BG_DISPLAY._visible = false;
      this.o.BG._visible = false;
      this.o.gageBg_mc._visible = false;
      this.o.gageBar_mc._visible = false;
      this.o.gageBar_mc._width = 0;
      this.o.Slot._visible = false;
      this.o.Slot.clear();
      this.o.up_txt.text = "";
      this.o.center_txt.text = "";
      this.o.down_txt.text = "";
      this.o.Slot.num_txt.text = "";
      this.showMoney(false);
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
         return this._parent._name;
      };
   }
   function resize()
   {
      this.slotWidth = this._width;
      this._xscale = 100;
      this.o.SLOT._width = this.slotWidth;
      this.o.FX_OVER._width = this.slotWidth;
      this.o.FX_PRESS._width = this.slotWidth;
      this.o.FX_ACTIVE._width = this.slotWidth;
      this.o.FX_IMPOSSIBLE._width = this.slotWidth;
      this.o.FX_DISABLE._width = this.slotWidth;
      this.o.BG._width = this.slotWidth;
      this.o.BG_DISPLAY._width = this.slotWidth;
      this.o.BG_EMPTY._width = this.slotWidth;
      this.o.money_mc._x = this.slotWidth - this.o.money_mc._width - 2;
      this.o.up_txt._width = this.slotWidth - this.o.up_txt._x;
      this.o.center_txt._width = this.slotWidth - this.o.center_txt._x;
      this.o.down_txt._width = !this.o.money_mc._visible?this.slotWidth - this.o.down_txt._x - 4:this.o.money_mc._x - this.o.down_txt._x;
      this.o.gageBg_mc._width = this.slotWidth - this.o.gageBg_mc._x - 6;
   }
   function __get__upText()
   {
      return this.o.up_txt.text;
   }
   function __set__upText(str)
   {
      lib.util.ExtString.textCut(this.o.up_txt,str);
      return this.__get__upText();
   }
   function __get__centerText()
   {
      return this.o.center_txt.text;
   }
   function __set__centerText(str)
   {
      lib.util.ExtString.textCut(this.o.center_txt,str);
      return this.__get__centerText();
   }
   function __get__downText()
   {
      return this.o.down_txt.text;
   }
   function __set__downText(str)
   {
      lib.util.ExtString.textCut(this.o.down_txt,str);
      return this.__get__downText();
   }
   function draw(imgStr)
   {
      if(imgStr != "" && imgStr != undefined)
      {
         this.o.Slot._visible = true;
      }
      lib.util.DrawBitmap.draw(this.o.Slot.Icon,imgStr,50,50);
   }
   function setLineNum(num)
   {
      this._lineNum = num;
      if(num == 1)
      {
         this.o.up_txt._height = 63;
         this.o.center_txt._visible = false;
         this.o.down_txt._visible = false;
         this.o.centerLine_mc._visible = false;
      }
      else if(num == 2)
      {
         this.o.up_txt._height = 43;
         this.o.center_txt._visible = false;
         this.o.down_txt._visible = true;
         this.o.centerLine_mc._visible = false;
      }
      else if(num == 3)
      {
         this.o.up_txt._height = 20;
         this.o.center_txt._visible = true;
         this.o.down_txt._visible = true;
         this.o.centerLine_mc._visible = true;
      }
   }
   function showMoney(bTrue)
   {
      this.o.money_mc._visible = bTrue;
      var _loc2_ = this.o.down_txt.getTextFormat();
      if(bTrue)
      {
         _loc2_.font = "$NumberFont";
         _loc2_.size = 14;
         _loc2_.align = "right";
         _loc2_.color = lib.info.TextColor.SLOT_MONEY;
         this.o.down_txt._width = this.o.money_mc._x - this.o.down_txt._x;
         this.o.down_txt.setTextFormat(_loc2_);
      }
      else
      {
         _loc2_.font = "$NormalFont";
         _loc2_.size = 16;
         _loc2_.align = "left";
         _loc2_.color = lib.info.TextColor.SLOT_NAME;
         this.o.down_txt._width = this.slotWidth - this.o.down_txt._x - 4;
         this.o.down_txt.setTextFormat(_loc2_);
      }
   }
   function hideMoney()
   {
      this.o.money_mc._visible = false;
      var _loc2_ = this.o.down_txt.getTextFormat();
      _loc2_.font = "$NormalFont";
      _loc2_.size = 16;
      _loc2_.align = "left";
      _loc2_.color = lib.info.TextColor.SLOT_NAME;
      this.o.down_txt._width = this.slotWidth - this.o.down_txt._x - 4;
      this.o.down_txt.setTextFormat(_loc2_);
   }
   function setPress(func)
   {
      this.o.SLOT.onPress = function()
      {
         if(!_global.control)
         {
            if(this._parent.drag)
            {
               if(this._parent.Slot.Icon.TEX != undefined && this._parent.Slot.Icon.TEX != null && this._parent.Slot.Icon.TEX != "")
               {
                  _root.checkStartDrag(true,this._parent,this._parent.Slot.Icon);
               }
            }
            func();
            this._parent.onPress2();
         }
         if(this._parent.effect)
         {
            this._parent.FX_PRESS._visible = true;
         }
      };
   }
   function setRelease(func)
   {
      this.o.SLOT.onRelease = function()
      {
         if(_global.control)
         {
            _root.ToGame_CTRLMouseDown(_root.currentUI._name,this._parent.id);
         }
         else
         {
            if(this._parent.drag)
            {
               _root.checkStartDrag(false,this._parent,this._parent.Slot.Icon);
            }
            func();
            this._parent.onRelease2();
         }
         if(this._parent.effect)
         {
            this._parent.FX_PRESS._visible = false;
         }
      };
   }
   function setRollOver(func)
   {
      this.o.SLOT.onRollOver = function()
      {
         func();
         this._parent.onRollOver2();
      };
   }
   function setRollOut(func)
   {
      this.o.SLOT.onRollOut = function()
      {
         func();
         this._parent.onRollOut2();
      };
   }
   function setReleaseOutside(func)
   {
      this.o.SLOT.onReleaseOutside = function()
      {
         if(this._parent.drag)
         {
            _root.checkStartDrag(false,this._parent,this._parent.Slot.Icon);
         }
         if(this._parent.effect)
         {
            this._parent.FX_PRESS._visible = false;
         }
         func();
         this._parent.onReleseOutside2();
      };
   }
   function __get__num()
   {
      return this.slotCount;
   }
   function __set__num(str)
   {
      this.slotCount = str;
      if(this.o.Slot.drag != undefined)
      {
         this.o.Slot.num = str;
      }
      return this.__get__num();
   }
   function __get__TEX()
   {
      return this.o.Slot.Icon.TEX;
   }
   function __get__impossible()
   {
      return this.impossibleSlot;
   }
   function __set__impossible(bTrue)
   {
      this.impossibleSlot = bTrue;
      if(this.o.Slot.drag != undefined)
      {
         this.o.Slot.disable = this.impossibleSlot;
      }
      var _loc3_ = new flash.geom.Transform(this.o.Slot.Icon);
      var _loc2_ = undefined;
      if(this.impossibleSlot)
      {
         this.o.FX_IMPOSSIBLE._visible = true;
         _loc2_ = lib.info.ColorTrans.slotDisableTrans();
      }
      else
      {
         this.o.FX_IMPOSSIBLE._visible = false;
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
      this._disable = Boolean(Number(bTrue));
      if(this.o.Slot.drag != undefined)
      {
         this.o.Slot.disable = bTrue;
      }
      var _loc3_ = new flash.geom.Transform(this.o.Slot.Icon);
      var _loc2_ = undefined;
      if(this._disable)
      {
         this.o.FX_DISABLE._visible = true;
         _loc2_ = lib.info.ColorTrans.slotDisableTrans();
      }
      else
      {
         this.o.FX_DISABLE._visible = false;
         _loc2_ = lib.info.ColorTrans.enableTrans();
      }
      _loc3_.colorTransform = _loc2_;
      return this.__get__disable();
   }
   function __get__drag()
   {
      return this.canDrag;
   }
   function __set__drag(bTrue)
   {
      this.canDrag = bTrue;
      if(this.o.Slot._visible)
      {
         this.o.FX_DRAGABLE._visible = true;
      }
      if(this.canDrag)
      {
         this.FX_DRAGABLE.gotoAndStop(1);
      }
      else
      {
         this.FX_DRAGABLE.gotoAndStop(2);
      }
      return this.__get__drag();
   }
   function __set__display(bTrue)
   {
      this._display = bTrue;
      this.__set__drag(!bTrue);
      this.o.BG_DISPLAY._visible = bTrue;
      this.o.BG._visible = !bTrue;
      this.o.Slot._display = bTrue;
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
      if(this.o.Slot.drag != undefined)
      {
         this.o.Slot.grade = this._grade;
      }
      var _loc3_ = lib.info.TextColor["RAREGRADE" + _g];
      this.o.up_txt.textColor = _loc3_;
      return this.__get__grade();
   }
   function __get__grade()
   {
      return this._grade;
   }
   function setDisableBg(b)
   {
      b = Number(b);
      this.__set__drag(!b);
      this.__set__effect(!b);
      this.o.FX_OVER._visible = !b;
      this.o.FX_PRESS._visible = !b;
      this.o.FX_ACTIVE._visible = !b;
      this.o.FX_IMPOSSIBLE._visible = !b;
      this.o.FX_DISABLE._visible = !b;
      this.o.BG_DISPLAY._visible = !b;
      this.o.BG_EMPTY._visible = !b;
   }
   function __set__empty(b)
   {
      this._empty = b;
      this.__set__drag(!b);
      this.__set__effect(!b);
      this.clear();
      this.o.BG_EMPTY._visible = b;
      return this.__get__empty();
   }
   function __get__empty()
   {
      return this._empty;
   }
   function __get__sealType()
   {
      return this._sealType;
   }
   function __set__sealType(type)
   {
      this._sealType = Number(type);
      if(this.o.Slot.drag == undefined)
      {
         return undefined;
      }
      var _loc3_ = undefined;
      if(this._sealType == 0)
      {
         var _loc2_ = this.o.Slot[lib.util.SlotInnerAttacher.INNER_CONTAINER_TOP][lib.util.SlotInnerAttacher.ICON_SEAL];
         while(_loc2_ != undefined)
         {
            _loc2_.removeMovieClip();
            _loc2_ = this.o.Slot[lib.util.SlotInnerAttacher.INNER_CONTAINER_TOP][lib.util.SlotInnerAttacher.ICON_SEAL];
         }
         _loc2_ = this.o.Slot[lib.util.SlotInnerAttacher.INNER_CONTAINER_TOP][lib.util.SlotInnerAttacher.ICON_SEAL_ANCIENT];
         while(_loc2_ != undefined)
         {
            _loc2_.removeMovieClip();
            _loc2_ = this.o.Slot[lib.util.SlotInnerAttacher.INNER_CONTAINER_TOP][lib.util.SlotInnerAttacher.ICON_SEAL_ANCIENT];
         }
      }
      else if(this._sealType == 1)
      {
         _loc3_ = lib.util.SlotInnerAttacher.attach(this.o.Slot,lib.util.SlotInnerAttacher.ICON_SEAL,{align:"C",name:lib.util.SlotInnerAttacher.ICON_SEAL,depth:"top"});
      }
      else if(this._sealType == 2)
      {
         _loc3_ = lib.util.SlotInnerAttacher.attach(this.o.Slot,lib.util.SlotInnerAttacher.ICON_SEAL_ANCIENT,{align:"C",name:lib.util.SlotInnerAttacher.ICON_SEAL_ANCIENT,depth:"top"});
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
      this.bMasterpiece = Number(bTrue);
      if(this.o.Slot.drag == undefined)
      {
         return undefined;
      }
      var _loc3_ = undefined;
      if(this.bMasterpiece == 1)
      {
         _loc3_ = lib.util.SlotInnerAttacher.attach(this.o.Slot,lib.util.SlotInnerAttacher.ICON_MASTERPIECE,{align:"BR",rightMargin:1,bottomMargin:1,name:lib.util.SlotInnerAttacher.ICON_MASTERPIECE,depth:"icon"});
      }
      else if(this.bMasterpiece == 2)
      {
         _loc3_ = lib.util.SlotInnerAttacher.attach(this,"wakeup",{align:"BR",rightMargin:1,bottomMargin:1,name:lib.util.SlotInnerAttacher.ICON_MASTERPIECE,depth:"icon"});
      }
      else
      {
         var _loc2_ = this.o.Slot[lib.util.SlotInnerAttacher.INNER_CONTAINER_ICON][lib.util.SlotInnerAttacher.ICON_MASTERPIECE];
         while(_loc2_ != undefined)
         {
            _loc2_.removeMovieClip();
            _loc2_ = this.o.Slot[lib.util.SlotInnerAttacher.INNER_CONTAINER_ICON][lib.util.SlotInnerAttacher.ICON_MASTERPIECE];
         }
      }
      _loc3_.hitTestDisable = true;
      return this.__get__masterpiece();
   }
   function showGage()
   {
      this.hideMoney();
      this.o.gageBg_mc._visible = true;
      this.o.gageBar_mc._visible = true;
      var _loc2_ = this.o.down_txt.getTextFormat();
      _loc2_.align = "center";
      _loc2_.color = lib.info.TextColor.FILL_SHORT;
      this.o.down_txt._width = this.slotWidth - this.o.down_txt._x - 4;
      this.o.down_txt.setNewTextFormat(_loc2_);
   }
   function hideGage()
   {
      this.hideMoney();
      this.__set__downText("");
      this.o.gageBg_mc._visible = false;
      this.o.gageBar_mc._visible = false;
   }
   function setGage(curNum, totalNum)
   {
      this.__set__downText(curNum + "/" + totalNum);
      if(curNum != 0 && totalNum != 0 && curNum == totalNum)
      {
         this.o.down_txt.textColor = lib.info.TextColor.FILL_FULL;
      }
      else
      {
         this.o.down_txt.textColor = lib.info.TextColor.FILL_SHORT;
      }
      if(curNum != 0 && totalNum != 0)
      {
         this.o.gageBar_mc._width = curNum / totalNum * (this.o.gageBg_mc._width - 2);
      }
      else
      {
         this.o.gageBar_mc._width = 0;
      }
   }
   function hideAllBg()
   {
      this.o.BG._visible = false;
      this.o.BG_EMPTY._visible = false;
      this.o.BG_DISPLAY._visible = false;
      this.o.Slot.hideAllBg();
   }
   function hideBg()
   {
      this.o.BG._visible = false;
      this.o.BG_EMPTY._visible = true;
      this.o.BG_DISPLAY._visible = false;
      this.o.Slot.hideBg();
   }
   function showBg()
   {
      this.o.BG._visible = true;
      this.o.BG_EMPTY._visible = false;
      this.o.BG_DISPLAY._visible = false;
      this.o.Slot.showBg();
   }
   function createLoadChecker()
   {
      var _this = this;
      _this.Slot.onLoad = function()
      {
         if(_this.grade != undefined)
         {
            _this.grade = _this.grade;
         }
         if(_this.num != undefined)
         {
            _this.num = _this.num;
         }
         if(_this.sealType != undefined)
         {
            _this.sealType = _this.sealType;
         }
         if(_this.masterpiece != undefined)
         {
            _this.masterpiece = _this.masterpiece;
         }
         if(_this.impossible != undefined)
         {
            _this.impossible = _this.impossible;
         }
         if(_this.disable != undefined)
         {
            _this.disable = _this.disable;
         }
      };
   }
}
