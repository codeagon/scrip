function setData()
{
   serverName = arguments[0];
   waitingTime = lib.util.UIString.getUIString("$011018","time",arguments[2]);
   waitingUsers = lib.util.UIString.getUIString("$011017","users",arguments[1]);
   if(Number(arguments[3]) != 0)
   {
      bonusDesc = "" + lib.util.UIString.getUIString("$011019","time",arguments[3]);
      viewBonus = true;
   }
   else
   {
      bonusDesc = buffGuide_str;
      viewBonus = false;
   }
   contentsMc.server_txt.text = serverName;
   contentsMc.user_txt.text = waitingUsers;
   contentsMc.time_txt.text = waitingTime;
   contentsMc.buff_txt.text = bonusDesc;
}
function returnWaiting()
{
   gotoAndStop("out");
   play();
}
function setWatingExit_btn()
{
   exitBtn.onRollOver = function()
   {
      if(ChBtn_StartCheck == false)
      {
         lib.util.FrameSeeker.seek(this.Btn2,1,ChBtn_OverFrame);
      }
   };
   exitBtn.onRollOut = function()
   {
      if(ChBtn_StartCheck == false)
      {
         lib.util.FrameSeeker.seek(this.Btn2,ChBtn_OverFrame,1);
      }
   };
   exitBtn.onRelease = exitBtn.onReleaseOutside = function()
   {
      if(ChBtn_StartCheck == false)
      {
         ChBtn_StartCheck = true;
         lib.util.FrameSeeker.seek(this.Btn2,ChBtn_OverFrame,ChBtn_EndFrame);
         exitBtn.onEnterFrame = function()
         {
            if(exitBtn.Btn2._currentframe >= ChBtn_EndFrame)
            {
               returnWaiting();
               this.onEnterFrame = null;
            }
            updateAfterEvent();
         };
      }
   };
}
var buffGuide_str = "$011022";
var waitingTime = "";
var waitingUsers = "";
var serverName = "";
var bonusDesc = buffGuide_str;
var viewBonus = false;
var ChBtn_StartCheck = false;
var ChBtn_OverFrame = 8;
var ChBtn_EndFrame = 34;
