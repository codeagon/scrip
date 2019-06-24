class controls.S_TabBtn_AutoSize extends lib.controls.S_TabBtn
{
   var countMcs = [];
   var accents = [];
   function S_TabBtn_AutoSize()
   {
      super();
      this.countMc0._visible = false;
      this.newIcon0._visible = false;
   }
   function __set__counts(value)
   {
      while(this.countMcs.length > 0)
      {
         (MovieClip)this.countMcs.pop().removeMovieClip();
      }
      if(this.tab && value.length > 0)
      {
         var _loc2_ = 0;
         while(_loc2_ < value.length)
         {
            var _loc4_ = this["tabBtn" + _loc2_];
            if(_loc4_ && value[_loc2_] > 0)
            {
               var _loc3_ = this.countMc0.duplicateMovieClip("cMc" + _loc2_,this.getNextHighestDepth());
               _loc3_.txt.text = value[_loc2_];
               _loc3_._x = _loc4_._x + _loc4_.bgmc._width - _loc3_._width;
               _loc3_._visible = true;
               this.countMcs.push(_loc3_);
            }
            _loc2_ = _loc2_ + 1;
         }
      }
      return this.__get__counts();
   }
   function __set__btnModes(bModes)
   {
      var _loc2_ = 0;
      while(_loc2_ < bModes.length)
      {
         if(Number(bModes[_loc2_]) == 1)
         {
            lib.Debuger.trace("setTab : " + _loc2_);
            lib.Debuger.trace("bModes[i] : " + bModes[_loc2_]);
            this.tab.setTab(_loc2_,1);
         }
         _loc2_ = _loc2_ + 1;
      }
      return this.__get__btnModes();
   }
   function __set__accent(value)
   {
      while(this.accents.length > 0)
      {
         (MovieClip)this.accents.pop().removeMovieClip();
      }
      if(value)
      {
         if(!this["newIcon" + this.accentIndex])
         {
            var _loc2_ = this.newIcon0.duplicateMovieClip("newIcon" + this.accentIndex,this.getNextHighestDepth());
         }
         _loc2_._x = this["tabBtn" + this.accentIndex]._x + this["tabBtn" + this.accentIndex].bgmc._width - _loc2_._width;
         _loc2_._visible = true;
         this.accents.push(_loc2_);
         if(this["cMc" + this.accentIndex] && this["cMc" + this.accentIndex]._visible)
         {
            _loc2_._x = _loc2_._x - this["cMc" + this.accentIndex]._width;
         }
      }
      return this.__get__accent();
   }
   function draw()
   {
      var _loc6_ = undefined;
      var _loc7_ = [];
      var _loc8_ = [];
      var _loc10_ = [];
      var _loc9_ = this._btnWidth / this.hw;
      this.clear();
      var _loc3_ = 0;
      while(_loc3_ < this._columCount)
      {
         var _loc2_ = this["tabBtn" + _loc3_];
         if(_loc2_ == undefined)
         {
            _loc2_ = this.tabBtn0.duplicateMovieClip("tabBtn" + _loc3_,this.getNextHighestDepth());
         }
         _loc7_.push(_loc2_.bgmc);
         _loc8_.push(_loc2_.labelFd);
         _loc2_.labelFd.autoSize = true;
         _loc2_.labelFd.verticalAlign = "center";
         _loc2_.labelFd.text = this._labels[_loc3_];
         var _loc4_ = (TextField)_loc2_.labelFd.textWidth + 15;
         var _loc5_ = _loc4_ >= this._btnWidth?_loc4_:this._btnWidth;
         _loc2_.hit._width = _loc5_;
         _loc2_.bgmc._width = _loc5_ * _loc9_;
         _loc2_.labelFd._x = _loc2_.bgmc._width - _loc2_.labelFd._width >> 1;
         if(_loc3_ != 0)
         {
            _loc2_._x = _loc6_._x + _loc6_._width + this._space;
         }
         _loc6_ = _loc2_;
         _loc3_ = _loc3_ + 1;
      }
      this.tab = new lib.util.TabBtnPlayGuideCustomed(_loc7_,_loc8_,[8311036,8311036,8311036,8311036],[0,_loc7_.length - 2,_loc7_.length - 1]);
   }
}
