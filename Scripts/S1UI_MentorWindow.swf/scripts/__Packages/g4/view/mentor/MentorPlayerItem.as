class g4.view.mentor.MentorPlayerItem extends gfx.core.UIComponent
{
   function MentorPlayerItem()
   {
      super();
   }
   function onLoad()
   {
      this.cover.onRollOver = g4.util.Delegate.create(this,this.coverHandlerOver);
      this.cover.onRollOut = g4.util.Delegate.create(this,this.coverHandlerOut);
      this.cover.onPress = g4.util.Delegate.create(this,this.coverHandlerPress);
      this.cover.onRelease = g4.util.Delegate.create(this,this.coverHandlerRelease);
      this.cover.onReleaseOutside = g4.util.Delegate.create(this,this.coverHandlerOut);
   }
   function coverHandlerOver()
   {
      this.setState("over");
   }
   function coverHandlerOut()
   {
      this.setState("up");
   }
   function coverHandlerPress()
   {
      this.setState("down");
   }
   function coverHandlerRelease()
   {
      this.__set__selected(!this._selected);
      this.dispatchEvent({type:gfx.events.EventTypes.CHANGE,accountName:this._accountName});
   }
   function setData($data, $type)
   {
      var _loc2_ = lib.util.ExtString.split($data,"\t");
      this._accountName = _loc2_[0];
      this.textField.text = this._accountName;
      this.__set__selected(true);
      this.mMark.gotoAndStop(Number(_loc2_[1]) + 1);
      if($type == 0)
      {
         this.cover._width = 444;
         this.mCheck._x = 420;
         this.textField._width = 382;
      }
      else if($type == 1)
      {
         this.cover._width = 220;
         this.mCheck._x = 193;
         this.textField._width = 162;
      }
      lib.manager.ToolTip.remove(this.cover);
      if(this.textField._width < this.textField.textWidth + 4)
      {
         var _loc3_ = this.textField.getCharIndexAtPoint(this.textField._width - 10,10);
         lib.manager.ToolTip.add(this.cover,this._accountName,1);
         this.textField.text = this._accountName.substr(0,_loc3_) + "...";
      }
   }
   function getAccountName()
   {
      return this._accountName;
   }
   function __get__selected()
   {
      return this._selected;
   }
   function __set__selected(value)
   {
      this._selected = value;
      this.setState("up");
      return this.__get__selected();
   }
   function resetData()
   {
      this._accountName = "";
      this.__set__selected(true);
   }
   function setState($state)
   {
      var _loc2_ = "";
      if(this._selected)
      {
         _loc2_ = "selected_";
      }
      _loc2_ = _loc2_ + $state;
      this.mCheck.gotoAndPlay(_loc2_);
   }
}
