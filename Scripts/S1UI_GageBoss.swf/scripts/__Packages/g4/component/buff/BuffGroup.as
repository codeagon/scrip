class g4.component.buff.BuffGroup extends gfx.core.UIComponent
{
   var _buffGap = 0;
   var _buffWidth = 28;
   function BuffGroup()
   {
      super();
      this._array_buff = [];
      this._array_debuff = [];
      this._array_pool = [];
   }
   function eventRelay($event)
   {
      this.dispatchEvent($event);
   }
   function getItem()
   {
      var _loc2_ = undefined;
      if(this._array_pool.length > 0)
      {
         _loc2_ = (g4.component.buff.BuffItem)this._array_pool.pop();
         _loc2_.__set__visible(true);
      }
      else
      {
         var _loc3_ = this.getNextHighestDepth();
         _loc2_ = (g4.component.buff.BuffItem)this.attachMovie("BuffItem","mBuff" + _loc3_,_loc3_);
      }
      return _loc2_;
   }
   function addBuff($id, $stack, $type, $relax, $img, $remain, $total)
   {
      $id = Number($id);
      $stack = Number($stack);
      $type = Number($type);
      $relax = Number($relax);
      $remain = Number($remain);
      $total = Number($total);
      var _loc9_ = undefined;
      var _loc15_ = undefined;
      if($type == 0)
      {
         _loc9_ = this._array_buff;
      }
      else
      {
         _loc9_ = this._array_debuff;
      }
      var _loc2_ = this.searchBuff($id,$type,false);
      if(_loc2_ == null)
      {
         _loc2_ = this.getItem();
         _loc2_.addEventListener("remove_buff",this,"eventRelay");
         _loc2_.id = $id;
         _loc2_.setType($type);
         _loc2_.setStack($stack);
         _loc9_.push(_loc2_);
         if($relax != 1)
         {
            if($total == 0)
            {
               _loc2_.deleteCool();
               _loc2_.mCount._visible = false;
               _loc2_.mCoolTime._visible = false;
            }
            else
            {
               _loc2_.mCoolTime._visible = true;
               _loc2_.mCount._visible = true;
               _loc2_.cool = new lib.util.CoolTime($remain,$total);
               if($remain <= 0)
               {
                  _loc2_.deleteCool();
                  this.dispatchEvent({type:"remove_buff",id:$id});
               }
               else
               {
                  _loc2_.delegateFunction();
               }
            }
         }
         else
         {
            _loc2_.remain = $remain;
            _loc2_.total = $total;
            _loc2_.mIcon.transform.colorTransform = lib.info.ColorTrans.disableTrans();
         }
         _loc2_.id = $id;
         _loc2_.relax = $relax;
         _loc2_.drawIcon($img,24,24);
         if($relax == 1)
         {
            var _loc12_ = $img.substr(19,$img.length);
            lib.manager.ToolTip.add(_loc2_.SLOT,_loc12_,5,_loc2_.mIcon);
         }
         else
         {
            var _loc11_ = $img.substr(20,$img.length);
            lib.manager.ToolTip.add(_loc2_.SLOT,_loc11_,4,_loc2_.mIcon);
         }
      }
      this.align();
   }
   function updateBuff($id, $stack, $relax, $img, $remain, $total)
   {
      $id = Number($id);
      $stack = Number($stack);
      $relax = Number($relax);
      $remain = Number($remain);
      $total = Number($total);
      var _loc2_ = this.searchBuff($id);
      if($img != undefined)
      {
         _loc2_.drawIcon($img);
      }
      _loc2_.setStack($stack);
      if(_loc2_.relax == 1 && $relax != undefined)
      {
         if($relax != 1)
         {
            _loc2_.deleteCool();
            _loc2_.mCount._visible = false;
            _loc2_.mIcon.transform.colorTransform = lib.info.ColorTrans.disableTrans();
         }
         else
         {
            _loc2_.mCount._visible = true;
            _loc2_.mIcon.transform.colorTransform = lib.info.ColorTrans.enableTrans();
            _loc2_.remain = $remain;
            _loc2_.total = $total;
         }
      }
      if(_loc2_.relax == 1 && $relax == 0)
      {
         return undefined;
      }
      if($total == 0)
      {
         lib.util.Warning.remove(_loc2_);
         _loc2_.warn = false;
         _loc2_.deleteCool();
         _loc2_.mCount._visible = false;
         _loc2_.mCoolTime._visible = false;
         return undefined;
      }
      _loc2_.mCount._visible = true;
      _loc2_.mCoolTime._visible = true;
      if($remain != null && $total != null)
      {
         _loc2_.deleteCool();
         if($remain <= 0)
         {
            this.dispatchEvent({type:"remove_buff",id:$id});
            return undefined;
         }
         _loc2_.cool = new lib.util.CoolTime($remain,$total);
         lib.util.Warning.remove(_loc2_,true);
         _loc2_.warn = false;
         _loc2_.delegateFunction();
      }
   }
   function removeBuff($id)
   {
      $id = Number($id);
      var _loc2_ = this.searchBuff($id,-1,true);
      if(_loc2_ != null)
      {
         lib.util.Warning.remove(_loc2_,true);
         _loc2_.deleteCool();
         _loc2_._alpha = 100;
         _loc2_.__set__visible(false);
         _loc2_.mCount.textField.text = "";
         this._array_pool.push(_loc2_);
         _loc2_._x = 0;
         this.align();
      }
   }
   function clearBuff($type)
   {
      if($type == null)
      {
         var _loc7_ = this._array_buff.length;
         var _loc2_ = 0;
         while(_loc2_ < _loc7_)
         {
            this.dispatchEvent({type:"remove_buff",id:(g4.component.buff.BuffItem)this._array_buff[_loc2_].id});
            _loc2_ = _loc2_ + 1;
         }
         _loc7_ = this._array_debuff.length;
         _loc2_ = 0;
         while(_loc2_ < _loc7_)
         {
            this.dispatchEvent({type:"remove_buff",id:(g4.component.buff.BuffItem)this._array_debuff[_loc2_].id});
            _loc2_ = _loc2_ + 1;
         }
         return undefined;
      }
      $type = Number($type);
      var _loc3_ = undefined;
      if(isNaN($type))
      {
         _loc3_ = this._array_buff.concat(this._array_debuff);
      }
      else if($type == 0)
      {
         _loc3_ = this._array_buff;
      }
      else if($type >= 1)
      {
         _loc3_ = this._array_debuff;
      }
      _loc7_ = _loc3_.length;
      _loc2_ = 0;
      while(_loc2_ < _loc7_)
      {
         if((g4.component.buff.BuffItem)_loc3_[_loc2_].type == $type)
         {
            this.dispatchEvent({type:"remove_buff",id:(g4.component.buff.BuffItem)_loc3_[_loc2_].id});
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function holdBuff($id)
   {
      $id = Number($id);
      var _loc2_ = this.searchBuff($id,-1,false);
      if(_loc2_ != null)
      {
         _loc2_.deleteCool();
      }
   }
   function align()
   {
      this._array_buff.sortOn("relax",Array.DESCENDING);
      this._array_debuff.sortOn("relax",Array.DESCENDING);
      var _loc4_ = this._array_buff.concat(this._array_debuff);
      var _loc5_ = _loc4_.length;
      var _loc3_ = 0;
      var _loc2_ = 0;
      while(_loc2_ < _loc5_)
      {
         _loc4_[_loc2_]._x = _loc3_;
         _loc3_ = _loc3_ + (this._buffGap + this._buffWidth);
         _loc2_ = _loc2_ + 1;
      }
   }
   function searchBuff($id, $type, $remove)
   {
      if($type == null)
      {
         $type = -1;
      }
      if($remove == null)
      {
         $remove = false;
      }
      if($type == -1)
      {
         var _loc2_ = 0;
         while(_loc2_ < this._array_buff.length)
         {
            if((g4.component.buff.BuffItem)this._array_buff[_loc2_].id == $id)
            {
               var _loc5_ = (g4.component.buff.BuffItem)this._array_buff[_loc2_];
               if($remove)
               {
                  this._array_buff.splice(_loc2_,1);
               }
               return _loc5_;
            }
            _loc2_ = _loc2_ + 1;
         }
         _loc2_ = 0;
         while(_loc2_ < this._array_debuff.length)
         {
            if((g4.component.buff.BuffItem)this._array_debuff[_loc2_].id == $id)
            {
               _loc5_ = this._array_debuff[_loc2_];
               if($remove)
               {
                  this._array_debuff.splice(_loc2_,1);
               }
               return _loc5_;
            }
            _loc2_ = _loc2_ + 1;
         }
         return null;
      }
      if($type == 0)
      {
         _loc2_ = 0;
         while(_loc2_ < this._array_buff.length)
         {
            if((g4.component.buff.BuffItem)this._array_buff[_loc2_].id == $id)
            {
               _loc5_ = (g4.component.buff.BuffItem)this._array_buff[_loc2_];
               if($remove)
               {
                  this._array_buff.splice(_loc2_,1);
               }
               return _loc5_;
            }
            _loc2_ = _loc2_ + 1;
         }
         return null;
      }
      if($type >= 1)
      {
         _loc2_ = 0;
         while(_loc2_ < this._array_debuff.length)
         {
            if((g4.component.buff.BuffItem)this._array_debuff[_loc2_].id == $id)
            {
               _loc5_ = (g4.component.buff.BuffItem)this._array_debuff[_loc2_];
               if($remove)
               {
                  this._array_debuff.splice(_loc2_,1);
               }
               return _loc5_;
            }
            _loc2_ = _loc2_ + 1;
         }
         return null;
      }
   }
}
