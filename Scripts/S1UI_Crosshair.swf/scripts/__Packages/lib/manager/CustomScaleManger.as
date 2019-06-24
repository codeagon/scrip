class lib.manager.CustomScaleManger
{
   static var _flag = false;
   function CustomScaleManger()
   {
      this._storage = [];
      this.axis = new lib.util.AxisResetter();
      this.customizeData = lib.gamedata.CustomizedUIDataCollection.getInstance();
   }
   static function getInstance()
   {
      if(lib.manager.CustomScaleManger._flag)
      {
         return lib.manager.CustomScaleManger._instance;
      }
      lib.manager.CustomScaleManger._flag = true;
      lib.manager.CustomScaleManger._instance = new lib.manager.CustomScaleManger();
      return lib.manager.CustomScaleManger._instance;
   }
   function addCustomScale(target, UIName)
   {
      this.addStorage(target,UIName);
   }
   function removeCustomScale(target, UIName)
   {
      var _loc2_ = 0;
      var _loc4_ = this._storage.length;
      while(_loc2_ < _loc4_)
      {
         if(this._storage[_loc2_].uiname == UIName.toLowerCase() && this._storage[_loc2_].target == target)
         {
            var _loc3_ = this._storage.splice(_loc2_,1)[0];
            this.customizeData.removeEventListener(gfx.events.EventTypes.VALUE_CHANGE,_loc3_,"valueChangeHandler");
            false;
            return undefined;
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function addStorage(_tg, _UIName)
   {
      var _loc5_ = _UIName.toUpperCase();
      var _loc3_ = "UISCALE_" + _loc5_ + "_PERCENT";
      var _loc6_ = lib.gamedata.CustomizedUIDataKey[_loc3_];
      if(_loc6_ == undefined)
      {
         return undefined;
      }
      var _loc2_ = this.getListner(_UIName,_tg);
      var _this = this;
      if(_loc2_ == undefined)
      {
         _loc2_ = {target:_tg,uiname:_UIName.toLowerCase()};
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
   function getListner(_UIName, tg)
   {
      var _loc2_ = 0;
      var _loc3_ = this._storage.length;
      while(_loc2_ < _loc3_)
      {
         if(this._storage[_loc2_].uiname == _UIName.toLowerCase() && this._storage[_loc2_].target == tg)
         {
            return this._storage[_loc2_];
         }
         _loc2_ = _loc2_ + 1;
      }
      return undefined;
   }
   function scaleHandler(value, tg)
   {
      var _loc7_ = tg.uiname.toUpperCase();
      var _loc6_ = tg.target;
      var _loc11_ = "SCALE_" + _loc7_ + "_PERCENT";
      var _loc4_ = _root.GetRegisterUIData(_loc7_);
      var _loc3_ = new MovieClip();
      if(_loc6_.hit)
      {
         _loc3_ = _loc6_.hit;
      }
      else
      {
         _loc3_ = _loc6_;
      }
      var _loc5_ = undefined;
      var _loc10_ = undefined;
      if(_loc7_ == "CROSSHAIR")
      {
         _loc5_ = value * (lib.info.AlignInfo.scaleRatio + 0.2);
      }
      else
      {
         _loc5_ = value * lib.info.AlignInfo.scaleRatio;
      }
      _loc4_ = _root.GetRegisterUIData(_loc7_);
      if(_loc4_.ScaleCustom)
      {
         _loc5_ = _loc5_ * Number(_loc4_.ScaleCustom) / Number(lib.gamedata.DefaultData.getDefaultUIData("uiscale").param0);
      }
      var _loc9_ = lib.info.AlignInfo.uiScaleLimit(_loc5_ / 100);
      _loc5_ = _loc10_ = _loc9_ * 100;
      if(_loc4_.PA == "1")
      {
         this.axis._xreg = 0;
         this.axis._yreg = 0;
      }
      else if(_loc4_.PA == "2")
      {
         this.axis._xreg = _loc3_._width / 2;
         this.axis._yreg = 0;
      }
      else if(_loc4_.PA == "3")
      {
         this.axis._xreg = _loc3_._width;
         this.axis._yreg = 0;
      }
      else if(_loc4_.PA == "4")
      {
         this.axis._xreg = 0;
         this.axis._yreg = _loc3_._height / 2;
      }
      else if(_loc4_.PA == "5")
      {
         this.axis._xreg = _loc3_._width / 2;
         this.axis._yreg = _loc3_._height / 2;
      }
      else if(_loc4_.PA == "6")
      {
         this.axis._xreg = _loc3_._width;
         this.axis._yreg = _loc3_._height / 2;
      }
      else if(_loc4_.PA == "7")
      {
         this.axis._xreg = 0;
         this.axis._yreg = _loc3_._height;
      }
      else if(_loc4_.PA == "8")
      {
         this.axis._xreg = _loc3_._width / 2;
         this.axis._yreg = _loc3_._height;
      }
      else if(_loc4_.PA == "9")
      {
         this.axis._xreg = _loc3_._width;
         this.axis._yreg = _loc3_._height;
      }
      this.axis.setXscale(_loc6_,_loc5_);
      this.axis.setYscale(_loc6_,_loc10_);
      lib.info.AlignInfo[_loc11_] = value;
   }
   function valueChangeHandler(event, tg)
   {
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
