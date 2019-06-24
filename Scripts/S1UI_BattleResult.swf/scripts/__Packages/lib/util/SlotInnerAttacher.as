class lib.util.SlotInnerAttacher
{
   static var preLoadVar = "loaded!";
   static var ICON_SEAL = "seal";
   static var ICON_SEAL_ANCIENT = "seal_ancient";
   static var ICON_MASTERPIECE = "masterpiece";
   static var ICON_NEW = "newSlotEffect";
   static var INNER_CONTAINER_TOP = "topElementContainer";
   static var INNER_CONTAINER_ICON = "iconElementContainer";
   function SlotInnerAttacher()
   {
   }
   static function attach(targetSlot, attachElement, option)
   {
      var _loc7_ = targetSlot instanceof lib.util.Slot;
      var _loc5_ = option != undefined && option != "undefined" && option != "";
      var _loc9_ = _loc5_ && option.depth != undefined;
      var _loc13_ = _loc5_ && option.align != undefined;
      var _loc11_ = _loc5_ && option.leftMargin != undefined;
      var _loc17_ = _loc5_ && option.rightMargin != undefined;
      var _loc24_ = _loc5_ && option.topMargin != undefined;
      var _loc14_ = _loc5_ && option.bottomMargin != undefined;
      var _loc12_ = _loc5_ && option.name != undefined;
      var _loc19_ = targetSlot.icon == undefined?targetSlot.Icon:targetSlot.icon;
      var _loc27_ = !_loc9_?"icon":option.depth;
      var _loc22_ = targetSlot[lib.util.SlotInnerAttacher.INNER_CONTAINER_TOP] != undefined;
      var _loc25_ = targetSlot[lib.util.SlotInnerAttacher.INNER_CONTAINER_ICON] != undefined;
      var _loc15_ = targetSlot.getNextHighestDepth();
      var _loc20_ = !_loc7_?targetSlot.getNextHighestDepth():_loc19_.getDepth() + 1;
      var _loc18_ = !_loc22_?targetSlot.createEmptyMovieClip(lib.util.SlotInnerAttacher.INNER_CONTAINER_TOP,_loc15_):targetSlot[lib.util.SlotInnerAttacher.INNER_CONTAINER_TOP];
      var _loc10_ = !_loc25_?targetSlot.createEmptyMovieClip(lib.util.SlotInnerAttacher.INNER_CONTAINER_ICON,_loc20_):targetSlot[lib.util.SlotInnerAttacher.INNER_CONTAINER_ICON];
      var _loc6_ = _loc27_ != "icon"?_loc18_:_loc10_;
      var _loc8_ = !_loc12_?"element" + _loc6_.getNextHighestDepth():option.name;
      var _loc1_ = _loc6_.attachMovie(attachElement,_loc8_,_loc6_.getNextHighestDepth());
      var _loc26_ = !_loc13_?"LT":option.align;
      var _loc21_ = !_loc11_?0:option.leftMargin;
      var _loc28_ = !_loc17_?0:option.rightMargin;
      var _loc16_ = !_loc24_?0:option.topMargin;
      var _loc23_ = !_loc14_?0:option.bottomMargin;
      var _loc4_ = 0;
      if(_loc1_ == undefined)
      {
         _loc1_ = lib.util.DrawBitmap.makeMcAndDraw(targetSlot,attachElement);
      }
      if(_loc7_)
      {
         _loc4_ = targetSlot.SLOT;
      }
      else
      {
         _loc4_ = targetSlot;
      }
      switch(_loc26_)
      {
         case "T":
            lib.util.Aligner.align(_loc4_,_loc1_,"center","top","obj1","obj1");
            break;
         case "B":
            lib.util.Aligner.align(_loc4_,_loc1_,"center","bottom","obj1","obj1");
            break;
         case "L":
            lib.util.Aligner.align(_loc4_,_loc1_,"left","center","obj1","obj1");
            break;
         case "R":
            lib.util.Aligner.align(_loc4_,_loc1_,"right","center","obj1","obj1");
            break;
         case "TL":
            lib.util.Aligner.align(_loc4_,_loc1_,"left","top","obj1","obj1");
            break;
         case "TR":
            lib.util.Aligner.align(_loc4_,_loc1_,"right","top","obj1","obj1");
            break;
         case "BL":
            lib.util.Aligner.align(_loc4_,_loc1_,"left","bottom","obj1","obj1");
            break;
         case "BR":
            lib.util.Aligner.align(_loc4_,_loc1_,"right","bottom","obj1","obj1");
            break;
         case "C":
            lib.util.Aligner.align(_loc4_,_loc1_,"center","center","obj1","obj1");
      }
      _loc1_._x = _loc1_._x + _loc21_;
      _loc1_._x = _loc1_._x - _loc28_;
      _loc1_._y = _loc1_._y + _loc16_;
      _loc1_._y = _loc1_._y - _loc23_;
      return _loc1_;
   }
}
