class lib.src.QuestTaskPartyMc extends MovieClip
{
   var bUIMode = 0;
   var savedFullName = "";
   var questType = 0;
   static var SOUND_CLICK = lib.manager.UISound.MAIN_BTN;
   static var STR_CLOSE = lib.util.UIString.getUIString("$102001");
   static var STR_STEP = "$093006";
   static var COLOR_CANT_PROGRESS = lib.info.TextColor.GENERAL_IMPOSSIBLE;
   static var COLOR_QUEST_COMPLETE = lib.info.TextColor.UI_QUESTINFO_COMPLETE;
   static var COLOR_LOW_EXP = lib.info.TextColor.UI_QUESTINFO_NAME_LOWEXP;
   static var COLOR_TASK_COMPLETE = lib.info.TextColor.UI_QUESTINFO_FULL;
   static var COLOR_TASK_NOCOMPLETE = lib.info.TextColor.UI_QUESTINFO_SHORT;
   static var COLOR_PARTYMEMBER = lib.info.TextColor.CHAT_PARTY;
   static var COLOR_QUESTTYPE_MISSION = lib.info.TextColor.UI_QUESTINFO_NAME_MISSION;
   static var COLOR_QUESTTYPE_GUILD = lib.info.TextColor.UI_QUESTINFO_NAME_GUILD;
   static var COLOR_QUESTTYPE_NORMAL = lib.info.TextColor.UI_QUESTINFO_NAME;
   static var COLOR_COMPLETE = lib.info.TextColor.FILL_FULL;
   function QuestTaskPartyMc()
   {
      super();
      this.titleBg_mc.hitTestDisable = true;
      this.focus_mc.hitTestDisable = true;
      this.init();
      this.createButtonEvent();
   }
   function init()
   {
      this.clear();
      this.focus_mc._visible = false;
      this.name_txt.text = "";
      this.task_txt.text = "";
      this.partyMemberRawDatas = [];
      this.partyMemberDatas = [];
      this.createButtonEvent();
      lib.manager.ToolTip.add(this.close_mc,lib.src.QuestTaskPartyMc.STR_CLOSE,1);
   }
   function createButtonEvent()
   {
      var _this = this;
      this.close_mc.onRollOver = function()
      {
         this.gotoAndStop(2);
      };
      this.close_mc.onRollOut = function()
      {
         this.gotoAndStop(1);
      };
      this.close_mc.onPress = function()
      {
         this.gotoAndStop(3);
      };
      this.close_mc.onReleaseOutside = function()
      {
         this.gotoAndStop(1);
      };
      this.close_mc.onRelease = function()
      {
         lib.manager.UISound.play(lib.src.QuestTaskPartyMc.SOUND_CLICK);
         this.mc.gotoAndStop(2);
         this.onRollOver();
         _this.onReleaseCloseBtn();
      };
   }
   function setLabel(str)
   {
      this.savedFullName = str;
      this.name_txt.setText(str);
      this.setQuestType(this.questType);
   }
   function getLabel()
   {
      return this.savedFullName;
   }
   function setLabelColor(color)
   {
      this.name_txt.textColor = color;
   }
   function setUIMode(bTrue)
   {
      this.bUIMode = Number(bTrue);
      if(this.bUIMode)
      {
         this.close_mc._visible = true;
         this.bg_mc._alpha = 100;
         this.titleBg_mc._alpha = 100;
      }
      else
      {
         this.close_mc._visible = false;
         this.bg_mc._alpha = 30;
         this.titleBg_mc._alpha = 10;
      }
   }
   function getBase()
   {
      return this.base;
   }
   function setBase(_base)
   {
      this.base = _base;
   }
   function resizeFrame()
   {
      var _loc2_ = this.task_txt._y + this.task_txt._height;
      this.bg_mc._height = _loc2_;
      this.focus_mc._height = _loc2_ + 1;
   }
   function updateTask(index, str, curCount, totalCount, performer, taskStep)
   {
      this.partyMemberRawDatas[index] = {str:str,curCount:curCount,totalCount:totalCount,performer:performer,step:taskStep};
      var _loc2_ = this.parsePartyTaskToHtml();
      this.task_txt.htmlText = _loc2_;
      this.task_txt._height = this.task_txt.textHeight + 5;
      this.resizeFrame();
   }
   function clearTask()
   {
      this.partyMemberRawDatas = [];
      this.partyMemberDatas = [];
      this.task_txt.text = "";
   }
   function setQuestType(type)
   {
      this.questType = Number(type);
      if(this.questType == 0)
      {
         this.setLabelColor(lib.src.QuestTaskPartyMc.COLOR_QUESTTYPE_NORMAL);
      }
      else if(this.questType == 1)
      {
         this.setLabelColor(lib.src.QuestTaskPartyMc.COLOR_QUESTTYPE_MISSION);
      }
      else if(this.questType == 2)
      {
         this.setLabelColor(lib.src.QuestTaskPartyMc.COLOR_QUESTTYPE_GUILD);
      }
   }
   function getQuestType()
   {
      return this.questType;
   }
   function showFocusEffect()
   {
      this.focus_mc._visible = true;
      this.focus_mc.gotoAndPlay(2);
   }
   function hideFocusEffect()
   {
      this.focus_mc._visible = false;
      this.focus_mc.gotoAndStop(1);
   }
   function searchPartyMember(memberName)
   {
      var _loc2_ = 0;
      while(_loc2_ < this.partyMemberDatas.length)
      {
         if(this.partyMemberDatas[_loc2_].performer == memberName)
         {
            return _loc2_;
         }
         _loc2_ = _loc2_ + 1;
      }
      return null;
   }
   function parsePartyTaskToHtml()
   {
      this.partyMemberDatas = [];
      var _loc14_ = 0;
      while(_loc14_ < this.partyMemberRawDatas.length)
      {
         var _loc2_ = this.partyMemberRawDatas[_loc14_];
         var _loc15_ = this.searchPartyMember(_loc2_.performer);
         var _loc12_ = this.partyMemberDatas[_loc15_];
         if(_loc15_ == null)
         {
            _loc12_ = {performer:_loc2_.performer,step:_loc2_.step,tasks:new Array()};
            this.partyMemberDatas.push(_loc12_);
         }
         this.partyMemberDatas.sortOn(["performer"]);
         var _loc10_ = false;
         if(_loc2_.curCount == 0 && _loc2_.totalCount == 0)
         {
            _loc2_.curCount = "";
            _loc2_.totalCount = "";
         }
         else if(_loc2_.curCount == 1 && (_loc2_.totalCount == 0 || _loc2_.totalCount == 1))
         {
            _loc2_.curCount = "";
            _loc2_.totalCount = "";
            _loc10_ = true;
         }
         else if(_loc2_.totalCount > 1)
         {
            if(_loc2_.curCount == _loc2_.totalCount)
            {
               _loc10_ = true;
            }
         }
         else
         {
            _loc2_.curCount = "";
            _loc2_.totalCount = "";
         }
         _loc12_.tasks.push({str:_loc2_.str,curCount:_loc2_.curCount,totalCount:_loc2_.totalCount,bComplete:_loc10_});
         _loc14_ = _loc14_ + 1;
      }
      var _loc22_ = "";
      _loc14_ = 0;
      while(_loc14_ < this.partyMemberDatas.length)
      {
         var _loc3_ = this.partyMemberDatas[_loc14_];
         var _loc17_ = "<FONT color=\'#" + lib.src.QuestTaskPartyMc.COLOR_COMPLETE.toString(16) + "\'>" + _loc3_.performer + "[" + lib.util.UIString.getUIString(lib.src.QuestTaskPartyMc.STR_STEP,"StepCount",_loc3_.step) + "]" + "</FONT><BR>";
         var _loc16_ = "<FONT color=\'#" + lib.src.QuestTaskPartyMc.COLOR_PARTYMEMBER.toString(16) + "\'>" + _loc3_.performer + "</FONT>";
         _loc16_ = _loc16_ + ("<FONT color=\'#" + lib.src.QuestTaskPartyMc.COLOR_TASK_NOCOMPLETE.toString(16) + "\'>" + "[" + lib.util.UIString.getUIString(lib.src.QuestTaskPartyMc.STR_STEP,"StepCount",_loc3_.step) + "]" + "</FONT><BR>");
         var _loc13_ = 0;
         var _loc11_ = false;
         var _loc7_ = 0;
         while(_loc7_ < _loc3_.tasks.length)
         {
            if(_loc3_.tasks[_loc7_].bComplete)
            {
               _loc13_ = _loc13_ + 1;
            }
            _loc7_ = _loc7_ + 1;
         }
         if(_loc13_ == _loc3_.tasks.length)
         {
            _loc11_ = true;
         }
         var _loc4_ = "";
         _loc7_ = 0;
         while(_loc7_ < _loc3_.tasks.length)
         {
            var _loc6_ = _loc3_.tasks[_loc7_];
            var _loc5_ = _loc6_.str;
            var _loc9_ = _loc6_.curCount;
            var _loc8_ = _loc6_.totalCount;
            _loc10_ = _loc6_.bComplete;
            if(_loc9_ != "" && _loc8_ != "")
            {
               _loc5_ = _loc5_ + (" &lt;" + _loc9_ + "/" + _loc8_ + "&gt;");
            }
            if(_loc11_)
            {
               _loc4_ = _loc4_ + ("  <FONT color=\'#" + lib.src.QuestTaskPartyMc.COLOR_COMPLETE.toString(16) + "\'>" + _loc5_ + "</FONT>" + "<BR>");
            }
            else if(_loc10_)
            {
               _loc4_ = _loc4_ + ("  <FONT color=\'#" + lib.src.QuestTaskPartyMc.COLOR_TASK_COMPLETE.toString(16) + "\'>" + _loc5_ + "</FONT>" + "<BR>");
            }
            else
            {
               _loc4_ = _loc4_ + ("  <FONT color=\'#" + lib.src.QuestTaskPartyMc.COLOR_TASK_NOCOMPLETE.toString(16) + "\'>" + _loc5_ + "</FONT>" + "<BR>");
            }
            _loc7_ = _loc7_ + 1;
         }
         _loc4_ = !_loc11_?_loc16_ + _loc4_:_loc17_ + _loc4_;
         _loc22_ = _loc22_ + (_loc4_ + "<BR>");
         _loc14_ = _loc14_ + 1;
      }
      return _loc22_;
   }
}
