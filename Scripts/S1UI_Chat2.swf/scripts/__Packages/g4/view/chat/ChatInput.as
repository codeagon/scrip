class g4.view.chat.ChatInput extends g4.core.SimpleView
{
   var chatInputMaxChars = 150;
   var MAX_LINK_COUNT = 3;
   var CHAT_HISTORY_MAX_COUNT = 10;
   var inputOffsetY = 0;
   var bgOffsetX = 0;
   var textFieldOrigX = 0;
   var textFieldOffsetX = 0;
   var focusOffsetX = 0;
   var languageOffsetX = 0;
   var bDetailVisible = false;
   var regWidth = g4.view.chat.ChatConstants.STYLE_CHAT_BASE_WIDTH;
   var firstTimeAfterInit = false;
   var mouseDowned = false;
   var pendingCaretIndex = -1;
   var intervalID = -1;
   var _inputMode = false;
   function ChatInput(targetMovieClip)
   {
      super(targetMovieClip);
      this.input_mc = targetMovieClip;
      this.configUI();
   }
   function __get__inputMode()
   {
      return this._inputMode;
   }
   function configUI()
   {
      _global.chatLinkAction = gfx.utils.Delegate.create(this,this.chatLinkAction);
      var _loc4_ = lib.gamedata.DefaultData.getDefaultUIData("inputChat").param0;
      if(_loc4_ != undefined)
      {
         this.chatInputMaxChars = Number(_loc4_);
      }
      this.mc_text_field = this.input_mc.mc_text_field;
      this.textField = this.mc_text_field.textField;
      this.textFieldDetail = this.input_mc.text_detail;
      this.mc_focus = this.input_mc.mc_focus;
      this.mc_bg = this.input_mc.mc_bg;
      this.mc_language = this.input_mc.mc_language;
      this.inputOffsetY = this.input_mc._y - g4.view.chat.ChatConstants.STYLE_CHAT_BASE_HEIGHT;
      this.bgOffsetX = this.mc_bg._width - g4.view.chat.ChatConstants.STYLE_CHAT_BASE_WIDTH;
      this.textFieldOffsetX = this.textField._width - g4.view.chat.ChatConstants.STYLE_CHAT_BASE_WIDTH;
      this.textFieldOrigX = this.mc_text_field._x;
      this.focusOffsetX = this.mc_focus._width - g4.view.chat.ChatConstants.STYLE_CHAT_BASE_WIDTH;
      this.languageOffsetX = this.mc_language._x - g4.view.chat.ChatConstants.STYLE_CHAT_BASE_WIDTH;
      this.mc_language.textField.verticalAlign = "center";
      g4.util.UIUtil.setTextFieldStyle(this.mc_language.textField,g4.util.UIUtil.TEXT_FIELD_STYLE_1);
      this.text_field_temp_2 = _root.createTextField("text_field_temp_2",_root.getNextHighestDepth(),0,0,0,0);
      this.text_field_temp_2._visible = false;
      lib.manager.Focus.CHAT_INPUT = this.textField;
      this.textDataList = [];
      this.cursorStartPosition = -1;
      this.lastText = "";
      this.lastCaretIndex = -1;
      this.lastSelectionBeginIndex = -1;
      this.lastSelectionEndIndex = -1;
      this.currentText = "";
      this.currentCaretIndex = -1;
      this.currentSelectionBeginIndex = -1;
      this.currentSelectionEndIndex = -1;
      this.chatHistoryArray = [];
      this.configTextField();
      this.textFieldDetail.autoSize = true;
      this.textFieldDetail.verticalAlign = "center";
      g4.util.UIUtil.setTextFieldStyle(this.textFieldDetail,g4.util.UIUtil.TEXT_FIELD_STYLE_1);
      g4.util.UIUtil.setMouseEnabled(this.textFieldDetail,false);
      g4.util.UIUtil.setMouseEnabled(this.mc_focus,false);
      this.setInputFocus(false);
      this.afterFocusOff();
      this.updateByLanguage();
      this.updateByChannelData();
      this.updateBySelectedChannel();
      this.initInputText();
      var _loc5_ = {};
      _loc5_.onKeyDown = gfx.utils.Delegate.create(this,this.onKeyDownHandler);
      Key.addListener(_loc5_);
      Mouse.addListener(this);
      g4.model.GameModel.addEventListener(g4.view.ViewID.CHAT_2,g4.model.GameModelEventType.MAIN_UI_MODE_CHANGED,this,"model_mainUIModeChangeHandler");
      g4.model.GameModel.addEventListener(g4.view.ViewID.CHAT_2,g4.model.GameModelEventType.CHAT_INPUT_FOCUS,this,"model_chatInputFocusHandler");
      g4.model.GameModel.addEventListener(g4.view.ViewID.CHAT_2,g4.model.GameModelEventType.CHAT_RESIZING_START,this,"model_chatResizingStartHandler");
      g4.model.GameModel.addEventListener(g4.view.ViewID.CHAT_2,g4.model.GameModelEventType.CHAT_RESIZING_END,this,"model_chatResizingEndHandler");
      g4.model.GameModel.addEventListener(g4.view.ViewID.CHAT_2,g4.model.GameModelEventType.CHAT_LANGUAGE_CHANGE,this,"model_chatLanguageChangeHandler");
      g4.model.GameModel.addEventListener(g4.view.ViewID.CHAT_2,g4.model.GameModelEventType.CHAT_CHANNEL_DATA_CHANGE,this,"model_chatChannelDataChangeHandler");
      g4.model.GameModel.addEventListener(g4.view.ViewID.CHAT_2,g4.model.GameModelEventType.CHAT_SELECTED_CHANNEL_CHANGE,this,"model_chatSelectedChannelChangeHandler");
      g4.model.GameModel.addEventListener(g4.view.ViewID.CHAT_2,g4.model.GameModelEventType.CHAT_WHISPER_TARGET_CHANGE,this,"model_chatWhisperTargetChangeHandler");
      g4.model.GameModel.addEventListener(g4.view.ViewID.CHAT_2,g4.model.GameModelEventType.CHAT_CLEAN_UP_INPUT,this,"model_chatCleanUpInputHandler");
      g4.model.GameModel.addEventListener(g4.view.ViewID.CHAT_2,g4.model.GameModelEventType.CHAT_ADD_INPUT_TEXT,this,"model_chatAddInputTextHandler");
      g4.model.GameModel.addEventListener(g4.view.ViewID.CHAT_2,g4.model.GameModelEventType.CHAT_ADD_LINK,this,"model_chatAddLinkHandler");
      this.mc_language.onRelease = gfx.utils.Delegate.create(this,function()
      {
         g4.model.GameModel.chatModel.setInputFocus(true);
         g4.model.GameModel.chatModel.ToGame_Chat_ChangeInputLanguage();
      }
      );
   }
   function configTextField()
   {
      this.textField.noAutoSelection = true;
      this.textField.verticalAlign = "center";
      this.textField.maxChars = this.chatInputMaxChars;
      this.textField.html = true;
      this.textField.type = "input";
      this.textField.border = false;
      this.textField.background = false;
      this.textField.multiline = false;
      this.textField.wordWrap = false;
      g4.util.UIUtil.setTextFieldStyle(this.textField,g4.util.UIUtil.TEXT_FIELD_STYLE_1);
      this.textField.onSetFocus = gfx.utils.Delegate.create(this,this.textField_onSetFocusHandler);
      this.textField.onKillFocus = gfx.utils.Delegate.create(this,this.textField_onKillFocusHandler);
      this.textField.onChanged = gfx.utils.Delegate.create(this,this.textField_onChangedHandler);
   }
   function updateByLanguage()
   {
      var _loc2_ = "";
      switch(g4.model.GameModel.chatModel.__get__language())
      {
         case g4.model.GameConstants.CHAT_LANGUAGE_TYPE_ENGLISH:
            _loc2_ = lib.util.UIString.getUIString("$032015");
            break;
         case g4.model.GameConstants.CHAT_LANGUAGE_TYPE_KOREAN:
            _loc2_ = lib.util.UIString.getUIString("$032014");
      }
      this.mc_language.textField.text = _loc2_;
   }
   function setSize(w, h)
   {
      this.regWidth = w;
      this.input_mc._y = h + this.inputOffsetY;
      this.mc_bg._width = w + this.bgOffsetX;
      this.mc_focus._width = w + this.focusOffsetX;
      this.mc_language._x = w + this.languageOffsetX;
      this.updateInputTextFieldPositionAndSize();
   }
   function chatLinkAction(id)
   {
      var _loc1_ = id.split("#####");
      if(_loc1_.length == 2)
      {
         g4.model.GameModel.chatModel.ToGame_Chat_ClickLink(_loc1_[0],_loc1_[1]);
      }
      else if(_loc1_.length == 3)
      {
         g4.model.GameModel.chatModel.ToGame_Chat_ClickLink(_loc1_[0],_loc1_[1],_loc1_[2]);
      }
   }
   function getInputTextLength()
   {
      return this.textField.length;
   }
   function getInputText()
   {
      return this.textField.text;
   }
   function isEmptyInputText()
   {
      return lib.util.ExtString.trim(this.getInputText()) == "";
   }
   function isInputFieldShown()
   {
      return this.input_mc._visible;
   }
   function setInputFocus(focus)
   {
      if(focus)
      {
         this.input_mc._visible = true;
         Selection.setFocus(this.textField);
         if(this.pendingCaretIndex != -1)
         {
            this.moveCursorTo(this.pendingCaretIndex);
            this.pendingCaretIndex = -1;
         }
         else
         {
            this.moveCursorEnd();
         }
      }
      else
      {
         this.input_mc._visible = false;
         Selection.setFocus(this.text_field_temp_2);
      }
   }
   function afterFocusOn()
   {
      this._inputMode = true;
      _global.chating = true;
      _global.inputing = true;
      this.setVisibleFocusEffect(true);
      lib.manager.Focus.currentFocus = this.textField;
      if(this.mouseDowned)
      {
         this.adjustCursorPosition();
      }
      this.storeCursorStartPosition();
      this.startCursorCheck();
   }
   function afterFocusOff()
   {
      this._inputMode = false;
      _global.chating = false;
      _global.inputing = false;
      this.setVisibleFocusEffect(false);
      this.stopCursorCheck();
   }
   function setVisibleFocusEffect(visible)
   {
      if(visible == this.mc_focus._visible)
      {
         return undefined;
      }
      this.mc_focus._visible = visible;
      if(visible)
      {
         this.mc_focus.gotoAndPlay(2);
      }
      else
      {
         this.mc_focus.gotoAndStop(1);
      }
   }
   function updateByChannelData()
   {
      var _loc2_ = g4.model.GameModel.chatModel.getWhisperChatChannelData();
      if(_loc2_ != null)
      {
         this.textFieldDetail.textColor = _loc2_.color;
      }
      this.updateBySelectedChannel();
   }
   function getSelectedChannelData()
   {
      return g4.model.GameModel.chatModel.getChatChannelData(g4.model.GameModel.chatModel.__get__selectedChannelID());
   }
   function updateBySelectedChannel()
   {
      if(this.__get__inputMode())
      {
         this.updateInputTextField();
      }
      else
      {
         this.initInputText();
      }
      this.updateByWhisperMode();
   }
   function updateByWhisperMode()
   {
      var _loc3_ = false;
      if(g4.model.GameModel.chatModel.__get__isWhisperMode())
      {
         var _loc2_ = g4.model.GameModel.chatModel.__get__whisperTarget();
         if(_loc2_ != null && _loc2_.length > 0)
         {
            this.textFieldDetail.text = "[" + _loc2_ + "]:";
            _loc3_ = true;
         }
         else
         {
            var _loc4_ = g4.model.GameModel.chatModel.getInputChannelData(g4.model.GameModel.chatModel.__get__selectedChannelID());
            this.initInputText(_loc4_.command);
         }
      }
      this.bDetailVisible = _loc3_;
      this.textFieldDetail._visible = _loc3_;
      this.updateInputTextFieldPositionAndSize();
   }
   function updateInputTextFieldPositionAndSize()
   {
      if(this.bDetailVisible)
      {
         var _loc2_ = this.textFieldDetail._x + this.textFieldDetail._width;
         var _loc3_ = _loc2_ - this.textFieldOrigX;
         this.mc_text_field._x = _loc2_;
         this.textField._width = this.regWidth + this.textFieldOffsetX - _loc3_;
      }
      else
      {
         this.mc_text_field._x = this.textFieldOrigX;
         this.textField._width = this.regWidth + this.textFieldOffsetX;
      }
      this.textField.verticalAlign = "center";
   }
   function addInputText(text)
   {
      if(text.length > this.calculcateRemainingLength())
      {
         return undefined;
      }
      this.addInputTextAt(this.getInputTextLength(),text);
      this.updateInputTextField();
      g4.model.GameModel.chatModel.setInputFocus(true);
   }
   function addCurrentChatToHistory()
   {
      if(this.textDataList == null || this.textDataList.length == 0)
      {
         return undefined;
      }
      var _loc2_ = this.cloneTextDataList(this.textDataList);
      this.chatHistoryArray.push(_loc2_);
      if(this.chatHistoryArray.length > this.CHAT_HISTORY_MAX_COUNT)
      {
         this.chatHistoryArray.shift();
      }
   }
   function cloneTextDataList(sourceArray)
   {
      var _loc3_ = [];
      var _loc2_ = undefined;
      var _loc4_ = sourceArray.length;
      _loc2_ = 0;
      while(_loc2_ < _loc4_)
      {
         _loc3_.push(this.cloneTextData((g4.view.chat.TextData)sourceArray[_loc2_]));
         _loc2_ = _loc2_ + 1;
      }
      return _loc3_;
   }
   function cloneTextData(sourceData)
   {
      var _loc1_ = new g4.view.chat.TextData();
      _loc1_.text = sourceData.text;
      _loc1_.color = sourceData.color;
      _loc1_.link = sourceData.link;
      _loc1_.linkType = sourceData.linkType;
      _loc1_.linkData = sourceData.linkData;
      return _loc1_;
   }
   function rotateRecentMessage(bNext)
   {
      g4.util.UIUtil.callLater(this,"_rotateRecentMessage",[bNext]);
   }
   function _rotateRecentMessage(bNext)
   {
      if(this.chatHistoryArray.length == 0)
      {
         return undefined;
      }
      if(bNext)
      {
         this.chatHistoryArray.push(this.chatHistoryArray.shift());
      }
      else
      {
         this.chatHistoryArray.unshift(this.chatHistoryArray.pop());
      }
      this.textDataList = this.cloneTextDataList(this.chatHistoryArray[0]);
      this.updateInputTextField();
      this.moveCursorEnd();
   }
   function convertTextDataListToSendFormat()
   {
      var _loc5_ = "";
      var _loc4_ = undefined;
      var _loc2_ = undefined;
      var _loc3_ = undefined;
      var _loc6_ = this.textDataList.length;
      _loc3_ = 0;
      while(_loc3_ < _loc6_)
      {
         _loc4_ = (g4.view.chat.TextData)this.textDataList[_loc3_];
         _loc2_ = this.convertTextDataToHtml(_loc4_);
         if(_loc2_ != null && _loc2_.length > 0)
         {
            if(!_loc4_.link)
            {
               _loc2_ = "<font>" + _loc2_ + "</font>";
            }
            _loc5_ = _loc5_ + _loc2_;
         }
         _loc3_ = _loc3_ + 1;
      }
      _loc5_ = _loc5_.split("<font").join("<FONT");
      _loc5_ = _loc5_.split("</font>").join("</FONT>");
      _loc5_ = _loc5_.split("<a href").join("<A HREF");
      _loc5_ = _loc5_.split("</a>").join("</A>");
      return _loc5_;
   }
   function sendInputText()
   {
      var _loc2_ = this.convertTextDataListToSendFormat();
      if(g4.util.StringUtil.trim(_loc2_).length > 0)
      {
         this.addCurrentChatToHistory();
         var _loc3_ = g4.model.chat.ChatUtil.calcHtmlText(_loc2_);
         var _loc4_ = this.getInputText();
         if(g4.model.GameModel.chatModel.__get__isWhisperMode())
         {
            g4.model.GameModel.chatModel.ToGame_Chat_SendWriting(g4.model.GameModel.chatModel.__get__selectedChannelID(),_loc3_,g4.model.GameModel.chatModel.__get__whisperTarget(),_loc4_);
         }
         else
         {
            g4.model.GameModel.chatModel.ToGame_Chat_SendWriting(g4.model.GameModel.chatModel.__get__selectedChannelID(),_loc3_,undefined,_loc4_);
         }
         this.initInputText();
      }
      g4.model.GameModel.chatModel.setInputFocus(false);
   }
   function getLinkCount()
   {
      var _loc3_ = 0;
      var _loc2_ = undefined;
      var _loc4_ = this.textDataList.length;
      _loc2_ = 0;
      while(_loc2_ < _loc4_)
      {
         if((g4.view.chat.TextData)this.textDataList[_loc2_].link)
         {
            _loc3_ = _loc3_ + 1;
         }
         _loc2_ = _loc2_ + 1;
      }
      return _loc3_;
   }
   function isNotChatFocus()
   {
      if(lib.manager.Focus.currentFocus != lib.manager.Focus.CHAT_INPUT && lib.manager.Focus.currentFocus.toString() != undefined)
      {
         return true;
      }
      return false;
   }
   function addLink(linkType, linkData, text, itemGrade)
   {
      if(this.isNotChatFocus())
      {
         return undefined;
      }
      this.optimizeTextDataList();
      var _loc3_ = undefined;
      if(linkType == 1)
      {
         _loc3_ = this.getLinkTextColorByItemGrade(itemGrade);
      }
      else
      {
         _loc3_ = this.getLinkTextByLinkType(linkType);
      }
      var _loc2_ = new g4.view.chat.TextData();
      _loc2_.text = text;
      _loc2_.color = _loc3_;
      _loc2_.link = true;
      _loc2_.linkType = linkType;
      _loc2_.linkData = linkData;
      var _loc4_ = this.isPossibleToAddLinkData(_loc2_);
      if(_loc4_)
      {
         this.addLinkData(_loc2_);
         this.updateInputTextField();
         g4.model.GameModel.chatModel.setInputFocus(true);
      }
   }
   function addLinkData(textData)
   {
      var _loc14_ = this.firstTimeAfterInit;
      this.firstTimeAfterInit = false;
      Selection.setFocus(this.textField);
      var _loc3_ = Selection.getCaretIndex();
      var _loc12_ = Selection.getBeginIndex();
      var _loc13_ = Selection.getEndIndex();
      if(_loc14_)
      {
         _loc3_ = this.textField.text.length;
         _loc12_ = _loc3_;
         _loc13_ = _loc3_;
      }
      if(_loc12_ < _loc13_)
      {
         this.removeTextDataInRange(_loc12_,_loc13_);
         _loc3_ = _loc12_;
      }
      var _loc5_ = undefined;
      var _loc11_ = this.textDataList.length;
      if(_loc11_ > 0)
      {
         var _loc4_ = 0;
         var _loc6_ = undefined;
         var _loc2_ = undefined;
         _loc2_ = 0;
         while(_loc2_ < _loc11_)
         {
            _loc5_ = (g4.view.chat.TextData)this.textDataList[_loc2_];
            _loc6_ = _loc4_ + g4.view.chat.ChatInput.getActualTextLength(_loc5_);
            if(_loc3_ >= _loc4_ && _loc3_ <= _loc6_)
            {
               if(_loc3_ == _loc4_)
               {
                  this.textDataList.splice(_loc2_,0,textData);
               }
               else if(_loc3_ == _loc6_)
               {
                  this.textDataList.splice(_loc2_ + 1,0,textData);
               }
               else if(!_loc5_.link)
               {
                  var _loc8_ = _loc3_ - _loc4_;
                  var _loc9_ = new g4.view.chat.TextData();
                  _loc9_.text = _loc5_.text.substr(0,_loc8_);
                  var _loc7_ = new g4.view.chat.TextData();
                  _loc7_.text = _loc5_.text.substr(_loc8_);
                  this.textDataList.splice(_loc2_,1,_loc9_,textData,_loc7_);
               }
               break;
            }
            _loc4_ = _loc6_;
            _loc2_ = _loc2_ + 1;
         }
      }
      else
      {
         this.textDataList.push(textData);
      }
      this.pendingCaretIndex = _loc3_ + g4.view.chat.ChatInput.getActualTextLength(textData);
   }
   function isPossibleToAddLinkData(textData)
   {
      if(this.getLinkCount() >= this.MAX_LINK_COUNT)
      {
         return false;
      }
      if(g4.view.chat.ChatInput.getActualTextLength(textData) > this.calculcateRemainingLength())
      {
         return false;
      }
      return true;
   }
   static function getActualTextLength(data)
   {
      if(data == null || data.text == null || data.text.length == 0)
      {
         return 0;
      }
      if(data.link)
      {
         return data.text.length + 2;
      }
      return data.text.length;
   }
   function calculcateRemainingLength()
   {
      var _loc3_ = 0;
      var _loc2_ = undefined;
      var _loc4_ = this.textDataList.length;
      _loc2_ = 0;
      while(_loc2_ < _loc4_)
      {
         _loc3_ = _loc3_ + g4.view.chat.ChatInput.getActualTextLength((g4.view.chat.TextData)this.textDataList[_loc2_]);
         _loc2_ = _loc2_ + 1;
      }
      return this.chatInputMaxChars - _loc3_;
   }
   function initInputText(value)
   {
      this.firstTimeAfterInit = true;
      this.textDataList = [];
      if(value && value.length > 0)
      {
         var _loc2_ = new g4.view.chat.TextData();
         _loc2_.text = value;
         this.textDataList.push(_loc2_);
      }
      this.updateInputTextField();
   }
   function updateInputTextField()
   {
      var _loc2_ = this.generateFontTag(this.convertTextDataListToHtml(),this.getCurrentTextColor());
      this.textField.htmlText = _loc2_;
      this.storeLastTextProps();
   }
   function convertTextDataListToHtml()
   {
      var _loc3_ = "";
      var _loc2_ = undefined;
      var _loc4_ = this.textDataList.length;
      _loc2_ = 0;
      while(_loc2_ < _loc4_)
      {
         _loc3_ = _loc3_ + this.convertTextDataToHtml((g4.view.chat.TextData)this.textDataList[_loc2_]);
         _loc2_ = _loc2_ + 1;
      }
      return _loc3_;
   }
   function convertTextDataToHtml(data)
   {
      var _loc3_ = "";
      if(g4.view.chat.ChatInput.getActualTextLength(data) > 0)
      {
         if(data.link)
         {
            _loc3_ = this.generateChatLinkAction(data.text,data.linkType,data.linkData,data.color);
         }
         else
         {
            _loc3_ = this.escapeHtml(data.text);
         }
      }
      return _loc3_;
   }
   static function convertActualTextForLink(text)
   {
      return "&lt;" + text + "&gt;";
   }
   function storeLastTextProps()
   {
      this.lastText = this.textField.text;
      this.lastCaretIndex = Selection.getCaretIndex();
      this.lastSelectionBeginIndex = Selection.getBeginIndex();
      this.lastSelectionEndIndex = Selection.getEndIndex();
   }
   function storeCurrentTextProps()
   {
      this.currentText = this.textField.text;
      this.currentCaretIndex = Selection.getCaretIndex();
      this.currentSelectionBeginIndex = Selection.getBeginIndex();
      this.currentSelectionEndIndex = Selection.getEndIndex();
   }
   function storeCursorStartPosition()
   {
      this.firstTimeAfterInit = false;
      this.cursorStartPosition = Selection.getBeginIndex();
   }
   function adjustInputText()
   {
      if(this.lastText == this.currentText)
      {
         return undefined;
      }
      var _loc5_ = 0;
      var _loc4_ = 0;
      var _loc8_ = this.lastText.length;
      var _loc7_ = this.currentText.length;
      var _loc14_ = this.cursorStartPosition - 1 == this.currentSelectionBeginIndex;
      var _loc6_ = this.cursorStartPosition;
      if(_loc14_)
      {
         _loc6_ = _loc6_ - 1;
      }
      var _loc2_ = undefined;
      var _loc3_ = Math.min(_loc8_,_loc7_);
      _loc2_ = 0;
      while(_loc2_ < _loc3_)
      {
         if(_loc2_ >= _loc6_)
         {
            break;
         }
         if(this.lastText.charAt(_loc2_) == this.currentText.charAt(_loc2_))
         {
            _loc5_ = _loc5_ + 1;
            _loc2_ = _loc2_ + 1;
            continue;
         }
         break;
      }
      _loc3_ = _loc3_ - _loc5_;
      _loc2_ = 0;
      while(_loc2_ < _loc3_)
      {
         if(this.lastText.charAt(_loc8_ - _loc2_ - 1) == this.currentText.charAt(_loc7_ - _loc2_ - 1))
         {
            _loc4_ = _loc4_ + 1;
            _loc2_ = _loc2_ + 1;
            continue;
         }
         break;
      }
      var _loc17_ = this.currentText.substr(0,_loc5_);
      var _loc16_ = this.currentText.substr(- _loc4_,_loc4_);
      var _loc9_ = this.currentText.substring(_loc5_,this.currentText.length - _loc4_);
      var _loc10_ = _loc5_;
      var _loc12_ = this.lastText.length - _loc4_;
      var _loc11_ = _loc10_;
      if(_loc10_ < _loc12_)
      {
         var _loc13_ = _loc12_ - _loc10_;
         var _loc15_ = this.removeTextDataInRange(_loc10_,_loc12_);
         if(_loc14_)
         {
            if(_loc15_ > _loc13_)
            {
               _loc11_ = _loc11_ - (_loc15_ - _loc13_);
            }
         }
      }
      if(_loc9_ && _loc9_.length > 0)
      {
         if(_loc9_.length <= this.calculcateRemainingLength())
         {
            this.addInputTextAt(_loc10_,_loc9_);
            _loc11_ = _loc11_ + _loc9_.length;
         }
      }
      this.updateInputTextField();
      this.setSelection(_loc11_,_loc11_);
   }
   function addInputTextAt(index, text)
   {
      if(text == null || text.length == 0)
      {
         return false;
      }
      var _loc2_ = this.getNormalTextDataAt(index);
      var _loc3_ = _loc2_.textData;
      var _loc5_ = _loc3_.text;
      var _loc4_ = index - _loc2_.textStartIndex;
      _loc3_.text = _loc5_.substring(0,_loc4_) + text + _loc5_.substring(_loc4_);
      return true;
   }
   function removeTextDataInRange(beginIndex, endIndex)
   {
      var _loc9_ = this.getTextDataInRange(beginIndex,endIndex);
      if(_loc9_ && _loc9_.length > 0)
      {
         var _loc7_ = 0;
         var _loc6_ = undefined;
         var _loc2_ = undefined;
         var _loc3_ = undefined;
         var _loc8_ = _loc9_.length;
         while((_loc8_ = _loc8_ - 1) >= 0)
         {
            _loc2_ = (g4.view.chat.TextDataResult)_loc9_[_loc8_];
            _loc3_ = g4.view.chat.ChatInput.getActualTextLength(_loc2_.textData);
            if(_loc2_.textStartIndex >= beginIndex && _loc2_.textStartIndex + _loc3_ <= endIndex)
            {
               this.textDataList.splice(_loc2_.itemIndex,1);
               _loc7_ = _loc7_ + _loc3_;
            }
            else if(beginIndex >= _loc2_.textStartIndex && endIndex <= _loc2_.textStartIndex + _loc3_)
            {
               if(_loc2_.textData.link)
               {
                  this.textDataList.splice(_loc2_.itemIndex,1);
                  _loc7_ = _loc7_ + _loc3_;
               }
               else
               {
                  _loc6_ = _loc2_.textData.text;
                  _loc2_.textData.text = _loc6_.substring(0,beginIndex - _loc2_.textStartIndex) + _loc6_.substring(endIndex - _loc2_.textStartIndex);
                  _loc7_ = _loc7_ + (endIndex - beginIndex);
               }
            }
            else if(beginIndex >= _loc2_.textStartIndex && beginIndex < _loc2_.textStartIndex + _loc3_)
            {
               if(_loc2_.textData.link)
               {
                  this.textDataList.splice(_loc2_.itemIndex,1);
                  _loc7_ = _loc7_ + _loc3_;
               }
               else
               {
                  _loc6_ = _loc2_.textData.text;
                  _loc2_.textData.text = _loc6_.substring(0,beginIndex - _loc2_.textStartIndex);
                  _loc7_ = _loc7_ + (_loc6_.length - (beginIndex - _loc2_.textStartIndex));
               }
            }
            else if(endIndex > _loc2_.textStartIndex && endIndex <= _loc2_.textStartIndex + _loc3_)
            {
               if(_loc2_.textData.link)
               {
                  this.textDataList.splice(_loc2_.itemIndex,1);
                  _loc7_ = _loc7_ + _loc3_;
               }
               else
               {
                  _loc6_ = _loc2_.textData.text;
                  _loc2_.textData.text = _loc6_.substring(endIndex - _loc2_.textStartIndex);
                  _loc7_ = _loc7_ + (endIndex - _loc2_.textStartIndex);
               }
            }
            else
            {
               return 0;
            }
         }
         return _loc7_;
      }
      return 0;
   }
   function getNormalTextDataAt(index)
   {
      var _loc3_ = undefined;
      var _loc10_ = 0;
      var _loc6_ = -1;
      var _loc2_ = undefined;
      var _loc11_ = this.textDataList.length;
      if(_loc11_ > 0)
      {
         var _loc8_ = undefined;
         var _loc5_ = undefined;
         var _loc4_ = 0;
         var _loc7_ = undefined;
         _loc2_ = 0;
         while(_loc2_ < _loc11_)
         {
            _loc8_ = (g4.view.chat.TextData)this.textDataList[_loc2_];
            _loc7_ = _loc4_ + g4.view.chat.ChatInput.getActualTextLength(_loc8_);
            if(index >= _loc4_ && index <= _loc7_)
            {
               if(_loc8_.link)
               {
                  if(index == _loc4_)
                  {
                     if(_loc2_ > 0)
                     {
                        _loc5_ = (g4.view.chat.TextData)this.textDataList[_loc2_ - 1];
                        if(!_loc5_.link)
                        {
                           _loc3_ = _loc5_;
                           _loc6_ = _loc2_ - 1;
                        }
                     }
                     if(!_loc3_)
                     {
                        _loc3_ = new g4.view.chat.TextData();
                        this.textDataList.splice(_loc2_,0,_loc3_);
                        _loc6_ = _loc2_;
                     }
                     _loc10_ = _loc4_;
                  }
                  else if(index == _loc7_)
                  {
                     if(_loc2_ + 1 < _loc11_)
                     {
                        _loc5_ = (g4.view.chat.TextData)this.textDataList[_loc2_ + 1];
                        if(!_loc5_.link)
                        {
                           _loc3_ = _loc5_;
                           _loc6_ = _loc2_ + 1;
                        }
                     }
                     if(!_loc3_)
                     {
                        _loc3_ = new g4.view.chat.TextData();
                        this.textDataList.splice(_loc2_ + 1,0,_loc3_);
                        _loc6_ = _loc2_ + 1;
                     }
                     _loc10_ = _loc7_;
                  }
               }
               else
               {
                  _loc3_ = _loc8_;
                  _loc6_ = _loc2_;
                  _loc10_ = _loc4_;
               }
               break;
            }
            _loc4_ = _loc7_;
            _loc2_ = _loc2_ + 1;
         }
      }
      else
      {
         _loc3_ = new g4.view.chat.TextData();
         this.textDataList.splice(0,0,_loc3_);
         _loc6_ = 0;
      }
      var _loc12_ = new g4.view.chat.TextDataResult();
      _loc12_.textData = _loc3_;
      _loc12_.textStartIndex = _loc10_;
      _loc12_.itemIndex = _loc6_;
      return _loc12_;
   }
   function getTextDataInRange(beginIndex, endIndex)
   {
      if(beginIndex >= endIndex)
      {
         return null;
      }
      var _loc10_ = this.textDataList.length;
      if(_loc10_ > 0)
      {
         var _loc9_ = [];
         var _loc2_ = 0;
         var _loc3_ = undefined;
         var _loc8_ = undefined;
         var _loc6_ = undefined;
         _loc6_ = 0;
         while(_loc6_ < _loc10_)
         {
            _loc8_ = (g4.view.chat.TextData)this.textDataList[_loc6_];
            _loc3_ = _loc2_ + g4.view.chat.ChatInput.getActualTextLength(_loc8_);
            if(_loc2_ >= beginIndex && _loc3_ <= endIndex || beginIndex >= _loc2_ && endIndex <= _loc3_ || beginIndex >= _loc2_ && beginIndex < _loc3_ || endIndex > _loc2_ && endIndex <= _loc3_)
            {
               var _loc4_ = new g4.view.chat.TextDataResult();
               _loc4_.textData = _loc8_;
               _loc4_.textStartIndex = _loc2_;
               _loc4_.itemIndex = _loc6_;
               _loc9_.push(_loc4_);
            }
            _loc2_ = _loc3_;
            if(_loc2_ >= endIndex)
            {
               break;
            }
            _loc6_ = _loc6_ + 1;
         }
         if(_loc9_ && _loc9_.length > 0)
         {
            return _loc9_;
         }
      }
      return null;
   }
   function optimizeTextDataList()
   {
      var _loc2_ = this.textDataList.length;
      while((_loc2_ = _loc2_ - 1) >= 0)
      {
         if(_loc2_ > 0 && !(g4.view.chat.TextData)this.textDataList[_loc2_].link && !(g4.view.chat.TextData)this.textDataList[_loc2_ - 1].link)
         {
            (g4.view.chat.TextData)this.textDataList[_loc2_ - 1].text = (g4.view.chat.TextData)this.textDataList[_loc2_ - 1].text + (g4.view.chat.TextData)this.textDataList[_loc2_].text;
            this.textDataList.splice(_loc2_,1);
         }
      }
   }
   function moveCursorEnd()
   {
      this.moveCursorTo(this.getInputTextLength());
   }
   function moveCursorTo(index)
   {
      if(this.__get__inputMode())
      {
         this.setSelection(index,index);
      }
   }
   function setSelection(selectionBeginIndex, selectionEndIndex)
   {
      Selection.setSelection(selectionBeginIndex,selectionEndIndex);
      this.storeCursorStartPosition();
   }
   function adjustCursorPosition()
   {
      if(!this.__get__inputMode())
      {
         return undefined;
      }
      var _loc7_ = this.textField.caretIndex;
      var _loc4_ = Selection.getBeginIndex();
      var _loc5_ = Selection.getEndIndex();
      var _loc3_ = 0;
      var _loc6_ = undefined;
      var _loc12_ = undefined;
      var _loc8_ = undefined;
      var _loc9_ = undefined;
      var _loc14_ = this.textDataList.length;
      _loc9_ = 0;
      while(_loc9_ < _loc14_)
      {
         _loc12_ = (g4.view.chat.TextData)this.textDataList[_loc9_];
         _loc8_ = g4.view.chat.ChatInput.getActualTextLength(_loc12_);
         if(_loc8_ > 0)
         {
            _loc6_ = _loc3_ + _loc8_;
            if(_loc12_.link)
            {
               var _loc10_ = _loc4_ > _loc3_ && _loc4_ < _loc6_;
               var _loc11_ = _loc5_ > _loc3_ && _loc5_ < _loc6_;
               if(_loc10_ || _loc11_)
               {
                  var _loc2_ = _loc6_;
                  if(this.mouseDowned)
                  {
                     var _loc13_ = _loc7_ - _loc3_;
                     if(_loc13_ > _loc8_ / 2)
                     {
                        _loc2_ = _loc6_;
                     }
                     else
                     {
                        _loc2_ = _loc3_;
                     }
                     if(_loc4_ == _loc5_)
                     {
                        this.setSelection(_loc2_,_loc2_);
                     }
                     else if(_loc7_ > _loc4_)
                     {
                        if(_loc10_)
                        {
                           this.setSelection(_loc3_,_loc6_);
                        }
                        else
                        {
                           this.setSelection(_loc4_,_loc2_);
                        }
                     }
                     else if(_loc11_)
                     {
                        this.setSelection(_loc6_,_loc3_);
                     }
                     else
                     {
                        this.setSelection(_loc5_,_loc2_);
                     }
                  }
                  else
                  {
                     if(Key.isDown(37))
                     {
                        _loc2_ = _loc3_;
                     }
                     if(Key.isDown(16))
                     {
                        if(Key.isDown(37))
                        {
                           if(_loc7_ == _loc4_)
                           {
                              this.setSelection(_loc5_,_loc2_);
                           }
                           else
                           {
                              this.setSelection(_loc4_,_loc2_);
                           }
                        }
                        else if(Key.isDown(39))
                        {
                           if(_loc7_ == _loc5_)
                           {
                              this.setSelection(_loc4_,_loc2_);
                           }
                           else
                           {
                              this.setSelection(_loc5_,_loc2_);
                           }
                        }
                     }
                     else if(_loc4_ != _loc5_)
                     {
                        this.setSelection(_loc3_,_loc6_);
                     }
                     else
                     {
                        this.setSelection(_loc2_,_loc2_);
                     }
                  }
                  return undefined;
               }
            }
            _loc3_ = _loc6_;
            if(_loc3_ >= _loc5_)
            {
               return undefined;
            }
         }
         _loc9_ = _loc9_ + 1;
      }
   }
   function startCursorCheck()
   {
      if(this.intervalID == -1)
      {
         this.intervalID = setInterval(this,"enterFrameHandler",10);
      }
   }
   function stopCursorCheck()
   {
      if(this.intervalID != -1)
      {
         clearInterval(this.intervalID);
         this.intervalID = -1;
      }
   }
   function enterFrameHandler()
   {
      if(this.mouseDowned)
      {
         return undefined;
      }
      this.adjustCursorPosition();
   }
   function escapeHtml(text)
   {
      text = text.split("&").join("&amp;");
      text = text.split("<").join("&lt;");
      text = text.split(">").join("&gt;");
      return text;
   }
   function generateFontTag(text, color)
   {
      return "<font color=\"#" + color.toString(16).toUpperCase() + "\">" + text + "</font>";
   }
   function generateChatLinkAction(text, linkType, linkData, color)
   {
      text = this.escapeHtml(text);
      var _loc4_ = "chatLinkAction";
      var _loc5_ = linkType + "#####" + linkData + "{" + text + "}";
      var _loc3_ = g4.view.chat.ChatInput.convertActualTextForLink(text);
      var _loc6_ = "<a href=\"asfunction:" + _loc4_ + "," + _loc5_ + "\">" + _loc3_ + "</a>";
      return this.generateFontTag(_loc6_,color);
   }
   function getCurrentTextColor()
   {
      var _loc2_ = this.getSelectedChannelData();
      return _loc2_.color;
   }
   function getLinkTextByLinkType(linkType)
   {
      switch(linkType)
      {
         case 1:
            return Number(lib.info.TextColor.CHAT_LINK_ITEM);
         case 2:
            return Number(lib.info.TextColor.CHAT_LINK_QUEST);
         case 3:
            return Number(lib.info.TextColor.CHAT_LINK_MARKER);
         case 4:
            return Number(lib.info.TextColor.CHAT_LINK_BARGAIN);
         case 5:
            return Number(lib.info.TextColor.CHAT_LINK_SEARCH_PARTY);
         default:
            return 16777215;
      }
   }
   function getLinkTextColorByItemGrade(itemGrade)
   {
      switch(itemGrade)
      {
         case 0:
            return lib.info.TextColor.RAREGRADE0;
         case 1:
            return lib.info.TextColor.RAREGRADE1;
         case 2:
            return lib.info.TextColor.RAREGRADE2;
         case 3:
            return lib.info.TextColor.RAREGRADE3;
         default:
            return 16777215;
      }
   }
   function onKeyDownHandler()
   {
      var _loc3_ = Key.getCode();
      if(!this.__get__inputMode())
      {
         if(_loc3_ == 191)
         {
            if(!_global.inputing && !_global.chating)
            {
               this.initInputText("/");
               g4.model.GameModel.chatModel.setInputFocus(true);
            }
         }
         return undefined;
      }
      this.storeCursorStartPosition();
      var _loc4_ = this.isEmptyInputText();
      if(_loc3_ == 13)
      {
         this.sendInputText();
         return undefined;
      }
      if(_loc3_ == 27)
      {
         if(this.__get__inputMode())
         {
            g4.model.GameModel.chatModel.setInputFocus(false);
         }
      }
      else if(_loc3_ == 38)
      {
         if(g4.model.GameModel.chatModel.__get__isWhisperMode())
         {
            g4.model.GameModel.chatModel.rotateWhisperTarget(true);
         }
         else
         {
            this.rotateRecentMessage(false);
         }
      }
      else if(_loc3_ == 40)
      {
         if(g4.model.GameModel.chatModel.__get__isWhisperMode())
         {
            g4.model.GameModel.chatModel.rotateWhisperTarget(false);
         }
         else
         {
            this.rotateRecentMessage(true);
         }
      }
      else if(_loc3_ == 37)
      {
         if(_loc4_)
         {
            g4.model.GameModel.chatModel.rotateInputChannel(false);
         }
      }
      else if(_loc3_ == 39)
      {
         if(_loc4_)
         {
            g4.model.GameModel.chatModel.rotateInputChannel(true);
         }
      }
      else if(_loc3_ == 9)
      {
         g4.model.GameModel.chatModel.rotateMainChatTab(!Key.isDown(16));
      }
   }
   function textField_onSetFocusHandler()
   {
      this.afterFocusOn();
   }
   function textField_onKillFocusHandler()
   {
      this.afterFocusOff();
   }
   function textField_onChangedHandler()
   {
      this.storeCurrentTextProps();
      this.adjustInputText();
      var _loc2_ = this.getInputText();
      if(_loc2_.substr(0,1) == "/" && _loc2_.substr(_loc2_.length - 1,1) == " ")
      {
         g4.model.GameModel.chatModel.ToGame_Chat_RequestSlashCommand(_loc2_);
      }
   }
   function onMouseDown()
   {
      if(this.mc_text_field.hitTest(_root._xmouse,_root._ymouse,false))
      {
         this.mouseDowned = true;
         this.onMouseMove = gfx.utils.Delegate.create(this,this.mouseMoveHandler);
         this.onMouseUp = gfx.utils.Delegate.create(this,this.mouseUpHandler);
         if(this.__get__inputMode())
         {
            this.adjustCursorPosition();
         }
         this.storeCursorStartPosition();
      }
   }
   function mouseMoveHandler()
   {
      this.adjustCursorPosition();
   }
   function mouseUpHandler()
   {
      this.adjustCursorPosition();
      this.mouseDowned = false;
      delete this.onMouseMove;
      delete this.onMouseUp;
   }
   function model_mainUIModeChangeHandler(event)
   {
      if(!g4.model.GameModel.mainModel.uiMode)
      {
         g4.model.GameModel.chatModel.setInputFocus(false);
      }
   }
   function model_chatInputFocusHandler(event)
   {
      this.setInputFocus(event.data.focus);
   }
   function model_chatResizingStartHandler(event)
   {
   }
   function model_chatResizingEndHandler(event)
   {
      if(this.isInputFieldShown())
      {
         g4.model.GameModel.chatModel.setInputFocus(true);
      }
   }
   function model_chatLanguageChangeHandler(event)
   {
      this.updateByLanguage();
   }
   function model_chatChannelDataChangeHandler(event)
   {
      this.updateByChannelData();
   }
   function model_chatSelectedChannelChangeHandler(event)
   {
      this.updateBySelectedChannel();
   }
   function model_chatWhisperTargetChangeHandler(event)
   {
      this.updateByWhisperMode();
   }
   function model_chatCleanUpInputHandler(event)
   {
      this.initInputText();
   }
   function model_chatAddInputTextHandler(event)
   {
      this.addInputText(event.data.text);
   }
   function model_chatAddLinkHandler(event)
   {
      this.addLink(event.data.linkType,event.data.linkData,event.data.text,event.data.itemGrade);
   }
}
