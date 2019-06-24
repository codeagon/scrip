function ToGame_GroupDuelBetting_ResultBetting()
{
   var _loc1_ = container_mc.GoldCurrencyInput.total_nums;
   if(_loc1_ != "" && _loc1_ != undefined)
   {
      lib.Debuger.trace("ToGame_GroupDuelBetting_ResultBetting " + _loc1_);
      getURL("FSCommand:ToGame_GroupDuelBetting_ResultBetting",_loc1_);
   }
}
function ToGame_GroupDuelBetting_CloseUI()
{
   lib.Debuger.trace("ToGame_GroupDuelBetting_CloseUI  ");
   fscommand("ToGame_GroupDuelBetting_CloseUI");
}
function ToGame_GroupDuelBetting_Init()
{
   lib.Debuger.trace("ToGame_GroupDuelBetting_Init");
   fscommand("ToGame_GroupDuelBetting_Init");
}
function ToGame_GroupDuelBetting_RightClick(slotIndex)
{
   lib.Debuger.trace("ToGame_GroupDuelBetting_RightClick  " + slotIndex);
   getURL("FSCommand:ToGame_GroupDuelBetting_RightClick",slotIndex);
}
function itemClear()
{
   var _loc2_ = 0;
   while(_loc2_ < 4)
   {
      var _loc1_ = container_mc["GroupDuelBetting__" + _loc2_];
      _loc1_.impossible = false;
      _loc1_.clear();
      lib.manager.ToolTip.remove(_loc1_.SLOT);
      _loc2_ = _loc2_ + 1;
   }
   itemCount = 0;
}
function GroupDuelBetting_GoldCurrencyInput_Check()
{
   lib.Debuger.trace("GroupDuelBetting_GoldCurrencyInput_Check");
   test_txt0.text = itemCount + "__" + container_mc.GoldCurrencyInput.total_nums;
   confirm_btn.setEnabled(Number(container_mc.GoldCurrencyInput.total_nums) > 0 || itemCount > 0);
}
var UI = this;
UI._visible = false;
var UIname = "GroupDuelBetting";
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
container_mc.text_name.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
container_mc.bettguide_txt.verticalAlign = "bottom";
container_mc.guideFd.verticalAlign = "bottom";
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
var bWidgetOpen = false;
container_mc.numberSteper._visible = false;
lib.manager.Focus.addFocusGroup(UIname,1,[container_mc.GoldCurrencyInput._txt0,container_mc.GoldCurrencyInput._txt1,container_mc.GoldCurrencyInput._txt2]);
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
         _global.inputing = false;
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
      _global.inputing = false;
   }
   container_mc.ToolTip._visible = bShow;
};
var thisItemAble = false;
var itemCount = 0;
myListener.OnGame_GroupDuelBetting_SetBettingData = function(itemAble, min, max, _default)
{
   test_txt0.text = "OnGame_GroupDuelBetting_SetBettingData";
   thisItemAble = Number(itemAble);
   if(!Number(itemAble))
   {
      container_mc.bettguide_txt.text = "$173003";
      container_mc.bettguide_txt.textColor = lib.info.TextColor.GENERAL_DISABLE;
      container_mc.slotBg._alpha = 50;
      container_mc.GroupDuelBetting__Area.enabled = false;
      var _loc2_ = 0;
      while(_loc2_ < 4)
      {
         var _loc3_ = container_mc["GroupDuelBetting__" + _loc2_];
         _loc3_.SLOT.enabled = false;
         _loc3_._alpha = 30;
         _loc2_ = _loc2_ + 1;
      }
   }
   lib.Debuger.trace("min : " + min);
   lib.Debuger.trace("max : " + max);
   lib.Debuger.trace("_default : " + _default);
   _global.inputing = true;
   container_mc.GoldCurrencyInput.min = min;
   container_mc.GoldCurrencyInput.max = max;
   container_mc.GoldCurrencyInput.total = _default;
   container_mc.GoldCurrencyInput.To_Func(function()
   {
      GroupDuelBetting_GoldCurrencyInput_Check();
   }
   );
   container_mc.GoldCurrencyInput._txt0.onChanged = function()
   {
      confirm_btn.setEnabled(Number(container_mc.GoldCurrencyInput.total_nums) > 0 || itemCount > 0);
      container_mc.GoldCurrencyInput.To_Func(function()
      {
         GroupDuelBetting_GoldCurrencyInput_Check();
      }
      );
   };
   container_mc.GoldCurrencyInput._txt1.onChanged = function()
   {
      confirm_btn.setEnabled(Number(container_mc.GoldCurrencyInput.total_nums) > 0 || itemCount > 0);
      container_mc.GoldCurrencyInput.To_Func(function()
      {
         GroupDuelBetting_GoldCurrencyInput_Check();
      }
      );
   };
   container_mc.GoldCurrencyInput._txt2.onChanged = function()
   {
      confirm_btn.setEnabled(Number(container_mc.GoldCurrencyInput.total_nums) > 0 || itemCount > 0);
      container_mc.GoldCurrencyInput.To_Func(function()
      {
         GroupDuelBetting_GoldCurrencyInput_Check();
      }
      );
   };
   UI.onKeyDown = function()
   {
      var _loc1_ = Key.getCode();
      var _loc2_ = String(Selection.getFocus());
      var _loc3_ = String(container_mc.GoldCurrencyInput._txt3);
      if(_loc1_ == 13)
      {
         if(_loc3_ == _loc2_)
         {
            Selection.setFocus(null);
            UI.ToGame_GroupDuelBetting_ResultBetting();
         }
      }
   };
};
myListener.OnGame_GroupDuelBetting_SetBettingItem = function(itemList)
{
   test_txt0.text = "OnGame_GroupDuelBetting_SetBettingItem";
   itemClear();
   var _loc5_ = lib.util.ExtString.split(itemList,"\n");
   var _loc4_ = 0;
   while(_loc4_ < _loc5_.length)
   {
      var _loc2_ = lib.util.ExtString.split(_loc5_[_loc4_],"\t");
      itemCount++;
      var _loc3_ = 0;
      while(_loc3_ < _loc2_.length)
      {
         var _loc1_ = container_mc["GroupDuelBetting__" + _loc2_[0]];
         _loc1_.index = _loc2_[0];
         _loc1_.draw(_loc2_[1]);
         _loc1_.grade = _loc2_[5];
         _loc1_.sealType = _loc2_[6];
         _loc1_.masterpiece = _loc2_[7];
         lib.manager.ToolTip.add(_loc1_.SLOT,_loc1_.index,6,_loc1_.Icon);
         if(Number(_loc2_[3]) == 1 && _loc2_[2] > 1)
         {
            _loc1_.num = _loc2_[2];
         }
         else
         {
            _loc1_.num = "";
         }
         lib.Debuger.trace("itemData[4]  " + _loc2_[4]);
         _loc1_.impossible = Number(_loc2_[4]);
         _loc3_ = _loc3_ + 1;
      }
      _loc4_ = _loc4_ + 1;
   }
   confirm_btn.setEnabled(itemCount > 0 || Number(container_mc.GoldCurrencyInput.total_nums) > 0);
   container_mc.GoldCurrencyInput.To_Func(function()
   {
      GroupDuelBetting_GoldCurrencyInput_Check();
   }
   );
};
myListener.OnGame_MouseDown = function(button, target)
{
   if(button == 2 && target._name == "SLOT")
   {
      var _loc2_ = target._parent._name;
      var _loc1_ = target._parent._parent._name;
      if(container_mc[_loc2_] != undefined)
      {
         var _loc3_ = _loc2_.split("__");
         if(_loc3_[0] == "GroupDuelBetting")
         {
            ToGame_GroupDuelBetting_RightClick(_loc3_[1]);
         }
      }
      else if(container_mc[_loc1_] != undefined)
      {
         _loc3_ = _loc1_.split("__");
         if(_loc3_[0] == "GroupDuelBetting")
         {
            ToGame_GroupDuelBetting_RightClick(_loc3_[1]);
         }
      }
   }
};
var close_btn = container_mc.txtBtn1.txtBtn;
var confirm_btn = container_mc.txtBtn0.txtBtn;
var x_btn = new lib.util.TxtBtn(container_mc.x_mc);
close_btn.setRelease(ToGame_GroupDuelBetting_CloseUI);
x_btn.setRelease(ToGame_GroupDuelBetting_CloseUI);
confirm_btn.setRelease(ToGame_GroupDuelBetting_ResultBetting);
confirm_btn.setEnabled(false);
container_mc.GroupDuelBetting__Area.GetName = function()
{
   return _name;
};
container_mc.GroupDuelBetting__Area.useHandCursor = false;
container_mc.numberSteper.caption = "$173005";
ToGame_GroupDuelBetting_Init();
