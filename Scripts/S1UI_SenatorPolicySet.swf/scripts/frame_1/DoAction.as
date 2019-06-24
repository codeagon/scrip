function CloseUI()
{
   fscommand("ToGame_SenatorPolicySet_CloseUI");
   trace("ToGame_SenatorPolicySet_CloseUI");
}
function ToGame_SenatorPolicySet_ClickBtn(id)
{
   getURL("FSCommand:ToGame_SenatorPolicySet_ClickBtn",id);
   lib.Debuger.trace("ToGame_SenatorPolicySet_ClickBtn  " + id);
}
function ToGame_SenatorPolicySet_SaveGreetings(greetings)
{
   getURL("FSCommand:ToGame_SenatorPolicySet_SaveGreetings",greetings);
}
var UI = this;
UI._visible = false;
var UIname = "SenatorPolicySet";
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
var con = this;
container_mc.text_name.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
container_mc.explain_0.textColor = lib.info.TextColor.GENERAL_CONTENTS;
container_mc.point_txt.textColor = lib.info.TextColor.GENERAL_EMPHASIS;
container_mc.list_mc.greetings_mc.name_txt.textColor = lib.info.TextColor.GENERAL_PARAGRAPH;
bWidgetOpen = false;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
var saveGreeting = "";
var adjustListHeight = -12;
var NameTextLength_Local = 0;
var input_txt = new lib.util.ExtTextField(container_mc.list_mc.greetings_mc.input_txt,0,container_mc.list_mc.greetings_mc.input_focus);
input_txt.caption = lib.util.UIString.getUIString("$391006");
input_txt.onChanged = function()
{
   var _loc1_ = 0;
   if(NameTextLength_Local > 0)
   {
      _loc1_ = NameTextLength_Local;
   }
   else
   {
      _loc1_ = 360;
   }
   lib.util.StrByteLen.getLenth3(container_mc.list_mc.greetings_mc.input_txt,_loc1_);
   lib.Debuger.trace("NameTextLength_Local : " + NameTextLength_Local);
};
input_txt.onSetFocusEvent = function()
{
   if(this.text == this.caption)
   {
      this.textField.text = "";
   }
};
container_mc.list_mc.greetings_mc.btn.txtBtn.setRelease(function()
{
   if(input_txt.text != input_txt.caption)
   {
      ToGame_SenatorPolicySet_SaveGreetings(input_txt.text);
   }
   else
   {
      ToGame_SenatorPolicySet_SaveGreetings("");
   }
}
);
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
myListener.OnGame_SenatorPolicySet_SetPoint = function(point)
{
   container_mc.point_txt.text = lib.util.CurrencyFormat.makeComma(point);
};
myListener.OnGame_SenatorPolicySet_AddPolicy = function(policyName, dataList)
{
   cnt++;
   var _loc9_ = container_mc.list_mc._height;
   var _loc7_ = container_mc.list_mc.attachMovie("policy","policy" + cnt,cnt);
   _loc7_._y = _loc9_ + adjustListHeight;
   _loc7_.name_txt.setText(policyName);
   _loc7_.name_txt.textColor = lib.info.TextColor.GENERAL_PARAGRAPH;
   _loc7_.list = new lib.util.List(_loc7_.attach,"line",0);
   _loc7_.list.bg = "bg_mc";
   var _loc6_ = dataList.split("\n");
   if(_loc6_[_loc6_.length - 1] == "0" || _loc6_[_loc6_.length - 1] == "undefined" || _loc6_[_loc6_.length - 1] == "")
   {
      _loc6_.splice(_loc6_.length - 1,1);
   }
   var _loc5_ = 0;
   while(_loc5_ < _loc6_.length)
   {
      var _loc3_ = _loc6_[_loc5_].split("\t");
      if(_loc3_.length != 1)
      {
         var _loc2_ = _loc7_.list.add(_loc3_[0],"line");
         allSet_array.push(_loc2_);
         var _loc8_ = Number(_loc3_[2]);
         _loc2_.state = Number(_loc3_[2]);
         lib.util.ExtString.textCut(_loc2_.txt0,_loc3_[1],1);
         _loc2_.txt0.textColor = lib.info.TextColor.GENERAL_EXPLAIN_DETAIL;
         if(_loc3_[3] != "" && _loc3_[3] != undefined)
         {
            lib.manager.ToolTip.add(_loc2_.hit_mc,_loc3_[3],1);
         }
         _loc2_.hit_mc.stat = _loc5_;
         _loc2_.hit_mc.onRollOver = function()
         {
            this._parent.effect_mc.gotoAndStop("over");
         };
         _loc2_.hit_mc.onRollOut = _loc2_.hit_mc.onReleaseOutside = function()
         {
            this._parent.effect_mc.gotoAndStop("out");
         };
         _loc2_.btn1_mc.onLoad = function()
         {
            var _loc2_ = this.txtBtn;
            _loc2_.btn.onRelease2 = function()
            {
               ToGame_SenatorPolicySet_ClickBtn(this._parent._parent.id);
            };
            if(this._parent.state == 0)
            {
               _loc2_.setText(lib.util.UIString.getUIString("$391003"));
            }
            else if(this._parent.state == 1)
            {
               _loc2_.setText(lib.util.UIString.getUIString("$391004"));
            }
            else if(this._parent.state == 2)
            {
               _loc2_.setVisible(false);
            }
            else if(this._parent.state == 3)
            {
               _loc2_.setText(lib.util.UIString.getUIString("$391008"));
            }
         };
      }
      _loc5_ = _loc5_ + 1;
   }
   scrollBar.pageSize = container_mc.list_mc._height + adjustListHeight;
};
myListener.OnGame_SenatorPolicySet_UpdatePolicy = function(id, name, _state, tooltip)
{
   _state = Number(_state);
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
         if(!isNaN(_state))
         {
            if(_state == 0)
            {
               _loc1_.btn1_mc.txtBtn.setText(lib.util.UIString.getUIString("$391003"));
            }
            else if(_state == 1)
            {
               _loc1_.btn1_mc.txtBtn.setText(lib.util.UIString.getUIString("$391004"));
            }
            else if(_state == 2)
            {
               _loc1_.btn1_mc.txtBtn.setVisible(false);
            }
            else if(_state == 3)
            {
               _loc1_.btn1_mc.txtBtn.setText(lib.util.UIString.getUIString("$391008"));
            }
            if(_state != 2)
            {
               _loc1_.btn1_mc.txtBtn.setVisible(true);
            }
         }
         if(tooltip != "" && tooltip != undefined)
         {
            lib.manager.ToolTip.add(_loc1_.hit_mc,tooltip,1);
         }
      }
      i++;
   }
};
myListener.OnGame_SenatorPolicySet_Clear = function()
{
   allSet_array = [];
   var _loc3_ = container_mc.list_mc._name;
   var _loc4_ = container_mc.list_mc.getDepth();
   var _loc6_ = container_mc.list_mc._x;
   var _loc5_ = container_mc.list_mc._y;
   var _loc2_ = container_mc.createEmptyMovieClip(_loc3_,_loc4_);
   _loc2_._x = _loc6_;
   _loc2_._y = _loc5_;
   scrollBar.pageSize = 0;
   var greetings = _loc2_.attachMovie("greetings","greetings_mc",_loc2_.getNextHighestDepth());
   greetings.name_txt.textColor = lib.info.TextColor.GENERAL_PARAGRAPH;
   greetings.onEnterFrame = function()
   {
      if(greetings.btn._label != undefined)
      {
         input_txt = new lib.util.ExtTextField(greetings.input_txt,0,greetings.input_focus);
         input_txt.caption = lib.util.UIString.getUIString("$391006");
         if(saveGreeting != "")
         {
            input_txt.text = saveGreeting;
         }
         input_txt.onSetFocusEvent = function()
         {
            if(this.text == this.caption)
            {
               this.textField.text = "";
            }
         };
         greetings.btn.txtBtn.setRelease(function()
         {
            if(input_txt.text != input_txt.caption)
            {
               ToGame_SenatorPolicySet_SaveGreetings(input_txt.text);
            }
            else
            {
               ToGame_SenatorPolicySet_SaveGreetings("");
            }
         }
         );
         delete this.onEnterFrame;
      }
   };
};
myListener.OnGame_SenatorPolicySet_SetGreetings = function(greetings)
{
   input_txt.setChanged(false);
   if(greetings != "")
   {
      input_txt.text = greetings;
   }
   else
   {
      input_txt.text = "";
   }
   saveGreeting = greetings;
};
var x_btn = new lib.util.TxtBtn(container_mc.x_mc);
x_btn.setRelease(CloseUI);
myListener.OnGame_SenatorPolicySet_LengthLocal = function(lengthnum)
{
   lib.Debuger.trace("OnGame_SenatorPolicySet_LengthLocal : " + lengthnum);
   NameTextLength_Local = lengthnum;
};
fscommand("ToGame_SenatorPolicySet_Init");
