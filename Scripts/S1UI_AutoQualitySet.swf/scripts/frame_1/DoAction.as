function ToGame_SystemOption_AutoScreenQulity()
{
   var _loc1_ = container_mc.AutoSetUp0_mc.defV;
   getURL("FSCommand:ToGame_SystemOption_AutoScreenQulity",_loc1_);
   lib.Debuger.trace("ToGame_SystemOption_AutoScreenQulity : " + _loc1_);
}
function ToGame_SystemOption_AutoScreenNPerformanceQulity()
{
   var _loc1_ = container_mc.AutoSetUp1_mc.defV;
   getURL("FSCommand:ToGame_SystemOption_AutoScreenNPerformanceQulity",_loc1_);
   lib.Debuger.trace("ToGame_SystemOption_AutoScreenNPerformanceQulity : " + _loc1_);
}
function ToGame_SystemOption_AutoPerformanceQulity()
{
   var _loc1_ = container_mc.AutoSetUp2_mc.defV;
   getURL("FSCommand:ToGame_SystemOption_AutoPerformanceQulity",_loc1_);
   lib.Debuger.trace("ToGame_SystemOption_AutoPerformanceQulity : " + _loc1_);
}
function ToGame_SystemOptionAutoSet_Close()
{
   lib.Debuger.trace("ToGame_SystemOptionAutoSet_Close : ");
   _level0.OnGameEvent("OnGameEventShowUI","AutoQualitySet",0);
   fscommand("ToGame_SystemOptionAutoSet_Close");
}
function sliderWork(target, dataList)
{
   var _loc8_ = target.split_mc._name;
   var _loc7_ = target.split_mc.getDepth();
   target.createEmptyMovieClip(_loc8_,_loc7_);
   target.dragSplit = undefined;
   var Int = true;
   var _loc5_ = dataList.split("\t");
   trace("info  :  " + _loc5_);
   if(_loc5_[2].indexOf(".") != -1)
   {
      Int = false;
   }
   target.minV = Number(_loc5_[0]);
   target.maxV = Number(_loc5_[2]);
   target.defV = Number(_loc5_[4]);
   target.min_txt.text = _loc5_[1];
   target.max_txt.text = _loc5_[3];
   trace("최저값 = " + target.minV + " ,최고값 = " + target.maxV + " ,디폴트값 = " + target.defV);
   var w = target.bg_mc._width;
   var dragY = target.drager_mc._y;
   if(_loc5_[5] != undefined && _loc5_[5] != "undefined" && _loc5_[5] != 0 && _loc5_[5] != "0")
   {
      target.dragSplit = Number(_loc5_[5]) - 1;
      var _loc2_ = 0;
      while(_loc2_ <= target.dragSplit)
      {
         var _loc3_ = target.split_mc.attachMovie("dragSplit","dragSplit" + _loc2_,_loc2_);
         _loc3_._visible = _loc2_ != 0 && _loc2_ != target.dragSplit;
         if(Int)
         {
            _loc3_.value = Math.round(_loc2_ / target.dragSplit * (target.maxV - target.minV) + target.minV);
         }
         else
         {
            _loc3_.value = _loc2_ / target.dragSplit * (target.maxV - target.minV) + target.minV;
         }
         _loc3_._x = _loc2_ / target.dragSplit * w;
         _loc3_._y = target.bg_mc._y;
         _loc3_.onRelease = function()
         {
            target.drager_mc._x = this._x;
            target.defV = this.value;
            target.drager_mc.onRelease();
         };
         _loc2_ = _loc2_ + 1;
      }
   }
   target.drager_mc.onPress = function()
   {
      if(!this._parent.active)
      {
         return undefined;
      }
      startDrag(this,0,0,dragY,w,dragY);
      this.onEnterFrame = function()
      {
         this._parent.defV = this._x / w * (this._parent.maxV - this._parent.minV) + this._parent.minV;
         if(Int)
         {
            this._parent.defV = Math.round(this._parent.defV);
         }
         trace("최저값 = " + this._parent.minV + " ,최고값 = " + this._parent.maxV + " ,디폴트값 = " + this._parent.defV);
      };
   };
   target.drager_mc.onRelease = target.drager_mc.onReleaseOutside = function()
   {
      if(!this._parent.active)
      {
         return undefined;
      }
      this.stopDrag();
      delete this.onEnterFrame;
      if(this._parent.dragSplit != undefined)
      {
         var _loc2_ = null;
         for(split in this._parent.split_mc)
         {
            if(typeof this._parent.split_mc[split] == "movieclip")
            {
               if(_loc2_ == null)
               {
                  _loc2_ = this._parent.split_mc[split];
               }
               else if(Math.abs(this._parent.split_mc[split].value - this._parent.defV) < Math.abs(_loc2_.value - this._parent.defV))
               {
                  _loc2_ = this._parent.split_mc[split];
               }
            }
         }
         this._x = _loc2_._x;
         this._parent.defV = _loc2_.value;
         trace(">>>>>>최저값 = " + target.minV + " ,최고값 = " + target.maxV + " ,디폴트값 = " + target.defV + "  >>" + this.inputing);
      }
      this._parent.bg_mc.gotoAndStop(1);
      if(!this.inputing)
      {
         slideChaned(this._parent);
      }
   };
   target.drager_mc.onRollOver = function()
   {
      this._parent.bg_mc.gotoAndStop(2);
   };
   target.drager_mc.onRollOut = function()
   {
      this._parent.bg_mc.gotoAndStop(1);
   };
   target.bg_mc.onRollOver = function()
   {
      this.gotoAndStop(2);
   };
   target.bg_mc.onRollOut = target.bg_mc.onReleaseOutside = function()
   {
      this.gotoAndStop(1);
   };
   target.bg_mc.onPress = function()
   {
      if(!this._parent.active)
      {
         return undefined;
      }
      delete this.onEnterFrame;
      trace(">>  " + this._parent.drager_mc._x + "  |  " + this._parent._xmouse);
      this._parent.drager_mc._x = this._parent._xmouse;
      this._parent.defV = this._parent.drager_mc._x / w * (this._parent.maxV - this._parent.minV) + this._parent.minV;
      if(Int)
      {
         this._parent.defV = Math.round(this._parent.defV);
      }
      trace(">> ==> " + this._parent.drager_mc._x);
      this._parent.drager_mc.onRelease();
   };
   target.active = true;
   var _loc6_ = w * (target.defV - target.minV) / (target.maxV - target.minV);
   trace("드래거의 위치 = " + _loc6_);
   target.drager_mc._x = _loc6_;
   target.drager_mc.inputing = true;
   target.drager_mc.onRelease();
   target.drager_mc.inputing = false;
}
function getTagIndex(strg, _data)
{
   var _loc2_ = _data[0];
   if(_data.length > 2)
   {
      _data.splice(0,1);
      var _loc6_ = _data.join(":");
      var _loc7_ = [];
      _data.splice(0,_data.length,_loc2_,_loc6_);
   }
   var _loc1_ = 0;
   var _loc3_ = strg.length;
   while(_loc1_ < _loc3_)
   {
      if(strg[_loc1_] == _loc2_)
      {
         return _loc1_;
      }
      _loc1_ = _loc1_ + 1;
   }
   return -1;
}
var UI = this;
UI._visible = false;
var UIname = "AutoQualitySet";
container_mc.title_txt.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
var SPER = ":";
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
myListener.OnGameEventShowWindow = function(widgetName, bShow)
{
   if(widgetName.toLowerCase() == UIname.toLowerCase())
   {
      bWidgetOpen = bShow;
      if(_global.gbUIMode && bWidgetOpen)
      {
         UI._visible = true;
      }
      else
      {
         UI._visible = false;
      }
   }
};
myListener.OnGameEventChangeUIMode = function(bShow)
{
   _global.gbUIMode = bShow;
   if(_global.gbUIMode && bWidgetOpen)
   {
      UI._visible = true;
   }
   else
   {
      UI._visible = false;
   }
};
var autoSetIndex = ["ASQ","ASPQ","APQ"];
myListener.OnGame_SystemOptionAutoSet_SetAutoSet = function(dataList)
{
   var _loc3_ = dataList.split("\n");
   if(_loc3_[_loc3_.length - 1] == "undefined" || _loc3_[_loc3_.length - 1] == "")
   {
      _loc3_.splice(_loc3_.length - 1,1);
   }
   var _loc2_ = 0;
   while(_loc2_ < _loc3_.length)
   {
      var _loc1_ = _loc3_[_loc2_].split(SPER);
      var _loc4_ = getTagIndex(autoSetIndex,_loc1_);
      trace(_loc1_[1]);
      sliderWork(container_mc["AutoSetUp" + _loc4_ + "_mc"],_loc1_[1]);
      _loc2_ = _loc2_ + 1;
   }
};
var x_btn = new lib.util.TxtBtn(container_mc.x_mc);
var close_btn = new lib.util.TxtAniBtn(container_mc.close_mc,container_mc.close_txt,20,27,33,43);
var apply0_btn = new lib.util.TxtBtn(container_mc.apply0_mc,container_mc.apply0_txt,20,27,33,43);
var apply1_btn = new lib.util.TxtBtn(container_mc.apply1_mc,container_mc.apply1_txt,20,27,33,43);
var apply2_btn = new lib.util.TxtBtn(container_mc.apply2_mc,container_mc.apply2_txt,20,27,33,43);
x_btn.setRelease(ToGame_SystemOptionAutoSet_Close);
close_btn.setRelease(ToGame_SystemOptionAutoSet_Close);
apply0_btn.setRelease(ToGame_SystemOption_AutoScreenQulity);
apply1_btn.setRelease(ToGame_SystemOption_AutoScreenNPerformanceQulity);
apply2_btn.setRelease(ToGame_SystemOption_AutoPerformanceQulity);
fscommand("ToGame_SystemOptionAutoSet_Init");
