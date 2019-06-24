class com.bluehole.tera.managers.ScaleManager extends gfx.events.EventDispatcher
{
   function ScaleManager()
   {
      super();
      this._storage = [];
      this.axis = new lib.util.AxisResetter();
      this.customizeData = lib.gamedata.CustomizedUIDataCollection.getInstance();
   }
   static function getInstance()
   {
      if(com.bluehole.tera.managers.ScaleManager._instance == null)
      {
         com.bluehole.tera.managers.ScaleManager._instance = new com.bluehole.tera.managers.ScaleManager();
      }
      return com.bluehole.tera.managers.ScaleManager._instance;
   }
   function addCustomScale(widget)
   {
      this.addStorage(widget);
   }
   function removeCustomScale(widget)
   {
      var _loc2_ = 0;
      var _loc5_ = this._storage.length;
      while(_loc2_ < _loc5_)
      {
         if(this._storage[_loc2_].uiname == widget.getName().toLowerCase() && this._storage[_loc2_].target == widget)
         {
            var _loc3_ = this._storage.splice(_loc2_,1)[0];
            this.customizeData.removeEventListener(gfx.events.EventTypes.VALUE_CHANGE,_loc3_,"valueChangeHandler");
            false;
            return undefined;
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function addStorage(widget)
   {
      lib.Debuger.trace("서얼마3");
      var _loc5_ = widget.getName().toUpperCase();
      var _loc3_ = "UISCALE_" + _loc5_ + "_PERCENT";
      var _loc6_ = lib.gamedata.CustomizedUIDataKey[_loc3_];
      if(_loc6_ == undefined)
      {
         return undefined;
      }
      var _loc2_ = this.getListner(widget);
      var _this = this;
      if(_loc2_ == undefined)
      {
         _loc2_ = {target:widget,uiname:widget.getName().toLowerCase()};
         this._storage.push(_loc2_);
         _loc2_.scaleHandler = function(value)
         {
            _this.scaleHandler(value,this);
         };
         _loc2_.valueChangeHandler = function(event)
         {
            _this.valueChangeHandler(event,this);
         };
         this.customizeData.valueOf(lib.gamedata.CustomizedUIDataKey[_loc3_],_loc2_,"scaleHandler");
         this.customizeData.addEventListener(gfx.events.EventTypes.VALUE_CHANGE,_loc2_,"valueChangeHandler");
      }
   }
   function getListner(w)
   {
      var _loc2_ = 0;
      var _loc4_ = this._storage.length;
      while(_loc2_ < _loc4_)
      {
         if(this._storage[_loc2_].uiname == w.getName().toLowerCase() && this._storage[_loc2_].target == w)
         {
            return this._storage[_loc2_];
         }
         _loc2_ = _loc2_ + 1;
      }
      return undefined;
   }
   function scaleHandler(value, tg)
   {
      lib.Debuger.trace("서얼마1");
      var _loc6_ = tg.uiname.toUpperCase();
      var _loc5_ = (com.bluehole.tera.view.core.Widget)tg.target;
      var _loc3_ = _loc5_.getWidgetData();
      var _loc10_ = "SCALE_" + _loc6_ + "_PERCENT";
      var _loc2_ = _loc5_.getHitArea();
      if(_loc2_ == null || _loc2_ == undefined)
      {
         _loc2_ = _loc5_;
      }
      var _loc4_ = undefined;
      var _loc9_ = undefined;
      if(_loc6_ == "CROSSHAIR")
      {
         _loc4_ = value * (lib.info.AlignInfo.scaleRatio + 0.2);
      }
      else
      {
         _loc4_ = value * lib.info.AlignInfo.scaleRatio;
      }
      if(_loc3_.ScaleCustom)
      {
         _loc4_ = _loc4_ * Number(_loc3_.ScaleCustom) / Number(lib.gamedata.DefaultData.getDefaultUIData("uiscale").param0);
      }
      var _loc8_ = lib.info.AlignInfo.uiScaleLimit(_loc4_ * 0.01);
      _loc4_ = _loc9_ = _loc8_ * 100;
      if(_loc3_.PA == "1")
      {
         this.axis._xreg = 0;
         this.axis._yreg = 0;
      }
      else if(_loc3_.PA == "2")
      {
         this.axis._xreg = _loc2_._width >> 1;
         this.axis._yreg = 0;
      }
      else if(_loc3_.PA == "3")
      {
         this.axis._xreg = _loc2_._width;
         this.axis._yreg = 0;
      }
      else if(_loc3_.PA == "4")
      {
         this.axis._xreg = 0;
         this.axis._yreg = _loc2_._height >> 1;
      }
      else if(_loc3_.PA == "5")
      {
         this.axis._xreg = _loc2_._width >> 1;
         this.axis._yreg = _loc2_._height >> 1;
      }
      else if(_loc3_.PA == "6")
      {
         this.axis._xreg = _loc2_._width;
         this.axis._yreg = _loc2_._height >> 1;
      }
      else if(_loc3_.PA == "7")
      {
         this.axis._xreg = 0;
         this.axis._yreg = _loc2_._height;
      }
      else if(_loc3_.PA == "8")
      {
         this.axis._xreg = _loc2_._width >> 1;
         this.axis._yreg = _loc2_._height;
      }
      else if(_loc3_.PA == "9")
      {
         this.axis._xreg = _loc2_._width;
         this.axis._yreg = _loc2_._height;
      }
      this.axis.setXscale(_loc5_,_loc4_);
      this.axis.setYscale(_loc5_,_loc9_);
      lib.info.AlignInfo[_loc10_] = value;
   }
   function valueChangeHandler(event, tg)
   {
      lib.Debuger.trace("서얼마2");
      var _loc5_ = "UISCALE_" + tg.uiname.toUpperCase() + "_PERCENT";
      if(event.key == lib.gamedata.CustomizedUIDataKey[_loc5_])
      {
         var _loc4_ = tg.uiname;
         var _loc3_ = tg.target;
         lib.info.AlignInfo.uiScale(_loc4_,_loc3_);
         this.scaleHandler(event.value,tg);
      }
   }
}
