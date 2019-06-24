function ToGame_ParcelPost_Init()
{
   fscommand("ToGame_ParcelPost_Init");
}
function ToGame_ParcelPost_CloseUI()
{
   fscommand("ToGame_ParcelPost_CloseUI");
}
function ToGame_ParcelPost_Receive()
{
   fscommand("ToGame_ParcelPost_Receive");
}
function ToGame_ParcelPost_SendBack()
{
   fscommand("ToGame_ParcelPost_SendBack");
}
function ToGame_ParcelPost_Remove()
{
   fscommand("ToGame_ParcelPost_Remove");
}
function ToGame_ParcelPost_RequestNameFind(__name)
{
   getURL("FSCommand:ToGame_ParcelPost_RequestNameFind",__name);
}
function ToGame_ParcelPost_ChangeAttachType(attachType)
{
   getURL("FSCommand:ToGame_ParcelPost_ChangeAttachType",attachType);
   if(attachType == 1)
   {
      container_mc.textbg._height = 350;
      container_mc.messageFd_focus._height = 356;
      container_mc.messageFd._height = 310;
      container_mc.scrollbar._height = 337;
      container_mc.attchContainerMc._y = 536;
      container_mc.scrollbar.setTextField(container_mc.messageFd);
      container_mc.scrollbar.scroll = 0;
      container_mc.scrollbar.resize(container_mc.scrollbar._height);
      Ready_setItems();
   }
   else if(attachType == 2)
   {
      container_mc.textbg._height = 350;
      container_mc.messageFd_focus._height = 356;
      container_mc.messageFd._height = 310;
      container_mc.scrollbar._height = 337;
      container_mc.attchContainerMc._y = 536;
      container_mc.scrollbar.setTextField(container_mc.messageFd);
      container_mc.scrollbar.scroll = 0;
      container_mc.scrollbar.resize(container_mc.scrollbar._height);
      Ready_setItems();
   }
   else if(attachType == 0)
   {
      container_mc.textbg._height = 445;
      container_mc.messageFd_focus._height = 451;
      container_mc.messageFd._height = 405;
      container_mc.scrollbar._height = 432;
      container_mc.scrollbar.setTextField(container_mc.messageFd);
      container_mc.scrollbar.scroll = 0;
      container_mc.scrollbar.resize(container_mc.scrollbar._height);
   }
}
function ToGame_ParcelPost_RequestGoldInput()
{
   fscommand("ToGame_ParcelPost_RequestGoldInput");
}
function ToGame_ParcelPost_Send()
{
   var _loc2_ = container_mc.nameFd.text;
   var _loc1_ = container_mc.titleFd.text != ""?container_mc.titleFd.text:NOTITLE_STR;
   var _loc3_ = container_mc.messageFd.text;
   getURL("FSCommand:ToGame_ParcelPost_Send",_loc2_ + "\t" + _loc1_ + "\t" + _loc3_);
}
function ToGame_ParcelPost_ReSend()
{
   fscommand("ToGame_ParcelPost_ReSend");
}
function ToGame_ParcelPost_RequestItemLink(index)
{
   Selection.setSelection(0,0);
   getURL("FSCommand:ToGame_ParcelPost_RequestItemLink",index);
}
function ToGame_ParcelPost_RightClick(slotIndex)
{
   getURL("FSCommand:ToGame_ParcelPost_RightClick",slotIndex);
}
function ToGame_ParcelPost_ResetMessage()
{
   fscommand("ToGame_ParcelPost_ResetMessage");
}
function ToGame_ParcelPost_ReportPlayer()
{
   var _loc1_ = container_mc.nameFd.text;
   getURL("FSCommand:ToGame_ParcelPost_ReportPlayer",_loc1_);
}
function setMessage(__name, _title, _message, date, attachItems, gold, recieve, isSystem, messageType, goldType)
{
   if(messageType == 1 && !isSendMail)
   {
      _title = "<font color=\'#" + lib.info.TextColor.PARCELPOST_STATE_SENDBACK.toString(16) + "\'>" + SENDBACKM_STR + "</font>" + _title;
   }
   else if(isSystem == 1)
   {
      _title = "<font color=\'#" + lib.info.TextColor.SYSTEM_MESSAGE.toString(16) + "\'>" + "</font>" + _title;
   }
   lib.util.ExtString.textCut(container_mc.nameFd.inputFd,__name,true);
   lib.util.ExtString.textCut(container_mc.titleFd,_title,true);
   container_mc.dateFd.text = date;
   var _loc11_ = "";
   var _loc8_ = "";
   if(isSendMail)
   {
      container_mc.recieveStateMc.recieveFd.htmlText = "<font color=\'#" + reciveStatColor[recieve] + "\'>" + RECIEVESTATE_STR[recieve] + "</font>";
   }
   else
   {
      if(attachItems != "" && attachItems != undefined)
      {
         _loc8_ = _loc8_ + ("<br><br>[" + itemLogTag + "]<br>");
         var _loc9_ = lib.util.ExtString.split(attachItems,"\n");
         var _loc3_ = 0;
         while(_loc3_ < ATTACHITEMSMAX)
         {
            var _loc1_ = lib.util.ExtString.split(_loc9_[_loc3_],"\t");
            if(_loc1_ != undefined)
            {
               var _loc4_ = _loc1_[0];
               var _loc6_ = _loc1_[2];
               var _loc2_ = Number(_loc1_[8]);
               if(isNaN(_loc2_) == false && _loc2_ != -1 && _loc2_ != 0)
               {
                  _loc4_ = "+" + _loc2_ + " " + _loc4_;
               }
               var _loc5_ = lib.util.UIString.getUIString("$091013","ItemCount",_loc6_);
               var _loc7_ = lib.info.TextColor["RAREGRADE" + _loc1_[5]].toString(16);
               _loc8_ = _loc8_ + ("<a href=\'asfunction:_parent.ToGame_ParcelPost_RequestItemLink," + _loc3_ + "\'><font color=\'#" + _loc7_ + "\'>&lt;" + _loc4_ + "&gt;</font></a> " + _loc5_ + "<br>");
            }
            _loc3_ = _loc3_ + 1;
         }
      }
      if(messageType != 1 && (gold != "" && gold != ""))
      {
         var _loc13_ = lib.util.GoldCurrency.SetGoldText(String(gold),0,0,0,goldType);
         _loc11_ = "<br><br>[" + goldLogTag + "]<br>  <font color=\'#" + lib.info.TextColor.GENERAL_MONEY.toString(16) + "\'>" + _loc13_ + " </font><img src=\'moneyIcon\' vspace=\'-2\'><br>";
      }
   }
   container_mc.messageFd.htmlText = _message + _loc8_ + _loc11_;
}
function setItems(dataStr, active)
{
   var _loc4_ = 0;
   while(_loc4_ < ATTACHITEMSMAX)
   {
      var _loc1_ = container_mc.attchContainerMc["ParcelPost__" + _loc4_];
      lib.manager.ToolTip.remove(_loc1_.SLOT);
      _loc1_.clear();
      _loc1_.Icon.clear();
      _loc1_.enchantFd.text = "";
      _loc4_ = _loc4_ + 1;
   }
   itemDatas = [];
   if(dataStr == "" || dataStr == undefined)
   {
      return undefined;
   }
   var _loc13_ = lib.util.ExtString.split(dataStr,"\n");
   _loc4_ = 0;
   while(_loc4_ < ATTACHITEMSMAX)
   {
      var _loc2_ = lib.util.ExtString.split(_loc13_[_loc4_],"\t");
      _loc1_ = container_mc.attchContainerMc["ParcelPost__" + _loc4_];
      var _loc12_ = _loc2_[0];
      "\t" + random(2);
      var _loc9_ = _loc2_[1];
      var _loc8_ = _loc2_[2];
      var _loc11_ = Number(_loc2_[3]);
      var _loc5_ = Number(_loc2_[4]);
      _loc1_.SLOT.enabled = Number(active);
      if(_loc2_ != undefined)
      {
         itemDatas.push(_loc4_);
         _loc1_.index = _loc4_;
         lib.display.DrawBitmapData.draw(_loc1_.Icon,_loc9_,0,0,0,0,50,50,0.78);
         _loc1_.Icon.TEX = _loc9_;
         _loc1_.grade = _loc2_[5];
         _loc1_.sealType = _loc2_[6];
         _loc1_.masterpiece = _loc2_[7];
         var _loc3_ = Number(_loc2_[8]);
         var _loc6_ = _loc1_.enchantFd;
         if(isNaN(_loc3_) == false && _loc3_ != -1 && _loc3_ != 0)
         {
            var _loc7_ = _loc5_ <= 0?21433:3615811;
            if(_loc3_ > 11 && _loc3_ < 15)
            {
               _loc7_ = _loc5_ <= 0?8915599:2299429;
            }
            else if(_loc3_ > 14)
            {
               _loc7_ = _loc5_ <= 0?10624002:4074792;
            }
            _loc6_.shadowColor = _loc7_;
            _loc6_.textColor = _loc5_ <= 0?14145495:7368816;
            _loc6_.text = "+" + _loc3_;
         }
         lib.manager.ToolTip.add(_loc1_.SLOT,_loc1_.index,6,_loc1_.Icon);
         var _loc10_ = "";
         if(_loc11_ == 1 && _loc8_ > 1)
         {
            _loc10_ = _loc8_;
         }
         _loc1_.num = _loc10_;
         _loc1_.impossible = _loc5_;
      }
      _loc4_ = _loc4_ + 1;
   }
}
function Ready_setItems(active)
{
   var _loc1_ = 0;
   while(_loc1_ < 5)
   {
      var _loc2_ = container_mc.attchContainerMc["ParcelPost__" + _loc1_];
      _loc2_.SLOT.enabled = true;
      _loc1_ = _loc1_ + 1;
   }
}
function setGold(gold, goldType)
{
   if(gold != undefined && gold != "")
   {
      var _loc1_ = lib.util.GoldCurrency.SetGoldText(String(gold),0,0,0,goldType);
      container_mc.attchContainerMc.goldFd.htmlText = _loc1_;
   }
}
function clearMessage(messageMode)
{
   var _loc6_ = messageMode == MESSAGE_MODE_WRITE;
   var _loc4_ = messageMode == MESSAGE_MODE_PRESENT || messageMode == MESSAGE_MODE_ESCROW;
   reSendName = "";
   reSendTitle = "";
   isReSend = false;
   isSendMail = false;
   itemLogTag = ATTITEM_STR;
   goldLogTag = ATTGOLD_STR;
   container_mc.nameFd.text = "";
   container_mc.titleFd.text = "";
   container_mc.dateFd.text = "";
   container_mc.messageFd.htmlText = "";
   container_mc.scrollbar.scroll = 0;
   container_mc.attchContainerMc.goldFd.text = 0;
   lib.manager.ToolTip.remove(container_mc.titleFd);
   lib.manager.ToolTip.remove(container_mc.nameFd.inputFd);
   itemDatas = [];
   var _loc2_ = 0;
   while(_loc2_ < ATTACHITEMSMAX)
   {
      var _loc1_ = container_mc.attchContainerMc["ParcelPost__" + _loc2_];
      lib.manager.ToolTip.remove(_loc1_.SLOT);
      _loc1_.clear();
      _loc1_.Icon.clear();
      _loc1_.enchantFd.text = "";
      _loc1_.SLOT.enabled = false;
      _loc1_.impossible = false;
      _loc1_.active = false;
      _loc2_ = _loc2_ + 1;
   }
   btn2_btn.txt.text = OK_STR;
   btn2_btn.setRelease(ToGame_ParcelPost_CloseUI);
   input_btn.setEnabled(false);
   container_mc.recieveStateMc._visible = false;
   container_mc.attchContainerMc._visible = _loc4_;
   container_mc.comissionMc._visible = _loc6_;
   container_mc.checkBtn.selectedIndex = undefined;
   _loc2_ = 0;
   while(_loc2_ < 2)
   {
      var _loc3_ = container_mc.checkBtn["checkBox" + _loc2_];
      _loc3_.checked = false;
      _loc2_ = _loc2_ + 1;
   }
}
function changeSkin(_mode, messageType, recieveState, sendTypeType, btnType)
{
   report_btn.setVisible(!disableRepotBtn && _mode == 0);
   if(_mode == 1)
   {
      input_btn.setEnabled(true);
   }
   else
   {
      input_btn.setEnabled(false);
   }
   if(undefined != btnType)
   {
      enableCheckBtn(_mode,btnType);
   }
   container_mc.noItemFd._visible = false;
   if(_mode == 0)
   {
      container_mc.mailTypeLb.text = MAILTYPE_STR;
      container_mc.text_name.text = READTITLE_STR;
      container_mc.messageFd.styleSheet = messageStyle;
      container_mc.messageFd.type = "dynamic";
      container_mc.messageFd.selectable = false;
      container_mc.titleFd.type = "dynamic";
      container_mc.titleFd.selectable = false;
      container_mc.nameFd.inputFd.type = "dynamic";
      container_mc.nameFd.inputFd.selectable = false;
      container_mc.nameFdLb.text = SENDNAME_STR;
      btn1_btn.txt.text = REMOVE_STR;
      btn1_btn.setRelease(ToGame_ParcelPost_Remove);
      container_mc.comissionMc._visible = false;
      container_mc.attchContainerMc.goldMc._visible = recieveState != 1 && sendTypeType != 1;
      if(messageType == 0)
      {
         btn0_btn.txt.text = RESEND_STR;
         btn0_btn.setRelease(ToGame_ParcelPost_ReSend);
         btn2_btn.txt.text = OK_STR;
         btn2_btn.setRelease(ToGame_ParcelPost_CloseUI);
         itemLogTag = "";
         goldLogTag = "";
      }
      else if(messageType == 1)
      {
         btn0_btn.txt.text = RESEND_STR;
         btn0_btn.setRelease(ToGame_ParcelPost_ReSend);
         btn2_btn.txt.text = RECIEVE_STR;
         btn2_btn.setRelease(ToGame_ParcelPost_Receive);
         if(sendTypeType == 1)
         {
            container_mc.attchContainerMc.goldMc._visible = false;
            itemLogTag = ASTROSENDBACK_STR;
         }
         else if(sendTypeType == 2)
         {
            btn2_btn.txt.text = RECIEVEGOLD_STR;
            itemLogTag = ASTROCOMP_STR;
            goldLogTag = ASTROGOLD_STR;
         }
      }
      else
      {
         container_mc.attchContainerMc._visible = btnType != 0;
         container_mc.attchContainerMc.goldMc._visible = btnType != 0;
         btn0_btn.txt.text = RESEND_STR;
         btn0_btn.setRelease(ToGame_ParcelPost_SendBack);
         btn2_btn.txt.text = RECIEVE_STR;
         btn2_btn.setRelease(ToGame_ParcelPost_Receive);
         if(sendTypeType == 1)
         {
            container_mc.nameFdLb.text = RECIEVENAME_STR;
            container_mc.text_name.text = SENDTITLE_STR;
            btn2_btn.txt.text = OK_STR;
            btn2_btn.setRelease(ToGame_ParcelPost_CloseUI);
            container_mc.recieveStateMc._visible = true;
         }
         goldLogTag = ASTROGOLD_STR;
      }
      if(recieveState == 1)
      {
         btn2_btn.txt.text = OK_STR;
         btn2_btn.setRelease(ToGame_ParcelPost_CloseUI);
      }
   }
   else
   {
      container_mc.mailTypeLb.text = MAILTYPESELECT_STR;
      container_mc.text_name.text = WRITETITLE_STR;
      container_mc.messageFd.styleSheet = null;
      container_mc.comissionMc._visible = true;
      btn0_btn.txt.text = RETRY_STR;
      btn1_btn.txt.text = SEND_STR;
      btn2_btn.txt.text = CLOSE_STR;
      btn0_btn.setRelease(rewrite);
      btn1_btn.setRelease(ToGame_ParcelPost_Send);
      btn2_btn.setRelease(ToGame_ParcelPost_CloseUI);
      container_mc.recieveStateMc._visible = false;
      container_mc.messageFd.type = "input";
      container_mc.messageFd.selectable = true;
      container_mc.titleFd.type = "input";
      container_mc.titleFd.selectable = true;
      container_mc.nameFd.inputFd.type = "input";
      container_mc.nameFd.inputFd.selectable = true;
      container_mc.nameFdLb.text = RECIEVENAME_STR;
      input_btn.setEnabled(true);
      checkSendActivate();
      setEnabledCheckBtn(_mode == 1);
   }
}
function rewrite()
{
   container_mc.nameFd.text = reSendName;
   if(reSendTitle != "")
   {
      container_mc.titleFd.htmlText = "<font color=\'#" + lib.info.TextColor.SYSTEM_MESSAGE.toString(16) + "\'>[" + RESENDTAG_STR + "]</font>" + reSendTitle;
   }
   else
   {
      container_mc.titleFd.htmlText = "";
   }
   container_mc.messageFd.htmlText = "";
   container_mc.attchContainerMc.goldFd.text = 0;
   container_mc.comissionMc.comissionFd.text = "";
   var _loc2_ = 0;
   while(_loc2_ < ATTACHITEMSMAX)
   {
      var _loc1_ = container_mc.attchContainerMc["ParcelPost__" + _loc2_];
      lib.manager.ToolTip.remove(_loc1_.SLOT);
      _loc1_.clear();
      _loc1_.Icon.clear();
      _loc1_.enchantFd.text = "";
      _loc1_.impossible = false;
      _loc2_ = _loc2_ + 1;
   }
   ToGame_ParcelPost_ResetMessage();
   checkSendActivate();
}
function checkSendActivate()
{
   var _loc2_ = lib.util.ExtString.trim(container_mc.nameFd.text);
   var _loc4_ = container_mc.checkBtn.selectedIndex;
   var _loc5_ = container_mc.attchContainerMc.goldFd.text != "0";
   var _loc3_ = itemDatas.length > 0;
   var _loc1_ = _loc2_ != "" && _loc2_ != undefined;
   if(_loc4_ == 1)
   {
      _loc1_ = _loc1_ && (_loc5_ || _loc3_);
   }
   else if(_loc4_ == 2)
   {
      _loc1_ = _loc1_ && _loc5_ && _loc3_;
   }
   btn1_btn.setEnabled(_loc1_);
}
function enableCheckBtn(mode, index)
{
   if(mode == 1)
   {
      return undefined;
   }
   lib.Debuger.trace(mode + " / " + index);
   if(index == 0)
   {
      container_mc.checkBtn.checkBox0.checked = true;
      container_mc.checkBtn.checkBox1.checked = false;
   }
   else
   {
      container_mc.checkBtn.checkBox0.checked = false;
      container_mc.checkBtn.checkBox1.checked = true;
   }
   container_mc.checkBtn.checkBox0.enabled = false;
   container_mc.checkBtn.checkBox1.enabled = false;
}
function selectCheckBtn(index, flag)
{
   if(container_mc.checkBtn.selectedIndex == index)
   {
      return undefined;
   }
   var _loc2_ = container_mc.checkBtn.selectedIndex;
   container_mc.checkBtn["checkBox" + _loc2_].checked = false;
   container_mc.checkBtn.selectedIndex = index;
   container_mc.checkBtn["checkBox" + index].checked = true;
   if(flag)
   {
      onChangedCheckBtn(index);
   }
}
function onChangedCheckBtn(index)
{
   ToGame_ParcelPost_ChangeAttachType(index);
   if(index != 0)
   {
      var _loc2_ = 0;
      while(_loc2_ < ATTACHITEMSMAX)
      {
         var _loc1_ = container_mc.attchContainerMc["ParcelPost__" + _loc2_];
         lib.manager.ToolTip.remove(_loc1_.SLOT);
         _loc1_.clear();
         _loc1_.Icon.clear();
         _loc1_.enchantFd.text = "";
         _loc1_.impossible = false;
         _loc2_ = _loc2_ + 1;
      }
      itemDatas = [];
      container_mc.attchContainerMc._visible = true;
      container_mc.attchContainerMc.goldMc._visible = true;
      container_mc.comissionMc._visible = true;
   }
   else
   {
      container_mc.attchContainerMc._visible = false;
   }
   checkSendActivate();
}
function setEnabledCheckBtn(flag)
{
   var _loc1_ = 0;
   while(_loc1_ < 2)
   {
      var _loc2_ = container_mc.checkBtn["checkBox" + _loc1_];
      _loc2_.enabled = flag;
      _loc1_ = _loc1_ + 1;
   }
}
var UI = this;
UI._visible = false;
var bWidgetOpen = false;
var UIname = "ParcelPost";
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
container_mc.text_name.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
var CustomScaleEvent;
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
         UI._visible = false;
      }
      if(UI._visible == true)
      {
         CustomScaleEvent = new CustomScaleEvent();
         CustomScaleEvent.CustomScaleEventCheck(UI,UIname);
         UI.scaleExpander.scaleExpanderEventCheck(UI,UIname);
      }
      else
      {
         CustomScaleEvent.CustomScaleEventRemoveCheck();
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
      UI._visible = false;
   }
   container_mc.ToolTip._visible = bShow;
};
var ATTACHITEMSMAX = 5;
var SENDNAME_STR = "$201002";
var RECIEVENAME_STR = "$201001";
var READTITLE_STR = "$201010";
var SENDTITLE_STR = "$201011";
var WRITETITLE_STR = "$201012";
var SENDBACK_STR = lib.util.UIString.getUIString("$201013");
var RECIEVE_STR = lib.util.UIString.getUIString("$201014");
var RECIEVEGOLD_STR = lib.util.UIString.getUIString("$201015");
var OK_STR = "$201016";
var RETRY_STR = "$201004";
var SEND_STR = "$201005";
var CLOSE_STR = "$201006";
var REMOVE_STR = "$201017";
var ATTGOLD_STR = lib.util.UIString.getUIString("$201018");
var ATTITEM_STR = lib.util.UIString.getUIString("$201019");
var ASTROGOLD_STR = lib.util.UIString.getUIString("$201020");
var ASTROCOMP_STR = lib.util.UIString.getUIString("$201021");
var ASTROSENDBACK_STR = lib.util.UIString.getUIString("$201022");
var RESEND_STR = "$201023";
var RECIEVESTATELB_STR = lib.util.UIString.getUIString("$201024");
var RECIEVESTATE_STR = [lib.util.UIString.getUIString("$201025"),lib.util.UIString.getUIString("$201026"),lib.util.UIString.getUIString("$201013")];
var RESENDTAG_STR = lib.util.UIString.getUIString("$201027");
var SYSTEM_STR = lib.util.UIString.getUIString("$201028");
var SENDBACKM_STR = lib.util.UIString.getUIString("$201029");
var attComboData = [lib.util.UIString.getUIString("$201030"),lib.util.UIString.getUIString("$201031"),lib.util.UIString.getUIString("$201032")];
var NOTITLE_STR = lib.util.UIString.getUIString("$201033");
var MAILTYPE_STR = "$202018";
var MAILTYPESELECT_STR = "$202019";
container_mc.mailTypeLb.verticalAlign = "center";
container_mc.titleFd.verticalAlign = "center";
var goldMcTx = container_mc.attchContainerMc.goldMc._x;
var attachItemsStr = "";
var goldStr = "";
var itemLogTag = ATTITEM_STR;
var goldLogTag = ATTGOLD_STR;
var isSendMail = false;
var isReSend = false;
var reSendName = "";
var reSendTitle = "";
var itemDatas = [];
container_mc.attchContainerMc.goldFd.textColor = lib.info.TextColor.GENERAL_MONEY;
container_mc.comissionMc.comissionFd.textColor = lib.info.TextColor.GENERAL_MONEY;
var linkColor = "#" + lib.info.TextColor.CHAT_LINK_ITEM.toString(16);
var messageStyle = new TextField.StyleSheet();
messageStyle.setStyle("a:hover",{textDecoration:"underline"});
messageStyle.setStyle("a:active",{textDecoration:"underline"});
var reciveStatColor = [lib.info.TextColor.PARCELPOST_STATE_UNPAYMENT.toString(16),lib.info.TextColor.PARCELPOST_STATE_RECEIVED.toString(16),lib.info.TextColor.PARCELPOST_STATE_SENDBACK.toString(16)];
var NameTextLength_Local1 = 0;
var NameTextLength_Local2 = 0;
var NameTextLength_Local3 = 0;
var MESSAGE_MODE_NORMAL = 0;
var MESSAGE_MODE_PRESENT = 1;
var MESSAGE_MODE_ESCROW = 2;
var MESSAGE_MODE_WRITE = 3;
myListener.OnGame_ParcelPost_NormalMessage = function(__name, _title, _message, date, isSystem)
{
   clearMessage(MESSAGE_MODE_NORMAL);
   changeSkin(0,0);
   enableCheckBtn(0,0);
   setMessage(__name,_title,_message,date,"","","",isSystem,"");
   container_mc.textbg._height = 480;
   container_mc.messageFd_focus._height = 486;
   container_mc.messageFd._height = 440;
   container_mc.scrollbar._height = 467;
   container_mc.scrollbar.setTextField(container_mc.messageFd);
   container_mc.scrollbar.scroll = 0;
   container_mc.scrollbar.resize(container_mc.scrollbar._height);
};
myListener.OnGame_ParcelPost_PresentMessage = function(__name, _title, _message, date, attachItems, gold, recieve, isSystem, messageType, goldType)
{
   if(goldType == undefined || goldType == "" || goldType == "undefined")
   {
      goldType = 0;
   }
   clearMessage(MESSAGE_MODE_PRESENT);
   changeSkin(0,1,Number(recieve),Number(messageType));
   enableCheckBtn(0,1);
   setMessage(__name,_title,_message,date,attachItems,gold,recieve,isSystem,messageType,goldType);
   if(Number(recieve) == 0)
   {
      setGold(gold,goldType);
      if(messageType != 2)
      {
         setItems(attachItems,0);
      }
   }
   container_mc.textbg._height = 380;
   container_mc.messageFd_focus._height = 386;
   container_mc.messageFd._height = 340;
   container_mc.scrollbar._height = 365;
   container_mc.attchContainerMc._y = 567;
   container_mc.scrollbar.setTextField(container_mc.messageFd);
   container_mc.scrollbar.scroll = 0;
   container_mc.scrollbar.resize(container_mc.scrollbar._height);
   container_mc.messageFd.selectable = false;
   container_mc.attach;
};
myListener.OnGame_ParcelPost_EscrowMessage = function(__name, _title, _message, date, attachItems, gold, recieve, isSystem, messageType, goldType, checkBtn)
{
   clearMessage(MESSAGE_MODE_ESCROW);
   if(goldType == undefined || goldType == "" || goldType == "undefined")
   {
      goldType = 0;
   }
   checkBtn = Number(checkBtn);
   isSendMail = messageType == 1;
   changeSkin(0,2,Number(recieve),Number(messageType),checkBtn);
   setMessage(__name,_title,_message,date,attachItems,gold,recieve,isSystem,messageType,goldType);
   btn0_btn.setEnabled(!Number(isSystem));
   if(Number(recieve) == 0 && messageType != 1)
   {
      setGold(gold,goldType);
      setItems(attachItems,0);
   }
   else if(messageType == 1)
   {
      setGold(gold,goldType);
      setItems(attachItems,0);
   }
   container_mc.textbg._height = checkBtn == 0?480:380;
   container_mc.messageFd_focus._height = checkBtn == 0?486:386;
   container_mc.messageFd._height = checkBtn == 0?440:340;
   container_mc.scrollbar._height = checkBtn == 0?467:365;
   container_mc.attchContainerMc._y = 567;
   container_mc.scrollbar.setTextField(container_mc.messageFd);
   container_mc.scrollbar.scroll = 0;
   container_mc.scrollbar.resize(container_mc.scrollbar._height);
   container_mc.messageFd.selectable = false;
};
myListener.OnGame_ParcelPost_WriteMessage = function(date, __name, __title)
{
   clearMessage(MESSAGE_MODE_WRITE);
   if(__name != "" && __name != undefined)
   {
      isReSend = true;
      reSendName = __name;
      reSendTitle = __title;
      container_mc.nameFd.text = reSendName;
      container_mc.titleFd.htmlText = "<font color=\'#" + lib.info.TextColor.SYSTEM_MESSAGE.toString(16) + "\'>[" + RESENDTAG_STR + "]</font>" + reSendTitle;
   }
   container_mc.dateFd.text = date;
   changeSkin(1);
   if(isReSend)
   {
      Selection.setFocus(container_mc.messageFd);
   }
   else
   {
      Selection.setFocus(container_mc.nameFd.inputFd);
   }
   container_mc.textbg._height = 445;
   container_mc.messageFd_focus._height = 451;
   container_mc.messageFd._height = 405;
   container_mc.scrollbar._height = 432;
   container_mc.attchContainerMc._y = 567;
   container_mc.scrollbar.setTextField(container_mc.messageFd);
   container_mc.scrollbar.scroll = 0;
   container_mc.scrollbar.resize(container_mc.scrollbar._height);
   container_mc.messageFd.selectable = true;
   selectCheckBtn(0,false);
};
myListener.OnGame_ParcelPost_SetNameFindResult = function(_results)
{
};
myListener.OnGame_ParcelPost_SetItem = function(attachItems)
{
   setItems(attachItems,1);
   checkSendActivate();
};
myListener.OnGame_ParcelPost_SetSendMoney = function(sendMoney, goldType)
{
   if(goldType == undefined || goldType == "" || goldType == "undefined")
   {
      goldType = 0;
   }
   setGold(sendMoney,goldType);
   checkSendActivate();
};
myListener.OnGame_ParcelPost_SetCommission = function(comission, goldType)
{
   if(goldType == undefined || goldType == "" || goldType == "undefined")
   {
      goldType = 0;
   }
   var _loc2_ = lib.util.GoldCurrency.SetGoldText(String(comission),0,0,0,goldType);
   container_mc.comissionMc.comissionFd.htmlText = _loc2_;
};
myListener.OnGame_MouseDown = function(button, target)
{
   if(button == 2 && target._name == "SLOT")
   {
      var _loc1_ = target._parent._name;
      if(container_mc.attchContainerMc[_loc1_] != undefined)
      {
         var _loc2_ = _loc1_.split("__");
         if(_loc2_[0] == "ParcelPost")
         {
            ToGame_ParcelPost_RightClick(_loc2_[1]);
         }
      }
   }
};
var btn0_btn = container_mc.txtBtn0.txtBtn;
var btn1_btn = container_mc.txtBtn1.txtBtn;
var btn2_btn = container_mc.txtBtn2.txtBtn;
var x_btn = new lib.util.TxtBtn(container_mc.x_mc);
var input_btn = container_mc.attchContainerMc.input_mc.txtBtn;
var report_btn = container_mc.reportBtn.txtBtn;
x_btn.setRelease(ToGame_ParcelPost_CloseUI);
input_btn.setRelease(ToGame_ParcelPost_RequestGoldInput);
btn2_btn.setRelease(ToGame_ParcelPost_CloseUI);
report_btn.setRelease(ToGame_ParcelPost_ReportPlayer);
container_mc.scrollbar.setTextField(container_mc.messageFd);
container_mc.scrollbar.scroll = 0;
container_mc.comissionMc._visible = false;
container_mc.recieveStateMc._visible = false;
var i = 0;
while(i < 2)
{
   var bMc = container_mc.checkBtn["checkBox" + i];
   bMc.index = i;
   bMc.setText(container_mc.checkBtn["checkBox" + i + "_txt"]);
   bMc.onChanged = function()
   {
      if(this.checked)
      {
         selectCheckBtn(this.index,true);
      }
   };
   i++;
}
var nameFd = container_mc.nameFd.extTextFd;
var titleFd = new lib.util.ExtTextField(container_mc.titleFd,0,container_mc.titleFd_focus);
var messageFd = new lib.util.ExtTextField(container_mc.messageFd,0,container_mc.messageFd_focus);
nameFd.onChanged = function()
{
   var _loc2_ = this.text;
   if(_loc2_ != "" && _loc2_ != undefined)
   {
      container_mc.nameFd.change = true;
   }
   else
   {
      container_mc.nameFd.change = false;
   }
   ToGame_ParcelPost_RequestNameFind(_loc2_);
   checkSendActivate();
};
container_mc.nameFd.inputFd.onChanged = function()
{
   var _loc1_ = 0;
   if(NameTextLength_Local1 > 0)
   {
      _loc1_ = NameTextLength_Local1;
   }
   else
   {
      _loc1_ = 42;
   }
   lib.util.StrByteLen.getLenth3(container_mc.nameFd.inputFd,_loc1_);
};
titleFd.onChanged = function()
{
   checkSendActivate();
   var _loc1_ = 0;
   if(NameTextLength_Local2 > 0)
   {
      _loc1_ = NameTextLength_Local2;
   }
   else
   {
      _loc1_ = 84;
   }
   lib.util.StrByteLen.getLenth3(container_mc.titleFd,_loc1_);
};
messageFd.onChanged = function()
{
   var _loc1_ = 0;
   if(NameTextLength_Local3 > 0)
   {
      _loc1_ = NameTextLength_Local3;
   }
   else
   {
      _loc1_ = 1000;
   }
   lib.util.StrByteLen.getLenth3(container_mc.messageFd,_loc1_);
};
lib.manager.Focus.addFocusGroup(UIname,1,[nameFd,titleFd,messageFd]);
myListener.OnGame_ParcelPost_LengthLocal = function(lengthnum1, lengthnum2, lengthnum3)
{
   NameTextLength_Local1 = lengthnum1;
   NameTextLength_Local2 = lengthnum2;
   NameTextLength_Local3 = lengthnum3;
};
var disableRepotBtn = false;
var allBtn = false;
myListener.OnGame_ParcelPost_DisableReportBtn = function($disable)
{
   disableRepotBtn = $disable == "1";
   report_btn.setVisible(!disableRepotBtn);
};
ToGame_ParcelPost_Init();
