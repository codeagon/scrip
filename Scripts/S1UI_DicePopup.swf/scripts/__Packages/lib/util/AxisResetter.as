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
      trace("################################################### AxisResetter클래스 - 무비클립 중심축 이동작동######################################################");
      trace("-----------------------------------------------------------------------------------------------------------------------------------------------------");
      trace("new AxisResetter()");
      trace("-> 생성자");
      trace("-----------------------------------------------------------------------------------------------------------------------------------------------------");
      trace("_xreg");
      trace("-> 축으로 만들 x점");
      trace("-----------------------------------------------------------------------------------------------------------------------------------------------------");
      trace("_yreg");
      trace("-> 축으로 만들 y점");
      trace("-----------------------------------------------------------------------------------------------------------------------------------------------------");
      trace("setX(target, v)");
      trace("-> 중심축으로 타겟의 _x재설정");
      trace("-----------------------------------------------------------------------------------------------------------------------------------------------------");
      trace("setY(target, v)");
      trace("-> 중심축으로 타겟의 _y재설정)");
      trace("-----------------------------------------------------------------------------------------------------------------------------------------------------");
      trace("setXscale(target, v)");
      trace("-> 중심축으로 타겟의 _xscale재설정)");
      trace("-----------------------------------------------------------------------------------------------------------------------------------------------------");
      trace("setYscale(target, v)");
      trace("--> 중심축으로 타겟의 _yscale재설정");
      trace("-----------------------------------------------------------------------------------------------------------------------------------------------------");
      trace("setRotation(target, v)");
      trace("--> 중심축으로 타겟의 _rotation재설정");
      trace("-----------------------------------------------------------------------------------------------------------------------------------------------------");
      trace("getXmouse(target, v)");
      trace("--> 중심축으로 타겟의 _xmouse위치 얻기");
      trace("-----------------------------------------------------------------------------------------------------------------------------------------------------");
      trace("getYmouse(target, v)");
      trace("--> 중심축으로 타겟의 _ymouse위치 얻기");
      trace("######################################################################################################################################################");
   }
}
