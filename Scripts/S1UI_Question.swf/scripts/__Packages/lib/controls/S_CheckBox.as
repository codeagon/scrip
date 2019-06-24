class lib.controls.S_CheckBox extends MovieClip
{
   function S_CheckBox()
   {
      super();
      if(lib.controls.S_CheckBox._group == undefined)
      {
         lib.controls.S_CheckBox._group = {};
      }
      this.__set__checked(false);
   }
   function onRelease()
   {
      this.__set__checked(!this.__get__checked());
      if(this.__get__checked())
      {
         getURL("FSCommand:ToGame_PlaySound",1014);
         trace("ToGame_PlaySound  1014");
      }
      else
      {
         getURL("FSCommand:ToGame_PlaySound",1015);
         trace("ToGame_PlaySound  1015");
      }
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
}
