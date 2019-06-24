class lib.util.ExtTextField
{
   var _ischanged = false;
   var _caption = "";
   var _min = 0;
   function ExtTextField(ptextField, type)
   {
      this._inerlistner = {};
      this.__set__textField(ptextField);
      var _this = this;
      this._type = type;
      switch(this._type)
      {
         case 0:
            this._inerlistner.onChanged = function(textFd)
            {
               _this.onChangedGenal(textFd);
            };
            break;
         case 1:
            this._inerlistner.onChanged = function(textFd)
            {
               _this.onChangedNumber(textFd);
            };
            break;
         case 2:
            this._inerlistner.onChanged = function(textFd)
            {
               _this.onChangedEn(textFd);
            };
            break;
         case 3:
            this._inerlistner.onChanged = function(textFd)
            {
               _this.onChangedKr(textFd);
            };
      }
   }
   function __set__caption(pcaption)
   {
      if(pcaption == undefined)
      {
         pcaption = "";
      }
      this._caption = pcaption;
      if(!this._ischanged)
      {
         this.__set__text(this._caption);
         trace("caption  ");
         this.__get__textField().textColor = lib.info.TextColor.INPUT_DEFAULT;
      }
      return this.__get__caption();
   }
   function __set__maxschar(pmaxschar)
   {
      this._textField.maxChars = pmaxschar;
      return this.__get__maxschar();
   }
   function __set__id(pid)
   {
      this._id = pid;
      return this.__get__id();
   }
   function __get__id()
   {
      return this._id;
   }
   function __set__text(str)
   {
      this.__get__textField().textColor = lib.info.TextColor.INPUT_ACTIVE;
      this._textField.text = str;
      this.setChanged(true);
      return this.__get__text();
   }
   function __get__text()
   {
      return this._textField.text;
   }
   function __get__textField()
   {
      return this._textField;
   }
   function __set__textField(ptextField)
   {
      this._textField = ptextField;
      this._textField.addListener(this._inerlistner);
      var _this = this;
      this._textField.onSetFocus = function(focus)
      {
         _this.onSetFocus(focus);
      };
      this._textField.onKillFocus = function(focus)
      {
         _this.onKillFocus(focus);
      };
      return this.__get__textField();
   }
   function __set__min(pmin)
   {
      this._min = pmin;
      return this.__get__min();
   }
   function __get__min()
   {
      return this._min;
   }
   function __set__max(pmax)
   {
      this._max = pmax;
      return this.__get__max();
   }
   function __get__max()
   {
      return this._max;
   }
   function __get__changed()
   {
      return this._ischanged;
   }
   function setChanged(pchanged)
   {
      this._ischanged = pchanged;
      this.__get__textField().textColor = lib.info.TextColor.INPUT_ACTIVE;
      this.onChanged(this._ischanged);
   }
   function addListener(plistner)
   {
      this._textField.addListener(this._listner);
   }
   function removeListener(plistner)
   {
      this._textField.removeListener(this._listner);
   }
   function onChangedGenal(textFd)
   {
      var _loc2_ = lib.util.ExtString.trim(textFd.text);
      if(_loc2_ == "" || _loc2_ == undefined)
      {
         textFd.text = "";
      }
      this.__get__textField().textColor = lib.info.TextColor.INPUT_ACTIVE;
      this.setChanged(_loc2_ != "" && this._tempText != _loc2_);
   }
   function onChangedNumber(textFd)
   {
      var _loc3_ = String(Number(lib.util.ExtString.trimChar(textFd.text)));
      if(_loc3_ == "NaN")
      {
         _loc3_ = "";
      }
      textFd.text = _loc3_;
      if(Number(this.__get__text()) > this.__get__max())
      {
         textFd.text = String(this.__get__max());
      }
      if(Number(this.__get__text()) < this.__get__min())
      {
         textFd.text = String(this.__get__min());
      }
      _loc3_ = textFd.text;
      this.setChanged(_loc3_ != "" && Number(this.__get__text()) >= this.__get__min());
   }
   function onChangedEn(textFd)
   {
      var _loc1_ = String(Number(lib.util.ExtString.trimChar(textFd.text)));
   }
   function onChangedKr(textFd)
   {
   }
   function onSetFocus(oldF)
   {
      _global.inputing = true;
      if(this.__get__text() == this._caption)
      {
         this._tempText = "";
      }
      else
      {
         this._tempText = this.text;
      }
      if(this._type == 1)
      {
         if(this.__get__text() < this.__get__min())
         {
            this.__set__text(this.min);
         }
      }
      Selection.setSelection(0,this._textField.text.length);
   }
   function onKillFocus(newF)
   {
      _global.inputing = false;
      if(this._type != 1)
      {
         this.__set__caption(this._caption);
      }
      if(newF != undefined)
      {
         Selection.setFocus(null);
      }
   }
}
