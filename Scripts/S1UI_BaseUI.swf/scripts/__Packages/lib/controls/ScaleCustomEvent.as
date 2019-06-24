class lib.controls.ScaleCustomEvent
{
   static var listSave = [];
   static var eventGet = new Object();
   static var flag = true;
   function ScaleCustomEvent()
   {
      if(!lib.controls.ScaleCustomEvent.flag)
      {
         return undefined;
      }
      lib.controls.ScaleCustomEvent.flag = false;
      lib.controls.ScaleCustomEvent.eventGet = this;
      lib.controls.ScaleCustomEvent.axis = new lib.util.AxisResetter();
      lib.controls.ScaleCustomEvent.customizeData = lib.gamedata.CustomizedUIDataCollection.getInstance();
      lib.controls.ScaleCustomEvent.customizeData.addEventListener(gfx.events.EventTypes.VALUE_CHANGE,lib.controls.ScaleCustomEvent.eventGet,"valueChangeHandler");
   }
   static function addScaleCustom(_UI, _UIname)
   {
      var _loc3_ = _UIname.toUpperCase();
      var _loc2_ = "SCALE_" + _loc3_ + "_PERCENT";
      var _loc4_ = lib.gamedata.CustomizedUIDataKey["UI" + _loc2_];
      var _loc7_ = lib.controls.ScaleCustomEvent.customizeData.getData(_loc4_);
      if(!_loc7_)
      {
         return undefined;
      }
      var _loc6_ = lib.controls.ScaleCustomEvent.arrayNameSearch(_UIname);
      if(_loc6_ == undefined)
      {
         var _loc1_ = _UI;
         _loc1_.name = _UIname;
         _loc1_.key = _loc4_;
         lib.controls.ScaleCustomEvent.listSave.push(_loc1_);
         lib.info.AlignInfo.uiScale(_loc3_,_loc1_);
         lib.controls.ScaleCustomEvent.focusUI = _loc1_;
         _UI.custom = lib.gamedata.CustomizedUIDataCollection.getInstance();
         lib.controls.ScaleCustomEvent.customizeData.valueOf(lib.gamedata.CustomizedUIDataKey["UI" + _loc2_],lib.controls.ScaleCustomEvent.eventGet,"scaleHandler");
      }
   }
   function scaleHandler(value)
   {
      if(!lib.controls.ScaleCustomEvent.focusUI)
      {
         return undefined;
      }
      var _loc4_ = new MovieClip();
      var _loc2_ = new MovieClip();
      var _loc8_ = lib.controls.ScaleCustomEvent.focusUI.name;
      var _loc3_ = _root.GetRegisterUIData(_loc8_);
      var _loc9_ = "SCALE_" + _loc8_ + "_PERCENT";
      var _loc5_ = undefined;
      var _loc7_ = undefined;
      _loc4_ = lib.controls.ScaleCustomEvent.focusUI;
      if(_loc4_.hit)
      {
         _loc2_ = _loc4_.hit;
      }
      else
      {
         _loc2_ = _loc4_;
      }
      if(_loc8_.toUpperCase() == "CROSSHAIR")
      {
         _loc5_ = value * (lib.info.AlignInfo.scaleRatio + 0.2);
         _loc7_ = value * (lib.info.AlignInfo.scaleRatio + 0.2);
      }
      else
      {
         _loc5_ = value * lib.info.AlignInfo.scaleRatio;
         _loc7_ = value * lib.info.AlignInfo.scaleRatio;
      }
      lib.info.AlignInfo[_loc9_] = value;
      var _loc10_ = lib.info.AlignInfo.uiScaleLimit(_loc5_ / 100);
      _loc5_ = _loc7_ = _loc10_ * 100;
      if(_loc3_.PA == "1")
      {
         lib.controls.ScaleCustomEvent.axis._xreg = 0;
         lib.controls.ScaleCustomEvent.axis._yreg = 0;
      }
      else if(_loc3_.PA == "2")
      {
         lib.controls.ScaleCustomEvent.axis._xreg = _loc2_._width / 2;
         lib.controls.ScaleCustomEvent.axis._yreg = 0;
      }
      else if(_loc3_.PA == "3")
      {
         lib.controls.ScaleCustomEvent.axis._xreg = _loc2_._width;
         lib.controls.ScaleCustomEvent.axis._yreg = 0;
      }
      else if(_loc3_.PA == "4")
      {
         lib.controls.ScaleCustomEvent.axis._xreg = 0;
         lib.controls.ScaleCustomEvent.axis._yreg = _loc2_._height / 2;
      }
      else if(_loc3_.PA == "5")
      {
         lib.controls.ScaleCustomEvent.axis._xreg = _loc2_._width / 2;
         lib.controls.ScaleCustomEvent.axis._yreg = _loc2_._height / 2;
      }
      else if(_loc3_.PA == "6")
      {
         lib.controls.ScaleCustomEvent.axis._xreg = _loc2_._width;
         lib.controls.ScaleCustomEvent.axis._yreg = _loc2_._height / 2;
      }
      else if(_loc3_.PA == "7")
      {
         lib.controls.ScaleCustomEvent.axis._xreg = 0;
         lib.controls.ScaleCustomEvent.axis._yreg = _loc2_._height;
      }
      else if(_loc3_.PA == "8")
      {
         lib.controls.ScaleCustomEvent.axis._xreg = _loc2_._width / 2;
         lib.controls.ScaleCustomEvent.axis._yreg = _loc2_._height;
      }
      else if(_loc3_.PA == "9")
      {
         lib.controls.ScaleCustomEvent.axis._xreg = _loc2_._width;
         lib.controls.ScaleCustomEvent.axis._yreg = _loc2_._height;
      }
      lib.controls.ScaleCustomEvent.axis.setXscale(_loc4_,_loc5_);
      lib.controls.ScaleCustomEvent.axis.setYscale(_loc4_,_loc7_);
   }
   function valueChangeHandler(event)
   {
      lib.controls.ScaleCustomEvent.focusUI = lib.controls.ScaleCustomEvent.arrayKeySearch(event.key);
      if(lib.controls.ScaleCustomEvent.focusUI == undefined)
      {
         return undefined;
      }
      this.scaleHandler(event.value);
   }
   static function delScaleCustom(_UIname)
   {
      var _loc1_ = lib.controls.ScaleCustomEvent.arrayNameSearch(_UIname);
      if(_loc1_ == undefined)
      {
         return undefined;
      }
      lib.controls.ScaleCustomEvent.listSave.splice(_loc1_,1);
      if(lib.controls.ScaleCustomEvent.listSave.length == 0)
      {
         lib.controls.ScaleCustomEvent.customizeData.removeEventListener(gfx.events.EventTypes.VALUE_CHANGE,lib.controls.ScaleCustomEvent.eventGet,"valueChangeHandler");
      }
   }
   static function delAllScaleCustom()
   {
      lib.controls.ScaleCustomEvent.customizeData.removeEventListener(gfx.events.EventTypes.VALUE_CHANGE,lib.controls.ScaleCustomEvent.eventGet,"valueChangeHandler");
      lib.controls.ScaleCustomEvent.listSave = [];
   }
   static function arrayNameSearch(_UIname)
   {
      var _loc1_ = lib.controls.ScaleCustomEvent.listSave.length;
      while(true)
      {
         _loc1_;
         if(_loc1_-- > 0)
         {
            if(_UIname == lib.controls.ScaleCustomEvent.listSave[_loc1_].name)
            {
               return _loc1_;
            }
            continue;
         }
         break;
      }
      return undefined;
   }
   static function arrayKeySearch(_UIkey)
   {
      var _loc1_ = lib.controls.ScaleCustomEvent.listSave.length;
      while(true)
      {
         _loc1_;
         if(_loc1_-- > 0)
         {
            if(_UIkey == lib.controls.ScaleCustomEvent.listSave[_loc1_].key)
            {
               return lib.controls.ScaleCustomEvent.listSave[_loc1_];
            }
            continue;
         }
         break;
      }
      return undefined;
   }
}
