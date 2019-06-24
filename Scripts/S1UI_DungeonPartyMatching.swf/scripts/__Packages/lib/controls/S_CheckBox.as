class lib.controls.S_CheckBox extends MovieClip
{
   var txtGap = 5;
   var CHECKBTN_CHECK = lib.manager.UISound.CHECKBTN_CHECK;
   var CHECKBTN_UNCHECK = lib.manager.UISound.CHECKBTN_UNCHECK;
   static var NORMALCOLOR = lib.info.TextColor.CHECKBTN_NORMAL;
   static var OVERCOLOR = lib.info.TextColor.CHECKBTN_OVER;
   static var DISABLECOLOR = lib.info.TextColor.CHECKBTN_DISABLE;
   var _labelName = "";
   var _textFdInstName = "";
   var isToggle = true;
   var _enabled = true;
   function S_CheckBox()
   {
      super();
      this._checked = false;
      this.btnW = this.hit._width;
      this.btnH = this.hit._height;
      if(this._labelName != "" && this._labelName != undefined)
      {
         this.txt.autoSize = "left";
         this.txt.text = this._labelName;
         this._textFd = this.txt;
      }
      else if(this._parent[this._textFdInstName] instanceof TextField)
      {
         this._textFd = (TextField)this._parent[this._textFdInstName];
      }
      this.setText(this._textFd);
   }
   function onRelease()
   {
      if(!this.isToggle && this.__get__checked())
      {
         return undefined;
      }
      this.__set__checked(!this.__get__checked());
      if(this.__get__checked())
      {
         lib.manager.UISound.play(this.CHECKBTN_CHECK);
      }
      else
      {
         lib.manager.UISound.play(this.CHECKBTN_UNCHECK);
      }
      this.onChanged(this.__get__checked());
      this._listener.onChanged(this,this.__get__checked());
   }
   function onRollOver()
   {
      this.setEffect("over");
   }
   function onRollOut()
   {
      this.setEffect("out");
   }
   function onReleaseOutside()
   {
      this.setEffect("out");
   }
   function __set__checked(pcheck)
   {
      var _loc2_ = this._checked;
      this._checked = pcheck;
      if(_loc2_ != pcheck)
      {
         this.setEffect("press");
      }
      this.onChecked(this._checked);
      this._listener.selected(this._checked,this);
      return this.__get__checked();
   }
   function onChanged(changed)
   {
   }
   function onChecked(changed)
   {
   }
   function __get__checked()
   {
      return this._checked;
   }
   function setEnabled(penabeled)
   {
      this._enabled = penabeled;
      if(penabeled)
      {
         this.setEffect("out");
      }
      else
      {
         this.setEffect("disable");
      }
      this.enabled = penabeled;
   }
   function __set__label(_label)
   {
      this._labelName = _label;
      this._textFd.text = this._labelName;
      this.setText(this._textFd);
      return this.__get__label();
   }
   function setText(textFd)
   {
      this._textFd = textFd;
      this._textFd.textColor = lib.controls.S_CheckBox.NORMALCOLOR;
      var _loc3_ = this._textFd.textWidth + this.btnW;
      var _loc2_ = this.btnH;
      var _loc4_ = {x:this.btnW + 5,y:0};
      this.hit._width = _loc3_ + this.txtGap;
      this.hit._height = _loc2_;
   }
   function setEffect(flag)
   {
      this.effectOverMc._visible = this._enabled;
      if(flag == "press")
      {
         if(this.__get__checked())
         {
            this.effectMc.onLoad = function()
            {
               this.gotoAndPlay("check");
            };
            this.effectMc.gotoAndPlay("check");
         }
         else
         {
            this.effectMc.onLoad = function()
            {
               this.gotoAndPlay("uncheck");
            };
            this.effectMc.gotoAndPlay("uncheck");
         }
         if(!this._enabled)
         {
            this.setEffect("disable");
         }
      }
      if(flag == "over")
      {
         this.effectOverMc.gotoAndPlay("over");
      }
      else if(flag == "out")
      {
         this.effectMc._alpha = 100;
         this.effectOverMc.gotoAndPlay("out");
      }
      else if(flag == "disable")
      {
         this._textFd.textColor = lib.controls.S_CheckBox.DISABLECOLOR;
         this.effectMc._alpha = lib.info.TextColor.GENERAL_DISABLE_ALPHA;
      }
   }
   function addListener(obj)
   {
      this._listener = obj;
      var _loc4_ = this;
      if(obj.radioBtns == undefined)
      {
         obj.radioBtns = [];
      }
      this._listener.radioBtns.push(this);
      this._listener.selected = function(checked, obj)
      {
         if(!checked)
         {
            return undefined;
         }
         for(var _loc3_ in this.radioBtns)
         {
            if(this.radioBtns[_loc3_] != obj)
            {
               this.radioBtns[_loc3_].checked = false;
            }
         }
      };
   }
   function removeListener()
   {
      this._listener = undefined;
   }
}
