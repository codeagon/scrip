class lib.controls.S_NumberSteper2 extends lib.controls.S_NumberSteper
{
   var useMaxMinButton = true;
   function S_NumberSteper2()
   {
      super();
   }
   function display()
   {
      var _loc2_ = this._width - 3;
      this._xscale = 100;
      this.min_mc._x = _loc2_ - this.min_mc._width;
      this.max_mc._x = this.min_mc._x - this.max_mc._width;
      this.left_mc._x = this.max_mc._x - this.left_mc._width;
      this.right_mc._x = this.left_mc._x - this.right_mc._width;
      this.bgMc._width = this.right_mc._x - 1 - this.bgMc._x;
      this.inputFd._width = this.right_mc._x - 1 - this.bgMc._x - 6;
      this.inputFd_focus._width = this.right_mc._x - 1 - this.bgMc._x + 6;
      this.min_mc._visible = this.useMaxMinButton;
      this.max_mc._visible = this.useMaxMinButton;
   }
   function setUse10PageButton(bTrue)
   {
   }
}
