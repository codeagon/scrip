class lib.util.List implements mx.utils.Iterator
{
   var yGap = 1;
   var xGap = 1;
   var attachName = "list";
   var bg_name = "";
   var useTile = false;
   var maxColumnCount = 2;
   var rowCnt = 0;
   var rowHeight = null;
   var columnWidth = null;
   var bUseLengthAtPrefix = false;
   var bAddAlign = true;
   var bRemoveAlign = true;
   var bUseAlign = true;
   var alignDirection = "BR";
   var _cursor = 0;
   function List(Container, attachName, yGap)
   {
      this.list = new Array();
      this.container = Container;
      this.nextDepth = 0;
      if(attachName != undefined)
      {
         this.attachName = attachName;
      }
      if(yGap != undefined)
      {
         this.yGap = yGap;
      }
   }
   function add(id, linkageOrMc, optionAddIndex)
   {
      this.nextDepth = this.nextDepth + 1;
      var _loc2_ = undefined;
      if(typeof linkageOrMc == "movieclip" && linkageOrMc._parent == this.container)
      {
         _loc2_ = linkageOrMc;
         _loc2_.swapDepths(this.nextDepth);
      }
      else if(typeof linkageOrMc == "string")
      {
         if(this.bUseLengthAtPrefix)
         {
            _loc2_ = this.container.attachMovie(linkageOrMc,this.attachName + this.getLength(),this.nextDepth);
         }
         else
         {
            _loc2_ = this.container.attachMovie(linkageOrMc,this.attachName + this.nextDepth,this.nextDepth);
         }
      }
      _loc2_.id = id;
      if(optionAddIndex != undefined)
      {
         this.list.splice(optionAddIndex,0,_loc2_);
      }
      else
      {
         this.list.push(_loc2_);
      }
      if(this.bAddAlign && this.bUseAlign)
      {
         this.align();
      }
      return _loc2_;
   }
   function remove(id)
   {
      var _loc3_ = false;
      var _loc2_ = undefined;
      if(typeof id == "movieclip")
      {
         _loc2_ = id;
      }
      else
      {
         _loc2_ = this.getLine(id);
      }
      if(_loc2_ != null)
      {
         var _loc5_ = this.getIndex(id);
         _loc2_.removeMovieClip();
         this.list.splice(_loc5_,1);
         if(this.bRemoveAlign && this.bUseAlign)
         {
            this.align();
         }
         _loc3_ = true;
      }
      return _loc3_;
   }
   function slice(removeIndex)
   {
      this.list.splice(removeIndex,1);
      if(this.bRemoveAlign && this.bUseAlign)
      {
         this.align();
      }
   }
   function __get__length()
   {
      return this.list.length;
   }
   function getLength()
   {
      return this.list.length;
   }
   function __set__bg(_bg_name)
   {
      this.bg_name = _bg_name;
      return this.__get__bg();
   }
   function getLine(id)
   {
      var _loc3_ = this.getLength();
      var _loc2_ = 0;
      while(_loc2_ < _loc3_)
      {
         if(this.list[_loc2_].id == id)
         {
            return this.list[_loc2_];
         }
         _loc2_ = _loc2_ + 1;
      }
      return null;
   }
   function getItem(id)
   {
      return this.getLine(id);
   }
   function getItemAt(index)
   {
      if(this.getLength() > 0)
      {
         return this.list[index];
      }
      return null;
   }
   function getIndex(id)
   {
      var _loc3_ = this.getLength();
      var _loc2_ = 0;
      while(_loc2_ < _loc3_)
      {
         if(this.list[_loc2_].id == id)
         {
            return _loc2_;
         }
         _loc2_ = _loc2_ + 1;
      }
      return null;
   }
   function clear()
   {
      var _loc2_ = 0;
      while(_loc2_ < this.list.length)
      {
         var _loc3_ = this.list[_loc2_];
         _loc3_.removeMovieClip();
         _loc2_ = _loc2_ + 1;
      }
      this.list = [];
      this.nextDepth = 0;
   }
   function setHitArea(name)
   {
      this.hitAreaName = name;
   }
   function __get__columnCount()
   {
      return this.maxColumnCount;
   }
   function __set__columnCount(newMaxNum)
   {
      if(newMaxNum > 1)
      {
         this.useTile = true;
      }
      this.maxColumnCount = newMaxNum;
      if(this.bUseAlign)
      {
         this.align();
      }
      return this.__get__columnCount();
   }
   function __get__rowCount()
   {
      return this.rowCnt + 1;
   }
   function sort(option1, option2)
   {
      this.list.sort(option1,option2);
      if(this.bUseAlign)
      {
         this.align();
      }
   }
   function sortOn(option1, option2)
   {
      this.list.sortOn(option1,option2);
      if(this.bUseAlign)
      {
         this.align();
      }
   }
   function getUseAlign()
   {
      return this.bUseAlign;
   }
   function setUseAlign(bTrue)
   {
      this.bUseAlign = bTrue;
      this.align();
   }
   function getAddAlign()
   {
      return this.bAddAlign;
   }
   function setAddAlign(bTrue)
   {
      this.bAddAlign = bTrue;
   }
   function getRemoveAlign()
   {
      return this.bRemoveAlign;
   }
   function setRemoveAlign(bTrue)
   {
      this.bRemoveAlign = bTrue;
   }
   function getAlignDirection()
   {
      return this.alignDirection;
   }
   function setAlignDirection(newDir)
   {
      this.alignDirection = newDir;
      if(newDir == "L" || newDir == "R")
      {
         this.useTile = true;
      }
      if(this.bUseAlign)
      {
         this.align();
      }
   }
   function align(dontPosition)
   {
      if(!this.bUseAlign)
      {
         return undefined;
      }
      var _loc13_ = this.getLength();
      this.rowCnt = 0;
      var _loc3_ = 0;
      var _loc6_ = false;
      var _loc10_ = 0;
      var _loc9_ = 0;
      var _loc4_ = 0;
      var _loc5_ = 0;
      var _loc12_ = new Array();
      var _loc7_ = 0;
      while(_loc7_ < _loc13_)
      {
         var _loc8_ = this.list[_loc7_];
         var _loc2_ = this.list[_loc7_ - 1];
         if(_loc2_[this.hitAreaName] != undefined)
         {
            _loc2_ = _loc2_[this.hitAreaName];
         }
         _loc4_ = _loc10_;
         _loc5_ = _loc9_;
         if(this.bg_name != "" && this.bg_name != undefined && this.bg_name != null)
         {
            if(_loc7_ % 2 != 0)
            {
               _loc8_[this.bg_name].gotoAndStop(2);
            }
            else
            {
               _loc8_[this.bg_name].gotoAndStop(1);
            }
         }
         if(this.useTile)
         {
            if(_loc7_ % this.maxColumnCount == 0 && _loc7_ != 0 && this.alignDirection != "L" && this.alignDirection != "R" && this.alignDirection != "T" && this.alignDirection != "B")
            {
               if(dontPosition != true)
               {
                  _loc8_._x = 0;
               }
               else
               {
                  _loc10_ = 0;
               }
               _loc4_ = 0;
               this.rowCnt = this.rowCnt + 1;
               _loc3_ = 0;
               _loc6_ = true;
            }
            else
            {
               _loc6_ = false;
            }
         }
         switch(this.alignDirection)
         {
            case "T":
               _loc10_ = 0;
               if(this.rowHeight != null)
               {
                  _loc9_ = (- this.rowCnt) * (this.rowHeight + this.yGap);
               }
               else
               {
                  _loc9_ = _loc5_ - _loc2_._height - this.yGap;
               }
               this.rowCnt = this.rowCnt + 1;
               break;
            case "B":
               _loc10_ = 0;
               if(this.rowHeight != null)
               {
                  _loc9_ = this.rowCnt * (this.rowHeight + this.yGap);
               }
               else
               {
                  _loc9_ = _loc5_ + _loc2_._height + this.yGap;
               }
               this.rowCnt = this.rowCnt + 1;
               break;
            case "L":
               if(this.columnWidth != null)
               {
                  _loc10_ = (- _loc3_) * (this.columnWidth + this.xGap);
               }
               else
               {
                  _loc10_ = _loc4_ - _loc2_._width - this.xGap;
               }
               _loc9_ = 0;
               _loc3_ = _loc3_ + 1;
               break;
            case "R":
               if(this.columnWidth != null)
               {
                  _loc10_ = _loc3_ * (this.columnWidth + this.xGap);
               }
               else
               {
                  _loc10_ = _loc4_ + _loc2_._width + this.xGap;
               }
               _loc9_ = 0;
               _loc3_ = _loc3_ + 1;
               break;
            case "TL":
               if(this.rowHeight != null)
               {
                  _loc9_ = (- this.rowCnt) * (this.rowHeight + this.yGap);
               }
               else if(this.useTile && !_loc6_)
               {
                  _loc9_ = _loc5_;
               }
               else
               {
                  _loc9_ = _loc5_ - _loc2_._height - this.yGap;
               }
               if(this.useTile)
               {
                  if(this.columnWidth != null)
                  {
                     _loc10_ = (- _loc3_) * (this.columnWidth + this.xGap);
                  }
                  else if(_loc6_)
                  {
                     _loc10_ = _loc4_;
                  }
                  else
                  {
                     _loc10_ = _loc4_ - _loc2_._width - this.xGap;
                  }
                  _loc3_ = _loc3_ + 1;
               }
               else
               {
                  _loc10_ = 0;
                  this.rowCnt = this.rowCnt + 1;
               }
               break;
            case "TR":
               if(this.rowHeight != null)
               {
                  _loc9_ = (- this.rowCnt) * (this.rowHeight + this.yGap);
               }
               else if(this.useTile && !_loc6_)
               {
                  _loc9_ = _loc5_;
               }
               else
               {
                  _loc9_ = _loc5_ - _loc2_._height - this.yGap;
               }
               if(this.useTile)
               {
                  if(this.columnWidth != null)
                  {
                     _loc10_ = _loc3_ * (this.columnWidth + this.xGap);
                  }
                  else if(_loc6_)
                  {
                     _loc10_ = _loc4_;
                  }
                  else
                  {
                     _loc10_ = _loc4_ + _loc2_._width + this.xGap;
                  }
                  _loc3_ = _loc3_ + 1;
               }
               else
               {
                  _loc10_ = 0;
                  this.rowCnt = this.rowCnt + 1;
               }
               break;
            case "BL":
               if(this.rowHeight != null)
               {
                  _loc9_ = this.rowCnt * (this.rowHeight + this.yGap);
               }
               else if(this.useTile && !_loc6_)
               {
                  _loc9_ = _loc5_;
               }
               else
               {
                  _loc9_ = _loc5_ + _loc2_._height + this.yGap;
               }
               if(this.useTile)
               {
                  if(this.columnWidth != null)
                  {
                     _loc10_ = (- _loc3_) * (this.columnWidth + this.xGap);
                  }
                  else if(_loc6_)
                  {
                     _loc10_ = _loc4_;
                  }
                  else
                  {
                     _loc10_ = _loc4_ - _loc2_._width - this.xGap;
                  }
                  _loc3_ = _loc3_ + 1;
               }
               else
               {
                  _loc10_ = 0;
                  this.rowCnt = this.rowCnt + 1;
               }
               break;
            case "BR":
               if(this.rowHeight != null)
               {
                  _loc9_ = this.rowCnt * (this.rowHeight + this.yGap);
               }
               else if(this.useTile && !_loc6_)
               {
                  _loc9_ = _loc5_;
               }
               else
               {
                  _loc9_ = _loc5_ + _loc2_._height + this.yGap;
               }
               if(this.useTile)
               {
                  if(this.columnWidth != null)
                  {
                     _loc10_ = _loc3_ * (this.columnWidth + this.xGap);
                  }
                  else if(_loc6_)
                  {
                     _loc10_ = _loc4_;
                  }
                  else
                  {
                     _loc10_ = _loc4_ + _loc2_._width + this.xGap;
                  }
                  _loc3_ = _loc3_ + 1;
               }
               else
               {
                  _loc10_ = 0;
                  this.rowCnt = this.rowCnt + 1;
               }
         }
         if(isNaN(_loc10_))
         {
            _loc10_ = 0;
         }
         if(isNaN(_loc9_))
         {
            _loc9_ = 0;
         }
         _loc12_.push({x:_loc10_,y:_loc9_});
         if(dontPosition != true)
         {
            _loc8_._x = _loc10_;
            _loc8_._y = _loc9_;
         }
         _loc7_ = _loc7_ + 1;
      }
      return _loc12_;
   }
   function getIterator()
   {
      return this.createIterator(this);
   }
   function hasNext()
   {
      return this._cursor < this.getLength();
   }
   function next()
   {
      this._cursor = this._cursor + 1;
      return this.getItemAt(this._cursor);
   }
   function createIterator(thisList)
   {
      this._cursor = 0;
      this.iterator = new mx.utils.Iterator();
      this.iterator.hasNext = function()
      {
         return thisList.hasNext();
      };
      this.iterator.next = function()
      {
         return thisList.next();
      };
      return this.iterator;
   }
   function setUseLengthAtPrefix(bTrue)
   {
      this.bUseLengthAtPrefix = bTrue;
   }
}
