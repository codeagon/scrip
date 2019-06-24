class g4.view.chat.TextArea extends g4.core.SimpleView
{
   var textFieldOffsetX = 0;
   var textFieldOffsetY = 0;
   var scrollBarOffsetY = 0;
   function TextArea(textField, scrollBar, scrollBarHeight)
   {
      super(null);
      this.textField = textField;
      this.scrollBar = scrollBar;
      this.scrollBarOffsetY = scrollBarHeight - g4.view.chat.ChatConstants.STYLE_CHAT_BASE_HEIGHT;
      this.configUI();
   }
   function configUI()
   {
      this.textField.multiline = true;
      this.textField.wordWrap = true;
      this.textField.html = true;
      var _loc2_ = new TextFormat();
      _loc2_.letterSpacing = 0;
      this.textField.setNewTextFormat(_loc2_);
      g4.util.UIUtil.setTextFieldStyle(this.textField,g4.util.UIUtil.TEXT_FIELD_STYLE_1);
      this.textFieldOffsetX = this.textField._width - g4.view.chat.ChatConstants.STYLE_CHAT_BASE_WIDTH;
      this.textFieldOffsetY = this.textField._height - g4.view.chat.ChatConstants.STYLE_CHAT_BASE_HEIGHT;
      var _loc3_ = {};
      _loc3_.onScroll = gfx.utils.Delegate.create(this,function(delta)
      {
         if(delta < 0)
         {
            this.textField.scroll = this.textField.scroll + 1;
         }
         else
         {
            this.textField.scroll = this.textField.scroll - 1;
         }
      }
      );
      this.scrollBar.addListener(_loc3_);
      this.scrollBar.defaultBarSizeRatio = 0.3333333333333333;
      this.scrollBar.setTextField(this.textField);
      this.scrollBar.setWheel(this.textField);
      this.scrollBar.onMaxScroll = gfx.utils.Delegate.create(this,function()
      {
         this.scrollBar.glow = false;
      }
      );
      this.scrollBar.hideBg();
   }
   function updateByData(data)
   {
      this.textField.fontScaleFactor = data.fontSize;
   }
   function setWholeChat(text)
   {
      this.textField.htmlText = text;
      this.updateAfterTextFieldChanged(true);
   }
   function updateAfterTextFieldChanged(bScrollToBottommost)
   {
      var _loc2_ = this.scrollBar.__get__scroll() >= this.scrollBar.__get__scrollMax();
      this.scrollBar.__set__scrollMax(this.textField.maxscroll - 1);
      if(bScrollToBottommost || _loc2_)
      {
         this.scrollToBottommost();
      }
      else
      {
         this.scrollBar.__set__glow(true);
      }
      this.updateScrollBarVisible();
   }
   function scrollToBottommost()
   {
      this.scrollBar.__set__scroll(this.scrollBar.scrollMax);
   }
   function addChat(chatTextArray, clear)
   {
      if(chatTextArray == null || chatTextArray.length == 0)
      {
         return undefined;
      }
      var _loc2_ = undefined;
      var _loc4_ = chatTextArray.length;
      _loc2_ = 0;
      while(_loc2_ < _loc4_)
      {
         this.textField.appendHtml(chatTextArray[_loc2_]);
         _loc2_ = _loc2_ + 1;
      }
      if(clear)
      {
         this.textField.wordWrap = false;
         var _loc5_ = this.textField.getLineOffset(g4.model.GameConstants.CHAT_LINE_CLEAR);
         this.textField.replaceText(0,_loc5_,"");
         this.textField.wordWrap = true;
      }
      this.updateAfterTextFieldChanged(false);
   }
   function setSize(w, h)
   {
      this.textField._width = w + this.textFieldOffsetX;
      this.textField._height = h + this.textFieldOffsetY;
      this.scrollBar.resize(h + this.scrollBarOffsetY);
      this.updateAfterTextFieldChanged(true);
   }
   function updateByUIMode()
   {
      this.updateScrollBarVisible();
   }
   function updateScrollBarVisible()
   {
      var _loc2_ = g4.model.GameModel.mainModel.uiMode && this.scrollBar.__get__scrollMax() > 0;
      this.scrollBar.setVisible(_loc2_);
   }
}
