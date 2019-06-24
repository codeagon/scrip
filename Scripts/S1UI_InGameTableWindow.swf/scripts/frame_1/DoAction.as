function clearList(container)
{
   container_mc.defaultList.selectIndex = undefined;
   var _loc2_ = 0;
   while(_loc2_ < ROWS)
   {
      var _loc1_ = container_mc.defaultList["line" + _loc2_];
      _loc1_.txt_0.setText("");
      _loc1_.txt_1.setText("");
      _loc1_.txt_2.setText("");
      _loc1_.txt_3.setText("");
      _loc1_.effect_mc.gotoAndStop(1);
      _loc1_.enabled = false;
      _loc2_ = _loc2_ + 1;
   }
}
function setList(listData)
{
   var _loc5_ = lib.util.ExtString.split(listData,"\n");
   var _loc4_ = 0;
   while(_loc4_ < _loc5_.length)
   {
      var _loc3_ = lib.util.ExtString.split(_loc5_[_loc4_],"\t");
      var _loc2_ = container_mc.defaultList["line" + _loc4_];
      if(_loc3_[0] == "" || _loc3_[0] == undefined)
      {
         return undefined;
      }
      _loc2_.txt_0.setText(_loc3_[0]);
      _loc2_.txt_1.setText(_loc3_[1]);
      _loc2_.txt_2.setText(_loc3_[2]);
      _loc2_.txt_3.setText(_loc3_[3]);
      _loc2_.index = _loc4_;
      _loc2_.enabled = true;
      _loc2_.hit.onRelease = function()
      {
         if(this._parent._parent.selectIndex != this._parent.index)
         {
            this._parent._parent["line" + this._parent._parent.selectIndex].effect_mc.gotoAndStop(1);
            this._parent._parent.selectIndex = this._parent.index;
            this._parent.effect_mc.gotoAndStop("active");
            ToGame_InGameTableWindow_Selected(this._parent.index);
         }
      };
      _loc2_.hit.onRollOver = function()
      {
         if(this._parent._parent.selectIndex != this._parent.index)
         {
            this._parent.effect_mc.gotoAndStop("over");
         }
      };
      _loc2_.hit.onRollOut = _loc2_.hit.onReleaseOutside = function()
      {
         if(this._parent._parent.selectIndex != this._parent.index)
         {
            this._parent.effect_mc.gotoAndStop(1);
         }
      };
      _loc4_ = _loc4_ + 1;
   }
}
function ToGame_InGameTableWindow_Init()
{
   fscommand("ToGame_InGameTableWindow_Init");
}
function ToGame_InGameTableWindow_BtnEvent(index)
{
   getURL("FSCommand:ToGame_InGameTableWindow_BtnEvent",index);
}
function ToGame_InGameTableWindow_SortEvent(index)
{
   getURL("FSCommand:ToGame_InGameTableWindow_SortEvent",index);
}
function ToGame_InGameTableWindow_SelectTab()
{
   getURL("FSCommand:ToGame_InGameTableWindow_SelectTab",selectTabIndex);
}
function ToGame_InGameTableWindow_Close()
{
   fscommand("ToGame_InGameTableWindow_Close");
}
function ToGame_InGameTableWindow_RequestPage(page)
{
   getURL("FSCommand:ToGame_InGameTableWindow_RequestPage",page);
}
function ToGame_InGameTableWindow_Selected(index)
{
   getURL("FSCommand:ToGame_InGameTableWindow_Selected",index);
}
function release(num)
{
   selectTabIndex = tab.activedNum;
   ToGame_InGameTableWindow_SelectTab(selectTabIndex);
}
var UI = this;
var UIname = "InGameTableWindow";
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
container_mc.title_txt.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
var selectTabIndex = 0;
var bWidgetOpen = false;
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
         UI._visible = false;
      }
   }
};
var ROWS = 16;
myListener.OnGame_InGameTableWindow_SetTitle = function(__title)
{
   container_mc.text_name.text = __title;
};
myListener.OnGame_InGameTableWindow_SetSort = function()
{
   container_mc.text_tap0.text = arguments[0];
   container_mc.text_tap1.text = arguments[1];
   container_mc.text_tap2.text = arguments[2];
   container_mc.text_tap3.text = arguments[3];
};
myListener.OnGame_InGameTableWindow_SetBtn = function()
{
   var _loc2_ = arguments.length;
   var _loc3_ = undefined;
   btn0.setVisible(false);
   btn1.setVisible(false);
   btn2.setVisible(false);
   if(arguments[0] == undefined || arguments[0] == "")
   {
      return undefined;
   }
   if(arguments[1] == undefined || arguments[1] == "")
   {
      btn0.setVisible(true);
      container_mc.btn0.setBtnSize(4);
      container_mc.btn0._x = 129;
   }
   else if(arguments[2] == undefined || arguments[2] == "")
   {
      btn0.setVisible(true);
      btn1.setVisible(true);
      container_mc.btn0.setBtnSize(3);
      container_mc.btn1.setBtnSize(3);
      container_mc.btn0._x = 40;
      container_mc.btn1._x = 245;
   }
   else if(arguments[3] == undefined || arguments[3] == "")
   {
      btn0.setVisible(true);
      btn1.setVisible(true);
      btn2.setVisible(true);
      container_mc.btn0.setBtnSize(1);
      container_mc.btn1.setBtnSize(1);
      container_mc.btn1.setBtnSize(1);
      container_mc.btn0._x = 6;
      container_mc.btn1._x = 160;
      container_mc.btn2._x = 314;
   }
   btn0.setText(arguments[0]);
   btn1.setText(arguments[1]);
   btn2.setText(arguments[2]);
   btn0.btn.onRelease2 = function()
   {
      ToGame_InGameTableWindow_BtnEvent(0);
   };
   btn1.btn.onRelease2 = function()
   {
      ToGame_InGameTableWindow_BtnEvent(1);
   };
   btn2.btn.onRelease2 = function()
   {
      ToGame_InGameTableWindow_BtnEvent(2);
   };
};
myListener.OnGame_InGameTableWindow_SetEnableBtn = function(index, falg)
{
   container_mc["btn" + index].txtBtn.setEnabled(Number(falg));
};
myListener.OnGame_InGameTableWindow_SetTab = function()
{
   var _loc4_ = arguments.length;
   if(arguments[0] == undefined || arguments[0] == "")
   {
      container_mc.tabBtn._visible = false;
      return undefined;
   }
   container_mc.tabBtn._visible = true;
   var _loc3_ = [];
   var _loc2_ = 0;
   while(_loc2_ < _loc4_)
   {
      if(arguments[_loc2_] == undefined || arguments[_loc2_] == "")
      {
         break;
      }
      _loc3_.push(arguments[0]);
      _loc2_ = _loc2_ + 1;
   }
   container_mc.tabBtn.labels = _loc3_;
   tab = container_mc.tabBtn.tab;
   tab.setRelease(release);
   tab.setTab(0,1);
};
myListener.OnGame_InGameTableWindow_SelectTabIndex = function(index)
{
   tab.setTab(index,1);
};
myListener.OnGame_InGameTableWindow_SetTable = function(listData, currentpage, totalpage)
{
   clearList();
   setList(listData);
   container_mc.numberSteper.setPage(Number(currentpage),Number(totalpage));
};
myListener.OnGame_InGameTableWindow_SelectLineIndex = function(index)
{
   if(index == undefined)
   {
      return undefined;
   }
   index = Number(index);
   var _loc2_ = container_mc.defaultList["line" + index];
   if(container_mc.defaultList.selectIndex != index)
   {
      container_mc.defaultList["line" + container_mc.defaultList.selectIndex].effect_mc.gotoAndStop(1);
      container_mc.defaultList.selectIndex = index;
      _loc2_.effect_mc.gotoAndStop("active");
   }
};
var x_btn = new lib.util.TxtBtn(container_mc.x_mc);
var btn0 = container_mc.btn0.txtBtn;
var btn1 = container_mc.btn1.txtBtn;
var btn2 = container_mc.btn2.txtBtn;
x_btn.setRelease(ToGame_InGameTableWindow_Close);
var i = 0;
while(i < 5)
{
   var sortBtn = container_mc["sort" + i + "_btn"];
   sortBtn.id = i;
   sortBtn.onRelease = function()
   {
      ToGame_InGameTableWindow_SortEvent(this.id);
   };
   sortBtn.onRollOver = function()
   {
      this.gotoAndStop(2);
   };
   sortBtn.onRollOut = sortBtn.onReleaseOutside = function()
   {
      this.gotoAndStop(1);
   };
   i++;
}
var tab = container_mc.tabBtn.tab;
container_mc.numberSteper.onChanged = function(p)
{
   ToGame_InGameTableWindow_RequestPage(p);
};
myListener.OnGame_InGameTableWindow_SetBtn();
myListener.OnGame_InGameTableWindow_SetTab();
ToGame_InGameTableWindow_Init();
