this._parent._parent.sparkleCnt = this._parent._parent.sparkleCnt + 1;
if(this._parent._parent.sparkleNum != "INFINITY")
{
   if(this._parent._parent.sparkleNum <= this._parent._parent.sparkleCnt)
   {
      this.gotoAndStop(1);
   }
   else
   {
      this.gotoAndPlay(2);
   }
}
else
{
   this.gotoAndPlay(2);
}
