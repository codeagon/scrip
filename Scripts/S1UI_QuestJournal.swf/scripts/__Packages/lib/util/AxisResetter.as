class lib.util.AxisResetter
{
   var _xreg = 0;
   var _yreg = 0;
   function AxisResetter()
   {
   }
   function setPropRel(target, prop, amount)
   {
      var _loc4_ = {x:this._xreg,y:this._yreg};
      target.localToGlobal(_loc4_);
      target._parent.globalToLocal(_loc4_);
      target[prop] = amount;
      var _loc3_ = {x:this._xreg,y:this._yreg};
      target.localToGlobal(_loc3_);
      target._parent.globalToLocal(_loc3_);
      target._x = target._x - (_loc3_.x - _loc4_.x);
      target._y = target._y - (_loc3_.y - _loc4_.y);
   }
   function setX(target, v)
   {
      var _loc2_ = {x:this._xreg,y:this._yreg};
      target.localToGlobal(_loc2_);
      target._parent.globalToLocal(_loc2_);
      target._x = target._x + (v - _loc2_.x);
   }
   function setY(target, v)
   {
      var _loc2_ = {x:this._xreg,y:this._yreg};
      target.localToGlobal(_loc2_);
      target._parent.globalToLocal(_loc2_);
      target._x = target._x + (v - _loc2_.y);
   }
   function setXscale(target, v)
   {
      this.setPropRel(target,"_xscale",v);
   }
   function setYscale(target, v)
   {
      this.setPropRel(target,"_yscale",v);
   }
   function setRotation(target, v)
   {
      this.setPropRel(target,"_rotation",v);
   }
   function getXmouse(target, v)
   {
      return target._xmouse - this._xreg;
   }
   function getYmouse(target, v)
   {
      return target._ymouse - this._yreg;
   }
   function help()
   {
   }
}
