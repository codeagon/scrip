class g4.view.chat.ChatChannel extends g4.core.SimpleView
{
   var dropdownListOpened = false;
   var dropdownCount = 0;
   var dropdownHeight = 0;
   function ChatChannel(targetMovieClip)
   {
      super(targetMovieClip);
      this.configUI();
   }
   function configUI()
   {
      this.text_selected_channel = this.__get__targetMovieClip().text_selected;
      this.mc_hit_area = this.__get__targetMovieClip().mc_hit_area;
      this.mc_over = this.__get__targetMovieClip().mc_over;
      this.mc_arrow = this.__get__targetMovieClip().mc_arrow;
      this.mc_mask = this.__get__targetMovieClip().mc_list.mc_mask;
      this.mc_container = this.__get__targetMovieClip().mc_list.mc_container;
      this.mc_dropdown_bg = this.mc_container.mc_bg;
      this.text_selected_channel.verticalAlign = "center";
      this.text_selected_channel.textAutoSize = "shrink";
      g4.util.UIUtil.setMouseEnabled(this.text_selected_channel,false);
      g4.util.UIUtil.setTextFieldStyle(this.text_selected_channel,g4.util.UIUtil.TEXT_FIELD_STYLE_1);
      g4.util.UIUtil.setMouseEnabled(this.mc_over,false);
      this.configDropdown();
      this.updateByDropdownState();
      this.updateByInputChannelData();
      g4.model.GameModel.addEventListener(g4.view.ViewID.CHAT_2,g4.model.GameModelEventType.CHAT_INPUT_CHANNEL_DATA_CHANGE,this,"model_chatInputChannelDataChangeHandler");
      g4.model.GameModel.addEventListener(g4.view.ViewID.CHAT_2,g4.model.GameModelEventType.CHAT_INPUT_CHANNEL_DATA_UPDATE,this,"model_chatInputChannelDataUpdateHandler");
      g4.model.GameModel.addEventListener(g4.view.ViewID.CHAT_2,g4.model.GameModelEventType.CHAT_CHANNEL_DATA_CHANGE,this,"model_chatChannelDataChangeHandler");
      g4.model.GameModel.addEventListener(g4.view.ViewID.CHAT_2,g4.model.GameModelEventType.CHAT_SELECTED_CHANNEL_CHANGE,this,"model_chatSelectedChannelChangeHandler");
   }
   function configDropdown()
   {
      this.dropdownListItemArray = [];
      this.mc_dropdown_container = this.mc_container.createEmptyMovieClip("mc_dropdown_container",this.mc_container.getNextHighestDepth());
      this.mc_over._visible = false;
      this.mc_hit_area.onRollOver = gfx.utils.Delegate.create(this,function()
      {
         this.mc_over._visible = true;
      }
      );
      this.mc_hit_area.onRollOut = this.mc_hit_area.onReleaseOutside = gfx.utils.Delegate.create(this,function()
      {
         this.mc_over._visible = false;
      }
      );
      this.mc_hit_area.onPress = gfx.utils.Delegate.create(this,function()
      {
         if(this.dropdownListOpened)
         {
            this.closeDropdownList();
         }
         else
         {
            this.openDropdownList();
         }
      }
      );
   }
   function openDropdownList()
   {
      if(this.dropdownListOpened)
      {
         return undefined;
      }
      if(this.dropdownCount == 0)
      {
         return undefined;
      }
      this.dropdownListOpened = true;
      this.moveTo(this.mc_container,- this.dropdownHeight,true);
      this.updateByDropdownState();
   }
   function closeDropdownList()
   {
      this._closeDropdownList(true);
   }
   function _closeDropdownList(useTween)
   {
      if(!this.dropdownListOpened)
      {
         return undefined;
      }
      this.dropdownListOpened = false;
      this.moveTo(this.mc_container,0,useTween);
      this.updateByDropdownState();
   }
   function initDropdownList()
   {
      this._closeDropdownList(false);
      var _loc2_ = undefined;
      var _loc3_ = this.dropdownListItemArray.length;
      _loc2_ = 0;
      while(_loc2_ < _loc3_)
      {
         (MovieClip)this.dropdownListItemArray[_loc2_]._visible = false;
         _loc2_ = _loc2_ + 1;
      }
      this.dropdownCount = 0;
   }
   function moveTo(mc, yTo, useTween)
   {
      gs.TweenLite.killTweensOf(mc,false);
      if(useTween)
      {
         gs.TweenLite.to(mc,0.3,{_y:yTo,ease:gs.easing.Cubic.easeOut});
      }
      else
      {
         mc._y = yTo;
      }
   }
   function updateByDropdownState()
   {
      if(this.dropdownListOpened)
      {
         this.mc_arrow.gotoAndStop(2);
      }
      else
      {
         this.mc_arrow.gotoAndStop(1);
      }
   }
   function getDropdownItemAt(index)
   {
      if(index < 0 || index > this.dropdownListItemArray.length - 1)
      {
         return null;
      }
      return this.dropdownListItemArray[index];
   }
   function cleanUpScreen()
   {
      this.initDropdownList();
      this.text_selected_channel.text = "";
   }
   function updateByInputChannelData()
   {
      this.cleanUpScreen();
      if(g4.model.GameModel.chatModel.__get__inputChannelDataCount() == 0)
      {
         return undefined;
      }
      this.dropdownCount = g4.model.GameModel.chatModel.inputChannelDataCount;
      var _loc3_ = undefined;
      var _loc4_ = undefined;
      var _loc2_ = undefined;
      var _loc5_ = this.dropdownCount;
      _loc2_ = 0;
      while(_loc2_ < _loc5_)
      {
         if(_loc2_ < this.dropdownListItemArray.length)
         {
            _loc3_ = this.dropdownListItemArray[_loc2_];
         }
         else
         {
            _loc3_ = this.mc_dropdown_container.attachMovie("$Chat2.DropdownListItem","mc_list_item_" + this.dropdownListItemArray.length,this.mc_dropdown_container.getNextHighestDepth());
            this.dropdownListItemArray.push(_loc3_);
            _loc3_._y = g4.view.chat.ChatConstants.DROPDOWN_LIST_ITEM_HEIGHT * _loc2_;
         }
         _loc4_ = g4.model.GameModel.chatModel.getInputChannelDataAt(_loc2_);
         this.configDropdownItem(_loc3_,_loc4_);
         _loc3_._visible = true;
         _loc2_ = _loc2_ + 1;
      }
      this.dropdownHeight = g4.view.chat.ChatConstants.DROPDOWN_LIST_ITEM_HEIGHT * this.dropdownCount;
      this.mc_mask._width = g4.view.chat.ChatConstants.DROPDOWN_LIST_ITEM_WIDTH;
      this.mc_mask._height = this.dropdownHeight;
      this.mc_mask._x = 0;
      this.mc_mask._y = - this.dropdownHeight;
      this.mc_dropdown_bg._height = this.dropdownHeight;
      this.updateBySelectedChannelID();
      this.updateDropdownColor();
   }
   function configDropdownItem(mc, data)
   {
      var _loc3_ = g4.model.GameModel.chatModel.getChatChannelData(data.id);
      mc.mc_over._visible = false;
      mc.$id = data.id;
      mc.textField.text = data.nameForDropdown;
      mc.textField.textAutoSize = "shrink";
      mc.textField.textColor = _loc3_.color;
      g4.util.UIUtil.setTextFieldStyle(mc.textField,g4.util.UIUtil.TEXT_FIELD_STYLE_1);
      mc.onRollOver = gfx.utils.Delegate.create(this,function()
      {
         mc.mc_over._visible = true;
      }
      );
      mc.onRollOut = mc.onReleaseOutside = gfx.utils.Delegate.create(this,function()
      {
         mc.mc_over._visible = false;
      }
      );
      mc.onRelease = gfx.utils.Delegate.create(this,function()
      {
         this.closeDropdownList();
         g4.model.GameModel.chatModel.changeChannel(mc.$id);
      }
      );
   }
   function updateDropdownColor()
   {
      if(g4.model.GameModel.chatModel.__get__inputChannelDataCount() == 0)
      {
         return undefined;
      }
      var _loc2_ = undefined;
      var _loc4_ = undefined;
      var _loc3_ = undefined;
      var _loc5_ = g4.model.GameModel.chatModel.__get__inputChannelDataCount();
      _loc3_ = 0;
      while(_loc3_ < _loc5_)
      {
         _loc2_ = this.getDropdownItemAt(_loc3_);
         if(_loc2_ != null)
         {
            _loc4_ = g4.model.GameModel.chatModel.getChatChannelData(_loc2_.$id);
            _loc2_.textField.textColor = _loc4_.color;
         }
         _loc3_ = _loc3_ + 1;
      }
   }
   function updateByChannelListDataUpdate(channelID)
   {
      var _loc2_ = undefined;
      var _loc3_ = undefined;
      var _loc6_ = g4.model.GameModel.chatModel.__get__inputChannelDataCount();
      _loc3_ = 0;
      while(_loc3_ < _loc6_)
      {
         _loc2_ = this.getDropdownItemAt(_loc3_);
         if(_loc2_ != null && _loc2_.$id == channelID)
         {
            var _loc4_ = g4.model.GameModel.chatModel.getInputChannelData(channelID);
            _loc2_.textField.text = _loc4_.nameForDropdown;
            return undefined;
         }
         _loc3_ = _loc3_ + 1;
      }
   }
   function updateBySelectedChannelID()
   {
      this.closeDropdownList();
      this.updateSelectedChannelText();
      this.updateSelectedChannelColor();
   }
   function updateSelectedChannelText()
   {
      var _loc2_ = g4.model.GameModel.chatModel.getInputChannelData(g4.model.GameModel.chatModel.__get__selectedChannelID());
      if(_loc2_ == null)
      {
         this.text_selected_channel.text = "";
      }
      else
      {
         this.text_selected_channel.text = _loc2_.name;
      }
   }
   function updateSelectedChannelColor()
   {
      var _loc2_ = g4.model.GameModel.chatModel.getChatChannelData(g4.model.GameModel.chatModel.__get__selectedChannelID());
      this.text_selected_channel.textColor = _loc2_.color;
   }
   function model_chatInputChannelDataChangeHandler(event)
   {
      this.updateByInputChannelData();
   }
   function model_chatInputChannelDataUpdateHandler(event)
   {
      this.updateByChannelListDataUpdate(event.data.channelID);
   }
   function model_chatChannelDataChangeHandler(event)
   {
      this.updateDropdownColor();
      this.updateSelectedChannelColor();
   }
   function model_chatSelectedChannelChangeHandler(event)
   {
      this.updateBySelectedChannelID();
   }
}
