class src.union.ColumIconType
{
   var _align = "left";
   function ColumIconType(w, h, align, onlyIcon)
   {
      this._instanceTextFd = new src.union.S1TextField();
      this._instanceIcon = new src.union.S1Icon();
      this._onlyIcon = onlyIcon != undefined?onlyIcon:false;
      if(align != undefined)
      {
         this._align = align;
      }
      this._w = w;
      this._h = h;
   }
   function create(target, name, value, posX, posY, select)
   {
      if(this._onlyIcon == true)
      {
         var _loc4_ = posX + 5;
         var _loc2_ = 0;
         while(_loc2_ < value.length)
         {
            var _loc10_ = this._instanceIcon.create(target,value[_loc2_],"Icon_" + name + "_" + _loc2_,_loc4_,posY + 3,25,25);
            lib.manager.ToolTip.add(_loc10_,value[_loc2_ + 1],6);
            _loc4_ = _loc4_ + 30;
            _loc2_ = _loc2_ + 2;
         }
      }
      else
      {
         var _loc9_ = undefined;
         _loc10_ = this._instanceIcon.create(target,value[0],"Icon_" + name,posX + 2,posY + 1,30,30);
         if(select)
         {
            this._instanceTextFd.__get__textFormat().color = 8382235;
         }
         if(value[1] != undefined || value[1] != "")
         {
            _loc9_ = this._instanceTextFd.create(target,name,value[1],posX + 28,posY,this._w - 28,this._h);
         }
         if(this._align == "center")
         {
            posX = posX + this._w / 2 - (30 + _loc9_.textWidth + 4) / 2;
            _loc10_._x = posX;
            _loc9_._x = posX + 30;
         }
         else if(this._align == "right")
         {
            posX = posX + this._w - (_loc10_._width + _loc9_.textWidth + 4);
            _loc10_._x = posX;
            _loc9_._x = posX + 30;
         }
      }
   }
}
