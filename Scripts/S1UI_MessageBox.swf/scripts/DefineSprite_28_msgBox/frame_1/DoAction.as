function remove()
{
   this.removeMovieClip();
}
this.nExitCode;
btn_1.onPress = function()
{
   _parent._parent.ToGameMessageBoxEvent(_name,0);
   remove();
};
btn_2.onPress = function()
{
   _parent._parent.ToGameMessageBoxEvent(_name,1);
   remove();
};
btn_exit.onPress = function()
{
   trace("x");
   _parent._parent.ToGameMessageBoxEvent(_name,nExitCode);
   remove();
};
