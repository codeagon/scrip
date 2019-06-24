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
      if(this._label != "")
      {
         this.txt.text = this._label;
      }
   }
   function resize()
   {
      if(this._xscale == 100)
      {
         return undefined;
      }
      var _loc2_ = this._width;
      this._xscale = 100;
      this.btn._width = _loc2_;
      this.txt._width = _loc2_;
   }
}
