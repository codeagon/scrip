class src.union.ColumBtnType
{
   function ColumBtnType(instColum, func)
   {
      this._func = func;
      this._instanceColum = instColum;
   }
   function create(target, name, value, posX, posY, select)
   {
      this._instanceColum.create(target,name,value,posX,posY,select);
      var _loc2_ = target.attachMovie("optionBtn","popBtn",target.getNextHighestDepth());
      _loc2_._x = posX + this._instanceColum._w - 30;
      _loc2_._y = 2;
      var _this = this;
      _loc2_.selected = false;
      _loc2_.onPress = function()
      {
         if(this.selected == false)
         {
            this.gotoAndStop(3);
         }
      };
      _loc2_.onRelease = function()
      {
         if(this.selected == false)
         {
            this.gotoAndStop(4);
         }
         _this._func.call(_this,this);
      };
      _loc2_.onRollOver = function()
      {
         if(this.selected == false)
         {
            this.gotoAndStop(2);
         }
      };
      _loc2_.onRollOut = _loc2_.onReleaseOutside = function()
      {
         if(this.selected == false)
         {
            this.gotoAndStop(1);
         }
      };
   }
}
