function clearList(container)
{
   container.selectIndex = undefined;
   var _loc2_ = 0;
   while(_loc2_ < ROWS)
   {
      var _loc1_ = container["line" + _loc2_];
      _loc1_.txt_0.setText("");
      _loc1_.txt_1.setText("");
      _loc1_.txt_2.setText("");
      _loc1_.effect_mc.gotoAndStop(1);
      _loc1_.enabled = false;
      _loc1_.hit.enabled = false;
      _loc2_ = _loc2_ + 1;
   }
}
function setList(container, listData)
{
   var _loc5_ = lib.util.ExtString.split(listData,"\n");
   var _loc4_ = 0;
   while(_loc4_ < _loc5_.length)
   {
      var _loc3_ = lib.util.ExtString.split(_loc5_[_loc4_],"\t");
      var _loc2_ = container["line" + _loc4_];
      if(_loc3_[1] == "" || _loc3_[1] == undefined)
      {
         return undefined;
      }
      _loc2_.txt_0.setText(_loc3_[3]);
      _loc2_.txt_1.setText(_loc3_[1]);
      _loc2_.txt_2.setText(_loc3_[2]);
      _loc2_.id = _loc3_[0];
      _loc2_.index = _loc4_;
      _loc2_.enabled = true;
      _loc2_.hit.enabled = true;
      _loc2_.hit.onRelease = function()
      {
         if(this._parent._parent.selectIndex != this._parent.index)
         {
            this._parent._parent["line" + this._parent._parent.selectIndex].effect_mc.gotoAndStop(1);
            this._parent._parent.selectIndex = this._parent.index;
            userList_id = this._parent._parent.selectIndex;
            execBtn.setEnabled(true);
            this._parent.effect_mc.gotoAndStop("active");
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
function ToGame_InGameBookMark_Init()
{
   lib.Debuger.trace("ToGame_InGameBookMark_Init  ");
   fscommand("ToGame_InGameBookMark_Init");
}
function ToGame_InGameBookMark_RequestLogList(sortkey)
{
   selectedSort = sortkey;
   lib.Debuger.trace("ToGame_InGameBookMark_RequestLogList  " + sortkey + "\t" + selectTabIndex);
   getURL("FSCommand:ToGame_InGameBookMark_RequestLogList",sortkey + "\t" + selectTabIndex);
}
function ToGame_InGameBookMark_RequestAdd()
{
   lib.Debuger.trace("ToGame_InGameBookMark_RequestAdd  ");
   fscommand("ToGame_InGameBookMark_RequestAdd");
}
function ToGame_InGameBookMark_RequestRemove()
{
   lib.Debuger.trace("ToGame_InGameBookMark_RequestRemove : " + userList_id + "__" + userList_numberSteper_number);
   getURL("FSCommand:ToGame_InGameBookMark_RequestRemove",userList_id + "\t" + userList_numberSteper_number);
}
function ToGame_InGameBookMark_Execute()
{
   var _loc1_ = selectTabIndex != 0?container_mc.userList:container_mc.defaultList;
   if(_loc1_.selectIndex != undefined)
   {
      var _loc2_ = _loc1_["line" + _loc1_.selectIndex].id;
      lib.Debuger.trace("ToGame_InGameBookMark_Execute  " + _loc2_ + "\t" + selectTabIndex);
      getURL("FSCommand:ToGame_InGameBookMark_Execute",_loc2_ + "\t" + selectTabIndex);
   }
}
function ToGame_InGameBookMark_SelectTab()
{
   lib.Debuger.trace("ToGame_InGameBookMark_SelectTab  " + selectTabIndex);
   getURL("FSCommand:ToGame_InGameBookMark_SelectTab",selectTabIndex);
}
function ToGame_InGameBookMark_CloseUI()
{
   lib.Debuger.trace("ToGame_InGameBookMark_CloseUI  ");
   fscommand("ToGame_InGameBookMark_CloseUI");
}
function ToGame_InGameBookMark_RequestPage(page, tabindex)
{
   lib.Debuger.trace("ToGame_InGameBookMark_RequestPage  " + page + "\t" + tabindex);
   getURL("FSCommand:ToGame_InGameBookMark_RequestPage",page + "\t" + tabindex);
}
function release(num)
{
   selectTabIndex = tab.activedNum;
   addBtn.setVisible(selectTabIndex == 1);
   delBtn.setVisible(selectTabIndex == 1);
   execBtn.setEnabled(container_mc.userList.selectIndex != undefined);
   container_mc.userList._visible = selectTabIndex == 1;
   container_mc.defaultList._visible = selectTabIndex == 0;
   if(selectTabIndex == 0)
   {
      execBtn.setEnabled(container_mc.defaultList.selectIndex != undefined);
   }
   else
   {
      execBtn.setEnabled(container_mc.userList.selectIndex != undefined);
   }
   ToGame_InGameBookMark_SelectTab(selectTabIndex);
}
var UI = this;
var UIname = "InGameBookMark";
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
container_mc.title_txt.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
var selectTabIndex = 0;
var userList_numberSteper_number = 0;
var userList_id = 0;
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
myListener.OnGame_InGameBookMark_SetLogList = function(listData, currentpage, totalpage, _tabIndex)
{
   var _loc1_ = Number(_tabIndex) != 0?container_mc.userList:container_mc.defaultList;
   clearList(_loc1_);
   setList(_loc1_,listData);
   _loc1_.numberSteper.setPage(Number(currentpage),Number(totalpage));
};
var x_btn = new lib.util.TxtBtn(container_mc.x_mc);
var execBtn = new lib.util.TxtBtn(container_mc.excute_mc,container_mc.excute_txt);
var addBtn = new lib.util.TxtBtn(container_mc.add_mc,container_mc.add_txt);
var delBtn = new lib.util.TxtBtn(container_mc.del_mc,container_mc.del_txt);
x_btn.setRelease(ToGame_InGameBookMark_CloseUI);
execBtn.setRelease(ToGame_InGameBookMark_Execute);
addBtn.setRelease(ToGame_InGameBookMark_RequestAdd);
delBtn.setRelease(ToGame_InGameBookMark_RequestRemove);
var i = 0;
while(i < 3)
{
   var sortBtn = container_mc["sort" + i + "_btn"];
   sortBtn.id = i;
   sortBtn.onRelease = function()
   {
      ToGame_InGameBookMark_RequestLogList(this.id);
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
var tabMc_array = new Array(container_mc.tab0_mc,container_mc.tab1_mc);
var tabTxt_array = new Array(container_mc.tab0_txt,container_mc.tab1_txt);
var tab = container_mc.tabMc.tab;
tab.setRelease(release);
container_mc.defaultList.numberSteper.onChanged = function(p)
{
   ToGame_InGameBookMark_RequestPage(p,0);
};
container_mc.userList.numberSteper.onChanged = function(p)
{
   userList_numberSteper_number = p;
   ToGame_InGameBookMark_RequestPage(p,1);
};
tab.setTab(selectTabIndex,1);
ToGame_InGameBookMark_Init();
ToGame_InGameBookMark_RequestLogList(0);
