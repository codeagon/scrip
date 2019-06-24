class lib.controls.S_2DepthList2 extends MovieClip
{
   static var preLoadVar = "preLoad";
   var type = 0;
   var parentLinkID = "2DepthParent2";
   var subLinkID = "2DepthSub2";
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
   var MenuListArray = new Array();
   var SubSelectCheck = false;
   function S_2DepthList2()
   {
      super();
      this.PARENT_NORMAL = lib.info.TextColor.TREEBTN_FIRST_NORMAL;
      this.PARENT_OVER = lib.info.TextColor.TREEBTN_FIRST_OVER;
      this.PARENT_PRESS = lib.info.TextColor.TREEBTN_FIRST_PRESS;
      this.SUB_NORMAL = lib.info.TextColor.TREEBTN_SECOND_NORMAL;
      this.SUB_OVER = lib.info.TextColor.TREEBTN_SECOND_OVER;
      this.SUB_PRESS = lib.info.TextColor.TREEBTN_SECOND_PRESS;
      this.SUB_ACTIVE = lib.info.TextColor.TREEBTN_SECOND_ACTIVE;
      this.listHeight = 0;
      this._enabled = true;
      this._data = {};
      this._parentDepths = [];
      this.MenuListArray = new Array();
   }
   function init()
   {
   }
   function addData(parentId, parentName, subId, subName)
   {
      if(this.MenuListArray[Number(parentId)] == undefined)
      {
         this.MenuListArray[Number(parentId)] = new Array();
      }
      this.MenuListArray[Number(parentId)].push(subId);
      if(this.getSubMc(subId,parentId) != undefined)
      {
         return undefined;
      }
      if(this._data[parentId] == undefined)
      {
         this._data[parentId] = {id:parentId,name:parentName,sub:[],isOpen:this.fopenState};
         this.drawParent(parentId,parentName);
      }
      this._data[parentId].sub.push({id:subId,name:subName});
      return this.drawSub(parentId,subId,subName);
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
      _loc2_.txt._width = 170;
      _loc2_.effect_mc._width = 180;
      _loc2_.bg._width = 180;
      _loc2_.id = id;
      _loc2_.title = __name;
      this._data[id].mc = _loc2_;
      this._data[id].isOpen = this.fopenState;
      this.onParentDepth(_loc2_);
      this.refresh();
   }
   function drawSub(parentId, subId, subName)
   {
      var _loc11_ = this;
      var _loc5_ = this["parentContainer_" + parentId];
      var _loc4_ = _loc5_.subContainer;
      var _loc9_ = _loc4_.getNextHighestDepth();
      var _loc2_ = _loc4_.attachMovie(this.subLinkID,"subDepth" + subId,_loc9_);
      var _loc3_ = this._data[parentId].sub.length;
      if(this.type == 0)
      {
         _loc2_._y = (_loc3_ - 1) * (this.SUBDEPTH_H + this.SUBDEPTH_VSPACE);
      }
      else
      {
         var _loc7_ = (_loc3_ - 1) % 2;
         var _loc8_ = int((_loc3_ - 1) / 2);
         _loc2_._x = _loc7_ * (this.SUBDEPTH_W + this.SUBDEPTH_HSPACE);
         _loc2_._y = _loc8_ * (this.SUBDEPTH_H + this.SUBDEPTH_VSPACE);
      }
      _loc2_.txt._width = 170;
      _loc2_.effect_mc._width = 180;
      _loc2_.pid = parentId;
      _loc2_.id = subId;
      _loc2_.title = subName;
      this.onSubDepth(_loc2_);
      this.refresh();
      return _loc2_;
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
      this._parent.ListScrollCheck(this.listHeight);
   }
   function selectParentDepth(id)
   {
      var _loc4_ = this._data[id];
      var _loc2_ = !_loc4_.isOpen;
      this.setOpen(id,_loc2_);
      this.onSelected(id,1);
   }
   function selectParentDepth2(id, bool)
   {
      var _loc3_ = this._data[id];
      var _loc4_ = !_loc3_.isOpen;
      this.setOpen(id,bool);
      this.onSelected(id,1);
   }
   function selectSubDepth(id)
   {
      this.onSelected(id,0);
   }
   function menuselect(id)
   {
      var _loc5_ = 0;
      var _loc6_ = 0;
      var _loc7_ = this;
      var _loc2_ = 0;
      while(_loc2_ < this.MenuListArray.length)
      {
         var _loc3_ = 0;
         while(_loc3_ < this.MenuListArray[_loc2_].length)
         {
            this["parentContainer_" + _loc2_].subContainer["subDepth" + this.MenuListArray[_loc2_][_loc3_]].txt.textColor = _loc7_.SUB_NORMAL;
            this["parentContainer_" + _loc2_].subContainer["subDepth" + this.MenuListArray[_loc2_][_loc3_]].effect_mc.gotoAndStop("out");
            if(Number(id) == this.MenuListArray[_loc2_][_loc3_])
            {
               _loc5_ = _loc2_;
               _loc6_ = Number(id);
            }
            _loc3_ = _loc3_ + 1;
         }
         _loc2_ = _loc2_ + 1;
      }
      if(this.SubSelectCheck == false)
      {
         this.SubSelectCheck = true;
         this.setOpen(_loc5_,true);
      }
      this.onSelected(_loc5_,1);
      this.onSelected(_loc6_,0);
      this["parentContainer_" + _loc5_].subContainer["subDepth" + _loc6_].txt.textColor = _loc7_.SUB_ACTIVE;
      this["parentContainer_" + _loc5_].subContainer["subDepth" + _loc6_].effect_mc.gotoAndStop("active");
      if(this.MenuListArray.length > 0)
      {
         this.selectedMc = this["parentContainer_" + _loc5_].subContainer["subDepth" + _loc6_];
      }
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
            this.removeMovieClip();
         }
      }
      this.listHeight = 0;
      this._data = {};
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
      parentDepthMc.txt.textColor = this.PARENT_NORMAL;
      parentDepthMc.txt.setText(parentDepthMc.title);
      parentDepthMc.hit.onRollOver = function()
      {
         this._parent.txt.textColor = _this.PARENT_OVER;
         this._parent.effect_mc.gotoAndStop("over");
      };
      parentDepthMc.hit.onRollOut = function()
      {
         this._parent.txt.textColor = _this.PARENT_NORMAL;
         this._parent.effect_mc.gotoAndStop("out");
      };
      parentDepthMc.hit.onReleaseOutside = function()
      {
         this._parent.txt.textColor = _this.PARENT_NORMAL;
         this._parent.effect_mc.gotoAndStop("out");
      };
      parentDepthMc.hit.onPress = function()
      {
         this._parent.txt.textColor = _this.PARENT_PRESS;
      };
      parentDepthMc.hit.onRelease = function()
      {
         _this.selectParentDepth(this._parent.id);
         this._parent.effect_mc.gotoAndStop("active");
         lib.manager.UISound.play(lib.manager.UISound.MAIN_BTN);
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
            this._parent.effect_mc.gotoAndStop("press");
         }
         else
         {
            this._parent.txt.textColor = _this.SUB_OVER;
            this._parent.effect_mc.gotoAndStop("over");
         }
      };
      subDepthMc.hit.onRollOut = function()
      {
         if(_this.selectedMc == this._parent)
         {
            this._parent.effect_mc.gotoAndStop("active");
         }
         else
         {
            this._parent.txt.textColor = _this.SUB_NORMAL;
            this._parent.effect_mc.gotoAndStop("out");
         }
      };
      subDepthMc.hit.onReleaseOutside = function()
      {
         if(_this.selectedMc == this._parent)
         {
            this._parent.effect_mc.gotoAndStop("active");
         }
         else
         {
            this._parent.txt.textColor = _this.SUB_NORMAL;
            this._parent.effect_mc.gotoAndStop("out");
         }
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
         _this.MenuListArray = new Array();
         this._parent.txt.textColor = _this.SUB_ACTIVE;
         this._parent.effect_mc.gotoAndStop("active");
         if(flag == undefined)
         {
            _this.selectSubDepth(this._parent.id);
         }
         this._parent._parent._parent._parent._parent.Temp_SetData2(true);
         lib.externals.ExternalManager5.Fscommand("ToGame_Help_Select",this._parent.id);
      };
   }
}
