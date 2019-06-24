class lib.controls.S_TabBtn extends MovieClip
{
   var _space = 1;
   function S_TabBtn()
   {
      super();
      this.hw = this.tabBtn0.hit._width;
      this.bw = this.tabBtn0.bgmc._width;
      this.tw = this.tabBtn0.labelFd._width;
      _global.gfxExtensions = true;
      this._columCount = this._labels.length;
      this.draw();
   }
   function __set__labels(lbs)
   {
      if(lbs == undefined)
      {
         return undefined;
      }
      this._labels = lbs;
      this._columCount = this._labels.length;
      this.draw();
      return this.__get__labels();
   }
   function draw()
   {
      var _loc4_ = undefined;
      var _loc8_ = this;
      var _loc5_ = [];
      var _loc6_ = [];
      var _loc7_ = this._btnWidth / this.hw;
      this.clear();
      var _loc3_ = 0;
      while(_loc3_ < this._columCount)
      {
         var _loc2_ = this["tabBtn" + _loc3_];
         if(_loc2_ == undefined)
         {
            _loc2_ = this.tabBtn0.duplicateMovieClip("tabBtn" + _loc3_,this.getNextHighestDepth());
         }
         _loc5_.push(_loc2_.bgmc);
         _loc6_.push(_loc2_.labelFd);
         _loc2_.hit._width = this._btnWidth;
         _loc2_.bgmc._width = this.bw * _loc7_;
         _loc2_.labelFd._width = this._btnWidth + (this.tw - this.hw);
         _loc2_.labelFd.textAutoSize = "shrink";
         _loc2_.labelFd.verticalAlign = "center";
         _loc2_.labelFd.text = this._labels[_loc3_];
         if(_loc3_ != 0)
         {
            _loc2_._x = _loc4_._x + this._btnWidth + this._space;
         }
         _loc4_ = _loc2_;
         _loc3_ = _loc3_ + 1;
      }
      this.tab = new lib.util.TabBtn(_loc5_,_loc6_);
   }
   function clear()
   {
      for(var _loc2_ in this)
      {
         if(typeof this[_loc2_] == "movieclip")
         {
            this[_loc2_].removeMovieClip();
         }
      }
   }
   function onSelected(index)
   {
   }
}
