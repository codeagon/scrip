class lib.util.Aligner
{
   static var preLoadVar = "loaded!";
   function Aligner()
   {
   }
   static function align(obj1, obj2, xAlign, yAlign, xAlignCenterMethod, yAlignCenterMethod)
   {
      if(xAlign == "left")
      {
         var _loc6_ = obj1._x >= obj2._x?obj2._x:obj1._x;
         obj1._x = obj2._x = _loc6_;
      }
      else if(xAlign == "center")
      {
         if(xAlignCenterMethod == "obj1")
         {
            obj2._x = obj1._x + (obj1._width - obj2._width) / 2;
         }
         else if(xAlignCenterMethod == "obj2")
         {
            obj1._x = obj2._x + (obj2._width - obj1._width) / 2;
         }
         else if(xAlignCenterMethod == "none")
         {
            var _loc4_ = Math.abs((obj1._x - obj2._x) / 2);
            var _loc14_ = obj1._x >= obj2._x?obj2:obj1;
            var _loc10_ = obj1._x >= obj2._x?obj1:obj2;
            _loc14_._x = _loc14_._x + _loc4_;
            _loc10_._x = _loc10_._x - _loc4_;
         }
      }
      else if(xAlign == "right")
      {
         _loc6_ = obj1._x + obj1._width >= obj2._x + obj2._width?obj1._x + obj1._width:obj2._x + obj2._width;
         obj1._x = _loc6_ - obj1._width;
         obj2._x = _loc6_ - obj2._width;
      }
      if(yAlign == "top")
      {
         var _loc5_ = obj1._y >= obj2._y?obj2._y:obj1._y;
         obj1._y = obj2._y = _loc5_;
      }
      else if(yAlign == "center")
      {
         if(yAlignCenterMethod == "obj1")
         {
            obj2._y = obj1._y + (obj1._height - obj2._height) / 2;
         }
         else if(yAlignCenterMethod == "obj2")
         {
            obj1._y = obj2._y + (obj2._height - obj1._height) / 2;
         }
         else if(yAlignCenterMethod == "none")
         {
            var _loc3_ = Math.abs((obj1._y - obj2._y) / 2);
            var _loc11_ = obj1._y >= obj2._y?obj2:obj1;
            var _loc7_ = obj1._y >= obj2._y?obj1:obj2;
            _loc11_._y = _loc11_._y + _loc3_;
            _loc7_._y = _loc7_._y - _loc3_;
         }
      }
      else if(yAlign == "bottom")
      {
         _loc5_ = obj1._y + obj1._height >= obj2._y + obj2._height?obj1._y + obj1._height:obj2._y + obj2._height;
         obj1._y = _loc5_ - obj1._height;
         obj2._y = _loc5_ - obj2._height;
      }
   }
}
