function setButton(mc, user)
{
   var _loc1_ = new lib.util.TxtBtn(mc.btn,mc.txt);
   _loc1_.setRelease(function()
   {
      listClick(user);
   }
   );
}
function limitLength(txdMc, limitLen)
{
   lib.util.StrByteLen.getLenth3(txdMc,limitLen);
}
function ToGame_PartyWindowRaidInvite_Init()
{
   fscommand("ToGame_PartyWindowRaidInvite_Init");
}
function ToGame_PartyWindowRaidInvite_CloseUI()
{
   fscommand("ToGame_PartyWindowRaidInvite_CloseUI");
}
function ToGame_PartyWindowRaidInvite_Enter()
{
   var _loc1_ = container_mc.inputTxt.text;
   if(_loc1_ == INPUT_TXT)
   {
      _loc1_ = "";
   }
   getURL("FSCommand:ToGame_PartyWindowRaidInvite_Enter",_loc1_);
   container_mc.inputTxt.text = "";
   e_btn.setEnabled(false);
}
function ToGame_PartyWindowRaidInvite_OpenGroup(index, type)
{
   getURL("FSCommand:ToGame_PartyWindowRaidInvite_OpenGroup",index + "\t" + type);
}
function listClick(nameStr)
{
   input_txt.text = nameStr;
}
function setCategory(mc)
{
   if(mc.box._visible)
   {
      ToGame_PartyWindowRaidInvite_OpenGroup(mc.id,0);
      mc.opened_mc.gotoAndStop(1);
      mc.box._visible = false;
   }
   else
   {
      ToGame_PartyWindowRaidInvite_OpenGroup(mc.id,1);
      mc.opened_mc.gotoAndStop(2);
      mc.box._visible = true;
   }
   catePostion(mc._parent);
}
function catePostion(focusMc)
{
   var _loc7_ = Number(focusMc.len);
   var _loc4_ = 0;
   var _loc2_ = 0;
   while(_loc2_ < _loc7_)
   {
      var _loc5_ = focusMc.groupList[_loc2_];
      var _loc1_ = focusMc["group" + _loc5_];
      _loc1_._y = _loc4_;
      if(_loc1_.login != undefined)
      {
         _loc1_.txt1.htmlText = "(<font color=\'#80e71c\'>" + _loc1_.login + "</font>/" + _loc1_.count + ")";
      }
      else
      {
         _loc1_.txt1.htmlText = "<font color=\'#80e71c\'>" + _loc1_.count + "</font>";
      }
      if(_loc1_.box._visible)
      {
         var _loc3_ = _loc1_._height;
         _loc4_ = _loc4_ + _loc3_;
         _loc1_.overMc._height = _loc3_;
         _loc1_.opened_mc.gotoAndStop(1);
      }
      else
      {
         _loc4_ = _loc4_ + 40;
         _loc1_.overMc._height = 40;
         _loc1_.opened_mc.gotoAndStop(2);
      }
      _loc2_ = _loc2_ + 1;
   }
   scrollbar.pageSize = container_mc.lineBox._height;
}
function cateButton(mc)
{
   mc.onRollOver = function()
   {
      this.gotoAndStop(2);
   };
   mc.onRollOut = mc.onReleaseOutside = function()
   {
      this.gotoAndStop(1);
   };
   mc.onPress = function()
   {
      this.gotoAndStop(1);
   };
   mc.onRelease = function()
   {
      this.gotoAndStop(2);
      setCategory(this._parent);
   };
}
function listClear(mc)
{
   for(var _loc2_ in mc)
   {
      mc[_loc2_].removeMovieClip();
   }
   mc._y = 0;
   scrollbar.scroll = 0;
}
var UI = this;
UI._visible = false;
var bWidgetOpen = false;
var UIname = "PartyWindowRaidInvite";
container_mc.UIDrager.setData(UIName,UI);
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
var x_btn = new lib.util.TxtBtn(container_mc.xBtn);
x_btn.setRelease(ToGame_PartyWindowRaidInvite_CloseUI);
container_mc.txt.setText("$023137");
var list_mcY = container_mc.lineBox._y;
var scrollbar = container_mc.scrollbar;
scrollbar.addListener(container_mc.lineBox);
container_mc.lineBox.onScroll = function()
{
   container_mc.lineBox._y = list_mcY - arguments[0];
};
scrollbar.setWheel(container_mc.lineBox);
scrollbar.wheelDelta = 1;
scrollbar.pageSize = 0;
scrollbar.displaySize = 370;
scrollbar.defaultBarSizeRatio = 0.3333333333333333;
scrollbar.rowHeight = 30;
scrollbar.scroll = 0;
var input_txt = new lib.util.ExtTextField(container_mc.inputTxt,0,container_mc.input_focus);
var INPUT_TXT = lib.util.UIString.getUIString("$023141");
input_txt.caption = INPUT_TXT;
var e_btn = new lib.util.TxtBtn(container_mc.btn.btn,container_mc.btn.txt);
e_btn.setRelease(ToGame_PartyWindowRaidInvite_Enter);
e_btn.setEnabled(false);
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
var CATE_TIP = lib.util.UIString.getUIString("$111077");
var POSIOTIONTYPECOLOR = [10066329,52479,16639772,16750848];
var LINEH = 30;
var LINENAME = "line";
myListener.OnGame_PartyWindowRaidInvite_SetList = function(groupList, dataList)
{
   var _loc7_ = container_mc.lineBox;
   var _loc24_ = lib.util.ExtString.split(groupList,"\n");
   var _loc22_ = _loc24_.length;
   _loc7_.len = _loc22_;
   _loc7_.groupList = [];
   container_mc.inputTxt.text = "";
   listClear(_loc7_);
   var _loc5_ = 0;
   while(_loc5_ < _loc22_)
   {
      var _loc9_ = lib.util.ExtString.split(_loc24_[_loc5_],"\t");
      var _loc10_ = _loc9_[1];
      var _loc12_ = _loc9_[0];
      var _loc4_ = _loc7_.attachMovie("groupBar","group" + _loc12_,_loc7_.getNextHighestDepth());
      _loc7_.groupList[_loc5_] = _loc12_;
      _loc4_.id = _loc10_;
      _loc4_.count = 0;
      _loc4_.login = 0;
      _loc4_.txt.text = _loc10_;
      var _loc18_ = _loc4_.txt.textWidth;
      _loc4_.txt1._x = _loc18_ + 35;
      _loc4_.box._visible = Boolean(Number(_loc9_[2]));
      _loc4_.overMc._height = 30;
      _loc4_.overMc._alpha = 0;
      _loc4_.overMc.hitTestDisable = true;
      cateButton(_loc4_.cateBtn2);
      _loc5_ = _loc5_ + 1;
   }
   var _loc23_ = lib.util.ExtString.split(dataList,"\n");
   var _loc25_ = _loc23_.length;
   var _loc8_ = 0;
   while(_loc8_ < _loc25_)
   {
      var _loc3_ = lib.util.ExtString.split(_loc23_[_loc8_],"\t");
      var _loc14_ = _loc3_[0];
      var _loc11_ = _loc3_[1];
      var _loc15_ = _loc3_[2];
      var _loc20_ = _loc3_[3];
      var _loc13_ = _loc3_[4];
      var _loc21_ = Boolean(Number(_loc3_[5]));
      var _loc16_ = _loc3_[6];
      _loc4_ = _loc7_["group" + _loc16_];
      var _loc19_ = "stateIcon" + _loc13_;
      var _loc17_ = "<img src=\'" + _loc19_ + "\' vspace=\'-3\'> Lv." + _loc15_ + " " + _loc11_;
      if(_loc4_ != undefined)
      {
         var _loc6_ = _loc4_.count;
         var _loc2_ = _loc4_.box.attachMovie("line0",LINENAME + _loc6_,_loc4_.box.getNextHighestDepth());
         _loc2_.id = _loc14_;
         _loc2_._y = LINEH * _loc6_;
         _loc2_.idx = _loc6_;
         if(_loc13_ != 2)
         {
            _loc4_.login = _loc4_.login + 1;
         }
         _loc4_.count = _loc4_.count + 1;
         _loc2_.txt_0.setText(_loc17_);
         _loc2_.txt_1.textAutoSize = "shrink";
         _loc2_.txt_1.text = _loc20_;
         _loc2_.hit_mc.onRollOver = function()
         {
            this._parent.effect_mc.gotoAndStop("over");
         };
         _loc2_.hit_mc.onRollOut = _loc2_.hit_mc.onReleaseOutside = function()
         {
            this._parent.effect_mc.gotoAndStop("out");
         };
         setButton(_loc2_.btn,_loc11_);
      }
      _loc8_ = _loc8_ + 1;
   }
   catePostion(_loc7_);
};
var limitLen = 16;
myListener.OnGame_PartyWindowRaidInvite_LengthLocal = function(num)
{
   limitLen = num;
};
input_txt.onChanged = function()
{
   limitLength(container_mc.inputTxt,limitLen);
   if(container_mc.inputTxt.text == "" || container_mc.inputTxt.text == undefined)
   {
      e_btn.setEnabled(false);
   }
   else
   {
      e_btn.setEnabled(true);
   }
};
input_txt.onEnterKey = function()
{
   Selection.setFocus(null);
};
ToGame_PartyWindowRaidInvite_Init();
