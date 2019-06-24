function ToGame_ItemDyeing_Init()
{
   fscommand("ToGame_ItemDyeing_Init");
   lib.Debuger.trace("ToGame_ItemDyeing_Init");
}
function ToGame_ItemDyeing_CloseUI()
{
   fscommand("ToGame_ItemDyeing_CloseUI");
   lib.Debuger.trace("ToGame_ItemDyeing_CloseUI");
}
function ToGame_ItemDyeing_ChangeColor()
{
   var _loc2_ = container_mc.sliderR.currentV;
   var _loc4_ = container_mc.sliderG.currentV;
   var _loc1_ = container_mc.sliderB.currentV;
   var _loc3_ = container_mc.sliderL.currentV;
   getURL("FSCommand:ToGame_ItemDyeing_ChangeColor",_loc2_ + "\t" + _loc4_ + "\t" + _loc1_ + "\t" + _loc3_);
   lib.Debuger.trace("ToGame_ItemDyeing_ChangeColor    " + _loc2_ + "\t" + _loc4_ + "\t" + _loc1_ + "\t" + _loc3_);
}
function ToGame_ItemDyeing_RequestChange()
{
   fscommand("ToGame_ItemDyeing_RequestChange");
   lib.Debuger.trace("ToGame_ItemDyeing_RequestChange");
}
function ToGame_ItemDyeing_RequestPreView()
{
   fscommand("ToGame_ItemDyeing_RequestPreView");
   lib.Debuger.trace("ToGame_ItemDyeing_RequestPreView");
}
function ToGame_ItemDyeing_RightClick(index)
{
   getURL("FSCommand:ToGame_ItemDyeing_RightClick",index);
   lib.Debuger.trace("ToGame_ItemDyeing_RightClick  " + index);
}
function setMode(_mode)
{
   if(_mode == undefined)
   {
      return undefined;
   }
   var _loc3_ = 0;
   while(_loc3_ < COLORCOUNT)
   {
      var _loc2_ = container_mc["colorSlot" + _loc3_];
      _loc2_.index = _loc3_;
      _loc2_.colorMc._visible = false;
      _loc2_.overMc._visible = false;
      _loc2_.releaseMc._visible = false;
      if(_loc3_ < colorTotals)
      {
         _loc2_.enabled = true;
         lib.manager.ToolTip.add(_loc2_,TOOLTIP_MODE[_mode],1);
         _loc2_.colorMc._visible = true;
         _loc2_.gotoAndStop(1);
      }
      else
      {
         _loc2_.enabled = false;
         _loc2_.gotoAndStop(4);
      }
      _loc2_.onRelease = function()
      {
         lib.manager.UISound.play(lib.manager.UISound.MAIN_BTN);
         selectColor(this.index);
      };
      _loc2_.onRollOver = function()
      {
         if(slectedColor != this.index)
         {
            this.overMc._visible = true;
         }
      };
      _loc2_.onRollOut = _loc2_.onReleaseOutside = function()
      {
         if(slectedColor != this.index)
         {
            this.overMc._visible = false;
         }
      };
      _loc3_ = _loc3_ + 1;
   }
   var _loc5_ = _mode == 2;
   container_mc.sliderR._visible = _loc5_;
   container_mc.sliderG._visible = _loc5_;
   container_mc.sliderB._visible = _loc5_;
   container_mc.sliderL._visible = _loc5_;
   if(_loc5_)
   {
      lib.manager.ToolTip.add(container_mc.sliderR,TOOLTIP_MODE[_mode],1);
      lib.manager.ToolTip.add(container_mc.sliderG,TOOLTIP_MODE[_mode],1);
      lib.manager.ToolTip.add(container_mc.sliderB,TOOLTIP_MODE[_mode],1);
      lib.manager.ToolTip.add(container_mc.sliderL,TOOLTIP_MODE[_mode],1);
   }
}
function clearDyeing()
{
   colorTotals = 0;
   dyeingMode = undefined;
   colorDatas = [];
   container_mc.nameFd.setText("$440029");
   container_mc.timeFd.setText("");
   container_mc.nameFd._y = 212;
   container_mc.nameFd.textColor = lib.info.TextColor.GENERAL_EXPLAIN_DETAIL;
   container_mc.sliderR._visible = false;
   container_mc.sliderG._visible = false;
   container_mc.sliderB._visible = false;
   container_mc.sliderL._visible = false;
   container_mc.slideDisableMc._visible = false;
   lib.manager.ToolTip.remove(container_mc.sliderR);
   lib.manager.ToolTip.remove(container_mc.sliderG);
   lib.manager.ToolTip.remove(container_mc.sliderB);
   lib.manager.ToolTip.remove(container_mc.sliderL);
   container_mc.ItemDyeing__1.clear();
   lib.manager.ToolTip.remove(container_mc.ItemDyeing__1.SLOT);
   var _loc2_ = 0;
   while(_loc2_ < COLORCOUNT)
   {
      var _loc1_ = container_mc["colorSlot" + _loc2_];
      _loc1_.colorMc._visible = false;
      _loc1_.activeMc.gotoAndStop(1);
      _loc1_.overMc._visible = false;
      _loc1_.releaseMc._visible = false;
      _loc1_.gotoAndStop(4);
      _loc1_.enabled = false;
      lib.manager.ToolTip.remove(_loc1_);
      _loc2_ = _loc2_ + 1;
   }
   change_btn.setEnabled(false);
   selectColor();
}
function itemClear()
{
   selectColor();
   container_mc.explain_1.setText(lib.util.UIString.getUIString("$440031"));
   container_mc.explain_1.textColor = lib.info.TextColor.GENERAL_EXPLAIN_DETAIL;
   container_mc.ItemDyeing__0.clear();
   lib.manager.ToolTip.remove(container_mc.ItemDyeing__0.SLOT);
   haveItem = false;
   change_btn.setEnabled(false);
}
function selectColor(index)
{
   if(index == undefined)
   {
      container_mc["colorSlot" + slectedColor].gotoAndStop(1);
      container_mc["colorSlot" + slectedColor].activeMc.gotoAndStop(1);
      container_mc["colorSlot" + slectedColor].releaseMc._visible = false;
      slectedColor = undefined;
      container_mc.sliderR.setData(0,0,1,1,0);
      container_mc.sliderG.setData(0,0,1,1,0);
      container_mc.sliderB.setData(0,0,1,1,0);
      container_mc.sliderL.setData(0,0,1,1,0);
      container_mc.sliderR.valueMc.txt.selectable = false;
      container_mc.sliderG.valueMc.txt.selectable = false;
      container_mc.sliderB.valueMc.txt.selectable = false;
      container_mc.sliderL.valueMc.txt.selectable = false;
      container_mc.sliderR.active = false;
      container_mc.sliderG.active = false;
      container_mc.sliderB.active = false;
      container_mc.sliderL.active = false;
      return undefined;
   }
   if(!haveItem)
   {
      return undefined;
   }
   container_mc.sliderR.valueMc.txt.selectable = true;
   container_mc.sliderG.valueMc.txt.selectable = true;
   container_mc.sliderB.valueMc.txt.selectable = true;
   container_mc.sliderL.valueMc.txt.selectable = true;
   if(slectedColor != index)
   {
      container_mc["colorSlot" + slectedColor].gotoAndStop(1);
      container_mc["colorSlot" + slectedColor].activeMc.gotoAndStop(1);
      container_mc["colorSlot" + slectedColor].releaseMc._visible = false;
      container_mc["colorSlot" + index].gotoAndStop(3);
      container_mc["colorSlot" + index].activeMc.gotoAndPlay(2);
      container_mc["colorSlot" + index].releaseMc._visible = true;
      container_mc["colorSlot" + index].overMc._visible = false;
   }
   slectedColor = index;
   container_mc.sliderR.active = true;
   container_mc.sliderG.active = true;
   container_mc.sliderB.active = true;
   container_mc.sliderL.active = true;
   container_mc.sliderR.setData(sliderMinMax[0][0],sliderMinMax[0][0],sliderMinMax[0][1],sliderMinMax[0][1],colorDatas[slectedColor][0]);
   container_mc.sliderG.setData(sliderMinMax[1][0],sliderMinMax[1][0],sliderMinMax[1][1],sliderMinMax[1][1],colorDatas[slectedColor][1]);
   container_mc.sliderB.setData(sliderMinMax[2][0],sliderMinMax[2][0],sliderMinMax[2][1],sliderMinMax[2][1],colorDatas[slectedColor][2]);
   container_mc.sliderL.setData(sliderMinMax[3][0],sliderMinMax[3][0],sliderMinMax[3][1],sliderMinMax[3][1],colorDatas[slectedColor][3]);
   change_btn.setEnabled(haveItem);
   ToGame_ItemDyeing_ChangeColor();
}
var UI = this;
UI._visible = false;
var UIname = "ItemDyeing";
var GRADE_STR = lib.util.UIString.getUIString("$440005");
var TIME_STR = lib.util.UIString.getUIString("$440006");
var MODE_STR = lib.util.UIString.getUIString("$440007");
var TOOLTIP_MODE = ["$440018","$440019","$440020"];
container_mc.RLb.text = "$440010";
container_mc.GLb.text = "$440011";
container_mc.BLb.text = "$440012";
container_mc.LLb.text = "$440013";
var COLORCOUNT = 18;
var colorTotals = 0;
var dyeingMode;
var colorDatas = [];
var slectedColor;
var sliderMinMax = [];
sliderMinMax[0] = [25,255];
sliderMinMax[1] = [25,255];
sliderMinMax[2] = [25,255];
sliderMinMax[3] = [25,255];
var haveItem = false;
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
container_mc.text_name.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
container_mc.explain_0.textColor = lib.info.TextColor.GENERAL_EXPLAIN;
container_mc.explain_1.textColor = lib.info.TextColor.GENERAL_EXPLAIN_DETAIL;
container_mc.guidLb.textColor = lib.info.TextColor.GENERAL_NOTICE;
container_mc.explain_1.textAutoSize = "shrink";
container_mc.guidLb.textAutoSize = "shrink";
container_mc.guidLb.htmlText = "<img src=\'icon_notice\' vspace=\'-1\'> " + lib.util.UIString.getUIString("$440008");
lib.manager.Focus.addFocusGroup(UIname,1,[container_mc.sliderR.valueMc.txt,container_mc.sliderG.valueMc.txt,container_mc.sliderB.valueMc.txt,container_mc.sliderL.valueMc.txt]);
var slotNamePrefix = "ItemDyeing__";
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
myListener.OnGame_ItemDyeing_SetMode = function(img, __name, timeStr, _mode, dyeingGrade)
{
   var _loc1_ = "";
   clearDyeing();
   if(__name == undefined || __name == "")
   {
      return undefined;
   }
   dyeingMode = Number(_mode);
   container_mc.ItemDyeing__1.draw(img);
   if(dyeingGrade != undefined)
   {
      container_mc.ItemDyeing__1.grade = Number(dyeingGrade);
   }
   lib.manager.ToolTip.add(container_mc.ItemDyeing__1.SLOT,1,6);
   if(dyeingMode == 0)
   {
      _loc1_ = lib.util.UIString.getUIString("$440015");
   }
   else if(dyeingMode == 1)
   {
      _loc1_ = lib.util.UIString.getUIString("$440016");
   }
   else if(_mode == 2)
   {
      _loc1_ = lib.util.UIString.getUIString("$440017");
   }
   container_mc.nameFd.setText(__name);
   container_mc.timeFd.setText(timeStr + " / " + _loc1_);
   container_mc.nameFd._y = 199;
   container_mc.nameFd.textColor = lib.info.TextColor.GENERAL_CONTENTS;
   setMode(dyeingMode);
   container_mc.sliderR.bg_mc._width = 352.1;
   container_mc.sliderG.bg_mc._width = 352.1;
   container_mc.sliderB.bg_mc._width = 352.1;
   container_mc.sliderL.bg_mc._width = 352.1;
   container_mc.sliderR.valueMc._x = 380.4;
   container_mc.sliderG.valueMc._x = 380.4;
   container_mc.sliderB.valueMc._x = 380.4;
   container_mc.sliderL.valueMc._x = 380.4;
};
myListener.OnGame_ItemDyeing_SetPalette = function(_colorDatas)
{
   var _loc12_ = lib.util.ExtString.split(_colorDatas,"\n");
   colorTotals = _loc12_.length;
   var _loc1_ = 0;
   while(_loc1_ < colorTotals)
   {
      lib.Debuger.trace("colors[i]   " + _loc12_[_loc1_]);
      var _loc2_ = lib.util.ExtString.split(_loc12_[_loc1_],"\t");
      lib.Debuger.trace("color   " + _loc2_);
      var _loc5_ = Number(_loc2_[0]);
      var _loc6_ = Number(_loc2_[1]);
      var _loc4_ = Number(_loc2_[2]);
      var _loc9_ = Number(_loc2_[3]);
      colorDatas[_loc1_] = [_loc5_,_loc6_,_loc4_,_loc9_];
      var _loc3_ = new flash.geom.ColorTransform(1,1,1,1,_loc5_,_loc6_,_loc4_,0);
      var _loc8_ = container_mc["colorSlot" + _loc1_].colorMc;
      var _loc10_ = container_mc["colorSlot" + _loc1_].activeMc;
      var _loc7_ = container_mc["colorSlot" + _loc1_].overMc;
      var _loc11_ = container_mc["colorSlot" + _loc1_].releaseMc;
      lib.info.ColorTrans.setTrans(_loc7_,_loc3_);
      lib.info.ColorTrans.setTrans(_loc11_,_loc3_);
      lib.info.ColorTrans.setTrans(_loc10_,_loc3_);
      lib.info.ColorTrans.setTrans(_loc8_,_loc3_);
      _loc1_ = _loc1_ + 1;
   }
   setMode(dyeingMode);
};
myListener.OnGame_ItemDyeing_SetGageMinMax = function(colorIndex, min, max)
{
   colorIndex = Number(colorIndex);
   min = Number(min);
   max = Number(max);
   sliderMinMax[colorIndex] = [min,max];
};
myListener.OnGame_ItemDyeing_SetItem = function(item)
{
   itemClear();
   var _loc1_ = lib.util.ExtString.split(item,"\t");
   if(_loc1_[0] == undefined || _loc1_[0] == "")
   {
      return undefined;
   }
   haveItem = true;
   container_mc.ItemDyeing__0.draw(_loc1_[0]);
   container_mc.ItemDyeing__0.grade = _loc1_[1];
   container_mc.ItemDyeing__0.sealType = _loc1_[2];
   container_mc.ItemDyeing__0.masterpiece = _loc1_[3];
   if(_loc1_[4] != undefined)
   {
      container_mc.explain_1.text = _loc1_[4];
   }
   else
   {
      container_mc.explain_1.text = "";
   }
   container_mc.explain_1.textColor = lib.info.TextColor["RAREGRADE" + Number(_loc1_[1])];
   lib.manager.ToolTip.add(container_mc.ItemDyeing__0.SLOT,0,6);
   if(dyeingMode == 0)
   {
      change_btn.setEnabled(true);
   }
};
myListener.OnGame_ItemDyeing_SetEnable = function(enable)
{
   enable = Number(enable);
   change_btn.setEnabled(enable && haveItem);
   container_mc.sliderR.active = enable;
   container_mc.sliderG.active = enable;
   container_mc.sliderB.active = enable;
   container_mc.sliderL.active = enable;
   container_mc.slideDisableMc._visible = !enable;
   var _loc2_ = 0;
   while(_loc2_ < COLORCOUNT)
   {
      var _loc1_ = container_mc["colorSlot" + _loc2_];
      if(enable)
      {
         if(_loc1_._currentframe != 4)
         {
            _loc1_.enabled = true;
         }
      }
      else
      {
         _loc1_.enabled = false;
      }
      _loc2_ = _loc2_ + 1;
   }
   container_mc.ItemDyeing__0.drag = enable;
};
myListener.OnGame_ItemDyeing_SetPreViewState = function(_state)
{
   _state = Number(_state);
   if(_state)
   {
      preview_btn.setText("$440030");
   }
   else
   {
      preview_btn.setText("$440004");
   }
   preview_btn.setToggle(_state);
};
myListener.OnGame_MouseDown = function(button, target)
{
   if(button == 2 && target._name == "SLOT")
   {
      var _loc1_ = target._parent._name;
      if(container_mc[_loc1_] != target._parent)
      {
         return undefined;
      }
      if(container_mc[_loc1_] != undefined)
      {
         var _loc3_ = lib.util.ExtString.split(_loc1_,"__");
         ToGame_ItemDyeing_RightClick(_loc3_[1]);
      }
   }
};
var change_btn = container_mc.txtBtn0.txtBtn;
var preview_btn = container_mc.txtBtn1.txtBtn;
preview_btn.setToggleMode(true);
var x_btn = new lib.util.TxtBtn(container_mc.x_mc);
change_btn.setRelease(ToGame_ItemDyeing_RequestChange);
preview_btn.setRelease(ToGame_ItemDyeing_RequestPreView);
x_btn.setRelease(ToGame_ItemDyeing_CloseUI);
container_mc.sliderR.onChanged = function(v)
{
   lib.Debuger.trace("sliderR.onChanged  " + v);
   ToGame_ItemDyeing_ChangeColor();
};
container_mc.sliderG.onChanged = function(v)
{
   lib.Debuger.trace("sliderG.onChanged  " + v);
   ToGame_ItemDyeing_ChangeColor();
};
container_mc.sliderB.onChanged = function(v)
{
   lib.Debuger.trace("sliderB.onChanged  " + v);
   ToGame_ItemDyeing_ChangeColor();
};
container_mc.sliderL.onChanged = function(v)
{
   lib.Debuger.trace("sliderL.onChanged  " + v);
   ToGame_ItemDyeing_ChangeColor();
};
clearDyeing();
ToGame_ItemDyeing_Init();
