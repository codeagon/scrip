function updateDegreeDelta(DegreeDelta)
{
   spinDegree = spinDegree + DegreeDelta;
   if(spinDegree > 360)
   {
      spinDegree = spinDegree - 360;
   }
   else if(spinDegree < 0)
   {
      spinDegree = spinDegree + 360;
   }
   _parent._parent.ToGame_HomunManager_RotateHomun(0,spinDegree,0);
   trace("spinDegree:" + spinDegree);
}
function StartSpin(Degree)
{
   if(intervalId != null)
   {
      intervalId = setInterval(this,"updateDegreeDelta",20,Degree);
   }
   else
   {
      clearInterval(intervalId);
      intervalId = setInterval(this,"updateDegreeDelta",20,Degree);
   }
}
function StopSpin()
{
   clearInterval(intervalId);
}
var spinDegree = 0;
var intervalId;
leftBtn.onRelease = leftBtn.onReleaseOutside = leftBtn.onRollOut = function()
{
   this.gotoAndStop(1);
   StopSpin();
};
leftBtn.onPress = function()
{
   this.gotoAndStop(3);
   StartSpin(-5);
};
leftBtn.onRollOver = function()
{
   this.gotoAndStop(2);
};
RightBtn.onRelease = RightBtn.onReleaseOutside = RightBtn.onRollOut = function()
{
   this.gotoAndStop(1);
   StopSpin();
};
RightBtn.onPress = function()
{
   this.gotoAndStop(3);
   StartSpin(5);
};
RightBtn.onRollOver = function()
{
   this.gotoAndStop(2);
};
