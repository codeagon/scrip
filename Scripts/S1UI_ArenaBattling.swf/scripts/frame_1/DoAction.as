function ToGame_ArenaBatting_Init()
{
   fscommand("ToGame_ArenaBatting_Init");
}
function ToGame_ArenaBatting_CloseUI()
{
   fscommand("ToGame_ArenaBatting_CloseUI");
}
function ToGame_ArenaBatting_enter()
{
   fscommand("ToGame_ArenaBatting_enter");
}
function ToGame_ArenaBatting_VoteRefresh()
{
   holdOnEvent();
   fscommand("ToGame_ArenaBatting_VoteRefresh");
}
function ToGame_ArenaBatting_SelectTeam(_index)
{
   getURL("FSCommand:ToGame_ArenaBatting_SelectTeam",_index);
}
function ToGame_ArenaBatting_Confirm(_num)
{
   getURL("FSCommand:ToGame_ArenaBatting_Confirm",_num);
}
function ToGame_ArenaBatting_RightClick()
{
   fscommand("ToGame_ArenaBatting_RightClick");
}
function holdOnEvent()
{
   myListener.OnGame_ArenaBatting_VoteButtonEnable(0);
   holdInterval = setInterval(this,"holdOffEvent",3000);
}
function holdOffEvent()
{
   myListener.OnGame_ArenaBatting_VoteButtonEnable(1);
   clearInterval(holdInterval);
   holdInterval = null;
}
function btnSetting(_type)
{
   var _targetMc = container_mc["selectBtn" + _type];
   var _targetName = container_mc["teamTxt" + _type];
   btnInit(_type);
   _targetMc.idx = _type;
   _targetMc.onRelease = function()
   {
      focusTeam = this.idx;
      btnFocus(this.idx);
      ToGame_ArenaBatting_SelectTeam(this.idx);
   };
   _targetMc.onRollOver = function()
   {
      if(focusTeam == this.idx)
      {
         return undefined;
      }
      _targetMc.btnTxt.textColor = 16777215;
      gs.TweenLite.killTweensOf(_targetMc.overMc0,false);
      gs.TweenLite.to(_targetMc.overMc0,0.3,{_alpha:0});
      gs.TweenLite.killTweensOf(_targetName,false);
      gs.TweenLite.to(_targetName,0.3,{_alpha:100});
   };
   _targetMc.onRollOut = _targetMc.onReleaseOutside = function()
   {
      if(focusTeam == this.idx)
      {
         return undefined;
      }
      _targetMc.btnTxt.textColor = 13824767;
      gs.TweenLite.killTweensOf(_targetMc.overMc0,false);
      gs.TweenLite.to(_targetMc.overMc0,0.3,{_alpha:50});
      gs.TweenLite.killTweensOf(_targetName,false);
      gs.TweenLite.to(_targetName,0.3,{_alpha:50});
   };
}
function btnFocus(_type)
{
   var _loc1_ = container_mc["selectBtn" + _type];
   var _loc3_ = container_mc["teamTxt" + _type];
   _loc3_._alpha = 100;
   _loc1_.focusMc.gotoAndPlay(2);
   _loc1_.overMc0._alpha = 0;
   btnInit((Number(_type) + 1) % 2);
}
function btnInit(_type)
{
   var _loc1_ = container_mc["selectBtn" + _type];
   var _loc2_ = container_mc["teamTxt" + _type];
   _loc2_._alpha = 50;
   _loc1_.focusMc.gotoAndStop(1);
   _loc1_.overMc0._alpha = 50;
}
var UI = this;
UI._visible = false;
var UIname = "ArenaBatting";
this.bWindowOpen = false;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
container_mc.UIDrager.setData(UIName,UI);
var prevNum = "";
var focusTeam = null;
var inputCount = "1";
var VOTE_STRING = lib.util.UIString.getUIString("$560004");
var VOTE_TOOLTIP_STRING = lib.util.UIString.getUIString("$560005");
var enter_btn = container_mc.enterBtn.txtBtn;
enter_btn.setRelease(ToGame_ArenaBatting_enter);
var cancel_btn = container_mc.cancelBtn.txtBtn;
cancel_btn.setRelease(ToGame_ArenaBatting_CloseUI);
var x_btn = new lib.util.TxtBtn(container_mc.x_btn);
x_btn.setRelease(ToGame_ArenaBatting_CloseUI);
var refresh_btn = new lib.util.TxtBtn(container_mc.refreshBtn);
refresh_btn.setRelease(ToGame_ArenaBatting_VoteRefresh);
lib.manager.ToolTip.add(container_mc.refreshBtn,VOTE_TOOLTIP_STRING,1);
var delayEnterFrame = new MovieClip();
container_mc.itemBg.hitTestDisable = true;
myListener.OnGameEventShowWindow = function(widgetName, bShow)
{
   if(widgetName.toLowerCase() == UIname.toLowerCase())
   {
      bWidgetOpen = bShow;
      if(bWidgetOpen)
      {
         UI._visible = true;
      }
      else
      {
         clearInterval(holdInterval);
         holdInterval = null;
         UI._visible = false;
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
myListener.OnGame_ArenaBatting_SetBoard = function(_titleTxt, _subTxt, _inputEnable)
{
   var _loc1_ = Boolean(Number(_inputEnable));
   container_mc.title_Txt.setText(_titleTxt);
   container_mc.InputMc._visible = _loc1_;
   container_mc.inputTxt._visible = _loc1_;
   if(_loc1_ == false)
   {
      container_mc.slogBg._x = 278;
      container_mc.itemSlot._x = 283;
   }
   else
   {
      container_mc.slogBg._x = 134;
      container_mc.itemSlot._x = 139;
   }
   if(_loc1_)
   {
      container_mc.inputTxt.setText(_subTxt);
   }
};
myListener.OnGame_ArenaBatting_SetTeamData = function(_data)
{
   var _loc1_ = lib.util.ExtString.split(_data,"\t");
   container_mc.teamTxt0.txt.textAutoSize = "shrink";
   container_mc.teamTxt1.txt.textAutoSize = "shrink";
   container_mc.teamTxt0.txt.text = _loc1_[0];
   container_mc.teamTxt1.txt.text = _loc1_[1];
   lib.util.DrawBitmap.draw(container_mc.imcMc0,_loc1_[2]);
   lib.util.DrawBitmap.draw(container_mc.imcMc1,_loc1_[3]);
};
myListener.OnGame_ArenaBatting_SetVote = function(_data)
{
   var _loc1_ = lib.util.ExtString.split(_data,"\t");
   container_mc.voteTxt0.text = VOTE_STRING + " : ";
   container_mc.voteTxt1.text = VOTE_STRING + " : ";
   container_mc.voteTxtN0.text = _loc1_[0];
   container_mc.voteTxtN1.text = _loc1_[1];
};
myListener.OnGame_ArenaBatting_VoteButtonEnable = function(_flag)
{
   refresh_btn.setEnabled(Number(_flag));
};
myListener.OnGame_ArenaBatting_SetItemData = function(_data)
{
   var item_info = lib.util.ExtString.split(_data,"\t");
   var _loc2_ = container_mc.itemSlot;
   _loc2_.onEnterFrame = function()
   {
      this.SLOT.enabled = false;
      if(item_info.length > 0)
      {
         lib.util.DrawBitmap.draw(this.Icon,item_info[1],56,56);
         lib.manager.ToolTip.add(this.SLOT,item_info[0],6,this.Icon);
         this.drag = false;
         this.grade = item_info[3];
         this.sealType = item_info[4];
         this.masterpiece = item_info[5];
         if(item_info[2] != undefined)
         {
            this.impossible = Number(item_info[2]);
         }
         this.SLOT.enabled = true;
      }
      else
      {
         this.clear();
         this.impossible = false;
         lib.util.DrawBitmap.draw(this.Icon,"");
         lib.manager.ToolTip.remove(this.SLOT);
      }
      delete this.onEnterFrame;
   };
};
myListener.OnGame_ArenaBatting_SetInputData = function(_data)
{
   var InputData = lib.util.ExtString.split(_data,"\t");
   inputCount = InputData[3];
   container_mc.InputMc.onEnterFrame = function()
   {
      delete this.onEnterFrame;
      container_mc.InputMc.min = Number(InputData[1]);
      container_mc.InputMc.max = Number(InputData[2]);
      container_mc.InputMc.text = InputData[0];
      container_mc.InputMc.gap = Number(inputCount);
      Selection.setFocus(container_mc.InputMc.ext_textField.textField);
   };
};
myListener.OnGame_ArenaBatting_ButtonEnable = function(type)
{
   enter_btn.setEnabled(Boolean(Number(type)));
};
myListener.OnGame_MouseDown = function(button, target)
{
   if(button == 2 && target._name == "SLOT")
   {
      ToGame_ArenaBatting_RightClick();
   }
};
var holdInterval;
container_mc.InputMc.onChanged = function()
{
   if(prevNum == container_mc.InputMc.text)
   {
      return undefined;
   }
   prevNum = container_mc.InputMc.text;
   ToGame_ArenaBatting_Confirm(prevNum);
   if(prevNum == 0)
   {
      enter_btn.setEnabled(0);
   }
   else
   {
      enter_btn.setEnabled(1);
   }
};
container_mc.voteTxt0.textAutoSize = "shrink";
container_mc.voteTxt1.textAutoSize = "shrink";
btnSetting(0);
btnSetting(1);
enter_btn.setEnabled(0);
ToGame_ArenaBatting_Init();
