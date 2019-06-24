function playVideo(videoFileName)
{
   ns.play(videoFileName);
   checkTime.onEnterFrame = function()
   {
      var _loc1_ = String(ns.time);
      thisTime = Math.round(_loc1_);
      if(Math.round(duration) == thisTime)
      {
         if(loop)
         {
            ns.seek(0);
         }
         else
         {
            ToGame_InGameMovie_End();
            myListener.OnGame_InGameMovie_Remove();
         }
      }
   };
}
function ToGame_InGameMovie_End()
{
   fscommand("ToGame_InGameMovie_End");
   trace("ToGame_InGameMovie_End()");
}
function ToGame_InGameMovie_CloseUI()
{
   fscommand("ToGame_InGameMovie_CloseUI");
   trace("ToGame_InGameMovie_CloseUI()");
}
function ToGame_InGameMovie_Init()
{
   fscommand("ToGame_InGameMovie_Init");
   trace("ToGame_InGameMovie_Init()");
}
function ToGame_InGameMovie_Time(time)
{
   getURL("FSCommand:ToGame_InGameMovie_Time",time);
   trace("ToGame_InGameMovie_Time: " + time);
}
var UI = this;
UI._visible = false;
var UIname = "InGameMovie";
var bWindowOpen = false;
_focusrect = false;
var testURL = lib.info.LoadURL.HELP_MOV_101;
nc = new NetConnection();
nc.connect(null);
ns = new NetStream(nc);
container_mc.video.attachVideo(ns);
var audio_sound = new Sound(this);
ns.onMetaData = function(o)
{
   var _loc1_ = String(o.duration);
   var _loc2_ = _loc1_.indexOf(".");
   duration = _loc1_.substr(0,_loc2_ + 2);
};
var duration = null;
var thisTime = null;
var checkTime = UI.createEmptyMovieClip("timer",UI.getNextHighestDepth());
var loop = false;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
myListener.OnGameEventShowWindow = function(WindowName, bShow)
{
   if(WindowName.toLowerCase() == UIname.toLowerCase())
   {
      bWindowOpen = bShow;
      UI._visible = bShow;
      if(!bShow)
      {
         myListener.OnGame_InGameMovie_Remove();
      }
   }
};
myListener.OnGame_InGameMovie_Play = function(url, bLoop)
{
   UI._visible = true;
   bLoop = Number(bLoop);
   if(isNaN(bLoop))
   {
      bLoop = 0;
   }
   loop = bLoop;
   if(url.toLowerCase() == "test")
   {
      playVideo(testURL);
   }
   else
   {
      playVideo(url);
   }
};
myListener.OnGame_InGameMovie_Remove = function()
{
   delete checkTime.onEnterFrame;
   ns.close();
   container_mc.video.clear();
   UI._visible = false;
};
myListener.OnGame_InGameMovie_Pause = function(bTrue)
{
   bTrue = Number(bTrue);
   if(bTrue || bTrue == NaN)
   {
      ns.pause(true);
   }
   else
   {
      ns.pause(false);
   }
};
myListener.OnGame_InGameMovie_GetTime = function()
{
   ToGame_InGameMovie_Time(ns.time);
};
ToGame_InGameMovie_Init();
