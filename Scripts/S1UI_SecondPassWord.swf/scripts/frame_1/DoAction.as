function ToGame_SecondPassWord_Init()
{
   fscommand("ToGame_SecondPassWord_Init");
}
function ToGame_SecondPassWord_NumberClick(id)
{
   if(ClickCount > 3)
   {
      ClickCount = 4;
      return undefined;
   }
   ClickCount++;
   SetCount();
   getURL("FSCommand:ToGame_SecondPassWord_NumberClick",id);
}
function ToGame_SecondPassWord_ResetClick()
{
   fscommand("ToGame_SecondPassWord_ResetClick");
}
function ToGame_SecondPassWord_BackClick()
{
   if(ClickCount == 0)
   {
      ClickCount = 4;
      container_mc.stepMc0.gotoAndStop(2);
      container_mc.stepMc1.gotoAndStop(1);
   }
   ClickCount--;
   SetCount();
   fscommand("ToGame_SecondPassWord_BackClick");
}
function ToGame_SecondPassWord_ClearClick()
{
   ClickCount = 0;
   container_mc.countMc0.gotoAndStop(1);
   container_mc.countMc1.gotoAndStop(1);
   container_mc.stepMc0.gotoAndStop(2);
   container_mc.stepMc1.gotoAndStop(1);
   SetCount();
   fscommand("ToGame_SecondPassWord_ClearClick");
}
function ToGame_SecondPassWord_EnterClick()
{
   ClickCount = 0;
   container_mc.countMc0.gotoAndStop(1);
   container_mc.countMc1.gotoAndStop(1);
   container_mc.stepMc0.gotoAndStop(2);
   container_mc.stepMc1.gotoAndStop(1);
   SetCount();
   fscommand("ToGame_SecondPassWord_EnterClick");
}
function ToGame_SecondPassWord_CloseUI()
{
   fscommand("ToGame_SecondPassWord_CloseUI");
}
function SetButton(mc, btnData)
{
   mc.id = btnData[0];
   mc.gotoAndStop(Number(btnData[1]) + 1);
   var _loc1_ = new lib.util.TxtBtn(mc.btn);
   _loc1_.setRelease(function()
   {
      ToGame_SecondPassWord_NumberClick(mc.id);
   }
   );
   btnArr.push(_loc1_);
}
function SetCount()
{
   if(PassWordType == "init")
   {
      if(container_mc.stepMc1._currentframe == 1)
      {
         if(ClickCount == 4)
         {
            ClickCount = 0;
            container_mc.countMc0.gotoAndStop(5);
            container_mc.countMc1.gotoAndStop(1);
            container_mc.stepMc0.gotoAndStop(1);
            container_mc.stepMc1.gotoAndStop(2);
         }
         else
         {
            container_mc.countMc0.gotoAndStop(Number(ClickCount) + 1);
            container_mc.stepMc0.gotoAndStop(2);
            container_mc.stepMc1.gotoAndStop(1);
         }
      }
      else
      {
         container_mc.countMc1.gotoAndStop(Number(ClickCount) + 1);
         container_mc.stepMc0.gotoAndStop(1);
         container_mc.stepMc1.gotoAndStop(2);
      }
   }
   else
   {
      container_mc.countMc0.gotoAndStop(Number(ClickCount) + 1);
      container_mc.stepMc0.gotoAndStop(2);
   }
   if(ClickCount == 4)
   {
      e_btn.setEnabled(true);
      c_btn.setEnabled(true);
      b_btn.setEnabled(true);
      EnableBtn(false);
   }
   else if(ClickCount == 0)
   {
      if(container_mc.stepMc1._currentframe == 2)
      {
         c_btn.setEnabled(true);
         b_btn.setEnabled(true);
      }
      else
      {
         c_btn.setEnabled(false);
         b_btn.setEnabled(false);
      }
      e_btn.setEnabled(false);
      EnableBtn(true);
   }
   else
   {
      e_btn.setEnabled(false);
      c_btn.setEnabled(true);
      b_btn.setEnabled(true);
      EnableBtn(true);
   }
}
function EnableBtn(type)
{
   var count = 0;
   this.onEnterFrame = function()
   {
      if(count == 1)
      {
         delete this.onEnterFrame;
         var _loc2_ = 0;
         while(_loc2_ < TOTAL_LEN)
         {
            var _loc3_ = btnArr[_loc2_];
            _loc3_.setEnabled(type);
            _loc2_ = _loc2_ + 1;
         }
      }
      count++;
   };
}
var UI = this;
UI._visible = false;
var UIname = "SecondPassWord";
this.bWindowOpen = false;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
var e_btn = container_mc.enterBtn.txtBtn;
e_btn.setRelease(ToGame_SecondPassWord_EnterClick);
e_btn.setEnabled(false);
var r_btn = new lib.util.TxtBtn(container_mc.resetBtn.btn,container_mc.resetBtn.txt);
r_btn.setRelease(ToGame_SecondPassWord_ResetClick);
createBtn.setTextColor("0x96AABC","0xFFFFFF","0x96AABC","0x485460");
var c_btn = new lib.util.TxtBtn(container_mc.clearBtn);
c_btn.setRelease(ToGame_SecondPassWord_ClearClick);
c_btn.setEnabled(false);
var b_btn = new lib.util.TxtBtn(container_mc.backBtn);
b_btn.setRelease(ToGame_SecondPassWord_BackClick);
b_btn.setEnabled(false);
var x_btn = new lib.util.TxtBtn(container_mc.x_mc);
x_btn.setRelease(ToGame_SecondPassWord_CloseUI);
var TOTAL_LEN = 10;
var PassWordType = "init";
var ClickCount = 0;
container_mc.clearBtn.num.gotoAndStop(11);
container_mc.backBtn.num.gotoAndStop(12);
var btnArr = [];
myListener.OnGameEventShowWindow = function(_WindowName, _bShow)
{
   if(_WindowName.toLowerCase() == UIname.toLowerCase())
   {
      bWindowOpen = _bShow;
      if(_global.gbUIMode && bWindowOpen)
      {
         container_mc.x_mc._x = 392;
         UI._visible = true;
      }
      else
      {
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
myListener.OnGame_SecondPassWord_SetMode = function(type)
{
   if(type == "0")
   {
      PassWordType = "init";
      container_mc.x_mc._visible = false;
      container_mc.resetBtn._visible = false;
      container_mc.gotoAndStop(1);
      container_mc.countMc1.gotoAndStop(1);
   }
   else
   {
      PassWordType = "login";
      container_mc.x_mc._visible = true;
      container_mc.resetBtn._visible = true;
      container_mc.gotoAndStop(2);
   }
   ClickCount = 0;
   container_mc.countMc0.gotoAndStop(1);
};
myListener.OnGame_SecondPassWord_SetBoard = function(dataList)
{
   btnArr = [];
   var _loc4_ = lib.util.ExtString.split(dataList,"\n");
   var _loc1_ = 0;
   while(_loc1_ < TOTAL_LEN)
   {
      var _loc3_ = lib.util.ExtString.split(_loc4_[_loc1_],"\t");
      var _loc2_ = container_mc["btn" + _loc1_];
      SetButton(_loc2_,_loc3_);
      _loc1_ = _loc1_ + 1;
   }
};
myListener.OnGame_SecondPassWord_SetTxt = function(server, str, style)
{
   container_mc.txt0.text = lib.util.UIString.getUIString("$009039","server",server);
   container_mc.tipMc.gotoAndStop(Number(style) + 1);
   container_mc.tipMc.txt.verticalAlign = "center";
   container_mc.tipMc.txt.htmlText = str;
};
container_mc.stepMc0.gotoAndStop(2);
ToGame_SecondPassWord_Init();
