class g4.util.UIUtil
{
   static var STAGE_WIDTH_SCALED = -1;
   static var STAGE_HEIGHT_SCALED = -1;
   static var TEXT_FIELD_STYLE_1 = 1;
   static var textFieldStyle1Filters = [g4.util.UIUtil.getTextFieldFilter(g4.util.UIUtil.TEXT_FIELD_STYLE_1)];
   static var enterFrameEventAdded = false;
   static var funcToCallNextFrameArray = [];
   function UIUtil()
   {
   }
   static function addEnterFrameListener(scope, callback)
   {
      if(g4.util.UIUtil.eventDispatcher == null)
      {
         g4.util.UIUtil.eventDispatcher = new gfx.events.EventDispatcher();
         g4.util.UIUtil.emptyMovieClip = _root.createEmptyMovieClip("$g4.util.UIUtil.emptyMovieClip",_root.getNextHighestDepth());
         g4.util.UIUtil.tempOnEnterFrameEvent = {type:"onEnterFrame"};
      }
      g4.util.UIUtil.eventDispatcher.addEventListener("onEnterFrame",scope,callback);
      if(!g4.util.UIUtil.enterFrameEventAdded)
      {
         g4.util.UIUtil.enterFrameEventAdded = true;
         g4.util.UIUtil.emptyMovieClip.onEnterFrame = gfx.utils.Delegate.create(g4.util.UIUtil,g4.util.UIUtil.emptyMovieClip_onEnterFrameHandler);
      }
   }
   static function removeEnterFrameListener(scope, callback)
   {
      if(g4.util.UIUtil.eventDispatcher == null)
      {
         return undefined;
      }
      g4.util.UIUtil.eventDispatcher.removeEventListener("onEnterFrame",scope,callback);
      if(!g4.util.UIUtil.eventDispatcher.hasEventListener("onEnterFrame"))
      {
         if(g4.util.UIUtil.enterFrameEventAdded)
         {
            g4.util.UIUtil.enterFrameEventAdded = false;
            delete g4.util.UIUtil.emptyMovieClip.onEnterFrame;
         }
      }
   }
   static function emptyMovieClip_onEnterFrameHandler()
   {
      g4.util.UIUtil.eventDispatcher.dispatchEvent(g4.util.UIUtil.tempOnEnterFrameEvent);
   }
   static function callLater(scope, callback, args)
   {
      var _loc2_ = g4.util.ArrayUtil.isExist(g4.util.UIUtil.funcToCallNextFrameArray,function(o)
      {
         return o.scope == scope && o.callback == callback;
      }
      );
      if(_loc2_)
      {
         return undefined;
      }
      var _loc1_ = {};
      _loc1_.scope = scope;
      _loc1_.callback = callback;
      _loc1_.args = args;
      g4.util.UIUtil.funcToCallNextFrameArray.push(_loc1_);
      g4.util.UIUtil.addEnterFrameListener(g4.util.UIUtil,"_callLater");
   }
   static function _callLater()
   {
      g4.util.UIUtil.removeEnterFrameListener(g4.util.UIUtil,"_callLater");
      var _loc3_ = g4.util.UIUtil.funcToCallNextFrameArray;
      g4.util.UIUtil.funcToCallNextFrameArray = [];
      var _loc1_ = undefined;
      var _loc2_ = undefined;
      var _loc4_ = _loc3_.length;
      _loc2_ = 0;
      while(_loc2_ < _loc4_)
      {
         _loc1_ = _loc3_[_loc2_];
         _loc1_.scope[_loc1_.callback].apply(_loc1_.scope,_loc1_.args);
         _loc2_ = _loc2_ + 1;
      }
   }
   static function setMouseEnabled(target, enabled)
   {
      target.hitTestDisable = !enabled;
   }
   static function setCheckBoxEnabled(checkBox, enabled)
   {
      if(checkBox == null)
      {
         return undefined;
      }
      if(enabled)
      {
         checkBox.setEnabled(true);
         checkBox.txt.textColor = lib.info.TextColor.CHECKBTN_NORMAL;
      }
      else
      {
         checkBox.setEnabled(false);
         checkBox.txt.textColor = lib.info.TextColor.CHECKBTN_DISABLE;
      }
   }
   static function getStageScaledWidth()
   {
      if(g4.util.UIUtil.STAGE_WIDTH_SCALED == -1)
      {
         g4.util.UIUtil.STAGE_WIDTH_SCALED = 1 / lib.info.AlignInfo.scaleRatio * Stage.width;
      }
      return g4.util.UIUtil.STAGE_WIDTH_SCALED;
   }
   static function getStageScaledHeight()
   {
      if(g4.util.UIUtil.STAGE_HEIGHT_SCALED == -1)
      {
         g4.util.UIUtil.STAGE_HEIGHT_SCALED = 1 / lib.info.AlignInfo.scaleRatio * Stage.height;
      }
      return g4.util.UIUtil.STAGE_HEIGHT_SCALED;
   }
   static function getScaledPosition($position)
   {
      return $position / lib.info.AlignInfo.scaleRatio;
   }
   static function contains(parent, child)
   {
      var _loc1_ = child;
      while(_loc1_ != null)
      {
         if(_loc1_ == parent)
         {
            return true;
         }
         _loc1_ = _loc1_._parent;
      }
      return false;
   }
   static function isMouseOver(target)
   {
      return g4.util.UIUtil.contains(target,Mouse.getTopMostEntity(true));
   }
   static function setTextFieldStyle(textField, style)
   {
      textField.antiAliasType = "normal";
      if((var _loc0_ = style) !== g4.util.UIUtil.TEXT_FIELD_STYLE_1)
      {
      }
      textField.filters = g4.util.UIUtil.textFieldStyle1Filters;
   }
   static function getTextFieldFilter(style)
   {
      if((var _loc0_ = style) !== g4.util.UIUtil.TEXT_FIELD_STYLE_1)
      {
      }
      return new flash.filters.DropShadowFilter(0,0,0,0.5,1,1,10);
   }
   static function isGFxPlayer()
   {
      return _global.gfxPlayer;
   }
   static function getActualUIScaleRatio(viewID)
   {
      var _loc7_ = "SCALE_" + viewID.toUpperCase() + "_PERCENT";
      var _loc2_ = lib.info.AlignInfo[_loc7_];
      if(isNaN(_loc2_))
      {
         _loc2_ = 100;
      }
      var _loc5_ = _loc2_ / 100;
      var _loc3_ = _root.GetRegisterUIData(viewID);
      if(_loc3_ != null && _loc3_.ScaleCustom != null)
      {
         var _loc4_ = Number(_loc3_.ScaleCustom);
         var _loc6_ = Number(lib.gamedata.DefaultData.getDefaultUIData("uiscale").param0);
         if(!isNaN(_loc4_) && !isNaN(_loc6_))
         {
            _loc5_ = _loc5_ * (_loc4_ / _loc6_);
         }
      }
      return lib.info.AlignInfo.uiScaleLimit(lib.info.AlignInfo.scaleRatio * _loc5_);
   }
   static function setDragSlotValue(target, uiName, value)
   {
      target.$dragSlotName = uiName + "__" + value;
   }
   static function getDragSlotValue(target)
   {
      if(target.$dragSlotName != null && target.$dragSlotName.length > 0)
      {
         return target.$dragSlotName;
      }
      return target._name;
   }
   static function getDropSlotValue(target)
   {
      var _loc2_ = 3;
      var _loc1_ = target;
      while(true)
      {
         if(_loc1_ == null)
         {
            break;
         }
         if(_loc1_.$dragSlotName != null && _loc1_.$dragSlotName.length > 0)
         {
            return _loc1_.$dragSlotName;
         }
         _loc2_;
         if(_loc2_-- <= 0)
         {
            break;
         }
         _loc1_ = _loc1_._parent;
      }
      return target.GetName();
   }
}
