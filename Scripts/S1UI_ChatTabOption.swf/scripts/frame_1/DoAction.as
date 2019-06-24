function setColorPickerPos()
{
   container_mc.colorPicker._y = container_mc.contents_mc._y - scrollBar.__get__scroll() * lineHeight + (selectChannelMc._parent._y + 7);
}
function clearList()
{
   listArray = [];
   renderers = [];
   for(var _loc1_ in listContainer)
   {
      if(typeof listContainer[_loc1_] == "movieclip")
      {
         listContainer[_loc1_].removeMovieClip();
      }
   }
}
function invalidateList()
{
   if(invalidationIntervalID)
   {
      return undefined;
   }
   invalidationIntervalID = setInterval(this,"validateList",1);
}
function validateList()
{
   clearInterval(invalidationIntervalID);
   delete invalidationIntervalID;
   commitListDatas();
}
function commitListDatas()
{
   var _loc6_ = renderers.length;
   var _loc3_ = 0;
   while(_loc3_ < _loc6_)
   {
      var _loc2_ = renderers[_loc3_];
      var _loc4_ = listDatas[_loc3_];
      _loc2_.validateNow();
      _loc2_.id = Number(_loc4_[1]);
      if(_loc4_[2])
      {
         _loc2_.onEnterFrame = function()
         {
            checked = true;
            delete this.onEnterFrame;
         };
      }
      _loc2_.txt.textAutoSize = "shrink";
      _loc2_.txt.text = _loc4_[3];
      var _loc5_ = new Color(_loc2_.channelColor_mc.colorBox);
      _loc5_.setRGB(Number(_loc4_[4]));
      _loc3_ = _loc3_ + 1;
   }
}
function setAutoSelect(type, checked)
{
   autoSelectNum = autoSelectNum + (!Boolean(checked)?-1:1);
   autoSelectNum = Math.min(2,autoSelectNum);
   autoSelectNum = Math.max(0,autoSelectNum);
   if(autoSelectNum < 0)
   {
      autoSelectNum = 0;
   }
   enableAutoSelect(autoSelectNum > 0);
}
function enableSelectChannel(enable)
{
   if(enable)
   {
      container_mc.channelSelect.setEnabled(true);
      container_mc.txtSelectChannel.textColor = 15066597;
   }
   else
   {
      container_mc.channelSelect.checked = false;
      container_mc.channelSelect.setEnabled(false);
      container_mc.txtSelectChannel.textColor = 9211020;
   }
}
function enableAutoSelect(enable)
{
   if(enable)
   {
      lib.manager.ToolTip.remove(container_mc.autoSelect);
      container_mc.autoSelect.setEnabled(true);
      container_mc.txtAutoSelect.textColor = 15066597;
   }
   else
   {
      lib.manager.ToolTip.add(container_mc.autoSelect,lib.util.UIString.getUIString("$031090"),1);
      container_mc.autoSelect.checked = false;
      container_mc.autoSelect.setEnabled(false);
      container_mc.txtAutoSelect.textColor = 9211020;
   }
}
function loadAutoSelectByClient()
{
   container_mc.autoSelect.checked = savedAutoSelect;
}
function ToGame_ChatTabOption_Init()
{
   fscommand("ToGame_ChatTabOption_Init");
}
function ToGame_ChatTabOption_CloseUI()
{
   fscommand("ToGame_ChatTabOption_CloseUI");
}
function ToGame_ChatTabOption_CreatePrivateChannel()
{
   lib.Debuger.trace("ToGame_ChatTabOption_CreatePrivateChannel");
   fscommand("ToGame_ChatTabOption_CreatePrivateChannel");
}
function ToGame_ChatTabOption_ManagePrivateChannel(id)
{
   lib.Debuger.trace("ToGame_ChatTabOption_ManagePrivateChannel - " + id);
   getURL("FSCommand:ToGame_ChatTabOption_ManagePrivateChannel",id);
}
function ToGame_ChatTabOption_ExitPrivateChannel(id)
{
   lib.Debuger.trace("ToGame_ChatTabOption_ExitPrivateChannel - " + id);
   getURL("FSCommand:ToGame_ChatTabOption_ExitPrivateChannel",id);
}
function apply()
{
   ToGame_ChatTabOption_SendTabInfo();
   ToGame_ChatTabOption_SendChannelInfo();
}
function confirm()
{
   apply_btn.setEnabled(false);
   ToGame_ChatTabOption_SendTabInfo();
   ToGame_ChatTabOption_SendChannelInfo();
   ToGame_ChatTabOption_CloseUI();
}
function ToGame_ChatTabOption_SendTabInfo()
{
   var _loc4_ = tabName_txt.__get__text();
   var _loc1_ = container_mc.optionAlpha.v;
   var _loc7_ = container_mc.optionFontSize.v;
   var _loc2_ = !container_mc.channelSelect.checked?0:1;
   var _loc5_ = container_mc.selectedChannel.selectedIndex;
   var _loc3_ = !container_mc.autoSelect.checked?0:1;
   var _loc6_ = _loc4_ + "\t" + _loc7_ + "\t" + _loc1_ + "\t" + _loc2_ + "\t" + _loc5_ + "\t" + _loc3_;
   getURL("FSCommand:ToGame_ChatTabOption_SendTabInfo",_loc6_);
}
function ToGame_ChatTabOption_SendChannelInfo()
{
   var _loc8_ = "";
   var _loc7_ = "";
   var _loc2_ = 0;
   while(_loc2_ < listArray.length)
   {
      var _loc4_ = listArray[_loc2_];
      var _loc3_ = listContainer["line_" + _loc4_];
      var _loc6_ = Number(_loc3_.radio_btn.checked);
      var _loc5_ = new Color(_loc3_.channelColor_mc.colorBox);
      var _loc1_ = _loc5_.getRGB().toString(16);
      _loc1_ = "0x" + _loc1_;
      _loc7_ = _loc4_ + "\t" + _loc6_ + "\t" + _loc1_ + "\t\n";
      _loc8_ = _loc8_ + _loc7_;
      _loc2_ = _loc2_ + 1;
   }
   getURL("FSCommand:ToGame_ChatTabOption_SendChannelInfo",_loc8_);
}
function comboBoxWork(target, dataList)
{
   var _loc2_ = lib.util.ExtString.split(dataList,"\t");
   var _loc3_ = Number(_loc2_.pop());
   var _loc5_ = target.active;
   target.active = true;
   Debug.log("#### : " + _loc2_);
   target.data = _loc2_;
   if(!isNaN(_loc3_))
   {
      target.defV = target.selectedIndex = _loc3_;
   }
   else
   {
      target.defV = target.selectedIndex = 0;
   }
   var _loc4_ = {};
   _loc4_.onChanged = function(target, id, index)
   {
      target.defV = index;
   };
   target.addListener(_loc4_);
   target.active = _loc5_;
}
function ToGame_ChatTabOption_ChannelChecked(chatType, checked)
{
   getURL("FSCommand:ToGame_ChatTabOption_ChannelChecked",chatType + "\t" + (!checked?0:1));
   lib.Debuger.trace("ToGame_ChatTabOption_ChannelChecked : " + chatType + "\t" + checked);
}
var UI = this;
UI._visible = false;
var UIname = "ChatTabOption";
this.bWindowOpen = false;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
var listContainer = container_mc.contents_mc.content_mc.listContainer;
container_mc.title_txt.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
container_mc.explain_0.textColor = lib.info.TextColor.INPUT_LABEL;
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
var tabName_txt = new lib.util.ExtTextField(container_mc.tabName_txt,0,container_mc.tabName_focus);
tabName_txt.onChanged = function()
{
   apply_btn.setEnabled(true);
};
tabName_txt.onEnterKey = function()
{
   Selection.setFocus(null);
};
lib.manager.Focus.addFocusGroup(UIname,1,[tabName_txt,container_mc.optionFontSize.valueMc.txt,container_mc.optionAlpha.valueMc.txt]);
var colorTable = [["ff0000","ffff00","00ff00","00ffff","0000ff","ff00ff","ffffff","ebebeb","e1e1e1","d7d7d7","cccccc","c1c1c1","b6b6b6","ababab","9f9f9f","949494"],["ed1b23","fff200","00a550","00adef","2d3091","ec008b","888888","7c7c7c","6f6f6f","616161","545454","454545","353535","252525","111111","000000"],["f79679","f9ac80","fdc589","fff799","c3df9a","a1d39b","81ca9c","7acdc8","6dcff6","7da6d8","8392ca","8781bd","a086bd","bb8c8e","f499c1","f6979c"],["f26b4e","f68d54","FBAE5B","FFF466","ABD371","7BC475","3AB777","19BAB3","00BEF3","428BCA","5473B8","5F5BA7","845EA7","A662A7","F06DA8","F26C7C"],["ED1B23","F26421","F7931C","FFF200","8CC73E","38B449","00A550","00A89C","00ADEF","0071BB","0053A5","2D3091","652C90","91268E","EC008B","ED135A"],["9D0B0F","9F400D","A26109","AA9F00","588426","197A2F","007135","00736A","0075A2","004A7F","003370","1A1363","430E61","62045F","9D005C","9D0038"],["780000","7A2D00","7C4800","817A00","3F6517","005D1F","005725","005851","005A7E","003562","002056","0D004B","31004A","4A0048","7A0045","790025"]];
var selecterSize = 15;
var colorPickerX = 0;
var colorPickerY = 0;
var selectColor = null;
var selectChannelMc = null;
container_mc.colorPicker._visible = false;
container_mc.colorPicker.selecter.onRelease = function()
{
   selectColor = "0x" + colorTable[colorPickerY][colorPickerX];
   selectChannelMc.channelColor = selectColor;
   container_mc.colorPicker._visible = false;
   var _loc1_ = new Color(selectChannelMc.colorBox);
   _loc1_.setRGB(selectColor);
   delete container_mc.colorPicker.onEnterFrame;
   selectChannelMc = null;
   apply_btn.setEnabled(true);
};
container_mc.autoChannel.titleFd.text = lib.util.UIString.getUIString("$032023");
var alphaAdjustStr = lib.util.UIString.getUIString("$032017");
var textAdjustStr = lib.util.UIString.getUIString("$032011");
container_mc.optionAlpha.setData(0,"0%",100,"100%",50);
container_mc.optionAlpha.title = alphaAdjustStr;
container_mc.optionAlpha.onChanged = function(value, obj)
{
   this.v = value;
   apply_btn.setEnabled(true);
   var _loc2_ = 0;
   if(value >= 25)
   {
      _loc2_ = value - 25;
   }
   else
   {
      _loc2_ = 0;
   }
   container_mc.optionAlpha2.setData(0,"0%",100,"100%",_loc2_);
   container_mc.optionAlpha2.v = _loc2_;
};
container_mc.disabler.useHandCursor = false;
container_mc.optionAlpha2.setData(0,"0%",100,"100%",25);
container_mc.optionAlpha2.title = lib.util.UIString.getUIString("$032018");
container_mc.optionAlpha2.enabled = false;
container_mc.optionAlpha2._alpha = 50;
container_mc.optionFontSize.setData(50,"50%",200,"200%",100);
container_mc.optionFontSize.title = textAdjustStr;
container_mc.optionFontSize.onChanged = function(value, obj)
{
   this.v = String(value).substr(0,4);
   apply_btn.setEnabled(true);
};
var list = container_mc.contents_mc.content_mc;
var scrollBar;
var LISTROWS = 19;
var ROWSPACE = 0;
var lineHeight = 30;
var contentsHeight = container_mc.contents_mc.mask_mc._height;
scrollBar = container_mc.scrollbar;
scrollBar.addListener(list);
list.onScroll = function()
{
   this._y = - arguments[0];
};
scrollBar.setWheel(list);
scrollBar.__set__pageSize(container_mc.contents_mc.content_mc._height);
scrollBar.__set__displaySize(contentsHeight);
scrollBar.__set__rowHeight(lineHeight + ROWSPACE);
myListener.OnGame_MouseDown = function(button, target)
{
   if(container_mc.colorPicker._visible)
   {
      if(target != container_mc.colorPicker.selecter && target != selectChannelMc)
      {
         container_mc.colorPicker._visible = false;
         selectChannelMc = null;
      }
   }
};
myListener.OnGame_ChatTabOption_SetTabInfo = function(tabName, tabAlpha, fontSize)
{
   tabAlpha = Number(tabAlpha);
   fontSize = Number(fontSize);
   tabName_txt.__set__text(tabName);
   container_mc.optionAlpha.setData(0,"0%",100,"100%",tabAlpha);
   container_mc.optionAlpha.v = tabAlpha;
   container_mc.optionFontSize.setData(50,"50%",200,"200%",fontSize);
   container_mc.optionFontSize.v = fontSize;
   var _loc2_ = 0;
   if(tabAlpha >= 25)
   {
      _loc2_ = tabAlpha - 25;
   }
   else
   {
      _loc2_ = 0;
   }
   container_mc.optionAlpha2.setData(0,"0%",100,"100%",_loc2_);
   container_mc.optionAlpha2.v = _loc2_;
};
var listArray = new Array();
myListener.OnGame_ChatTabOption_setList = function(listData)
{
   clearList();
   var _loc19_ = lib.util.ExtString.split(listData,"\n");
   var _loc9_ = 0;
   var _loc6_ = 0;
   while(_loc6_ < _loc19_.length)
   {
      var _loc3_ = lib.util.ExtString.split(_loc19_[_loc6_],"\t");
      var _loc4_ = Number(_loc3_[0]);
      var _loc13_ = Number(_loc3_[1]);
      var _loc2_ = null;
      if(_loc4_ == 0 || _loc4_ == 2)
      {
         _loc2_ = listContainer.attachMovie("titleMc","title_" + _loc6_,listContainer.getNextHighestDepth());
         var _loc12_ = _loc3_[1];
         _loc2_.titleFd.text = _loc12_;
         _loc2_._y = _loc9_;
         _loc9_ = _loc2_._y + 32;
         _loc2_.privateChannelBtn._visible = _loc4_ == 2;
         if(_loc4_ == 2)
         {
            lib.manager.ToolTip.add(_loc2_.privateChannelBtn,lib.util.UIString.getUIString("$031091"),1);
            _loc2_.privateChannelBtn._x = _loc2_.titleFd.textWidth + 25;
            _loc2_.onEnterFrame = function()
            {
               delete this.onEnterFrame;
               var _loc2_ = this.privateChannelBtn.txtBtn;
               _loc2_.btn.onRelease2 = function()
               {
                  ToGame_ChatTabOption_CreatePrivateChannel();
               };
            };
         }
      }
      else if(_loc4_ == 1)
      {
         var _loc18_ = Number(_loc3_[2]);
         var _loc11_ = _loc3_[3];
         var _loc20_ = _loc3_[4];
         var _loc5_ = _loc3_[5];
         _loc2_ = listContainer.attachMovie("depth2","line_" + _loc13_,listContainer.getNextHighestDepth());
         _loc2_.id = _loc13_;
         _loc2_._y = _loc9_;
         _loc9_ = _loc2_._y + 30;
         _loc2_.txt.textAutoSize = "shrink";
         _loc2_.txt.text = _loc11_;
         _loc2_.chatType = _loc13_;
         _loc2_.checked = _loc18_;
         var _loc17_ = new Color(_loc2_.channelColor_mc.colorBox);
         var _loc10_ = Number(_loc3_[4]);
         _loc17_.setRGB(_loc10_);
         _loc2_.btn0._visible = _loc2_.btn1._visible = _loc5_ == 1;
         _loc2_.isPrivateChannel = _loc5_ == 1;
         _loc2_.channelColor_mc.onRelease = function()
         {
            if(selectChannelMc == this)
            {
               container_mc.colorPicker._visible = false;
               selectChannelMc = null;
               return undefined;
            }
            container_mc.colorPicker._visible = true;
            selectChannelMc = this;
            setColorPickerPos();
            if(container_mc.colorPicker._visible)
            {
               container_mc.colorPicker.onEnterFrame = function()
               {
                  var _loc3_ = this._xmouse;
                  var _loc2_ = this._ymouse;
                  if(0 <= _loc3_ && 0 <= _loc2_ && _loc3_ <= 240 && _loc2_ <= 105)
                  {
                     colorPickerX = Math.floor(_loc3_ / selecterSize);
                     colorPickerY = Math.floor(_loc2_ / selecterSize);
                     this.selecter._x = colorPickerX * selecterSize;
                     this.selecter._y = colorPickerY * selecterSize;
                  }
               };
            }
            else
            {
               delete container_mc.colorPicker.onEnterFrame;
            }
         };
         _loc2_.radio_btn.onChanged = function()
         {
            lib.Debuger.trace("clicked option name : " + this._parent._name);
            if(this._parent._name == "line_215" && Boolean(this.checked))
            {
               listContainer.line_20.radio_btn.checked = false;
            }
            else if(this._parent._name == "line_20" && Boolean(this.checked))
            {
               listContainer.line_215.radio_btn.checked = false;
            }
            if(this._parent._name == "line_1")
            {
               setAutoSelect("party",this.checked);
            }
            else if(this._parent._name == "line_32")
            {
               setAutoSelect("raid",this.checked);
            }
            apply_btn.setEnabled(true);
            ToGame_ChatTabOption_ChannelChecked(this._parent.chatType,this.checked);
         };
         if(_loc5_ != 1)
         {
            _loc2_.hit.onRollOver = function()
            {
               this._parent.radio_btn.onRollOver();
               this._parent.effect_mc.gotoAndStop(2);
            };
            _loc2_.hit.onRollOut = function()
            {
               this._parent.radio_btn.onRollOut();
               this._parent.effect_mc.gotoAndStop(1);
            };
            _loc2_.hit.onReleaseOutside = function()
            {
               this._parent.radio_btn.onRollOut();
               this._parent.effect_mc.gotoAndStop(1);
            };
            _loc2_.hit.onRelease = function()
            {
               this._parent.radio_btn.onRelease();
            };
         }
         listArray.push(_loc13_);
      }
      _loc6_ = _loc6_ + 1;
   }
   var _loc21_ = scrollBar.__get__scroll();
   lib.Debuger.trace("scrollbar : " + scrollBar);
   lib.Debuger.trace("scrollbar.scroll : " + scrollBar.__get__scroll());
   lib.Debuger.trace("previousScroll : " + _loc21_);
   scrollBar.__set__pageSize(container_mc.contents_mc.content_mc._height);
   if(_loc21_ && _loc21_ > 0)
   {
      scrollBar.__set__scroll(_loc21_);
   }
   _loc2_.onEnterFrame = function()
   {
      delete this.onEnterFrame;
      var _loc3_ = 0;
      while(_loc3_ < listArray.length)
      {
         var _loc4_ = listArray[_loc3_];
         var _loc2_ = listContainer["line_" + _loc4_];
         if(_loc2_._name == "line_1")
         {
            setAutoSelect("party",_loc2_.checked);
         }
         else if(_loc2_._name == "line_32")
         {
            setAutoSelect("raid",_loc2_.checked);
         }
         _loc2_.radio_btn.checked = _loc2_.checked;
         if(_loc2_.isPrivateChannel)
         {
            var _loc6_ = _loc2_.btn0.txtBtn;
            _loc6_.btn.onRelease2 = function()
            {
               ToGame_ChatTabOption_ManagePrivateChannel(this._parent._parent.id);
            };
            var _loc5_ = _loc2_.btn1.txtBtn;
            _loc5_.btn.onRelease2 = function()
            {
               ToGame_ChatTabOption_ExitPrivateChannel(this._parent._parent.id);
            };
         }
         _loc3_ = _loc3_ + 1;
      }
      loadAutoSelectByClient();
   };
};
var listDatas = [];
var renderers = [];
var invalidationIntervalID;
container_mc.txtSelectChannel.text = lib.util.UIString.getUIString("$031088");
container_mc.txtAutoSelect.text = lib.util.UIString.getUIString("$031089");
var autoSelectNum = 0;
enableAutoSelect(false);
var savedAutoSelect = false;
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
         container_mc.colorPicker._visible = false;
         selectChannelMc = null;
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
container_mc.channelSelect.onChecked = function(checked)
{
   container_mc.selectedChannel.setEnabled(checked);
};
myListener.OnGame_ChatTabOption_SetSelectChannels = function(channelSelected, channels, isEnable)
{
   container_mc.channelSelect.checked = Boolean(channelSelected);
   comboBoxWork(container_mc.selectedChannel,channels);
   enableSelectChannel(Boolean(isEnable));
};
myListener.OnGame_ChatTabOption_SetAutoSelect = function(isSelected)
{
   savedAutoSelect = Boolean(isSelected);
   container_mc.autoSelect.checked = Boolean(isSelected);
};
var apply_btn = container_mc.txtBtn0.txtBtn;
var confirm_btn = container_mc.txtBtn1.txtBtn;
var x_btn = new lib.util.TxtBtn(container_mc.x_mc);
apply_btn.setEnabled(false);
close_btn.setRelease(aa = function()
{
   ToGame_ChatTabOption_CloseUI();
});
x_btn.setRelease(bb = function()
{
   ToGame_ChatTabOption_CloseUI();
});
apply_btn.setRelease(apply);
confirm_btn.setRelease(confirm);
ToGame_ChatTabOption_Init();
