function ToGame_SenatorTaxSet_CloseUI()
{
   fscommand("ToGame_SenatorTaxSet_CloseUI");
   trace("ToGame_SenatorTaxSet_CloseUI");
}
function ToGame_SenatorTaxSet_ClickBtn(id, value, state)
{
   lib.Debuger.trace("ToGame_SenatorTaxSet_ClickBtn  " + id + "\t" + value + "\t" + state);
   getURL("FSCommand:ToGame_SenatorTaxSet_ClickBtn",id + "\t" + value + "\t" + state);
}
function ToGame_SenatorTaxSet_ChangeTax(id, tax)
{
   getURL("FSCommand:ToGame_SenatorTaxSet_ChangeTax",id + "\t" + tax);
   trace("ToGame_SenatorTaxSet_ChangeTax: " + id + ", " + tax);
}
function ToGame_SenatorTaxSet_Save()
{
   lib.Debuger.trace("ToGame_SenatorTaxSet_Save  ");
   fscommand("ToGame_SenatorTaxSet_Save");
}
function ToGame_SenatorTaxSet_ReceiveMoney()
{
   lib.Debuger.trace("ToGame_SenatorTaxSet_ReceiveMoney  ");
   fscommand("ToGame_SenatorTaxSet_ReceiveMoney");
}
var UI = this;
UI._visible = false;
var UIname = "SenatorTaxSet";
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
var con = this;
container_mc.text_name.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
container_mc.money1_txt.textColor = lib.info.TextColor.GENERAL_MONEY;
container_mc.money2_txt.textColor = lib.info.TextColor.GENERAL_MONEY;
container_mc.explain_0.textColor = lib.info.TextColor.INPUT_LABEL;
container_mc.explain_1.textColor = lib.info.TextColor.INPUT_LABEL;
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
var NameTextLength_Local = 0;
var scrollBar = container_mc.scrollbar;
var listObj = {};
scrollBar.addListener(listObj);
var list_mcY = container_mc.list_mc._y;
listObj.onScroll = function()
{
   container_mc.list_mc._y = list_mcY - arguments[0];
};
scrollBar.setWheel(container_mc.list_mc);
scrollBar.wheelDelta = 1;
scrollBar.pageSize = 0;
scrollBar.displaySize = container_mc.mask_mc._height;
scrollBar.defaultBarSizeRatio = 0.3333333333333333;
scrollBar.rowHeight = 30;
scrollBar.scroll = 0;
var cnt = 0;
var allSet_array = new Array();
myListener.OnGame_SenatorTaxSet_SetMoney = function(cur, total)
{
   var _loc1_ = lib.util.GoldCurrency.SetGoldText(cur);
   var _loc2_ = lib.util.GoldCurrency.SetGoldText(total);
   container_mc.money1_txt.htmlText = "<font color=\'#" + lib.info.TextColor.GENERAL_MONEY.toString(16) + "\'>" + _loc1_ + "</font>";
   container_mc.money2_txt.htmlText = "<font color=\'#" + lib.info.TextColor.GENERAL_MONEY.toString(16) + "\'>" + _loc2_ + "</font>";
};
myListener.OnGame_SenatorTaxSet_AddTax = function(policyName, dataList)
{
   cnt++;
   var _loc9_ = container_mc.list_mc._height;
   var _loc8_ = container_mc.list_mc.attachMovie("policy","policy" + cnt,cnt);
   _loc8_._y = _loc9_;
   _loc8_.name_txt.text = policyName;
   _loc8_.name_txt.textColor = lib.info.TextColor.GENERAL_PARAGRAPH;
   _loc8_.list = new lib.util.List(_loc8_.attach,"line",-2);
   _loc8_.list.bg = "bg_mc";
   var _loc7_ = dataList.split("\n");
   if(_loc7_[_loc7_.length - 1] == "0" || _loc7_[_loc7_.length - 1] == "undefined" || _loc7_[_loc7_.length - 1] == "")
   {
      _loc7_.splice(_loc7_.length - 1,1);
   }
   var _loc3_ = 0;
   while(_loc3_ < _loc7_.length)
   {
      var _loc2_ = _loc7_[_loc3_].split("\t");
      if(_loc2_.length != 1)
      {
         var _loc6_ = Number(_loc2_[2]);
         if(isNaN(_loc6_))
         {
            _loc6_ = 0;
         }
         var _loc5_ = _loc2_[3];
         var mc = _loc8_.list.add(_loc2_[0],"line");
         allSet_array.push(mc);
         mc.hit_mc.stat = _loc3_;
         mc.hit_mc.onRollOver = function()
         {
            this._parent.effect_mc.gotoAndStop("over");
         };
         mc.hit_mc.onRollOut = mc.hit_mc.onReleaseOutside = function()
         {
            this._parent.effect_mc.gotoAndStop("out");
         };
         if(_loc5_ != "" && _loc5_ != undefined)
         {
            lib.manager.ToolTip.add(mc.hit_mc,_loc5_,1);
         }
         lib.util.ExtString.textCut(mc.txt0,_loc2_[1],1);
         mc.tax_input = new lib.util.ExtTextField(mc.txt1,1,mc.txt1_focus);
         mc.tax_input.t = _loc2_[2];
         mc.tax_input.mc = mc;
         mc.tax_input.exceptComma = true;
         mc.tax_input.useAciveColor = false;
         mc.tax_input.text = _loc2_[2];
         mc.tax_input.onChanged = function()
         {
            var _loc1_ = 0;
            if(NameTextLength_Local > 0)
            {
               _loc1_ = NameTextLength_Local;
            }
            else
            {
               _loc1_ = 12;
            }
            lib.util.StrByteLen.getLenth3(mc.txt1,_loc1_);
            lib.Debuger.trace("NameTextLength_Local : " + NameTextLength_Local);
         };
         mc.tax_input.onKillFocusEvent = function()
         {
            if(isNaN(this.text))
            {
               this.text = this.t;
            }
            ToGame_SenatorTaxSet_ChangeTax(this.mc.id,this.text);
         };
         mc.tax_input.onEnterKey = function()
         {
            Selection.setFocus(null);
         };
         mc.btn1_mc.onRollOver = function()
         {
            this.gotoAndStop(2);
         };
         mc.btn1_mc.onRollOut = mc.btn1_mc.onReleaseOutside = function()
         {
            this.gotoAndStop(1);
         };
         mc.btn1_mc.onPress = function()
         {
            this.gotoAndStop(3);
         };
         mc.btn1_mc.onRelease = function()
         {
            this.gotoAndStop(2);
            ToGame_SenatorTaxSet_ClickBtn(this._parent.id,this._parent.tax_input.text,"+");
         };
         mc.btn2_mc.onRollOver = function()
         {
            this.gotoAndStop(2);
         };
         mc.btn2_mc.onRollOut = mc.btn2_mc.onReleaseOutside = function()
         {
            this.gotoAndStop(1);
         };
         mc.btn2_mc.onPress = function()
         {
            this.gotoAndStop(3);
         };
         mc.btn2_mc.onRelease = function()
         {
            this.gotoAndStop(2);
            ToGame_SenatorTaxSet_ClickBtn(this._parent.id,this._parent.tax_input.text,"-");
         };
      }
      _loc3_ = _loc3_ + 1;
   }
   scrollBar.pageSize = container_mc.list_mc._height;
};
myListener.OnGame_SenatorTaxSet_UpdateTax = function(id, name, value, tooltip)
{
   state = Number(state);
   i = 0;
   while(i < allSet_array.length)
   {
      var _loc1_ = allSet_array[i];
      if(_loc1_.id == id)
      {
         if(name != "" && name != undefined)
         {
            lib.util.ExtString.textCut(_loc1_.txt0,name,1);
         }
         if(value != "" && value != undefined)
         {
            _loc1_.tax_input.text = value;
            _loc1_.tax_input.t = value;
         }
         if(tooltip != "" && tooltip != undefined)
         {
            lib.manager.ToolTip.add(_loc1_.hit_mc,tooltip,1);
         }
      }
      i++;
   }
};
myListener.OnGame_SenatorTaxSet_Clear = function()
{
   allSet_array = [];
   var _loc2_ = container_mc.list_mc._name;
   var _loc3_ = container_mc.list_mc.getDepth();
   var _loc5_ = container_mc.list_mc._x;
   var _loc4_ = container_mc.list_mc._y;
   var _loc1_ = container_mc.createEmptyMovieClip(_loc2_,_loc3_);
   _loc1_._x = _loc5_;
   _loc1_._y = _loc4_;
   scrollBar.pageSize = 0;
};
var x_btn = new lib.util.TxtBtn(container_mc.x_mc);
var save_btn = container_mc.txtBtn1.txtBtn;
var receive_btn = container_mc.txtBtn0.txtBtn;
save_btn.setRelease(ToGame_SenatorTaxSet_Save);
receive_btn.setRelease(ToGame_SenatorTaxSet_ReceiveMoney);
x_btn.setRelease(ToGame_SenatorTaxSet_CloseUI);
myListener.OnGame_SenatorTaxSet_LengthLocal = function(lengthnum)
{
   lib.Debuger.trace("OnGame_SenatorTaxSet_LengthLocal : " + lengthnum);
   NameTextLength_Local = lengthnum;
};
fscommand("ToGame_SenatorTaxSet_Init");
