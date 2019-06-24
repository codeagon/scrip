hit.onPress = function()
{
   var _loc3_ = {x:_xmouse,y:_ymouse};
   this.localToGlobal(_loc3_);
   _global.StartIconDrag(_name,Icon.resourcID,_loc3_.x,_loc3_.y,_xmouse,_ymouse);
};
hit.onRollOver = function()
{
   var _loc2_ = {x:this._x,y:this._y};
   localToGlobal(_loc2_);
};
hit.onRollOut = function()
{
};
hit.GetName = function()
{
   return _name;
};
stop();
