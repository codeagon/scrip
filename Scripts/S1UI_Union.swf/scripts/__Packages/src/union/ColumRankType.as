class src.union.ColumRankType
{
   function ColumRankType(w, h)
   {
      this._instanceTextFd = new src.union.S1TextField();
      this._instanceIcon = new src.union.S1Icon();
      this._w = w;
      this._h = h;
   }
   function create(target, name, value, posX, posY, select)
   {
      var _loc3_ = undefined;
      var _loc2_ = Number(value[0]);
      var _loc5_ = Number(value[1]);
      var _loc4_ = undefined;
      if(_loc2_ == 0)
      {
         _loc3_ = "img://__Icon_System.Rank_New";
         _loc4_ = 16384000;
      }
      else if(_loc2_ == _loc5_)
      {
         _loc3_ = "img://__Icon_System.Rank_Hyphen";
         _loc4_ = 16384000;
      }
      else if(_loc2_ > _loc5_)
      {
         _loc3_ = "img://__Icon_System.Rank_UpArr";
         _loc4_ = 16384000;
      }
      else if(_loc2_ < _loc5_)
      {
         _loc3_ = "img://__Icon_System.Rank_DownArr";
         _loc4_ = 37119;
      }
      if(_loc2_ != -1)
      {
         var _loc11_ = this._instanceIcon.create(target,_loc3_,"Icon_" + name,posX + 4,posY + 5,20,20);
         this._instanceTextFd.__get__textFormat().align = "left";
         this._instanceTextFd.__get__textFormat().color = _loc4_;
         if(_loc2_ != _loc5_ && _loc2_ != 0)
         {
            this._instanceTextFd.create(target,name + "_0","[" + value[0] + "]",posX + 20,posY,50,this._h);
         }
         else
         {
            _loc11_._x = posX + 20;
         }
         this._instanceTextFd.__get__textFormat().align = "center";
         this._instanceTextFd.__get__textFormat().color = 14145495;
         this._instanceTextFd.create(target,name + "_1",value[1],posX + 58,posY,40,this._h);
      }
      else
      {
         this._instanceTextFd.__get__textFormat().align = "center";
         this._instanceTextFd.__get__textFormat().color = 14145495;
         this._instanceTextFd.create(target,name + "_1",value[1],posX,posY,110,this._h);
      }
   }
}
