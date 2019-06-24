class lib.controls.S_TxtBtn2 extends MovieClip
{
   function S_TxtBtn2()
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
   function draw()
   {
      this.resize();
      this.txt.verticalAlign = "center";
      this.txt.textAutoSize = "shrink";
      if(this._label != "")
      {
         this.txt.text = this._label;
      }
   }
   function resize()
   {
      var _loc3_ = this._width;
      var _loc2_ = this._height;
      this._xscale = this._yscale = 100;
      this.btn._width = _loc3_;
      this.txt._width = _loc3_;
      this.btn._height = _loc2_;
      this.txt._height = _loc2_;
   }
}
