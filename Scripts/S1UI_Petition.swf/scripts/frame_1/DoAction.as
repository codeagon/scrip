function ToGame_Petition_Init()
{
   fscommand("ToGame_Petition_Init");
}
function ToGame_Petition_Close()
{
   if(initMode == 3 || initMode == 5)
   {
      fscommand("ToGame_Petition_CloseCheck");
   }
   else if(initMode == 4)
   {
      fscommand("ToGame_Petition_CloseChat");
   }
   else
   {
      fscommand("ToGame_Petition_Close");
   }
}
function ToGame_Petition_RequestFaqContents(id)
{
   getURL("FSCommand:ToGame_Petition_RequestFaqContents",id);
}
function ToGame_Petition_RequestTerapia()
{
   Selection.setSelection(-1,-1);
   fscommand("ToGame_Petition_RequestTerapia");
}
function ToGame_Petition_EditQuestion()
{
   fscommand("ToGame_Petition_EditQuestion");
}
function ToGame_Petition_RequestPetition()
{
   var _loc3_ = container_mc.writeContainerMc.titleFd.text;
   var _loc4_ = container_mc.writeContainerMc.contentsFd.text;
   var _loc2_ = "";
   var _loc1_ = 0;
   while(_loc1_ < inputFds.length - 2)
   {
      _loc2_ = _loc2_ + ("\t" + inputFds[_loc1_].text);
      _loc1_ = _loc1_ + 1;
   }
   getURL("FSCommand:ToGame_Petition_RequestPetition",_loc3_ + "\t" + _loc4_ + _loc2_);
}
function ToGame_Petition_CancelPetition()
{
   fscommand("ToGame_Petition_CancelPetition");
}
function ToGame_Petition_RequestSurvey()
{
   fscommand("ToGame_Petition_RequestSurvey");
}
function ToGame_Petition_ResultSurvey()
{
   var _loc1_ = container_mc.surveyContainerMc.checked;
   var _loc2_ = container_mc.surveyContainerMc.contentsFd.text;
   sendSuv_btn.setEnabled(false);
   isSendResult = true;
   getURL("FSCommand:ToGame_Petition_ResultSurvey",_loc1_ + "\t" + _loc2_);
}
function ToGame_Petition_SendMessage(_message)
{
   container_mc.councelContainerMc.inputFd.text = "";
   send_btn.setEnabled(false);
   _message = lib.util.ExtString.trim(_message);
   _message = lib.util.ExtString.replaceBracket(_message);
   if(_message == undefined || _message == "")
   {
      return undefined;
   }
   getURL("FSCommand:ToGame_Petition_SendMessage",_message);
}
function selectCategory(id)
{
   Selection.setSelection(0,0);
   if(selectCategoryId == id)
   {
      return undefined;
   }
   var _loc2_ = categoryData[id].pid != 0 && id != 0;
   write_btn.setEnabled(_loc2_);
   selectCategoryId = id;
   if(initMode == 1)
   {
      initFrame();
   }
   ToGame_Petition_RequestFaqContents(selectCategoryId);
   lib.manager.UISound.play(lib.manager.UISound.MAIN_BTN);
}
function initFrame(frame)
{
   if(initMode == 0)
   {
      container_mc.atext_name.text = titleStr[0];
   }
   else
   {
      container_mc.atext_name.text = titleStr[initMode - 1];
   }
   container_mc.faqContainerMc._visible = initMode <= 2 || initMode == 6;
   container_mc.writeContainerMc._visible = initMode == 1;
   container_mc.readyContainerMc._visible = initMode == 2;
   container_mc.answerContainerMc._visible = initMode == 3;
   container_mc.councelContainerMc._visible = initMode == 4;
   container_mc.surveyContainerMc._visible = initMode == 5;
   container_mc.passiveContainerMc._visible = initMode == 6;
   write_btn.setVisible(initMode == 0);
   if(initMode == 1)
   {
      if(submit_btn == undefined)
      {
         container_mc.writeContainerMc.submitBtn.onLoad = function()
         {
            submit_btn = container_mc.writeContainerMc.submitBtn.txtBtn;
            submit_btn.setRelease(ToGame_Petition_RequestPetition);
         };
         submit_btn = container_mc.writeContainerMc.submitBtn.txtBtn;
         submit_btn.setRelease(ToGame_Petition_RequestPetition);
      }
      container_mc.writeContainerMc.titleFd.text = "";
      container_mc.writeContainerMc.contentsFd.text = "";
      for(var _loc4_ in container_mc.writeContainerMc.inputMcContainer)
      {
         container_mc.writeContainerMc.inputMcContainer[_loc4_].removeMovieClip();
      }
      inputFds = [];
      if(writeStateHs[0] == undefined)
      {
         writeStateHs = [container_mc.writeContainerMc.inputMcContainer._y,container_mc.writeContainerMc.bgmc._height,container_mc.writeContainerMc.contentsFd._height,container_mc.writeContainerMc.contentsFd_focus._height];
      }
      var _loc9_ = categoryData[selectCategoryId];
      var _loc10_ = _loc9_._inputs.length;
      var _loc8_ = undefined;
      _loc4_ = 0;
      while(_loc4_ < _loc10_)
      {
         var _loc3_ = lib.util.ExtString.split(_loc9_._inputs[_loc4_],"\t");
         if(_loc3_[0] == undefined || _loc3_[0] == "")
         {
            break;
         }
         var _loc2_ = container_mc.writeContainerMc.inputMcContainer.attachMovie("inputFdMc","inputFdMc" + _loc4_,container_mc.writeContainerMc.inputMcContainer.getNextHighestDepth());
         inputFds.push(_loc2_.inputFd);
         _loc2_._y = _loc8_._y + _loc8_._height - 3;
         _loc2_.titleFd.text = _loc3_[0];
         var _loc7_ = int(Number(_loc3_[1]) / 35);
         _loc2_.inputFd._height = _loc2_.inputFd._height + _loc2_.inputFd._height * _loc7_;
         _loc2_.bgMc._height = _loc2_.bgMc._height + _loc2_.bgMc._height * _loc7_;
         _loc2_.inputFd.maxChars = Number(_loc3_[1]);
         _loc8_ = _loc2_;
         _loc4_ = _loc4_ + 1;
      }
      var _loc11_ = container_mc.writeContainerMc.inputMcContainer._height - 3;
      container_mc.writeContainerMc.inputMcContainer._y = writeStateHs[0] - _loc11_;
      container_mc.writeContainerMc.bgmc._height = writeStateHs[1] - _loc11_;
      container_mc.writeContainerMc.contentsFd._height = writeStateHs[2] - _loc11_;
      container_mc.writeContainerMc.contentsFd_focus._height = writeStateHs[3] - _loc11_;
      inputFds.push(container_mc.writeContainerMc.titleFd);
      inputFds.push(container_mc.writeContainerMc.contentsFd);
      initInputFds();
      submit_btn.setVisible(true);
      submit_btn.setEnabled(false);
      Selection.setFocus(container_mc.writeContainerMc.titleFd);
      var _loc12_ = categoryData[selectCategoryId].pid != 0 && selectCategoryId != 0;
      container_mc.writeContainerMc._visible = _loc12_;
   }
   else if(initMode == 2)
   {
      if(cancel_btn == undefined)
      {
         container_mc.readyContainerMc.cancelBtn.onLoad = function()
         {
            cancel_btn = container_mc.readyContainerMc.cancelBtn.txtBtn;
            cancel_btn.setRelease(ToGame_Petition_CancelPetition);
         };
         cancel_btn = container_mc.readyContainerMc.cancelBtn.txtBtn;
         cancel_btn.setRelease(ToGame_Petition_CancelPetition);
      }
      cancel_btn.setEnabled(cancelBtnState);
      container_mc.readyContainerMc.contents0Fd.text = requestStr;
      container_mc.readyContainerMc.contents1Fd.text = readyStr;
   }
   else if(initMode == 3)
   {
      if(survey_btn == undefined)
      {
         container_mc.answerContainerMc.surveyBtn.onLoad = function()
         {
            survey_btn = container_mc.answerContainerMc.surveyBtn.txtBtn;
            survey_btn.setRelease(ToGame_Petition_RequestSurvey);
         };
         survey_btn = container_mc.answerContainerMc.surveyBtn.txtBtn;
         survey_btn.setRelease(ToGame_Petition_RequestSurvey);
      }
   }
   else if(initMode == 4)
   {
      if(csurvey_btn == undefined)
      {
         container_mc.councelContainerMc.surveyBtn.onLoad = function()
         {
            csurvey_btn = container_mc.councelContainerMc.surveyBtn.txtBtn;
            csurvey_btn.setRelease(ToGame_Petition_RequestSurvey);
         };
         csurvey_btn = container_mc.councelContainerMc.surveyBtn.txtBtn;
         csurvey_btn.setRelease(ToGame_Petition_RequestSurvey);
      }
      if(send_btn == undefined)
      {
         container_mc.councelContainerMc.sendBtn.onLoad = function()
         {
            send_btn = container_mc.councelContainerMc.sendBtn.txtBtn;
            send_btn.setRelease(function()
            {
               ToGame_Petition_SendMessage(container_mc.councelContainerMc.inputFd.text);
            }
            );
         };
         send_btn = container_mc.councelContainerMc.sendBtn.txtBtn;
         send_btn.setRelease(function()
         {
            ToGame_Petition_SendMessage(container_mc.councelContainerMc.inputFd.text);
         }
         );
      }
      send_btn.setEnabled(false);
      csurvey_btn.setEnabled(false);
      sendSuv_btn.setEnabled(false);
      container_mc.councelContainerMc.inputFd.type = "input";
      container_mc.councelContainerMc.inputFd.selectable = true;
      Selection.setFocus(container_mc.councelContainerMc.inputFd);
   }
   else if(initMode == 5)
   {
      container_mc.surveyContainerMc.question1_txt.verticalAlign = "bottom";
      if(question0Str != undefined && question0Str != "")
      {
         container_mc.surveyContainerMc.question0_txt.text = question0Str;
      }
      if(question1Str != undefined && question1Str != "")
      {
         container_mc.surveyContainerMc.question1_txt.text = question1Str;
      }
      if(sendSuv_btn == undefined)
      {
         container_mc.surveyContainerMc.sendSuvBtn.onLoad = function()
         {
            sendSuv_btn = container_mc.surveyContainerMc.sendSuvBtn.txtBtn;
            sendSuv_btn.setRelease(ToGame_Petition_ResultSurvey);
         };
         sendSuv_btn = container_mc.surveyContainerMc.sendSuvBtn.txtBtn;
         sendSuv_btn.setRelease(ToGame_Petition_ResultSurvey);
      }
      sendSuv_btn.setEnabled(false);
      container_mc.surveyContainerMc.checked = undefined;
      _loc4_ = 1;
      while(_loc4_ < 6)
      {
         var _loc5_ = container_mc.surveyContainerMc["checkBox" + _loc4_];
         _loc5_.id = _loc4_;
         _loc5_.onChanged = function(_check)
         {
            sendSuv_btn.setEnabled(true && !isSendResult);
            if(_check)
            {
               var _loc2_ = container_mc.surveyContainerMc.checked;
               container_mc.surveyContainerMc["checkBox" + _loc2_].checked = false;
               container_mc.surveyContainerMc["checkBox" + _loc2_].enabled = true;
               container_mc.surveyContainerMc.checked = this.id;
            }
         };
         _loc4_ = _loc4_ + 1;
      }
      new lib.util.ExtTextField(container_mc.surveyContainerMc.contentsFd,0,container_mc.surveyContainerMc.contentsFd_focus);
   }
   else if(initMode == 6)
   {
      container_mc.passiveContainerMc.title0Fd.text = title0Str;
      container_mc.passiveContainerMc.title1Fd.text = title1Str;
      container_mc.passiveContainerMc.contents0Fd.text = contents0Str;
      container_mc.passiveContainerMc.contents1Fd.text = contents1Str;
   }
}
function modeChange(_mode)
{
   var _loc4_ = initMode;
   initMode = _mode;
   if(_mode > 0 && _mode < 3 || _mode == 6)
   {
      container_mc.UIDrager._width = this.hit._width = 960;
      container_mc.x_mc._x = lib.manager.UISkin.LARGEXBTNBYBG_X;
      container_mc.x_mc._y = lib.manager.UISkin.XBTNBYBG_Y;
      container_mc.title_txt._x = lib.manager.UISkin.TITLEBYBG_X;
      container_mc.title_txt._y = lib.manager.UISkin.TITLEBYBG_Y;
      container_mc.atext_name._width = 790;
      lib.manager.UISkin.drawBg(UIname + "_2",container_mc.uiBgMc);
      if(container_mc._currentframe == 2)
      {
         initFrame();
      }
      else
      {
         container_mc.gotoAndStop(2);
      }
   }
   else
   {
      container_mc.UIDrager._width = this.hit._width = 471;
      container_mc.x_mc._x = lib.manager.UISkin.NORMALXBTNBYBG_X;
      container_mc.x_mc._y = lib.manager.UISkin.XBTNBYBG_Y;
      container_mc.title_txt._x = lib.manager.UISkin.TITLEBYBG_X;
      container_mc.title_txt._y = lib.manager.UISkin.TITLEBYBG_Y;
      container_mc.atext_name._width = 305;
      lib.manager.UISkin.drawBg(UIname,container_mc.uiBgMc);
      if(container_mc._currentframe == 1)
      {
         initFrame();
      }
      else
      {
         container_mc.gotoAndStop(1);
      }
   }
   _root.OnGameEvent("OnGame_InteractionPopupAlim_Remove","petiton" + _loc4_);
   if(_mode >= 3 && _mode <= 6)
   {
      _root.OnGameEvent("OnGame_InteractionPopupAlim_Update","petiton" + _mode,"$013052",this["MESSAGE_" + _mode]);
   }
}
function setMessage(_message, __name, type)
{
   var _loc10_ = messageData.length;
   var _loc1_ = container_mc.councelContainerMc.messageFd;
   var _loc8_ = _loc1_.scroll == _loc1_.maxscroll;
   var _loc7_ = type != 0?"gmStyle":"userStyle";
   var _loc5_ = "<p class=\'" + _loc7_ + "\'>" + __name + ": " + _message + "</p>";
   if(__name == undefined)
   {
      _loc1_.htmlText = _loc1_.htmlText + ("<p class=\'noticeStyle\'>" + _message + "</p><br>");
   }
   else
   {
      _loc1_.htmlText = _loc1_.htmlText + _loc5_;
   }
   var _loc4_ = _loc1_.numLines;
   if(_loc4_ > MAXLINES)
   {
      c = _loc4_ - MAXLINES - 1;
      var _loc6_ = 0;
      var _loc3_ = 0;
      while(c >= 0)
      {
         var _loc2_ = _loc1_.getLineText(c);
         _loc3_ = _loc3_ + _loc1_.getLineLength(c--);
      }
      _loc1_.replaceText(_loc6_,_loc3_,"");
   }
   if(_loc8_)
   {
      _loc1_.scroll = _loc1_.maxscroll;
   }
}
function checkInput()
{
   var _loc3_ = true;
   var _loc1_ = 0;
   while(_loc1_ < inputFds.length)
   {
      var _loc2_ = lib.util.ExtString.trim(inputFds[_loc1_].text);
      _loc3_ = _loc2_ != "" && _loc2_ != undefined;
      if(!_loc3_)
      {
         break;
      }
      _loc1_ = _loc1_ + 1;
   }
   submit_btn.setEnabled(_loc3_);
}
function initInputFds()
{
   var _loc2_ = 0;
   while(_loc2_ < inputFds.length)
   {
      var _loc1_ = inputFds[_loc2_];
      var _loc4_ = _loc1_._parent;
      var _loc3_ = _loc1_._name + "_focus";
      var _loc5_ = new lib.util.ExtTextField(_loc1_,0,_loc4_[_loc3_]);
      _loc5_.onChanged = function()
      {
         checkInput();
      };
      _loc2_ = _loc2_ + 1;
   }
   lib.manager.Focus.addFocusGroup(UIname,1,inputFds);
}
function historySave_All()
{
   SaveData.selectFaq = initMode != 0?undefined:selectCategoryId;
   lib.gamedata.HistoryData.addHistoryData(UIname,SaveData);
}
_global.gfxExtensions = true;
var UI = this;
var UIname = "Petition";
var bWidgetOpen = false;
UI._visible = false;
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
container_mc.atext_name.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
var MAXLINES = 200;
var categoryData = [];
var selectCategoryId = 0;
var initMode = 0;
var requestStr = "";
var readyStr = "";
var title0Str = "";
var title1Str = "";
var contents0Str = "";
var contents1Str = "";
var startMsIndex = 0;
var endMsIndex = 0;
var faqStyle = new TextField.StyleSheet();
faqStyle.setStyle(".title",{color:"#80e71c"});
faqStyle.setStyle("a",{color:"#80e71c",textDecoration:"underline"});
faqStyle.setStyle("a:hover",{color:"#e5ff9f",textDecoration:"underline"});
faqStyle.setStyle("a:active",{color:"#517f24",textDecoration:"underline"});
container_mc.faqContainerMc.contentsFd.styleSheet = faqStyle;
var chatStyle = new TextField.StyleSheet();
chatStyle.setStyle(".noticeStyle",{color:"#009900"});
chatStyle.setStyle(".userStyle",{color:"#FFFFFF"});
chatStyle.setStyle(".gmStyle",{color:"#0099FF"});
container_mc.councelContainerMc.messageFd.styleSheet = chatStyle;
var write_btn = container_mc.faqContainerMc.writeBtn.txtBtn;
write_btn.setRelease(ToGame_Petition_EditQuestion);
var submit_btn;
var cancel_btn;
var survey_btn;
var csurvey_btn;
var sendSuv_btn;
var send_btn;
var cancelBtnState = true;
var messageData = [];
var sliceMessage = [];
var inputFds = [];
var isSendResult = false;
var titleStr = ["$009001","$009001","$009002","$009003","$009004","$009001"];
var TERAWEBSTR = lib.util.UIString.getUIString("$009027");
var FAQCATVIEWSTR = lib.util.UIString.getUIString("$009029");
var writeStateHs;
container_mc.surveyContainerMc.bgMc._height = container_mc.surveyContainerMc.question_txt.textHeight + 15;
myListener.OnGameEventShowWindow = function(widgetName, bShow)
{
   if(widgetName.toLowerCase() == UIname.toLowerCase())
   {
      bWidgetOpen = bShow;
      if(_global.gbUIMode && bWidgetOpen)
      {
         UI._visible = true;
      }
      else
      {
         historySave_All();
         UI._visible = false;
         _root.OnGameEvent("OnGame_InteractionPopupAlim_Remove","petiton" + initMode);
      }
   }
};
myListener.OnGameEventChangeUIMode = function(bShow)
{
   if(_global.gbUIMode && bWidgetOpen)
   {
      UI._visible = true;
   }
   else
   {
      Selection.setFocus(null);
      UI._visible = false;
   }
};
myListener.OnGame_Petition_AddCategory = function(categoryId, parentCategoryId, __data, useTerapia)
{
   categoryId = Number(categoryId);
   parentCategoryId = Number(parentCategoryId);
   var _loc7_ = lib.util.ExtString.split(__data,"\n");
   var _loc6_ = _loc7_.shift();
   var _loc8_ = Number(useTerapia) == 1;
   categoryData[categoryId] = {id:categoryId,pid:parentCategoryId,_title:_loc6_,_inputs:_loc7_,subdata:[],terapia:_loc8_};
   if(categoryData[categoryId] == undefined)
   {
      categoryData[parentCategoryId] = {id:parentCategoryId,subdata:[],terapia:_loc8_};
   }
   categoryData[parentCategoryId].subdata.push(categoryId);
   var _loc4_ = container_mc.faqContainerMc.combobox.data;
   if(_loc4_ == null)
   {
      _loc4_ = [];
   }
   if(parentCategoryId == 0)
   {
      var _loc1_ = _loc4_.length - 1;
      var _loc2_ = true;
      while(_loc1_ >= 0 && _loc2_)
      {
         _loc2_ = _loc4_[_loc1_].id != categoryId;
         _loc1_ = _loc1_ - 1;
      }
      if(_loc2_)
      {
         _loc4_.push({id:categoryId,label:_loc6_});
         container_mc.faqContainerMc.combobox.removeListener(container_mc.faqContainerMc);
         container_mc.faqContainerMc.combobox.data = _loc4_;
         var _loc9_ = categoryData[selectCategoryId].pid;
         if(_loc9_ != undefined)
         {
            container_mc.faqContainerMc.combobox.setSelectedId(parentid);
         }
         container_mc.faqContainerMc.combobox.addListener(container_mc.faqContainerMc);
      }
   }
};
myListener.OnGame_Petition_SetFaqContents = function(contentsStr, programme)
{
   if(SaveData.selectFaq != undefined && selectCategoryId != SaveData.selectFaq)
   {
      var _loc15_ = Number(SaveData.selectFaq);
      SaveData.selectFaq = undefined;
      selectCategory(_loc15_);
      return undefined;
   }
   container_mc.faqContainerMc._visible = true;
   container_mc.faqContainerMc.scrollbar.scroll = 0;
   var _loc3_ = categoryData[selectCategoryId];
   var _loc9_ = _loc3_.pid;
   var _loc16_ = categoryData[_loc9_];
   var _loc10_ = contentsStr + "<br><br>";
   var _loc11_ = "";
   var _loc4_ = "";
   var _loc7_ = "";
   if(_loc3_.id == 0)
   {
      container_mc.faqContainerMc.titleLb.text = "$009026";
      if(TERAWEBSTR != "@")
      {
         _loc7_ = "<br><img src=\'rinkarrow0\' vspace=\'-6\'><a href=\'asfunction:_parent._parent.ToGame_Petition_RequestTerapia\'>" + TERAWEBSTR + "</a><br>";
      }
   }
   else
   {
      container_mc.faqContainerMc.titleLb.text = "$009028";
      var _loc6_ = _loc3_.subdata.length;
      var _loc1_ = 0;
      while(_loc1_ < _loc6_)
      {
         var _loc2_ = _loc3_.subdata[_loc1_];
         _loc4_ = _loc4_ + ("<img src=\'rinkarrow0\' vspace=\'-6\'><a href=\'asfunction:_parent._parent.selectCategory," + _loc2_ + "\'>" + categoryData[_loc2_]._title + "</a><br>");
         _loc1_ = _loc1_ + 1;
      }
   }
   if(_loc9_ != 0)
   {
      _loc11_ = "<p class=\'title\'>" + _loc3_._title + "</p><br>";
      _loc7_ = "<br><img src=\'rinkarrow1\' vspace=\'-6\'><a href=\'asfunction:_parent._parent.selectCategory," + _loc9_ + "\'>" + FAQCATVIEWSTR + "</a><br>";
   }
   if(categoryData[container_mc.faqContainerMc.combobox.selected].terapia)
   {
      if(TERAWEBSTR != "@")
      {
         _loc7_ = _loc7_ + ("<br><br><img src=\'rinkarrow0\' vspace=\'-6\'><a href=\'asfunction:_parent._parent.ToGame_Petition_RequestTerapia\'>" + TERAWEBSTR + "</a><br>");
      }
   }
   var _loc14_ = _loc10_;
   var _loc13_ = _loc4_;
   var _loc12_ = _loc7_;
   if(programme)
   {
      var _loc5_ = [];
      _loc5_.push(_loc10_);
      _loc5_.push(_loc4_);
      _loc5_.push(_loc7_);
      var _loc8_ = lib.util.ExtString.split(programme,"\t");
      _loc14_ = _loc5_[_loc8_[0]];
      _loc13_ = _loc5_[_loc8_[1]];
      _loc12_ = _loc5_[_loc8_[2]];
   }
   container_mc.faqContainerMc.contentsFd.htmlText = _loc11_ + _loc14_ + _loc13_ + _loc12_;
   container_mc.faqContainerMc.contentsFd.selectable = true;
};
myListener.OnGame_Petition_ChangeWriteMode = function()
{
   modeChange(1);
};
myListener.OnGame_Petition_SetRequest = function(question, accept)
{
   requestStr = question;
   readyStr = accept;
   modeChange(2);
};
myListener.OnGame_Petition_SetResponce = function(question, responce)
{
   container_mc.answerContainerMc.contents0Fd.text = question;
   container_mc.answerContainerMc.contents1Fd.text = responce;
   modeChange(3);
};
myListener.OnGame_Petition_SetCouncel = function(question, defaultMessage)
{
   container_mc.councelContainerMc.contentsFd.text = question;
   messageData = [];
   sliceMessage = [];
   setMessage(defaultMessage);
   modeChange(4);
};
myListener.OnGame_Petition_SetMessage = function(_message, __name, type)
{
   setMessage(_message,__name,type);
};
myListener.OnGame_Petition_EndOfCouncel = function(_message)
{
   setMessage(_message);
   Selection.setFocus(null);
   container_mc.councelContainerMc.inputFd.text = "";
   container_mc.councelContainerMc.inputFd.type = "dynamic";
   container_mc.councelContainerMc.inputFd.selectable = false;
   send_btn.setEnabled(false);
   sendSuv_btn.setEnabled(true);
};
var question0Str = "";
var question1Str = "";
myListener.OnGame_Petition_SetSurvey = function(question0, question1)
{
   question0Str = question0;
   question1Str = question1;
   modeChange(5);
};
myListener.OnGame_Petition_SetPassiveCouncel = function(gmMesgTitle0, gmMessage0, messageTitle1, gmMessage1)
{
   title0Str = gmMesgTitle0;
   title1Str = messageTitle1;
   contents0Str = gmMessage0;
   contents1Str = gmMessage1;
   modeChange(6);
};
myListener.OnGame_Petition_SelectCategory = function(categoryId)
{
   var _loc1_ = categoryId;
   var _loc2_ = undefined;
   while(_loc1_ != 0)
   {
      _loc2_ = _loc1_;
      _loc1_ = categoryData[Number(_loc1_)].pid;
   }
   if(_loc2_ == undefined)
   {
      _loc2_ = 0;
   }
   container_mc.faqContainerMc.combobox.setSelectedId(_loc2_);
   selectCategory(categoryId);
};
myListener.OnGame_Petition_SetSurveyBtn = function(_enable)
{
   survey_btn.setEnabled(Number(_enable));
   csurvey_btn.setEnabled(Number(_enable));
};
myListener.OnGame_Petition_SetCancelBtn = function(_enable)
{
   cancel_btn.setEnabled(Number(_enable));
   cancelBtnState = Number(_enable);
};
container_mc.faqContainerMc.contentsFd.onKillFocus = function()
{
   Selection.setSelection(0,0);
};
var MESSAGE_3 = lib.util.UIString.getUIString("$009030");
var MESSAGE_4 = lib.util.UIString.getUIString("$009031");
var MESSAGE_5 = lib.util.UIString.getUIString("$009032");
var MESSAGE_6 = lib.util.UIString.getUIString("$009033");
var x_btn = new lib.util.TxtBtn(container_mc.x_mc);
x_btn.setRelease(ToGame_Petition_Close);
container_mc.faqContainerMc.onChanged = function()
{
   selectCategory(arguments[1]);
};
container_mc.faqContainerMc.scrollbar.setTextField(container_mc.faqContainerMc.contentsFd);
container_mc.councelContainerMc.scrollbar.setTextField(container_mc.councelContainerMc.messageFd);
container_mc.answerContainerMc.scrollbar.setTextField(container_mc.answerContainerMc.contents1Fd);
var surveyContainerMc_contentsFd;
var councelContainerMc_inputFd = new lib.util.ExtTextField(container_mc.councelContainerMc.inputFd,0,container_mc.councelContainerMc.inputFd_focus);
councelContainerMc_inputFd.onChanged = function()
{
   var _loc2_ = this.text;
   _loc2_ = lib.util.ExtString.trim(_loc2_);
   send_btn.setEnabled(_loc2_ != "" && _loc2_ != undefined);
};
councelContainerMc_inputFd.onEnterKey = function()
{
   ToGame_Petition_SendMessage(this.text);
};
write_btn.setEnabled(false);
var SaveData = lib.gamedata.HistoryData.getHistoryData(UIname);
modeChange(0);
ToGame_Petition_Init();
