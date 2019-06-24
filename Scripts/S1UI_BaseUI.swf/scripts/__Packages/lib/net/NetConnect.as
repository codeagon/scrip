class lib.net.NetConnect
{
   static var scope = new Object();
   static var _videopath = "/";
   static var duration = null;
   static var thisTime = null;
   static var checkTime = null;
   static var test = "test!!!!!!!!!!!!!!!!!!!!";
   function NetConnect()
   {
   }
   static function NetConnectVideo(_scope)
   {
      lib.net.NetConnect.scope = _scope;
      lib.net.NetConnect.nc = new NetConnection();
      lib.net.NetConnect.nc.connect(null);
      lib.net.NetConnect.ns = new NetStream(lib.net.NetConnect.nc);
      lib.net.NetConnect.scope.attachVideo(lib.net.NetConnect.ns);
      lib.net.NetConnect.audio_sound = new Sound(lib.net.NetConnect.scope);
      lib.net.NetConnect.checkTime = lib.net.NetConnect.scope.createEmptyMovieClip("timer",lib.net.NetConnect.scope.getNextHighestDepth());
   }
   static function PlayVideo(FileName)
   {
      lib.net.NetConnect.ns.loop = true;
      lib.net.NetConnect.ns.play(FileName + ".usm");
      lib.net.NetConnect.ns.onMetaData = function(ob)
      {
         var _loc1_ = String(ob.duration);
         var _loc2_ = _loc1_.indexOf(".");
         lib.net.NetConnect.duration = _loc1_.substr(0,_loc2_ + 2);
      };
   }
   static function StopVideo()
   {
      lib.net.NetConnect.ns.close();
      lib.net.NetConnect.scope.clear();
   }
}
