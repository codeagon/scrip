function clearSlot(_tgMc)
{
   lib.manager.ToolTip.remove(_tgMc);
   _tgMc.removeMovieClip();
}
function clearBox(_tgMc)
{
   for(str in _tgMc)
   {
      var _loc1_ = _tgMc[str];
      lib.manager.ToolTip.remove(_loc1_);
      _loc1_.removeMovieClip();
   }
}
function drawSlot(_tgMc, _index, _img, _grade, _num, _size)
{
   var _loc1_ = _size / 64;
   var _loc3_ = 16 * _loc1_;
   lib.display.DrawBitmapData.draw(_tgMc,_img,0,0,0,0,_size,_size,_loc1_);
   if(_grade > 0)
   {
      lib.display.DrawBitmapData.draw(_tgMc,UI["gradeBm" + _grade],0,0,0,0,_loc3_,_loc3_,_loc1_ * 1.2);
   }
   if(_num > 0)
   {
      _tgMc.numTxt.text = _num;
   }
   lib.manager.ToolTip.add(_tgMc,_index,6);
}
function ToGame_ProductionList_Init()
{
   fscommand("ToGame_ProductionList_Init");
}
function ToGame_ProductionList_CloseUI()
{
   fscommand("ToGame_ProductionList_CloseUI");
}
function ToGame_ProductionList_SkillClick(_id)
{
   getURL("FSCommand:ToGame_ProductionList_SkillClick",_id);
}
function ToGame_ProductionList_RecipeClick(_id)
{
   getURL("FSCommand:ToGame_ProductionList_RecipeClick",_id);
}
function ToGame_ProductionList_RecipeEvent(_data)
{
   getURL("FSCommand:ToGame_ProductionList_RecipeEvent",_data);
}
function ToGame_ProductionList_SelectComboBox(_idx)
{
   getURL("FSCommand:ToGame_ProductionList_SelectComboBox",_idx);
}
function ToGame_ProductionList_CreateClick(_type, _count)
{
   getURL("FSCommand:ToGame_ProductionList_CreateClick",_type + "\t" + _count);
}
function ToGame_ProductionList_UpGradeClick()
{
   fscommand("ToGame_ProductionList_UpGradeClick");
}
function ToGame_ProductionList_GradeResetClick()
{
   fscommand("ToGame_ProductionList_GradeResetClick");
}
function ToGame_ProductionList_AdditionClick(id)
{
   getURL("FSCommand:ToGame_ProductionList_AdditionClick",id);
}
function ToGame_ProductionList_MaterialClick(id)
{
   getURL("FSCommand:ToGame_ProductionList_MaterialClick",id);
}
function ToGame_ProductionList_CategoryState(str)
{
   getURL("FSCommand:ToGame_ProductionList_CategoryState",str);
}
function ToGame_ProductionList_AllViewClick(checkMode)
{
   getURL("FSCommand:ToGame_ProductionList_AllViewClick",checkMode);
}
function listClicKEvent(_type, _data)
{
   switch(_type)
   {
      case 0:
         S_List.SetFocus(prevFocus,_data);
         ToGame_ProductionList_RecipeClick(_data);
         break;
      case 1:
         ToGame_ProductionList_RecipeEvent(_data);
         break;
      case 2:
         S_List.SetLinePosition(prevFocus,false);
   }
}
function skillFocus(id)
{
   var _loc2_ = container_mc["SkillBox" + prevFocus];
   _loc2_.b_focus = false;
   _loc2_.bg.gotoAndStop(1);
   _loc2_.txt.textColor = gradeSkillColor[Number(_loc2_.rank)];
   prevFocus = id;
   var _loc1_ = container_mc["SkillBox" + id];
   _loc1_.b_focus = true;
   _loc1_.bg.gotoAndStop(3);
   _loc1_.txt.textColor = gradeSkillFocusColor[Number(_loc1_.rank)];
   container_mc.titleTxt.text = _loc1_.Title;
   container_mc.createTxt.text = CREAT_STR + " " + _loc1_.levelP + "/" + _loc1_.levelM;
   container_mc.gradeTxt.text = lib.util.UIString.getUIString(gradeType[_loc1_.rank]);
   container_mc.gradeTxt.textColor = gradeSkillColor[Number(_loc1_.rank)];
   if(_loc1_.rank == 2)
   {
      gradeIconVisible = true;
   }
   else
   {
      gradeIconVisible = false;
   }
   drawBar();
}
function drawBar()
{
   container_mc.drawBox.clear();
   lib.display.DrawBitmapData.draw(container_mc.drawBox,staminaBarBm,81,49,0,0,staminaNum,8);
   if(gradeIconVisible)
   {
      lib.display.DrawBitmapData.draw(container_mc.drawBox,masterIconBm,153,69,0,0,64,64);
   }
   if(gradeBarVisible)
   {
      var _loc1_ = container_mc.percentTxt.textWidth + 5 + container_mc.percentTxt._x;
      lib.display.DrawBitmapData.draw(container_mc.drawBox,gradeBarBm2,_loc1_,98,0,0,512,32);
      lib.display.DrawBitmapData.draw(container_mc.drawBox,gradeBarBm,_loc1_ + 1,99,0,0,upGradeNum,8);
   }
}
function create_Click()
{
   var _loc1_ = container_mc.numberSteper.text;
   ToGame_ProductionList_CreateClick("0",_loc1_);
}
function create_AllClick()
{
   var _loc1_ = container_mc.numberSteper.text;
   ToGame_ProductionList_CreateClick("1",_loc1_);
}
function setDecimal(num)
{
   var _loc2_ = int(num);
   var _loc1_ = num * 10 % 10;
   if(_loc1_ != 0)
   {
      _loc2_ = _loc2_ + _loc1_ * 0.1;
   }
   return _loc2_;
}
function defaultDisable(bool)
{
   container_mc.slotMc._visible = bool;
   container_mc.plusMc._visible = bool;
   container_mc.targetTxt0._visible = bool;
   container_mc.targetTxt1._visible = bool;
   container_mc.targetTxt2._visible = bool;
   container_mc.targetTxt3._visible = bool;
   container_mc.targetTxt4._visible = bool;
}
var UI = this;
UI._visible = false;
var UIname = "ProductionList";
this.bWindowOpen = false;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
container_mc.UIDrager.setData(UIname,UI,container_mc.lock_mc);
var x_btn = new lib.util.TxtBtn(container_mc.xBtn);
x_btn.setRelease(ToGame_ProductionList_CloseUI);
var listBoxY = container_mc.listBox._y;
container_mc.scrollbar.pageSize = 0;
container_mc.scrollbar.displaySize = container_mc.maskMc._height;
container_mc.scrollbar.rowHeight = 500;
container_mc.listBox.onScroll = function()
{
   this._y = listBoxY - arguments[0];
};
container_mc.scrollbar.setWheel(container_mc.listBox);
container_mc.scrollbar.addListener(container_mc.listBox);
var comboListner = {};
comboListner.onChanged = function(_targetMc, _id, _index)
{
   if(_id == undefined)
   {
      return undefined;
   }
   ToGame_ProductionList_SelectComboBox(_index);
};
var startCreate_btn = new lib.util.TxtBtn(container_mc.sBtn,container_mc.sTxt);
var startAllCreatet_btn = new lib.util.TxtBtn(container_mc.saBtn,container_mc.saTxt);
startCreate_btn.txt.text = lib.util.UIString.getUIString("$153005");
startAllCreatet_btn.txt.text = lib.util.UIString.getUIString("$153007");
startCreate_btn.setRelease(create_Click);
startAllCreatet_btn.setRelease(create_AllClick);
startCreate_btn.setEnabled(false);
startAllCreatet_btn.setEnabled(false);
var upGrade_btn = new lib.util.TxtBtn(container_mc.upGradeBtn.btn,container_mc.upGradeBtn.txt);
upGrade_btn.setTextColor("0xFFcc00","0xFFcc00","0xFFcc00","0x485460");
upGrade_btn.setRelease(ToGame_ProductionList_UpGradeClick);
upGrade_btn.txt.text = UPGRADE_BTN_STR0;
var gradeReset_btn = new lib.util.TxtBtn(container_mc.gradeResetBtn.btn,container_mc.gradeResetBtn.txt);
gradeReset_btn.setTextColor("0xFFFFFF","0xFFFFFF","0xFFFFFF","0x485460");
gradeReset_btn.setRelease(ToGame_ProductionList_GradeResetClick);
gradeReset_btn.txt.text = lib.util.UIString.getUIString("$153047");
var ADDITION_TIP = lib.util.UIString.getUIString("$153067");
lib.manager.ToolTip.add(container_mc.additionGuide,ADDITION_TIP,1);
container_mc.additionBg.btn.id = -1;
container_mc.additionBg.btn.enable = true;
container_mc.additionBg.btn.focusMc._visible = false;
container_mc.additionBg.btn.disableMc._visible = false;
var CREAT_STR = lib.util.UIString.getUIString("$153045");
var CREAT_MODE_STR0 = lib.util.UIString.getUIString("$153055");
var CREAT_MODE_STR1 = lib.util.UIString.getUIString("$153056");
var CREAT_MODE_STR2 = lib.util.UIString.getUIString("$153057");
var UPGRADE_BTN_STR0 = lib.util.UIString.getUIString("$153046");
var UPGRADE_BTN_STR1 = lib.util.UIString.getUIString("$153040");
var UPGRADE_TYPE_STR0 = lib.util.UIString.getUIString("$153034") + " " + lib.util.UIString.getUIString("$153055");
var UPGRADE_TYPE_STR1 = lib.util.UIString.getUIString("$153034") + " " + lib.util.UIString.getUIString("$153056");
var UPGRADE_TYPE_STR2 = lib.util.UIString.getUIString("$153034") + " " + lib.util.UIString.getUIString("$153057");
var TARGET_STR0 = lib.util.UIString.getUIString("$153052");
var TARGET_STR1 = lib.util.UIString.getUIString("$153053");
var STAMINA_STR = lib.util.UIString.getUIString("$153044");
var STAMINA_STR2 = lib.util.UIString.getUIString("$153060");
var STAMINA_STR3 = lib.util.UIString.getUIString("$153063");
var ADDITION_STR0 = lib.util.UIString.getUIString("$153051");
var ADDITION_STR1 = lib.util.UIString.getUIString("$153068");
var staminaW = 728;
var upGradeW = 337;
var gradeBarVisible = false;
var gradeIconVisible = false;
var staminaNum = 0.1;
var upGradeNum = 0.1;
var amountTextFormat = new TextFormat("$NormalFont",14,14145495,false,false,false,null,null,"right",0,0,0,0);
var gradeBm1 = flash.display.BitmapData.loadBitmap("iconGrade1");
var gradeBm2 = flash.display.BitmapData.loadBitmap("iconGrade2");
var gradeBm3 = flash.display.BitmapData.loadBitmap("iconGrade3");
var masterIconBm = flash.display.BitmapData.loadBitmap("masterIcon");
var staminaBarBm = flash.display.BitmapData.loadBitmap("staminaBar");
var gradeBarBm = flash.display.BitmapData.loadBitmap("gradeBar");
var gradeBarBm2 = flash.display.BitmapData.loadBitmap("gradeBar2");
var additonNull = flash.display.BitmapData.loadBitmap("additonNull");
var linkBm = flash.display.BitmapData.loadBitmap("link");
var materialLimitScale = 200;
var gradeType = ["$153041","$153042","$153043"];
var gradeSkillColor = ["0x6F8AA9","0x3E9E25","0xD2A902"];
var gradeSkillFocusColor = ["0xFFFFFF","0x4ecd30","0xffcc00"];
var gradeColor = ["0xffffff","0x4ecd30","0x00aeff","0xffcc00"];
myListener.OnGameEventShowWindow = function(_WindowName, _bShow)
{
   if(_WindowName.toLowerCase() == UIname.toLowerCase())
   {
      bWindowOpen = _bShow;
      if(_global.gbUIMode && bWindowOpen)
      {
         UI._visible = true;
      }
      else
      {
         UI._visible = false;
      }
      if(UI._visible == true)
      {
         var _loc2_ = new lib.controls.CustomScaleEvent();
         _loc2_.CustomScaleEventCheck(UI,UIname);
         UI.scaleExpander.scaleExpanderEventCheck(UI,UIname);
      }
      else
      {
         _loc2_.CustomScaleEventRemoveCheck();
      }
   }
};
myListener.OnGameEventChangeUIMode = function(_bShow)
{
   if(_global.gbUIMode && bWindowOpen)
   {
      UI._visible = true;
   }
   else
   {
      UI._visible = false;
   }
};
var staminaNumber = 0;
var staminaNumber2 = 0;
myListener.OnGame_ProductionList_SetStamina = function(_current, _max)
{
   staminaNum = _current / _max * staminaW;
   staminaNumber = _current;
   container_mc.staminaTxt.text = lib.util.CurrencyFormat.makeComma(_current) + "/" + lib.util.CurrencyFormat.makeComma(_max);
   if(staminaNumber2 > staminaNumber)
   {
      container_mc.targetTxt2.textColor = "0xBB0000";
   }
   else
   {
      container_mc.targetTxt2.textColor = "0x6F8AA9";
   }
   drawBar();
};
var prevFocus = -1;
var saveCate = [];
myListener.OnGame_ProductionList_SetSkillList = function(_data)
{
   var _loc6_ = lib.util.ExtString.split(_data,"\n");
   var _loc7_ = _loc6_.length;
   var _loc4_ = 0;
   while(_loc4_ < _loc7_)
   {
      var _loc3_ = lib.util.ExtString.split(_loc6_[_loc4_],"\t");
      var _loc5_ = _loc3_[0];
      var _loc2_ = container_mc.attachMovie("SkillBox","SkillBox" + _loc5_,_loc4_);
      _loc2_.Id = _loc5_;
      _loc2_.Title = _loc3_[1];
      _loc2_.rank = _loc3_[2];
      _loc2_.levelP = setDecimal(_loc3_[3]);
      _loc2_.levelM = setDecimal(_loc3_[4]);
      _loc2_.levelE = _loc3_[5];
      _loc2_.txt.setText(_loc2_.Title);
      _loc2_.txt.textColor = gradeSkillColor[Number(_loc2_.rank)];
      _loc2_.num.text = _loc2_.levelP + "/" + _loc2_.levelM;
      _loc2_.img.htmlText = "<img src=\'level" + _loc2_.levelE + "\'>";
      _loc2_._x = 5;
      _loc2_._y = 68 + 42 * _loc4_;
      _loc2_.b_focus = false;
      _loc2_.hit.onRelease = function()
      {
         if(prevFocus == this._parent.Id)
         {
            return undefined;
         }
         ToGame_ProductionList_SkillClick(this._parent.Id);
      };
      _loc2_.hit.onRollOver = function()
      {
         if(this._parent.b_focus)
         {
            return undefined;
         }
         this._parent.bg.gotoAndStop(2);
      };
      _loc2_.hit.onRollOut = _loc2_.hit.onReleaseOutside = function()
      {
         if(this._parent.b_focus)
         {
            return undefined;
         }
         this._parent.bg.gotoAndStop(1);
      };
      _loc2_.hit.onPress = function()
      {
         if(this._parent.b_focus)
         {
            return undefined;
         }
         this._parent.bg.gotoAndStop(1);
      };
      _loc4_ = _loc4_ + 1;
   }
};
myListener.OnGame_ProductionList_UpDateSkillList = function(_id, _data)
{
   var _loc1_ = container_mc["SkillBox" + _id];
   if(!_loc1_)
   {
      return undefined;
   }
   var _loc2_ = lib.util.ExtString.split(_data,"\t");
   _loc1_.Id = _id;
   _loc1_.Title = _loc2_[0];
   _loc1_.rank = _loc2_[1];
   _loc1_.levelP = setDecimal(_loc2_[2]);
   _loc1_.levelM = setDecimal(_loc2_[3]);
   _loc1_.levelE = _loc2_[4];
   _loc1_.num.text = _loc1_.levelP + "/" + _loc1_.levelM;
   _loc1_.txtMc.txt.setText(_loc1_.Title);
   _loc1_.txtMc.txt.textColor = gradeSkillColor[Number(_loc1_.rank)];
   if(_loc1_.levelE > 0)
   {
      _loc1_.img.htmlText = "<img src=\'level" + _loc1_.levelE + "\'>";
   }
   else
   {
      _loc1_.img.htmlText = "";
   }
   if(prevFocus == _id)
   {
      skillFocus(_id);
   }
};
myListener.OnGame_ProductionList_SetSkillFocus = function(id)
{
   skillFocus(id);
};
myListener.OnGame_ProductionList_AddFirstCategory = function(_skill, _List)
{
   S_List.AddFirstCategory(_skill,_List);
};
myListener.OnGame_ProductionList_AddSecondCategory = function(_skill, _type, _List)
{
   S_List.AddSecondCategory(_skill,_type,_List);
};
myListener.OnGame_ProductionList_SetRecipeList = function(_skill, _type, _dataGroup)
{
   S_List.SetList(_skill,_type,_dataGroup);
};
myListener.OnGame_ProductionList_UpDateRecipe = function(_skill, _type, _data)
{
   S_List.UpDateList(_skill,_type,_data);
};
myListener.OnGame_ProductionList_ViewRecipeList = function(_skill, _idGroup)
{
   S_List.SetViewList(_skill,_idGroup);
};
myListener.OnGame_ProductionList_RemoveCategory = function(_skill)
{
   S_List.RemoveCategory(_skill);
};
myListener.OnGame_ProductionList_RecipeFocus = function(id)
{
   S_List.SetFocus(prevFocus,id);
};
myListener.OnGame_ProductionList_CategoryState = function(str)
{
   S_List.SetCategory(str);
};
myListener.OnGame_ProductionList_SetTargetItem = function(_dataGroup, _rank, _stamina, _successGroup, $targetRank)
{
   var _loc1_ = lib.util.ExtString.split(_dataGroup,"\t");
   var _loc3_ = lib.util.ExtString.split(_rank,"\t");
   var _loc6_ = setDecimal(_loc3_[1]);
   var _loc8_ = TARGET_STR0;
   if(_loc6_ > 0)
   {
      container_mc.targetTxt1.htmlText = TARGET_STR0 + setDecimal(_loc3_[0]) + "(" + lib.util.UIString.getUIString(gradeType[$targetRank]) + ") <font color=\'#80E71C\'> (" + TARGET_STR1 + " +" + setDecimal(_loc3_[1]) + ")</font>";
   }
   else
   {
      container_mc.targetTxt1.htmlText = TARGET_STR0 + setDecimal(_loc3_[0]) + "(" + lib.util.UIString.getUIString(gradeType[$targetRank]) + ") <font color=\'#BB0000\'> (" + TARGET_STR1 + " +" + setDecimal(_loc3_[1]) + ")</font>";
   }
   staminaNumber2 = _stamina;
   if(staminaNumber2 > staminaNumber)
   {
      container_mc.targetTxt2.textColor = "0xBB0000";
   }
   else
   {
      container_mc.targetTxt2.textColor = "0x6F8AA9";
   }
   container_mc.targetTxt2.text = STAMINA_STR2 + " " + STAMINA_STR + " : " + staminaNumber2 + "p";
   container_mc.targetTxt0.setText(_loc1_[1]);
   container_mc.targetTxt0.textColor = gradeColor[_loc1_[3]];
   clearSlot(container_mc.targetSlot);
   clearSlot(container_mc.successSlot);
   var _loc5_ = container_mc.attachMovie("slotDraw","targetSlot",container_mc.getNextHighestDepth());
   _loc5_._x = 438;
   _loc5_._y = 125;
   drawSlot(_loc5_,_loc1_[0],_loc1_[2],_loc1_[3],_loc1_[4],50);
   if(_successGroup !== undefined)
   {
      var _loc4_ = lib.util.ExtString.split(_successGroup,"\t");
      container_mc.targetTxt3._visible = true;
      var _loc2_ = container_mc.attachMovie("slotDraw","successSlot",container_mc.getNextHighestDepth());
      _loc2_._x = 760;
      _loc2_._y = 146;
      _loc2_._xscale = 68;
      _loc2_._yscale = 68;
      drawSlot(_loc2_,_loc4_[0],_loc4_[2],_loc4_[3],_loc4_[4],50);
   }
   else
   {
      container_mc.targetTxt3._visible = false;
   }
};
myListener.OnGame_ProductionList_SetMaterial = function(_dataGroup)
{
   var _loc7_ = lib.util.ExtString.split(_dataGroup,"\n");
   var _loc8_ = _loc7_.length;
   clearBox(container_mc.materialBox);
   if(_loc8_ > 0)
   {
      defaultDisable(true);
      container_mc.defaultStr._visible = false;
      container_mc.materialBox._xscale = 100;
      container_mc.materialBox._yscale = 100;
      var _loc4_ = 0;
      while(_loc4_ < _loc8_)
      {
         var _loc2_ = container_mc.materialBox.attachMovie("materialMc","materialMc" + _loc4_,container_mc.materialBox.getNextHighestDepth());
         _loc2_._y = _loc4_ * 41;
         _loc2_.img._xscale = 69;
         _loc2_.img._yscale = 69;
         var _loc3_ = lib.util.ExtString.split(_loc7_[_loc4_],"\t");
         var _loc5_ = _loc3_[4];
         var _loc6_ = _loc3_[5];
         drawSlot(_loc2_.img,_loc3_[0],_loc3_[2],_loc3_[3],0,50);
         _loc2_.txt.htmlText = _loc3_[1] + " ( " + _loc5_ + "/" + _loc6_ + " )";
         _loc2_.id = _loc3_[0];
         if(Number(_loc5_) < Number(_loc6_))
         {
            _loc2_.txt.textColor = "0x707070";
         }
         else
         {
            _loc2_.txt.textColor = "0xFFFFFF";
         }
         if(_loc3_[6] !== "0")
         {
            _loc2_.hit._visible = true;
            _loc2_.hit.hitTestDisable = true;
            _loc2_.img.onRelease = function()
            {
               ToGame_ProductionList_MaterialClick(this._parent.id);
            };
            _loc2_.img.onPress = function()
            {
               this._parent.hit.gotoAndStop(3);
            };
            _loc2_.img.onReleaseOutside = _loc2_.img.onRollOut = function()
            {
               this._parent.hit.gotoAndStop(1);
            };
            _loc2_.img.onRollOver = function()
            {
               this._parent.hit.gotoAndStop(2);
            };
         }
         else
         {
            _loc2_.hit._visible = false;
         }
         _loc4_ = _loc4_ + 1;
      }
      var _loc9_ = container_mc.materialBox._height;
      if(_loc9_ > materialLimitScale)
      {
         container_mc.materialBox._xscale = materialLimitScale / _loc9_ * 100;
         container_mc.materialBox._yscale = materialLimitScale / _loc9_ * 100;
      }
   }
   defaultDisable(false);
   container_mc.defaultStr._visible = true;
   return undefined;
};
var prevAdditionTarget;
myListener.OnGame_MouseDown = function(button, target)
{
   button = Number(button);
   if(button == 2)
   {
      if(target._parent._parent._parent._parent.UIname == UIname)
      {
         var _loc1_ = target._parent;
         if(!_loc1_.enable)
         {
            return undefined;
         }
         ratgetIndex = _loc1_.idx;
         targetID = _loc1_.id;
         prevAdditionTarget.focusMc._alpha = 0;
         _loc1_.focusMc._alpha = 100;
         prevAdditionTarget = _loc1_;
         if(targetID != undefined)
         {
            ToGame_ProductionList_AdditionClick(targetID);
         }
      }
   }
};
myListener.OnGame_ProductionList_SetAddition = function(_dataGroup)
{
   var _loc4_ = lib.util.ExtString.split(_dataGroup,"\n");
   var _loc5_ = _loc4_.length;
   var _loc6_ = 0;
   clearBox(container_mc.additionBox);
   if(_loc5_ < 5)
   {
      container_mc.additionBox._y = 470;
      container_mc.additionBox._xscale = 100;
      container_mc.additionBox._yscale = 100;
   }
   else if(_loc5_ == 5)
   {
      container_mc.additionBox._y = 473;
      container_mc.additionBox._xscale = 80;
      container_mc.additionBox._yscale = 80;
   }
   else
   {
      container_mc.additionBox._y = 465;
      container_mc.additionBox._xscale = 60;
      container_mc.additionBox._yscale = 60;
   }
   var _loc2_ = 0;
   while(_loc2_ < _loc5_)
   {
      var _loc3_ = lib.util.ExtString.split(_loc4_[_loc2_],"\t");
      var _loc1_ = container_mc.additionBox.attachMovie("additionSlot","additionSlot" + _loc2_,container_mc.additionBox.getNextHighestDepth());
      if(_loc2_ > 4)
      {
         _loc1_._x = (_loc2_ - 5) * 38;
         _loc1_._y = 38;
      }
      else
      {
         _loc1_._x = _loc2_ * 38;
      }
      _loc1_.focusMc._alpha = 0;
      _loc1_.disableMc._visible = false;
      _loc1_.idx = _loc2_;
      _loc1_.id = _loc3_[0];
      _loc1_.enable = Boolean(Number(_loc3_[4]));
      drawSlot(_loc1_,_loc3_[0],_loc3_[1],_loc3_[2],_loc3_[3],32);
      _loc1_.numTxt.text = _loc3_[3];
      if(!_loc1_.enable)
      {
         _loc1_.disableMc._visible = true;
         _loc1_.hit._visible = false;
      }
      _loc2_ = _loc2_ + 1;
   }
   if(_loc4_ == "" || _loc4_ == undefined)
   {
      container_mc.additionBox._visible = false;
      container_mc.additionBg.gotoAndStop(2);
      container_mc.additionTxt.textColor = "0x999999";
      container_mc.additionTxt.text = ADDITION_STR1;
   }
   else
   {
      container_mc.additionBox._visible = true;
      container_mc.additionBg.gotoAndStop(1);
      container_mc.additionTxt.textColor = "0x0086FF";
      container_mc.additionTxt.text = ADDITION_STR0;
   }
   container_mc.additionBox._x = container_mc.additionTxt.textWidth + 515;
};
myListener.OnGame_ProductionList_ChoiceAddition = function(_dataGroup)
{
   container_mc.additionBg.btn.clear();
   var _loc1_ = lib.util.ExtString.split(_dataGroup,"\t");
   if(_loc1_ == "" || _loc1_ == undefined)
   {
      container_mc.additionGuide._visible = true;
      container_mc.additionBg.btn._visible = false;
   }
   else
   {
      var _loc2_ = Number(_loc1_[1]);
      container_mc.additionGuide._visible = false;
      container_mc.additionBg.btn._visible = true;
      drawSlot(container_mc.additionBg.btn,_loc1_[0],_loc1_[1],_loc1_[2],_loc1_[3],32);
   }
};
myListener.OnGame_ProductionList_SetAmount = function(_current, _min, _max, _enable)
{
   container_mc.numberSteper.min = _min;
   container_mc.numberSteper.max = _max;
   container_mc.numberSteper.text = _current;
   if(_enable == 1)
   {
      container_mc.numberBlock._visible = false;
   }
   else
   {
      container_mc.numberBlock._visible = true;
   }
};
myListener.OnGame_ProductionList_SetComboBox = function(_listData)
{
   container_mc.comboBox.data = lib.util.ExtString.split(_listData,"\t");
   container_mc.comboBox.removeListener(comboListner);
   container_mc.comboBox.selectedIndex = 0;
   container_mc.comboBox.addListener(comboListner);
   container_mc.comboBox.selectLabel._x = 32;
};
myListener.OnGame_ProductionList_CreateButton = function(_type, _bool)
{
   var _loc1_ = Boolean(Number(_bool));
   if(_type == "0")
   {
      startCreate_btn.setEnabled(_loc1_);
   }
   else
   {
      startAllCreatet_btn.setEnabled(_loc1_);
   }
};
myListener.OnGame_ProductionList_UpGradeButton = function(_type, _data, _bool)
{
   var _loc1_ = lib.util.ExtString.split(_data,"\t");
   gradeBarVisible = false;
   container_mc.percentTxt._visible = false;
   container_mc.createTxt._y = 85;
   if(_type == 0)
   {
      upGrade_btn.setEnabled(false);
      upGrade_btn.txt.text = UPGRADE_BTN_STR0;
   }
   else if(_type == 1)
   {
      upGrade_btn.setEnabled(true);
      upGrade_btn.txt.text = UPGRADE_BTN_STR0;
   }
   else if(_type == 2)
   {
      upGrade_btn.setEnabled(true);
      gradeBarVisible = true;
      container_mc.createTxt._y = 73;
      container_mc.percentTxt._visible = true;
      upGradeNum = _loc1_[0] / _loc1_[1] * upGradeW;
      upGrade_btn.txt.text = UPGRADE_BTN_STR1;
   }
   if(_bool !== undefined)
   {
      upGrade_btn.setEnabled(Boolean(Number(_bool)));
   }
   drawBar();
};
myListener.OnGame_ProductionList_GradeResetButton = function(_bool)
{
   var _loc1_ = Boolean(Number(_bool));
   if(_loc1_ == true)
   {
      container_mc.upGradeBtn._x = 645;
      container_mc.gradeResetBtn._visible = true;
   }
   else
   {
      container_mc.upGradeBtn._x = 727;
      container_mc.gradeResetBtn._visible = false;
   }
   gradeReset_btn.setEnabled(_loc1_);
};
myListener.OnGame_ProductionList_AllView = function(_view, checkMode)
{
   checkMc._visible = Boolean(Number(_view));
   checkMc.checked = Boolean(Number(checkMode));
};
var checkMc = container_mc.checkBox;
checkMc._visible = false;
checkMc.onChanged = function(changed)
{
   if(changed == true)
   {
      ToGame_ProductionList_AllViewClick(1);
   }
   else if(changed == false)
   {
      ToGame_ProductionList_AllViewClick(0);
   }
};
container_mc.numberSteper.max = 0;
container_mc.numberSteper.min = 0;
container_mc.numberSteper.text = "0";
container_mc.guideTxt.htmlText = "<img src=\'guideIcon\' vspace=\'-2\'> " + STAMINA_STR;
container_mc.guideTxt.textAutoSize = "shrink";
lib.manager.ToolTip.add(container_mc.guideBtn,STAMINA_STR3,1);
container_mc.targetTxt0.verticalAlign = "center";
defaultDisable(false);
var S_List = new lib.controls.S_3DepthList(container_mc.listBox,container_mc.scrollbar,listClicKEvent);
myListener.OnGame_ProductionList_SetGradeList("Lv.1\tLv.2\tLv.3\tLv.4\tLv.5\tLv.6\tLv.7\tLv.8\tLv.9\tLv.10\tLv.11\t");
fscommand("ToGame_ProductionList_Init");
