class lib.net.SwfConnect
{
   static var scope = new Object();
   static var _swfpath = "/package/";
   function SwfConnect()
   {
   }
   static function SwfConnectFile(_scope, FileName)
   {
      lib.net.SwfConnect.scope = _scope;
      var _loc3_ = 0;
      var _loc2_ = {};
      var _loc1_ = new MovieClipLoader();
      _loc1_.addListener(_loc2_);
      _loc1_.loadClip(lib.net.SwfConnect._swfpath + FileName + ".swf",lib.net.SwfConnect.scope.OutputMc.OutputSwfMc);
   }
}
