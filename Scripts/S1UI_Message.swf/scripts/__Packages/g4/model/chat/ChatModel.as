class g4.model.chat.ChatModel extends g4.model.Model
{
   var MAIN_TAB_ALPHA = 45;
   var whisperChatChannelID = -1;
   var _selectedChannelID = 0;
   var _selectedMainChatTabID = g4.model.GameConstants.CHAT_MAIN_CHAT_DEFAULT_TAB_ID;
   var _draggingTabID = -1;
   var _resizingTabID = -1;
   var _locked = false;
   var _language = g4.model.GameConstants.CHAT_LANGUAGE_TYPE_ENGLISH;
   var _chatMode = g4.model.GameConstants.CHAT_MODE_COLLAPSED;
   function ChatModel()
   {
      super();
      this.modelCallbacks = new g4.model.chat.ChatModelCallbacks();
      this.modelCalls = new g4.model.chat.ChatModelCalls();
      this._removeAllTabs();
      this.chatChannelDataMap = {};
      this.inputChannelDataArray = [];
      this.inputChannelDataMap = {};
      this.recentWhisperTargetArray = [];
      g4.model.chat.ChatUtil.initialize();
   }
   function __get__selectedChannelID()
   {
      return this._selectedChannelID;
   }
   function __set__selectedChannelID(value)
   {
      if(value == this._selectedChannelID)
      {
         return undefined;
      }
      this._selectedChannelID = value;
      this.sendEvent(g4.model.GameModelEventType.CHAT_SELECTED_CHANNEL_CHANGE);
      return this.__get__selectedChannelID();
   }
   function __get__whisperTarget()
   {
      return this._whisperTarget;
   }
   function __set__whisperTarget(value)
   {
      if(value == this._whisperTarget)
      {
         return undefined;
      }
      this._whisperTarget = value;
      this.sendEvent(g4.model.GameModelEventType.CHAT_WHISPER_TARGET_CHANGE);
      return this.__get__whisperTarget();
   }
   function __get__isWhisperMode()
   {
      return this._selectedChannelID == this.whisperChatChannelID;
   }
   function __get__inputChannelDataCount()
   {
      return this.inputChannelDataArray.length;
   }
   function __get__selectedMainChatTabID()
   {
      return this._selectedMainChatTabID;
   }
   function __set__selectedMainChatTabID(value)
   {
      if(value == this._selectedMainChatTabID)
      {
         return undefined;
      }
      this._selectedMainChatTabID = value;
      var _loc2_ = g4.util.ArrayUtil.indexOf(this.mainChatTabIDArray,this._selectedMainChatTabID);
      this.modelCalls.ToGame_Chat_TabChanged(_loc2_);
      this.sendEvent(g4.model.GameModelEventType.CHAT_SELECTED_MAIN_TAB_CHANGE);
      return this.__get__selectedMainChatTabID();
   }
   function __get__draggingTabID()
   {
      return this._draggingTabID;
   }
   function __get__resizingTabID()
   {
      return this._resizingTabID;
   }
   function __get__chatTabCount()
   {
      return this.chatTabDataArray.length;
   }
   function __get__mainChatTabCount()
   {
      return this.mainChatTabIDArray.length;
   }
   function __get__locked()
   {
      return this._locked;
   }
   function __get__language()
   {
      return this._language;
   }
   function __get__punishment()
   {
      return this._punishment;
   }
   function __get__chatMode()
   {
      return this._chatMode;
   }
   function setInputFocus(focus)
   {
      var _loc2_ = {};
      _loc2_.focus = focus;
      this.sendEvent(g4.model.GameModelEventType.CHAT_INPUT_FOCUS,_loc2_);
   }
   function removeTab(tabID)
   {
      if(tabID == g4.model.GameConstants.CHAT_MAIN_CHAT_DEFAULT_TAB_ID)
      {
         return undefined;
      }
      if(!this.isExistTab(tabID))
      {
         return undefined;
      }
      g4.util.ArrayUtil.removeElement(this.chatTabDataArray,function(chatTabData)
      {
         return chatTabData.id == tabID;
      }
      );
      delete this.chatTabDataMap.tabID;
      this.removeMainChatTab(tabID);
      if(tabID == this.__get__selectedMainChatTabID())
      {
         this.__set__selectedMainChatTabID(g4.model.GameConstants.CHAT_MAIN_CHAT_DEFAULT_TAB_ID);
      }
      var _loc2_ = {};
      _loc2_.tabID = tabID;
      this.sendEvent(g4.model.GameModelEventType.CHAT_TAB_REMOVE,_loc2_);
      this.modelCalls.ToGame_Chat_RemoveTab(tabID);
   }
   function removeAllTabs()
   {
      this._removeAllTabs();
      this.sendEvent(g4.model.GameModelEventType.CHAT_TAB_ALL_REMOVE);
   }
   function _removeAllTabs()
   {
      this.chatTabDataArray = [];
      this.chatTabDataMap = {};
      this.mainChatTabIDArray = [];
   }
   function isExistTab(tabID)
   {
      return this.chatTabDataMap[tabID] != null;
   }
   function getChatTabData(tabID)
   {
      return this.chatTabDataMap[tabID];
   }
   function getChatChannelData(channelID)
   {
      return this.chatChannelDataMap[channelID];
   }
   function getChatColorByChannel(channelID)
   {
      var _loc2_ = this.getChatChannelData(channelID);
      if(_loc2_ == null)
      {
         return 16777215;
      }
      return _loc2_.color;
   }
   function getWhisperChatChannelData()
   {
      if(this.whisperChatChannelID == -1)
      {
         return null;
      }
      return this.getChatChannelData(this.whisperChatChannelID);
   }
   function getInputChannelData(channelID)
   {
      return this.inputChannelDataMap[channelID];
   }
   function getInputChannelDataAt(index)
   {
      return this.inputChannelDataArray[index];
   }
   function saveChatTabPosition(tabID, x, y)
   {
      var _loc3_ = this.getChatTabData(tabID);
      if(_loc3_.type == g4.model.GameConstants.CHAT_TAB_TYPE_MAIN)
      {
         var _loc2_ = undefined;
         var _loc4_ = this.__get__mainChatTabCount();
         _loc2_ = 0;
         while(_loc2_ < _loc4_)
         {
            _loc3_ = this.getChatTabData(this.getMainChatTabIDAt(_loc2_));
            _loc3_.x = x;
            _loc3_.y = y;
            _loc2_ = _loc2_ + 1;
         }
      }
      else
      {
         _loc3_.x = x;
         _loc3_.y = y;
      }
   }
   function saveChatTabPositionAndSize(tabID, x, y, w, h)
   {
      var _loc2_ = this.getChatTabData(tabID);
      if(_loc2_.type == g4.model.GameConstants.CHAT_TAB_TYPE_MAIN)
      {
         var _loc3_ = undefined;
         var _loc4_ = this.__get__mainChatTabCount();
         _loc3_ = 0;
         while(_loc3_ < _loc4_)
         {
            _loc2_ = this.getChatTabData(this.getMainChatTabIDAt(_loc3_));
            _loc2_.x = x;
            _loc2_.y = y;
            _loc2_.width = w;
            _loc2_.height = h;
            _loc3_ = _loc3_ + 1;
         }
      }
      else
      {
         _loc2_.x = x;
         _loc2_.y = y;
         _loc2_.width = w;
         _loc2_.height = h;
      }
   }
   function saveChatTabInfo()
   {
      this.modelCalls.ToGame_Chat_StartSaveTabInfo();
      var _loc3_ = this.chatTabDataArray.concat();
      var _loc5_ = this.mainChatTabIDArray.length - 1;
      while(_loc5_ >= 0)
      {
         var _loc6_ = this.mainChatTabIDArray[_loc5_];
         var _loc2_ = 0;
         while(_loc2_ < _loc3_.length)
         {
            var _loc4_ = _loc3_[_loc2_];
            if(_loc4_.id == _loc6_)
            {
               _loc3_.unshift(_loc3_.splice(_loc2_,1)[0]);
            }
            _loc2_ = _loc2_ + 1;
         }
         _loc5_ = _loc5_ - 1;
      }
      _loc5_ = 0;
      while(_loc5_ < _loc3_.length)
      {
         _loc4_ = _loc3_[_loc5_];
         this.modelCalls.ToGame_Chat_SaveTabInfo(_loc4_.id,_loc4_.x,_loc4_.y,_loc4_.width,_loc4_.height,_loc4_.type);
         _loc5_ = _loc5_ + 1;
      }
      this.modelCalls.ToGame_Chat_EndSaveTabInfo();
   }
   function addWhisperID(userID)
   {
      g4.util.ArrayUtil.removeElement(this.recentWhisperTargetArray,userID);
      this.recentWhisperTargetArray.unshift(userID);
      if(this.recentWhisperTargetArray.length > 10)
      {
         this.recentWhisperTargetArray.pop();
      }
   }
   function rotateWhisperTarget(bNext)
   {
      if(this.recentWhisperTargetArray.length <= 1)
      {
         return undefined;
      }
      if(bNext)
      {
         this.recentWhisperTargetArray.push(this.recentWhisperTargetArray.shift());
         this.__set__whisperTarget(this.recentWhisperTargetArray[0]);
      }
      else
      {
         this.recentWhisperTargetArray.unshift(this.recentWhisperTargetArray.pop());
         this.__set__whisperTarget(this.recentWhisperTargetArray[0]);
      }
   }
   function overwriteByMainChatProps(chatTabData)
   {
      this.cloneChatProps(this.getChatTabData(g4.model.GameConstants.CHAT_MAIN_CHAT_DEFAULT_TAB_ID),chatTabData);
   }
   function overwriteByMainChatPropsAll()
   {
      var _loc4_ = this.getChatTabData(g4.model.GameConstants.CHAT_MAIN_CHAT_DEFAULT_TAB_ID);
      if(_loc4_ == null)
      {
         return undefined;
      }
      var _loc3_ = undefined;
      var _loc2_ = undefined;
      var _loc5_ = this.__get__mainChatTabCount();
      _loc2_ = 0;
      while(_loc2_ < _loc5_)
      {
         _loc3_ = this.getChatTabData(this.getMainChatTabIDAt(_loc2_));
         if(_loc3_.id != _loc4_.id)
         {
            this.cloneChatProps(_loc4_,_loc3_);
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function cloneChatProps(source, dest)
   {
      if(source == null || dest == null)
      {
         return undefined;
      }
      dest.x = source.x;
      dest.y = source.y;
      dest.width = source.width;
      dest.height = source.height;
   }
   function addOrRemoveMainChatTab(chatTabData)
   {
      if(chatTabData.type == g4.model.GameConstants.CHAT_TAB_TYPE_MAIN)
      {
         if(!g4.util.ArrayUtil.isExist(this.mainChatTabIDArray,chatTabData.id))
         {
            this.mainChatTabIDArray.push(chatTabData.id);
         }
      }
      else if(chatTabData.type == g4.model.GameConstants.CHAT_TAB_TYPE_DIVIDED)
      {
         this.removeMainChatTab(chatTabData.id);
      }
   }
   function removeMainChatTab(tabID)
   {
      g4.util.ArrayUtil.removeElement(this.mainChatTabIDArray,tabID);
   }
   function moveToMainChatTab(tabID)
   {
      this.addMainChatTabAt(tabID,this.__get__mainChatTabCount());
      this.saveChatTabInfo();
      var _loc2_ = {};
      _loc2_.tabID = tabID;
      this.sendEvent(g4.model.GameModelEventType.CHAT_TAB_UPDATE,_loc2_);
      this.__set__selectedMainChatTabID(tabID);
   }
   function addMainChatTabAt(tabID, newIndex)
   {
      if(!this.isExistTab(tabID))
      {
         return undefined;
      }
      if(g4.util.ArrayUtil.isExist(this.mainChatTabIDArray,tabID))
      {
         return undefined;
      }
      if(newIndex < 1 || newIndex > this.__get__mainChatTabCount())
      {
         return undefined;
      }
      var _loc2_ = this.getChatTabData(tabID);
      _loc2_.type = g4.model.GameConstants.CHAT_TAB_TYPE_MAIN;
      this.overwriteByMainChatProps(_loc2_);
      this.mainChatTabIDArray.splice(newIndex,0,tabID);
   }
   function getMainChatTabIDAt(index)
   {
      if(index < 0 || index > this.__get__mainChatTabCount() - 1)
      {
         return -1;
      }
      return this.mainChatTabIDArray[index];
   }
   function rotateMainChatTab(toNext)
   {
      var _loc3_ = this.__get__mainChatTabCount();
      if(_loc3_ <= 1)
      {
         return undefined;
      }
      var _loc2_ = g4.util.ArrayUtil.indexOf(this.mainChatTabIDArray,this.__get__selectedMainChatTabID());
      _loc2_ = this.rotateIndex(_loc2_,_loc3_,toNext);
      var _loc4_ = this.mainChatTabIDArray[_loc2_];
      this.__set__selectedMainChatTabID(_loc4_);
   }
   function startChatTabDragging(tabID)
   {
      if(this._draggingTabID != -1)
      {
         return undefined;
      }
      if(!this.isExistTab(tabID))
      {
         return undefined;
      }
      this._draggingTabID = tabID;
      if(this._draggingTabID != g4.model.GameConstants.CHAT_MAIN_CHAT_DEFAULT_TAB_ID)
      {
         var _loc2_ = this.getChatTabData(this._draggingTabID);
         if(_loc2_.type == g4.model.GameConstants.CHAT_TAB_TYPE_MAIN)
         {
            if(this._draggingTabID == this.__get__selectedMainChatTabID())
            {
               this.__set__selectedMainChatTabID(g4.model.GameConstants.CHAT_MAIN_CHAT_DEFAULT_TAB_ID);
            }
            _loc2_.type = g4.model.GameConstants.CHAT_TAB_TYPE_DIVIDED;
            this.addOrRemoveMainChatTab(_loc2_);
            var _loc3_ = {};
            _loc3_.tabID = this._draggingTabID;
            this.sendEvent(g4.model.GameModelEventType.CHAT_TAB_UPDATE,_loc3_);
         }
      }
      this.sendEvent(g4.model.GameModelEventType.CHAT_CHAT_TAB_DRAGGING_START);
   }
   function endChatTabDragging(mainChatTabIndex)
   {
      if(this._draggingTabID == -1)
      {
         return undefined;
      }
      var _loc2_ = this._draggingTabID;
      this._draggingTabID = -1;
      if(_loc2_ != g4.model.GameConstants.CHAT_MAIN_CHAT_DEFAULT_TAB_ID)
      {
         if(!isNaN(mainChatTabIndex) && mainChatTabIndex >= 1 && mainChatTabIndex <= this.__get__mainChatTabCount())
         {
            this.addMainChatTabAt(_loc2_,mainChatTabIndex);
            var _loc4_ = {};
            _loc4_.tabID = _loc2_;
            this.sendEvent(g4.model.GameModelEventType.CHAT_TAB_UPDATE,_loc4_);
            this.__set__selectedMainChatTabID(_loc2_);
         }
      }
      this.sendEvent(g4.model.GameModelEventType.CHAT_CHAT_TAB_DRAGGING_END);
      this.saveChatTabInfo();
   }
   function startResizing(tabID)
   {
      if(this._resizingTabID != -1)
      {
         return undefined;
      }
      if(!this.isExistTab(tabID))
      {
         return undefined;
      }
      this._resizingTabID = tabID;
      this.sendEvent(g4.model.GameModelEventType.CHAT_RESIZING_START);
   }
   function endResizing()
   {
      if(this._resizingTabID == -1)
      {
         return undefined;
      }
      this._resizingTabID = -1;
      this.sendEvent(g4.model.GameModelEventType.CHAT_RESIZING_END);
      this.saveChatTabInfo();
   }
   function rotateInputChannel(toNext)
   {
      var _loc3_ = this.__get__inputChannelDataCount();
      if(_loc3_ <= 1)
      {
         return undefined;
      }
      var _loc2_ = g4.util.ArrayUtil.indexOf(this.inputChannelDataArray,gfx.utils.Delegate.create(this,function(data)
      {
         return data.id == this.selectedChannelID;
      }
      ));
      _loc2_ = this.rotateIndex(_loc2_,_loc3_,toNext);
      var _loc4_ = (g4.model.chat.InputChannelData)this.inputChannelDataArray[_loc2_].id;
      if(_loc4_ == this.whisperChatChannelID && g4.util.StringUtil.isNull(this.__get__whisperTarget()))
      {
         _loc2_ = this.rotateIndex(_loc2_,_loc3_,toNext);
         _loc4_ = (g4.model.chat.InputChannelData)this.inputChannelDataArray[_loc2_].id;
      }
      this.__set__selectedChannelID(_loc4_);
   }
   function rotateIndex(index, count, toNext)
   {
      if(toNext)
      {
         if((index = index + 1) > count - 1)
         {
            index = 0;
         }
      }
      else if((index = index - 1) < 0)
      {
         index = count - 1;
      }
      return index;
   }
   function changeChannel(channelID)
   {
      var _loc2_ = this.getInputChannelData(channelID);
      if(_loc2_ == null)
      {
         return undefined;
      }
      this.__set__selectedChannelID(channelID);
      this.setInputFocus(true);
   }
   function $OnGame_Chat_AddTab(tabID, tabName, x, y, width, height, alpha, fontSize, type, bLock)
   {
      if(isNaN(alpha))
      {
         alpha = this.MAIN_TAB_ALPHA;
      }
      fontSize = fontSize / 100;
      if(this.isExistTab(tabID))
      {
         return undefined;
      }
      if(this.chatTabDataArray.length >= g4.model.GameConstants.CHAT_MAX_TAB_COUNT)
      {
         return undefined;
      }
      var _loc2_ = new g4.model.chat.ChatTabData();
      this.chatTabDataMap[tabID] = _loc2_;
      this.chatTabDataArray.push(_loc2_);
      _loc2_.id = tabID;
      _loc2_.name = tabName;
      _loc2_.x = x;
      _loc2_.y = y;
      _loc2_.width = width;
      _loc2_.height = height;
      _loc2_.alpha = alpha;
      _loc2_.fontSize = fontSize;
      _loc2_.type = type;
      _loc2_.locked = bLock;
      if(_loc2_.id == g4.model.GameConstants.CHAT_MAIN_CHAT_DEFAULT_TAB_ID && this.mainChatTextArray != null && this.mainChatTextArray.length > 0)
      {
         _loc2_.chatTextArray = this.mainChatTextArray;
         this.mainChatTextArray = null;
      }
      this.addOrRemoveMainChatTab(_loc2_);
      if(_loc2_.id == g4.model.GameConstants.CHAT_MAIN_CHAT_DEFAULT_TAB_ID)
      {
         this.overwriteByMainChatPropsAll();
      }
      else if(_loc2_.type == g4.model.GameConstants.CHAT_TAB_TYPE_MAIN)
      {
         this.overwriteByMainChatProps(_loc2_);
      }
      var _loc3_ = {};
      _loc3_.tabID = tabID;
      this.sendEvent(g4.model.GameModelEventType.CHAT_TAB_ADD,_loc3_);
   }
   function $OnGame_Chat_UpdateTab(tabID, tabName, x, y, width, height, alpha, fontSize, type, bLock)
   {
      if(isNaN(alpha))
      {
         alpha = this.MAIN_TAB_ALPHA;
      }
      fontSize = fontSize / 100;
      if(!this.isExistTab(tabID))
      {
         return undefined;
      }
      var _loc2_ = this.getChatTabData(tabID);
      _loc2_.name = tabName;
      _loc2_.x = x;
      _loc2_.y = y;
      _loc2_.width = width;
      _loc2_.height = height;
      _loc2_.alpha = alpha;
      _loc2_.fontSize = fontSize;
      _loc2_.type = type;
      _loc2_.locked = bLock;
      this.addOrRemoveMainChatTab(_loc2_);
      if(_loc2_.id == g4.model.GameConstants.CHAT_MAIN_CHAT_DEFAULT_TAB_ID)
      {
         this.overwriteByMainChatPropsAll();
      }
      else if(_loc2_.type == g4.model.GameConstants.CHAT_TAB_TYPE_MAIN)
      {
         this.overwriteByMainChatProps(_loc2_);
      }
      var _loc3_ = {};
      _loc3_.tabID = tabID;
      this.sendEvent(g4.model.GameModelEventType.CHAT_TAB_UPDATE,_loc3_);
   }
   function $OnGame_Chat_SetChannelInfo(channelData)
   {
      this.chatChannelDataMap = {};
      this.whisperChatChannelID = -1;
      var _loc5_ = lib.util.ExtString.split(channelData,"\n");
      var _loc4_ = undefined;
      var _loc6_ = _loc5_.length;
      _loc4_ = 0;
      while(_loc4_ < _loc6_)
      {
         var _loc3_ = lib.util.ExtString.split(_loc5_[_loc4_],"\t");
         var _loc2_ = new g4.model.chat.ChatChannelData();
         _loc2_.id = Number(_loc3_[0]);
         _loc2_.name = _loc3_[1];
         _loc2_.color = Number(_loc3_[2]);
         _loc2_.shapColor = g4.util.StringUtil.toHTMLColorFormat(_loc2_.color);
         _loc2_.type = Number(_loc3_[3]);
         _loc2_.needLink = g4.util.Converter.toBoolean(_loc3_[4]);
         _loc2_.showChannelName = g4.util.Converter.toBoolean(_loc3_[5]);
         _loc2_.needHTML = g4.util.Converter.toBoolean(_loc3_[6]);
         this.chatChannelDataMap[_loc2_.id] = _loc2_;
         if(_loc2_.type == g4.model.GameConstants.CHAT_CHANNEL_TYPE_WHISPER)
         {
            this.whisperChatChannelID = _loc2_.id;
         }
         _loc4_ = _loc4_ + 1;
      }
      this.sendEvent(g4.model.GameModelEventType.CHAT_CHANNEL_DATA_CHANGE);
   }
   function $OnGame_Chat_SetChannelList(channelList)
   {
      this.inputChannelDataArray = [];
      this.inputChannelDataMap = {};
      var _loc5_ = channelList.split("\n");
      if(_loc5_[_loc5_.length - 1] == "undefined" || _loc5_[_loc5_.length - 1] == "" || _loc5_[_loc5_.length - 1] == undefined)
      {
         _loc5_.splice(_loc5_.length - 1,1);
      }
      var _loc4_ = undefined;
      var _loc6_ = _loc5_.length;
      _loc4_ = 0;
      while(_loc4_ < _loc6_)
      {
         var _loc3_ = _loc5_[_loc4_].split("\t");
         if(_loc3_.length != 1)
         {
            var _loc2_ = new g4.model.chat.InputChannelData();
            _loc2_.id = Number(_loc3_[0]);
            _loc2_.name = String(_loc3_[1]);
            _loc2_.nameForDropdown = _loc2_.name;
            _loc2_.command = _loc2_.name.substr(_loc2_.name.indexOf("/"),2);
            this.inputChannelDataArray.push(_loc2_);
            this.inputChannelDataMap[_loc2_.id] = _loc2_;
         }
         _loc4_ = _loc4_ + 1;
      }
      this.sendEvent(g4.model.GameModelEventType.CHAT_INPUT_CHANNEL_DATA_CHANGE);
      if(this.inputChannelDataMap[this.__get__selectedChannelID()] == null)
      {
         this.__set__selectedChannelID(0);
      }
   }
   function $OnGame_Chat_UpdateChannelList(channelID, name)
   {
      var _loc3_ = this.getInputChannelData(channelID);
      if(_loc3_ == null)
      {
         return undefined;
      }
      _loc3_.nameForDropdown = name;
      var _loc2_ = {};
      _loc2_.channelID = channelID;
      this.sendEvent(g4.model.GameModelEventType.CHAT_INPUT_CHANNEL_DATA_UPDATE,_loc2_);
   }
   function $OnGame_Chat_ChangeChannel(channelID, whisperTarget)
   {
      var _loc2_ = whisperTarget.indexOf("<img");
      if(_loc2_ != -1)
      {
         _loc2_ = whisperTarget.indexOf("/>",_loc2_) + 2;
         whisperTarget = whisperTarget.substring(_loc2_);
      }
      this.__set__whisperTarget(whisperTarget);
      this.__set__selectedChannelID(channelID);
   }
   function $OnGame_Chat_ResetInfo()
   {
      this.removeAllTabs();
   }
   function $OnGame_Chat_SetWriting(channelID, writing, id, addParam, tabIDList, wisperType)
   {
      var _loc7_ = g4.model.chat.ChatUtil.convertChatMessage(channelID,writing,id,addParam,tabIDList,wisperType);
      if(_loc7_ == null || _loc7_.length == 0)
      {
         return undefined;
      }
      var _loc8_ = lib.util.ExtString.split(tabIDList,"\t");
      if(_loc8_.length <= 0)
      {
         _loc8_.push(tabIDList);
      }
      var _loc4_ = undefined;
      var _loc9_ = _loc8_.length;
      _loc4_ = 0;
      while(_loc4_ < _loc9_)
      {
         var _loc6_ = _loc8_[_loc4_];
         var _loc3_ = this.getChatTabData(_loc6_);
         var _loc5_ = false;
         _loc3_.chatTextArray = _loc3_.chatTextArray.concat(_loc7_);
         if(_loc3_.chatTextArray.length > g4.model.GameConstants.CHAT_LINE_MAX)
         {
            _loc3_.chatTextArray.splice(0,g4.model.GameConstants.CHAT_LINE_CLEAR);
            _loc5_ = true;
         }
         var _loc2_ = {};
         _loc2_.channelID = channelID;
         _loc2_.tabID = _loc6_;
         _loc2_.chatTextArray = _loc7_;
         _loc2_.clear = _loc5_;
         this.sendEvent(g4.model.GameModelEventType.CHAT_CHAT_TEXT_ADD,_loc2_);
         _loc4_ = _loc4_ + 1;
      }
   }
   function $OnGame_Chat_ChangeChatMode(bInputMode)
   {
      this.setInputFocus(bInputMode);
   }
   function $OnGame_Chat_SetLanguageInfo(value)
   {
      if(value == this._language)
      {
         return undefined;
      }
      this._language = value;
      this.sendEvent(g4.model.GameModelEventType.CHAT_LANGUAGE_CHANGE);
   }
   function $OnGame_Chat_SetLock(locked)
   {
      this._locked = locked;
   }
   function $OnGame_Chat_Refresh()
   {
      this.sendEvent(g4.model.GameModelEventType.CHAT_REFRESH);
   }
   function $OnGame_Chat_RemakeToHtml(channelID, message, id)
   {
      if(message.indexOf("<") != -1)
      {
         message = lib.util.ExtString.replace(message,"<","&lt;",false);
      }
      if(message.indexOf(">") != -1)
      {
         message = lib.util.ExtString.replace(message,">","&gt;",false);
      }
      this.sendEvent(g4.model.GameModelEventType.CHAT_CLEAN_UP_INPUT);
      var _loc3_ = "<FONT>" + message + "</FONT>";
      _loc3_ = g4.model.chat.ChatUtil.calcHtmlText(_loc3_,true,channelID);
      this.ToGame_Chat_SendWriting(channelID,_loc3_,id,message);
   }
   function $OnGame_Chat_ChangeInputChannel(channelID, whisperTarget, bNotChatClear)
   {
      this.__set__whisperTarget(whisperTarget);
      this.__set__selectedChannelID(channelID);
      if(!bNotChatClear)
      {
         this.sendEvent(g4.model.GameModelEventType.CHAT_CLEAN_UP_INPUT);
      }
   }
   function $OnGame_Chat_SaveTabInfo()
   {
      this.saveChatTabInfo();
   }
   function $OnGame_Chat_SetPunishment(bShow, data)
   {
      if(bShow)
      {
         this._punishment = data;
      }
      else
      {
         this._punishment = null;
      }
      this.sendEvent(g4.model.GameModelEventType.CHAT_PUNISHMENT_CHANGE);
   }
   function $OnGame_Chat_SetChatMode(value)
   {
      if(value == this._chatMode)
      {
         return undefined;
      }
      this._chatMode = value;
      this.sendEvent(g4.model.GameModelEventType.CHAT_MODE_CHANGE);
   }
   function ToGame_Chat_ClickSocialBtn()
   {
      this.modelCalls.ToGame_Chat_ClickSocialBtn();
   }
   function ToGame_Chat_ChangeInputLanguage()
   {
      this.modelCalls.ToGame_Chat_ChangeInputLanguage();
   }
   function ToGame_Chat_RequestSlashCommand(str)
   {
      var _loc2_ = str.split(" ");
      if(_loc2_.length >= 3)
      {
         this.modelCalls.ToGame_Chat_RequestSlashCommand(_loc2_[0],_loc2_[1]);
      }
      else
      {
         this.modelCalls.ToGame_Chat_RequestSlashCommand(_loc2_[0]);
      }
   }
   function ToGame_Chat_SendWriting(chatType, HtmlText, id, notHtmlText)
   {
      var _loc10_ = "<A HREF=\"asfunction:chatLinkAction,";
      var _loc3_ = HtmlText.indexOf(_loc10_);
      if(_loc3_ != -1)
      {
         var _loc7_ = "";
         var _loc5_ = 0;
         while(_loc3_ != -1)
         {
            _loc7_ = _loc7_ + HtmlText.substring(_loc5_,_loc3_);
            _loc5_ = HtmlText.indexOf("</A>",_loc3_);
            var _loc2_ = HtmlText.substring(_loc3_,_loc5_);
            var _loc6_ = _loc2_.indexOf("{");
            var _loc8_ = _loc2_.indexOf("}");
            var _loc9_ = _loc2_.substring(_loc6_ + 1,_loc8_);
            _loc7_ = _loc7_ + (_loc2_.substring(0,_loc6_) + "\">&lt;" + _loc9_ + "&gt;</A>");
            _loc3_ = HtmlText.indexOf(_loc10_,_loc5_);
         }
         _loc7_ = _loc7_ + HtmlText.substring(_loc5_ + 4);
         _loc7_ = _loc7_.split("<A HREF=\"asfunction:chatLinkAction,").join("<ChatLinkAction param=\"");
         _loc7_ = _loc7_.split("</A>").join("</ChatLinkAction>");
         HtmlText = _loc7_;
      }
      this.modelCalls.ToGame_Chat_SendWriting(chatType,HtmlText,id,notHtmlText);
   }
   function ToGame_Chat_RequestAddTab()
   {
      this.modelCalls.ToGame_Chat_RequestAddTab();
   }
   function ToGame_Chat_SaveLock(locked)
   {
      this._locked = locked;
      this.modelCalls.ToGame_Chat_SaveLock(locked);
   }
   function ToGame_Chat_RequestOpenChatTabOptionUI(tabID)
   {
      this.modelCalls.ToGame_Chat_RequestOpenChatTabOptionUI(tabID);
   }
   function ToGame_Chat_RequestPrivateChannelUI(tabID)
   {
      this.modelCalls.ToGame_Chat_RequestPrivateChannelUI(tabID);
   }
   function ToGame_Chat_RequestInitPos()
   {
      this.modelCalls.ToGame_Chat_RequestInitPos();
   }
   function ToGame_Chat_RequestInitChat()
   {
      var _loc2_ = this.getChatTabData(g4.model.GameConstants.CHAT_MAIN_CHAT_DEFAULT_TAB_ID);
      if(_loc2_ != null)
      {
         this.mainChatTextArray = _loc2_.chatTextArray;
      }
      this.modelCalls.ToGame_Chat_RequestInitChat();
   }
   function ToGame_Chat_ClickLink(type, id, id2)
   {
      this.modelCalls.ToGame_Chat_ClickLink(type,id,id2);
   }
   function ToGame_Chat_ClickName(name, channelID, strTalk, combinationKey)
   {
      this.modelCalls.ToGame_Chat_ClickName(name,channelID,strTalk,combinationKey);
   }
   function ToGame_Chat_SetChatMode(chatMode)
   {
      this.modelCalls.ToGame_Chat_SetChatMode(chatMode);
   }
}
