class src.union.chart.S1UI_Chart extends MovieClip implements src.union.chart.IChartSkin
{
   var chartObjLibId = "S1UI_ChartObj";
   var lineContainerCount = 0;
   var _maxValue = 0;
   var _valueSpace = 10;
   function S1UI_Chart()
   {
      super();
      this._chartObjects = [];
      this._styles = [];
      this.setSize(this._width);
   }
   function setSize(w)
   {
      this._xscale = 100;
      this._beginingSize = w;
      this.__set__maxSize(w);
      this.bgMc._width = this._beginingSize;
   }
   function __set__maxSize(w)
   {
      this._maxSize = w;
      this.updateObject(w);
      this.createVlaueLine(0,this._maxValue);
      return this.__get__maxSize();
   }
   function updateObject(v)
   {
      var _loc2_ = 0;
      while(_loc2_ < this._chartObjects.length)
      {
         this._chartObjects[_loc2_].maxSize = v;
         _loc2_ = _loc2_ + 1;
      }
   }
   function draw()
   {
      var _loc4_ = (- this._chartObjects.length * this._chartObjects[0]._height) / 2 + this._chartObjects[0]._height / 2;
      var _loc2_ = 0;
      while(_loc2_ < this._chartObjects.length)
      {
         var _loc3_ = this._chartObjects[_loc2_];
         _loc3_._y = _loc4_ + _loc2_ * _loc3_._height;
         _loc2_ = _loc2_ + 1;
      }
   }
   function createVlaueLine(min, max)
   {
      return undefined;
   }
   function add(data, bgStyle)
   {
      this._maxValue = Math.max(this._maxValue,data.__get__maxValue());
      var _loc2_ = 0;
      while(_loc2_ < data.__get__childs().length)
      {
         if(data.__get__childs()[_loc2_].toggle)
         {
            var _loc3_ = this.attachMovie(this.chartObjLibId,"chartObj" + data.__get__childs()[_loc2_].name,this.getNextHighestDepth());
            _loc3_.setStyle(this._styles[_loc2_]);
            _loc3_.maxSize = this._maxSize;
            this._chartObjects.push(_loc3_);
            this.draw();
            data.__get__childs()[_loc2_].addSkin(_loc3_);
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function clear()
   {
      var _loc2_ = 0;
      while(_loc2_ < this._chartObjects.length)
      {
         var _loc3_ = this._chartObjects[_loc2_];
         _loc3_.remove();
         _loc2_ = _loc2_ + 1;
      }
      this._chartObjects = [];
   }
   function setStyle(style)
   {
      this._styles = style;
   }
   function update(data)
   {
      this.clear();
      this.add(data);
   }
}
