class lib.controls.CustomScaleEvent
{
   var _instance = new Object();
   var UIStrings = "";
   var UIStringsAdd = "";
   var UIName = "";
   var UINameArray = new Array();
   var UIInstanceArray = new Array();
   var test_data01 = "test_data01";
   function CustomScaleEvent()
   {
      return undefined;
   }
   function CustomScaleEvent_Init()
   {
   }
   function CustomScaleEventCheck(_ui, _uistr)
   {
      return undefined;
   }
   function scaleHandler(value)
   {
      var _loc4_ = _root.GetRegisterUIData(this.UIName);
      var _loc3_ = new MovieClip();
      if(this.UI.hit)
      {
         _loc3_ = this.UI.hit;
      }
      else
      {
         _loc3_ = this.UI;
      }
      var _loc5_ = undefined;
      var _loc7_ = undefined;
      if(this.UIName == "CROSSHAIR")
      {
         _loc5_ = value * (lib.info.AlignInfo.scaleRatio + 0.2);
         _loc7_ = value * (lib.info.AlignInfo.scaleRatio + 0.2);
      }
      else
      {
         _loc5_ = value * lib.info.AlignInfo.scaleRatio;
         _loc7_ = value * lib.info.AlignInfo.scaleRatio;
      }
      var _loc8_ = lib.info.AlignInfo.uiScaleLimit(_loc5_ / 100);
      _loc5_ = _loc7_ = _loc8_ * 100;
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
      this.axis.setXscale(this.UI,_loc5_);
      this.axis.setYscale(this.UI,_loc7_);
      lib.info.AlignInfo[this.UIStrings] = value;
   }
   function valueChangeHandler(event)
   {
      var _loc2_ = 0;
      while(_loc2_ < this.UINameArray.length)
      {
         if(event.key == lib.gamedata.CustomizedUIDataKey["UISCALE_" + this.UINameArray[_loc2_] + "_PERCENT"])
         {
            this.UIName = this.UINameArray[_loc2_];
            this.UI = this.UIInstanceArray[_loc2_];
            lib.info.AlignInfo.uiScale(this.UIName,this.UI);
            this.UIStrings = lib.info.AlignInfo.UISCALE_VARS;
            this.UIStringsAdd = "UI" + this.UIStrings;
            this.scaleHandler(event.value);
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function CustomScaleEventRemoveCheck()
   {
      this.customizeData.removeEventListener(lib.gfx.events.EventTypes.VALUE_CHANGE,this._instance,"valueChangeHandler");
   }
}
