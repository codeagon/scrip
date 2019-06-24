class lib.controls.S_CheckBox extends MovieClip
{
   var isToggle = true;
   function S_CheckBox()
   {
      super();
      if(lib.controls.S_CheckBox._group == undefined)
      {
         lib.controls.S_CheckBox._group = {};
      }
      this.__set__checked(false);
      this.recMc.removeMovieClip();
      var _loc3_ = this.getNextHighestDepth();
      this.recMc = this.createEmptyMovieClip("recMc",_loc3_);
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
         getURL("FSCommand:ToGame_PlaySound",1014);
      }
      else
      {
         getURL("FSCommand:ToGame_PlaySound",1015);
      }
      this.onChanged(this.__get__checked());
   }
   static function groupCheck(pgroup, pcheck)
   {
      for(var _loc2_ in lib.controls.S_CheckBox._group[pgroup])
      {
         lib.controls.S_CheckBox._group[pgroup][_loc2_].checked = pcheck;
      }
   }
   function __set__group(pgroup)
   {
      if(this._groupName == pgroup && pgroup != undefined)
      {
         return undefined;
      }
      this._groupName = pgroup;
      if(lib.controls.S_CheckBox._group[pgroup] == undefined)
      {
         lib.controls.S_CheckBox._group[pgroup] = [];
      }
      for(var _loc3_ in lib.controls.S_CheckBox._group[pgroup])
      {
         if(lib.controls.S_CheckBox._group[pgroup][_loc3_] == this)
         {
            return undefined;
         }
      }
      lib.controls.S_CheckBox._group[pgroup].push(this);
      return this.__get__group();
   }
   function __get__group()
   {
      return this._groupName;
   }
   function onChanged(changed)
   {
   }
   function __set__checked(pcheck)
   {
      this._checked = pcheck;
      if(this._checked)
      {
         this.gotoAndStop("check");
      }
      else
      {
         this.gotoAndStop("uncheck");
      }
      return this.__get__checked();
   }
   function __get__checked()
   {
      return this._checked;
   }
   function setEnabled(penabeled)
   {
      this.enabled = penabeled;
      this._alpha = !this.enabled?50:100;
   }
   function setText(textFd)
   {
      var _loc5_ = textFd.textWidth + 30;
      var _loc4_ = textFd.textHeight;
      var _loc2_ = {x:textFd._x,y:textFd._y};
      this.globalToLocal(_loc2_);
      this.createRectangle(_loc2_.x,_loc2_.y,_loc5_,_loc4_);
   }
   function createRectangle(x, y, width, height)
   {
      this.recMc.clear();
      this.recMc.beginFill(0,0);
      this.recMc.moveTo(x,y);
      this.recMc.lineTo(x,height);
      this.recMc.lineTo(width,height);
      this.recMc.lineTo(width,y);
      this.recMc.lineTo(x,y);
   }
}
