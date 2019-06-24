class src.union.chart.ChartSkin extends MovieClip implements src.union.chart.IChartSkin
{
   var _enable = true;
   function ChartSkin()
   {
      super();
      this._bgTransForm = new flash.geom.Transform(this.bgMc.barMc);
      this._bgColorTrans = new flash.geom.ColorTransform();
   }
   function __set__maxSize(v)
   {
      this._maxSize = v;
      this.__set__size(this._data.value);
      return this.__get__maxSize();
   }
   function __set__size(v)
   {
      this._size = v / this._maxValue * this._maxSize;
      this.draw();
      return this.__get__size();
   }
   function __set__enable(f)
   {
      this._enable = f;
      this.bgMc._visible = this._enable;
      return this.__get__enable();
   }
   function setStyle(bgStyle, textStyle)
   {
      if(bgStyle != undefined)
      {
         this._bgColorTrans.rgb = bgStyle.color;
         this._bgColorTrans.blueMultiplier = this._bgColorTrans.blueMultiplier + 0.15;
         this._bgColorTrans.redMultiplier = this._bgColorTrans.redMultiplier + 0.15;
         this._bgColorTrans.greenMultiplier = this._bgColorTrans.greenMultiplier + 0.15;
         this._bgTransForm.colorTransform = this._bgColorTrans;
      }
      if(textStyle != undefined)
      {
         this.labelFd.textColor = textStyle.color;
      }
   }
   function update(data)
   {
      this._data = data;
      this._maxValue = this._data.maxValue;
      this.__set__size(this._data.value);
      this.__set__enable(this._data.toggle);
   }
   function remove()
   {
      this.removeMovieClip();
   }
   function toString()
   {
      var _loc2_ = "=====lib.controls.chart.ChartSkin instance ======";
      _loc2_ = _loc2_ + ("\n  name : " + this._name + " _maxvalue : " + this._maxValue + " / _maxSize : " + this._maxSize + " _size : " + this._size);
      return _loc2_;
   }
   function draw()
   {
      if(!this._enable)
      {
         return undefined;
      }
      if(this._size == undefined || this._maxSize == undefined)
      {
         return undefined;
      }
      this.bgMc._visible = this._size != 0;
      this.bgMc._x = - this.bgMc.barMc._width - this.bgMc.barMc._width / 100 * this._size;
      lib.manager.ToolTip.add(this,this._size + "%",1);
      this.selectMc._visible = false;
      this.onRollOver = function()
      {
         this.selectMc._visible = true;
      };
      this.onRollOut = this.onReleaseOutside = function()
      {
         this.selectMc._visible = false;
      };
   }
}
