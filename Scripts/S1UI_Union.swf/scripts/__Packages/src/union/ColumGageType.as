class src.union.ColumGageType
{
   var _align = "left";
   function ColumGageType(w, h)
   {
      this._instanceTextFd = new src.union.S1TextField();
      this._instanceIcon = new src.union.S1Icon();
      this._w = w;
      this._h = h;
   }
   function create(target, name, value, posX, posY, select)
   {
      var _loc9_ = undefined;
      var _loc2_ = target.attachMovie("gageAsset","gage_" + name,target.getNextHighestDepth());
      _loc2_._x = posX;
      _loc2_._y = posY + 7;
      _loc2_.mask._xscale = Number(value[0]);
      if(select)
      {
         _loc2_.gage.gotoAndStop(2);
      }
      this._instanceTextFd.__get__textFormat().align = "center";
      this._instanceTextFd.create(target,name,value[1],posX,posY,this._w,this._h);
   }
}
