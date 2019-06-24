function clearDetailInformation()
{
   detail_mc.slot.clear();
   detail_mc.slot._visible = false;
   detail_mc.slot_txt.text = "";
   detail_mc.slot_dragable._visible = false;
   detail_mc.needCondition_txt.text = "";
   detail_mc.guide_txt._visible = false;
   detail_mc.skillSlot.clear();
   detail_mc.skillSlot._visible = false;
   detail_mc.skillSlot_dragable._visible = false;
   detail_mc.skillSlot_txt.text = "";
   container_mc.scrollbar_detail.pageSize = 0;
}
function ToGame_SkillLearning_RequestSortData()
{
   var _loc3_ = tab.activedNum;
   var _loc1_ = undefined;
   if(container_mc.radio0_mc.checked)
   {
      _loc1_ = 0;
   }
   if(container_mc.radio1_mc.checked)
   {
      _loc1_ = 1;
   }
   if(container_mc.radio2_mc.checked)
   {
      _loc1_ = 2;
   }
   var _loc2_ = _loc3_ + "\t" + _loc1_;
   getURL("FSCommand:ToGame_SkillLearning_RequestSortData",_loc2_);
   lib.Debuger.trace("ToGame_SkillLearning_RequestSortData : " + _loc2_);
}
function ToGame_SkillLearning_CloseUI()
{
   fscommand("ToGame_SkillLearning_CloseUI");
}
function ToGame_SkillLearning_Learn(skillId)
{
   getURL("FSCommand:ToGame_SkillLearning_Learn",skillId);
}
function ToGame_SkillLearning_RequestSelectSlot(slotId)
{
   getURL("FSCommand:ToGame_SkillLearning_RequestSelectSlot",slotId);
}
function parseMessage(messageFd, _message)
{
   messageFd.text = _message;
   if(messageFd.numLines > 1)
   {
      var _loc2_ = messageFd.getLineOffset(1);
      messageFd.text = _message.slice(0,_loc2_ - 3) + "...";
   }
}
function learn()
{
   ToGame_SkillLearning_Learn(clickedSlot.uniqueId + "\t" + clickedSlot.activeState);
}
function closeUI()
{
   ToGame_SkillLearning_CloseUI();
}
function release(num)
{
   ToGame_SkillLearning_RequestSortData();
}
var UI = this;
UI._visible = false;
var UIname = "SkillLearning";
container_mc.UuniqueIdrager.setData(UIName,UI,container_mc.lock_mc);
container_mc.text_name.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
container_mc.myMoney_txt.textColor = lib.info.TextColor.GENERAL_MONEY;
container_mc.explain_0.textColor = lib.info.TextColor.INPUT_LABEL;
container_mc.calculate_btn._visible = false;
var bWidgetOpen = false;
var onePageSlotNum = 10;
var maxSlot = 0;
var clickedSlot;
var slotH;
var dataName = "SkillLearning__";
var needSkillSlotName = "SkillLearningNeedSkill__";
var needItemSlotName = "SkillLearningNeedItem__";
var LEVELSTR = lib.util.UIString.getUIString("$081012");
var tf1 = new TextFormat();
tf1.color = lib.info.TextColor.SLOT_SKILL_ACTIVE;
tf1.align = "right";
var tf2 = new TextFormat();
tf2.color = lib.info.TextColor.SLOT_SKILL_PASSIVE;
tf2.align = "right";
var detail_mc = container_mc.detail_mc.contents2_mc.content_mc;
detail_mc.needCondition_txt.textAutoSize = "shrink";
detail_mc.slot_dragable.hitTestDisable = true;
detail_mc.skillSlot_dragable.hitTestDisable = true;
detail_mc.slot_dragable.gotoAndStop(2);
detail_mc.skillSlot_dragable.gotoAndStop(2);
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
var scrollBarTarget = container_mc.contents_mc.content_mc;
var scrollBar = container_mc.scrollbar;
scrollBar.addListener(scrollBarTarget);
var list_mcY = scrollBarTarget._y;
scrollBarTarget.onScroll = function()
{
   this._y = list_mcY - arguments[0];
};
scrollBar.setWheel(scrollBarTarget);
scrollBar.wheelDelta = 1;
scrollBar.pageSize = 0;
scrollBar.displaySize = container_mc.contents_mc.mask_mc._height;
scrollBar.defaultBarSizeRatio = 0.3333333333333333;
scrollBar.rowHeight = 30;
scrollBar.scroll = 0;
container_mc.scrollbar_detail.addListener(detail_mc);
container_mc.scrollbar_detail.setWheel(detail_mc);
container_mc.scrollbar_detail.displaySize = 172;
container_mc.scrollbar_detail.rowHeight = 65.4;
container_mc.scrollbar_detail.scroll = 0;
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
   _global.gbUIMode = bShow;
   if(_global.gbUIMode && bWidgetOpen)
   {
      UI._visible = true;
   }
   else
   {
      UI._visible = false;
   }
};
var skillList = new lib.util.List(container_mc.contents_mc.content_mc,dataName);
skillList.columnCount = 2;
skillList.xGap = 3;
skillList.yGap = 3;
skillList.setUseLengthAtPrefix(true);
myListener.OnGame_SkillLearning_SetData = function(maxData, dataList)
{
   clickedSlot.active = false;
   clickedSlot = null;
   scrollBar.scroll = 0;
   clearDetailInformation();
   var _loc16_ = lib.util.ExtString.split(dataList,"\n");
   var skillData = new Array();
   var _loc4_ = 0;
   while(_loc4_ < _loc16_.length)
   {
      var _loc11_ = lib.util.ExtString.split(_loc16_[_loc4_],"\t");
      skillData.push(_loc11_);
      _loc4_ = _loc4_ + 1;
   }
   var _loc18_ = skillData.length;
   var _loc15_ = skillList.getLength();
   var _loc10_ = onePageSlotNum;
   if(_loc18_ > _loc10_)
   {
      _loc10_ = _loc18_;
   }
   if(_loc10_ % 2 != 0)
   {
      _loc10_ = _loc10_ + 1;
   }
   if(_loc15_ > _loc10_)
   {
      skillList.setRemoveAlign(false);
      _loc4_ = _loc15_;
      while(_loc10_ <= _loc4_)
      {
         skillList.remove(_loc4_);
         _loc4_ = _loc4_ - 1;
      }
      skillList.setRemoveAlign(true);
      skillList.align();
   }
   else if(_loc15_ != _loc10_)
   {
      if(_loc15_ < _loc10_)
      {
         skillList.setAddAlign(false);
         _loc4_ = _loc15_ + 1;
         while(_loc4_ <= _loc10_)
         {
            skillList.add(_loc4_ - 1,"Slot2_link");
            _loc4_ = _loc4_ + 1;
         }
         skillList.setAddAlign(true);
         skillList.align();
      }
   }
   var delay_num = 0;
   container_mc.onEnterFrame = null;
   container_mc.onEnterFrame = function()
   {
      delay_num++;
      if(delay_num > 0)
      {
         container_mc.onEnterFrame = null;
         var _loc4_ = 0;
         while(_loc4_ < skillList.getLength())
         {
            var _loc3_ = skillData[_loc4_];
            var _loc2_ = skillList.getItemAt(_loc4_);
            if(_loc3_.length > 1)
            {
               var _loc7_ = _loc3_[0];
               var _loc11_ = _loc3_[1];
               var _loc6_ = Number(_loc3_[2]);
               var _loc5_ = Number(_loc3_[3]);
               var _loc10_ = Number(_loc3_[4]);
               var _loc9_ = Number(_loc3_[5]);
               var _loc12_ = _loc3_[6];
               _loc2_.uniqueId = _loc7_;
               _loc2_.setLineNum(2);
               _loc2_.SLOT.enabled = true;
               _loc2_.Slot.SLOT.enabled = true;
               _loc2_.draw(_loc11_);
               _loc2_.drag = false;
               _loc2_.showBg();
               _loc2_.Slot.hideBg();
               lib.manager.ToolTip.add(_loc2_.SLOT,_loc7_ + "\t" + _loc5_,3,_loc2_.Slot.Icon);
               if(_loc6_ == 1 || _loc6_ == 0)
               {
                  _loc2_.Slot.num_txt._visible = false;
               }
               else
               {
                  _loc2_.Slot.num_txt.text = _loc6_;
               }
               var _loc8_ = _loc2_.down_txt.getTextFormat();
               _loc8_.align = "right";
               _loc2_.down_txt.setTextFormat(_loc8_);
               if(_loc5_ == 0)
               {
                  _loc2_.down_txt.textColor = 44783;
                  _loc2_.down_txt.text = "$081006";
               }
               else if(_loc5_ == 1)
               {
                  _loc2_.down_txt.textColor = 11363614;
                  _loc2_.down_txt.text = "$081005";
               }
               _loc2_.center_txt._visible = true;
               _loc2_.center_txt._y = _loc2_.down_txt._y;
               _loc2_.centerText = LEVELSTR + " " + _loc10_;
               _loc2_.canUse = _loc9_;
               _loc2_.upText = _loc12_;
               _loc2_.center_txt.textColor = 14145495;
               _loc2_.up_txt.textColor = 14145495;
               _loc2_.activeState = _loc5_;
               _loc2_.impossible = !_loc9_;
               _loc2_.onRelease2 = function()
               {
                  if(this != clickedSlot)
                  {
                     ToGame_SkillLearning_RequestSelectSlot(this.uniqueId + "\t" + this.activeState);
                     if(this.canUse == 1)
                     {
                        learn_btn.setEnabled(true);
                     }
                     else
                     {
                        learn_btn.setEnabled(false);
                     }
                     clickedSlot.active = false;
                     this.active = true;
                     clickedSlot = this;
                  }
               };
               if(_loc4_ == 0)
               {
                  _loc2_.Slot.onEnterFrame = function()
                  {
                     if(this.drag != undefined)
                     {
                        this._parent.onRelease2();
                        delete this.onEnterFrame;
                     }
                  };
               }
            }
            else
            {
               _loc2_.clear();
               _loc2_.drag = false;
               _loc2_.uniqueId = undefined;
               _loc2_.hideBg();
               _loc2_.SLOT.enabled = false;
               _loc2_.Slot.SLOT.enabled = false;
            }
            _loc4_ = _loc4_ + 1;
         }
      }
   };
   var _loc17_ = skillList.getItemAt(skillList.getLength() - 1);
   container_mc.contents_mc.content_mc.hit._height = _loc17_._y + _loc17_._height;
   scrollBar.pageSize = container_mc.contents_mc.content_mc._height;
};
var slectSkillId;
var slectSkillActive;
myListener.OnGame_SkillLearning_SetDetailData = function(baseDataList, needItemDataList, needSkillDataList)
{
   clearDetailInformation();
   slectSkillId = null;
   slectSkillActive = null;
   var _loc4_ = lib.util.ExtString.split(baseDataList,"\n");
   var _loc2_ = 0;
   while(_loc2_ < _loc4_.length)
   {
      var _loc6_ = lib.util.ExtString.split(_loc4_[_loc2_],"\t");
      if(_loc6_.length != 1)
      {
         var _loc1_ = detail_mc.slot;
         _loc1_._visible = true;
         detail_mc.slot_dragable._visible = true;
         _loc1_.draw(_loc6_[1]);
         _loc1_.display = true;
         _loc1_.effect = false;
         lib.manager.ToolTip.add(_loc1_.SLOT,_loc6_[0] + "\t" + _loc6_[6],3,_loc1_.Icon);
         slectSkillId = _loc6_[0];
         slectSkillActive = _loc6_[6];
         detail_mc.slot_txt.setText(_loc6_[2]);
         var _loc3_ = lib.util.GoldCurrency.SetGoldText(_loc6_[5]);
         detail_mc.needCondition_txt.htmlText = LEVELSTR + " " + _loc6_[4] + " / <font color=\'#" + lib.info.TextColor.GENERAL_MONEY.toString(16) + "\'>" + _loc3_ + "</font>";
      }
      _loc2_ = _loc2_ + 1;
   }
   if(needSkillDataList == undefined || needSkillDataList == "")
   {
      detail_mc.guide_txt._visible = true;
   }
   else
   {
      var _loc8_ = lib.util.ExtString.split(needSkillDataList,"\n");
      _loc6_ = lib.util.ExtString.split(_loc8_[0],"\t");
      if(_loc6_.length != 1)
      {
         var _loc5_ = detail_mc.skillSlot;
         _loc5_._visible = true;
         detail_mc.skillSlot_dragable._visible = true;
         _loc5_.draw(_loc6_[1]);
         _loc5_.display = true;
         _loc5_.effect = false;
         lib.manager.ToolTip.add(_loc5_.SLOT,_loc6_[0] + "\t" + _loc6_[3],3,_loc5_.Slot.Icon);
         detail_mc.skillSlot_txt.setText(_loc6_[2]);
      }
   }
};
myListener.OnGame_SkillLearning_SetMyMoney = function(money)
{
   var _loc1_ = lib.util.GoldCurrency.SetGoldText(money);
   container_mc.myMoney_txt.htmlText = _loc1_;
};
myListener.OnGame_SkillLearning_SetFillter = function(type)
{
   container_mc.radio0_mc.checked = type == "0";
   container_mc.radio1_mc.checked = type == "1";
   container_mc.radio2_mc.checked = type == "2";
};
container_mc.radio0_mc.setText(container_mc.radio0_txt);
container_mc.radio1_mc.setText(container_mc.radio1_txt);
container_mc.radio2_mc.setText(container_mc.radio2_txt);
container_mc.radio0_mc.onChanged = function()
{
   container_mc.radio1_mc.checked = false;
   container_mc.radio2_mc.checked = false;
   ToGame_SkillLearning_RequestSortData();
};
container_mc.radio1_mc.onChanged = function()
{
   container_mc.radio0_mc.checked = false;
   container_mc.radio2_mc.checked = false;
   ToGame_SkillLearning_RequestSortData();
};
container_mc.radio2_mc.onChanged = function()
{
   container_mc.radio0_mc.checked = false;
   container_mc.radio1_mc.checked = false;
   ToGame_SkillLearning_RequestSortData();
};
var learn_btn = container_mc.txtBtn0.txtBtn;
var x_btn = new lib.util.TxtBtn(container_mc.x_mc);
learn_btn.setEnabled(false);
learn_btn.setRelease(sendBack);
learn_btn.setRelease(learn);
close_btn.setRelease(closeUI);
x_btn.setRelease(closeUI);
var tab = container_mc.tabBtn.tab;
tab.setRelease(release);
container_mc.radio0_mc.checked = true;
container_mc.radio1_mc.checked = false;
container_mc.radio2_mc.checked = false;
fscommand("ToGame_SkillLearning_Init");
tab.setTab(0,1);
