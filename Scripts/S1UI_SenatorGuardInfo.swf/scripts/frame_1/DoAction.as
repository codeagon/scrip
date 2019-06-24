function ToGame_SenatorGuardInfo_CloseUI()
{
   fscommand("ToGame_SenatorGuardInfo_CloseUI");
}
var UI = this;
UI._visible = false;
var UIname = "SenatorGuardInfo";
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
container_mc.text_name.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
container_mc.info_mc.name_txt.textColor = lib.info.TextColor.GENERAL_PARAGRAPH;
container_mc.info_mc.greetingsLabel_txt.textColor = lib.info.TextColor.GENERAL_PARAGRAPH;
container_mc.info_mc.policyMc0.name_txt.textColor = lib.info.TextColor.GENERAL_PARAGRAPH;
container_mc.info_mc.policyMc1.name_txt.textColor = lib.info.TextColor.GENERAL_PARAGRAPH;
container_mc.info_mc.greetings_txt.textColor = lib.info.TextColor.GENERAL_CONTENTS;
container_mc.info_mc.label_0.textColor = lib.info.TextColor.GENERAL_EXPLAIN_DETAIL;
container_mc.info_mc.label_1.textColor = lib.info.TextColor.GENERAL_EXPLAIN_DETAIL;
container_mc.info_mc.label_2.textColor = lib.info.TextColor.GENERAL_EXPLAIN_DETAIL;
container_mc.info_mc.label_3.textColor = lib.info.TextColor.GENERAL_EXPLAIN_DETAIL;
container_mc.info_mc.label_4.textColor = lib.info.TextColor.GENERAL_EXPLAIN_DETAIL;
container_mc.info_mc.label_5.textColor = lib.info.TextColor.GENERAL_EXPLAIN_DETAIL;
container_mc.info_mc.label_6.textColor = lib.info.TextColor.GENERAL_EXPLAIN_DETAIL;
container_mc.info_mc.txt_0.textColor = lib.info.TextColor.GENERAL_CONTENTS;
container_mc.info_mc.txt_1.textColor = lib.info.TextColor.GENERAL_CONTENTS;
container_mc.info_mc.txt_2.textColor = lib.info.TextColor.GENERAL_CONTENTS;
container_mc.info_mc.txt_3.textColor = lib.info.TextColor.GENERAL_EMPHASIS;
container_mc.info_mc.txt_4.textColor = lib.info.TextColor.GENERAL_CONTENTS;
container_mc.info_mc.txt_5.textColor = lib.info.TextColor.GENERAL_EMPHASIS;
container_mc.info_mc.txt_6.textColor = lib.info.TextColor.GENERAL_EMPHASIS;
bWidgetOpen = false;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
var scrollbar = container_mc.scrollbar;
scrollbar.addListener(container_mc.info_mc);
container_mc.info_mc.onScroll = function()
{
   container_mc.info_mc._y = 54 - arguments[0];
};
scrollbar.setWheel(container_mc.info_mc);
scrollbar.wheelDelta = 1;
scrollbar.pageSize = 0;
scrollbar.displaySize = container_mc.maskMc._height;
scrollbar.defaultBarSizeRatio = 0.3333333333333333;
scrollbar.rowHeight = 35;
scrollbar.scroll = 0;
myListener.OnGame_SenatorGuardInfo_SetTitleText = function(str)
{
   container_mc.text_name.setText(str);
};
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
var textHeightAdjust = 3;
var textFieldGap = 6.5;
var baseInfoY = container_mc.info_mc.txt_0._y;
myListener.OnGame_SenatorGuardInfo_SetBaseInfo = function(senatorName, guildName, electionMethod, villages, fields, tearm, popularity, greetings, guildCrestImg)
{
   lib.util.DrawBitmap.draw(container_mc.info_mc.Icon,guildCrestImg,64,64);
   var _loc1_ = villages.split("\n");
   if(_loc1_[_loc1_.length - 1] == "0" || _loc1_[_loc1_.length - 1] == "undefined" || _loc1_[_loc1_.length - 1] == "")
   {
      _loc1_.pop();
   }
   var _loc2_ = fields.split("\n");
   if(_loc2_[_loc2_.length - 1] == "0" || _loc2_[_loc2_.length - 1] == "undefined" || _loc2_[_loc2_.length - 1] == "")
   {
      _loc2_.pop();
   }
   var _loc3_ = candidateList.split("\n");
   if(_loc3_[_loc3_.length - 1] == "0" || _loc3_[_loc3_.length - 1] == "undefined" || _loc3_[_loc3_.length - 1] == "")
   {
      _loc3_.pop();
   }
   container_mc.info_mc.txt_0.text = senatorName;
   container_mc.info_mc.txt_0._height = container_mc.info_mc.txt_0.textHeight + textHeightAdjust;
   baseInfoY = container_mc.info_mc.txt_0._y + container_mc.info_mc.txt_0._height + textFieldGap;
   container_mc.info_mc.label_1._y = baseInfoY;
   container_mc.info_mc.txt_1._y = baseInfoY;
   container_mc.info_mc.txt_1.text = guildName;
   container_mc.info_mc.txt_1._height = container_mc.info_mc.txt_1.textHeight + textHeightAdjust;
   baseInfoY = container_mc.info_mc.txt_1._y + container_mc.info_mc.txt_1._height + textFieldGap;
   container_mc.info_mc.label_2._y = baseInfoY;
   container_mc.info_mc.txt_2._y = baseInfoY;
   container_mc.info_mc.txt_2.text = electionMethod;
   container_mc.info_mc.txt_2._height = container_mc.info_mc.txt_2.textHeight + textHeightAdjust;
   baseInfoY = container_mc.info_mc.txt_2._y + container_mc.info_mc.txt_2._height + textFieldGap;
   container_mc.info_mc.label_3._y = baseInfoY;
   container_mc.info_mc.txt_3._y = baseInfoY;
   container_mc.info_mc.txt_3.text = _loc1_.join(", ");
   container_mc.info_mc.txt_3._height = container_mc.info_mc.txt_3.textHeight + textHeightAdjust;
   baseInfoY = container_mc.info_mc.txt_3._y + container_mc.info_mc.txt_3._height + textFieldGap;
   container_mc.info_mc.label_4._y = baseInfoY;
   container_mc.info_mc.txt_4._y = baseInfoY;
   container_mc.info_mc.txt_4.text = _loc2_.join(", ");
   container_mc.info_mc.txt_4._height = container_mc.info_mc.txt_4.textHeight + textHeightAdjust;
   baseInfoY = container_mc.info_mc.txt_4._y + container_mc.info_mc.txt_4._height + textFieldGap;
   container_mc.info_mc.label_5._y = baseInfoY;
   container_mc.info_mc.txt_5._y = baseInfoY;
   container_mc.info_mc.txt_5.text = tearm;
   container_mc.info_mc.txt_5._height = container_mc.info_mc.txt_5.textHeight + textHeightAdjust;
   baseInfoY = container_mc.info_mc.txt_5._y + container_mc.info_mc.txt_5._height + textFieldGap;
   container_mc.info_mc.label_6._y = baseInfoY;
   container_mc.info_mc.txt_6._y = baseInfoY;
   container_mc.info_mc.txt_6.text = popularity;
   container_mc.info_mc.txt_6._height = container_mc.info_mc.txt_6.textHeight + textHeightAdjust;
   baseInfoY = container_mc.info_mc.txt_6._y + container_mc.info_mc.txt_6._height + textFieldGap;
   baseInfoY = baseInfoY + 2;
   container_mc.info_mc.greetingsLabel_mc._y = baseInfoY;
   container_mc.info_mc.greetingsLabel_txt._y = baseInfoY + 6.6;
   baseInfoY = container_mc.info_mc.greetingsLabel_mc._y + container_mc.info_mc.greetingsLabel_mc._height + textFieldGap;
   container_mc.info_mc.greetings_txt._y = baseInfoY;
   container_mc.info_mc.greetings_txt.text = greetings;
   if(greetings != undefined && greetings != "")
   {
      container_mc.info_mc.greetings_txt._height = container_mc.info_mc.greetings_txt.textHeight + textHeightAdjust + 5;
   }
   baseInfoY = container_mc.info_mc.greetings_txt._y + container_mc.info_mc.greetings_txt._height + textFieldGap;
   if(baseStr != "")
   {
      container_mc.info_mc.defaultStr._visible = false;
   }
   else
   {
      container_mc.info_mc.defaultStr._visible = true;
   }
   scrollbar.pageSize = container_mc.info_mc._height;
};
var taxDataList = new lib.util.List(container_mc.info_mc.policyMc0.list_mc,"line",0);
taxDataList.bg = "bg_mc";
var policyDataList = new lib.util.List(container_mc.info_mc.policyMc1.list_mc,"line",0);
policyDataList.bg = "bg_mc";
var policyDataList2 = new lib.util.List(container_mc.info_mc.policyMc2.list_mc,"line",0);
policyDataList2.bg = "bg_mc";
myListener.OnGame_SenatorGuardInfo_SetPolicyInfo = function(dataList1, dataList2, dataList3)
{
   if(dataList1 != undefined && dataList1 != "")
   {
      container_mc.info_mc.policyMc0._visible = true;
   }
   if(dataList2 != undefined && dataList1 != "")
   {
      container_mc.info_mc.policyMc1._visible = true;
   }
   if(dataList3 != undefined && dataList1 != "")
   {
      container_mc.info_mc.policyMc2._visible = true;
   }
   taxDataList.clear();
   policyDataList.clear();
   policyDataList2.clear();
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
   var _loc7_ = dataList2.split("\n");
   if(_loc7_[_loc7_.length - 1] == "0" || _loc7_[_loc7_.length - 1] == "undefined" || _loc7_[_loc7_.length - 1] == "")
   {
      _loc7_.pop();
   }
   _loc3_ = 0;
   while(_loc3_ < _loc7_.length)
   {
      _loc4_ = _loc7_[_loc3_].split("\t");
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
   var _loc6_ = dataList3.split("\n");
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
         _loc2_ = policyDataList2.add(_loc3_,"policyInfo_line");
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
   container_mc.info_mc.policyMc0._y = baseInfoY;
   container_mc.info_mc.policyMc1._y = container_mc.info_mc.policyMc0._y + container_mc.info_mc.policyMc0._height;
   container_mc.info_mc.policyMc2._y = container_mc.info_mc.policyMc1._y + container_mc.info_mc.policyMc1._height;
   scrollbar.pageSize = container_mc.info_mc._height;
};
container_mc.info_mc.policyMc0._visible = false;
container_mc.info_mc.policyMc1._visible = false;
container_mc.info_mc.policyMc2._visible = false;
var x_btn = new lib.util.TxtBtn(container_mc.x_mc);
x_btn.setRelease(ToGame_SenatorGuardInfo_CloseUI);
myListener.OnGame_SenatorGuardInfo_SetTitleText("");
fscommand("ToGame_SenatorGuardInfo_Init");
