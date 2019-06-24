class lib.controls.S_2DepthList_ForQuest extends lib.controls.S_2DepthList
{
   static var preLoadVar = "preLoad";
   var parentLinkID = "2DepthParent_ForQuest";
   var subLinkID = "2DepthSub_ForQuest";
   function S_2DepthList_ForQuest()
   {
      super();
      this.parentObjArray = new Array();
   }
   function addData(parentId, parentName, subId, subName, parentIndexNum, subIndexNum)
   {
      if(this.getSubMc(subId,parentId) != undefined)
      {
         return undefined;
      }
      if(this._data[parentId] == undefined)
      {
         var _loc4_ = this.parentObjArray.length + 1;
         if(_loc4_ == NaN)
         {
            _loc4_ = 1;
         }
         if(parentIndexNum != undefined)
         {
            _loc4_ = parentIndexNum;
            if(_loc4_ < this.parentObjArray.length)
            {
               var _loc6_ = this.parentObjArray.length;
               var _loc2_ = 0;
               while(_loc2_ < _loc6_)
               {
                  if(_loc2_ >= _loc4_)
                  {
                     this.parentObjArray[_loc2_].index = this.parentObjArray[_loc2_].index + 1;
                  }
                  _loc2_ = _loc2_ + 1;
               }
            }
         }
         this._data[parentId] = {id:parentId,name:parentName,sub:[],isOpen:this.fopenState,index:_loc4_};
         this.parentObjArray.push(this._data[parentId]);
         var _loc8_ = this.drawParent(parentId,parentName);
         this.parentObjArray[this.parentObjArray.length - 1].parentMc = _loc8_;
         this.refresh();
      }
      var _loc5_ = this._data[parentId].sub.length + 1;
      if(subIndexNum != undefined)
      {
         _loc5_ = subIndexNum;
         if(_loc5_ < this._data[parentId].sub.length)
         {
            _loc6_ = this._data[parentId].sub.length;
            _loc2_ = 0;
            while(_loc2_ < _loc6_)
            {
               if(_loc2_ >= _loc5_)
               {
                  this._data[parentId].sub[_loc2_].index = this._data[parentId].sub[_loc2_].index + 1;
               }
               _loc2_ = _loc2_ + 1;
            }
         }
      }
      this._data[parentId].sub.push({id:subId,name:subName,index:_loc5_});
      var _loc7_ = this.drawSub(parentId,subId,subName);
      this.resizeLine(_loc7_);
      this._data[parentId].sub[this._data[parentId].sub.length - 1].mc = _loc7_;
      this.alignSub(parentId);
      return _loc7_;
   }
   function drawParent(id, __name)
   {
      this.parentLength = this.parentLength + 1;
      var _loc8_ = this;
      var _loc4_ = this.getNextHighestDepth();
      var _loc2_ = this.createEmptyMovieClip("parentContainer_" + id,_loc4_);
      this._parentDepths.push(_loc2_);
      var _loc6_ = _loc2_.createEmptyMovieClip("subContainer",_loc4_ + 1);
      _loc6_._y = this.PARENTDEPTH_H + this.DEPTH_SPACE;
      _loc6_._x = this.SUBDEPTH_MARGIN;
      var _loc7_ = _loc2_.getNextHighestDepth();
      var _loc3_ = _loc2_.attachMovie(this.parentLinkID,"parentDepth",_loc7_);
      this.resizeLine(_loc3_);
      _loc3_.id = id;
      _loc3_.title = __name;
      this._data[id].mc = _loc3_;
      this._data[id].isOpen = this.fopenState;
      this.onParentDepth(_loc3_);
      return _loc2_;
   }
   function refresh()
   {
      this.parentObjArray.sortOn(["index"],Array.NUMERIC);
      var _loc7_ = this.parentObjArray.length;
      var _loc4_ = 0;
      var _loc3_ = 0;
      while(_loc3_ < _loc7_)
      {
         var _loc2_ = this.parentObjArray[_loc3_].parentMc;
         _loc2_._y = _loc4_;
         var _loc5_ = _loc2_.parentDepth.id;
         var _loc6_ = this._data[_loc5_];
         if(_loc6_.isOpen)
         {
            _loc2_.parentDepth.opened_mc.gotoAndStop(2);
            _loc4_ = _loc4_ + (_loc2_._height + this.DEPTH_SPACE);
         }
         else
         {
            _loc2_.parentDepth.opened_mc.gotoAndStop(1);
            _loc4_ = _loc4_ + _loc2_.parentDepth._height;
         }
         _loc3_ = _loc3_ + 1;
      }
      this.listHeight = _loc4_;
   }
   function clear()
   {
      for(var _loc2_ in this)
      {
         if(typeof this[_loc2_] == "movieclip")
         {
            this[_loc2_].removeMovieClip();
         }
      }
      this.parentLength = 0;
      this.listHeight = 0;
      this._data = {};
      this.selectedMc = undefined;
      this._parentDepths = [];
      this.parentObjArray = [];
      this.refresh();
   }
   function resizeLine(targetLine)
   {
      targetLine.hit._width = this.listWidth;
      targetLine.txt._width = this.listWidth - targetLine.txt._x - 24;
      targetLine.effect_mc._width = this.listWidth;
      targetLine.radio_btn._x = targetLine.txt._x + targetLine.txt._width;
   }
   function removeData(id)
   {
      var _loc9_ = this._data[id];
      if(_loc9_ != undefined)
      {
         this.removeParent(id);
      }
      else
      {
         var _loc7_ = null;
         var _loc5_ = 0;
         while(_loc5_ < this.parentObjArray.length)
         {
            var _loc3_ = this.parentObjArray[_loc5_].sub;
            if(_loc3_ != undefined)
            {
               var _loc6_ = _loc3_.length;
               var _loc4_ = null;
               var _loc2_ = 0;
               while(_loc2_ < _loc6_)
               {
                  if(_loc3_[_loc2_].id == id)
                  {
                     _loc4_ = _loc2_;
                     _loc7_ = this.parentObjArray[_loc5_];
                     break;
                  }
                  _loc2_ = _loc2_ + 1;
               }
               if(_loc4_ != null)
               {
                  _loc3_[_loc4_].mc.removeMovieClip();
                  _loc3_.splice(_loc4_,1);
                  this.alignSub(_loc7_.id);
                  break;
               }
            }
            _loc5_ = _loc5_ + 1;
         }
         if(_loc7_ != null)
         {
            if(_loc7_.sub.length == 0)
            {
               this.removeParent(_loc7_.id);
            }
         }
      }
      this.refresh();
   }
   function removeParent(id)
   {
      var _loc3_ = this._data[id];
      var _loc5_ = this._parentDepths.length;
      var _loc7_ = null;
      var _loc2_ = 0;
      while(_loc2_ < _loc5_)
      {
         _loc2_ = _loc2_ + 1;
      }
      if(this._parentDepths[_loc2_] == _loc3_.mc)
      {
         _loc7_ = _loc2_;
      }
      this._parentDepths[_loc7_].removeMovieClip();
      this._parentDepths.splice(_loc7_,1);
      _loc3_.sub = [];
      _loc3_.mc._parent.removeMovieClip();
      var _loc6_ = this.parentObjArray.length;
      var _loc4_ = null;
      _loc2_ = 0;
      while(_loc2_ < _loc6_)
      {
         if(this.parentObjArray[_loc2_] == _loc3_)
         {
            _loc4_ = _loc2_;
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
      this.parentObjArray.splice(_loc4_,1);
      false;
      this.parentLength = this.parentLength - 1;
   }
   function getParent(id)
   {
      var _loc2_ = this._data[id];
      return _loc2_.mc;
   }
   function getSub(id, wantGetObj)
   {
      for(var _loc8_ in this._data)
      {
         var _loc3_ = this._data[_loc8_].sub;
         var _loc5_ = _loc3_.length;
         var _loc2_ = 0;
         while(_loc2_ < _loc5_)
         {
            if(_loc3_[_loc2_].id == id)
            {
               var _loc4_ = _loc3_[_loc2_].mc;
               if(wantGetObj)
               {
                  return _loc3_[_loc2_];
               }
               return _loc4_;
            }
            _loc2_ = _loc2_ + 1;
         }
      }
      if(id == "" || id == undefined)
      {
         if(wantGetObj)
         {
            return this.parentObjArray[0].sub[0];
         }
         return this.parentObjArray[0].sub[0].mc;
      }
      return null;
   }
   function getParentBySubId(subId, wantGetObj)
   {
      var _loc4_ = null;
      var _loc3_ = 0;
      while(_loc3_ < this.parentObjArray.length)
      {
         var _loc5_ = this.parentObjArray[_loc3_].sub;
         if(_loc5_ != undefined)
         {
            var _loc6_ = _loc5_.length;
            var _loc2_ = 0;
            while(_loc2_ < _loc6_)
            {
               if(_loc5_[_loc2_].id == subId)
               {
                  _loc4_ = this.parentObjArray[_loc3_];
                  if(wantGetObj)
                  {
                     return _loc4_;
                  }
                  return _loc4_.mc;
               }
               _loc2_ = _loc2_ + 1;
            }
         }
         _loc3_ = _loc3_ + 1;
      }
      return null;
   }
   function getTextField(id)
   {
      var _loc8_ = this._data[id];
      if(_loc8_ != undefined)
      {
         return this._data[id].mc.txt;
      }
      for(var _loc7_ in this._data)
      {
         var _loc3_ = this._data[_loc7_].sub;
         var _loc4_ = _loc3_.length;
         var _loc2_ = 0;
         while(_loc2_ < _loc4_)
         {
            if(_loc3_[_loc2_].id == id)
            {
               var _loc5_ = _loc3_[_loc2_].mc;
               return _loc3_[_loc2_].mc.txt;
            }
            _loc2_ = _loc2_ + 1;
         }
      }
   }
   function showCheckBox(id, bShow)
   {
      var _loc9_ = this._data[id];
      if(_loc9_ != undefined)
      {
         _loc9_.mc.radio_btn._visible = bShow;
      }
      for(var _loc8_ in this._data)
      {
         var _loc3_ = this._data[_loc8_].sub;
         var _loc5_ = _loc3_.length;
         var _loc2_ = 0;
         while(_loc2_ < _loc5_)
         {
            if(_loc3_[_loc2_].id == id)
            {
               var _loc4_ = _loc3_[_loc2_].mc;
               _loc4_.radio_btn._visible = bShow;
            }
            _loc2_ = _loc2_ + 1;
         }
      }
   }
   function checkCheckBox(id, bShow)
   {
      var _loc9_ = this._data[id];
      if(_loc9_ != undefined)
      {
         _loc9_.mc.radio_btn.saveToggle = bShow;
         _loc9_.mc.radio_btn.onEnterFrame = function()
         {
            if(this.isToggle != undefined)
            {
               this.checked = this.saveToggle;
               delete this.onEnterFrame;
            }
         };
      }
      for(var _loc8_ in this._data)
      {
         var _loc4_ = this._data[_loc8_].sub;
         var _loc5_ = _loc4_.length;
         var _loc2_ = 0;
         while(_loc2_ < _loc5_)
         {
            if(_loc4_[_loc2_].id == id)
            {
               var _loc3_ = _loc4_[_loc2_].mc;
               _loc3_.radio_btn.saveToggle = bShow;
               _loc3_.radio_btn.onEnterFrame = function()
               {
                  if(this.isToggle != undefined)
                  {
                     this.checked = this.saveToggle;
                     delete this.onEnterFrame;
                  }
               };
            }
            _loc2_ = _loc2_ + 1;
         }
      }
   }
   function calculateListHight()
   {
      var _loc4_ = 0;
      var _loc2_ = 0;
      while(_loc2_ < this.parentObjArray.length)
      {
         _loc4_ = _loc4_ + (this.PARENTDEPTH_H + this.DEPTH_SPACE);
         var _loc3_ = this.parentObjArray[_loc2_];
         var _loc5_ = _loc3_.sub;
         if(_loc3_.isOpen)
         {
            _loc4_ = _loc4_ + _loc5_.length * (this.SUBDEPTH_H + this.SUBDEPTH_VSPACE);
         }
         else
         {
            _loc4_ = _loc4_ + this.SUBDEPTH_H;
         }
         _loc2_ = _loc2_ + 1;
      }
      return _loc4_;
   }
   function updateParentIndex(parentId, newIndex)
   {
      this._data[parentId].index = newIndex;
      this.refresh();
   }
   function updateSubIndex(subId, newIndex)
   {
      this.getSub(subId,1).index = Number(newIndex);
      var _loc2_ = this.getParentBySubId(subId,1).id;
      this.alignSub(_loc2_);
   }
   function getParentLength()
   {
      return this.parentObjArray.length;
   }
   function getSubLength(parentId)
   {
      for(var _loc3_ in this._data)
      {
         if(this._data[_loc3_].id == parentId)
         {
            return this._data[_loc3_].sub.length;
         }
      }
   }
   function set_selectParentDepth(id, flag)
   {
      return this.selectParentDepth(id,flag);
   }
}
