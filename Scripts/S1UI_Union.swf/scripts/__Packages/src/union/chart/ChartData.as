class src.union.chart.ChartData
{
   var hasChild = false;
   var length = 0;
   function ChartData(id, name, value, maxValue)
   {
      this._childs = [];
      this._id = id;
      this._name = name;
      this._value = value;
      this._maxValue = maxValue;
      this.__set__parent(arguments[4]);
      this.addSkin(arguments[5]);
   }
   function __get__childs()
   {
      return this._childs;
   }
   function __get__id()
   {
      return this._id;
   }
   function __get__name()
   {
      return this._name;
   }
   function __get__value()
   {
      return this._value;
   }
   function __get__maxValue()
   {
      return this._maxValue;
   }
   function __get__skin()
   {
      return this._skin;
   }
   function __get__toggle()
   {
      return this._toggle;
   }
   function __set__value(v)
   {
      this._value = v;
      this.update();
      return this.__get__value();
   }
   function __set__maxValue(v)
   {
      this._maxValue = v;
      this.update();
      return this.__get__maxValue();
   }
   function __set__toggle(v)
   {
      this._toggle = v;
      if(this._parent == undefined)
      {
         this.update();
      }
      else
      {
         this._parent.update();
      }
      return this.__get__toggle();
   }
   function __set__parent(p)
   {
      if(!(p instanceof src.union.chart.ChartData) || p == this._parent)
      {
         return undefined;
      }
      this._parent = p;
      this._parent.add(this);
      return this.__get__parent();
   }
   function add(_chartData)
   {
      _chartData.__set__parent(this);
      var _loc3_ = this.getChild(_chartData.__get__id());
      this.removeChild(_chartData.__get__id());
      this._childs.push(_chartData);
      this.length = this._childs.length;
      this.hasChild = this.length > 0;
      this.update();
   }
   function getChild(id)
   {
      for(var _loc3_ in this._childs)
      {
         if(this._childs[_loc3_].id == id)
         {
            return this._childs[_loc3_];
         }
      }
      return undefined;
   }
   function removeChild(id)
   {
      if(id == undefined)
      {
         return undefined;
      }
      var _loc2_ = 0;
      while(_loc2_ < this.length)
      {
         if(this._childs[_loc2_].id == id)
         {
            this._childs.splice(_loc2_,1);
            this.length = this._childs.length;
            this.hasChild = this.length > 0;
            this.update();
            return undefined;
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function addSkin(chartObj)
   {
      if(chartObj == undefined)
      {
         return undefined;
      }
      this._skin = chartObj;
      this.update();
   }
   function removeSkin()
   {
      if(this._skin == undefined)
      {
         return undefined;
      }
      this._skin.removeData(this);
      this.update();
      this._skin = undefined;
   }
   function update()
   {
      lib.Debuger.trace("\t _id :" + this._id + " / _name :" + this._name + " / _value :" + this._value + "/ _skin _name :" + this._skin._name + " / length : " + this.length);
      if(this._skin != undefined)
      {
         this._skin.update(this);
      }
      var _loc2_ = 0;
      while(_loc2_ < this.length)
      {
         this._childs[_loc2_].update();
         _loc2_ = _loc2_ + 1;
      }
   }
   function toString()
   {
      var _loc2_ = "  =============== lib.controls.chart.ChartData instance =========";
      _loc2_ = _loc2_ + ("\n\t_id :" + this._id);
      _loc2_ = _loc2_ + ("\n\t_name :" + this._name);
      _loc2_ = _loc2_ + ("\n\t_value :" + this._value);
      _loc2_ = _loc2_ + ("\n\t_skin _name :" + this._skin._name);
      _loc2_ = _loc2_ + ("\n\t_childs.length :" + this.length);
      _loc2_ = _loc2_ + ("\n\t_parent :" + this._parent.__get__id() + "/" + this._parent.__get__name() + "/" + this._parent.__get__value() + "/" + this._parent._skin._name);
      _loc2_ = _loc2_ + "\n  ===============================================================";
      return _loc2_;
   }
}
