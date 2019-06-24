var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
var UI = this;
var BATTLE_FIELD_TYPE_HONOR = 0;
var BATTLE_FIELD_TYPE_FIGHTING_SPIRIT = 1;
var BATTLE_FIELD_TYPE_SATURATION = 2;
var BATTLE_FIELD_TYPE_KUMAS = 3;
var BATTLE_FIELD_TYPE_PVE = 4;
var BATTLE_FIELD_TYPE_CONFUSION = 5;
var BATTLE_FIELD_TYPE_KUMAS_RENEWAL = 6;
var mRewardMessage = UI.mRewardMessage;
questTaskMessageContainer.hitTestDisable = true;
sectionNameMessageContainer.hitTestDisable = true;
g4.util.UIUtil.setTextFieldStyle(sectionNameMessageContainer.txt,g4.util.UIUtil.TEXT_FIELD_STYLE_1);
g4.util.UIUtil.setTextFieldStyle(sectionNameMessageContainer.txt2,g4.util.UIUtil.TEXT_FIELD_STYLE_1);
tutorialMessageContainer.hitTestDisable = true;
emblemMessageContainer.bg.hitTestDisable = true;
movieMessageContainer.hitTestDisable = true;
loadingMessageContainer.hitTestDisable = true;
shieldDefenceMessageContainer.hitTestDisable = true;
bfMessageContainer.hitTestDisable = true;
bfContainer.hitTestDisable = true;
klContainer.hitTestDisable = true;
lockOnContainer.hitTestDisable = true;
guardNameMessageContainer.hitTestDisable = true;
npcMsgContainer.hitTestDisable = true;
questTaskMessageContainer.txt.autoSize = true;
sectionNameMessageContainer.txt.autoSize = true;
shieldDefenceMessageContainer.txt.autoSize = true;
itemNeedMessageContainer.txt.autoSize = true;
questTaskMessageContainer.txt.htmlText = "";
sectionNameMessageContainer.txt.htmlText = "";
tutorialMessageContainer.txt.htmlText = "";
emblemMessageContainer.txt_mc.txt.htmlText = "";
movieMessageContainer.txt.htmlText = "";
loadingMessageContainer.txt.htmlText = "";
itemNeedMessageContainer.txt.htmlText = "";
guardNameMessageContainer.txt.htmlText = "";
guardNameMessageContainer.txt2.htmlText = "";
loadingMessageContainer.txt.textAutoSize = "shrink";
loadingMessageContainer.txt.verticalAlign = "top";
movieMessageContainer.txt.textAutoSize = "shrink";
movieMessageContainer.txt.verticalAlign = "top";
tutorialMsgContainer._visible = false;
g4.util.UIUtil.setTextFieldStyle(mLockOn.mText.textField,g4.util.UIUtil.TEXT_FIELD_STYLE_1);
mLockOn.type = 44;
mLockOn._visible = false;
mLockOn.gotoAndStop(1);
var customStaticMsgId = -9999;
var bShowType4 = 1;
var bShowType5 = 1;
var bShowType6 = 1;
var bShowType9 = 1;
var bShowType11 = 1;
var bShowType18 = 1;
var bShowChatWhisper = 1;
var bShowDebuffMsg = 1;
var prevMessage = "";
var prevImportantMessage = "";
var linesY_BFarray = [0,-40,-80,-120];
var customizeData = lib.gamedata.CustomizedUIDataCollection.getInstance();
customizeData.valueOf(lib.gamedata.CustomizedUIDataKey.CHAT_WHISPER_VISIBLE,this,"chatWhisperHandler");
customizeData.valueOf(lib.gamedata.CustomizedUIDataKey.MESSAGE_TYPE4_VISIBLE,this,"messageType4Handler");
customizeData.valueOf(lib.gamedata.CustomizedUIDataKey.MESSAGE_TYPE5_VISIBLE,this,"messageType5Handler");
customizeData.valueOf(lib.gamedata.CustomizedUIDataKey.MESSAGE_TYPE6_VISIBLE,this,"messageType6Handler");
customizeData.valueOf(lib.gamedata.CustomizedUIDataKey.MESSAGE_TYPE9_VISIBLE,this,"messageType9Handler");
customizeData.valueOf(lib.gamedata.CustomizedUIDataKey.MESSAGE_TYPEB_VISIBLE,this,"messageType11Handler");
customizeData.valueOf(lib.gamedata.CustomizedUIDataKey.MESSAGE_TYPEI_VISIBLE,this,"messageType18Handler");
customizeData.valueOf(lib.gamedata.CustomizedUIDataKey.ABNORMALITY_DEBUFFSHOW_BOOLEAN,this,"debuffMsgHandler");
customizeData.addEventListener(gfx.events.EventTypes.VALUE_CHANGE,this,"valueChangeHandler");
var NameTextLength_Local = 0;
var totalMsg_array = new Array();
myListener.testPosition = function(type, __x, __y)
{
   if(type == 0)
   {
      systemMessageContainer._visible = true;
      systemMessageContainer._x = lib.info.AlignInfo.xRatioToPixel(__x);
      systemMessageContainer._y = lib.info.AlignInfo.yRatioToPixel(__y);
   }
   else if(type == 1)
   {
      questTaskMessageContainer._visible = true;
      questTaskMessageContainer._x = lib.info.AlignInfo.xRatioToPixel(__x);
      questTaskMessageContainer._y = lib.info.AlignInfo.yRatioToPixel(__y);
   }
   else if(type == 2)
   {
      emblemMessageContainer._visible = true;
      emblemMessageContainer._y = lib.info.AlignInfo.yRatioToPixel(__y);
   }
   else if(type == 3)
   {
      movieMessageContainer._visible = true;
      movieMessageContainer._y = lib.info.AlignInfo.yRatioToPixel(__y);
   }
   else if(type == 4)
   {
      rootMessageContainer._visible = true;
      rootMessageContainer._x = lib.info.AlignInfo.xRatioToPixel(__x);
      rootMessageContainer._y = lib.info.AlignInfo.yRatioToPixel(__y);
   }
   else if(type == 5)
   {
      loadingMessageContainer._visible = true;
      loadingMessageContainer._x = lib.info.AlignInfo.xRatioToPixel(__x);
      loadingMessageContainer._y = lib.info.AlignInfo.yRatioToPixel(__y);
   }
   else if(type == 6)
   {
      tutorialMessageContainer._x = lib.info.AlignInfo.xRatioToPixel(__x);
      tutorialMessageContainer._y = lib.info.AlignInfo.yRatioToPixel(__y);
   }
   else if(type == 7)
   {
      staticMessageContainer._x = lib.info.AlignInfo.xRatioToPixel(__x);
      staticMessageContainer._y = lib.info.AlignInfo.yRatioToPixel(__y);
   }
   else if(type == 8)
   {
      shieldDefenceMessageContainer._x = lib.info.AlignInfo.xRatioToPixel(__x);
      shieldDefenceMessageContainer._y = lib.info.AlignInfo.yRatioToPixel(__y);
   }
   else if(type == 9)
   {
      actionKeyMessageContainer._x = lib.info.AlignInfo.xRatioToPixel(__x);
      actionKeyMessageContainer._y = lib.info.AlignInfo.yRatioToPixel(__y);
   }
};
myListener.OnGame_ResetUIPosition = function()
{
};
var MESSAGE_TYPE_CITYWAR_DESTROY_BASE = 26;
var MESSAGE_TYPE_CITYWAR_START = 27;
var MESSAGE_TYPE_CITYWAR_END_WIN = 28;
var MESSAGE_TYPE_CITYWAR_END_FREE = 29;
var MESSAGE_TYPE_CITYWAR_BOSS_APPEAR = 30;
var MESSAGE_TYPE_CITYWAR_BOSS_DEATH = 31;
var MESSAGE_TYPE_GUILD_LEVEL_CHANGE = 32;
var MESSAGE_TYPE_GUILD_SKILL_LEARN = 33;
var MESSAGE_TYPE_GUILD_QUEST_START = 34;
var MESSAGE_TYPE_GUILD_QUEST_FAIL = 35;
var MESSAGE_TYPE_GUILD_QUEST_DONE = 36;
var MESSAGE_TYPE_GUILDWAR_DECLARE = 37;
var MESSAGE_TYPE_GUILDWAR_SURRENDER = 38;
var MESSAGE_TYPE_GUILDWAR_WITHDRAW = 39;
var MESSAGE_TYPE_GUILD_INCENTIVE = 40;
var MESSAGE_STYLE_CITYWAR_START = MESSAGE_TYPE_CITYWAR_DESTROY_BASE;
var MESSAGE_STYLE_CITYWAR_END = MESSAGE_TYPE_GUILD_INCENTIVE;
myListener.OnGame_Message_Add = function(type, id, msg, Arguments)
{
   type = Number(type);
   if(type == 0)
   {
      return undefined;
   }
   var addParam = Arguments.split("\t");
   if(type == 1)
   {
      if(prevMessage == msg)
      {
         return undefined;
      }
      prevMessage = msg;
      myListener.OnGame_SystemMessage_Add(msg,addParam[0],systemMessageContainer,maxLine);
   }
   else if(type == 2)
   {
      _root.OnGameEvent("OnGame_Chat_SetWriting",addParam[0],msg,addParam[1]);
   }
   else if(type == 3)
   {
      partyNotice(msg,16774538,staticMessageContainer,3,20);
   }
   else if(type == 4 && bShowType4)
   {
      var _loc38_ = showFKey(1,msg,addParam[0]);
      _loc38_.id = id;
   }
   else if(type == 5 && bShowType5)
   {
      showTutorialMsg(1,msg,Arguments);
   }
   else if(type == 6 && bShowType6)
   {
      _loc38_ = showOneLineMsg(sectionNameMessageContainer,1,function()
      {
         sectionNameMessageContainer.txt.text = msg;
         sectionNameMessageContainer.txt2.text = addParam[0];
         sectionNameMessageContainer.txt._x = (- sectionNameMessageContainer.txt._width) / 2;
         sectionNameMessageContainer.txt2._x = (- sectionNameMessageContainer.txt2._width) / 2;
      }
      );
   }
   else if(type == 7)
   {
      questTaskMessageContainer._visible = true;
      var _loc29_ = Number(addParam[0]);
      var _loc32_ = Number(addParam[1]);
      if(_loc29_ >= _loc32_)
      {
         lib.manager.UISound.play(lib.manager.UISound.QUEST_CHANGED);
      }
      else
      {
         lib.manager.UISound.play(lib.manager.UISound.QUEST_CHANGED);
      }
      var _loc37_ = msg + " &lt; " + _loc29_ + " / " + _loc32_ + " &gt;";
      myListener.OnGame_SystemMessage_Add(_loc37_,16177697,questTaskMessageContainer,3);
   }
   else if(type == 8)
   {
      mLevelUp.mText.gotoAndPlay(2);
   }
   else if(type == 9)
   {
      if(bShowType9)
      {
         achievementEffectType = Number(Arguments);
         unload(achievementEffectContainer);
         Arguments = Arguments != undefined?Arguments:0;
         addEmblemMsg(1,msg,9,Arguments);
      }
      else
      {
         achievementEffectType = Number(Arguments);
         unload(achievementEffectContainer);
         if(Arguments == "1" || Arguments == "2" || Arguments == "3")
         {
            achievementEffectContainer.loadMovie("/package/S1UIRES_Effect.AchievEffect_Rare.swf");
         }
         else if(Arguments == "7" || Arguments == "4" || Arguments == "5")
         {
            achievementEffectContainer.loadMovie("/package/S1UIRES_Effect.AchievEffect_Unique.swf");
         }
      }
   }
   else if(type == 10)
   {
      addEmblemMsg(1,msg,10);
      test5.text = msg;
   }
   else if(type == 11 && bShowType11)
   {
      mRewardMessage.Root_Item(addParam[0],addParam[1],addParam[2],addParam[3],addParam[4],addParam[5],addParam[6],addParam[7]);
   }
   else if(type == 12)
   {
      _loc38_ = addMovieMsg(1,msg);
      _loc38_.id = id;
   }
   else if(type == 13)
   {
      addEmblemMsg(1,msg,13);
   }
   else if(type == 14)
   {
      showLoadingMsg(id,msg);
   }
   else if(type == 15)
   {
      showDefenseMsg(true,msg,addParam[0]);
   }
   else if(type != 16)
   {
      if(type == 17)
      {
         _loc38_ = showItemNeedMsg(1,msg,Number(addParam[0]),addParam[1],addParam[2],addParam[3],addParam[4],addParam[5]);
         _loc38_.id = id;
      }
      else if(type == 18 && bShowType18)
      {
         _loc38_ = showOneLineMsg(guardNameMessageContainer,1,function()
         {
            guardNameMessageContainer.txt.text = msg;
            if(addParam[0] != "" && addParam[0] != undefined)
            {
               guardNameMessageContainer.txt2._visible = true;
               guardNameMessageContainer.crest_mc._visible = true;
               guardNameMessageContainer.txt2.text = "[ " + addParam[0] + " ]";
               var _loc1_ = lib.util.DrawBitmap.draw(guardNameMessageContainer.crest_mc.Icon,addParam[1],50,50);
               guardNameMessageContainer.txt2._width = guardNameMessageContainer.txt2.textWidth + 5;
               guardNameMessageContainer.txt2._x = (- guardNameMessageContainer.txt2._width) / 2;
            }
            else
            {
               guardNameMessageContainer.txt2._visible = false;
               guardNameMessageContainer.crest_mc._visible = false;
            }
            guardNameMessageContainer.txt._x = (- guardNameMessageContainer.txt._width) / 2;
         }
         );
      }
      else if(type == 19)
      {
         var _loc30_ = countDownContainer.getNextHighestDepth();
         var _loc24_ = undefined;
         if(Arguments == "1")
         {
            _loc24_ = countDownContainer.attachMovie("EventcountDownMessage","countDownMessage" + _loc30_,_loc30_);
            _loc24_._y = 150;
            _loc24_.count.gotoAndStop(Number(msg) + 1);
         }
         else
         {
            _loc24_ = countDownContainer.attachMovie("countDownMessage","countDownMessage" + _loc30_,_loc30_);
            _loc24_.countMc.txt.autoSize = "center";
            _loc24_.countMc.txt.verticalAlign = "center";
            _loc24_.countMc.txt.htmlText = msg;
         }
      }
      else if(type == 20)
      {
         _loc30_ = indunMessageContainer.getNextHighestDepth();
         var _loc36_ = "indunMessage";
         var _loc20_ = indunMessageContainer.attachMovie(_loc36_,"indunMessage" + _loc30_,_loc30_);
         _loc20_.mc0.txt.autoSize = "center";
         _loc20_.mc0.txt.verticalAlign = "center";
         _loc20_.mc0.txt.htmlText = msg;
         _loc20_.mc1.txt.autoSize = "center";
         _loc20_.mc1.txt.verticalAlign = "center";
         _loc20_.mc1.txt.htmlText = msg;
         _loc20_.mc2.txt.autoSize = "center";
         _loc20_.mc2.txt.verticalAlign = "center";
         _loc20_.mc2.txt.htmlText = msg;
      }
      else if(type == 21)
      {
         var _loc26_ = msg.split("\t");
         var _loc35_ = _loc26_[0];
         var _loc34_ = _loc26_[1];
         var _loc28_ = _loc26_[2];
         type = _loc26_[3];
         _loc30_ = popupMessageContainer.getNextHighestDepth();
         _loc36_ = "popupType" + type;
         var _loc8_ = popupMessageContainer.attachMovie(_loc36_,"popupMessage" + _loc30_,_loc30_);
         var _loc31_ = _loc8_.bodyMc._height;
         _loc8_.headTitleMc.txt.htmlText = _loc35_;
         _loc8_.bodyMc.txt.htmlText = _loc28_;
         _loc8_.bodyMc.txt._height = _loc8_.bodyMc.txt.textHeight + 4;
         if(type == "1")
         {
            _loc8_.titleMc.txt.textColor = 16775335;
         }
         _loc8_.titleMc.txt.setText(_loc34_);
         var _loc22_ = _loc8_.bodyMc.txt._y + _loc8_.bodyMc.txt._height + 5;
         if(_loc28_ == "" || _loc28_ == undefined)
         {
            _loc22_ = 9;
         }
         if(Arguments != undefined && Arguments != "")
         {
            var _loc23_ = Arguments.split("\n");
            var _loc25_ = _loc23_.length;
            var _loc7_ = 0;
            while(_loc7_ < _loc25_)
            {
               var _loc4_ = _loc23_[_loc7_].split("\t");
               if(_loc4_[0] == "" || _loc4_[0] == undefined)
               {
                  break;
               }
               var _loc12_ = _loc8_.bodyMc.getNextHighestDepth();
               var _loc3_ = _loc8_.bodyMc.attachMovie("Slot2_link","slotMc" + _loc12_,_loc12_);
               _loc3_._x = _loc8_.bodyMc.txt._x + _loc3_._width * (_loc7_ % 2);
               _loc3_._y = _loc22_ + _loc3_._height * int(_loc7_ / 2);
               id = _loc4_[0];
               _loc3_.img = _loc4_[1];
               var _loc16_ = _loc4_[2];
               var _loc6_ = Number(_loc4_[3]);
               var _loc17_ = Number(_loc4_[4]);
               var _loc15_ = Number(_loc4_[5]);
               var _loc13_ = Number(_loc4_[6]);
               var _loc5_ = Number(_loc4_[7]);
               SetMultiply(_loc3_.multiply,Number(_loc4_[8]));
               var _loc11_ = 0;
               if(_loc4_[9] != undefined && _loc4_[9] != "" && _loc4_[9] != "undefined")
               {
                  _loc11_ = Number(_loc4_[9]);
               }
               _loc3_.onEnterFrame = function()
               {
                  if(this.Slot != undefined)
                  {
                     this.draw(this.img);
                     delete this.onEnterFrame;
                  }
               };
               _loc3_.display = true;
               _loc3_.grade = _loc17_;
               _loc3_.drag = fale;
               _loc3_.sealType = _loc15_;
               _loc3_.masterpiece = _loc13_;
               if(_loc5_ == 0)
               {
                  _loc3_.setLineNum(2);
                  _loc3_.upText = _loc16_;
                  if(_loc3_.downTxt > 0)
                  {
                     _loc3_.downText = lib.util.UIString.getUIString("$181002","ItemCount",_loc3_.downTxt);
                  }
                  else
                  {
                     _loc3_.downText = "";
                  }
               }
               else if(_loc5_ == 2)
               {
                  _loc3_.setLineNum(3);
                  _loc3_.upText = "";
                  _loc3_.center_txt.html = true;
                  _loc3_.center_txt.htmlText = lib.util.GoldCurrency.SetGoldText(_loc6_,0,0,0,_loc11_);
               }
               else if(_loc5_ == 3)
               {
                  _loc3_.setLineNum(3);
                  _loc3_.upText = "";
                  _loc3_.centerText = lib.util.CurrencyFormat.makeComma(_loc6_);
                  _loc3_.center_txt.textColor = lib.info.TextColor.GENERAL_EXP;
                  var _loc10_ = _loc3_.attachMovie("symbol_xp","symbol_xp",_loc3_.getNextHighestDepth());
                  _loc10_._x = _loc3_.center_txt._x + _loc3_.center_txt.textWidth + 6;
                  _loc10_._y = _loc3_.center_txt._y;
                  _loc10_.hitTestDisable = true;
               }
               else if(_loc5_ == 4)
               {
                  _loc3_.setLineNum(3);
                  _loc3_.upText = "";
                  _loc3_.centerText = lib.util.CurrencyFormat.makeComma(_loc6_);
                  _loc3_.center_txt.textColor = lib.info.TextColor.GENERAL_POLICYPOINT;
                  var _loc9_ = _loc3_.attachMovie("symbol_p","symbol_p",_loc3_.getNextHighestDepth());
                  _loc9_._x = _loc3_.center_txt._x + _loc3_.center_txt.textWidth + 6;
                  _loc9_._y = _loc3_.center_txt._y;
                  _loc9_.hitTestDisable = true;
               }
               else if(_loc5_ == 5)
               {
                  _loc3_.setLineNum(2);
                  _loc3_.upText = _loc4_[2];
                  _loc3_.downText = lib.util.CurrencyFormat.makeComma(_loc6_);
                  _loc3_.down_txt.textColor = lib.info.TextColor.GENERAL_POLICYPOINT;
                  _loc9_ = _loc3_.attachMovie("symbol_rp_xp","symbol_rp_xp",_loc3_.getNextHighestDepth());
                  _loc3_.down_txt._width = 113;
                  _loc9_._x = _loc3_.down_txt._x + _loc3_.down_txt._width + 1;
                  _loc9_._y = _loc3_.down_txt._y;
                  _loc9_.hitTestDisable = true;
               }
               else if(_loc5_ == 6)
               {
                  _loc3_.setLineNum(2);
                  _loc3_.upText = _loc4_[2];
                  _loc3_.downText = lib.util.CurrencyFormat.makeComma(_loc6_);
                  _loc3_.down_txt.textColor = lib.info.TextColor.GENERAL_POLICYPOINT;
                  _loc9_ = _loc3_.attachMovie("symbol_rp_point","symbol_rp_point",_loc3_.getNextHighestDepth());
                  _loc3_.down_txt._width = 113;
                  _loc9_._x = _loc3_.down_txt._x + _loc3_.down_txt._width + 1;
                  _loc9_._y = _loc3_.down_txt._y;
                  _loc9_.hitTestDisable = true;
               }
               else if(_loc5_ == 7)
               {
                  _loc3_.setLineNum(2);
                  _loc3_.upText = _loc4_[2];
                  _loc3_.downText = lib.util.CurrencyFormat.makeComma(_loc6_);
                  _loc3_.down_txt.textColor = lib.info.TextColor.GENERAL_POLICYPOINT;
                  _loc9_ = lib.util.DrawBitmap.makeMcAndDraw(_loc3_,"img://__Icon_Items.UnionPointCoin");
                  _loc3_.down_txt._width = 113;
                  _loc9_._x = _loc3_.down_txt._x + _loc3_.down_txt._width + 1;
                  _loc9_._y = _loc3_.down_txt._y;
                  _loc9_.hitTestDisable = true;
               }
               else if(_loc5_ == 8)
               {
                  _loc3_.setLineNum(2);
                  _loc3_.upText = _loc4_[2];
               }
               _loc7_ = _loc7_ + 1;
            }
         }
         if(_loc31_ < _loc8_.bodyMc._height)
         {
            var _loc27_ = _loc8_.bodyMc._height - _loc31_ + 10;
            _loc8_.bodyMc.bgMc._height = _loc8_.bodyMc.bgMc._height + _loc27_;
            _loc8_.addBgMc.bgMc._height = _loc8_.addBgMc.bgMc._height + _loc27_;
            _loc8_.bgMc.bgMc._height = _loc8_.bgMc.bgMc._height + _loc27_;
            _loc8_.line0Mc._y = _loc8_.line0Mc._y + _loc27_;
         }
      }
      else if(type == 22)
      {
         addEmblemMsg(1,msg,15,addParam[0]);
      }
      else if(type == 23)
      {
         if(msg == "" || msg == undefined)
         {
            tutorialMsgContainer._visible = false;
            return undefined;
         }
         tutorialMsgContainer._visible = true;
         tutorialMsgContainer.txt.verticalAlign = "center";
         msg = msg.split("{MR}").join("<img src=\'mouse_right\' vspace=\'-6\'>");
         msg = msg.split("{MO}").join("<img src=\'mouse_over\' vspace=\'-6\'>");
         msg = msg.split("{ML}").join("<img src=\'mouse_left\' vspace=\'-6\'>");
         tutorialMsgContainer.txt.htmlText = msg;
         if(tutorialMsgContainer.txt.textHeight <= 108)
         {
            tutorialMsgContainer.txt._height = 108;
            tutorialMsgContainer.mBackground._height = 145;
         }
         else
         {
            tutorialMsgContainer.txt._height = Math.round(tutorialMsgContainer.txt.textHeight + 4);
            tutorialMsgContainer.mBackground._height = tutorialMsgContainer.txt._height + 37;
         }
         tutorialMsgContainer._x = 0;
      }
      else if(type == 24)
      {
         if(addParam[0] == -1)
         {
            addEmblemMsg(1,msg,24);
         }
         addBFMsg(msg,addParam[0],addParam[1],addParam[2],bfContainer);
      }
      else if(type == 25)
      {
         addKLMsg(msg,addParam[0],addParam[1],addParam[2],klContainer);
      }
      else if(type == 41)
      {
         addNpcMsg(1,msg,id,addParam[0],addParam[1]);
      }
      else if(type == 42)
      {
         addAwakenMsg(msg,addParam[0]);
      }
      else if(type == 43)
      {
         var _loc33_ = undefined;
         if(addParam[0] == 0)
         {
            _loc33_ = 5948214;
         }
         else if(addParam[0] == 1)
         {
            _loc33_ = 16744319;
         }
         myListener.OnGame_SystemMessage_Add(msg,_loc33_,lockOnContainer,2);
      }
      else if(type == 44)
      {
         mLockOn.id = id;
         totalMsg_array.push(mLockOn);
         mLockOn.mText.textField.text = msg;
         mLockOn.gotoAndPlay(2);
         mLockOn._visible = true;
      }
      else if(MESSAGE_STYLE_CITYWAR_START <= type && type <= MESSAGE_STYLE_CITYWAR_END)
      {
         var _loc21_ = 1;
         switch(type)
         {
            case MESSAGE_TYPE_CITYWAR_BOSS_APPEAR:
            case MESSAGE_TYPE_CITYWAR_BOSS_DEATH:
               _loc21_ = 2;
               break;
            case MESSAGE_TYPE_CITYWAR_START:
            case MESSAGE_TYPE_CITYWAR_END_WIN:
            case MESSAGE_TYPE_CITYWAR_END_FREE:
               _loc21_ = 3;
               break;
            case MESSAGE_TYPE_GUILD_QUEST_START:
            case MESSAGE_TYPE_GUILD_QUEST_FAIL:
            case MESSAGE_TYPE_GUILD_QUEST_DONE:
            case MESSAGE_TYPE_GUILD_INCENTIVE:
               _loc21_ = 4;
               break;
            case MESSAGE_TYPE_GUILD_LEVEL_CHANGE:
               _loc21_ = 5;
               break;
            case MESSAGE_TYPE_GUILD_SKILL_LEARN:
               _loc21_ = 6;
            case MESSAGE_TYPE_GUILDWAR_DECLARE:
            case MESSAGE_TYPE_GUILDWAR_SURRENDER:
            case MESSAGE_TYPE_GUILDWAR_WITHDRAW:
               _loc21_ = type - 30;
         }
         addCityWarMsg(msg,_loc21_);
      }
   }
};
var cityWarMsgArray = new Array();
myListener.OnGame_Message_Remove = function(id)
{
   getURL("FSCommand:" add ("Delete~~~  " + random(999)),"");
   var _loc1_ = getMsg(id);
   if(_loc1_ != null)
   {
      if(_loc1_.type == 3)
      {
         removeStaticMsg(id);
      }
      else if(_loc1_.type == 4)
      {
         showFKey(0,"",0,"");
      }
      else if(_loc1_.type != 11)
      {
         if(_loc1_.type == 12)
         {
            addMovieMsg(0,"");
         }
         else if(_loc1_.type == 14)
         {
            loadingMessageContainer.txt.text = "";
            loadingMessageContainer._visible = false;
         }
         else if(_loc1_.type == 15)
         {
            showDefenseMsg(false);
         }
         else if(_loc1_.type == 17)
         {
            showItemNeedMsg(0,"",0,"");
         }
         else if(_loc1_.type == 44)
         {
            mLockOn._visible = false;
         }
      }
      removeMsg(id);
      clearTimeout(UI[id]);
      delete UI.id;
   }
};
myListener.OnGame_Message_Clear = function()
{
   totalMsg_array = [];
   staticMsg_array = [];
   remakeContainer(systemMessageContainer);
   remakeContainer(staticMessageContainer);
   remakeContainer(questTaskMessageContainer);
   clearSectionMessage();
   clearGuardNameMessage();
   clearActionKeyMessage();
   clearTutorialMessage();
   clearRootMessage();
   clearEmblemMessage();
   clearMovieMessage();
   clearLoadingMessage();
   clearShieldDefenceMessage();
   clearItemNeedMessage();
   clearCoolTimeAlim();
   clearAllCityWarMsg();
};
myListener.OnGame_LogOut = function()
{
   clearEmblemMessage();
};
var lineGap = 5;
var defaultLifeTime = 3;
var lineHeight = 24;
var maxLine = 3;
var maxBFLine = 3;
var currentNumOfMsg = 0;
var fadeInTime = 0.3;
var pushedFadeOutTime = 2;
var pushTime = 0.5;
var linesY_array = new Array(0,- lineHeight,(- lineHeight) * 2,(- lineHeight) * 3,(- lineHeight) * 4,(- lineHeight) * 5);
var linesY_array2 = new Array(-200,-168,-136,-104,-72,-40);
var items_important = [];
var emblemPosY = 7.5;
myListener.OnGame_ScaleUI = function()
{
   myListener.OnGame_ChangeStageSize();
};
myListener.OnGame_ChangeStageSize = function(w, h)
{
   systemMessageContainer._x = lib.info.AlignInfo.xRatioToPixel(50);
   systemMessageContainer._y = lib.info.AlignInfo.yRatioToPixel(22);
   questTaskMessageContainer._x = lib.info.AlignInfo.xRatioToPixel(50);
   questTaskMessageContainer._y = lib.info.AlignInfo.yRatioToPixel(28);
   emblemMessageContainer._y = lib.info.AlignInfo.yRatioToPixel(emblemPosY);
   movieMessageContainer._y = lib.info.AlignInfo.yRatioToPixel(93);
   rootMessageContainer._x = lib.info.AlignInfo.xRatioToPixel(60);
   rootMessageContainer._y = lib.info.AlignInfo.yRatioToPixel(73);
   actionKeyMessageContainer._x = lib.info.AlignInfo.xRatioToPixel(56);
   actionKeyMessageContainer._y = lib.info.AlignInfo.yRatioToPixel(57);
   itemNeedMessageContainer._x = lib.info.AlignInfo.xRatioToPixel(50);
   itemNeedMessageContainer._y = lib.info.AlignInfo.yRatioToPixel(63);
   tutorialMessageContainer._x = lib.info.AlignInfo.xRatioToPixel(50);
   tutorialMessageContainer._y = lib.info.AlignInfo.yRatioToPixel(70.5);
   staticMessageContainer._x = lib.info.AlignInfo.xRatioToPixel(50);
   staticMessageContainer._y = lib.info.AlignInfo.yRatioToPixel(80);
   lockOnContainer._x = lib.info.AlignInfo.xRatioToPixel(50);
   lockOnContainer._y = lib.info.AlignInfo.yRatioToPixel(70);
   shieldDefenceMessageContainer._x = lib.info.AlignInfo.xRatioToPixel(55);
   shieldDefenceMessageContainer._y = lib.info.AlignInfo.yRatioToPixel(36);
   sectionNameMessageContainer._x = lib.info.AlignInfo.xRatioToPixel(50);
   sectionNameMessageContainer._y = lib.info.AlignInfo.yRatioToPixel(37.85);
   guardNameMessageContainer._x = lib.info.AlignInfo.xRatioToPixel(50);
   guardNameMessageContainer._y = lib.info.AlignInfo.yRatioToPixel(29);
   loadingMessageContainer._x = lib.info.AlignInfo.xRatioToPixel(50);
   loadingMessageContainer._y = lib.info.AlignInfo.yRatioToPixel(95);
   bfMessageContainer._y = lib.info.AlignInfo.yRatioToPixel(44);
   bfMessageContainer._x = lib.info.AlignInfo.xRatioToPixel(50);
   bfContainer._x = lib.info.AlignInfo.xRatioToPixel(50);
   bfContainer._y = lib.info.AlignInfo.yRatioToPixel(23);
   klContainer._x = lib.info.AlignInfo.xRatioToPixel(100);
   klContainer._y = lib.info.AlignInfo.yRatioToPixel(80);
   GuildWarMotionMc._x = lib.info.AlignInfo.xRatioToPixel(50);
   GuildWarMotionMc._y = lib.info.AlignInfo.yRatioToPixel(22);
   awakenSkillMessage._x = lib.info.AlignInfo.xRatioToPixel(50);
   awakenSkillMessage._y = lib.info.AlignInfo.yRatioToPixel(15);
   awakenSkillMessage._xscale = awakenSkillMessage._yscale = 100;
   npcMsgContainer._xscale = npcMsgContainer._yscale = 100;
   mLockOn._x = lib.info.AlignInfo.xRatioToPixel(50);
   mLockOn._y = lib.info.AlignInfo.yRatioToPixel(39);
   levelupContainer._x = lib.info.AlignInfo.xRatioToPixel(50);
   levelupContainer._y = lib.info.AlignInfo.yRatioToPixel(77);
   newMessageContainer._x = lib.info.AlignInfo.xRatioToPixel(50);
   newMessageContainer._y = lib.info.AlignInfo.yRatioToPixel(16);
};
myListener.OnGame_SystemMessage_Add = function(str, color, container, maxLine, size)
{
   var _loc5_ = container.getNextHighestDepth();
   var _loc1_ = container.attachMovie("message","message" + _loc5_,_loc5_);
   g4.util.UIUtil.setTextFieldStyle(_loc1_.txt,g4.util.UIUtil.TEXT_FIELD_STYLE_1);
   if(str.indexOf("asfunction") == -1)
   {
      _loc1_.hitTestDisable = true;
   }
   _loc1_._y = 0;
   _loc1_._alpha = 0;
   _loc1_.currentLine = 0;
   if(size != undefined && size != "undefined" && size != "")
   {
      _loc1_.txt.htmlText = "<font size=\'" + size + "\' color=\'#" + color.toString(16) + "\'>" + str + "</font>";
   }
   else
   {
      _loc1_.txt.htmlText = str;
   }
   if(color != undefined && color != "undefined" && color != "")
   {
      if(color == 0)
      {
         color = 13421772;
      }
      _loc1_.txt.textColor = color;
   }
   _loc1_.str = str;
   _loc1_.txt._width = _loc1_.txt.textWidth + 10;
   _loc1_.txt._height = _loc1_.txt.textHeight + 10;
   _loc1_.txt._x = (- _loc1_.txt._width) / 2;
   _loc1_.cnt = 0;
   setLifeTime(_loc1_,defaultLifeTime);
   pushMessage(container,maxLine);
};
var staticMsg_array = new Array();
sectionNameMessageContainer.show = false;
sectionNameMessageContainer._alpha = 0;
sectionNameMessageContainer._visible = false;
guardNameMessageContainer.txt.textColor = lib.info.TextColor.SYSTEM_GUARD;
guardNameMessageContainer.txt2.textColor = lib.info.TextColor.SYSTEM_GUARD_GUILD;
guardNameMessageContainer.show = false;
guardNameMessageContainer._alpha = 0;
guardNameMessageContainer._visible = false;
actionKeyMessageContainer._visible = false;
actionKeyMessageContainer.type = 4;
var slotHeight = 60;
var rootItem_array = [];
emblemMessageContainer.txt_mc._alpha = 0;
emblemMessageContainer.emblem._alpha = 0;
emblemMessageContainer.union._alpha = 0;
emblemMessageContainer._alpha = 0;
emblemMessageContainer._visible = false;
emblemMessageContainer.emblemX = -305.6;
emblemMessageContainer.emblemY = 95.4;
var emblemMsg_array = new Array();
var bAttach = false;
var curType = -1;
var achievementEffectType = 0;
var npcMsgFocus = 0;
var npcMsgPosition = -300;
npcMsgContainer.mc0._alpha = 0;
npcMsgContainer.mc1._alpha = 0;
npcMsgContainer.mc0.conTxt.textAutoSize = "shrink";
npcMsgContainer.mc1.conTxt.textAutoSize = "shrink";
myListener.OnGame_Message_NpcMessageClear = function(id)
{
   if(npcMsgContainer.mc0._visible)
   {
      gs.TweenLite.to(npcMsgContainer.mc0,0.5,{_x:npcMsgPosition,_alpha:0,ease:gs.easing.Strong.easeIn,onComplete:[npcFinished]});
   }
   if(npcMsgContainer.mc1._visible)
   {
      gs.TweenLite.to(npcMsgContainer.mc1,0.5,{_x:npcMsgPosition,_alpha:0,ease:gs.easing.Strong.easeIn,onComplete:[npcFinished]});
   }
};
var awakenMsgArray = new Array();
var awakenSkillChangeFrame = 14;
awakenSkillMessage._visible = false;
awakenSkillMessage.gotoAndStop(1);
movieMessageContainer._alpha = 0;
movieMessageContainer._visible = false;
movieMessageContainer.type = 12;
shieldDefenceMessageContainer._alpha = 0;
shieldDefenceMessageContainer._visible = false;
shieldDefenceMessageContainer.type = 15;
var shield_Str = ["$005003","$005029","$005030","$005031","$005032","$005031"];
myListener.OnGame_BFScoreBoard_SetBattleState = function(_state, battleFieldType)
{
   vipTxt = "";
   _state = Number(_state);
   bfMessageContainer._y = lib.info.AlignInfo.yRatioToPixel(44);
   unloadMovie(bfMessageContainer);
   if(_state == 1)
   {
      loadMovie(lib.info.LoadURL.BF_RESULT_WIN,bfMessageContainer);
   }
   else if(_state == 2)
   {
      loadMovie(lib.info.LoadURL.BF_RESULT_LOSE,bfMessageContainer);
   }
   else if(_state == 3)
   {
      loadMovie(lib.info.LoadURL.BF_RESULT_DRAW,bfMessageContainer);
   }
};
itemNeedMessageContainer._alpha = 0;
itemNeedMessageContainer._visible = false;
itemNeedMessageContainer.type = 17;
var guildwarmotion_strdata1 = lib.util.UIString.getUIString("$129001");
var guildwarmotion_strdata2 = lib.util.UIString.getUIString("$129002");
var guildwarmotion_strdata3 = lib.util.UIString.getUIString("$129003");
var guildwarmotion_strdata4 = lib.util.UIString.getUIString("$129004");
var guildwarmotion_strdata5 = lib.util.UIString.getUIString("$129005");
var NameTextLength_Local = 0;
myListener.OnGame_GuildWarMotion_Join = function(setdata)
{
   var setList = setdata.split("\t");
   GuildWarMotion_Request();
   var delay_num = 0;
   UI.onEnterFrame = null;
   UI.onEnterFrame = function()
   {
      delay_num++;
      if(delay_num > 1)
      {
         UI.onEnterFrame = null;
         lib.manager.UISound.play(lib.manager.UISound.GUILDWAR_DECARED);
         UI.GuildWarMotionMc.GuildMc5.gotoAndPlay(2);
         UI.GuildWarMotionMc.GuildMc2.gotoAndStop("end");
         UI.GuildWarMotionMc.GuildMc3.gotoAndStop("end");
         UI.GuildWarMotionMc.GuildMc4.gotoAndStop("end");
         UI.GuildWarMotionMc.GuildMc1.gotoAndStop("end");
         lib.util.DrawBitmap.draw(UI.GuildWarMotionMc.GuildMc5.img_mc1.IconMc,setList[0],50,50);
         var delay_num2 = 0;
         UI.GuildWarMotionMc.GuildMc5.onEnterFrame = null;
         UI.GuildWarMotionMc.GuildMc5.onEnterFrame = function()
         {
            delay_num2++;
            if(delay_num2 > 1)
            {
               UI.GuildWarMotionMc.GuildMc5.onEnterFrame = null;
               UI.GuildWarMotionMc.GuildMc5.img_mc1.IconMc._width = 50;
               UI.GuildWarMotionMc.GuildMc5.img_mc1.IconMc._height = 50;
            }
         };
         UI.GuildWarMotionMc.GuildMc5.txt_mc1.txt0.setText(setList[1]);
         UI.GuildWarMotionMc.GuildMc5.txt_mc2.txt.setText(setList[2]);
         UI.GuildWarMotionMc.GuildMc5.txt_mc3.txt.setText(setList[2]);
         UI.GuildWarMotionMc.GuildMc5.txt_mc4.txt.setText(setList[2]);
      }
   };
};
myListener.OnGame_GuildWarMotion_Decared = function(setdata)
{
   var setList = setdata.split("\t");
   GuildWarMotion_Request();
   var delay_num = 0;
   UI.onEnterFrame = null;
   UI.onEnterFrame = function()
   {
      delay_num++;
      if(delay_num > 1)
      {
         UI.onEnterFrame = null;
         lib.manager.UISound.play(lib.manager.UISound.GUILDWAR_DECARED);
         UI.GuildWarMotionMc.GuildMc1.gotoAndPlay(2);
         UI.GuildWarMotionMc.GuildMc2.gotoAndStop("end");
         UI.GuildWarMotionMc.GuildMc3.gotoAndStop("end");
         UI.GuildWarMotionMc.GuildMc4.gotoAndStop("end");
         UI.GuildWarMotionMc.GuildMc5.gotoAndStop("end");
         lib.util.DrawBitmap.draw(UI.GuildWarMotionMc.GuildMc1.img_mc1.IconMc,setList[0],50,50);
         lib.util.DrawBitmap.draw(UI.GuildWarMotionMc.GuildMc1.img_mc2.IconMc,setList[1],50,50);
         var delay_num2 = 0;
         UI.GuildWarMotionMc.GuildMc1.onEnterFrame = null;
         UI.GuildWarMotionMc.GuildMc1.onEnterFrame = function()
         {
            delay_num2++;
            if(delay_num2 > 1)
            {
               UI.GuildWarMotionMc.GuildMc1.onEnterFrame = null;
               UI.GuildWarMotionMc.GuildMc1.img_mc1.IconMc._width = 50;
               UI.GuildWarMotionMc.GuildMc1.img_mc1.IconMc._height = 50;
               UI.GuildWarMotionMc.GuildMc1.img_mc2.IconMc._width = 50;
               UI.GuildWarMotionMc.GuildMc1.img_mc2.IconMc._height = 50;
            }
         };
         UI.GuildWarMotionMc.GuildMc1.txt_mc1.txt0.setText(setList[2]);
         UI.GuildWarMotionMc.GuildMc1.txt_mc1.txt1.setText(setList[3]);
         UI.GuildWarMotionMc.GuildMc1.txt_mc2.txt.setText(guildwarmotion_strdata1);
         UI.GuildWarMotionMc.GuildMc1.txt_mc3.txt.setText(guildwarmotion_strdata1);
         UI.GuildWarMotionMc.GuildMc1.txt_mc4.txt.setText(guildwarmotion_strdata1);
         UI.GuildWarMotionMc.GuildMc1.txt_mc5.txt.setText(setList[4]);
      }
   };
};
myListener.OnGame_GuildWarMotion_Decared_loadinit = function(setdata)
{
};
var vipTxt = "";
myListener.OnGame_VipMotion_Up = function(txt)
{
   unloadMovie(bfMessageContainer);
   bfMessageContainer._y = lib.info.AlignInfo.yRatioToPixel(44);
   vipTxt = txt;
   loadMovie(lib.info.LoadURL.BF_RESULT_WIN,bfMessageContainer);
};
myListener.OnGame_GuildWarMotion_Win = function(setdata)
{
   var setList = setdata.split("\t");
   GuildWarMotion_Request();
   var delay_num = 0;
   UI.onEnterFrame = null;
   UI.onEnterFrame = function()
   {
      delay_num++;
      if(delay_num > 1)
      {
         UI.onEnterFrame = null;
         lib.manager.UISound.play(lib.manager.UISound.GUILDWAR_WIN);
         GuildWarMotionMc.GuildMc2.gotoAndPlay(2);
         UI.GuildWarMotionMc.GuildMc1.gotoAndStop("end");
         UI.GuildWarMotionMc.GuildMc3.gotoAndStop("end");
         UI.GuildWarMotionMc.GuildMc4.gotoAndStop("end");
         UI.GuildWarMotionMc.GuildMc5.gotoAndStop("end");
         lib.util.DrawBitmap.draw(GuildWarMotionMc.GuildMc2.img_mc1.IconMc,setList[0],50,50);
         lib.util.DrawBitmap.draw(GuildWarMotionMc.GuildMc2.img_mc2.IconMc,setList[1],50,50);
         var delay_num2 = 0;
         UI.GuildWarMotionMc.GuildMc2.onEnterFrame = null;
         UI.GuildWarMotionMc.GuildMc2.onEnterFrame = function()
         {
            delay_num2++;
            if(delay_num2 > 1)
            {
               UI.GuildWarMotionMc.GuildMc2.onEnterFrame = null;
               UI.GuildWarMotionMc.GuildMc2.img_mc1.IconMc._width = 50;
               UI.GuildWarMotionMc.GuildMc2.img_mc1.IconMc._height = 50;
               UI.GuildWarMotionMc.GuildMc2.img_mc2.IconMc._width = 50;
               UI.GuildWarMotionMc.GuildMc2.img_mc2.IconMc._height = 50;
            }
         };
         GuildWarMotionMc.GuildMc2.txt_mc1.txt0.setText(setList[2]);
         GuildWarMotionMc.GuildMc2.txt_mc1.txt1.setText(setList[3]);
         GuildWarMotionMc.GuildMc2.txt_mc2.txt.setText(guildwarmotion_strdata2);
         GuildWarMotionMc.GuildMc2.txt_mc3.txt.setText(guildwarmotion_strdata2);
         GuildWarMotionMc.GuildMc2.txt_mc4.txt.setText(guildwarmotion_strdata2);
      }
   };
};
myListener.OnGame_GuildWarMotion_Fail = function(setdata)
{
   var setList = setdata.split("\t");
   GuildWarMotion_Request();
   var delay_num = 0;
   UI.onEnterFrame = null;
   UI.onEnterFrame = function()
   {
      delay_num++;
      if(delay_num > 1)
      {
         UI.onEnterFrame = null;
         lib.manager.UISound.play(lib.manager.UISound.GUILDWAR_FAIL);
         GuildWarMotionMc.GuildMc3.gotoAndPlay(2);
         UI.GuildWarMotionMc.GuildMc1.gotoAndStop("end");
         UI.GuildWarMotionMc.GuildMc2.gotoAndStop("end");
         UI.GuildWarMotionMc.GuildMc4.gotoAndStop("end");
         UI.GuildWarMotionMc.GuildMc5.gotoAndStop("end");
         lib.util.DrawBitmap.draw(GuildWarMotionMc.GuildMc3.img_mc1.IconMc,setList[0],50,50);
         lib.util.DrawBitmap.draw(GuildWarMotionMc.GuildMc3.img_mc2.IconMc,setList[1],50,50);
         var delay_num2 = 0;
         UI.GuildWarMotionMc.GuildMc3.onEnterFrame = null;
         UI.GuildWarMotionMc.GuildMc3.onEnterFrame = function()
         {
            delay_num2++;
            if(delay_num2 > 1)
            {
               UI.GuildWarMotionMc.GuildMc3.onEnterFrame = null;
               UI.GuildWarMotionMc.GuildMc3.img_mc1.IconMc._width = 50;
               UI.GuildWarMotionMc.GuildMc3.img_mc1.IconMc._height = 50;
               UI.GuildWarMotionMc.GuildMc3.img_mc2.IconMc._width = 50;
               UI.GuildWarMotionMc.GuildMc3.img_mc2.IconMc._height = 50;
            }
         };
         GuildWarMotionMc.GuildMc3.txt_mc1.txt0.setText(setList[2]);
         GuildWarMotionMc.GuildMc3.txt_mc1.txt1.setText(setList[3]);
         GuildWarMotionMc.GuildMc3.txt_mc2.txt.setText(guildwarmotion_strdata3);
         GuildWarMotionMc.GuildMc3.txt_mc3.txt.setText(guildwarmotion_strdata3);
         GuildWarMotionMc.GuildMc3.txt_mc4.txt.setText(guildwarmotion_strdata3);
      }
   };
};
myListener.OnGame_GuildWarMotion_Draw = function(setdata)
{
   var setList = setdata.split("\t");
   GuildWarMotion_Request();
   var delay_num = 0;
   UI.onEnterFrame = null;
   UI.onEnterFrame = function()
   {
      delay_num++;
      if(delay_num > 1)
      {
         UI.onEnterFrame = null;
         lib.manager.UISound.play(lib.manager.UISound.GUILDWAR_DRAW);
         GuildWarMotionMc.GuildMc4.gotoAndPlay(2);
         UI.GuildWarMotionMc.GuildMc1.gotoAndStop("end");
         UI.GuildWarMotionMc.GuildMc2.gotoAndStop("end");
         UI.GuildWarMotionMc.GuildMc3.gotoAndStop("end");
         UI.GuildWarMotionMc.GuildMc5.gotoAndStop("end");
         lib.util.DrawBitmap.draw(GuildWarMotionMc.GuildMc4.img_mc1.IconMc,setList[0],50,50);
         lib.util.DrawBitmap.draw(GuildWarMotionMc.GuildMc4.img_mc2.IconMc,setList[1],50,50);
         var delay_num2 = 0;
         UI.GuildWarMotionMc.GuildMc4.onEnterFrame = null;
         UI.GuildWarMotionMc.GuildMc4.onEnterFrame = function()
         {
            delay_num2++;
            if(delay_num2 > 1)
            {
               UI.GuildWarMotionMc.GuildMc4.onEnterFrame = null;
               UI.GuildWarMotionMc.GuildMc4.img_mc1.IconMc._width = 50;
               UI.GuildWarMotionMc.GuildMc4.img_mc1.IconMc._height = 50;
               UI.GuildWarMotionMc.GuildMc4.img_mc2.IconMc._width = 50;
               UI.GuildWarMotionMc.GuildMc4.img_mc2.IconMc._height = 50;
            }
         };
         GuildWarMotionMc.GuildMc4.txt_mc1.txt0.setText(setList[2]);
         GuildWarMotionMc.GuildMc4.txt_mc1.txt1.setText(setList[3]);
         GuildWarMotionMc.GuildMc4.txt_mc2.txt.setText(guildwarmotion_strdata4);
         GuildWarMotionMc.GuildMc4.txt_mc3.txt.setText(guildwarmotion_strdata4);
         GuildWarMotionMc.GuildMc4.txt_mc4.txt.setText(guildwarmotion_strdata4);
      }
   };
};
myListener.OnGame_GuildWarMotion_StartBattle = function(setdata)
{
   var setList = setdata.split("\t");
   GuildWarMotion_Request();
   var delay_num = 0;
   UI.onEnterFrame = null;
   UI.onEnterFrame = function()
   {
      delay_num++;
      if(delay_num > 1)
      {
         UI.onEnterFrame = null;
         lib.manager.UISound.play(lib.manager.UISound.GUILDWAR_DECARED);
         GuildWarMotionMc.GuildMc3.gotoAndPlay(2);
         UI.GuildWarMotionMc.GuildMc1.gotoAndStop("end");
         UI.GuildWarMotionMc.GuildMc2.gotoAndStop("end");
         UI.GuildWarMotionMc.GuildMc4.gotoAndStop("end");
         UI.GuildWarMotionMc.GuildMc5.gotoAndStop("end");
         lib.util.DrawBitmap.draw(GuildWarMotionMc.GuildMc3.img_mc1.IconMc,setList[0],50,50);
         lib.util.DrawBitmap.draw(GuildWarMotionMc.GuildMc3.img_mc2.IconMc,setList[1],50,50);
         var delay_num2 = 0;
         UI.GuildWarMotionMc.GuildMc3.onEnterFrame = null;
         UI.GuildWarMotionMc.GuildMc3.onEnterFrame = function()
         {
            delay_num2++;
            if(delay_num2 > 1)
            {
               UI.GuildWarMotionMc.GuildMc3.onEnterFrame = null;
               UI.GuildWarMotionMc.GuildMc3.img_mc1.IconMc._width = 50;
               UI.GuildWarMotionMc.GuildMc3.img_mc1.IconMc._height = 50;
               UI.GuildWarMotionMc.GuildMc3.img_mc2.IconMc._width = 50;
               UI.GuildWarMotionMc.GuildMc3.img_mc2.IconMc._height = 50;
            }
         };
         GuildWarMotionMc.GuildMc3.txt_mc1.txt0.setText(setList[2]);
         GuildWarMotionMc.GuildMc3.txt_mc1.txt1.setText(setList[3]);
         GuildWarMotionMc.GuildMc3.txt_mc2.txt.setText(guildwarmotion_strdata5);
         GuildWarMotionMc.GuildMc3.txt_mc3.txt.setText(guildwarmotion_strdata5);
         GuildWarMotionMc.GuildMc3.txt_mc4.txt.setText(guildwarmotion_strdata5);
      }
   };
};
GuildWarMotion_Init();
var chatUI = undefined;
var whisperColor = "#" + lib.info.TextColor.CHAT_WHISPER.toString(16);
var whisperChatType = null;
myListener.OnGame_Chat_SetWriting = function(chatType, writing, id, addParam, tabList, wisperType)
{
   if(bShowChatWhisper != 1)
   {
      return undefined;
   }
   wisperType = Number(wisperType);
   if(wisperType != 1)
   {
      return undefined;
   }
   chatType = Number(chatType);
   var _loc2_ = "";
   customStaticMsgId++;
   _loc2_ = "<FONT color=\'" + whisperColor + "\' size=\'12\'>" + "<a href=\'asfunction:chatNameAction," + id + "@" + chatType + "@" + "test" + "\'>" + "[" + id + "]" + "</a>" + lib.util.UIString.getUIString("$031055") + "[" + lib.util.UIString.getUIString("$031009") + "] : </FONT>";
   if(chatUI == undefined)
   {
      chatUI = _root.GetLoadedUI("chat2");
   }
   var _loc6_ = g4.model.chat.ChatUtil.calcHtmlText(writing,true,chatType);
   _loc2_ = _loc2_ + _loc6_;
   var _loc4_ = addStaticMsg(customStaticMsgId,_loc2_,0);
   _loc4_._xscale = _loc4_._yscale = 130;
   UI[customStaticMsgId] = setTimeout(myListener.OnGame_Message_Remove,5000,customStaticMsgId);
};
var CHANNEL_INDEX = 0;
var CHANNEL_NAME = 1;
var CHANNEL_COLOR = 2;
var CHANNEL_TYPE = 3;
var CHANNEL_BLINK = 4;
var CHANNEL_BNAME = 5;
var CHANNEL_BHTML = 6;
myListener.OnGame_Chat_SetChannelInfo = function(channelData)
{
   var _loc6_ = lib.util.ExtString.split(channelData,"\n");
   var _loc2_ = 0;
   while(_loc2_ < _loc6_.length)
   {
      var _loc1_ = lib.util.ExtString.split(_loc6_[_loc2_],"\t");
      var _loc5_ = Number(_loc1_[CHANNEL_INDEX]);
      var _loc3_ = Number(_loc1_[CHANNEL_TYPE]);
      if(_loc3_ == 1)
      {
         if(_loc3_ == 1)
         {
            var _loc4_ = Number(_loc1_[CHANNEL_COLOR]);
            whisperColor = "#" + _loc4_.toString(16);
            whisperChatType = _loc5_;
            return undefined;
         }
      }
      _loc2_ = _loc2_ + 1;
   }
};
var importantInterval;
myListener.OnGame_ChangeStageSize();
var systemTime = 5;
var systemLongTime = 120;
var rewardIdx = 0;
var rewardMax = 4;
var rewardEndTime = 6;
var rewardBox = [];
var rewardDelay = 2000;
var rewardWave = 0.1;
var rewardWave2 = 1;
var systemStyle = [50,18.4,100];
var rewardStyle = [0,60,99];
var RewardInterval = null;
myListener.OnGame_Message_System = function($type, $title, $subMessage, $idx)
{
   messageStyle3.setData($type,$title,$subMessage,$idx);
};
myListener.OnGame_Message_Reward = function(typeStr, rewardStr)
{
   mRewardMessage.Message_Reward(typeStr,rewardStr);
};
myListener.OnGame_Message_SystemClear = function(id)
{
   if(id)
   {
      if(newMessageContainer.systemMc.id == id)
      {
         gs.TweenMax.killTweensOf(newMessageContainer.systemMc,false);
         newMessageContainer.systemMc.removeMovieClip();
      }
   }
   else
   {
      gs.TweenMax.killTweensOf(newMessageContainer.systemMc,false);
      newMessageContainer.systemMc.removeMovieClip();
      myListener.OnGame_Message_SkillEnable(false);
   }
   messageStyle3.clearMessage();
};
myListener.OnGame_Message_RewardClear = function()
{
   mRewardMessage.clearMessage();
};
myListener.OnGame_Message_SkillEnable = function($enable)
{
   mLevelUp.mButtonGroup._visible = $enable;
   if($enable)
   {
      mLevelUp.mButtonGroup.gotoAndPlay(2);
      mLevelUp.mButtonGroup.mButton.gotoAndPlay(2);
   }
   else
   {
      mLevelUp.mButtonGroup.gotoAndStop(1);
      mLevelUp.mButtonGroup.mButton.gotoAndStop(1);
   }
};
var amountTxt = new TextFormat("$NormalFont",24,14145495,false,false,false,null,null,"right",0,0,0,0);
var centerTxt = new TextFormat("$TitleFontB",23,16763904,false,false,false,null,null,"center",0,0,0,0);
var subTxt = new TextFormat("$TitleFontB",27,16777215,false,false,false,null,null,"center",0,0,0,0);
var subTxt2 = new TextFormat("$TitleFontB",21,16777215,false,false,false,null,null,"center",0,0,0,0);
var subTxt3 = new TextFormat("$NormalFont",21,16777215,false,false,false,null,null,"left",0,0,0,0);
var gradeBm1 = flash.display.BitmapData.loadBitmap("iconGrade1");
var gradeBm2 = flash.display.BitmapData.loadBitmap("iconGrade2");
var gradeBm3 = flash.display.BitmapData.loadBitmap("iconGrade3");
var couponBox = flash.display.BitmapData.loadBitmap("CouponBox");
var gradeFontColor = [16777215,39168,39901,16763904];
var BITMAP_RESIZE = 1;
var rewardItemSize = 0.5625;
var rewardGradeSize = 0.75;
var tmpDepth = levelupContainer.getNextHighestDepth();
var mLevelUp = levelupContainer.attachMovie("lvMessage","message" + tmpDepth,tmpDepth);
mLevelUp.mButtonGroup.mButton.bSkill.onRelease = g4.util.Delegate.create(this,skillHandlerClick);
mLevelUp.mButtonGroup._visible = false;
mLevelUp.mText.hitTestDisable = true;
var messageStyle3 = (g4.view.message.MessageStyle3)newMessageContainer.attachMovie("MessageStyle3","messageStyle3",newMessageContainer.getNextHighestDepth());
messageStyle3.__set__visible(false);
function chatWhisperHandler(value)
{
   if(value != null)
   {
      bShowChatWhisper = Number(value);
   }
}
function messageType4Handler(value)
{
   if(value != null)
   {
      bShowType4 = Number(value);
      if(value == 0)
      {
         clearActionKeyMessage();
      }
   }
}
function messageType5Handler(value)
{
   if(value != null)
   {
      bShowType5 = Number(value);
      if(value == 0)
      {
         clearTutorialMessage();
      }
   }
}
function messageType6Handler(value)
{
   if(value != null)
   {
      bShowType6 = Number(value);
   }
}
function messageType9Handler(value)
{
   if(value != null)
   {
      bShowType9 = Number(value);
   }
}
function messageType11Handler(value)
{
   if(value != null)
   {
      bShowType11 = Number(value);
   }
}
function messageType18Handler(value)
{
   if(value != null)
   {
      bShowType18 = Number(value);
   }
}
function debuffMsgHandler(value)
{
   if(value != null)
   {
      bShowDebuffMsg = Number(value);
   }
}
function valueChangeHandler(event)
{
   if(event.key == lib.gamedata.CustomizedUIDataKey.CHAT_WHISPER_VISIBLE)
   {
      chatWhisperHandler(Number(event.value));
   }
   else if(event.key == lib.gamedata.CustomizedUIDataKey.MESSAGE_TYPE4_VISIBLE)
   {
      messageType4Handler(Number(event.value));
   }
   else if(event.key == lib.gamedata.CustomizedUIDataKey.MESSAGE_TYPE5_VISIBLE)
   {
      messageType5Handler(Number(event.value));
   }
   else if(event.key == lib.gamedata.CustomizedUIDataKey.MESSAGE_TYPE6_VISIBLE)
   {
      messageType6Handler(Number(event.value));
   }
   else if(event.key == lib.gamedata.CustomizedUIDataKey.MESSAGE_TYPE9_VISIBLE)
   {
      messageType9Handler(Number(event.value));
   }
   else if(event.key == lib.gamedata.CustomizedUIDataKey.MESSAGE_TYPEB_VISIBLE)
   {
      messageType11Handler(Number(event.value));
   }
   else if(event.key == lib.gamedata.CustomizedUIDataKey.MESSAGE_TYPEI_VISIBLE)
   {
      messageType18Handler(Number(event.value));
   }
   else if(event.key == lib.gamedata.CustomizedUIDataKey.ABNORMALITY_DEBUFFSHOW_BOOLEAN)
   {
      debuffMsgHandler(Number(event.value));
   }
   else if(event.key == lib.gamedata.CustomizedUIDataKey.COOLTIMEALIM_SHOW_BOOLEAN)
   {
      coolTimeAlimHandler(Number(event.value));
   }
}
function getMsg(id)
{
   var _loc2_ = totalMsg_array.length;
   var _loc1_ = 0;
   while(_loc1_ < _loc2_)
   {
      if(totalMsg_array[_loc1_].id == id)
      {
         return totalMsg_array[_loc1_];
      }
      _loc1_ = _loc1_ + 1;
   }
   return null;
}
function getMsgMc(mc)
{
   var _loc2_ = totalMsg_array.length;
   var _loc1_ = 0;
   while(_loc1_ < _loc2_)
   {
      if(totalMsg_array[_loc1_] == mc)
      {
         return totalMsg_array[_loc1_];
      }
      _loc1_ = _loc1_ + 1;
   }
   return null;
}
function removeMsg(id)
{
   var _loc3_ = totalMsg_array.length;
   var _loc2_ = null;
   var _loc1_ = 0;
   while(_loc1_ < _loc3_)
   {
      if(totalMsg_array[_loc1_].id == id)
      {
         _loc2_ = _loc1_;
         break;
      }
      _loc1_ = _loc1_ + 1;
   }
   if(_loc2_ != null)
   {
      totalMsg_array.splice(_loc2_,1);
   }
}
function addCityWarMsg(msg, bgType)
{
   bgType = Number(bgType);
   var _loc1_ = new Object();
   _loc1_.msg = msg;
   _loc1_.bgType = bgType;
   cityWarMsgArray.push(_loc1_);
   checkCityWarMsg();
}
function clearCityWarMsg()
{
   cityWarMsgArray.shift();
   unloadMovie(bfMessageContainer);
   showCityWarMsg();
}
function clearAllCityWarMsg()
{
   unloadMovie(bfMessageContainer);
   bfMessageContainer._y = lib.info.AlignInfo.yRatioToPixel(44);
   cityWarMsgArray = [];
}
function showCityWarMsg()
{
   unloadMovie(bfMessageContainer);
   if(cityWarMsgArray.length <= 0)
   {
      bfMessageContainer._y = lib.info.AlignInfo.yRatioToPixel(35);
      return undefined;
   }
   bfMessageContainer._y = lib.info.AlignInfo.yRatioToPixel(21);
   loadMovie(lib.info.LoadURL.CITYWAR_MESSAGE,bfMessageContainer);
}
function checkCityWarMsg()
{
   if(cityWarMsgArray.length <= 0)
   {
      return undefined;
   }
   if(cityWarMsgArray.length <= 1)
   {
      showCityWarMsg();
   }
}
function remakeContainer(target)
{
   var _loc8_ = target._x;
   var _loc6_ = target._y;
   var _loc3_ = target._name;
   var _loc5_ = target.getDepth();
   var _loc4_ = target._xscale;
   var _loc7_ = target._visible;
   var _loc1_ = target._parent.createEmptyMovieClip(_loc3_,_loc5_);
   _loc1_._x = _loc8_;
   _loc1_._y = _loc6_;
   _loc1_._xscale = _loc1_._yscale = _loc4_;
   _loc1_._visible = _loc7_;
   return _loc1_;
}
function clearSectionMessage()
{
   sectionNameMessageContainer.txt.text = 0;
   sectionNameMessageContainer.show = false;
   sectionNameMessageContainer._alpha = 0;
   sectionNameMessageContainer._visible = false;
   sectionNameMessageContainer.ani1.stop();
   sectionNameMessageContainer.ani2.stop();
   sectionNameMessageContainer.ani3.stop();
   sectionNameMessageContainer.ani4.stop();
}
function clearGuardNameMessage()
{
   guardNameMessageContainer.txt.text = 0;
   guardNameMessageContainer.txt2.text = 0;
   guardNameMessageContainer.show = false;
   guardNameMessageContainer._alpha = 0;
   guardNameMessageContainer._visible = false;
   guardNameMessageContainer.ani1.stop();
   guardNameMessageContainer.ani2.stop();
   guardNameMessageContainer.ani3.stop();
   guardNameMessageContainer.ani4.stop();
}
function clearActionKeyMessage()
{
   actionKeyMessageContainer._visible = false;
   actionKeyMessageContainer.type = 4;
}
function clearTutorialMessage()
{
   tutorialMessageContainer.ani1.stop();
   tutorialMessageContainer.ani2.stop();
   tutorialMessageContainer.ani3.stop();
   tutorialMessageContainer.ani4.stop();
   tutorialMessageContainer._visible = false;
   tutorialMessageContainer.txt.text = "";
}
function clearMovieMessage()
{
   movieMessageContainer._alpha = 0;
   movieMessageContainer._visible = false;
   movieMessageContainer.type = 12;
   movieMessageContainer.ani1.stop();
   movieMessageContainer.ani2.stop();
   movieMessageContainer.txt.text = "";
}
function clearRootMessage()
{
   for(slot in rootMessageContainer)
   {
      var _loc1_ = rootMessageContainer[slot];
      if(typeof _loc1_ == "movieclip" && _loc1_ != rootMessageContainer)
      {
         _loc1_.ani1.stop();
         _loc1_.ani2.stop();
         _loc1_.ani3.stop();
         _loc1_.alpha1.stop();
         _loc1_.removeMovieClip();
      }
   }
}
function clearEmblemMessage()
{
   emblemMessageContainer.txt_mc._alpha = 0;
   emblemMessageContainer.emblem._alpha = 0;
   emblemMessageContainer.union._alpha = 0;
   emblemMessageContainer._alpha = 0;
   emblemMessageContainer._visible = false;
   emblemMessageContainer.emblemX = -305.6;
   emblemMessageContainer.emblemY = 95.4;
   emblemMessageContainer.txt_mc.ani1.stop();
   emblemMessageContainer.txt_mc.ani2.stop();
   emblemMessageContainer.txt_mc.ani3.stop();
   emblemMessageContainer.txt_mc.txt.htmlText = "";
   var _loc1_ = 0;
   while(_loc1_ < emblemMsg_array.length)
   {
      emblemMsg_array[_loc1_].mc.removeMovieClip();
      _loc1_ = _loc1_ + 1;
   }
   emblemMsg_array = [];
   emblemMessageContainer.emblem.scaleX1.stop();
   emblemMessageContainer.emblem.scaleX2.stop();
   emblemMessageContainer.emblem.scaleY1.stop();
   emblemMessageContainer.emblem.scaleY2.stop();
   emblemMessageContainer.emblem.ani1.stop();
   emblemMessageContainer.emblem.ani2.stop();
}
function clearLoadingMessage()
{
   loadingMessageContainer._visible = false;
   loadingMessageContainer.txt.text = "";
}
function clearShieldDefenceMessage()
{
   shieldDefenceMessageContainer._alpha = 0;
   shieldDefenceMessageContainer._visible = false;
}
function clearItemNeedMessage()
{
   itemNeedMessageContainer._alpha = 0;
   itemNeedMessageContainer._visible = false;
   itemNeedMessageContainer.type = 17;
}
function partyNotice(str, color, container, maxLine, size)
{
   var _loc2_ = container.getNextHighestDepth();
   var _loc1_ = container.attachMovie("message2","message" + _loc2_,_loc2_);
   g4.util.UIUtil.setTextFieldStyle(_loc1_.txt,g4.util.UIUtil.TEXT_FIELD_STYLE_1);
   _loc1_.hitTestDisable = true;
   _loc1_._y = -200;
   _loc1_._alpha = 0;
   _loc1_.currentLine = 0;
   _loc1_.txt.htmlText = str;
   _loc1_.txt._width = _loc1_.txt.textWidth + 10;
   _loc1_.txt._height = _loc1_.txt.textHeight + 10;
   _loc1_.txt._x = (- _loc1_.txt._width) / 2;
   _loc1_.cnt = 0;
   setLifeTime(_loc1_,defaultLifeTime);
   pushMessage2(container,maxLine);
}
function setLifeTime(target, lifeTime)
{
   target.cnt = 0;
   target.onEnterFrame = function()
   {
      this.cnt = this.cnt + 1;
      if(this.cnt >= 24 * lifeTime)
      {
         this._alpha = this._alpha - 8;
         if(this._alpha < 5)
         {
            if(target.str == prevMessage)
            {
               prevMessage = "";
            }
            delete this.onEnterFrame;
            target.removeMovieClip();
            currentNumOfMsg--;
         }
      }
   };
}
function pushedFadeOut(target)
{
   gs.TweenLite.to(target,pushedFadeOutTime,{_alpha:0,ease:Regular.easeOut,onComplete:pushedMotionFinished,onCompleteParams:[target]});
}
function pushedMotionFinished(target)
{
   target.removeMovieClip();
}
function pushMessage(container, maxLine)
{
   for(mc in container)
   {
      var _loc1_ = container[mc];
      if(typeof container[mc] == "movieclip" && _loc1_ != container)
      {
         _loc1_.currentLine = _loc1_.currentLine + 1;
         if(_loc1_.currentLine == 1)
         {
            gs.TweenLite.to(_loc1_,pushTime,{_y:linesY_array[1],_alpha:100,ease:gs.easing.Strong.easeOut});
         }
         else if(_loc1_.currentLine == maxLine)
         {
            gs.TweenMax.to(_loc1_,pushTime,{_y:linesY_array[_loc1_.currentLine],ease:gs.easing.Strong.easeOut,onComplete:pushedFadeOut,onCompleteParams:[_loc1_]});
         }
         else if(_loc1_.currentLine > maxLine)
         {
            pushedMotionFinished(_loc1_);
         }
         else
         {
            gs.TweenLite.to(_loc1_,pushTime,{_y:linesY_array[_loc1_.currentLine],ease:gs.easing.Strong.easeOut});
         }
      }
   }
}
function pushMessage2(container, maxLine)
{
   for(mc in container)
   {
      var _loc1_ = container[mc];
      if(typeof container[mc] == "movieclip" && _loc1_ != container)
      {
         _loc1_.currentLine = _loc1_.currentLine + 1;
         if(_loc1_.currentLine == 1)
         {
            gs.TweenLite.to(_loc1_,pushTime,{_y:linesY_array2[1],_alpha:100,ease:gs.easing.Strong.easeOut});
         }
         else if(_loc1_.currentLine == maxLine)
         {
            gs.TweenMax.to(_loc1_,pushTime,{_y:linesY_array2[_loc1_.currentLine],ease:gs.easing.Strong.easeOut,onComplete:pushedFadeOut,onCompleteParams:[_loc1_]});
         }
         else if(_loc1_.currentLine > maxLine)
         {
            pushedMotionFinished(_loc1_);
         }
         else
         {
            gs.TweenLite.to(_loc1_,pushTime,{_y:linesY_array2[_loc1_.currentLine],ease:gs.easing.Strong.easeOut});
         }
      }
   }
}
function pushKLMessage(container, num)
{
   for(mc in container)
   {
      var _loc1_ = container[mc];
      if(typeof container[mc] == "movieclip" && _loc1_ != container)
      {
         _loc1_.currentLine = _loc1_.currentLine + 1;
         if(_loc1_.currentLine == 1)
         {
            gs.TweenLite.to(_loc1_,pushTime,{_y:linesY_BFarray[1],_alpha:100,ease:Regular.easeOut});
         }
         else if(_loc1_.currentLine == num)
         {
            gs.TweenMax.to(_loc1_,pushTime,{_y:linesY_BFarray[_loc1_.currentLine],ease:Regular.easeOut,onComplete:pushedFadeOut,onCompleteParams:[_loc1_]});
         }
         else if(_loc1_.currentLine > num)
         {
            pushedMotionFinished(_loc1_);
         }
         else
         {
            gs.TweenLite.to(_loc1_,pushTime,{_y:linesY_BFarray[_loc1_.currentLine],ease:Regular.easeOut});
         }
      }
   }
}
function addStaticMsg(id, str, bBlink, size, color)
{
   var _loc7_ = staticMessageContainer.getNextHighestDepth();
   var _loc5_ = staticMessageContainer.attachMovie("staticMessage","staticMessage" + _loc7_,_loc7_);
   var _loc4_ = 0;
   while(_loc4_ < 2)
   {
      var _loc2_ = _loc5_["mc" + _loc4_];
      var _loc1_ = _loc2_.createTextField("txt",_loc7_,0,0,0,0);
      _loc1_.shadowStyle = "s{0,-1.5}{-1.4,1.2}{1.4,1.2}t{0,0}";
      _loc1_.shadowColor = 0;
      _loc1_.shadowBlurX = 2;
      _loc1_.shadowBlurY = 2;
      _loc1_.shadowStrength = 1;
      _loc1_.shadowDistance = 0.5;
      _loc1_.shadowAngle = 45;
      var _loc3_ = new TextFormat();
      _loc1_.embedFonts = true;
      _loc3_.align = "center";
      _loc3_.leading = 10;
      _loc3_.size = 16;
      _loc3_.color = Number(color);
      _loc3_.font = "$BasicFont";
      _loc1_.setNewTextFormat(_loc3_);
      _loc1_.selectable = false;
      _loc1_.wordWrap = true;
      _loc1_.type = "dynamic";
      _loc1_.multiline = true;
      _loc1_.html = true;
      _loc1_.antiAliasType = "normal";
      _loc1_._width = 1000;
      _loc1_.htmlText = str;
      _loc1_._height = _loc1_.textHeight + 10;
      if(_loc1_.numLines == 1)
      {
         _loc1_._width = _loc1_.textWidth + 5;
      }
      _loc2_.txt.htmlText = _loc2_.txt.htmlText = str;
      _loc2_.txt._height = _loc2_.txt.textHeight + 10;
      if(_loc2_.txt.numLines == 1)
      {
         _loc2_.txt._width = _loc2_.txt.textWidth + 5;
      }
      _loc2_.txt._x = (- _loc2_.txt._width) / 2;
      _loc4_ = _loc4_ + 1;
   }
   _loc5_.id = id;
   _loc5_.type = 3;
   _loc5_._alpha = 100;
   _loc5_.currentLine = 0;
   _loc5_.cnt = 0;
   _loc5_.$tweenObjY = {};
   _loc5_.$tweenObjAlpha = {};
   if(bBlink == "1")
   {
      blink(_loc5_);
   }
   var _loc8_ = 0;
   _loc4_ = 0;
   while(_loc4_ < staticMsg_array.length)
   {
      _loc8_ = _loc8_ + staticMsg_array[_loc4_]._height;
      _loc4_ = _loc4_ + 1;
   }
   _loc5_._y = _loc8_;
   staticMsg_array.push(_loc5_);
   totalMsg_array.push(_loc5_);
   return _loc5_;
}
function rearrangeStaticMessages()
{
   var _loc3_ = 0;
   var _loc2_ = undefined;
   var _loc1_ = undefined;
   var _loc4_ = staticMsg_array.length;
   _loc1_ = 0;
   while(_loc1_ < _loc4_)
   {
      _loc2_ = (MovieClip)staticMsg_array[_loc1_];
      setStaticMessageY(_loc2_,_loc3_);
      _loc3_ = _loc3_ + _loc2_._height;
      _loc1_ = _loc1_ + 1;
   }
}
function setStaticMessageY(mc, yTo)
{
   gs.TweenLite.killTweensOf(mc.$tweenObjY);
   if(mc._y == yTo)
   {
      return undefined;
   }
   mc.$tweenObjY._y = mc._y;
   gs.TweenLite.to(mc.$tweenObjY,0.5,{_y:yTo,ease:gs.easing.Strong.easeOut,onUpdate:setStaticMessageY_onUpdate,onUpdateParams:[mc,mc.$tweenObjY]});
}
function setStaticMessageY_onUpdate(mc, obj)
{
   mc._y = obj._y;
}
function blink(target)
{
   lib.util.Warning.add(target);
}
function removeStaticMsg(id)
{
   var _loc2_ = getMsg(id);
   gs.TweenLite.killTweensOf(_loc2_.$tweenObjAlpha);
   _loc2_.$tweenObjAlpha._alpha = _loc2_._alpha;
   gs.TweenLite.to(_loc2_.$tweenObjAlpha,0.5,{_alpha:0,ease:gs.easing.Strong.easeOut,onUpdate:removeStaticMsg_onUpdate,onUpdateParams:[_loc2_,_loc2_.$tweenObjAlpha],onComplete:removeStaticMsg_onComplete,onCompleteParams:[_loc2_]});
   var _loc1_ = undefined;
   var _loc3_ = staticMsg_array.length;
   _loc1_ = 0;
   while(_loc1_ < _loc3_)
   {
      if(staticMsg_array[_loc1_] == _loc2_)
      {
         staticMsg_array.splice(_loc1_,1);
         rearrangeStaticMessages();
         break;
      }
      _loc1_ = _loc1_ + 1;
   }
}
function removeStaticMsg_onUpdate(mc, obj)
{
   mc._alpha = obj._alpha;
}
function removeStaticMsg_onComplete(mc)
{
   lib.util.Warning.remove(mc);
   mc.removeMovieClip();
}
function aniFinished_1(target, fun)
{
   fun();
   gs.TweenLite.to(target,0.3,{_alpha:100,onComplete:aniFinished_2,onCompleteParams:[target]});
}
function aniFinished_2(target)
{
   gs.TweenLite.to(target,0.5,{delay:3,_alpha:0,onComplete:aniFinished_3,onCompleteParams:[target]});
}
function aniFinished_3(target)
{
   target.show = false;
   target._visible = false;
}
function aniFinished_4(target)
{
   target._visible = false;
}
function showOneLineMsg(target, bShow, fun)
{
   gs.TweenLite.killTweensOf(target,false);
   if(bShow)
   {
      target._visible = true;
      gs.TweenLite.to(target,0.3,{_alpha:0,onComplete:aniFinished_1,onCompleteParams:[target,fun]});
      target.show = true;
   }
   else
   {
      gs.TweenLite.to(target,0.5,{_alpha:0,onComplete:aniFinished_4,onCompleteParams:[target]});
      target.show = false;
   }
   return target;
}
function showFKey(bShow, msg, type)
{
   if(bShow)
   {
      actionKeyMessageContainer.gotoAndPlay(2);
      actionKeyMessageContainer._visible = true;
      actionKeyMessageContainer.mIcon.gotoAndStop(Number(type) + 1);
      actionKeyMessageContainer.mText.textField.htmlText = msg;
      if(getMsgMc(actionKeyMessageContainer) == null)
      {
         totalMsg_array.push(actionKeyMessageContainer);
      }
   }
   else
   {
      actionKeyMessageContainer.gotoAndPlay(15);
   }
   return actionKeyMessageContainer;
}
function actionKeyMessageFinished2()
{
   actionKeyMessageContainer._visible = false;
}
function showTutorialMsg(bShow, msg, delay)
{
   gs.TweenLite.killTweensOf(tutorialMessageContainer,false);
   if(bShow)
   {
      if(delay == undefined)
      {
         delay = rewardEndTime;
      }
      tutorialMessageContainer._visible = true;
      gs.TweenLite.to(tutorialMessageContainer,0.2,{_alpha:0,onComplete:tutorialFinished1,onCompleteParams:[msg,delay]});
   }
   else
   {
      gs.TweenLite.to(tutorialMessageContainer,0.5,{_alpha:0,onComplete:tutorialFinished4});
   }
}
function tutorialFinished1(msg, delay)
{
   tutorialMessageContainer.txt.htmlText = msg;
   tutorialMessageContainer.txt._x = (- tutorialMessageContainer.txt.textWidth) / 2;
   tutorialMessageContainer.symbol._x = tutorialMessageContainer.txt._x - 50;
   tutorialMessageContainer.symbol._y = tutorialMessageContainer.txt._y - 5;
   tutorialMessageContainer.symbol.gotoAndPlay(2);
   gs.TweenLite.to(tutorialMessageContainer,0.5,{_alpha:100,onComplete:tutorialFinished2,onCompleteParams:[delay]});
}
function tutorialFinished2(delay)
{
   if(delay == undefined || delay == "")
   {
      delay = 3;
   }
   gs.TweenLite.to(tutorialMessageContainer,0.5,{delay:delay,_alpha:0,onComplete:tutorialFinished3});
}
function tutorialFinished3()
{
   tutorialMessageContainer._visible = false;
}
function tutorialFinished4()
{
   tutorialMessageContainer.symbol.gotoAndStop(1);
   tutorialMessageContainer._visible = false;
}
function addRootItem(id, img, enchantNum, itemName, quantity, grade, sealType, bMasterpiece)
{
   var _loc7_ = rootMessageContainer.getNextHighestDepth();
   var _loc3_ = rootMessageContainer.attachMovie("Slot3_link","root" + _loc7_,_loc7_);
   _loc3_.id = id;
   _loc3_.TEX = img;
   var _loc5_ = "";
   enchantNum = Number(enchantNum);
   quantity = Number(quantity);
   grade = Number(grade);
   _loc3_.draw(img);
   _loc3_.display = true;
   _loc3_.grade = grade;
   _loc3_.drag = fale;
   _loc3_.setLineNum(1);
   _loc3_.sealType = sealType;
   _loc3_.masterpiece = bMasterpiece;
   _loc3_.onEnterFrame = function()
   {
      if(this.TEX != undefined)
      {
         this.sealType = this.sealType;
         this.masterpiece = this.masterpiece;
         delete this.onEnterFrame;
      }
   };
   _loc3_.setDisableBg(true);
   if(enchantNum > 0)
   {
      _loc5_ = "+" + enchantNum + " ";
   }
   _loc5_ = _loc5_ + itemName;
   if(quantity > 1)
   {
      _loc5_ = _loc5_ + ("(" + quantity + ")");
   }
   _loc3_.upText = _loc5_;
   _loc3_._alpha = 0;
   _loc3_._y = _loc3_._y + 60;
   var _loc4_ = rootItem_array.length;
   var _loc2_ = 0;
   while(_loc2_ < _loc4_)
   {
      gs.TweenMax.to(rootItem_array[_loc2_],0.5,{_y:_loc2_ * -60 - 60,ease:Regular.easeOut});
      _loc2_ = _loc2_ + 1;
   }
   gs.TweenLite.killTweensOf(_loc3_,false);
   gs.TweenLite.to(_loc3_,0.5,{_y:_loc3_._y - 60,_alpha:100,ease:Regular.easeOut,onComplete:rootItemFinished1,onCompleteParams:[_loc3_]});
   rootItem_array.unshift(_loc3_);
}
function rootItemFinished1(target)
{
   gs.TweenMax.to(target,3,{delay:2,_alpha:0,ease:Regular.easeOut,onComplete:rootItemFinished2,onCompleteParams:[target]});
}
function rootItemFinished2(target)
{
   target.removeMovieClip();
   rootItem_array.pop();
}
function addEmblemMsg(bShow, msg, type, args)
{
   type = Number(type);
   if(type != 9)
   {
      return undefined;
   }
   if(bShow)
   {
      var _loc1_ = new Object();
      _loc1_.TYPE = type;
      _loc1_.MSG = msg;
      _loc1_.ARGS = args;
      emblemMsg_array.push(_loc1_);
      checkEmblemShow();
   }
}
function checkEmblemShow()
{
   var _loc5_ = emblemMsg_array.length;
   var _loc2_ = emblemMsg_array[_loc5_ - 1];
   if(_loc5_ <= 0)
   {
      gs.TweenMax.to(emblemMessageContainer,0.5,{_alpha:0,ease:Regular.easeOut,onComplete:emblemMessageFinished4});
   }
   else if(_loc5_ == 1)
   {
      if(_loc2_.TYPE == 25)
      {
         curType = 25;
         emblemMessageContainer.union._visible = true;
         emblemMessageContainer.emblem._visible = false;
         if(bAttach == false)
         {
            lib.util.DrawBitmap.draw(emblemMessageContainer.union,_loc2_.ARGS,100,100);
            bAttach = true;
         }
      }
      else
      {
         curType = _loc2_.TYPE;
         emblemMessageContainer.union._visible = false;
         emblemMessageContainer.emblem._visible = true;
      }
      emblemMessageContainer.alpha1.stop();
      emblemMessageContainer._visible = true;
      emblemMessageContainer.emblem._alpha = 0;
      emblemMessageContainer.union._alpha = 0;
      emblemMessageContainer.txt_mc._alpha = 0;
      gs.TweenMax.to(emblemMessageContainer,0.3,{_alpha:100,ease:Regular.easeOut});
      rotateEmblemMsg();
      rotateEmblem();
   }
   else
   {
      var _loc4_ = emblemMessageContainer.getNextHighestDepth();
      var _loc1_ = null;
      if(_loc2_.TYPE == 25)
      {
         _loc1_ = emblemMessageContainer.attachMovie("union","mini" + _loc4_,_loc4_);
         lib.util.DrawBitmap.draw(_loc1_,_loc2_.ARGS,100,100);
         if(bAttach == false)
         {
            lib.util.DrawBitmap.draw(emblemMessageContainer.union,_loc2_.ARGS,100,100);
            bAttach = true;
         }
      }
      else
      {
         _loc1_ = emblemMessageContainer.attachMovie("emblem","mini" + _loc4_,_loc4_);
      }
      var _loc3_ = _loc2_.TYPE;
      _loc2_.mc = _loc1_;
      if(_loc3_ == 8)
      {
         _loc1_.gotoAndStop(1);
      }
      else if(_loc3_ == 9)
      {
         _loc1_.gotoAndStop(4 + Number(_loc2_.ARGS));
      }
      else if(_loc3_ == 10)
      {
         _loc1_.gotoAndStop(2);
      }
      else if(_loc3_ == 13)
      {
         _loc1_.gotoAndStop(3);
      }
      else if(_loc3_ == 15)
      {
         _loc1_.gotoAndStop(7);
      }
      else if(_loc3_ == 24)
      {
         _loc1_.gotoAndStop(8);
      }
      _loc1_._alpha = 0;
      _loc1_._x = emblemMessageContainer.emblemX;
      _loc1_._y = emblemMessageContainer.emblemY;
   }
}
function rotateEmblemMsg()
{
   if(emblemMsg_array[0].TYPE == 15)
   {
      lib.manager.UISound.play(Number(emblemMsg_array[0].ARGS));
   }
   gs.TweenLite.to(emblemMessageContainer.txt_mc,0.2,{_alpha:0,onComplete:emblemMessageFinished});
}
function emblemMessageFinished()
{
   var _loc1_ = emblemMsg_array[0].MSG;
   if(!emblemMessageContainer.emblem._visible || emblemMessageContainer.emblem._currentframe > 13)
   {
      emblemMessageContainer.txt_mc.gotoAndStop(2);
   }
   else
   {
      emblemMessageContainer.txt_mc.gotoAndStop(1);
   }
   emblemMessageContainer.txt_mc.txt.verticalAlign = "center";
   emblemMessageContainer.txt_mc.txt.textAutoSize = "shrink";
   emblemMessageContainer.txt_mc.txt.setText(_loc1_);
   gs.TweenLite.to(emblemMessageContainer.txt_mc,0.3,{_alpha:100,onComplete:emblemMessageFinished2});
}
function emblemMessageFinished2()
{
   var _loc2_ = emblemMsg_array[0].TYPE;
   var _loc1_ = 2.5;
   if(_loc2_ == 8)
   {
      _loc1_ = 5;
   }
   gs.TweenLite.to(emblemMessageContainer.txt_mc,_loc1_,{_alpha:100,onComplete:emblemMessageFinished3});
}
function emblemMessageFinished3()
{
   emblemMsg_array.shift();
   if(emblemMsg_array.length > 0)
   {
      rotateEmblemMsg();
      rotateEmblem();
   }
   else
   {
      checkEmblemShow();
   }
}
function emblemMessageFinished4()
{
   emblemMessageContainer._visible = false;
}
function rotateEmblem()
{
   var _loc1_ = 0;
   while(_loc1_ < emblemMsg_array.length)
   {
      var _loc2_ = emblemMsg_array[_loc1_].mc;
      gs.TweenLite.killTweensOf(_loc2_,false);
      if(_loc1_ != 0)
      {
         if(_loc1_ == 1 || _loc1_ == 2)
         {
         }
      }
      _loc1_ = _loc1_ + 1;
   }
   rotateEmblemFinished2();
}
function rotateEmblemFinished(target)
{
   target.removeMovieClip();
}
function rotateEmblemFinished2()
{
   var _loc2_ = emblemMsg_array[0].TYPE;
   var _loc3_ = undefined;
   if(_loc2_ == 25)
   {
      emblemMessageContainer.union._visible = true;
      emblemMessageContainer.emblem._visible = false;
      _loc3_ = emblemMessageContainer.union;
   }
   else
   {
      emblemMessageContainer.union._visible = false;
      emblemMessageContainer.emblem._visible = true;
      _loc3_ = emblemMessageContainer.emblem;
   }
   emblemMessageContainer.emblem.txt.text = msg;
   if(_loc2_ == 8)
   {
      emblemMessageContainer.emblem.gotoAndStop(1);
   }
   else if(_loc2_ == 9)
   {
      emblemMessageContainer._visible = false;
      var _loc1_ = Number(emblemMsg_array[0].ARGS);
      achievementEffectType = _loc1_;
      unload(achievementEffectContainer);
      if(_loc1_ == 6 || _loc1_ == 1 || _loc1_ == 2 || _loc1_ == 3)
      {
         achievementEffectContainer.loadMovie("/package/S1UIRES_Effect.AchievEffect_Rare.swf");
      }
      else if(_loc1_ == 7 || _loc1_ == 4 || _loc1_ == 5)
      {
         achievementEffectContainer.loadMovie("/package/S1UIRES_Effect.AchievEffect_Unique.swf");
      }
      emblemMessageContainer.emblem.gotoAndStop(8 + _loc1_);
   }
   else if(_loc2_ == 10)
   {
      emblemMessageContainer.emblem.gotoAndStop(2);
   }
   else if(_loc2_ == 13)
   {
      emblemMessageContainer.emblem.gotoAndStop(3);
   }
   else if(_loc2_ == 15)
   {
      emblemMessageContainer.emblem.gotoAndStop(7);
   }
   else if(_loc2_ == 24)
   {
      emblemMessageContainer.emblem.gotoAndStop(8);
   }
   gs.TweenLite.killTweensOf(_loc3_,false);
   _loc3_._alpha = 0;
   gs.TweenLite.to(_loc3_,0.2,{_alpha:100,ease:Back.easeOut});
}
function addNpcMsg(bShow, msgStr, id, nameStr, img)
{
   var _loc1_ = undefined;
   var _loc2_ = undefined;
   npcMsgContainer._xscale = npcMsgContainer._yscale = 100;
   if(npcMsgFocus == 0)
   {
      _loc1_ = npcMsgContainer.mc0;
      _loc2_ = npcMsgContainer.mc1;
      npcMsgFocus = 1;
   }
   else
   {
      _loc1_ = npcMsgContainer.mc1;
      _loc2_ = npcMsgContainer.mc0;
      npcMsgFocus = 0;
   }
   if(_loc2_._alpha > 0)
   {
      gs.TweenLite.to(_loc2_,0.5,{_x:npcMsgPosition,_alpha:0,ease:gs.easing.Strong.easeIn});
   }
   _loc1_.nameTxt.htmlText = nameStr;
   _loc1_.conTxt.html = true;
   _loc1_.conTxt.htmlText = msgStr;
   lib.util.DrawBitmap.draw(_loc1_.npcImg,img,256,256);
   _loc1_._alpha = 0;
   _loc1_._visible = true;
   _loc1_._x = npcMsgPosition;
   gs.TweenLite.to(_loc1_,0.5,{delay:0.2,_x:0,_alpha:100,ease:gs.easing.Strong.easeOut});
}
function npcFinished()
{
   npcMsgContainer.mc0._alpha = 0;
   npcMsgContainer.mc0._visible = false;
}
function addAwakenMsg(msg, imgPath)
{
   var _loc1_ = new Object();
   _loc1_.msg = msg;
   _loc1_.imgPath = imgPath;
   awakenMsgArray.push(_loc1_);
   var _loc2_ = awakenMsgArray.length;
   if(_loc2_ < 2)
   {
      setAwakenSkillInfo();
      awakenSkillMessage._visible = true;
      awakenSkillMessage._xscale = awakenSkillMessage._yscale = 100;
      awakenSkillMessage.play();
   }
}
function checkAwakenMsg()
{
   var _loc3_ = awakenMsgArray.length;
   if(1 < _loc3_)
   {
      awakenMsgArray.shift();
      var _loc2_ = awakenSkillMessage.changeSkillMc;
      if(undefined == _loc2_)
      {
         _loc2_ = awakenSkillMessage.attachMovie("awakenSkillChangeMc","changeSkillMc",awakenSkillMessage.getNextHighestDepth());
         _loc2_._x = -174;
         _loc2_._y = -43;
      }
      _loc2_.gotoAndStop(1);
      _loc2_._visible = true;
      _loc2_.onEnterFrame = function()
      {
         this.nextFrame();
         if(this._currentframe == awakenSkillChangeFrame)
         {
            setAwakenSkillInfo();
         }
         else if(this._currentframe == this._totalframes)
         {
            delete this.onEnterFrame;
            this.onEnterFrame = null;
            this.gotoAndStop(1);
            this._visible = false;
            checkAwakenMsg();
         }
      };
   }
   else
   {
      awakenSkillMessage.play();
   }
}
function setAwakenSkillInfo()
{
   var _loc1_ = awakenMsgArray[0];
   var _loc3_ = _loc1_.msg;
   var _loc4_ = _loc1_.imgPath;
   var _loc2_ = flash.display.BitmapData.loadBitmap(_loc4_);
   lib.display.DrawBitmapData.draw(awakenSkillMessage.icon,_loc2_,0,0,0,0,64,64,1);
   awakenSkillMessage.skillName.tf.text = _loc3_;
}
function endAwakenSkillMsg()
{
   awakenMsgArray.shift();
   var _loc1_ = awakenMsgArray.length;
   if(0 < _loc1_)
   {
      awakenSkillMessage._visible = false;
      awakenSkillMessage.gotoAndStop(1);
      setAwakenSkillInfo();
      awakenSkillMessage.gotoAndPlay(1);
      awakenSkillMessage._visible = true;
   }
   else
   {
      awakenSkillMessage._visible = false;
      awakenSkillMessage.gotoAndStop(1);
   }
}
function addMovieMsg(bShow, msg)
{
   gs.TweenLite.killTweensOf(movieMessageContainer,false);
   if(bShow)
   {
      movieMessageContainer._visible = true;
      gs.TweenLite.to(movieMessageContainer,0.2,{_alpha:0,onComplete:movieMessageFinished,onCompleteParams:[msg]});
      if(getMsgMc(movieMessageContainer) == null)
      {
         totalMsg_array.push(movieMessageContainer);
      }
   }
   else
   {
      gs.TweenLite.to(movieMessageContainer,0.5,{_alpha:0,onComplete:movieMessageFinished2});
   }
   return movieMessageContainer;
}
function movieMessageFinished(msg)
{
   movieMessageContainer.txt.text = msg;
   movieMessageContainer.txt._x = (- movieMessageContainer.txt._width) / 2;
   gs.TweenLite.killTweensOf(movieMessageContainer,false);
   gs.TweenLite.to(movieMessageContainer,0.5,{_alpha:100});
}
function movieMessageFinished2()
{
   movieMessageContainer._visible = false;
}
function showLoadingMsg(id, msg)
{
   myListener.OnGame_Message_SkillEnable(false);
   loadingMessageContainer.type = 14;
   loadingMessageContainer._visible = true;
   loadingMessageContainer.id = id;
   loadingMessageContainer.txt.htmlText = msg;
   loadingMessageContainer.txt._x = (- loadingMessageContainer.txt._width) / 2;
   if(getMsgMc(loadingMessageContainer) == null)
   {
      totalMsg_array.push(loadingMessageContainer);
   }
}
function showDefenseMsg(bShow, _msg, _type)
{
   gs.TweenLite.killTweensOf(shieldDefenceMessageContainer,false);
   if(bShow)
   {
      shieldDefenceMessageContainer.gotoAndStop(Number(_type) + 1);
      shieldDefenceMessageContainer.txt.text = shield_Str[_type];
      shieldDefenceMessageContainer.txt0.htmlText = _msg;
      shieldDefenceMessageContainer._alpha = 100;
      if(shieldDefenceMessageContainer._visible)
      {
         shieldDefenceMessageContainer.effect.gotoAndPlay(1);
      }
      else
      {
         shieldDefenceMessageContainer._visible = true;
         shieldDefenceMessageContainer.effect.gotoAndPlay(1);
      }
      gs.TweenLite.to(shieldDefenceMessageContainer,0.5,{_alpha:100,onComplete:DefenceMessageFinished});
   }
   else
   {
      gs.TweenLite.to(shieldDefenceMessageContainer,2.5,{_alpha:0,onComplete:DefenceMessageFinished2});
   }
   return shieldDefenceMessageContainer;
}
function DefenceMessageFinished()
{
   showDefenseMsg(false);
}
function DefenceMessageFinished2()
{
   shieldDefenceMessageContainer._visible = false;
}
function showItemNeedMsg(bShow, msg, type, itemId, itemImg, itemGrade, sealType, bMasterpiece)
{
   gs.TweenLite.killTweensOf(itemNeedMessageContainer,false);
   if(bShow)
   {
      var _loc1_ = itemNeedMessageContainer.slot;
      _loc1_.id = itemId;
      _loc1_.TEX = itemImg;
      _loc1_.draw(itemImg);
      _loc1_.display = true;
      _loc1_.grade = Number(itemGrade);
      _loc1_.drag = false;
      _loc1_.effect = false;
      _loc1_.sealType = sealType;
      _loc1_.masterpiece = bMasterpiece;
      itemNeedMessageContainer._visible = true;
      gs.TweenLite.to(itemNeedMessageContainer,0.2,{_alpha:0,onComplete:itemNeedMessageFinished,onCompleteParams:[type,msg]});
      if(getMsgMc(itemNeedMessageContainer) == null)
      {
         totalMsg_array.push(itemNeedMessageContainer);
      }
   }
   else
   {
      gs.TweenLite.to(itemNeedMessageContainer,0.2,{_alpha:0,onComplete:itemNeedMessageFinished2});
   }
   return itemNeedMessageContainer;
}
function itemNeedMessageFinished(type, msg)
{
   itemNeedMessageContainer.gotoAndStop(Number(type) + 1);
   if(itemNeedMessageContainer._currentframe == 1)
   {
      itemNeedMessageContainer.txt._visible = true;
      itemNeedMessageContainer.txt2._visible = false;
   }
   else
   {
      itemNeedMessageContainer.txt._visible = false;
      itemNeedMessageContainer.txt2._visible = true;
   }
   itemNeedMessageContainer.txt.autoSize = true;
   itemNeedMessageContainer.txt.htmlText = msg;
   itemNeedMessageContainer.txt._x = (- itemNeedMessageContainer.txt._width) / 2;
   itemNeedMessageContainer.slot._x = itemNeedMessageContainer.txt._x - itemNeedMessageContainer.slot._width - 5;
   itemNeedMessageContainer.txt2.autoSize = true;
   itemNeedMessageContainer.txt2.htmlText = msg;
   itemNeedMessageContainer.txt2._x = (- itemNeedMessageContainer.txt2._width) / 2;
   itemNeedMessageContainer.slot._x = itemNeedMessageContainer.txt2._x - itemNeedMessageContainer.slot._width - 5;
   itemNeedMessageContainer.shadow._x = itemNeedMessageContainer.slot._x - 1;
   gs.TweenLite.to(itemNeedMessageContainer,0.5,{_alpha:100});
}
function itemNeedMessageFinished2()
{
   itemNeedMessageContainer._visible = false;
}
function GuildWarMotion_Init()
{
   UI.GuildWarMotionMc.GuildMc1.gotoAndStop("end");
   UI.GuildWarMotionMc.GuildMc2.gotoAndStop("end");
   UI.GuildWarMotionMc.GuildMc3.gotoAndStop("end");
   UI.GuildWarMotionMc.GuildMc4.gotoAndStop("end");
   UI.GuildWarMotionMc.GuildMc5.gotoAndStop("end");
}
function GuildWarMotion_Request()
{
   var _loc1_ = {};
   var _loc2_ = new MovieClipLoader();
   _loc2_.addListener(_loc1_);
   _loc2_.loadClip("/package/S1UIRES_Effect.GuildWarMotion.swf",UI.GuildWarMotionMc);
   _loc1_.onLoadComplete = function(target_mc, status)
   {
   };
}
function addBFMsg(str, type, img, time, container)
{
   var _loc5_ = str + "_" + type + "_" + img;
   if(prevImportantMessage == _loc5_)
   {
      return undefined;
   }
   prevImportantMessage = _loc5_;
   clearInterval(importantInterval);
   importantInterval = setInterval(this,"importantComp",time * 1000);
   var _loc6_ = container.getNextHighestDepth();
   var _loc2_ = (g4.view.message.MessageImportant)container.attachMovie("MessageImportant","message" + _loc6_,_loc6_);
   if(str.indexOf("asfunction") == -1)
   {
      _loc2_.hitTestDisable = true;
   }
   _loc2_.setData(str,type,img,time);
   var _loc3_ = items_important.length;
   if(_loc3_ == 0)
   {
      _loc2_._y = 0;
   }
   else if(_loc3_ == 1)
   {
      _loc2_._y = 34;
   }
   else if(_loc3_ == 2)
   {
      var _loc4_ = (g4.view.message.MessageImportant)items_important.shift();
      _loc4_.fadeOut();
      _loc4_ = (g4.view.message.MessageImportant)items_important[0];
      _loc4_.moveUp();
      _loc2_._y = 34;
   }
   items_important.push(_loc2_);
}
function importantComp()
{
   clearInterval(importantInterval);
   prevImportantMessage = "";
}
function addKLMsg(str, type, ally, enemy, container)
{
   var _loc3_ = container.getNextHighestDepth();
   var _loc1_ = container.attachMovie("klmessage","message" + _loc3_,_loc3_);
   if(str.indexOf("asfunction") == -1)
   {
      _loc1_.hitTestDisable = true;
   }
   _loc1_._y = 0;
   _loc1_._alpha = 0;
   _loc1_.currentLine = 0;
   _loc1_.cnt = 0;
   _loc1_.gotoAndStop(Number(type) + 1);
   if(ally != "-1")
   {
      _loc1_.txt0.text = ally;
   }
   if(enemy != "-1")
   {
      _loc1_.txt1.text = enemy;
   }
   else
   {
      _loc1_.iconMc.gotoAndStop(2);
   }
   if(type == 0)
   {
      _loc1_.txt1._x = - _loc1_.txt1.textWidth + 18;
      _loc1_.iconMc._x = _loc1_.txt1._x - 42;
      _loc1_.txt0._x = _loc1_.iconMc._x - (_loc1_.txt0.textWidth + 10);
   }
   else if(type == 1)
   {
      _loc1_.txt0._x = - _loc1_.txt0.textWidth + 18;
      _loc1_.iconMc._x = _loc1_.txt0._x - 42;
      _loc1_.txt1._x = _loc1_.iconMc._x - (_loc1_.txt1.textWidth + 10);
   }
   else if(type == 2)
   {
      _loc1_.txt2.htmlText = enemy;
      _loc1_.txt2._x = - _loc1_.txt2.textWidth + 18;
      _loc1_.txt0._x = _loc1_.txt2._x - (_loc1_.txt0.textWidth + 5);
   }
   else
   {
      _loc1_.txt2.htmlText = ally;
      _loc1_.txt1.text = enemy;
      _loc1_.txt2._x = - _loc1_.txt2.textWidth + 18;
      _loc1_.txt1._x = _loc1_.txt2._x - (_loc1_.txt1.textWidth + 5);
   }
   setLifeTime(_loc1_,pushedFadeOutTime);
   pushKLMessage(container,maxBFLine);
}
function skillHandlerClick()
{
   ToGame_Message_LevelUpClick();
}
function SetMultiply(_targetMc, _num)
{
   if(_num > 1)
   {
      _targetMc._visible = true;
      _targetMc.txt.text = _num;
      _targetMc.mc._x = 30 - _targetMc.txt.textWidth / 2;
   }
   else
   {
      _targetMc._visible = false;
   }
}
function SyetemMessage(titleStr, subStr, clearID)
{
}
function ToGame_Message_ButtonClick(idx)
{
   getURL("FSCommand:ToGame_Message_ButtonClick",idx);
}
function ToGame_Message_LevelUpClick()
{
   fscommand("ToGame_Message_LevelUpClick");
}
function CreateMessageBox(mc, idx, typeStr, rewardStr)
{
   var _loc8_ = mc.attachMovie("messageBox","messageBox" + idx,idx);
   _loc8_._alpha = 0;
   _loc8_.txt.verticalAlign = "center";
   var _loc13_ = rewardStr;
   var _loc12_ = rewardStr.split("\t");
   var _loc3_ = 0;
   while(_loc3_ < _loc12_.length)
   {
      var _loc1_ = _loc12_[_loc3_];
      var _loc5_ = _loc1_.substring(1,5);
      if(_loc5_ == "item")
      {
         var _loc9_ = _loc1_.indexOf("<");
         var _loc11_ = _loc1_.indexOf(">") + 1;
         var _loc7_ = _loc1_.substring(_loc9_,_loc11_);
         var _loc2_ = lib.util.ExtString.findTag(_loc7_,"item");
         var _loc6_ = _loc2_[0].src;
         var _loc4_ = Number(_loc2_[0].grade);
         var _loc10_ = Number(_loc2_[0].count);
         _loc13_ = _loc13_ + ("(" + _loc10_ + ")");
         lib.display.DrawBitmapData.draw(_loc8_.img,_loc6_,0,0,0,0,36,36,rewardItemSize);
         if(_loc4_ > 0)
         {
            lib.display.DrawBitmapData.draw(_loc8_.img,UI["gradeBm" + _loc4_],0,0,0,0,12,12,rewardGradeSize);
         }
      }
      _loc3_ = _loc3_ + 1;
   }
   _loc8_.txt.htmlText = _loc13_;
   return _loc8_;
}
function SetTxt(subTxt, str)
{
   subTxt.verticalAlign = "center";
   subTxt.shadowColor = shadowColorType;
   subTxt.textColor = fontColorType;
   subTxt.setText(str);
   subTxt._visible = true;
   subTxt._width = subTxt.textWidth + 5;
   textPos = textPos + subTxt._width;
}
function MessageClear(mc, timer)
{
   gs.TweenMax.to(mc,1,{delay:timer,_alpha:0,onComplete:function()
   {
      mc.removeMovieClip();
   }});
}
function SetKey(keyCode, txt)
{
   var _loc1_ = lib.info.KeyMap.toKeyCode(keyCode);
   if(lib.util.ExtString.isOverLenght(txt,_loc1_))
   {
      _loc1_ = "";
   }
   return _loc1_;
}
function tick()
{
   clearInterval(testInterval);
   myListener.OnGame_Message_Add(1,-1,"123");
}
function tick2()
{
   switch(testIndex)
   {
      case 0:
         myListener.OnGame_Message_Add(25,-1,"This is a system message","0\t11111\tbbbbb");
         break;
      case 1:
         myListener.OnGame_Message_Add(25,-1,"This is a system message","0\t22222\tCCCCC");
         break;
      case 2:
         myListener.OnGame_Message_Add(25,-1,"This is a system message","0\t33333\tdddd");
         break;
      case 3:
         myListener.OnGame_Message_Add(25,-1,"This is a system message","0\t44444\teeee");
         break;
      case 4:
         myListener.OnGame_Message_Add(25,-1,"This is a system message","0\t55555\tffff");
         break;
      case 5:
         clearInterval(testInterval);
   }
   testIndex++;
}
if(_global.gfxPlayer)
{
   UI._visible = true;
   testInterval = setInterval(this,"tick",1000);
}
var testInterval;
var testIndex = 0;
