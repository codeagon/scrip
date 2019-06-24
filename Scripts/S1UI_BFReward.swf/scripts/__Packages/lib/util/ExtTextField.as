class lib.util.ExtTextField
{
   var _ischanged = false;
   var _caption = "";
   var _min = 0;
   var _intervals = [];
   var INTERVALSPEED = 400;
   var _useFocus = true;
   function ExtTextField(ptextField, type, focusMC)
   {
      this._type = type;
      this._inerlistner = {};
      this.__set__textField(ptextField);
      if(focusMC != undefined && focusMC instanceof MovieClip)
      {
         this.__set__focusMc(focusMC);
         this.__set__useFocus(true);
      }
      else
      {
         this.__set__focusMc(null);
         this.__set__useFocus(false);
      }
      var _this = this;
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
   function __set__focusMc(mc)
   {
      this._focusMc = mc;
      this._focusMc._visible = false;
      return this.__get__focusMc();
   }
   function __get__focusMc()
   {
      return this._focusMc;
   }
   function __set__useFocus(bTrue)
   {
      this._useFocus = bTrue;
      if(!bTrue)
      {
         this._focusMc._visible = false;
      }
      return this.__get__useFocus();
   }
   function __get__useFocus()
   {
      return this._useFocus;
   }
   function __set__caption(pcaption)
   {
      if(pcaption == undefined || pcaption == "")
      {
         pcaption = "";
         this._caption = pcaption;
         return undefined;
      }
      this._caption = pcaption;
      if(!this._ischanged)
      {
         this._textField.removeListener(this._inerlistner);
         this._textField.text = this._caption;
         this._textField.addListener(this._inerlistner);
         this.__get__textField().textColor = lib.info.TextColor.INPUT_DEFAULT;
      }
      return this.__get__caption();
   }
   function __get__caption()
   {
      return this._caption;
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
      this._textField.ExtTextField = this;
      this._textField.addListener(this._inerlistner);
      var _this = this;
      if(this._type == 0)
      {
         this._textField.onSetFocus = function(focus)
         {
            _global.inputing = true;
            _this.onSetFocusNormal(focus);
            if(_this.useFocus)
            {
               focus = _this.focusMc;
               focus._visible = true;
               focus.gotoAndPlay(2);
               lib.manager.Focus.setFocusGroup(this);
            }
         };
         this._textField.onKillFocus = function(focus)
         {
            _global.inputing = false;
            _this.onKillFocusNormal(focus);
            if(_this.useFocus)
            {
               focus = _this.focusMc;
               focus._visible = false;
               focus.gotoAndStop(1);
            }
            lib.manager.Focus.stop();
         };
      }
      else if(this._type == 1)
      {
         this._textField.onSetFocus = function(focus)
         {
            _global.inputing = true;
            _this.onSetFocusNumber(focus);
            if(_this.useFocus)
            {
               focus = _this.focusMc;
               focus._visible = true;
               focus.gotoAndPlay(2);
               lib.manager.Focus.setFocusGroup(this);
            }
         };
         this._textField.onKillFocus = function(focus)
         {
            _global.inputing = false;
            _this.onKillFocusNumber(focus);
            if(_this.useFocus)
            {
               focus = _this.focusMc;
               focus._visible = false;
               focus.gotoAndStop(1);
            }
            lib.manager.Focus.stop();
         };
      }
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
      this._textField.addListener(plistner);
   }
   function removeListener(plistner)
   {
      this._textField.removeListener(plistner);
   }
   function onChangedGenal(textFd)
   {
      var _loc2_ = lib.util.ExtString.trim(textFd.text);
      if(_loc2_ == "" || _loc2_ == undefined)
      {
         textFd.text = "";
      }
      this.__get__textField().textColor = lib.info.TextColor.INPUT_ACTIVE;
      this.setChanged(_loc2_ != "" && this._tempText != _loc2_ && this._caption != _loc2_);
   }
   function onChangedNumber(textFd)
   {
      this.clearInputInterval(this._intervals);
      var _loc2_ = String(Number(lib.util.ExtString.trimChar(textFd.text)));
      if(isNaN(_loc2_))
      {
         _loc2_ = "";
         textFd.text = _loc2_;
         this._intervals.push(setInterval(this,"checkInterval",this.INTERVALSPEED,String(this.__get__min())));
      }
      else if(Number(_loc2_) > this.__get__max())
      {
         textFd.text = String(this.__get__max());
      }
      else if(Number(_loc2_) < this.__get__min())
      {
         textFd.text = String(_loc2_);
         this._intervals.push(setInterval(this,"checkInterval",this.INTERVALSPEED,String(this.__get__min())));
      }
      else
      {
         textFd.text = _loc2_;
      }
      _loc2_ = textFd.text;
      this.setChanged(_loc2_ != "" && Number(this.__get__text()) >= this.__get__min());
   }
   function checkInterval(str)
   {
      var _loc2_ = this._intervals.shift();
      while(_loc2_ != undefined)
      {
         clearInterval(_loc2_);
         _loc2_ = this._intervals.shift();
      }
      this.__get__textField().text = str;
      this.setChanged(true);
      Selection.setSelection(0,str.length);
   }
   function clearInputInterval(_intervals)
   {
      var _loc1_ = _intervals.shift();
      while(_loc1_ != undefined)
      {
         clearInterval(_loc1_);
         _loc1_ = _intervals.shift();
      }
   }
   function onChangedEn(textFd)
   {
      var _loc1_ = String(Number(lib.util.ExtString.trimChar(textFd.text)));
   }
   function onChangedKr(textFd)
   {
   }
   function onSetFocusNumber(oldF)
   {
      if(this.__get__text() == this._caption)
      {
         this._tempText = "";
      }
      else
      {
         this._tempText = this.text;
      }
      if(this.__get__text() < this.__get__min())
      {
         this.__set__text(this.min);
      }
      Selection.setSelection(0,this._textField.text.length);
      this.onSetFocusEvent(this._textField);
   }
   function onSetFocusNormal(oldF)
   {
      if(this.__get__text() == this._caption)
      {
         this._tempText = "";
      }
      else
      {
         this._tempText = this.text;
      }
      Selection.setSelection(0,this._textField.text.length);
      this.onSetFocusEvent(this._textField);
   }
   function onKillFocusNumber(newF)
   {
      this.clearInputInterval(this._intervals);
      var _loc2_ = this._textField.text;
      if(Number(_loc2_) > this.__get__max())
      {
         this.__set__text(String(this.__get__max()));
      }
      else if(Number(_loc2_) < this.__get__min() || _loc2_ == "")
      {
         this.__set__text(String(this.__get__min()));
      }
      if(this._type != 1)
      {
         this.__set__caption(this._caption);
      }
      this.onKillFocusEvent(this._textField);
   }
   function onKillFocusNormal(newF)
   {
      var _loc2_ = this._textField.text;
      if(this._type != 1)
      {
         this.__set__caption(this._caption);
      }
      this.onKillFocusEvent(this._textField);
   }
   function onSetFocusEvent()
   {
   }
   function onKillFocusEvent()
   {
   }
   function onEnterKey()
   {
   }
}
