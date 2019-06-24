function buildList(teamListData)
{
   listReset();
   if(teamListData == null || teamListData.length == 0)
   {
      return undefined;
   }
   var _loc13_ = teamListData.length;
   var _loc4_ = 0;
   while(_loc4_ < _loc13_)
   {
      var _loc5_ = teamListData[_loc4_];
      var lineMc = container_mc.teamListMc.attachMovie("line","line" + _loc4_,container_mc.teamListMc.getNextHighestDepth());
      lineArray.push(lineMc);
      lineMc._y = lineH * _loc4_;
      lineMc.checkBtn._visible = false;
      lineMc.timeMc._visible = false;
      lineMc.slot_txt1.text = "";
      lineMc.slot_txt2.text = "";
      lineMc.checkBtn_mc._visible = false;
      lineMc.time_mc._visible = false;
      lineMc.guideMc._visible = false;
      lineMc.slot_txt1.verticalAlign = "top";
      lineMc.slot_txt2.verticalAlign = "top";
      teamListData[_loc4_] = _loc5_;
      lineMc.index = _loc4_;
      lineMc.index0 = _loc5_[0];
      lineMc.index3 = _loc5_[7];
      lineMc.index4 = _loc5_[8];
      lineMc.slot0index0 = _loc5_[1];
      lineMc.slot0index1 = _loc5_[2];
      lineMc.slot0index2 = _loc5_[3];
      lineMc.slot1index0 = _loc5_[4];
      lineMc.slot1index1 = _loc5_[5];
      lineMc.slot1index2 = _loc5_[6];
      var _loc7_ = "";
      if(_loc4_ > 9)
      {
         _loc7_ = "0" + String(_loc4_);
      }
      else if(_loc4_ < 10)
      {
         _loc7_ = "00" + String(_loc4_);
      }
      var _loc2_ = lineMc.attachMovie("Slot_link","SkillPath__" + _loc7_,lineMc.getNextHighestDepth());
      _loc2_._x = 7.2;
      _loc2_._y = 6;
      var _loc3_ = lineMc.attachMovie("Slot_link","SkillPath__" + (_loc4_ + 100),lineMc.getNextHighestDepth());
      _loc3_._x = 220.2;
      _loc3_._y = 6;
      var _loc9_ = lineMc.slot0index1;
      var _loc11_ = lineMc.slot1index1;
      _loc2_.clear();
      _loc3_.clear();
      _loc2_.SLOT.enabled = false;
      _loc2_.slotnewbg._visible = true;
      _loc3_.slotnewbg._visible = false;
      lib.manager.ToolTip.remove(_loc2_.SLOT,lineMc.slot0index0);
      lib.manager.ToolTip.remove(_loc3_.SLOT,lineMc.slot0index0);
      if((lineMc.slot0index0 == "0" || lineMc.slot0index0 == undefined) && (lineMc.slot1index0 == "0" || lineMc.slot1index0 == undefined))
      {
         lineMc.slot_txt1.htmlText = "";
         lineMc.slot_txt2.htmlText = "";
         _loc2_.slotnewbg._visible = true;
         _loc3_.slotnewbg._visible = false;
      }
      else if((lineMc.slot0index0 != "0" || lineMc.slot0index0 != undefined) && (lineMc.slot1index0 == "0" || lineMc.slot1index0 == undefined))
      {
         lineMc.guideMc._visible = true;
         lineMc.guideMc.mc.guideFd.htmlText = "$083005";
         lineMc.guideMc.mc.gotoAndPlay(1);
         lineMc.slot_txt1.htmlText = lineMc.slot0index2;
         lineMc.slot_txt2.htmlText = "";
         _loc2_.draw(_loc9_);
         _loc2_.Slot.drag = false;
         _loc2_.display = true;
         _loc2_.SLOT.enabled = false;
         lineMc.gotoAndStop(2);
         lib.manager.ToolTip.add(_loc2_.SLOT,lineMc.slot0index0,6,_loc2_.Icon[lineMc.index0]);
         lineMc.slot_txt1.textColor = 7368816;
         _loc2_.slotnewbg._visible = true;
         _loc2_.slotnewbg._visible = false;
      }
      else if((lineMc.slot0index0 != "0" || lineMc.slot0index0 != undefined) && (lineMc.slot1index0 != "0" || lineMc.slot1index0 != undefined))
      {
         lineMc.guideMc._visible = false;
         lineMc.slot_txt1.htmlText = lineMc.slot0index2;
         lineMc.slot_txt2.htmlText = lineMc.slot1index2;
         _loc2_.draw(_loc9_);
         _loc2_.Slot.drag = false;
         _loc2_.display = true;
         _loc2_.SLOT.enabled = false;
         _loc3_.draw(_loc11_);
         _loc3_.SLOT.enabled = true;
         lineMc.gotoAndStop(1);
         lib.manager.ToolTip.add(_loc2_.SLOT,lineMc.slot0index0,6,_loc2_.Icon[lineMc.index0]);
         lib.manager.ToolTip.add(_loc3_.SLOT,lineMc.slot1index0,6,_loc3_.Icon[lineMc.index0]);
         lineMc.slot_txt1.textColor = 14145495;
         lineMc.slot_txt2.textColor = 14145495;
         _loc2_.slotnewbg._visible = true;
         _loc3_.slotnewbg._visible = true;
      }
      else
      {
         lineMc.guideMc._visible = false;
      }
      _loc2_.slotnewbg._visible = true;
      _loc3_.slotnewbg._visible = false;
      lineMc.checkBtn.onEnterFrame = function()
      {
         if(lineMc.checkBtn != undefined)
         {
            this.onEnterFrame = null;
            var _loc2_ = Number(this._parent.index3);
            var _loc3_ = this._parent.slot0index0;
            if(_loc2_ == 1)
            {
               this.checked = true;
            }
            else if(_loc2_ == 0)
            {
               this.checked = false;
            }
            else
            {
               this._visible = false;
               this._parent.checkBtn_mc._visible = false;
            }
            if(this._parent.guideMc._visible == false)
            {
               this._visible = true;
               this._parent.checkBtn_mc._visible = true;
            }
            else
            {
               this._visible = false;
               this._parent.checkBtn_mc._visible = false;
            }
         }
      };
      lineMc.checkBtn.onChanged = function(changed)
      {
         if(this.checked == true)
         {
            teamListData[this._parent._name.substr(4,2)][7] = "1";
         }
         else
         {
            teamListData[this._parent._name.substr(4,2)][7] = "0";
         }
         ToGame_SkillPath_Update(teamListData[this._parent._name.substr(4,2)]);
      };
      lineMc.timeMc.onEnterFrame = function()
      {
         if(lineMc.timeMc != undefined)
         {
            this.onEnterFrame = null;
            var num4 = this._parent.index4;
            if(num4 == "0" || num4 == undefined || num4 == null)
            {
               this.txt.text = "";
               this.txt2.text = "";
            }
            else
            {
               this.txt.text = num4 + "" + str_data1;
               this.txt2.text = "";
               this.txt.onChanged = function()
               {
                  str_data1_check = true;
                  if(Number(this.text) > 99)
                  {
                     this.text = "99" + str_data1;
                  }
               };
               var tmp_mc = this;
               var _loc2_ = new lib.util.ExtTextField(this.txt,1,this._focus);
               _loc2_.exceptComma = true;
               _loc2_.onEnterKey = function()
               {
                  str_data1_check = false;
                  tmp_mc._focus._visible = false;
                  Selection.setFocus(null);
                  var _loc2_ = Number(this.text);
                  if(_loc2_ == NaN)
                  {
                     tmp_mc.txt.text = num4 + "" + str_data1;
                  }
                  else
                  {
                     teamListData[tmp_mc._parent._name.substr(4,2)][8] = this.text;
                     ToGame_SkillPath_Update(teamListData[tmp_mc._parent._name.substr(4,2)]);
                     this.text = this.text + "" + str_data1;
                  }
               };
               _loc2_.onKillFocusEvent = function()
               {
                  if(str_data1_check == true)
                  {
                     str_data1_check = false;
                     this.text = this.text + "" + str_data1;
                  }
               };
            }
            if(this._parent.guideMc._visible == false)
            {
               this._visible = true;
               this._parent.time_mc._visible = true;
               this._parent.time_mc._focus._visible = false;
            }
            else
            {
               this._visible = false;
               this._parent.time_mc._visible = false;
            }
         }
      };
      _loc4_ = _loc4_ + 1;
   }
}
function listReset()
{
   while(lineArray.length > 0)
   {
      (MovieClip)lineArray.pop().removeMovieClip();
   }
}
function ListScrollBar(bool)
{
   var _loc2_ = undefined;
   var _loc6_ = 0;
   var _loc5_ = lineH;
   var _loc3_ = undefined;
   if(bool == true)
   {
      _loc3_ = UI.container_mc.MaskMc._height;
   }
   else
   {
      _loc3_ = 10000;
   }
   _loc2_ = UI.container_mc.moviescroll1;
   var _loc4_ = {};
   _loc2_.addListener(_loc4_);
   _loc4_.onScroll = function()
   {
      UI.container_mc.teamListMc._y = 87 - arguments[0];
   };
   _loc2_.setWheel(UI.container_mc.teamListMc);
   if(listHeight == undefined)
   {
      _loc2_.__set__pageSize(UI.container_mc.teamListMc._height);
   }
   else
   {
      _loc2_.__set__pageSize(listHeight);
   }
   _loc2_.__set__displaySize(_loc3_);
   _loc2_.__set__rowHeight(_loc5_ + _loc6_);
   _loc2_.__set__scroll(0);
   var _loc7_ = 0;
   var _loc9_ = lineH;
   var _loc8_ = 513;
}
function KeyMapFunc()
{
   container_mc.keyMc._focus._visible = false;
   if(key_focus == "false")
   {
      var tmp_mc = container_mc.keyMc;
      var _loc1_ = new lib.util.ExtTextField(container_mc.keyMc.key0_txt,0,container_mc.keyMc._focus);
      _loc1_.onEnterKey = function()
      {
         tmp_mc._focus._visible = false;
         key_focus = "false";
         Selection.setFocus(null);
      };
   }
}
function ToGame_SkillPath_CloseUI()
{
   fscommand("ToGame_SkillPath_CloseUI");
}
function ToGame_SkillPath_ReSet()
{
   fscommand("ToGame_SkillPath_ReSet");
}
function ToGame_SkillPath_OK()
{
   var _loc3_ = "";
   var _loc2_ = 0;
   while(_loc2_ < teamListData.length - 1)
   {
      var _loc1_ = 0;
      while(_loc1_ < teamListData[_loc2_].length)
      {
         _loc3_ = _loc3_ + (teamListData[_loc2_][_loc1_] + "\t");
         _loc1_ = _loc1_ + 1;
      }
      _loc3_ = _loc3_ + "\n";
      _loc2_ = _loc2_ + 1;
   }
   getURL("FSCommand:ToGame_SkillPath_OK",_loc3_);
}
function ToGame_SkillPath_Cancel()
{
   fscommand("ToGame_SkillPath_Cancel");
}
function ToGame_SkillPath_DeleteList(index)
{
   getURL("FSCommand:ToGame_SkillPath_DeleteList",index);
}
function ToGame_SkillPath_Hotkey(bool, keystring)
{
   var _loc1_ = bool + "\t" + keystring;
   getURL("FSCommand:ToGame_SkillPath_Hotkey",_loc1_);
}
function ToGame_SkillPath_Update(indexdata)
{
   var _loc1_ = "";
   var _loc2_ = new Array();
   _loc1_ = indexdata.join("\t");
   getURL("FSCommand:ToGame_SkillPath_Update",String(_loc1_));
}
function ToGame_SkillPath_Init()
{
   fscommand("ToGame_SkillPath_Init");
}
function ToGame_SkillPath_UseCheck(changed)
{
   getURL("FSCommand:ToGame_SkillPath_UseCheck",changed);
}
var UI = this;
UI._visible = false;
var bWidgetOpen = false;
var UIname = "SkillPath";
var slotname0 = "SkillPath__";
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
container_mc.text_name.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
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
   container_mc.ToolTip._visible = bShow;
};
var lineH = 96;
var teamListMcY = container_mc.teamListMc._y;
var teamListData = [];
var listBtn;
var keyMaps = [];
var keyMapEventLisntner = {};
var pressedKeyCode = [];
var keyDisable = false;
var KEYMAXCOUNT = 4;
var prevKey;
var selectKeyBox;
var keyCodes = 0;
var overapKey;
var key_focus = "false";
var key_string;
var tmp_keynum;
var KNC = "#" + lib.info.TextColor.GENERAL_MONEY.toString(16);
var KCS = "#" + lib.info.TextColor.GENERAL_EQUIPPED.toString(16);
var DSC = "#" + lib.info.TextColor.GENERAL_CRITICAL.toString(16);
var KEYGIDESTR = lib.util.UIString.getUIString("$231055","KeyColor1","#3fcbe4","KeyColor2","#3fcbe4");
var KEYGIDESTR2 = lib.util.UIString.getUIString("$083007");
var keyMapMessageFd = container_mc.keyMapMessageFd;
keyMapMessageFd.htmlText = KEYGIDESTR;
keyMapMessageFd.verticalAlign = "center";
var scrollcheck = false;
var listdata = new Array();
var str_data1 = lib.util.UIString.getUIString("$101068");
var str_data1_check = false;
var keytxt_str = lib.util.UIString.getUIString("$083012");
container_mc.keytxt.setText(keytxt_str);
var lineArray = [];
myListener.OnGame_SkillPath_SetList = function(teamList)
{
   teamList = lib.util.ExtString.split(teamList,"\n");
   var _loc7_ = teamList.length;
   teamListData = [];
   var _loc2_ = 0;
   while(_loc2_ < _loc7_)
   {
      teamListData[_loc2_] = [];
      var _loc4_ = lib.util.ExtString.split(teamList[_loc2_],"\t");
      var _loc5_ = _loc4_.length;
      var _loc1_ = 0;
      while(_loc1_ < _loc5_)
      {
         var _loc3_ = _loc4_[_loc1_];
         teamListData[_loc2_].push(_loc3_);
         _loc1_ = _loc1_ + 1;
      }
      _loc2_ = _loc2_ + 1;
   }
   keyMapMessageFd.htmlText = "<img src=\'icon_notice\' vspace=\'-2\'> " + KEYGIDESTR;
   KeyMapFunc();
   buildList(teamListData);
   ListScrollBar(true);
};
myListener.OnGame_SkillPath_Update = function(indexdata)
{
   listdata = new Array();
   listdata[0] = indexdata.split("\t");
   var _loc3_ = 0;
   while(_loc3_ < teamListData.length)
   {
      if(teamListData[_loc3_][0] == listdata[0][0])
      {
         teamListData[_loc3_][0] = listdata[0][0];
         teamListData[_loc3_][1] = listdata[0][1];
         teamListData[_loc3_][2] = listdata[0][2];
         teamListData[_loc3_][3] = listdata[0][3];
         teamListData[_loc3_][4] = listdata[0][4];
         teamListData[_loc3_][5] = listdata[0][5];
         teamListData[_loc3_][6] = listdata[0][6];
         teamListData[_loc3_][7] = listdata[0][7];
         teamListData[_loc3_][8] = listdata[0][8];
         lineMc = container_mc.teamListMc["line" + _loc3_];
         lineMc.index0 = listdata[0][0];
         lineMc.index3 = listdata[0][7];
         lineMc.index4 = listdata[0][8];
         lineMc.slot0index0 = listdata[0][1];
         lineMc.slot0index1 = listdata[0][2];
         lineMc.slot0index2 = listdata[0][3];
         lineMc.slot1index0 = listdata[0][4];
         lineMc.slot1index1 = listdata[0][5];
         lineMc.slot1index2 = listdata[0][6];
         var _loc6_ = "";
         if(_loc3_ > 9)
         {
            _loc6_ = "0" + String(_loc3_);
         }
         else if(_loc3_ < 10)
         {
            _loc6_ = "00" + String(_loc3_);
         }
         var _loc2_ = lineMc["SkillPath__" + _loc6_];
         _loc2_._x = 7.2;
         _loc2_._y = 6;
         var _loc4_ = lineMc["SkillPath__" + (_loc3_ + 100)];
         _loc4_._x = 220.2;
         _loc4_._y = 6;
         var _loc8_ = lineMc.slot0index1;
         var _loc9_ = lineMc.slot1index1;
         _loc2_.clear();
         _loc4_.clear();
         _loc2_.SLOT.enabled = false;
         _loc2_.slotnewbg._visible = true;
         _loc4_.slotnewbg._visible = false;
         lib.manager.ToolTip.remove(_loc2_.SLOT,lineMc.slot0index0);
         lib.manager.ToolTip.remove(_loc4_.SLOT,lineMc.slot0index0);
         lineMc.slot_txt1.verticalAlign = "top";
         lineMc.slot_txt2.verticalAlign = "top";
         if((lineMc.slot0index0 == "0" || lineMc.slot0index0 == undefined) && (lineMc.slot1index0 == "0" || lineMc.slot1index0 == undefined))
         {
            lineMc.slot_txt1.htmlText = "";
            lineMc.slot_txt2.htmlText = "";
            _loc2_.slotnewbg._visible = true;
            _loc4_.slotnewbg._visible = false;
         }
         else if((lineMc.slot0index0 != "0" || lineMc.slot0index0 != undefined) && (lineMc.slot1index0 == "0" || lineMc.slot1index0 == undefined))
         {
            lineMc.guideMc._visible = true;
            lineMc.guideMc.mc.guideFd.htmlText = "$083005";
            lineMc.guideMc.mc.gotoAndPlay(1);
            lineMc.slot_txt1.htmlText = lineMc.slot0index2;
            lineMc.slot_txt2.htmlText = "";
            _loc2_.draw(_loc8_);
            _loc2_.Slot.drag = false;
            _loc2_.display = true;
            _loc2_.SLOT.enabled = false;
            lineMc.gotoAndStop(2);
            lib.manager.ToolTip.add(_loc2_.SLOT,lineMc.slot0index0,6,_loc2_.Icon[lineMc.index0]);
            lineMc.slot_txt1.textColor = 7368816;
            _loc2_.slotnewbg._visible = true;
            _loc4_.slotnewbg._visible = false;
         }
         else if((lineMc.slot0index0 != "0" || lineMc.slot0index0 != undefined) && (lineMc.slot1index0 != "0" || lineMc.slot1index0 != undefined))
         {
            lineMc.guideMc._visible = false;
            lineMc.slot_txt1.htmlText = lineMc.slot0index2;
            lineMc.slot_txt2.htmlText = lineMc.slot1index2;
            _loc2_.draw(_loc8_);
            _loc2_.Slot.drag = false;
            _loc2_.display = true;
            _loc2_.SLOT.enabled = false;
            _loc4_.draw(_loc9_);
            _loc4_.SLOT.enabled = true;
            lineMc.gotoAndStop(1);
            lib.manager.ToolTip.add(_loc2_.SLOT,lineMc.slot0index0,6,_loc2_.Icon[lineMc.index0]);
            lib.manager.ToolTip.add(_loc4_.SLOT,lineMc.slot1index0,6,_loc4_.Icon[lineMc.index0]);
            lineMc.slot_txt1.textColor = 14145495;
            lineMc.slot_txt2.textColor = 14145495;
            _loc2_.slotnewbg._visible = true;
            _loc4_.slotnewbg._visible = true;
         }
         else
         {
            lineMc.guideMc._visible = false;
         }
         _loc2_.slotnewbg._visible = true;
         _loc4_.slotnewbg._visible = false;
         lineMc.checkBtn.onEnterFrame = function()
         {
            if(lineMc.checkBtn != undefined)
            {
               this.onEnterFrame = null;
               var _loc2_ = Number(this._parent.index3);
               var _loc3_ = this._parent.slot0index0;
               if(_loc2_ == 1)
               {
                  this.checked = true;
               }
               else if(_loc2_ == 0)
               {
                  this.checked = false;
               }
               else
               {
                  this._visible = false;
                  this._parent.checkBtn_mc._visible = false;
               }
               if(this._parent.guideMc._visible == false)
               {
                  this._visible = true;
                  this._parent.checkBtn_mc._visible = true;
               }
               else
               {
                  this._visible = false;
                  this._parent.checkBtn_mc._visible = false;
               }
            }
         };
         lineMc.timeMc.onEnterFrame = function()
         {
            if(lineMc.timeMc != undefined)
            {
               this.onEnterFrame = null;
               var _loc2_ = this._parent.index4;
               if(_loc2_ == "0" || _loc2_ == undefined || _loc2_ == null)
               {
                  this.txt.text = "";
                  this.txt2.text = "";
               }
               else
               {
                  this.txt.text = _loc2_ + "" + str_data1;
                  this.txt2.text = "";
               }
               if(this._parent.guideMc._visible == false)
               {
                  this._visible = true;
                  this._parent.time_mc._visible = true;
                  this._parent.time_mc._focus._visible = false;
               }
               else
               {
                  this._visible = false;
                  this._parent.time_mc._visible = false;
               }
            }
         };
      }
      _loc3_ = _loc3_ + 1;
   }
};
myListener.OnGame_SkillPath_Hotkey = function(keynum)
{
   var _loc2_ = lib.info.KeyMap.toKeyCode(keynum);
   if(_loc2_ == "")
   {
      if(container_mc.keyMc._focus._visible == true)
      {
         container_mc.keyMc._focus._visible = false;
         key_focus = "false";
         Selection.setFocus(null);
         ToGame_SkillPath_Hotkey("-1",tmp_keynum);
         keyMapMessageFd.htmlText = "<img src=\'icon_notice\' vspace=\'-2\'> " + KEYGIDESTR2;
         keyMapMessageFd.textColor = 10027008;
      }
   }
   else if(keynum == "13")
   {
      if(container_mc.keyMc._focus._visible == true)
      {
         container_mc.keyMc._focus._visible = false;
         key_focus = "false";
         Selection.setFocus(null);
         ToGame_SkillPath_Hotkey("0",tmp_keynum);
         keyMapMessageFd.htmlText = "<img src=\'icon_notice\' vspace=\'-2\'> " + KEYGIDESTR;
      }
   }
   else if(keynum == "27")
   {
      if(container_mc.keyMc._focus._visible == true)
      {
         container_mc.keyMc._focus._visible = false;
         key_focus = "false";
         Selection.setFocus(null);
         ToGame_SkillPath_Hotkey("-1",tmp_keynum);
         keyMapMessageFd.htmlText = "<img src=\'icon_notice\' vspace=\'-2\'> " + KEYGIDESTR;
      }
   }
   else
   {
      key_string = _loc2_;
      tmp_keynum = keynum;
      container_mc.keyMc.key0_txt.htmlText = key_string;
   }
};
myListener.OnGame_MouseDown = function(button, target)
{
   if(button == 1)
   {
      var delaynum = 0;
      container_mc.keyMc.onEnterFrame = null;
      container_mc.keyMc.onEnterFrame = function()
      {
         delaynum++;
         if(delaynum > 0)
         {
            if(container_mc.keyMc._focus._visible == true)
            {
               if(key_focus == "false")
               {
                  key_focus = "true";
                  var _loc1_ = container_mc.keyMc.key0_txt.length;
                  Selection.setSelection(_loc1_,_loc1_);
                  ToGame_SkillPath_Hotkey("1",key_string);
               }
            }
            else
            {
               key_focus = "false";
            }
            container_mc.keyMc.onEnterFrame = null;
         }
      };
   }
};
var x_btn = new lib.util.TxtBtn(container_mc.x_mc);
x_btn.setRelease(ToGame_SkillPath_CloseUI);
var init_btn = container_mc.txtBtn0.txtBtn;
init_btn.setRelease(ToGame_SkillPath_ReSet);
myListener.OnGame_SkillPath_UseCheck = function(changed)
{
   container_mc.checkBtn.checked = Boolean(Number(changed));
};
container_mc.checkBtn.onChanged = function(changed)
{
   ToGame_SkillPath_UseCheck(Number(changed));
};
ToGame_SkillPath_Init();
