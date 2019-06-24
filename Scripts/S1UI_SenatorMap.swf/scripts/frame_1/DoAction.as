var UI = this;
UI._visible = false;
var UIname = "SenatorMap";
_global.gfxExtensions = true;
var continentalNameStrA = "( " + lib.util.UIString.getUIString("$241012") + " )";
var continentalNameStrB = "( " + lib.util.UIString.getUIString("$241011") + " )";
var continentalNameStrC = "( " + lib.util.UIString.getUIString("$241010") + " )";
container_mc.line.txt3.verticalAlign = "center";
container_mc.line.txt3.textAutoSize = "shrink";
container_mc.line.txt3.text = "일이삼사오육칠팔구십일이삼사오";
container_mc.line.txt3.text = "이것은 길드이름";
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
lib.manager.UISkin.drawBg(UIname,container_mc.uiBgMc);
container_mc.text_name.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
var selectedElectMethod = 0;
var firstRankInfoPos_array = [{con:"A",x:-772,y:260},{con:"B",x:-426,y:260},{con:"C",x:-426,y:150}];
var continental_array = ["A","B","C"];
var continental_A_Guard = ["ATW","ANC","AEN","ACN","ACE","ASE","VK","ASW"];
var continental_B_Guard = ["HNC","HWC","AL","HNE","HSC","HEC"];
var continental_C_Guard = ["SWC","SWN","SNC","KA","SEC","SSC"];
var NameTextLength_Local = 0;
bWidgetOpen = false;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
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
};
var generationNum = 0;
myListener.OnGame_SenatorMap_SetGeneration = function(generationNumber)
{
   generationNumber = generationNum = Number(generationNumber);
   if(mapMode == 1)
   {
      container_mc.text_name.text = lib.util.UIString.getUIString("$351001","Count",generationNum);
   }
   else if(mapMode == 2)
   {
      container_mc.text_name.text = lib.util.UIString.getUIString("$361001","Count",generationNum);
   }
   else if(mapMode == 3)
   {
      container_mc.text_name.text = lib.util.UIString.getUIString("$371001","Count",generationNum);
   }
   else if(mapMode == 4)
   {
      container_mc.text_name.text = lib.util.UIString.getUIString("$381001");
   }
};
var mapMode = 1;
myListener.OnGame_SenatorMap_SetMode = function(mode)
{
   mode = mapMode = Number(mode);
   clearGuard(1);
   clearContinental();
   container_mc.condition._visible = false;
   container_mc.registration._visible = false;
   container_mc.vote._visible = false;
   container_mc.info._visible = false;
   if(mapMode == 1)
   {
      container_mc.registration.selectMethod_mc._visible = false;
      setVisibleContinental(1,"A");
      setVisibleContinental(1,"B");
      setVisibleContinental(1,"C");
      setVisibleGuard(false);
      container_mc.text_name.text = lib.util.UIString.getUIString("$351001","Count",generationNum);
      container_mc.registration.finished_A._visible = false;
      container_mc.registration.finished_B._visible = false;
      container_mc.registration.finished_C._visible = false;
      container_mc.registration._visible = true;
   }
   else if(mapMode == 2)
   {
      setVisibleContinental(1,"A");
      setVisibleContinental(1,"B");
      setVisibleContinental(1,"C");
      container_mc.condition.info_mc._visible = false;
      container_mc.condition.info_mc._alpha = 0;
      container_mc.condition.info_mc.continental = undefined;
      setVisibleGuard(false);
      container_mc.text_name.text = lib.util.UIString.getUIString("$361001","Count",generationNum);
      container_mc.condition._visible = true;
   }
   else if(mapMode == 3)
   {
      setVisibleContinental(1,"A");
      setVisibleContinental(1,"B");
      setVisibleContinental(1,"C");
      setVisibleGuard(false);
      container_mc.text_name.text = lib.util.UIString.getUIString("$371001","Count",generationNum);
      container_mc.vote._visible = true;
      container_mc.vote.votedComplete._visible = false;
      container_mc.vote.defaultStr._visible = true;
   }
   else if(mapMode == 4)
   {
      setVisibleContinental(0,"A");
      setVisibleContinental(0,"B");
      setVisibleContinental(0,"C");
      container_mc.text_name.text = lib.util.UIString.getUIString("$381001");
      container_mc.info._visible = true;
      setSelectableContinental(false);
      setVisibleGuard(true,undefined,false);
      setSelectableGuard(true);
      myListener.OnGame_SenatorMap_INFO_SetBaseInfo("");
   }
};
container_mc.registration.regConditionList_mc.paragraph_txt0.textColor = lib.info.TextColor.GENERAL_PARAGRAPH;
container_mc.registration.regConditionList_mc.paragraph_txt1.textColor = lib.info.TextColor.GENERAL_PARAGRAPH;
container_mc.registration.paragraph_txt2.textColor = lib.info.TextColor.GENERAL_PARAGRAPH;
container_mc.registration.explain_0.textColor = lib.info.TextColor.GENERAL_EXPLAIN_DETAIL;
container_mc.registration.explain_1.textColor = lib.info.TextColor.GENERAL_EXPLAIN_DETAIL;
container_mc.registration.explain_2.textColor = lib.info.TextColor.GENERAL_EXPLAIN_DETAIL;
container_mc.registration.explain_3.textColor = lib.info.TextColor.GENERAL_EXPLAIN_DETAIL;
container_mc.registration.selectedContinental.textColor = lib.info.TextColor.GENERAL_CONTENTS;
container_mc.registration.selectedMethod.textColor = lib.info.TextColor.GENERAL_CONTENTS;
container_mc.registration.regCost.textColor = lib.info.TextColor.GENERAL_CONTENTS;
container_mc.registration.introduce_txt.textColor = lib.info.TextColor.GENERAL_NOTICE;
var saveElectMethod = null;
var saveToolTip1;
var saveToolTip2 = null;
myListener.OnGame_SenatorMap_REG_SetElectMethod = function(dataList, battleMethodTooltip, voteMethodTooltip)
{
   saveElectMethod = dataList;
   saveToolTip1 = battleMethodTooltip;
   saveToolTip2 = voteMethodTooltip;
   var _loc5_ = dataList.split("\n");
   if(_loc5_[_loc5_.length - 1] == "0" || _loc5_[_loc5_.length - 1] == "undefined" || _loc5_[_loc5_.length - 1] == "")
   {
      _loc5_.splice(_loc5_.length - 1,1);
   }
   var _loc3_ = 0;
   while(_loc3_ < _loc5_.length)
   {
      var _loc1_ = _loc5_[_loc3_].split("\t");
      if(_loc1_.length != 1)
      {
         var _loc4_ = Number(_loc1_[1]);
         var _loc2_ = container_mc.map[_loc1_[0]];
         trace(_loc2_.method_mc);
         _loc2_.method_mc.gotoAndStop(_loc4_);
         var _loc6_ = _loc4_ != 1?voteMethodTooltip:battleMethodTooltip;
         lib.manager.ToolTip.add(_loc2_.method_mc,_loc6_,1);
      }
      _loc3_ = _loc3_ + 1;
   }
};
myListener.OnGame_SenatorMap_REG_SetSelectedElectMethod = function(selectedMethod)
{
   selectedElectMethod = Number(selectedMethod);
   container_mc.registration.selectMethod_mc.hitTestDisable = true;
   lib.util.FrameSeeker.seek(container_mc.registration.selectMethod_mc,14,17);
   var _loc1_ = selectedElectMethod != 1?"$351018":"$351019";
   container_mc.registration.selectedMethod.setText(lib.util.UIString.getUIString(_loc1_));
   lib.util.FrameSeeker.seek(container_mc.map["continental_" + selectedContinental].FX_ACTIVE,5,1,function()
   {
      setVisibleContinental(false,selectedContinental);
      container_mc.registration.selectMethod_mc._visible = false;
   }
   );
};
myListener.OnGame_SenatorMap_REG_SetCost = function(cost)
{
   container_mc.registration.regCost.setText(cost);
};
var selectedContinental = null;
myListener.OnGame_SenatorMap_REG_SelectContinental = function(continental, guideText)
{
   selectContinental(continental,1,1);
   container_mc.registration.selectedContinental.text = guideText;
};
var mustSelectGuardNum = null;
myListener.OnGame_SenatorMap_REG_MustSelectGuardNum = function(num)
{
   mustSelectGuardNum = Number(num);
   var _loc1_ = 0;
   while(_loc1_ < 5)
   {
      container_mc.registration["selectedGuard_" + (_loc1_ + 1)].text = "";
      container_mc.registration["selectedGuardNum_" + (_loc1_ + 1)].text = "";
      _loc1_ = _loc1_ + 1;
   }
   _loc1_ = 0;
   while(_loc1_ < mustSelectGuardNum)
   {
      container_mc.registration["selectedGuard_" + (_loc1_ + 1)].setText(lib.util.UIString.getUIString("$351021","Count",_loc1_ + 1));
      container_mc.registration["selectedGuardNum_" + (_loc1_ + 1)].text = _loc1_ + 1;
      _loc1_ = _loc1_ + 1;
   }
};
var selectedGuard = null;
myListener.OnGame_SenatorMap_REG_SelectGuard = function(dataList)
{
   var _loc4_ = dataList.split("\n");
   if(_loc4_[_loc4_.length - 1] == "0" || _loc4_[_loc4_.length - 1] == "undefined" || _loc4_[_loc4_.length - 1] == undefined || _loc4_[_loc4_.length - 1] == "")
   {
      _loc4_.pop();
   }
   var _loc2_ = 0;
   while(_loc2_ < continental_A_Guard.length)
   {
      container_mc.map.worldText[continental_A_Guard[_loc2_]].textColor = 15719737;
      _loc2_ = _loc2_ + 1;
   }
   _loc2_ = 0;
   while(_loc2_ < continental_B_Guard.length)
   {
      container_mc.map.worldText[continental_B_Guard[_loc2_]].textColor = 15719737;
      _loc2_ = _loc2_ + 1;
   }
   _loc2_ = 0;
   while(_loc2_ < continental_C_Guard.length)
   {
      container_mc.map.worldText[continental_C_Guard[_loc2_]].textColor = 15719737;
      _loc2_ = _loc2_ + 1;
   }
   _loc2_ = 0;
   while(_loc2_ < 5)
   {
      var _loc1_ = container_mc.registration["selectedGuard_" + (_loc2_ + 1)];
      _loc1_._visible = false;
      _loc2_ = _loc2_ + 1;
   }
   _loc2_ = 0;
   while(_loc2_ < _loc4_.length)
   {
      var _loc3_ = _loc4_[_loc2_].split("\t");
      if(_loc3_.length != 1)
      {
         selectGuard(_loc3_[0],_loc3_[1]);
         _loc1_ = container_mc.registration["selectedGuard_" + (_loc2_ + 1)];
         _loc1_._visible = true;
         _loc1_.num.setText(_loc2_ + 1);
         _loc1_.txt.setText(_loc3_[2]);
         _loc1_.num.textColor = lib.info.TextColor.GENERAL_EXPLAIN_DETAIL;
         _loc1_.txt.textColor = lib.info.TextColor.GENERAL_CONTENTS;
      }
      _loc2_ = _loc2_ + 1;
   }
   container_mc.registration.introduce_txt.setText("<img src=\'icon_notice\' vspace=\'-1\'> " + lib.util.UIString.getUIString("$351020") + UI["continentalNameStr" + selectedContinental]);
};
myListener.OnGame_SenatorMap_REG_NextStep = function(stepNum)
{
   stepNum = Number(stepNum);
   container_mc.registration.selectMethod_mc.hitTestDisable = true;
   if(stepNum == 1)
   {
      setVisibleGuard(false);
      myListener.OnGame_SenatorMap_REG_Clear();
      container_mc.registration.introduce_txt.setText("<img src=\'icon_notice\' vspace=\'-1\'> " + lib.util.UIString.getUIString("$351002"));
   }
   else if(stepNum == 2)
   {
      lib.Debuger.trace("sBFEnable : " + sBFEnable);
      setSelectableGuard(false);
      container_mc.registration.selectMethod_mc._visible = true;
      container_mc.registration.selectMethod_mc.gotoAndStop(1);
      container_mc.registration.selectMethod_mc.method_Vote_mc.gotoAndStop(1);
      container_mc.registration.selectMethod_mc.method_Battle_mc.gotoAndStop(1);
      if(sBFEnable == "0")
      {
         ToGame_SenatorMap_REG_ClickElectMethod(2);
         container_mc.registration.selectMethod_mc.method_Battle_mc.mc.gotoAndStop(2);
         container_mc.registration.selectMethod_mc.method_Battle_mc.enabled = false;
         container_mc.registration.selectMethod_mc.method_Battle_txt.textColor = 11053224;
         return undefined;
      }
      lib.util.FrameSeeker.seek(container_mc.registration.selectMethod_mc,1,14,setElectMethodBtn);
      container_mc.registration.introduce_txt.setText("<img src=\'icon_notice\' vspace=\'-1\'> " + lib.util.UIString.getUIString("$351017") + UI["continentalNameStr" + selectedContinental]);
   }
   else if(stepNum == 3)
   {
      container_mc.map.disableStatic._visible = true;
      if(selectedContinental == "A")
      {
         setVisibleGuard(false,"B");
         setVisibleGuard(false,"C");
         setVisibleGuard(true,"A",1);
      }
      else if(selectedContinental == "B")
      {
         setVisibleGuard(false,"A");
         setVisibleGuard(false,"C");
         setVisibleGuard(true,"B",1);
      }
      else if(selectedContinental == "C")
      {
         setVisibleGuard(false,"A");
         setVisibleGuard(false,"B");
         setVisibleGuard(true,"C",1);
      }
      setSelectableGuard(true,selectedContinental);
      container_mc.registration.introduce_txt.setText("<img src=\'icon_notice\' vspace=\'-1\'> " + lib.util.UIString.getUIString("$351003") + UI["continentalNameStr" + selectedContinental]);
   }
   else if(stepNum == 4)
   {
      reg_btn.setEnabled(true);
      setSelectableGuard(false);
      container_mc.registration.introduce_txt.setText("<img src=\'icon_notice\' vspace=\'-1\'> " + lib.util.UIString.getUIString("$351004"));
      Selection.setFocus(container_mc.registration.input_txt);
   }
};
myListener.OnGame_SenatorMap_REG_SetGuideText = function(requirementDataList, scheduleDataList)
{
   var _loc12_ = 0;
   for(mc in container_mc.registration.regConditionList_mc)
   {
      var _loc3_ = container_mc.registration.regConditionList_mc[mc];
      if(typeof _loc3_ == "movieclip" && _loc3_._name.substr(0,16) == "regConditionLine")
      {
         _loc3_.removeMovieClip();
      }
   }
   var _loc7_ = requirementDataList.split("\n");
   if(_loc7_[_loc7_.length - 1] == "0" || _loc7_[_loc7_.length - 1] == "undefined" || _loc7_[_loc7_.length - 1] == undefined || _loc7_[_loc7_.length - 1] == "")
   {
      _loc7_.pop();
   }
   var _loc13_ = "";
   var _loc4_ = undefined;
   var _loc1_ = 0;
   while(_loc1_ < _loc7_.length)
   {
      var _loc2_ = _loc7_[_loc1_].split("\t");
      if(_loc2_.length != 1)
      {
         var _loc11_ = Number(_loc2_[0]);
         var _loc5_ = _loc2_[1];
         var mc = container_mc.registration.regConditionList_mc.attachMovie("regConditionLine","regConditionLine" + _loc1_,container_mc.registration.regConditionList_mc.getNextHighestDepth());
         mc.num.text = _loc1_ + 1;
         mc.num.textColor = lib.info.TextColor.GENERAL_EXPLAIN_DETAIL;
         mc._x = 12;
         if(_loc4_ != undefined)
         {
            mc._y = _loc4_._y + _loc4_._height + 1;
         }
         else
         {
            mc._y = 45;
         }
         _loc4_ = mc;
         if(_loc11_)
         {
            mc.txt_0.htmlText = "<font color=\'#" + lib.info.TextColor.GENERAL_EMPHASIS.toString(16) + "\'>" + _loc5_ + "</font>" + " <img src=\'icon_conditionCheck_ok\' vspace=\'-6\'>";
         }
         else
         {
            mc.txt_0.htmlText = "<font color=\'#" + lib.info.TextColor.GENERAL_IMPOSSIBLE.toString(16) + "\'>" + _loc5_ + "</font>" + " <img src=\'icon_conditionCheck_no\' vspace=\'-6\'>";
         }
         if(mc.txt_0.textHeight > mc.txt_0._height)
         {
            mc.txt_0._height = mc.txt_0.textHeight + 4;
         }
         _loc12_ = mc._y + mc._height;
      }
      _loc1_ = _loc1_ + 1;
   }
   container_mc.registration.regConditionList_mc.paragraph_mc1._y = _loc12_ + 5;
   container_mc.registration.regConditionList_mc.paragraph_txt1._y = _loc12_ + 12.6;
   container_mc.registration.regConditionList_mc.step_txt._y = _loc12_ + 45.7;
   var _loc8_ = scheduleDataList.split("\n");
   if(_loc8_[_loc8_.length - 1] == "0" || _loc8_[_loc8_.length - 1] == "undefined" || _loc8_[_loc8_.length - 1] == undefined || _loc8_[_loc8_.length - 1] == "")
   {
      _loc8_.pop();
   }
   var _loc9_ = " ";
   _loc1_ = 0;
   while(_loc1_ < _loc8_.length)
   {
      _loc2_ = _loc8_[_loc1_].split("\t");
      if(_loc2_.length != 1)
      {
         var _loc10_ = Number(_loc2_[0]);
         var _loc6_ = _loc2_[1];
         if(_loc1_ != 0)
         {
            _loc9_ = _loc9_ + ("<font color=\'#" + lib.info.TextColor.GENERAL_CONTENTS.toString(16) + "\'>" + " &gt; " + "</font>");
         }
         if(_loc10_)
         {
            _loc9_ = _loc9_ + ("<font color=\'#" + lib.info.TextColor.UI_SENATORMAP_REG_STEP_CURRENT.toString(16) + "\'>" + _loc6_ + "</font>");
         }
         else
         {
            _loc9_ = _loc9_ + ("<font color=\'#" + lib.info.TextColor.UI_SENATORMAP_REG_STEP_NOTCURRENT.toString(16) + "\'>" + _loc6_ + "</font>");
         }
      }
      _loc1_ = _loc1_ + 1;
   }
   container_mc.registration.regConditionList_mc.step_txt.htmlText = _loc9_;
   scrollbar.pageSize = container_mc.registration.regConditionList_mc._height;
};
myListener.OnGame_SenatorMap_REG_DisableGuard = function(dataList)
{
   var _loc4_ = dataList.split("\n");
   if(_loc4_[_loc4_.length - 1] == "0" || _loc4_[_loc4_.length - 1] == "undefined" || _loc4_[_loc4_.length - 1] == "")
   {
      _loc4_.pop();
   }
   var _loc3_ = 0;
   while(_loc3_ < _loc4_.length)
   {
      var _loc2_ = _loc4_[_loc3_].split("\t");
      if(_loc2_.length != 1)
      {
         var _loc5_ = Number(_loc2_[1]);
         var _loc1_ = container_mc.map[_loc2_[0]];
         if(_loc5_)
         {
            _loc1_.FX_DISABLE._visible = true;
            _loc1_.SLOT._visible = false;
            _loc1_.method_mc._visible = false;
            _loc1_.selected._visible = false;
         }
         else
         {
            _loc1_.FX_DISABLE._visible = false;
            _loc1_.SLOT._visible = true;
            _loc1_.method_mc._visible = true;
         }
      }
      _loc3_ = _loc3_ + 1;
   }
};
myListener.OnGame_SenatorMap_REG_SetFinishedContinental = function(continental)
{
   container_mc.registration["finished_" + continental]._visible = true;
   setDisableContinental(continental,true);
   if(continental == "A")
   {
      var _loc1_ = 0;
      while(_loc1_ < continental_A_Guard.length)
      {
         container_mc.map.worldText[continental_A_Guard[_loc1_]]._visible = false;
         _loc1_ = _loc1_ + 1;
      }
   }
   else if(continental == "B")
   {
      _loc1_ = 0;
      while(_loc1_ < continental_B_Guard.length)
      {
         container_mc.map.worldText[continental_B_Guard[_loc1_]]._visible = false;
         _loc1_ = _loc1_ + 1;
      }
   }
   else if(continental == "C")
   {
      _loc1_ = 0;
      while(_loc1_ < continental_C_Guard.length)
      {
         container_mc.map.worldText[continental_C_Guard[_loc1_]]._visible = false;
         _loc1_ = _loc1_ + 1;
      }
   }
};
myListener.OnGame_SenatorMap_REG_SetFinishedMethod = function(method)
{
   method = Number(method);
   if(method == 1)
   {
      container_mc.registration.selectMethod_mc.finish_Battle_txt._visible = true;
      container_mc.registration.selectMethod_mc.method_Battle_mc.mc.gotoAndStop(2);
      container_mc.registration.selectMethod_mc.method_Battle_mc.enabled = false;
      container_mc.registration.selectMethod_mc.method_Battle_txt.textColor = 11053224;
   }
   else if(method == 2)
   {
      container_mc.registration.selectMethod_mc.finish_Vote_txt._visible = true;
      container_mc.registration.selectMethod_mc.method_Vote_mc.mc.gotoAndStop(2);
      container_mc.registration.selectMethod_mc.method_Vote_mc.enabled = false;
      container_mc.registration.selectMethod_mc.method_Vote_txt.textColor = 11053224;
   }
};
myListener.OnGame_SenatorMap_REG_Clear = function()
{
   clearGuard(1);
   clearContinental();
   setVisibleContinental(true);
   container_mc.registration.introduce_txt.setText("<img src=\'icon_notice\' vspace=\'-1\'> " + lib.util.UIString.getUIString("$351002"));
   for(mc in container_mc.registration.regConditionList_mc)
   {
      var _loc2_ = container_mc.registration.regConditionList_mc[mc];
      if(typeof _loc2_ == "movieclip" && _loc2_._name.substr(0,16) == "regConditionLine")
      {
         _loc2_.removeMovieClip();
      }
   }
   container_mc.registration.regConditionList_mc.step_txt.text = "";
   container_mc.registration.selectedContinental.text = "";
   container_mc.registration.regCost.text = "";
   container_mc.registration.selectedMethod.text = "";
   var _loc1_ = 0;
   while(_loc1_ < 5)
   {
      _loc2_ = container_mc.registration["selectedGuard_" + (_loc1_ + 1)];
      _loc2_._visible = false;
      _loc1_ = _loc1_ + 1;
   }
   input_txt.setChanged(false);
   input_txt.caption = lib.util.UIString.getUIString("$351022");
   input_txt.textField.text = input_txt.caption;
   selectedContinental = null;
   selectedGuard = null;
   setSelectableContinental(true);
   setSelectableGuard(false);
   setVisibleGuard(false);
   reg_btn.setEnabled(false);
   myListener.OnGame_SenatorMap_REG_SetElectMethod(saveElectMethod,saveToolTip1,saveToolTip2);
   container_mc.registration.selectMethod_mc.gotoAndStop(1);
   container_mc.registration.finished_A._visible = false;
   container_mc.registration.finished_B._visible = false;
   container_mc.registration.finished_C._visible = false;
   container_mc.registration.selectMethod_mc._visible = false;
   container_mc.registration.selectMethod_mc.method_Vote_mc.enabled = true;
   container_mc.registration.selectMethod_mc.method_Battle_mc.enabled = true;
   container_mc.registration.selectMethod_mc.method_Vote_mc.mc.gotoAndStop(1);
   container_mc.registration.selectMethod_mc.method_Battle_mc.mc.gotoAndStop(1);
   container_mc.registration.selectMethod_mc.method_Vote_txt.textColor = 15719737;
   container_mc.registration.selectMethod_mc.method_Battle_txt.textColor = 15719737;
   container_mc.registration.selectMethod_mc.finish_Vote_txt._visible = false;
   container_mc.registration.selectMethod_mc.finish_Battle_txt._visible = false;
};
var input_txt = new lib.util.ExtTextField(container_mc.registration.input_txt,0,container_mc.registration.input_focus);
var init_btn = container_mc.registration.initBtn.txtBtn;
var reg_btn = container_mc.registration.regBtn.txtBtn;
input_txt.onChanged = function()
{
   var _loc1_ = 0;
   if(NameTextLength_Local > 0)
   {
      _loc1_ = NameTextLength_Local;
   }
   else
   {
      _loc1_ = 400;
   }
   lib.util.StrByteLen.getLenth3(container_mc.registration.input_txt,_loc1_);
   lib.Debuger.trace("NameTextLength_Local : " + NameTextLength_Local);
};
input_txt.caption = lib.util.UIString.getUIString("$351022");
input_txt.onSetFocusEvent = function()
{
   if(this.text == this.caption)
   {
      this.textField.text = "";
   }
};
reg_btn.setEnabled(false);
init_btn.setRelease(function()
{
   ToGame_SenatorMap_REG_ClickInitBtn();
}
);
reg_btn.setRelease(function()
{
   if(input_txt.text != input_txt.caption)
   {
      ToGame_SenatorMap_REG_ClickRegBtn(input_txt.text);
   }
   else
   {
      ToGame_SenatorMap_REG_ClickRegBtn("");
   }
}
);
container_mc.registration.scrollbar.setTextField(container_mc.registration.input_txt);
var scrollbar = container_mc.registration.scrollbar_desc;
scrollbar.addListener(container_mc.registration.regConditionList_mc);
container_mc.registration.regConditionList_mc.onScroll = function()
{
   container_mc.registration.regConditionList_mc._y = -1 - arguments[0];
};
scrollbar.setWheel(container_mc.registration.regConditionList_mc);
scrollbar.wheelDelta = 1;
scrollbar.pageSize = 0;
scrollbar.displaySize = container_mc.registration.mask_mc._height;
scrollbar.defaultBarSizeRatio = 0.3333333333333333;
scrollbar.rowHeight = 35;
scrollbar.scroll = 0;
myListener.OnGame_SenatorMap_REG_Clear();
var scrollBar = container_mc.condition.scrollbar;
var listObj = {};
scrollBar.addListener(listObj);
listObj.onScroll = function()
{
   container_mc.condition.list_mc._y = 72 - arguments[0];
};
scrollBar.setWheel(container_mc.condition.list_mc);
scrollBar.wheelDelta = 1;
scrollBar.pageSize = 0;
scrollBar.displaySize = container_mc.condition.mask_mc._height;
scrollBar.defaultBarSizeRatio = 0.3333333333333333;
scrollBar.rowHeight = 35;
scrollBar.scroll = 0;
var scrollBar2 = container_mc.condition.scrollbar2;
var listObj2 = {};
scrollBar2.addListener(listObj2);
listObj2.onScroll = function()
{
   container_mc.condition.list2_mc._y = 72 - arguments[0];
};
scrollBar2.setWheel(container_mc.condition.list2_mc);
scrollBar2.wheelDelta = 1;
scrollBar2.pageSize = 0;
scrollBar2.displaySize = container_mc.condition.mask2_mc._height;
scrollBar2.defaultBarSizeRatio = 0.3333333333333333;
scrollBar2.rowHeight = 35;
scrollBar2.scroll = 0;
container_mc.condition.introduce_txt.textColor = lib.info.TextColor.GENERAL_NOTICE;
container_mc.condition.introduce_txt.htmlText = "<img src=\'icon_notice\' vspace=\'-1\'> " + lib.util.UIString.getUIString("$361018");
myListener.OnGame_SenatorMap_CON_SelectContinental = function(continental)
{
   selectContinental(continental,undefined,1);
};
myListener.OnGame_SenatorMap_CON_SetFirstRankInfo = function(electMethod, continental, name, guildName, icon)
{
   if(sBFEnable == "0")
   {
      container_mc.condition.info_mc.rankMc1._visible = false;
      container_mc.condition.info_mc.rankMc2._y = 60;
      container_mc.condition.info_mc.lineMc._visible = false;
   }
   electMethod = Number(electMethod);
   if(container_mc.condition.info_mc.continental != continental)
   {
      container_mc.condition.info_mc.info1 = undefined;
      container_mc.condition.info_mc.info2 = undefined;
   }
   container_mc.condition.info_mc.continental = continental;
   if(electMethod == 1)
   {
      container_mc.condition.info_mc.info1 = {electMethod:electMethod,icon:icon,name:name,guildName:guildName};
   }
   else if(electMethod == 2)
   {
      container_mc.condition.info_mc.info2 = {electMethod:electMethod,icon:icon,name:name,guildName:guildName};
   }
   var _loc4_ = null;
   var _loc3_ = null;
   var _loc1_ = 0;
   while(_loc1_ < firstRankInfoPos_array.length)
   {
      if(firstRankInfoPos_array[_loc1_].con == continental)
      {
         _loc4_ = firstRankInfoPos_array[_loc1_].x;
         _loc3_ = firstRankInfoPos_array[_loc1_].y;
         break;
      }
      _loc1_ = _loc1_ + 1;
   }
   if(container_mc.condition.info_mc.info1 != undefined && container_mc.condition.info_mc.info2 != undefined)
   {
      container_mc.condition.info_mc._visible = true;
      gs.TweenLite.killTweensOf(container_mc.condition.info_mc,false);
      gs.TweenLite.to(container_mc.condition.info_mc,0.2,{_alpha:0,_y:container_mc.condition.info_mc._y + 30,ease:Regular.easeOut,onComplete:onMotionFinished,onCompleteParams:[continental,_loc4_,_loc3_]});
   }
};
var voteList = new lib.util.List(container_mc.condition.list_mc,"line",-5);
var battleList = new lib.util.List(container_mc.condition.list2_mc,"line2",-5);
voteList.rowHeight = 35;
battleList.rowHeight = 35;
myListener.OnGame_SenatorMap_CON_SetVoteData = function(dataList, topClassNumber)
{
   voteList.clear();
   topClassNumber = Number(topClassNumber);
   var _loc15_ = container_mc.condition.list_mc.attachMovie("topClass","topClass",-10000);
   _loc15_._height = 30 * topClassNumber;
   var _loc6_ = dataList.split("\n");
   if(_loc6_[_loc6_.length - 1] == "0" || _loc6_[_loc6_.length - 1] == "undefined" || _loc6_[_loc6_.length - 1] == "")
   {
      _loc6_.splice(_loc6_.length - 1,1);
   }
   var _loc4_ = 0;
   while(_loc4_ < _loc6_.length)
   {
      var _loc3_ = _loc6_[_loc4_].split("\t");
      if(_loc3_.length != 1)
      {
         var _loc8_ = _loc3_[1];
         var _loc5_ = Number(_loc3_[2]);
         var _loc10_ = _loc3_[3];
         var _loc7_ = _loc3_[4];
         var _loc11_ = _loc3_[5];
         var _loc12_ = _loc3_[6];
         var _loc13_ = Number(_loc3_[7]);
         var _loc9_ = Number(_loc3_[8]);
         var _loc2_ = voteList.add(_loc3_[0],"attachLine");
         _loc2_.enabled = false;
         _loc2_.voted._visible = false;
         if(_loc5_)
         {
            lib.manager.ToolTip.add(_loc2_.compete_mc,lib.util.UIString.getUIString("$361020"),1);
            _loc2_.compete_mc._y = 20;
         }
         _loc2_.compete_mc._visible = _loc5_;
         _loc2_.stat = _loc4_;
         _loc2_.txt0.setText(_loc8_);
         _loc2_.txt2.setText(_loc10_);
         _loc2_.txt3.setText(_loc7_);
         _loc2_.txt4.setText(_loc11_);
         _loc2_.txt5.setText(_loc12_);
         if(_loc13_)
         {
            _loc2_.voted._visible = true;
            _loc2_.txt0._visible = false;
            lib.manager.ToolTip.add(_loc2_.voted,lib.util.UIString.getUIString("$361016"),1);
         }
         if(_loc9_)
         {
            _loc2_.txt0.textColor = lib.info.TextColor.LIST_MYGUILD;
            _loc2_.txt1.textColor = lib.info.TextColor.LIST_MYGUILD;
            _loc2_.txt2.textColor = lib.info.TextColor.LIST_MYGUILD;
            _loc2_.txt3.textColor = lib.info.TextColor.LIST_MYGUILD;
            _loc2_.txt4.textColor = lib.info.TextColor.LIST_MYGUILD;
            _loc2_.txt5.textColor = lib.info.TextColor.LIST_MYGUILD;
         }
         else
         {
            _loc2_.txt0.textColor = lib.info.TextColor.GENERAL_CONTENTS;
            _loc2_.txt1.textColor = lib.info.TextColor.GENERAL_CONTENTS;
            _loc2_.txt2.textColor = lib.info.TextColor.GENERAL_CONTENTS;
            _loc2_.txt3.textColor = lib.info.TextColor.GENERAL_CONTENTS;
            _loc2_.txt4.textColor = lib.info.TextColor.GENERAL_CONTENTS;
            _loc2_.txt5.textColor = lib.info.TextColor.GENERAL_CONTENTS;
         }
         _loc2_.pledge_btn.onEnterFrame = function()
         {
            var id = this._parent.id;
            if(this.txtBtn != undefined)
            {
               this.txtBtn.setRelease(function()
               {
                  ToGame_SenatorMap_CON_ShowPledge(id);
               }
               );
               delete this.onEnterFrame;
            }
         };
      }
      _loc4_ = _loc4_ + 1;
   }
   scrollBar.pageSize = container_mc.condition.list_mc._height;
};
myListener.OnGame_SenatorMap_CON_SetBattleData = function(dataList, topClassNumber)
{
   battleList.clear();
   topClassNumber = Number(topClassNumber);
   var _loc15_ = container_mc.condition.list2_mc.attachMovie("topClass","topClass",-10000);
   _loc15_._height = 30 * topClassNumber;
   var _loc6_ = dataList.split("\n");
   if(_loc6_[_loc6_.length - 1] == "0" || _loc6_[_loc6_.length - 1] == "undefined" || _loc6_[_loc6_.length - 1] == "")
   {
      _loc6_.splice(_loc6_.length - 1,1);
   }
   var _loc4_ = 0;
   while(_loc4_ < _loc6_.length)
   {
      var _loc3_ = _loc6_[_loc4_].split("\t");
      if(_loc3_.length != 1)
      {
         var _loc8_ = _loc3_[1];
         var _loc5_ = Number(_loc3_[2]);
         var _loc10_ = _loc3_[3];
         var _loc7_ = _loc3_[4];
         var _loc11_ = _loc3_[5];
         var _loc12_ = _loc3_[6];
         var _loc13_ = Number(_loc3_[7]);
         var _loc9_ = Number(_loc3_[8]);
         var _loc2_ = battleList.add(_loc3_[0],"attachLine");
         if(_loc5_)
         {
            lib.manager.ToolTip.add(_loc2_.compete_mc,lib.util.UIString.getUIString("$361020"),1);
            _loc2_.compete_mc._y = 20;
         }
         _loc2_.compete_mc._visible = _loc5_;
         _loc2_.enabled = false;
         _loc2_.voted._visible = false;
         _loc2_.stat = _loc4_;
         _loc2_.txt0.setText(_loc8_);
         _loc2_.txt2.setText(_loc10_);
         _loc2_.txt3.setText(_loc7_);
         _loc2_.txt4.setText(_loc11_);
         _loc2_.txt5.setText(_loc12_);
         if(_loc13_)
         {
            _loc2_.voted._visible = true;
            _loc2_.txt0._visible = false;
            lib.manager.ToolTip.add(_loc2_.voted,lib.util.UIString.getUIString("$361016"),1);
         }
         if(_loc9_)
         {
            _loc2_.voted._visible = true;
            _loc2_.txt0._visible = false;
            _loc2_.txt0.textColor = lib.info.TextColor.LIST_MYGUILD;
            _loc2_.txt1.textColor = lib.info.TextColor.LIST_MYGUILD;
            _loc2_.txt2.textColor = lib.info.TextColor.LIST_MYGUILD;
            _loc2_.txt3.textColor = lib.info.TextColor.LIST_MYGUILD;
            _loc2_.txt4.textColor = lib.info.TextColor.LIST_MYGUILD;
            _loc2_.txt5.textColor = lib.info.TextColor.LIST_MYGUILD;
         }
         else
         {
            _loc2_.txt0.textColor = lib.info.TextColor.GENERAL_CONTENTS;
            _loc2_.txt1.textColor = lib.info.TextColor.GENERAL_CONTENTS;
            _loc2_.txt2.textColor = lib.info.TextColor.GENERAL_CONTENTS;
            _loc2_.txt3.textColor = lib.info.TextColor.GENERAL_CONTENTS;
            _loc2_.txt4.textColor = lib.info.TextColor.GENERAL_CONTENTS;
            _loc2_.txt5.textColor = lib.info.TextColor.GENERAL_CONTENTS;
         }
         lib.manager.ToolTip.add(_loc2_,_loc3_[1],11);
         _loc2_.pledge_btn.onEnterFrame = function()
         {
            var id = this._parent.id;
            if(this.txtBtn != undefined)
            {
               this.txtBtn.setRelease(function()
               {
                  ToGame_SenatorMap_CON_ShowPledge(id);
               }
               );
               delete this.onEnterFrame;
            }
         };
      }
      _loc4_ = _loc4_ + 1;
   }
   scrollBar2.pageSize = container_mc.condition.list2_mc._height;
   if(tab.activedNum != 1)
   {
      container_mc.condition.scrollbar2._visible = false;
   }
};
var sBFEnable = lib.gamedata.DefaultData.getDefaultUIData("senatorBFEnable").param0;
function searchGuard(continental, guard)
{
   var _loc2_ = undefined;
   var _loc5_ = continental;
   if(continental == "A")
   {
      _loc2_ = continental_A_Guard;
   }
   else if(continental == "B")
   {
      _loc2_ = continental_B_Guard;
   }
   else if(continental == "C")
   {
      _loc2_ = continental_C_Guard;
   }
   var _loc1_ = 0;
   while(_loc1_ < _loc2_.length)
   {
      if(_loc2_[_loc1_] == guard)
      {
         return undefined;
      }
      _loc1_ = _loc1_ + 1;
   }
}
function clearContinental()
{
   selectedContinental = null;
   lib.info.TextColor.setWorldMapTextColor(0,"continental",container_mc.map.worldText.continentalText_A);
   lib.info.TextColor.setWorldMapTextColor(0,"continental",container_mc.map.worldText.continentalText_B);
   lib.info.TextColor.setWorldMapTextColor(0,"continental",container_mc.map.worldText.continentalText_C);
   setVisibleContinental(1,"A");
   setVisibleContinental(1,"B");
   setVisibleContinental(1,"C");
   var _loc3_ = 0;
   while(_loc3_ < 4)
   {
      var _loc2_ = container_mc.map["continental_" + continental_array[_loc3_]];
      _loc2_.stat = continental_array[_loc3_];
      _loc2_.gotoAndStop(1);
      _loc2_.SLOT.onRollOver = function()
      {
      };
      _loc2_.SLOT.onRollOut = _loc2_.SLOT.onReleaseOutside = function()
      {
      };
      _loc2_.SLOT.onRelease = function()
      {
         lib.manager.UISound.play(lib.manager.UISound.MAIN_BTN);
         if(this._parent.stat != selectedContinental)
         {
            ToGame_SenatorMap_SelectContinental(this._parent.stat);
         }
      };
      _loc2_.SLOT._visible = true;
      _loc2_.FX_OVER._visible = false;
      _loc2_.FX_ACTIVE._visible = false;
      _loc2_.FX_ACTIVE.gotoAndStop(1);
      _loc2_.FX_DISABLE._visible = false;
      _loc3_ = _loc3_ + 1;
   }
   container_mc.vote.A._visible = false;
   container_mc.vote.B._visible = false;
   container_mc.vote.C._visible = false;
}
function clearGuard(bActiveEffectClear)
{
   container_mc.map.disableStatic._visible = false;
   var _loc3_ = 0;
   while(_loc3_ < continental_A_Guard.length)
   {
      container_mc.map.worldText[continental_A_Guard[_loc3_]]._visible = true;
      _loc3_ = _loc3_ + 1;
   }
   _loc3_ = 0;
   while(_loc3_ < continental_B_Guard.length)
   {
      container_mc.map.worldText[continental_B_Guard[_loc3_]]._visible = true;
      _loc3_ = _loc3_ + 1;
   }
   _loc3_ = 0;
   while(_loc3_ < continental_C_Guard.length)
   {
      container_mc.map.worldText[continental_C_Guard[_loc3_]]._visible = true;
      _loc3_ = _loc3_ + 1;
   }
   _loc3_ = 0;
   while(_loc3_ < continental_A_Guard.length)
   {
      container_mc.map.worldText[continental_A_Guard[_loc3_]].textColor = 15719737;
      _loc3_ = _loc3_ + 1;
   }
   _loc3_ = 0;
   while(_loc3_ < continental_B_Guard.length)
   {
      container_mc.map.worldText[continental_B_Guard[_loc3_]].textColor = 15719737;
      _loc3_ = _loc3_ + 1;
   }
   _loc3_ = 0;
   while(_loc3_ < continental_C_Guard.length)
   {
      container_mc.map.worldText[continental_C_Guard[_loc3_]].textColor = 15719737;
      _loc3_ = _loc3_ + 1;
   }
   _loc3_ = 0;
   while(_loc3_ < continental_A_Guard.length)
   {
      var _loc2_ = container_mc.map[continental_A_Guard[_loc3_]];
      _loc2_.select = false;
      _loc2_.gotoAndStop(1);
      _loc2_.selected._visible = false;
      _loc2_.selected.txt.text = "";
      _loc2_.SLOT.onRollOver = function()
      {
         if(!this._parent.select)
         {
            this._parent.gotoAndStop(2);
         }
      };
      _loc2_.SLOT.onRollOut = _loc2_.SLOT.onReleaseOutside = function()
      {
         if(!this._parent.select)
         {
            this._parent.gotoAndStop(1);
         }
      };
      _loc2_.SLOT.onRelease = function()
      {
         lib.manager.UISound.play(lib.manager.UISound.MAIN_BTN);
         if(!this._parent.select)
         {
            ToGame_SenatorMap_SelectGuard(this._parent._name);
         }
      };
      _loc2_.SLOT._visible = true;
      _loc2_.FX_OVER._visible = false;
      _loc2_.FX_ACTIVE._visible = false;
      if(bActiveEffectClear)
      {
         _loc2_.FX_ACTIVE.gotoAndStop(1);
      }
      _loc2_.FX_DISABLE._visible = false;
      _loc3_ = _loc3_ + 1;
   }
   _loc3_ = 0;
   while(_loc3_ < continental_B_Guard.length)
   {
      _loc2_ = container_mc.map[continental_B_Guard[_loc3_]];
      _loc2_.select = false;
      _loc2_.gotoAndStop(1);
      _loc2_.selected._visible = false;
      _loc2_.selected.txt.text = "";
      _loc2_.SLOT.onRollOver = function()
      {
         if(!this._parent.select)
         {
            this._parent.gotoAndStop(2);
         }
      };
      _loc2_.SLOT.onRollOut = _loc2_.SLOT.onReleaseOutside = function()
      {
         if(!this._parent.select)
         {
            this._parent.gotoAndStop(1);
         }
      };
      _loc2_.SLOT.onRelease = function()
      {
         lib.manager.UISound.play(lib.manager.UISound.MAIN_BTN);
         if(!this._parent.select)
         {
            ToGame_SenatorMap_SelectGuard(this._parent._name);
         }
      };
      _loc2_.SLOT._visible = true;
      _loc2_.FX_OVER._visible = false;
      _loc2_.FX_ACTIVE._visible = false;
      if(bActiveEffectClear)
      {
         _loc2_.FX_ACTIVE.gotoAndStop(1);
      }
      _loc2_.FX_DISABLE._visible = false;
      _loc3_ = _loc3_ + 1;
   }
   _loc3_ = 0;
   while(_loc3_ < continental_C_Guard.length)
   {
      _loc2_ = container_mc.map[continental_C_Guard[_loc3_]];
      _loc2_.select = false;
      _loc2_.gotoAndStop(1);
      _loc2_.selected._visible = false;
      _loc2_.selected.txt.text = "";
      _loc2_.SLOT.onRollOver = function()
      {
         if(!this._parent.select)
         {
            this._parent.gotoAndStop(2);
         }
      };
      _loc2_.SLOT.onRollOut = _loc2_.SLOT.onReleaseOutside = function()
      {
         if(!this._parent.select)
         {
            this._parent.gotoAndStop(1);
         }
      };
      _loc2_.SLOT.onRelease = function()
      {
         lib.manager.UISound.play(lib.manager.UISound.MAIN_BTN);
         if(!this._parent.select)
         {
            ToGame_SenatorMap_SelectGuard(this._parent._name);
         }
      };
      _loc2_.SLOT._visible = true;
      _loc2_.FX_OVER._visible = false;
      _loc2_.FX_ACTIVE._visible = false;
      if(bActiveEffectClear)
      {
         _loc2_.FX_ACTIVE.gotoAndStop(1);
      }
      _loc2_.FX_DISABLE._visible = false;
      _loc3_ = _loc3_ + 1;
   }
}
function setDisableContinental(continental, bTrue)
{
   if(continental == "A")
   {
      container_mc.map.continental_A.SLOT._visible = !bTrue;
      container_mc.map.continental_A.FX_DISABLE._visible = bTrue;
      container_mc.map.continental_A.FX_ACTIVE._visible = !bTrue;
      container_mc.map.continental_A.FX_OVER._visible = !bTrue;
      lib.info.TextColor.setWorldMapTextColor(0,"continental",container_mc.map.worldText.continentalText_A);
   }
   else if(continental == "B")
   {
      container_mc.map.continental_B.SLOT._visible = !bTrue;
      container_mc.map.continental_B.FX_DISABLE._visible = bTrue;
      container_mc.map.continental_B.FX_ACTIVE._visible = !bTrue;
      container_mc.map.continental_B.FX_OVER._visible = !bTrue;
      lib.info.TextColor.setWorldMapTextColor(0,"continental",container_mc.map.worldText.continentalText_B);
   }
   else if(continental == "C")
   {
      container_mc.map.continental_C.SLOT._visible = !bTrue;
      container_mc.map.continental_C.FX_DISABLE._visible = bTrue;
      container_mc.map.continental_C.FX_ACTIVE._visible = !bTrue;
      container_mc.map.continental_C.FX_OVER._visible = !bTrue;
      lib.info.TextColor.setWorldMapTextColor(0,"continental",container_mc.map.worldText.continentalText_C);
   }
}
function selectContinental(continental, autoDisiable, autoSelectableAnotherContinental)
{
   container_mc.map.continental_A.FX_ACTIVE._visible = false;
   container_mc.map.continental_B.FX_ACTIVE._visible = false;
   container_mc.map.continental_C.FX_ACTIVE._visible = false;
   if(autoSelectableAnotherContinental)
   {
      if(!container_mc.map.continental_A.FX_DISABLE._visible)
      {
         container_mc.map.continental_A.SLOT._visible = true;
      }
      if(!container_mc.map.continental_B.FX_DISABLE._visible)
      {
         container_mc.map.continental_B.SLOT._visible = true;
      }
      if(!container_mc.map.continental_C.FX_DISABLE._visible)
      {
         container_mc.map.continental_C.SLOT._visible = true;
      }
   }
   if(continental == "A")
   {
      container_mc.map.continental_A.SLOT._visible = false;
      container_mc.map.continental_A.FX_DISABLE._visible = false;
      container_mc.map.continental_A.FX_ACTIVE._visible = true;
      if(container_mc.map.continental_A.FX_ACTIVE._currentframe != container_mc.map.continental_A.FX_ACTIVE._totalframes)
      {
         container_mc.map.continental_A.FX_ACTIVE.gotoAndPlay(2);
      }
      container_mc.map.continental_B.FX_ACTIVE.gotoAndStop(1);
      container_mc.map.continental_C.FX_ACTIVE.gotoAndStop(1);
      if(autoDisiable)
      {
         setDisableContinental("B",1);
         setDisableContinental("C",1);
      }
   }
   else if(continental == "B")
   {
      container_mc.map.continental_B.SLOT._visible = false;
      container_mc.map.continental_B.FX_DISABLE._visible = false;
      container_mc.map.continental_B.FX_ACTIVE._visible = true;
      if(container_mc.map.continental_B.FX_ACTIVE._currentframe != container_mc.map.continental_B.FX_ACTIVE._totalframes)
      {
         container_mc.map.continental_B.FX_ACTIVE.gotoAndPlay(2);
      }
      container_mc.map.continental_A.FX_ACTIVE.gotoAndStop(1);
      container_mc.map.continental_C.FX_ACTIVE.gotoAndStop(1);
      if(autoDisiable)
      {
         setDisableContinental("A",1);
         setDisableContinental("C",1);
      }
   }
   else if(continental == "C")
   {
      container_mc.map.continental_C.SLOT._visible = false;
      container_mc.map.continental_C.FX_DISABLE._visible = false;
      container_mc.map.continental_C.FX_ACTIVE._visible = true;
      if(container_mc.map.continental_C.FX_ACTIVE._currentframe != container_mc.map.continental_C.FX_ACTIVE._totalframes)
      {
         container_mc.map.continental_C.FX_ACTIVE.gotoAndPlay(2);
      }
      container_mc.map.continental_A.FX_ACTIVE.gotoAndStop(1);
      container_mc.map.continental_B.FX_ACTIVE.gotoAndStop(1);
      if(autoDisiable)
      {
         setDisableContinental("A",1);
         setDisableContinental("B",1);
      }
   }
   container_mc.map["continental_" + continental].FX_OVER._visible = false;
   lib.info.TextColor.setWorldMapTextColor(0,"continental",container_mc.map.worldText.continentalText_A);
   lib.info.TextColor.setWorldMapTextColor(0,"continental",container_mc.map.worldText.continentalText_B);
   lib.info.TextColor.setWorldMapTextColor(0,"continental",container_mc.map.worldText.continentalText_C);
   lib.info.TextColor.setWorldMapTextColor(1,"continental",container_mc.map.worldText["continentalText_" + continental]);
   selectedContinental = continental;
}
function selectGuard(guardName, showGuardNumber)
{
   var _loc1_ = container_mc.map[guardName];
   _loc1_.FX_ACTIVE._visible = true;
   if(_loc1_.FX_ACTIVE._currentframe != _loc1_.FX_ACTIVE._totalframes)
   {
      _loc1_.FX_ACTIVE.gotoAndPlay(2);
   }
   _loc1_.SLOT._visible = false;
   if(showGuardNumber != "" && showGuardNumber != undefined)
   {
      _loc1_.selected._visible = true;
      _loc1_.selected.txt.text = showGuardNumber;
   }
   container_mc.map.worldText[guardName].textColor = 16777215;
   _loc1_.select = true;
}
function setSelectableContinental(bTrue)
{
   container_mc.map.continental_A.SLOT._visible = bTrue;
   container_mc.map.continental_B.SLOT._visible = bTrue;
   container_mc.map.continental_C.SLOT._visible = bTrue;
}
function setSelectableGuard(bTrue, continental)
{
   if(continental == undefined)
   {
      var _loc2_ = 0;
      while(_loc2_ < continental_A_Guard.length)
      {
         container_mc.map[continental_A_Guard[_loc2_]].SLOT._visible = bTrue;
         _loc2_ = _loc2_ + 1;
      }
      _loc2_ = 0;
      while(_loc2_ < continental_B_Guard.length)
      {
         container_mc.map[continental_B_Guard[_loc2_]].SLOT._visible = bTrue;
         _loc2_ = _loc2_ + 1;
      }
      _loc2_ = 0;
      while(_loc2_ < continental_C_Guard.length)
      {
         container_mc.map[continental_C_Guard[_loc2_]].SLOT._visible = bTrue;
         _loc2_ = _loc2_ + 1;
      }
   }
   else if(continental == "A")
   {
      _loc2_ = 0;
      while(_loc2_ < continental_A_Guard.length)
      {
         container_mc.map[continental_A_Guard[_loc2_]].SLOT._visible = bTrue;
         _loc2_ = _loc2_ + 1;
      }
   }
   else if(continental == "B")
   {
      _loc2_ = 0;
      while(_loc2_ < continental_B_Guard.length)
      {
         container_mc.map[continental_B_Guard[_loc2_]].SLOT._visible = bTrue;
         _loc2_ = _loc2_ + 1;
      }
   }
   else if(continental == "C")
   {
      _loc2_ = 0;
      while(_loc2_ < continental_C_Guard.length)
      {
         container_mc.map[continental_C_Guard[_loc2_]].SLOT._visible = bTrue;
         _loc2_ = _loc2_ + 1;
      }
   }
}
function setVisibleContinental(bTrue, continental)
{
   container_mc.map["continental_" + continental]._visible = bTrue;
}
function setVisibleGuard(bTrue, continental, bShowDetailInfo)
{
   if(continental == undefined)
   {
      var _loc3_ = 0;
      while(_loc3_ < continental_A_Guard.length)
      {
         container_mc.map[continental_A_Guard[_loc3_]]._visible = bTrue;
         container_mc.map[continental_A_Guard[_loc3_]].method_mc._visible = bShowDetailInfo;
         _loc3_ = _loc3_ + 1;
      }
      _loc3_ = 0;
      while(_loc3_ < continental_B_Guard.length)
      {
         container_mc.map[continental_B_Guard[_loc3_]]._visible = bTrue;
         container_mc.map[continental_B_Guard[_loc3_]].method_mc._visible = bShowDetailInfo;
         _loc3_ = _loc3_ + 1;
      }
      _loc3_ = 0;
      while(_loc3_ < continental_C_Guard.length)
      {
         container_mc.map[continental_C_Guard[_loc3_]]._visible = bTrue;
         container_mc.map[continental_C_Guard[_loc3_]].method_mc._visible = bShowDetailInfo;
         _loc3_ = _loc3_ + 1;
      }
   }
   else if(continental == "A")
   {
      _loc3_ = 0;
      while(_loc3_ < continental_A_Guard.length)
      {
         container_mc.map[continental_A_Guard[_loc3_]]._visible = bTrue;
         container_mc.map[continental_A_Guard[_loc3_]].method_mc._visible = bShowDetailInfo;
         _loc3_ = _loc3_ + 1;
      }
   }
   else if(continental == "B")
   {
      _loc3_ = 0;
      while(_loc3_ < continental_B_Guard.length)
      {
         container_mc.map[continental_B_Guard[_loc3_]]._visible = bTrue;
         container_mc.map[continental_B_Guard[_loc3_]].method_mc._visible = bShowDetailInfo;
         _loc3_ = _loc3_ + 1;
      }
   }
   else if(continental == "C")
   {
      _loc3_ = 0;
      while(_loc3_ < continental_C_Guard.length)
      {
         container_mc.map[continental_C_Guard[_loc3_]]._visible = bTrue;
         container_mc.map[continental_C_Guard[_loc3_]].method_mc._visible = bShowDetailInfo;
         _loc3_ = _loc3_ + 1;
      }
   }
}
function ToGame_SenatorMap_SelectContinental(Name)
{
   getURL("FSCommand:ToGame_SenatorMap_SelectContinental",Name);
}
function ToGame_SenatorMap_SelectGuard(Name)
{
   getURL("FSCommand:ToGame_SenatorMap_SelectGuard",Name);
}
function ToGame_SenatorMap_REG_ClickInitBtn()
{
   fscommand("ToGame_SenatorMap_REG_ClickInitBtn");
}
function ToGame_SenatorMap_REG_ClickRegBtn(Str)
{
   getURL("FSCommand:ToGame_SenatorMap_REG_ClickRegBtn",Str);
}
function ToGame_SenatorMap_REG_ClickElectMethod(electMethod)
{
   getURL("FSCommand:ToGame_SenatorMap_REG_ClickElectMethod",electMethod);
}
function onMotionFinished(continental, x, y)
{
   switch(continental)
   {
      case "A":
         container_mc.condition.info_mc.corner_mc.gotoAndStop(1);
         container_mc.condition.info_mc.text_name.setText(lib.util.UIString.getUIString("$241012"));
         break;
      case "B":
         container_mc.condition.info_mc.corner_mc.gotoAndStop(2);
         container_mc.condition.info_mc.text_name.setText(lib.util.UIString.getUIString("$241011"));
         break;
      case "C":
         container_mc.condition.info_mc.corner_mc.gotoAndStop(3);
         container_mc.condition.info_mc.text_name.setText(lib.util.UIString.getUIString("$241010"));
         break;
      case "D":
         container_mc.condition.info_mc.corner_mc.gotoAndStop(4);
         container_mc.condition.info_mc.text_name.setText(lib.util.UIString.getUIString("$241012"));
         break;
      default:
         container_mc.condition.info_mc.corner_mc.gotoAndStop(1);
   }
   container_mc.condition.info_mc.rankMc1.name_txt1.setText(container_mc.condition.info_mc.info1.name);
   container_mc.condition.info_mc.rankMc1.guild_txt1.setText("[ " + container_mc.condition.info_mc.info1.guildName + " ]");
   if(container_mc.condition.info_mc.info1.guildName == "")
   {
      container_mc.condition.info_mc.rankMc1.guild_txt1.setText("");
   }
   lib.util.DrawBitmap.draw(container_mc.condition.info_mc.rankMc1.Icon1,container_mc.condition.info_mc.info1.icon,50,50);
   container_mc.condition.info_mc.rankMc2.name_txt2.setText(container_mc.condition.info_mc.info2.name);
   container_mc.condition.info_mc.rankMc2.guild_txt2.setText("[ " + container_mc.condition.info_mc.info2.guildName + " ]");
   if(container_mc.condition.info_mc.info2.guildName == "")
   {
      container_mc.condition.info_mc.rankMc2.guild_txt2.setText("");
   }
   lib.util.DrawBitmap.draw(container_mc.condition.info_mc.rankMc2.Icon2,container_mc.condition.info_mc.info2.icon,50,50);
   container_mc.condition.info_mc._x = x;
   container_mc.condition.info_mc._y = y;
   gs.TweenLite.killTweensOf(container_mc.condition.info_mc,false);
   gs.TweenLite.to(container_mc.condition.info_mc,0.4,{_alpha:100,_y:y - 30,ease:Regular.easeOut});
}
function release(num, noRequestEvent)
{
   if(num == 0)
   {
      container_mc.condition.tab1_txt.text = lib.util.UIString.getUIString("$361005");
      container_mc.condition.list_mc._visible = true;
      container_mc.condition.scrollbar._visible = true;
      container_mc.condition.list2_mc._visible = false;
      container_mc.condition.scrollbar2._visible = false;
   }
   else if(num == 1)
   {
      container_mc.condition.tab1_txt.text = lib.util.UIString.getUIString("$361009");
      container_mc.condition.list_mc._visible = false;
      container_mc.condition.scrollbar._visible = false;
      container_mc.condition.list2_mc._visible = true;
      container_mc.condition.scrollbar2._visible = true;
   }
   if(noRequestEvent != 1)
   {
      ToGame_SenatorMap_CON_SelectTab(tab.activedNum);
   }
}
function ToGame_SenatorMap_CON_ShowPledge(lineId)
{
   getURL("FSCommand:ToGame_SenatorMap_CON_ShowPledge",lineId);
}
function ToGame_SenatorMap_CON_SelectTab(tabNum)
{
   getURL("FSCommand:ToGame_SenatorMap_CON_SelectTab",tabNum);
}
function ToGame_SenatorMap_VOTE_ClickVote(candidateId)
{
   getURL("FSCommand:ToGame_SenatorMap_VOTE_ClickVote",candidateId);
}
function ToGame_SenatorMap_VOTE_ShowPledge(id)
{
   getURL("FSCommand:ToGame_SenatorMap_VOTE_ShowPledge",id);
}
function alignPoliticalLog()
{
   var _loc4_ = container_mc.info.policalLog_mc.containerMc;
   var _loc5_ = 0;
   var _loc2_ = 0;
   while(_loc4_["parentMc" + _loc2_] != undefined)
   {
      var _loc1_ = _loc4_["parentMc" + _loc2_];
      _loc1_._y = _loc5_;
      _loc1_.containerMc._visible = _loc1_.isOpen;
      _loc1_.open_btn.gotoAndStop(Number(_loc1_.isOpen) + 1);
      var _loc3_ = 61;
      if(_loc1_.isOpen)
      {
         _loc3_ = _loc3_ + _loc1_.containerMc._height;
      }
      _loc1_.bgMc._height = _loc3_;
      _loc5_ = _loc5_ + _loc3_;
      _loc2_ = _loc2_ + 1;
   }
   container_mc.info.scrollbar3.pageSize = _loc4_._y + _loc5_;
}
function ToGame_SenatorMap_INFO_SelectTab(tabNum)
{
   getURL("FSCommand:ToGame_SenatorMap_INFO_SelectTab",tabNum);
}
function ToGame_SenatorMap_INFO_SaveGreetings(str)
{
   getURL("FSCommand:ToGame_SenatorMap_INFO_SaveGreetings",str);
}
function ToGame_SenatorMap_INFO_SaveGreetings(str)
{
   getURL("FSCommand:ToGame_SenatorMap_INFO_SaveGreetings",str);
}
function ToGame_SenatorMap_INFO_ClickShowCONMode()
{
   fscommand("ToGame_SenatorMap_INFO_ClickShowCONMode");
}
function release2(num, noRequestEvent)
{
   if(num == 0)
   {
      if(container_mc.info.base_mc.txt_0.text != "")
      {
         container_mc.info.base_mc._visible = true;
      }
      container_mc.info.policy_mc._visible = false;
      container_mc.info.policalLog_mc._visible = false;
      scrollbar_baseInfo._visible = true;
      scrollbar_policyInfo._visible = false;
      container_mc.info.scrollbar3._visible = false;
      container_mc.info.policy_mc_defaultStr._visible = false;
      container_mc.info.base_mc_defaultStr._visible = !container_mc.info.base_mc._visible;
   }
   else if(num == 1)
   {
      container_mc.info.base_mc._visible = false;
      container_mc.info.policalLog_mc._visible = false;
      scrollbar_baseInfo._visible = false;
      scrollbar_policyInfo._visible = true;
      container_mc.info.scrollbar3._visible = false;
      container_mc.info.base_mc_defaultStr._visible = false;
      if(taxDataList.getLength() >= 1 || policyDataList.getLength() >= 1)
      {
         container_mc.info.policy_mc_defaultStr._visible = false;
         container_mc.info.policy_mc._visible = true;
      }
      else
      {
         container_mc.info.policy_mc_defaultStr._visible = true;
         container_mc.info.policy_mc._visible = false;
      }
   }
   else if(num == 2)
   {
      container_mc.info.base_mc._visible = false;
      container_mc.info.policy_mc._visible = false;
      container_mc.info.policalLog_mc._visible = true;
      scrollbar_baseInfo._visible = false;
      scrollbar_policyInfo._visible = false;
      container_mc.info.scrollbar3._visible = true;
      container_mc.info.policy_mc_defaultStr._visible = false;
      container_mc.info.base_mc_defaultStr._visible = false;
   }
   if(noRequestEvent != 1)
   {
      ToGame_SenatorMap_INFO_SelectTab(tab2.activedNum);
   }
}
function ToGame_SenatorMap_CloseUI()
{
   fscommand("ToGame_SenatorMap_CloseUI");
   trace("ToGame_SenatorMap_CloseUI");
}
function setElectMethodBtn()
{
   container_mc.registration.selectMethod_mc.hitTestDisable = false;
   container_mc.registration.selectMethod_mc.method_Vote_mc.onRollOver = function()
   {
      lib.util.FrameSeeker.seek(this,1,this._totalframes);
      container_mc.registration.selectMethod_mc.method_Vote_txt.textColor = 16777215;
   };
   container_mc.registration.selectMethod_mc.method_Vote_mc.onRollOut = container_mc.registration.selectMethod_mc.method_Vote_mc.onReleaseOutside = function()
   {
      lib.util.FrameSeeker.seek(this,this._totalframes,1);
      container_mc.registration.selectMethod_mc.method_Vote_txt.textColor = 15719737;
   };
   container_mc.registration.selectMethod_mc.method_Vote_mc.onRelease = function()
   {
      lib.manager.UISound.play(lib.manager.UISound.MAIN_BTN);
      ToGame_SenatorMap_REG_ClickElectMethod(2);
   };
   container_mc.registration.selectMethod_mc.method_Battle_mc.onRollOver = function()
   {
      lib.util.FrameSeeker.seek(this,1,this._totalframes);
      container_mc.registration.selectMethod_mc.method_Battle_txt.textColor = 16777215;
   };
   container_mc.registration.selectMethod_mc.method_Battle_mc.onRollOut = container_mc.registration.selectMethod_mc.method_Battle_mc.onReleaseOutside = function()
   {
      lib.util.FrameSeeker.seek(this,this._totalframes,1);
      container_mc.registration.selectMethod_mc.method_Battle_txt.textColor = 15719737;
   };
   container_mc.registration.selectMethod_mc.method_Battle_mc.onRelease = function()
   {
      lib.manager.UISound.play(lib.manager.UISound.MAIN_BTN);
      ToGame_SenatorMap_REG_ClickElectMethod(1);
   };
}
if(sBFEnable == "0")
{
   container_mc.condition.tabBtn.labels = ["$361002"];
   container_mc.condition.info_mc.txt1._visible = false;
}
var tab = container_mc.condition.tabBtn.tab;
container_mc.condition.scrollbar2._visible = false;
tab.setRelease(release);
tab.setTab(0,1);
container_mc.vote.paragraph_txt0.textColor = lib.info.TextColor.GENERAL_PARAGRAPH;
container_mc.vote.paragraph_txt1.textColor = lib.info.TextColor.GENERAL_PARAGRAPH;
container_mc.vote.paragraph_txt2.textColor = lib.info.TextColor.GENERAL_PARAGRAPH;
container_mc.vote.desc_0.textColor = lib.info.TextColor.GENERAL_CONTENTS;
container_mc.vote.desc_1.textColor = lib.info.TextColor.GENERAL_CONTENTS;
container_mc.vote.step_txt.textColor = lib.info.TextColor.GENERAL_CONTENTS;
container_mc.vote.introduce_txt.textColor = lib.info.TextColor.GENERAL_NOTICE;
container_mc.vote.introduce_txt.htmlText = "<img src=\'icon_notice\' vspace=\'-1\'> " + lib.util.UIString.getUIString("$371013");
container_mc.vote.scrollbar.pageSize = 0;
var scrollBar3 = container_mc.vote.scrollbar3;
var listObj3 = {};
scrollBar3.addListener(listObj3);
var votelistY = container_mc.vote.list_mc._y;
listObj3.onScroll = function()
{
   container_mc.vote.list_mc._y = votelistY - arguments[0];
};
scrollBar3.setWheel(container_mc.vote.list_mc);
scrollBar3.wheelDelta = 1;
scrollBar3.pageSize = 0;
scrollBar3.displaySize = container_mc.vote.mask_mc._height;
scrollBar3.rowHeight = 35;
scrollBar3.scroll = 0;
myListener.OnGame_SenatorMap_VOTE_DisableContinental = function(continental, bTrue)
{
   bTrue = Number(bTrue);
   if(isNaN(bTrue))
   {
      bTrue = 1;
   }
   setDisableContinental(continental,bTrue);
};
myListener.OnGame_SenatorMap_VOTE_SelectContinental = function(continental)
{
   selectContinental(continental,undefined,1);
};
var candidateList = new lib.util.List(container_mc.vote.list_mc,"line",0);
candidateList.bg = "bg_mc";
var checkedStat = null;
myListener.OnGame_SenatorMap_VOTE_SetCandidateData = function(dataList)
{
   candidateList.clear();
   checkedStat = null;
   vote_btn.setVisible(true);
   container_mc.vote.votedComplete._visible = false;
   container_mc.vote.defaultStr._visible = false;
   var _loc7_ = dataList.split("\n");
   if(_loc7_[_loc7_.length - 1] == "0" || _loc7_[_loc7_.length - 1] == "undefined" || _loc7_[_loc7_.length - 1] == undefined || _loc7_[_loc7_.length - 1] == "")
   {
      _loc7_.pop();
   }
   var _loc5_ = 0;
   while(_loc5_ < _loc7_.length)
   {
      var _loc3_ = _loc7_[_loc5_].split("\t");
      if(_loc3_.length != 1)
      {
         var _loc2_ = candidateList.add(_loc3_[0],"line2");
         _loc2_.hit_mc._visible = false;
         var _loc9_ = _loc3_[1];
         var _loc6_ = _loc3_[2];
         var _loc12_ = _loc3_[3];
         var _loc8_ = _loc3_[4];
         var _loc10_ = lib.util.UIString.getUIString("$371025") + " " + "<font color=\'#" + lib.info.TextColor.GENERAL_EMPHASIS.toString(16) + "\'>" + _loc3_[5] + "</font>";
         var _loc11_ = lib.util.UIString.getUIString("$371026") + " " + "<font color=\'#" + lib.info.TextColor.GENERAL_EMPHASIS.toString(16) + "\'>" + _loc3_[6] + "</font>";
         _loc2_.txt0.textColor = lib.info.TextColor.GENERAL_CONTENTS;
         _loc2_.txt1.textColor = lib.info.TextColor.GENERAL_CONTENTS;
         _loc2_.txt2.textColor = lib.info.TextColor.GENERAL_CONTENTS;
         _loc2_.txt3.textColor = lib.info.TextColor.GENERAL_CONTENTS;
         _loc2_.txt4.textColor = lib.info.TextColor.GENERAL_CONTENTS;
         _loc2_.txt3.textAutoSize = "shrink";
         _loc2_.stat = _loc5_;
         _loc2_.txt0.setText(_loc9_);
         _loc2_.txt1.setText(_loc12_);
         _loc2_.txt2.setText(_loc8_);
         _loc2_.txt3.setText(_loc10_);
         _loc2_.txt4.setText(_loc11_);
         if(_loc6_ != "" && _loc6_ != "img://")
         {
            lib.util.DrawBitmap.draw(_loc2_.Icon,_loc6_,50,50);
         }
         if(_loc3_[7] != undefined && _loc3_[7] != "")
         {
            var _loc4_ = _loc2_.attachMovie("politicalrank","rankIcon",_loc2_.getNextHighestDepth());
            _loc4_._x = _loc2_.Icon._x + 25;
            _loc4_._y = _loc2_.Icon._y + 50 - _loc4_._height;
            _loc4_.rank = Number(_loc3_[7]);
            _loc4_.onEnterFrame = function()
            {
               this.gotoAndStop(this.rank);
               delete this.onEnterFrame;
            };
            lib.manager.ToolTip.add(_loc4_,_loc3_[8],1);
         }
         _loc2_.vote_btn.onEnterFrame = function()
         {
            var id = this._parent.id;
            if(this.txtBtn != undefined)
            {
               this.txtBtn.setRelease(function()
               {
                  ToGame_SenatorMap_VOTE_ClickVote(id);
               }
               );
               delete this.onEnterFrame;
            }
         };
         _loc2_.pledge_btn.onEnterFrame = function()
         {
            var id = this._parent.id;
            if(this.txtBtn != undefined)
            {
               this.txtBtn.setRelease(function()
               {
                  ToGame_SenatorMap_VOTE_ShowPledge(id);
               }
               );
               delete this.onEnterFrame;
            }
         };
      }
      _loc5_ = _loc5_ + 1;
   }
   scrollBar3.pageSize = container_mc.vote.list_mc._height;
};
myListener.OnGame_SenatorMap_VOTE_UpdateCandidateData = function(candidateId, wantUpdateType, newData)
{
   var _loc1_ = candidateList.getLine(candidateId);
   if(_loc1_ != null)
   {
      switch(wantUpdateType)
      {
         case "IMG_GUILD_CREST":
            if(newData != "" && newData != "img://")
            {
               lib.util.DrawBitmap.draw(_loc1_.Icon,newData,50,50);
            }
            break;
         case "NUM_GUILD_RECOMMEND":
            var _loc3_ = lib.util.UIString.getUIString("$371025") + " " + "<font color=\'#" + lib.info.TextColor.GENERAL_EMPHASIS.toString(16) + "\'>" + newData + "</font>";
            _loc1_.txt3.setText(_loc3_);
      }
   }
};
myListener.OnGame_SenatorMap_VOTE_SetVotedSuccessfully = function()
{
   var _loc1_ = 0;
   while(_loc1_ < candidateList.length)
   {
      candidateList.list[_loc1_].vote_btn.txtBtn.setEnabled(false);
      _loc1_ = _loc1_ + 1;
   }
};
myListener.OnGame_SenatorMap_VOTE_SetVotedContinental = function(continental, currentRank, guild, name)
{
   var _loc2_ = container_mc.vote[continental];
   _loc2_._visible = true;
   _loc2_.rank_txt.textColor = lib.info.TextColor.LIST_SENATORMAP_VOTE_MYVOTE_RANK;
   _loc2_.guild_txt.textColor = lib.info.TextColor.LIST_SENATORMAP_VOTE_MYVOTE_GUILD;
   _loc2_.name_txt.textColor = lib.info.TextColor.LIST_SENATORMAP_VOTE_MYVOTE_NAME;
   var _loc3_ = "";
   if(continental == "A")
   {
      _loc3_ = lib.util.UIString.getUIString("$241012");
      var _loc1_ = 0;
      while(_loc1_ < continental_A_Guard.length)
      {
         container_mc.map.worldText[continental_A_Guard[_loc1_]]._visible = false;
         _loc1_ = _loc1_ + 1;
      }
   }
   else if(continental == "B")
   {
      _loc3_ = lib.util.UIString.getUIString("$241011");
      _loc1_ = 0;
      while(_loc1_ < continental_B_Guard.length)
      {
         container_mc.map.worldText[continental_B_Guard[_loc1_]]._visible = false;
         _loc1_ = _loc1_ + 1;
      }
   }
   else if(continental == "C")
   {
      _loc3_ = lib.util.UIString.getUIString("$241010");
      _loc1_ = 0;
      while(_loc1_ < continental_C_Guard.length)
      {
         container_mc.map.worldText[continental_C_Guard[_loc1_]]._visible = false;
         _loc1_ = _loc1_ + 1;
      }
   }
   _loc2_.continental_txt.setText(_loc3_);
   lib.manager.ToolTip.add(_loc2_.voted,lib.util.UIString.getUIString("$371019"),1);
   _loc2_.rank_txt.setText(lib.util.UIString.getUIString("$371020") + " " + currentRank);
   _loc2_.guild_txt.setText("[ " + guild + " ]");
   _loc2_.name_txt.setText(name);
   myListener.OnGame_SenatorMap_VOTE_DisableContinental(continental,1);
};
myListener.OnGame_SenatorMap_VOTE_SetGiftData = function(dataList)
{
   var _loc5_ = dataList.split("\n");
   if(_loc5_[_loc5_.length - 1] == "0" || _loc5_[_loc5_.length - 1] == "undefined" || _loc5_[_loc5_.length - 1] == "")
   {
      _loc5_.splice(_loc5_.length - 1,1);
   }
   var _loc4_ = 0;
   while(_loc4_ < _loc5_.length)
   {
      var _loc3_ = _loc5_[_loc4_].split("\t");
      if(_loc3_.length != 1)
      {
         var _loc2_ = container_mc.vote.gift_mc.attachMovie("Slot_link","slot" + _loc4_,container_mc.vote.gift_mc.getNextHighestDepth());
         _loc2_.stat = _loc4_;
         _loc2_.id = _loc3_[0];
         _loc2_.TEX = _loc2_.img = _loc3_[1];
         _loc2_.num = _loc3_[5];
         _loc2_.grade = _loc3_[7];
         _loc2_.sealType = _loc3_[8];
         _loc2_.masterpiece = _loc3_[9];
         _loc2_.onEnterFrame = function()
         {
            if(this.drag)
            {
               this.effect = false;
               this.drag = false;
               this.draw(this.img);
               this.hideBg();
               delete this.onEnterFrame;
            }
         };
         lib.manager.ToolTip.add(_loc2_.SLOT,_loc2_.id,6,_loc2_.Icon);
         _loc2_._x = _loc2_._width * _loc4_;
      }
      _loc4_ = _loc4_ + 1;
   }
};
myListener.OnGame_SenatorMap_VOTE_SetScheduleProgress = function(scheduleDataList)
{
   var _loc7_ = "";
   var _loc4_ = scheduleDataList.split("\n");
   if(_loc4_[_loc4_.length - 1] == "0" || _loc4_[_loc4_.length - 1] == "undefined" || _loc4_[_loc4_.length - 1] == undefined || _loc4_[_loc4_.length - 1] == "")
   {
      _loc4_.pop();
   }
   var _loc5_ = " ";
   var _loc1_ = 0;
   while(_loc1_ < _loc4_.length)
   {
      var _loc2_ = _loc4_[_loc1_].split("\t");
      if(_loc2_.length != 1)
      {
         var _loc6_ = Number(_loc2_[0]);
         var _loc3_ = _loc2_[1];
         if(_loc1_ != 0)
         {
            _loc5_ = _loc5_ + ("<font color=\'#" + lib.info.TextColor.GENERAL_CONTENTS.toString(16) + "\'>" + " &gt; " + "</font>");
         }
         if(_loc6_)
         {
            _loc5_ = _loc5_ + ("<font color=\'#" + lib.info.TextColor.UI_SENATORMAP_REG_STEP_CURRENT.toString(16) + "\'>" + _loc3_ + "</font>");
         }
         else
         {
            _loc5_ = _loc5_ + ("<font color=\'#" + lib.info.TextColor.UI_SENATORMAP_REG_STEP_NOTCURRENT.toString(16) + "\'>" + _loc3_ + "</font>");
         }
      }
      _loc1_ = _loc1_ + 1;
   }
   _loc7_ = _loc7_ + _loc5_;
   container_mc.vote.step_txt.htmlText = _loc7_;
};
var scrollbar_progressInfo = container_mc.info.scrollbar;
scrollbar_progressInfo.addListener(container_mc.info.progress_mc);
container_mc.info.progress_mc.onScroll = function()
{
   container_mc.info.progress_mc._y = 5 - arguments[0];
};
scrollbar_progressInfo.setWheel(container_mc.info.progress_mc);
scrollbar_progressInfo.wheelDelta = 1;
scrollbar_progressInfo.pageSize = 0;
scrollbar_progressInfo.displaySize = container_mc.info.maskMc3._height;
scrollbar_progressInfo.defaultBarSizeRatio = 0.3333333333333333;
scrollbar_progressInfo.rowHeight = 35;
scrollbar_progressInfo.scroll = 0;
var scrollbar_baseInfo = container_mc.info.scrollbar1;
scrollbar_baseInfo.addListener(container_mc.info.base_mc);
container_mc.info.base_mc.onScroll = function()
{
   container_mc.info.base_mc._y = 320.7 - arguments[0];
};
scrollbar_baseInfo.setWheel(container_mc.info.base_mc);
scrollbar_baseInfo.wheelDelta = 1;
scrollbar_baseInfo.pageSize = 0;
scrollbar_baseInfo.displaySize = container_mc.info.maskMc2._height;
scrollbar_baseInfo.defaultBarSizeRatio = 0.3333333333333333;
scrollbar_baseInfo.rowHeight = 35;
scrollbar_baseInfo.scroll = 0;
var scrollbar_policyInfo = container_mc.info.scrollbar2;
scrollbar_policyInfo.addListener(container_mc.info.policy_mc);
container_mc.info.policy_mc.onScroll = function()
{
   container_mc.info.policy_mc._y = 333.5 - arguments[0];
};
scrollbar_policyInfo.setWheel(container_mc.info.policy_mc);
scrollbar_policyInfo.wheelDelta = 1;
scrollbar_policyInfo.pageSize = 0;
scrollbar_policyInfo.displaySize = container_mc.info.maskMc._height;
scrollbar_policyInfo.defaultBarSizeRatio = 0.3333333333333333;
scrollbar_policyInfo.rowHeight = 35;
scrollbar_policyInfo.scroll = 0;
container_mc.info.progress_mc.paragraph_txt0.textColor = lib.info.TextColor.GENERAL_PARAGRAPH;
container_mc.info.progress_mc.paragraph_txt1.textColor = lib.info.TextColor.GENERAL_PARAGRAPH;
container_mc.info.base_mc.paragraph_txt0.textColor = lib.info.TextColor.GENERAL_PARAGRAPH;
container_mc.info.base_mc.paragraph_txt1.textColor = lib.info.TextColor.GENERAL_PARAGRAPH;
container_mc.info.base_mc.label_0.textColor = lib.info.TextColor.GENERAL_EXPLAIN_DETAIL;
container_mc.info.base_mc.label_1.textColor = lib.info.TextColor.GENERAL_EXPLAIN_DETAIL;
container_mc.info.base_mc.label_2.textColor = lib.info.TextColor.GENERAL_EXPLAIN_DETAIL;
container_mc.info.base_mc.label_3.textColor = lib.info.TextColor.GENERAL_EXPLAIN_DETAIL;
container_mc.info.base_mc.label_4.textColor = lib.info.TextColor.GENERAL_EXPLAIN_DETAIL;
container_mc.info.base_mc.label_5.textColor = lib.info.TextColor.GENERAL_EXPLAIN_DETAIL;
container_mc.info.base_mc.label_6.textColor = lib.info.TextColor.GENERAL_EXPLAIN_DETAIL;
container_mc.info.base_mc.txt_0.textColor = lib.info.TextColor.GENERAL_CONTENTS;
container_mc.info.base_mc.txt_1.textColor = lib.info.TextColor.GENERAL_CONTENTS;
container_mc.info.base_mc.txt_2.textColor = lib.info.TextColor.GENERAL_CONTENTS;
container_mc.info.base_mc.txt_3.textColor = lib.info.TextColor.GENERAL_EMPHASIS;
container_mc.info.base_mc.txt_4.textColor = lib.info.TextColor.GENERAL_CONTENTS;
container_mc.info.base_mc.txt_5.textColor = lib.info.TextColor.GENERAL_EMPHASIS;
container_mc.info.base_mc.txt_6.textColor = lib.info.TextColor.GENERAL_EMPHASIS;
container_mc.info.policy_mc.policyMc0.name_txt.textColor = lib.info.TextColor.GENERAL_PARAGRAPH;
container_mc.info.policy_mc.policyMc1.name_txt.textColor = lib.info.TextColor.GENERAL_PARAGRAPH;
container_mc.info.base_mc.greetings_txt.textColor = lib.info.TextColor.GENERAL_CONTENTS;
container_mc.info.introduce_txt.textColor = lib.info.TextColor.GENERAL_NOTICE;
container_mc.info.introduce_txt.htmlText = "<img src=\'icon_notice\' vspace=\'-1\'> " + lib.util.UIString.getUIString("$381025");
container_mc.info.base_mc_defaultStr.textColor = lib.info.TextColor.GENERAL_DISABLE;
container_mc.info.policy_mc_defaultStr.textColor = lib.info.TextColor.GENERAL_DISABLE;
container_mc.info.base_mc_defaultStr.verticalAlign = "center";
container_mc.info.policy_mc_defaultStr.verticalAlign = "center";
container_mc.info.base_mc_defaultStr.setText(lib.util.UIString.getUIString("$111039"));
container_mc.info.policy_mc_defaultStr.setText(lib.util.UIString.getUIString("$111039"));
myListener.OnGame_SenatorMap_INFO_SetTitle = function(str)
{
   container_mc.text_name.text = str;
};
myListener.OnGame_SenatorMap_INFO_SelectGuard = function(guardName)
{
   clearGuard(1);
   selectGuard(guardName);
   selectedGuard = guardName;
};
myListener.OnGame_SenatorMap_INFO_SetScheduleInfo = function(currentcurrentStepDataList, nextStepDataList, scheduleDataList)
{
   var _loc7_ = currentcurrentStepDataList.split("\t");
   if(_loc7_[_loc7_.length - 1] == "0" || _loc7_[_loc7_.length - 1] == "undefined" || _loc7_[_loc7_.length - 1] == "")
   {
      _loc7_.pop();
   }
   var _loc8_ = nextStepDataList.split("\t");
   if(_loc8_[_loc8_.length - 1] == "0" || _loc8_[_loc8_.length - 1] == "undefined" || _loc8_[_loc8_.length - 1] == "")
   {
      _loc8_.pop();
   }
   container_mc.info.progress_mc.senatorProgress_0.label_0.setText(lib.util.UIString.getUIString("$381016"));
   container_mc.info.progress_mc.senatorProgress_0.txt_0.setText(_loc7_[0]);
   container_mc.info.progress_mc.senatorProgress_0.txt_1.setText(_loc7_[1]);
   container_mc.info.progress_mc.senatorProgress_0.txt_2.setText(_loc7_[2]);
   container_mc.info.progress_mc.senatorProgress_0.txt_2._height = container_mc.info.progress_mc.senatorProgress_0.txt_2.textHeight + 5;
   container_mc.info.progress_mc.senatorProgress_0.bg._height = container_mc.info.progress_mc.senatorProgress_0.txt_2._y + container_mc.info.progress_mc.senatorProgress_0.txt_2._height + 12;
   container_mc.info.progress_mc.senatorProgress_1._y = container_mc.info.progress_mc.senatorProgress_0._y + container_mc.info.progress_mc.senatorProgress_0._height + 3;
   container_mc.info.progress_mc.senatorProgress_1.txt_0.setText(_loc8_[0]);
   container_mc.info.progress_mc.senatorProgress_1.txt_1.setText(_loc8_[1]);
   container_mc.info.progress_mc.senatorProgress_1.txt_2.setText(_loc8_[2]);
   container_mc.info.progress_mc.senatorProgress_1.txt_2._height = container_mc.info.progress_mc.senatorProgress_1.txt_2.textHeight + 5;
   container_mc.info.progress_mc.senatorProgress_1.bg._height = container_mc.info.progress_mc.senatorProgress_1.txt_2._y + container_mc.info.progress_mc.senatorProgress_1.txt_2._height + 12;
   container_mc.info.progress_mc.paragraph_mc1._y = container_mc.info.progress_mc.senatorProgress_1._y + container_mc.info.progress_mc.senatorProgress_1._height + 2;
   container_mc.info.progress_mc.paragraph_txt1._y = container_mc.info.progress_mc.paragraph_mc1._y + 7;
   container_mc.info.progress_mc.step_txt._y = container_mc.info.progress_mc.paragraph_mc1._y + 41.6;
   var _loc9_ = "";
   if(scheduleDataList != undefined)
   {
      _loc9_ = _loc9_ + "\n";
      _loc9_ = _loc9_ + ("<font color=\'#" + lib.info.TextColor.GENERAL_PARAGRAPH.toString(16) + "\'>" + lib.util.UIString.getUIString("$351023") + "</font>");
      _loc9_ = _loc9_ + "\n";
   }
   var _loc4_ = scheduleDataList.split("\n");
   if(_loc4_[_loc4_.length - 1] == "0" || _loc4_[_loc4_.length - 1] == "undefined" || _loc4_[_loc4_.length - 1] == undefined || _loc4_[_loc4_.length - 1] == "")
   {
      _loc4_.pop();
   }
   var _loc5_ = " ";
   var _loc1_ = 0;
   while(_loc1_ < _loc4_.length)
   {
      var _loc2_ = _loc4_[_loc1_].split("\t");
      if(_loc2_.length != 1)
      {
         var _loc6_ = Number(_loc2_[0]);
         var _loc3_ = _loc2_[1];
         if(_loc1_ != 0)
         {
            _loc5_ = _loc5_ + ("<font color=\'#" + lib.info.TextColor.GENERAL_CONTENTS.toString(16) + "\'>" + " &gt; " + "</font>");
         }
         if(_loc6_)
         {
            _loc5_ = _loc5_ + ("<font color=\'#" + lib.info.TextColor.UI_SENATORMAP_REG_STEP_CURRENT.toString(16) + "\'>" + _loc3_ + "</font>");
         }
         else
         {
            _loc5_ = _loc5_ + ("<font color=\'#" + lib.info.TextColor.UI_SENATORMAP_REG_STEP_NOTCURRENT.toString(16) + "\'>" + _loc3_ + "</font>");
         }
      }
      _loc1_ = _loc1_ + 1;
   }
   container_mc.info.progress_mc.step_txt.htmlText = _loc5_;
   container_mc.info.progress_mc.step_txt._height = container_mc.info.progress_mc.step_txt.textHeight + 20;
   scrollbar_progressInfo.pageSize = container_mc.info.progress_mc._height;
};
var textHeightAdjust = 5;
var textFieldGap = 6.5;
var baseInfoY = container_mc.info.base_mc.txt_0._y;
myListener.OnGame_SenatorMap_INFO_SetBaseInfo = function(senatorName, guildName, electionMethod, villages, fields, tearm, popularity, greetings, guildCrestImg, guardName)
{
   lib.util.DrawBitmap.draw(container_mc.info.base_mc.Icon,guildCrestImg,64,64);
   container_mc.info.base_mc.Icon._visible = true;
   container_mc.info.base_mc.Icon_bg._visible = true;
   var _loc3_ = lib.util.ExtString.split(villages,"\n");
   var _loc4_ = lib.util.ExtString.split(fields,"\n");
   container_mc.info.base_mc.txt_0.text = senatorName;
   container_mc.info.base_mc.txt_0._height = container_mc.info.base_mc.txt_0.textHeight + textHeightAdjust;
   baseInfoY = container_mc.info.base_mc.txt_0._y + container_mc.info.base_mc.txt_0._height + textFieldGap;
   container_mc.info.base_mc.label_1._y = baseInfoY;
   container_mc.info.base_mc.txt_1._y = baseInfoY;
   container_mc.info.base_mc.txt_1.text = guildName;
   container_mc.info.base_mc.txt_1._height = container_mc.info.base_mc.txt_1.textHeight + textHeightAdjust;
   baseInfoY = container_mc.info.base_mc.txt_1._y + container_mc.info.base_mc.txt_1._height + textFieldGap;
   container_mc.info.base_mc.label_2._y = baseInfoY;
   container_mc.info.base_mc.txt_2._y = baseInfoY;
   container_mc.info.base_mc.txt_2.text = electionMethod;
   container_mc.info.base_mc.txt_2._height = container_mc.info.base_mc.txt_2.textHeight + textHeightAdjust;
   baseInfoY = container_mc.info.base_mc.txt_2._y + container_mc.info.base_mc.txt_2._height + textFieldGap;
   container_mc.info.base_mc.label_3._y = baseInfoY;
   container_mc.info.base_mc.txt_3._y = baseInfoY;
   container_mc.info.base_mc.txt_3.text = _loc3_.join(", ");
   container_mc.info.base_mc.txt_3._height = container_mc.info.base_mc.txt_3.textHeight + textHeightAdjust;
   baseInfoY = container_mc.info.base_mc.txt_3._y + container_mc.info.base_mc.txt_3._height + textFieldGap;
   container_mc.info.base_mc.label_4._y = baseInfoY;
   container_mc.info.base_mc.txt_4._y = baseInfoY;
   container_mc.info.base_mc.txt_4.text = _loc4_.join(", ");
   container_mc.info.base_mc.txt_4._height = container_mc.info.base_mc.txt_4.textHeight + textHeightAdjust;
   baseInfoY = container_mc.info.base_mc.txt_4._y + container_mc.info.base_mc.txt_4._height + textFieldGap;
   container_mc.info.base_mc.label_5._y = baseInfoY;
   container_mc.info.base_mc.txt_5._y = baseInfoY;
   container_mc.info.base_mc.txt_5.text = tearm;
   container_mc.info.base_mc.txt_5._height = container_mc.info.base_mc.txt_5.textHeight + textHeightAdjust;
   baseInfoY = container_mc.info.base_mc.txt_5._y + container_mc.info.base_mc.txt_5._height + textFieldGap;
   container_mc.info.base_mc.label_6._y = baseInfoY;
   container_mc.info.base_mc.txt_6._y = baseInfoY;
   container_mc.info.base_mc.txt_6.text = popularity;
   container_mc.info.base_mc.txt_6._height = container_mc.info.base_mc.txt_6.textHeight + textHeightAdjust;
   baseInfoY = container_mc.info.base_mc.txt_6._y + container_mc.info.base_mc.txt_6._height + textFieldGap;
   baseInfoY = baseInfoY + 2;
   container_mc.info.base_mc.paragraph_mc1._y = baseInfoY;
   container_mc.info.base_mc.paragraph_txt1._y = baseInfoY + 6.6;
   baseInfoY = container_mc.info.base_mc.paragraph_mc1._y + container_mc.info.base_mc.paragraph_mc1._height + textFieldGap;
   container_mc.info.base_mc.greetings_txt._y = baseInfoY;
   container_mc.info.base_mc.greetings_txt.text = greetings;
   if(greetings != undefined && greetings != "")
   {
      container_mc.info.base_mc.greetings_txt._height = container_mc.info.base_mc.greetings_txt.textHeight + textHeightAdjust;
   }
   baseInfoY = container_mc.info.base_mc.greetings_txt._y + container_mc.info.base_mc.greetings_txt._height;
   container_mc.info.base_mc.bg._height = baseInfoY;
   scrollbar_baseInfo.pageSize = container_mc.info.base_mc._height;
   if(senatorName != "" && senatorName != undefined)
   {
      container_mc.info.base_mc_defaultStr._visible = false;
      if(tab2.activedNum == 0)
      {
         container_mc.info.base_mc._visible = true;
      }
   }
   else
   {
      container_mc.info.base_mc.txt_0.text = "";
      if(tab2.activedNum == 0)
      {
         container_mc.info.base_mc_defaultStr._visible = true;
      }
      container_mc.info.base_mc._visible = false;
      scrollbar_baseInfo.pageSize = 0;
   }
};
myListener.OnGame_SenatorMap_INFO_SetBaseText = function(guideText, greetingText)
{
   if(guideText != undefined)
   {
      myListener.OnGame_SenatorMap_INFO_SetBaseInfo("");
      container_mc.info.base_mc_defaultStr.setText(guideText);
      if(tab2.activedNum == 0)
      {
         container_mc.info.base_mc_defaultStr._visible = true;
      }
      container_mc.info.base_mc._visible = false;
      scrollbar_baseInfo.pageSize = 0;
   }
};
var taxDataList = new lib.util.List(container_mc.info.policy_mc.policyMc0.list_mc,"line",0);
var policyDataList = new lib.util.List(container_mc.info.policy_mc.policyMc1.list_mc,"line",0);
myListener.OnGame_SenatorMap_INFO_SetPolicyInfo = function(dataList1, dataList2)
{
   taxDataList.clear();
   policyDataList.clear();
   var _loc5_ = dataList1.split("\n");
   if(_loc5_[_loc5_.length - 1] == "0" || _loc5_[_loc5_.length - 1] == "undefined" || _loc5_[_loc5_.length - 1] == "")
   {
      _loc5_.pop();
   }
   var _loc3_ = 0;
   while(_loc3_ < _loc5_.length)
   {
      var _loc4_ = _loc5_[_loc3_].split("\t");
      if(_loc4_.length != 1)
      {
         var _loc2_ = taxDataList.add(_loc3_,"policyInfo_line");
         _loc2_.stat = _loc3_;
         _loc2_.txt0.setText(_loc4_[0]);
         _loc2_.txt1.setText(_loc4_[1]);
         _loc2_.txt0.textColor = lib.info.TextColor.GENERAL_EXPLAIN_DETAIL;
         _loc2_.txt1.textColor = lib.info.TextColor.GENERAL_CONTENTS;
         if(_loc4_[2] != "")
         {
            lib.manager.ToolTip.add(_loc2_.hit_mc,_loc4_[2],1);
         }
         _loc2_.hit_mc.stat = _loc3_;
         _loc2_.hit_mc.onRollOver = function()
         {
            this._parent.effect_mc.gotoAndStop("over");
         };
         _loc2_.hit_mc.onRollOut = _loc2_.hit_mc.onReleaseOutside = function()
         {
            this._parent.effect_mc.gotoAndStop("out");
         };
      }
      _loc3_ = _loc3_ + 1;
   }
   var _loc6_ = dataList2.split("\n");
   if(_loc6_[_loc6_.length - 1] == "0" || _loc6_[_loc6_.length - 1] == "undefined" || _loc6_[_loc6_.length - 1] == "")
   {
      _loc6_.pop();
   }
   _loc3_ = 0;
   while(_loc3_ < _loc6_.length)
   {
      _loc4_ = _loc6_[_loc3_].split("\t");
      if(_loc4_.length != 1)
      {
         _loc2_ = policyDataList.add(_loc3_,"policyInfo_line");
         _loc2_.stat = _loc3_;
         _loc2_.txt0.setText(_loc4_[0]);
         _loc2_.txt1.setText(_loc4_[1]);
         _loc2_.txt0.textColor = lib.info.TextColor.GENERAL_EXPLAIN_DETAIL;
         _loc2_.txt1.textColor = lib.info.TextColor.GENERAL_EMPHASIS;
         if(_loc4_[2] != "")
         {
            lib.manager.ToolTip.add(_loc2_.hit_mc,_loc4_[2],1);
         }
         _loc2_.hit_mc.stat = _loc3_;
         _loc2_.hit_mc.onRollOver = function()
         {
            this._parent.effect_mc.gotoAndStop("over");
         };
         _loc2_.hit_mc.onRollOut = _loc2_.hit_mc.onReleaseOutside = function()
         {
            this._parent.effect_mc.gotoAndStop("out");
         };
      }
      _loc3_ = _loc3_ + 1;
   }
   container_mc.info.policy_mc.policyMc1._y = container_mc.info.policy_mc.policyMc0._y + container_mc.info.policy_mc.policyMc0._height;
   scrollbar_policyInfo.pageSize = container_mc.info.policy_mc._height;
   if(taxDataList.getLength() >= 1 || policyDataList.getLength() >= 1)
   {
      container_mc.info.policy_mc_defaultStr._visible = false;
      if(tab2.activedNum == 1)
      {
         container_mc.info.policy_mc._visible = true;
      }
   }
   else
   {
      container_mc.info.policy_mc._visible = false;
      if(tab2.activedNum == 1)
      {
         container_mc.info.policy_mc_defaultStr._visible = true;
      }
   }
};
myListener.OnGame_SenatorMap_INFO_SetEnableShowCONBtn = function(bEnable)
{
   showCon_btn.setEnabled(bEnable);
};
myListener.OnGame_SenatorMap_LengthLocal = function(lengthnum)
{
   lib.Debuger.trace("OnGame_lengthnum_LengthLocal : " + lengthnum);
   NameTextLength_Local = lengthnum;
};
myListener.OnGame_SenatorMap_PoliticalRank = function(dataList)
{
   container_mc.info.tabBtn.labels = ["$381002","$381003","$381026"];
   tab2 = container_mc.info.tabBtn.tab;
   tab2.setRelease(release2);
   tab2.setTab(0,1);
   var _loc5_ = dataList.split("\n");
   i = 0;
   while(i < _loc5_.length)
   {
      var _loc4_ = lib.util.ExtString.split(_loc5_[i],"\t");
      var _loc3_ = container_mc.map.worldText[_loc4_[0]];
      if(_loc3_ != undefined)
      {
         var _loc2_ = container_mc.map.worldText["rank" + _loc4_[0]];
         if(_loc2_ != undefined)
         {
            _loc2_.removeMovieClip();
         }
         _loc2_ = container_mc.map.worldText.attachMovie("politicalrank","rank" + _loc4_[0],container_mc.map.worldText.getNextHighestDepth());
         _loc2_._x = _loc3_._x + _loc3_._width / 2;
         _loc2_._y = _loc3_._y - _loc2_._height;
         _loc2_.rank = Number(_loc4_[1]);
         _loc2_.onEnterFrame = function()
         {
            this.gotoAndStop(this.rank);
            delete this.onEnterFrame;
         };
      }
      i++;
   }
};
myListener.OnGame_SenatorMap_PoliticalTopRank = function(areaTypeName, gardName, guildName, gilidIcon)
{
   if(guildName != undefined && guildName != "")
   {
      container_mc.politicalTopRankMc._visible = true;
   }
   else
   {
      container_mc.politicalTopRankMc._visible = false;
   }
   var _loc1_ = undefined;
   if(areaTypeName == "A")
   {
      _loc1_ = lib.util.UIString.getUIString("$241012");
      container_mc.politicalTopRankMc._y = 96.5;
   }
   else if(areaTypeName == "B")
   {
      _loc1_ = lib.util.UIString.getUIString("$241011");
      container_mc.politicalTopRankMc._y = 96.5;
   }
   else if(areaTypeName == "C")
   {
      _loc1_ = lib.util.UIString.getUIString("$241010");
      container_mc.politicalTopRankMc._y = 435;
   }
   container_mc.politicalTopRankMc.txt0.text = _loc1_;
   container_mc.politicalTopRankMc.txt1.text = gardName;
   container_mc.politicalTopRankMc.txt2.text = "[" + guildName + "]";
   lib.util.DrawBitmap.draw(container_mc.politicalTopRankMc.crest_mc.Icon,gilidIcon,50,50);
};
container_mc.politicalTopRankMc._visible = false;
myListener.OnGame_SenatorMap_PoliticalLog = function(rank, level, logData)
{
   var _loc6_ = container_mc.info.policalLog_mc;
   for(var _loc8_ in _loc6_.containerMc)
   {
      if(typeof _loc6_.containerMc[_loc8_] == "movieclip")
      {
         _loc6_.containerMc[_loc8_].removeMovieClip();
      }
   }
   container_mc.info.scrollbar3.pageSize = 0;
   if(logData == undefined || logData == "")
   {
      _loc6_.barbgMc._visible = false;
      _loc6_.rankFd._visible = false;
      _loc6_.scoreFd._visible = false;
      _loc6_.rankIcon._visible = false;
      _loc6_.defaultStr._visible = true;
      return undefined;
   }
   _loc6_.rankIcon._visible = true;
   _loc6_.barbgMc._visible = true;
   _loc6_.rankFd._visible = true;
   _loc6_.scoreFd._visible = true;
   _loc6_.defaultStr._visible = false;
   _loc6_.rankFd.text = lib.util.UIString.getUIString("$221056") + " : <" + rank + ">";
   var _loc11_ = _loc6_.rankIcon;
   if(_loc11_ == undefined)
   {
      _loc11_ = _loc6_.attachMovie("politicalrank","rankIcon",_loc6_.getNextHighestDepth());
   }
   _loc11_.level = Number(level);
   _loc11_._x = _loc6_.rankFd._x + _loc6_.rankFd.textWidth + 5;
   _loc11_._y = _loc6_.rankFd._y;
   _loc11_.gotoAndStop(_loc11_.level);
   _loc11_.onEnterFrame = function()
   {
      this.gotoAndStop(this.level);
      this._x = this._x + this._width / 2;
      delete this.onEnterFrame;
   };
   if(rank == undefined || rank == "")
   {
      _loc6_.rankIcon._visible = false;
      _loc6_.rankFd._visible = false;
   }
   var _loc12_ = 0;
   var _loc10_ = lib.util.ExtString.split(logData,"\n");
   _loc8_ = 0;
   while(_loc8_ < _loc10_.length)
   {
      var _loc5_ = lib.util.ExtString.split(_loc10_[_loc8_],"\t");
      var _loc4_ = _loc6_.containerMc.attachMovie("politicalParent","parentMc" + _loc8_,_loc6_.containerMc.getNextHighestDepth());
      _loc4_.isOpen = false;
      _loc4_.bgMc.gotoAndStop(1);
      _loc4_._y = _loc6_.containerMc._height;
      _loc4_.titleFd.setText(_loc5_[0]);
      var _loc7_ = 0;
      var _loc9_ = 0;
      var _loc2_ = 1;
      while(_loc2_ < _loc5_.length)
      {
         var _loc3_ = _loc4_.containerMc.attachMovie("politicalSub","subMc" + _loc2_ / 2,_loc4_.containerMc.getNextHighestDepth());
         _loc3_._x = -1;
         _loc3_._y = _loc3_._height * ((_loc2_ - 1) / 3);
         _loc3_.titleFd.setText(_loc5_[_loc2_]);
         _loc3_.scoreFd.text = _loc5_[_loc2_ + 1];
         _loc9_ = _loc9_ + Number(_loc5_[_loc2_ + 1]);
         if(Number(_loc5_[_loc2_ + 2]) == "1")
         {
            _loc7_ = _loc7_ + Number(_loc5_[_loc2_ + 1]);
            _loc3_.titleFd.textColor = 14145495;
            _loc3_.scoreFd.textColor = 14145495;
         }
         else
         {
            _loc3_.titleFd.textColor = 6915227;
            _loc3_.scoreFd.textColor = 6915227;
         }
         _loc2_ = _loc2_ + 3;
      }
      _loc4_.scoreFd.text = _loc7_;
      _loc4_.barMask._xscale = Number(_loc7_) / _loc9_ * 100;
      _loc12_ = _loc12_ + _loc7_;
      _loc4_.onRelease = function()
      {
         this.isOpen = !this.isOpen;
         alignPoliticalLog();
      };
      _loc4_.onRollOver = function()
      {
         this.bgMc.gotoAndStop(2);
      };
      _loc4_.onRollOut = _loc4_.onReleaseOutside = function()
      {
         this.bgMc.gotoAndStop(1);
      };
      _loc8_ = _loc8_ + 1;
   }
   _loc6_.scoreFd.text = lib.util.UIString.getUIString("$381027") + _loc12_;
   alignPoliticalLog();
};
var listObj4 = {};
container_mc.info.scrollbar3.addListener(listObj4);
var policalLogY = container_mc.info.policalLog_mc._y;
listObj4.onScroll = function()
{
   container_mc.info.policalLog_mc._y = policalLogY - arguments[0];
};
container_mc.info.scrollbar3.setWheel(container_mc.info.policalLog_mc);
container_mc.info.scrollbar3.displaySize = container_mc.info.maskMc._height;
container_mc.info.scrollbar3.pageSize = 0;
container_mc.info.scrollbar3.rowHeight = 20;
container_mc.info.scrollbar3.scroll = 0;
var showCon_btn = container_mc.info.showConBtn.txtBtn;
showCon_btn.setRelease(ToGame_SenatorMap_INFO_ClickShowCONMode);
var tab2 = container_mc.info.tabBtn.tab;
tab2.setRelease(release2);
tab2.setTab(0,1);
var x_btn = new lib.util.TxtBtn(container_mc.x_mc);
x_btn.setRelease(function()
{
   ToGame_SenatorMap_CloseUI();
}
);
container_mc.registration.selectMethod_mc.hitTestDisable = true;
container_mc.map.worldText.hitTestDisable = true;
container_mc.condition.info_mc.guild_txt.textColor = lib.info.TextColor.LIST_SENATORMAP_CON_FIRSTRANK_GUILD;
container_mc.condition.info_mc.name_txt.textColor = lib.info.TextColor.LIST_SENATORMAP_CON_FIRSTRANK_GUILD;
container_mc.condition.info_mc._visible = false;
container_mc.condition.info_mc._alpha = 0;
container_mc.vote.votedComplete._visible = false;
container_mc.vote.A._visible = false;
container_mc.vote.B._visible = false;
container_mc.vote.C._visible = false;
fscommand("ToGame_SenatorMap_Init");
