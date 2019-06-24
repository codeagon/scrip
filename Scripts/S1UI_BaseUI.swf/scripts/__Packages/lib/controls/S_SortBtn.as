class lib.controls.S_SortBtn extends MovieClip
{
   var _sorting = true;
   var _space = 1;
   var SORTSOUND = lib.manager.UISound.MAIN_BTN;
   var _sortBtnWidth = 0;
   var totalWidth = 0;
   function S_SortBtn()
   {
      super();
      _global.gfxExtensions = true;
      this._columCount = this._colums.length;
      this.draw();
   }
   function setDisable(btnIndexs)
   {
      var _loc3_ = 0;
      while(_loc3_ < btnIndexs.length)
      {
         var _loc2_ = this["sortBtn" + btnIndexs[_loc3_]];
         _loc2_.disable = true;
         _loc2_.labelFd.textColor = 4544364;
         _loc2_.bgmc.normalMc._visible = false;
         _loc2_.bgmc.overMc._visible = false;
         _loc2_.bgmc.pressMc._visible = false;
         _loc2_.bgmc.disableMc._visible = true;
         _loc3_ = _loc3_ + 1;
      }
   }
   function setSortEnable(flag, btnIndexs)
   {
      if(btnIndexs == undefined)
      {
         this._sorting = flag;
      }
      else
      {
         var _loc2_ = 0;
         while(_loc2_ < btnIndexs.length)
         {
            var _loc3_ = this["sortBtn" + btnIndexs[_loc2_]];
            _loc3_.sortEnable = flag;
            _loc2_ = _loc2_ + 1;
         }
      }
   }
   function __set__colums(clms)
   {
      if(clms == undefined)
      {
         return undefined;
      }
      this._columCount = clms.length;
      this._colums = clms;
      this.draw();
      return this.__get__colums();
   }
   function __set__labels(lbs)
   {
      if(lbs == undefined)
      {
         return undefined;
      }
      this._labels = lbs;
      this.draw();
      return this.__get__labels();
   }
   function draw()
   {
      var _loc4_ = undefined;
      var _this = this;
      this.totalWidth = 0;
      var _loc3_ = 0;
      while(_loc3_ < this._columCount)
      {
         var _loc2_ = this["sortBtn" + _loc3_];
         if(_loc2_ == undefined)
         {
            _loc2_ = this.sortBtn0.duplicateMovieClip("sortBtn" + _loc3_,this.getNextHighestDepth());
         }
         _loc2_.index = _loc3_;
         _loc2_.disable = false;
         _loc2_.sortEnable = true;
         this.totalWidth = this.totalWidth + this.resize(this._colums[_loc3_],_loc3_);
         _loc2_.labelFd.verticalAlign = "center";
         _loc2_.labelFd.textAutoSize = "shrink";
         _loc2_.labelFd.text = this._labels[_loc3_];
         _loc2_.bgmc.normalMc._visible = true;
         _loc2_.labelFd.textColor = lib.info.TextColor.SORTBTN_NORMAL;
         _loc2_.pressed = false;
         if(this._sorting)
         {
            _loc2_.onRollOver = function()
            {
               if(!this.sortEnable || this.disable)
               {
                  return undefined;
               }
               this.bgmc.normalMc._visible = false;
               this.bgmc.overMc._visible = true;
               this.labelFd.textColor = lib.info.TextColor.SORTBTN_OVER;
            };
            _loc2_.onRollOut = _loc2_.onReleaseOutside = function()
            {
               if(!this.sortEnable || this.disable)
               {
                  return undefined;
               }
               this.bgmc.normalMc._visible = true;
               this.labelFd.textColor = lib.info.TextColor.SORTBTN_NORMAL;
               if(this.pressed)
               {
                  this.labelFd._y = this.labelFd._y - 1;
                  this.pressed = false;
               }
            };
            _loc2_.onPress = function()
            {
               if(!this.sortEnable || this.disable)
               {
                  return undefined;
               }
               this.bgmc.normalMc._visible = false;
               this.bgmc.overMc._visible = false;
               this.bgmc.pressMc._visible = true;
               this.labelFd.textColor = lib.info.TextColor.SORTBTN_PRESS;
               this.pressed = true;
               this.labelFd._y = this.labelFd._y + 1;
            };
            _loc2_.onRelease = function()
            {
               if(!this.sortEnable || this.disable)
               {
                  return undefined;
               }
               this.bgmc.normalMc._visible = false;
               this.bgmc.overMc._visible = true;
               this.bgmc.pressMc._visible = false;
               this.labelFd.textColor = lib.info.TextColor.SORTBTN_OVER;
               lib.manager.UISound.play(_this.SORTSOUND);
               _this.onSelected(this.index);
               if(this.pressed)
               {
                  this.labelFd._y = this.labelFd._y - 1;
                  this.pressed = false;
               }
            };
         }
         _loc4_ = _loc2_;
         _loc3_ = _loc3_ + 1;
      }
   }
   function __set__sortBtnWidth(w)
   {
      this._sortBtnWidth = w;
      this.draw();
      return this.__get__sortBtnWidth();
   }
   function resize(w, i)
   {
      var _loc6_ = this["sortBtn" + (i - 1)];
      var _loc5_ = this["sortBtn" + i];
      if(this._sortBtnWidth != 0 && i == this._columCount - 1)
      {
         w = this._sortBtnWidth - (_loc6_._x + _loc6_.bgmc._width + this._space);
      }
      _loc5_.bgmc._width = w;
      _loc5_.labelFd._width = w;
      _loc5_.labelFd._height = _loc5_.bgmc._height;
      _loc5_.labelFd.text = this._labels[i];
      if(i != 0)
      {
         var _loc2_ = 0;
         var _loc4_ = 0;
         while(_loc2_ < i)
         {
            _loc4_ = _loc4_ + (this._colums[_loc2_] + this._space);
            _loc2_ = _loc2_ + 1;
         }
         _loc5_._x = _loc4_;
      }
      return w;
   }
   function setReSize(i, w)
   {
      var _loc4_ = this._colums[i] - w;
      this._colums[i] = Math.max(w,0);
      if(this._colums[i + 1] != undefined)
      {
         this._colums[i + 1] = Math.max(this._colums[i + 1] + _loc4_,0);
      }
      var _loc2_ = i;
      while(_loc2_ < this._columCount)
      {
         this.resize(this._colums[_loc2_],_loc2_);
         _loc2_ = _loc2_ + 1;
      }
   }
   function __get__columCount()
   {
      return this._columCount;
   }
   function clear()
   {
      var _loc2_ = 1;
      while(this["sortBtn" + _loc2_] != undefined)
      {
         this["sortBtn" + _loc2_].removeMovieClip();
         _loc2_ = _loc2_ + 1;
      }
   }
   function onSelected(index)
   {
   }
}
