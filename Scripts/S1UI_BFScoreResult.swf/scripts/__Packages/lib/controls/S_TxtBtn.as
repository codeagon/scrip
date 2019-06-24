class lib.controls.S_TxtBtn extends MovieClip
{
   function S_TxtBtn()
   {
      super();
      _global.gfxExtensions = true;
      this.draw();
   }
   function __get__txtBtn()
   {
      if(this.insTxtBtn == undefined)
      {
         this.insTxtBtn = new lib.util.TxtBtn(this.btn,this.txt);
      }
      return this.insTxtBtn;
   }
   function setBtnSize(s)
   {
      this._size = s;
      this.draw();
      this.onEnterFrame = function()
      {
         trace(this._currentframe);
         if(this._currentframe == this._size)
         {
            this.insTxtBtn = new lib.util.TxtBtn(this.btn,this.txt);
            this.onBtnResize(this.insTxtBtn);
            delete this.onEnterFrame;
         }
      };
   }
   function onBtnResize(inst)
   {
   }
   function draw()
   {
      this.gotoAndStop(this._size);
      this.txt.verticalAlign = "center";
      this.txt.textAutoSize = "shrink";
      if(this._label != "")
      {
         this.txt.text = this._label;
      }
   }
   function setXPosition()
   {
      var _loc5_ = {x:0,y:0};
      var _loc7_ = {x:0,y:0};
      var _loc6_ = {x:this._x,y:this._y};
      this.uiinst.container_mc.localToGlobal(_loc5_);
      this._parent.localToGlobal(_loc7_);
      this._parent.localToGlobal(_loc6_);
      var _loc3_ = _loc6_.x - _loc5_.x;
      var _loc8_ = lib.manager.UISkin.TXTBTN_Y - (_loc7_.y - _loc5_.y);
      var _loc2_ = lib.manager.UISkin.TXTBTN_XPOSITION;
      for(var _loc4_ in _loc2_)
      {
         if(_loc3_ >= _loc2_[_loc4_] - 10 && _loc3_ <= _loc2_[_loc4_] + 10)
         {
            this._x = _loc2_[_loc4_];
            break;
         }
      }
      this._y = _loc8_;
   }
}
