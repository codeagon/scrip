class lib.util.McMaker
{
   function McMaker()
   {
   }
   static function attach(target, linkage, size)
   {
      var _loc1_ = target.attachMovie(linkage,linkage,1);
      if(size != undefined && size != "")
      {
         _loc1_._width = _loc1_._height = size;
      }
      return _loc1_;
   }
   function createMovie(linkage, target, name, fX, fY, wNumber, hNumber, wG, hG, startNumber, maxMovieNum)
   {
      this.mc_array = new Array();
      this.clearMovie();
      this.container = target;
      this.prefix = name;
      var _loc5_ = 0;
      var _loc4_ = startNumber;
      this.firstX = fX;
      this.firstY = fY;
      this.wGap = wG;
      this.hGap = hG;
      this.wNum = wNumber;
      this.hNum = hNumber;
      this.wCount = this.firstX;
      this.hCount = this.firstY;
      var _loc2_ = undefined;
      var _loc6_ = undefined;
      var _loc8_ = undefined;
      var _loc7_ = 0;
      while(_loc7_ < hNumber)
      {
         var _loc3_ = 0;
         while(_loc3_ < wNumber)
         {
            _loc2_ = target.attachMovie(linkage,name + _loc4_,- _loc4_);
            _loc6_ = _loc2_._width;
            _loc8_ = _loc2_._height;
            _loc2_._x = this.wCount;
            _loc2_._y = this.hCount;
            this.wCount = this.wCount + (_loc6_ + this.wGap);
            this.mc_array.push(_loc2_);
            _loc4_ = _loc4_ + 1;
            _loc5_ = _loc5_ + 1;
            if(_loc5_ == maxMovieNum)
            {
               return undefined;
            }
            _loc3_ = _loc3_ + 1;
         }
         this.wCount = this.firstX;
         this.hCount = this.hCount + (_loc8_ + this.hGap);
         _loc7_ = _loc7_ + 1;
      }
   }
   function clearMovie()
   {
      var _loc4_ = this.container.getDepth();
      var _loc3_ = this.container._name;
      var _loc6_ = this.container._x;
      var _loc5_ = this.container._y;
      var _loc2_ = this.container._parent.createEmptyMovieClip(_loc3_,_loc4_);
      _loc2_._x = _loc6_;
      _loc2_._y = _loc5_;
   }
   function getContainer()
   {
      return this.container;
   }
   function searchById(id)
   {
      var _loc2_ = 0;
      while(_loc2_ < this.mc_array.length)
      {
         var _loc3_ = this.mc_array[_loc2_];
         if(_loc3_.id == id)
         {
            return _loc3_;
         }
         _loc2_ = _loc2_ + 1;
      }
      return null;
   }
   function arrange()
   {
   }
   function help()
   {
      trace("########################################## MovieMaker클래스 - 무비클립을 라이브러리에서 필요한만큼 생성 ###############################################");
      trace("-----------------------------------------------------------------------------------------------------------------------------------------------------");
      trace("new MakeMovie()");
      trace("-> 생성자");
      trace("-----------------------------------------------------------------------------------------------------------------------------------------------------");
      trace("createMovie(linkage:String, target:MovieClip ,name:String ,fX:Number ,fY:Number ,wNumber:Number ,hNumber:Number ,wG:Number ,hG:Number ,startNumber:Number, maxMoviNum:Number)");
      trace("-> 무비생성(링케지ID, 컨테이너, 생성이름접두사, 최초x, 최초y, 가로갯수, 세로갯수, 가로간격, 세로간격, 접두사넘버시작숫자, 총생성할 갯수)");
      trace("-----------------------------------------------------------------------------------------------------------------------------------------------------");
      trace("clearMovie();");
      trace("-> 모든슬롯삭제");
      trace("-----------------------------------------------------------------------------------------------------------------------------------------------------");
      trace("######################################################################################################################################################");
   }
}
