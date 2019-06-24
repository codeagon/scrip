class lib.controls.S_ListGrid
{
   var nameString = "line";
   var fieldName = "txt_";
   var effectName = "effect_mc";
   var sellLinkId = "line";
   var _scroll = 0;
   var lineHeight = lib.manager.UISkin.LISTLINE_HEIGHT;
   var vSpace = lib.manager.UISkin.LISTLINE_SPACE;
   var leftMargine = lib.manager.UISkin.LISTLINE_LMARGINE;
   var topMargine = lib.manager.UISkin.LISTLINE_TMARGINE;
   var startContainerY = 0;
   var _togleMode = true;
   function S_ListGrid(containermc, dsplines, sc, linkId)
   {
      this.containerMc = containermc;
      if(linkId != undefined)
      {
         this.sellLinkId = linkId;
      }
      this.scroller = (lib.controls.S_SimpleScrollBar)sc;
      this.displyLines = dsplines;
      this.startContainerY = containermc._y;
      if(arguments[4])
      {
         var _loc3_ = arguments[4];
         for(var _loc4_ in _loc3_)
         {
            this[_loc4_] = _loc3_[_loc4_];
         }
      }
      this.init();
   }
   function init()
   {
      this.setScroller(this.scroller);
      this.clear();
   }
   function setScroller(scbar)
   {
      this.scroller = (lib.controls.S_SimpleScrollBar)scbar;
      if(this.scroller != undefined)
      {
         this.scroller.addListener(this);
         this.scroller.setWheel(this.containerMc);
         this.scroller.__set__rowHeight(this.lineHeight + this.vSpace);
         this.scroller.__set__displaySize((this.lineHeight + this.vSpace) * this.displyLines + this.vSpace * (this.displyLines - 1));
      }
   }
   function add(_fieldData)
   {
      var _loc2_ = this.createLine(this.total);
      this.setLineData(_loc2_,_fieldData);
      this.total = this.total + 1;
      this.refresh();
      lib.Debuger.trace("S_ListGrid  add  " + _loc2_);
      return _loc2_;
   }
   function insert(index, _fieldData)
   {
      if(this.total == 0)
      {
         this.add();
      }
      var _loc2_ = index;
      while(_loc2_ < this.total)
      {
         var _loc3_ = this.containerMc[this.nameString + _loc2_];
         _loc3_._name = this.nameString + (_loc2_ + 1);
         _loc2_ = _loc2_ + 1;
      }
      var _loc5_ = this.createLine(index);
      this.setLineData(_loc5_,_fieldData);
      if(this._selectedIndex != undefined && this._selectedIndex >= index)
      {
         this._selectedIndex = this._selectedIndex + 1;
      }
      this.total = this.total + 1;
      this.refresh();
      return _loc3_;
   }
   function update(index, _fieldData)
   {
      var _loc2_ = this.fromIndex(index);
      this.setLineData(_loc2_,_fieldData);
      return _loc2_;
   }
   function fromIndex(index)
   {
      return this.containerMc[this.nameString + index];
   }
   function fromId(id)
   {
      var _loc2_ = 0;
      while(_loc2_ < this.total)
      {
         var _loc3_ = this.containerMc[this.nameString + _loc2_];
         if(_loc3_.id == id)
         {
            return _loc3_;
         }
         _loc2_ = _loc2_ + 1;
      }
      return undefined;
   }
   function remove(mc)
   {
      if(mc != undefined)
      {
         var _loc4_ = mc.index;
         if(this._selectedIndex != undefined)
         {
            if(this._selectedIndex > _loc4_)
            {
               this.__set__selectedIndex(this.__get__selectedIndex() - 1);
            }
            else if(this._selectedIndex == _loc4_)
            {
               this.__set__selectedIndex(undefined);
            }
         }
         mc.removeMovieClip();
         var _loc2_ = _loc4_ + 1;
         while(_loc2_ < this.total)
         {
            var _loc3_ = this.containerMc[this.nameString + _loc2_];
            _loc3_._name = this.nameString + (_loc2_ - 1);
            _loc2_ = _loc2_ + 1;
         }
         this.total = this.total - 1;
      }
      this.refresh();
   }
   function removeIndex(index)
   {
      var _loc5_ = this.containerMc[this.nameString + index];
      if(_loc5_ != undefined)
      {
         if(this._selectedIndex != undefined)
         {
            if(this._selectedIndex > index)
            {
               this.__set__selectedIndex(this.__get__selectedIndex() - 1);
            }
            else if(this._selectedIndex == index)
            {
               this.__set__selectedIndex(undefined);
            }
         }
         _loc5_.removeMovieClip();
         var _loc2_ = index + 1;
         while(_loc2_ < this.total)
         {
            var _loc3_ = this.containerMc[this.nameString + _loc2_];
            _loc3_._name = this.nameString + (_loc2_ - 1);
            _loc2_ = _loc2_ + 1;
         }
         this.total = this.total - 1;
      }
      this.refresh();
   }
   function removeId(id)
   {
      var _loc2_ = 0;
      while(_loc2_ < this.total)
      {
         var _loc3_ = this.containerMc[this.nameString + _loc2_];
         if(_loc3_.id == id)
         {
            if(this._selectedIndex != undefined)
            {
               if(this._selectedIndex > _loc3_.index)
               {
                  this.__set__selectedIndex(this.__get__selectedIndex() - 1);
               }
               else if(this._selectedIndex == _loc3_.index)
               {
                  this.__set__selectedIndex(undefined);
               }
            }
            var _loc5_ = _loc3_.index;
            _loc3_.removeMovieClip();
            _loc2_ = _loc5_ + 1;
            while(_loc2_ < this.total)
            {
               var _loc4_ = this.containerMc[this.nameString + _loc2_];
               _loc4_._name = this.nameString + (_loc2_ - 1);
               _loc2_ = _loc2_ + 1;
            }
            this.total = this.total - 1;
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
      this.refresh();
   }
   function clear()
   {
      while(true)
      {
         this.total = this.total - 1;
         if(this.total > 0)
         {
            var _loc2_ = this.containerMc[this.nameString + this.total];
            _loc2_.removeMovieClip();
            continue;
         }
         break;
      }
      this.total = 0;
      this.__set__selected(false);
      this.refresh();
   }
   function __set__togleMode(__togleMode)
   {
      this._togleMode = __togleMode;
      return this.__get__togleMode();
   }
   function __set__selectedIndex(index)
   {
      this._selectedIndex = index;
      this._selected = this._selectedIndex != undefined;
      this.onSelect(this._selectedIndex,this._selected);
      return this.__get__selectedIndex();
   }
   function __get__selectedIndex()
   {
      return this._selectedIndex;
   }
   function __get__selectedId()
   {
      var _loc2_ = this.fromIndex(this._selectedIndex);
      return _loc2_.id;
   }
   function __set__selected(select)
   {
      this.__set__selectedIndex(undefined);
      return this.__get__selected();
   }
   function __get__selected()
   {
      return this._selected;
   }
   function setSelect(index)
   {
      var _loc2_ = this.fromIndex(this.__get__selectedIndex());
      this.releaseStyle(_loc2_);
      _loc2_[this.effectName].gotoAndStop(1);
      _loc2_ = this.fromIndex(index);
      this.__set__selectedIndex(index);
      this.activeStyle(_loc2_);
      _loc2_[this.effectName].gotoAndStop("active");
   }
   function refresh()
   {
      var _loc4_ = Math.max(this.total,this.displyLines);
      var _loc3_ = 0;
      while(_loc3_ < _loc4_)
      {
         var _loc2_ = this.containerMc[this.nameString + _loc3_];
         _loc2_.index = _loc3_;
         _loc2_._x = this.leftMargine;
         _loc2_._y = this.topMargine + _loc3_ * (this.lineHeight + this.vSpace);
         if(this._selectedIndex != _loc3_)
         {
            if(_loc2_.disable)
            {
               this.disableStyle(_loc2_);
               _loc2_[this.effectName].gotoAndStop(1);
            }
            else
            {
               this.normalStyle(_loc2_);
               _loc2_[this.effectName].gotoAndStop(1);
            }
         }
         if(this.scroller != undefined)
         {
            _loc2_._visible = _loc3_ >= this.scroller.__get__scroll() && _loc3_ < this.scroller.__get__scroll() + this.displyLines;
         }
         _loc3_ = _loc3_ + 1;
      }
      this.scroller.__set__pageSize(this.total * (this.lineHeight + this.vSpace));
   }
   function setLineData(lineMc, _fieldData)
   {
      for(var _loc3_ in _fieldData)
      {
         if(lineMc[_loc3_] instanceof TextField)
         {
            lineMc[_loc3_].setText(_fieldData[_loc3_]);
         }
         else
         {
            lineMc[_loc3_] = _fieldData[_loc3_];
         }
      }
   }
   function createLine(index)
   {
      lib.Debuger.trace("createLine  " + index + "/" + this.sellLinkId + "   " + this.containerMc.getNextHighestDepth() + "   " + (this.nameString + index));
      var _loc2_ = this.containerMc.attachMovie(this.sellLinkId,this.nameString + index,this.containerMc.getNextHighestDepth() + 2);
      lib.Debuger.trace(this.containerMc + "   createLine  " + _loc2_);
      var _this = this;
      _loc2_.onLoad = function()
      {
         lib.Debuger.trace(" >>>>>  createLine  " + this);
      };
      _loc2_.hit.onPress = function()
      {
         _this.pressStyle(this._parent);
         this._parent[_this.effectName].gotoAndStop(1);
         _this.onPress();
      };
      _loc2_.hit.onRelease = function()
      {
         var _loc2_ = _this.containerMc[_this.nameString + _this._selectedIndex];
         if(_this._togleMode)
         {
            _this.releaseStyle(_loc2_);
            _loc2_[_this.effectName].gotoAndStop(1);
            if(_this._selectedIndex != this._parent.index)
            {
               _this.selectedIndex = this._parent.index;
               _this.onRelease(this._parent.index);
               _this.activeStyle(this._parent);
               this._parent[_this.effectName].gotoAndStop("active");
            }
            else
            {
               _this.selectedIndex = undefined;
               _this.onRelease(undefined);
            }
         }
         else
         {
            if(_this._selectedIndex != this._parent.index)
            {
               _this.releaseStyle(_loc2_);
               _loc2_[_this.effectName].gotoAndStop(1);
               _this.selectedIndex = this._parent.index;
            }
            _this.onRelease(this._parent.index);
            _this.activeStyle(this._parent);
            this._parent[_this.effectName].gotoAndStop("active");
         }
      };
      _loc2_.hit.onRollOver = function()
      {
         if(_this._selectedIndex != this._parent.index)
         {
            _this.overStyle(this._parent);
            this._parent[_this.effectName].gotoAndStop("over");
            _this.onRollOver();
         }
      };
      _loc2_.hit.onRollOut = _loc2_.hit.onReleaseOutside = function()
      {
         if(_this._selectedIndex != this._parent.index)
         {
            _this.outStyle(this._parent);
            this._parent[_this.effectName].gotoAndStop("out");
            _this.onRollOut();
         }
      };
      return _loc2_;
   }
   function onScroll(sc)
   {
      this._scroll = this.scroller.scroll;
      this.containerMc._y = this.startContainerY - sc;
      var _loc2_ = 0;
      while(_loc2_ < this.total)
      {
         var _loc3_ = this.containerMc[this.nameString + _loc2_];
         _loc3_._visible = _loc2_ >= this.scroller.__get__scroll() && _loc2_ < this.scroller.__get__scroll() + this.displyLines;
         _loc2_ = _loc2_ + 1;
      }
   }
   function setVisible(flag)
   {
      this.containerMc._visible = flag;
      this.scroller.__set__show(flag);
   }
   function normalStyle(lineMc)
   {
      for(var _loc2_ in lineMc)
      {
         if(lineMc[_loc2_] instanceof TextField)
         {
            lineMc[_loc2_].textColor = lib.info.TextColor.LIST_NORMAL;
         }
      }
   }
   function overStyle(lineMc)
   {
      for(var _loc2_ in lineMc)
      {
         if(lineMc[_loc2_] instanceof TextField)
         {
            lineMc[_loc2_].textColor = lib.info.TextColor.LIST_OVER;
         }
      }
   }
   function outStyle(lineMc)
   {
      for(var _loc2_ in lineMc)
      {
         if(lineMc[_loc2_] instanceof TextField)
         {
            lineMc[_loc2_].textColor = lib.info.TextColor.LIST_NORMAL;
         }
      }
   }
   function pressStyle(lineMc)
   {
      for(var _loc2_ in lineMc)
      {
         if(lineMc[_loc2_] instanceof TextField)
         {
            lineMc[_loc2_].textColor = lib.info.TextColor.LIST_PRESS;
         }
      }
   }
   function releaseStyle(lineMc)
   {
      for(var _loc2_ in lineMc)
      {
         if(lineMc[_loc2_] instanceof TextField)
         {
            lineMc[_loc2_].textColor = lib.info.TextColor.LIST_NORMAL;
         }
      }
   }
   function activeStyle(lineMc)
   {
      for(var _loc2_ in lineMc)
      {
         if(lineMc[_loc2_] instanceof TextField)
         {
            lineMc[_loc2_].textColor = lib.info.TextColor.LIST_ACTIVE;
         }
      }
   }
   function disableStyle(lineMc)
   {
      for(var _loc2_ in lineMc)
      {
         if(lineMc[_loc2_] instanceof TextField)
         {
            lineMc[_loc2_].textColor = lib.info.TextColor.LIST_NORMAL;
         }
      }
   }
   function onPress()
   {
   }
   function onRollOver()
   {
   }
   function onRollOut()
   {
   }
   function onRelease(__selectindex)
   {
   }
   function onSelect(__selectindex, __selected)
   {
   }
}
