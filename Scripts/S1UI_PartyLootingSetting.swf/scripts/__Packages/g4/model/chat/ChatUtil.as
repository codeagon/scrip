class g4.model.chat.ChatUtil
{
   static var initialized = false;
   static var chatContentFontSize = 12;
   static var chatContentLeading = 0;
   function ChatUtil()
   {
   }
   static function initialize()
   {
      if(g4.model.chat.ChatUtil.initialized)
      {
         return undefined;
      }
      g4.model.chat.ChatUtil.initialized = true;
      g4.model.chat.ChatUtil.textFieldForConvert = _root.createTextField("textFieldForConvert",_root.getNextHighestDepth(),0,0,0,0);
      g4.model.chat.ChatUtil.textFieldForConvert.html = true;
      g4.model.chat.ChatUtil.textFieldForConvert._visible = false;
   }
   static function convertChatMessage(channelID, writing, id, addParam, tabIDList, wisperType)
   {
      var _loc3_ = id;
      if(_loc3_.indexOf("\'") != -1)
      {
         _loc3_ = lib.util.ExtString.replace(_loc3_,"\'","&&&;",false);
      }
      var _loc2_ = "";
      var _loc8_ = "";
      switch(addParam)
      {
         case 1:
            _loc8_ = "<img src=\'\' width=\'18\' height=\'18\' vspace=\'-7\'>";
            break;
         case 2:
            _loc8_ = "<img src=\'Icon_GM\' width=\'18\' height=\'18\' vspace=\'-5\'>";
            break;
         case 3:
            _loc8_ = "<img src=\'Icon_OldUser\' width=\'18\' height=\'18\' vspace=\'-5\'>";
            break;
         case 4:
            _loc2_ = "<img src=\'Icon_Shout\' width=\'18\' height=\'18\' vspace=\'-4\'>";
            break;
         case 5:
            _loc2_ = "<img src=\'Icon_Whisper\' width=\'18\' height=\'18\' vspace=\'-4\'>";
      }
      var _loc10_ = "[" + _loc8_ + id + "]";
      var _loc5_ = undefined;
      var _loc1_ = g4.model.GameModel.chatModel.getChatChannelData(channelID);
      if(_loc1_.type == g4.model.GameConstants.CHAT_CHANNEL_TYPE_WHISPER)
      {
         var _loc6_ = "";
         if(wisperType == 0)
         {
            _loc6_ = "[" + lib.util.UIString.getUIString("$031085") + " " + _loc1_.name + "]";
            _loc5_ = _loc6_ + g4.model.chat.ChatUtil.generateChatNameAction(_loc10_,_loc3_,channelID,writing) + lib.util.UIString.getUIString("$031087") + " : ";
            _loc2_ = _loc2_ + g4.model.chat.ChatUtil.generateFontTag(_loc5_,_loc1_.shapColor);
            g4.model.GameModel.chatModel.addWhisperID(id);
         }
         else
         {
            _loc6_ = "[" + lib.util.UIString.getUIString("$031086") + " " + _loc1_.name + "]";
            _loc5_ = _loc6_ + g4.model.chat.ChatUtil.generateChatNameAction(_loc10_,_loc3_,channelID,writing) + lib.util.UIString.getUIString("$031087") + " : ";
            _loc2_ = _loc2_ + g4.model.chat.ChatUtil.generateFontTag(_loc5_,_loc1_.shapColor);
            _loc2_ = "   " + _loc2_;
            g4.model.GameModel.chatModel.addWhisperID(id);
         }
      }
      else
      {
         if(_loc1_.showChannelName)
         {
            _loc2_ = _loc2_ + g4.model.chat.ChatUtil.generateFontTag("[" + _loc1_.name + "]",_loc1_.shapColor);
         }
         if(_loc1_.needLink)
         {
            if(id != undefined && id != "")
            {
               _loc5_ = g4.model.chat.ChatUtil.generateChatNameAction(_loc10_,_loc3_,channelID,writing) + " : ";
               _loc2_ = _loc2_ + g4.model.chat.ChatUtil.generateFontTag(_loc5_,_loc1_.shapColor);
            }
         }
      }
      if(_loc1_.needHTML)
      {
         _loc2_ = _loc2_ + g4.model.chat.ChatUtil.calcHtmlText(writing,true,channelID);
      }
      else
      {
         _loc2_ = _loc2_ + g4.model.chat.ChatUtil.generateFontTag(writing,_loc1_.shapColor);
      }
      return g4.model.chat.ChatUtil.convertChatMessage2(channelID,_loc2_,id,addParam,tabIDList,wisperType);
   }
   static function convertChatMessage2(channelID, msgs, id, addParam, tabIDList, wisperType)
   {
      if(id.indexOf("\'") != -1)
      {
         id = lib.util.ExtString.replace(id,"\'","",false);
      }
      var _loc13_ = "";
      switch(addParam)
      {
         case 1:
            _loc13_ = "<img src=\'Icon_bless_Seren\' width=\'18\' height=\'18\' vspace=\'-7\'>";
            break;
         case 2:
            _loc13_ = "<img src=\'Icon_GM\' width=\'18\' height=\'18\' vspace=\'-5\'>";
            break;
         case 3:
            _loc13_ = "<img src=\'Icon_OldUser\' width=\'18\' height=\'18\' vspace=\'-5\'>";
      }
      var _loc9_ = "[" + _loc13_ + id + "]";
      var _loc6_ = undefined;
      var _loc2_ = g4.model.GameModel.chatModel.getChatChannelData(channelID);
      var _loc10_ = msgs.split("\n");
      var _loc14_ = 0;
      var _loc5_ = undefined;
      var _loc11_ = _loc10_.length;
      _loc5_ = 0;
      while(_loc5_ < _loc11_)
      {
         var _loc1_ = _loc10_[_loc5_];
         if(_loc5_ >= 1)
         {
            var _loc3_ = "";
            if(_loc2_.type == 1)
            {
               var _loc7_ = undefined;
               if(wisperType == 0)
               {
                  _loc7_ = "[" + lib.util.UIString.getUIString("$031008") + "]";
                  _loc6_ = _loc7_ + g4.model.chat.ChatUtil.generateChatNameAction(_loc9_,id,channelID,_loc1_) + lib.util.UIString.getUIString("$031087") + " : ";
                  _loc3_ = g4.model.chat.ChatUtil.generateFontTag(_loc6_,_loc2_.shapColor);
                  g4.model.GameModel.chatModel.addWhisperID(id);
               }
               else
               {
                  _loc7_ = "[" + lib.util.UIString.getUIString("$031009") + "]";
                  _loc6_ = _loc7_ + g4.model.chat.ChatUtil.generateChatNameAction(_loc9_,id,channelID,_loc1_) + lib.util.UIString.getUIString("$031087") + " : ";
                  _loc3_ = g4.model.chat.ChatUtil.generateFontTag(_loc6_,_loc2_.shapColor);
                  _loc3_ = "   " + _loc3_;
                  g4.model.GameModel.chatModel.addWhisperID(id);
               }
            }
            else
            {
               if(_loc2_.showChannelName)
               {
                  _loc3_ = g4.model.chat.ChatUtil.generateFontTag("[" + _loc2_.name + "]",_loc2_.shapColor);
               }
               if(_loc2_.needLink)
               {
                  if(id != undefined && id != "")
                  {
                     _loc6_ = g4.model.chat.ChatUtil.generateChatNameAction(_loc9_,id,channelID,_loc1_) + " : ";
                     _loc3_ = _loc3_ + g4.model.chat.ChatUtil.generateFontTag(_loc6_,_loc2_.shapColor);
                  }
               }
            }
            if(_loc2_.needHTML)
            {
               _loc1_ = _loc3_ + g4.model.chat.ChatUtil.calcHtmlText(_loc1_,true,channelID);
            }
            else
            {
               _loc1_ = _loc3_ + g4.model.chat.ChatUtil.generateFontTag(_loc1_,_loc2_.shapColor);
            }
         }
         _loc1_ = g4.model.chat.ChatUtil.generateFontTagWithSize(_loc1_,g4.model.chat.ChatUtil.chatContentFontSize);
         _loc1_ = _loc1_ + "\n";
         _loc10_[_loc5_] = _loc1_;
         _loc5_ = _loc5_ + 1;
      }
      return _loc10_;
   }
   static function calcHtmlText(htmlStr, isReceiveMessage, channelID)
   {
      htmlStr = lib.util.ExtString.replace(htmlStr,"<img","{@img#}",false);
      htmlStr = lib.util.ExtString.replace(htmlStr,"/>","{@img/#}",false);
      var _loc7_ = lib.util.ExtString.split(htmlStr,"<FONT");
      var _loc6_ = _loc7_.length;
      if(isNaN(_loc6_))
      {
         _loc6_ = 1;
      }
      var _loc3_ = "";
      var _loc4_ = undefined;
      _loc4_ = 0;
      while(_loc4_ < _loc6_)
      {
         var _loc2_ = "<FONT" + _loc7_[_loc4_];
         var _loc1_ = g4.model.chat.ChatUtil.convertHTMLTextToPlainText(_loc2_);
         if(_loc1_ != "")
         {
            if(_loc1_.indexOf("<") != -1)
            {
               _loc1_ = lib.util.ExtString.replace(_loc1_,"<","&lt;",false);
            }
            if(_loc1_.indexOf(">") != -1)
            {
               _loc1_ = lib.util.ExtString.replace(_loc1_,">","&gt;",false);
            }
            if(_loc2_.indexOf("chatLinkAction") == -1)
            {
               if(isReceiveMessage)
               {
                  var _loc5_ = g4.model.GameModel.chatModel.getChatChannelData(channelID);
                  _loc3_ = _loc3_ + ("<FONT size=\'" + g4.model.chat.ChatUtil.chatContentFontSize + "\' color=\'" + _loc5_.shapColor + "\'>" + _loc1_ + "</FONT>");
               }
               else
               {
                  _loc3_ = _loc3_ + ("<FONT>" + _loc1_ + "</FONT>");
               }
            }
            else
            {
               _loc3_ = _loc3_ + _loc2_;
            }
         }
         _loc4_ = _loc4_ + 1;
      }
      _loc3_ = lib.util.ExtString.replace(_loc3_,"{@img#}","<img",false);
      _loc3_ = lib.util.ExtString.replace(_loc3_,"{@img/#}","/>",false);
      return _loc3_;
   }
   static function html_To_NotHtml(text)
   {
      text = g4.model.chat.ChatUtil.convertHTMLTextToPlainText(text);
      if(text.indexOf("<") != -1)
      {
         text = lib.util.ExtString.replace(text,"<","&lt;",false);
      }
      if(text.indexOf(">") != -1)
      {
         text = lib.util.ExtString.replace(text,">","&gt;",false);
      }
      if(text.indexOf("\'") != -1)
      {
         text = lib.util.ExtString.replace(text,"\'","&&&;",false);
      }
      return text;
   }
   static function convertHTMLTextToPlainText(text)
   {
      g4.model.chat.ChatUtil.textFieldForConvert.htmlText = text;
      return g4.model.chat.ChatUtil.textFieldForConvert.text;
   }
   static function generateFontTag(text, color)
   {
      return "<font color=\"" + color + "\">" + text + "</font>";
   }
   static function generateFontTagWithSize(text, size)
   {
      return "<TEXTFORMAT INDENT=\"0\" LEFTMARGIN=\"0\" RIGHTMARGIN=\"0\" LEADING=\"" + g4.model.chat.ChatUtil.chatContentLeading + "\">" + "<font size=\"" + size + "\">" + text + "</font>" + "</TEXTFORMAT>";
   }
   static function generateChatNameAction(linkText, userID, channelID, chattingMessage)
   {
      return "<a href=\"asfunction:chatNameAction," + userID + "@" + channelID + "@" + g4.model.chat.ChatUtil.html_To_NotHtml(chattingMessage) + "\">" + linkText + "</a>";
   }
}
