class g4.util.RadioButtonGroup extends gfx.events.EventDispatcher
{
   static var VALUE_CHANGED = "valueChanged";
   function RadioButtonGroup()
   {
      super();
      this.dataArray = [];
   }
   function add(button, data)
   {
      if(button == null)
      {
         return undefined;
      }
      var _loc2_ = {};
      _loc2_.button = button;
      _loc2_.data = data;
      this.dataArray.push(_loc2_);
      button.onChanged = mx.utils.Delegate.create(this,function(checked)
      {
         if(checked)
         {
            this._setSelectedValue(data,true);
         }
      }
      );
   }
   function setEnabled(value)
   {
      var _loc2_ = undefined;
      var _loc3_ = this.dataArray.length;
      _loc2_ = 0;
      while(_loc2_ < _loc3_)
      {
         (lib.controls.S_CheckBox)this.dataArray[_loc2_].button.setEnabled(value);
         _loc2_ = _loc2_ + 1;
      }
   }
   function getSelectedValue()
   {
      var _loc2_ = undefined;
      var _loc3_ = this.dataArray.length;
      _loc2_ = 0;
      while(_loc2_ < _loc3_)
      {
         if((lib.controls.S_CheckBox)this.dataArray[_loc2_].button.__get__checked())
         {
            return this.dataArray[_loc2_].data;
         }
         _loc2_ = _loc2_ + 1;
      }
      return null;
   }
   function setSelectedValue(value)
   {
      this._setSelectedValue(value,false);
   }
   function _setSelectedValue(value, sendEvent)
   {
      var _loc2_ = undefined;
      var _loc3_ = this.dataArray.length;
      _loc2_ = 0;
      while(_loc2_ < _loc3_)
      {
         (lib.controls.S_CheckBox)this.dataArray[_loc2_].button.__set__checked(this.dataArray[_loc2_].data == value);
         _loc2_ = _loc2_ + 1;
      }
      if(sendEvent)
      {
         this.dispatchEvent({type:g4.util.RadioButtonGroup.VALUE_CHANGED});
      }
   }
}
