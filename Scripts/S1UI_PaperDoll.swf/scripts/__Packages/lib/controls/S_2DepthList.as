class lib.controls.S_2DepthList extends MovieClip
{
   static var preLoadVar = "preLoad";
   var type = 0;
   var parentLinkID = "2DepthParent";
   var subLinkID = "2DepthSub";
   var parentLength = 0;
   var PARENTDEPTH_H = 30;
   var SUBDEPTH_H = 30;
   var SUBDEPTH_W = 200;
   var SUBDEPTH_HSPACE = 0;
   var SUBDEPTH_VSPACE = 0;
   var SUBDEPTH_MARGIN = 0;
   var DEPTH_SPACE = 0;
   var fopenState = true;
   var isToggle = true;
   var useDefaultColorDepth1 = true;
   var useDefaultColorDepth2 = true;
   function S_2DepthList()
   {
      super();
      this.PARENT_NORMAL = lib.info.TextColor.TREEBTN_FIRST_NORMAL;
      this.PARENT_OVER = lib.info.TextColor.TREEBTN_FIRST_OVER;
      this.PARENT_PRESS = lib.info.TextColor.TREEBTN_FIRST_PRESS;
      this.SUB_NORMAL = lib.info.TextColor.TREEBTN_SECOND_NORMAL;
      this.SUB_OVER = lib.info.TextColor.TREEBTN_SECOND_OVER;
      this.SUB_PRESS = lib.info.TextColor.TREEBTN_SECOND_PRESS;
      this.SUB_ACTIVE = lib.info.TextColor.TREEBTN_SECOND_ACTIVE;
      this.listWidth = this._width;
      this._xscale = 100;
      this.listHeight = 0;
      this._enabled = true;
      this._data = {};
      this._parentDepths = [];
   }
   function resizeLine(targetLine)
   {
      targetLine.hit._width = this.listWidth;
      targetLine.txt._width = this.listWidth - targetLine.txt._x - 10;
      targetLine.effect_mc._width = this.listWidth;
   }
   function init()
   {
   }
   function addData(parentId, parentName, subId, subName, indexNum)
   {
      if(this.getSubMc(subId,parentId) != undefined)
      {
         return undefined;
      }
      if(this._data[parentId] == undefined)
      {
         this._data[parentId] = {id:parentId,name:parentName,sub:[],isOpen:this.fopenState};
         this.drawParent(parentId,parentName);
      }
      var _loc4_ = this._data[parentId].sub.length + 1;
      if(indexNum != undefined)
      {
         _loc4_ = indexNum;
         if(_loc4_ < this._data[parentId].sub.length)
         {
            var _loc5_ = this._data[parentId].sub.length;
            var _loc2_ = 0;
            while(_loc2_ < _loc5_)
            {
               if(_loc2_ >= _loc4_)
               {
                  this._data[parentId].sub[_loc2_].index = this._data[parentId].sub[_loc2_].index + 1;
               }
               _loc2_ = _loc2_ + 1;
            }
         }
      }
      this._data[parentId].sub.push({id:subId,name:subName,index:_loc4_});
      var _loc6_ = this.drawSub(parentId,subId,subName);
      this._data[parentId].sub[this._data[parentId].sub.length - 1].mc = _loc6_;
      this.alignSub(parentId);
      return _loc6_;
   }
   function upDateData(parentId, parentName, subId, subName)
   {
      this._data[parentId].id = parentId;
      this._data[parentId].name = parentName;
      this["parentContainer_" + parentId].parentDepth.txt.setText(parentName);
      var _loc3_ = this.getSubMc(subId,parentId);
      _loc3_.title = subName;
      _loc3_.txt = subName;
      return _loc3_;
   }
   function drawParent(id, __name)
   {
      this.parentLength = this.parentLength + 1;
      var _loc8_ = this;
      var _loc4_ = this.getNextHighestDepth();
      var _loc3_ = this.createEmptyMovieClip("parentContainer_" + id,_loc4_);
      this._parentDepths.push(_loc3_);
      var _loc6_ = _loc3_.createEmptyMovieClip("subContainer",_loc4_ + 1);
      _loc6_._y = this.PARENTDEPTH_H + this.DEPTH_SPACE;
      _loc6_._x = this.SUBDEPTH_MARGIN;
      var _loc7_ = _loc3_.getNextHighestDepth();
      var _loc2_ = _loc3_.attachMovie(this.parentLinkID,"parentDepth",_loc7_);
      this.resizeLine(_loc2_);
      _loc2_.id = id;
      _loc2_.title = __name;
      this._data[id].mc = _loc2_;
      this._data[id].isOpen = this.fopenState;
      this.onParentDepth(_loc2_);
      this.refresh();
   }
   function drawSub(parentId, subId, subName)
   {
      var _loc8_ = this;
      var _loc4_ = this["parentContainer_" + parentId];
      var _loc3_ = _loc4_.subContainer;
      var _loc5_ = _loc3_.getNextHighestDepth();
      var _loc2_ = _loc3_.attachMovie(this.subLinkID,"subDepth" + subId,_loc5_);
      this.resizeLine(_loc2_);
      _loc2_.pid = parentId;
      _loc2_.id = subId;
      _loc2_.title = subName;
      this.onSubDepth(_loc2_);
      return _loc2_;
   }
   function alignSub(parentId)
   {
      this._data[parentId].sub.sortOn(["index"],Array.NUMERIC);
      var _loc7_ = this._data[parentId].sub.length;
      if(this.type == 0)
      {
         var _loc2_ = 0;
         while(_loc2_ < _loc7_)
         {
            var _loc3_ = this._data[parentId].sub[_loc2_].mc;
            _loc3_._y = _loc2_ * (this.SUBDEPTH_H + this.SUBDEPTH_VSPACE);
            _loc2_ = _loc2_ + 1;
         }
      }
      else
      {
         _loc2_ = 0;
         while(_loc2_ < _loc7_)
         {
            _loc3_ = this._data[parentId].sub[_loc2_].mc;
            var _loc4_ = _loc2_ % 2;
            var _loc5_ = Math.floor(Math.abs(_loc2_ / 2));
            _loc3_._x = _loc4_ * (this.SUBDEPTH_W + this.SUBDEPTH_HSPACE);
            _loc3_._y = _loc5_ * (this.SUBDEPTH_H + this.SUBDEPTH_VSPACE);
            _loc2_ = _loc2_ + 1;
         }
      }
      this.refresh();
   }
   function refresh()
   {
      var _loc4_ = 0;
      var _loc3_ = 0;
      while(_loc3_ < this.parentLength)
      {
         var _loc2_ = this._parentDepths[_loc3_];
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
   function selectParentDepth(id, _flag)
   {
      var _loc5_ = this._data[id];
      var _loc2_ = undefined;
      if(_flag == undefined)
      {
         _loc2_ = !_loc5_.isOpen;
      }
      else if(_flag == "0")
      {
         _loc2_ = 0;
      }
      else if(_flag == "1")
      {
         _loc2_ = 1;
      }
      this.setOpen(id,_loc2_);
      this.onSelected(id,1);
      return _loc2_;
   }
   function selectSubDepth(id)
   {
      this.onSelected(id,0);
   }
   function getSubMc(subid, parentId)
   {
      var _loc8_ = undefined;
      if(parentId != undefined && parentId != "")
      {
         _loc8_ = this["parentContainer_" + parentId].subContainer["subDepth" + subid];
      }
      else
      {
         var _loc3_ = this._data[parentId].sub;
         for(var _loc6_ in this._data)
         {
            _loc3_ = this._data[_loc6_].sub;
            var _loc5_ = _loc3_.length;
            var _loc2_ = 0;
            while(_loc2_ < _loc5_)
            {
               if(_loc3_[_loc2_].id == subid)
               {
                  return this["parentContainer_" + _loc6_].subContainer["subDepth" + subid];
               }
               _loc2_ = _loc2_ + 1;
            }
         }
      }
      return _loc8_;
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
      this.refresh();
   }
   function setOpen(id, _open)
   {
      var _loc3_ = this["parentContainer_" + id].subContainer;
      var _loc2_ = this._data[id];
      _loc2_.isOpen = _open;
      _loc3_._visible = _open;
      this.refresh();
   }
   function setSelected(subid, parentId)
   {
      var _loc2_ = this.getSubMc(subid,parentId);
      _loc2_.hit.onRelease(true);
      this.setOpen(parentId,1);
   }
   function setEnabled(enable)
   {
      this._enabled = enable;
   }
   function onSelected(id, isParent)
   {
   }
   function onParentDepth(parentDepthMc)
   {
      var _this = this;
      parentDepthMc.txt.setText(parentDepthMc.title);
      if(_this.useDefaultColorDepth1)
      {
         parentDepthMc.txt.textColor = _this.PARENT_NORMAL;
      }
      parentDepthMc.hit.onRollOver = function()
      {
         if(_this.useDefaultColorDepth1)
         {
            this._parent.txt.textColor = _this.PARENT_OVER;
         }
         this._parent.effect_mc.gotoAndStop("over");
      };
      parentDepthMc.hit.onRollOut = function()
      {
         if(_this.useDefaultColorDepth1)
         {
            this._parent.txt.textColor = _this.PARENT_NORMAL;
         }
         this._parent.effect_mc.gotoAndStop("out");
      };
      parentDepthMc.hit.onReleaseOutside = function()
      {
         if(_this.useDefaultColorDepth1)
         {
            this._parent.txt.textColor = _this.PARENT_NORMAL;
         }
         this._parent.effect_mc.gotoAndStop("out");
      };
      parentDepthMc.hit.onPress = function()
      {
         if(_this.useDefaultColorDepth1)
         {
            this._parent.txt.textColor = _this.PARENT_PRESS;
         }
         this._parent.effect_mc.gotoAndStop("press");
      };
      parentDepthMc.hit.onRelease = function()
      {
         if(_this.useDefaultColorDepth1)
         {
            this._parent.txt.textColor = _this.PARENT_OVER;
         }
         _this.selectParentDepth(this._parent.id);
         this._parent.effect_mc.gotoAndStop("over");
         lib.manager.UISound.play(lib.manager.UISound.MAIN_BTN);
         this.onRelease2(this._parent.id);
      };
   }
   function onSubDepth(subDepthMc)
   {
      var _this = this;
      subDepthMc.txt.textColor = this.SUB_NORMAL;
      subDepthMc.txt.setText(subDepthMc.title);
      subDepthMc.hit.onRollOver = function()
      {
         if(_this.selectedMc == this._parent)
         {
            if(_this.useDefaultColorDepth2)
            {
               this._parent.txt.textColor = _this.SUB_OVER;
            }
         }
         else
         {
            if(_this.useDefaultColorDepth2)
            {
               this._parent.txt.textColor = _this.SUB_OVER;
            }
            this._parent.effect_mc.gotoAndStop("over");
         }
      };
      subDepthMc.hit.onRollOut = function()
      {
         if(_this.selectedMc == this._parent)
         {
            return undefined;
         }
         if(_this.useDefaultColorDepth2)
         {
            this._parent.txt.textColor = _this.SUB_NORMAL;
         }
         this._parent.effect_mc.gotoAndStop("out");
      };
      subDepthMc.hit.onReleaseOutside = function()
      {
         if(_this.selectedMc == this._parent)
         {
            return undefined;
         }
         if(_this.useDefaultColorDepth2)
         {
            this._parent.txt.textColor = _this.SUB_NORMAL;
         }
         this._parent.effect_mc.gotoAndStop("out");
      };
      subDepthMc.hit.onPress = function()
      {
         if(_this.selectedMc == this._parent)
         {
            return undefined;
         }
         this._parent.effect_mc.gotoAndStop("press");
      };
      subDepthMc.hit.onRelease = function(flag)
      {
         lib.manager.UISound.play(lib.manager.UISound.MAIN_BTN);
         if(_this.isToggle)
         {
            var _loc2_ = _this.selectedMc;
            _this.selectedMc = this._parent;
            _loc2_.hit.onRollOut();
         }
         if(_this.useDefaultColorDepth2)
         {
            this._parent.txt.textColor = _this.SUB_ACTIVE;
         }
         this._parent.effect_mc.gotoAndStop("active");
         if(flag == undefined)
         {
            _this.selectSubDepth(this._parent.id);
         }
         this.onRelease2();
      };
   }
}
