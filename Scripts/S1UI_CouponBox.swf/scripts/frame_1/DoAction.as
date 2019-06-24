function ToGame_CouponBox_UseAll()
{
   fscommand("ToGame_CouponBox_UseAll");
}
function displayDetailInfo(itemH)
{
   container_mc.detailInfoMc.itemListMc._y = container_mc.detailInfoMc.titleFd._y + container_mc.detailInfoMc.titleFd.textHeight + 13;
   container_mc.detailInfoMc.dateFd._y = container_mc.detailInfoMc.itemListMc._y + itemH + 10;
   container_mc.detailInfoMc.dateFd_label._y = container_mc.detailInfoMc.dateFd._y;
   container_mc.detailInfoMc.limitFd._y = container_mc.detailInfoMc.dateFd._y + container_mc.detailInfoMc.dateFd.textHeight + 5;
   container_mc.detailInfoMc.limitFd_label._y = container_mc.detailInfoMc.limitFd._y;
   container_mc.detailInfoMc.descFd._y = container_mc.detailInfoMc.limitFd._y + container_mc.detailInfoMc.limitFd.textHeight + 20;
   container_mc.detailInfoMc.descNoticeIcon._y = container_mc.detailInfoMc.descFd._y;
   return container_mc.detailInfoMc.descFd._y + container_mc.detailInfoMc.descFd.textHeight + 2;
}
function displayDetailInfo2(itemH)
{
   container_mc.detailInfoMc2.itemListMc._y = container_mc.detailInfoMc2.titleFd._y + container_mc.detailInfoMc2.titleFd.textHeight + 13;
   container_mc.detailInfoMc2.dateFd._y = container_mc.detailInfoMc2.itemListMc._y + itemH + 10;
   container_mc.detailInfoMc2.dateFd_label._y = container_mc2.detailInfoMc.dateFd._y;
   container_mc.detailInfoMc2.limitFd._y = container_mc.detailInfoMc2.dateFd._y + container_mc.detailInfoMc2.dateFd.textHeight + 5;
   container_mc.detailInfoMc2.limitFd_label._y = container_mc.detailInfoMc2.limitFd._y;
   container_mc.detailInfoMc2.descFd._y = container_mc.detailInfoMc2.limitFd._y + container_mc.detailInfoMc2.limitFd.textHeight + 20;
   container_mc.detailInfoMc2.descNoticeIcon._y = container_mc.detailInfoMc2.descFd._y;
   return container_mc.detailInfoMc2.descFd._y + container_mc.detailInfoMc2.descFd.textHeight + 2;
}
function release2(num, blockEvent)
{
   if(num == 0)
   {
      ToGame_Couponbox_RequestSetTab("0");
      container_mc.scrollbar._visible = true;
      container_mc.scrollbar2._visible = false;
      container_mc.detailInfoMc._visible = true;
      container_mc.detailInfoMc2._visible = false;
      container_mc.listContainerMc._visible = true;
      container_mc.listContainerMc2._visible = false;
      container_mc.numberSteper._visible = true;
      container_mc.numberSteper2._visible = false;
   }
   else if(num == 1)
   {
      ToGame_Couponbox_RequestSetTab("1");
      container_mc.scrollbar._visible = false;
      container_mc.scrollbar2._visible = true;
      container_mc.detailInfoMc._visible = false;
      container_mc.detailInfoMc2._visible = true;
      container_mc.listContainerMc._visible = false;
      container_mc.listContainerMc2._visible = true;
      container_mc.numberSteper._visible = false;
      container_mc.numberSteper2._visible = true;
   }
}
function ToGame_CouponBox_Init()
{
   fscommand("ToGame_CouponBox_Init");
}
function ToGame_CouponBox_CloseUI()
{
   fscommand("ToGame_CouponBox_CloseUI");
}
function ToGame_CouponBox_RequestPage(page)
{
   getURL("FSCommand:ToGame_CouponBox_RequestPage",page);
}
function ToGame_CouponBox_CheckUseable(flag)
{
   getURL("FSCommand:ToGame_CouponBox_CheckUseable",flag);
}
function ToGame_CouponBox_UseCoupon(index)
{
   getURL("FSCommand:ToGame_CouponBox_UseCoupon",slectedIndex);
}
function ToGame_CouponBox_RemoveCoupon(index)
{
   getURL("FSCommand:ToGame_CouponBox_RemoveCoupon",slectedIndex);
}
function ToGame_CouponBox_RequestDetailInfo(index)
{
   getURL("FSCommand:ToGame_CouponBox_RequestDetailInfo",index);
}
function ToGame_Couponbox_RequestSetTab(index)
{
   getURL("FSCommand:ToGame_Couponbox_RequestSetTab",index);
}
function listClear()
{
   for(var _loc1_ in container_mc.listContainerMc)
   {
      container_mc.listContainerMc[_loc1_].clear();
      container_mc.listContainerMc[_loc1_].up_txt.setText("");
      container_mc.listContainerMc[_loc1_].down_txt.setText("");
      container_mc.listContainerMc[_loc1_].active = false;
      container_mc.listContainerMc[_loc1_]._parent["newIcon" + container_mc.listContainerMc[_loc1_].index]._visible = Number(slotData[4]);
      container_mc.listContainerMc[_loc1_].SLOT.enabled = false;
      container_mc.listContainerMc[_loc1_].newIcon._visible = false;
      lib.manager.ToolTip.remove(container_mc.listContainerMc[_loc1_].SLOT);
   }
}
function listClear2()
{
   for(var _loc1_ in container_mc.listContainerMc2)
   {
      container_mc.listContainerMc2[_loc1_].clear();
      container_mc.listContainerMc2[_loc1_].up_txt.setText("");
      container_mc.listContainerMc2[_loc1_].down_txt.setText("");
      container_mc.listContainerMc2[_loc1_].active = false;
      container_mc.listContainerMc2[_loc1_]._parent["newIcon" + container_mc.listContainerMc2[_loc1_].index]._visible = Number(slotData[4]);
      container_mc.listContainerMc2[_loc1_].SLOT.enabled = false;
      container_mc.listContainerMc2[_loc1_].newIcon._visible = false;
      lib.manager.ToolTip.remove(container_mc.listContainerMc2[_loc1_].SLOT);
   }
}
function detailInfoClear()
{
   container_mc.itemName_mc._visible = false;
   container_mc.detailInfoMc.descNoticeIcon._visible = false;
   container_mc.detailInfoMc.dateFd_label._visible = false;
   container_mc.detailInfoMc.limitFd_label._visible = false;
   container_mc.detailInfoMc.titleFd.text = "";
   container_mc.detailInfoMc.dateFd.text = "";
   container_mc.detailInfoMc.limitFd.text = "";
   container_mc.detailInfoMc.descFd.text = "";
   for(var _loc1_ in container_mc.detailInfoMc.itemListMc)
   {
      container_mc.detailInfoMc.itemListMc[_loc1_].removeMovieClip();
   }
   container_mc.scrollbar.pageSize = 0;
}
function detailInfoClear2()
{
   container_mc.itemName_mc2._visible = false;
   container_mc.detailInfoMc2.descNoticeIcon._visible = false;
   container_mc.detailInfoMc2.dateFd_label._visible = false;
   container_mc.detailInfoMc2.limitFd_label._visible = false;
   container_mc.detailInfoMc2.titleFd.text = "";
   container_mc.detailInfoMc2.dateFd.text = "";
   container_mc.detailInfoMc2.limitFd.text = "";
   container_mc.detailInfoMc2.descFd.text = "";
   for(var _loc1_ in container_mc.detailInfoMc2.itemListMc)
   {
      container_mc.detailInfoMc2.itemListMc[_loc1_].removeMovieClip();
   }
   container_mc.scrollbar2.pageSize = 0;
}
function selectIndex(index, flag)
{
   slectedIndex = index;
   use_btn.setEnabled(index != undefined && flag);
   remove_btn.setEnabled(index != undefined);
   ToGame_CouponBox_RequestDetailInfo(index);
}
_global.gfxExtensions = true;
var UI = this;
var UIname = "CouponBox";
var bWidgetOpen = false;
UI._visible = false;
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
container_mc.text_name.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
container_mc.detailInfoMc.titleFd.textColor = lib.info.TextColor.GENERAL_CONTENTS;
container_mc.detailInfoMc.dateFd.textColor = lib.info.TextColor.GENERAL_EMPHASIS;
container_mc.detailInfoMc.limitFd.textColor = lib.info.TextColor.GENERAL_EMPHASIS;
container_mc.detailInfoMc.descFd.textColor = lib.info.TextColor.GENERAL_NOTICE;
container_mc.detailInfoMc2.titleFd.textColor = lib.info.TextColor.GENERAL_CONTENTS;
container_mc.detailInfoMc2.dateFd.textColor = lib.info.TextColor.GENERAL_EMPHASIS;
container_mc.detailInfoMc2.limitFd.textColor = lib.info.TextColor.GENERAL_EMPHASIS;
container_mc.detailInfoMc2.descFd.textColor = lib.info.TextColor.GENERAL_NOTICE;
container_mc.detailInfoMc.defaultstr.verticalAlign = "center";
container_mc.detailInfoMc2.defaultstr.verticalAlign = "center";
container_mc.itemName_mc._visible = false;
container_mc.itemName_mc2._visible = false;
container_mc.scrollbar._visible = false;
container_mc.scrollbar2._visible = false;
container_mc.numberSteper._visible = false;
container_mc.numberSteper2._visible = false;
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
var LINEMAX = 6;
var slectedIndex;
myListener.OnGame_CouponBox_SetCouponList = function(_data, currentpage, maxpage, isUpdate)
{
   if(tab.activedNum == 0)
   {
      container_mc.scrollbar._visible = true;
      container_mc.numberSteper._visible = true;
   }
   listClear();
   detailInfoClear();
   container_mc.numberSteper.setPage(Number(currentpage),Number(maxpage));
   var _loc6_ = lib.util.ExtString.split(_data,"\n");
   var _loc5_ = _loc6_.length;
   if(_loc5_ == 0)
   {
      slectedIndex = undefined;
      use_btn.setEnabled(false);
      remove_btn.setEnabled(false);
      container_mc.detailInfoMc.defaultstr._visible = true;
   }
   else
   {
      container_mc.detailInfoMc.defaultstr._visible = false;
   }
   var _loc4_ = 0;
   while(_loc4_ < _loc5_)
   {
      var _loc3_ = lib.util.ExtString.split(_loc6_[_loc4_],"\t");
      var _loc2_ = container_mc.listContainerMc["coupon" + _loc4_];
      _loc2_.SLOT.enabled = true;
      _loc2_.setLineNum(2);
      _loc2_.index = _loc3_[0];
      _loc2_.draw(_loc3_[2]);
      lib.manager.ToolTip.add(_loc2_.SLOT,_loc3_[0] + "\t0",6);
      _loc2_.up_txt.setText(_loc3_[1]);
      _loc2_.down_txt.setText(_loc3_[3]);
      container_mc.listContainerMc["newIcon" + _loc4_]._visible = Number(_loc3_[4]);
      _loc2_.impossible = Number(_loc3_[5]);
      _loc2_.onRelease2 = function()
      {
         if(slectedIndex == this.index)
         {
            return undefined;
         }
         container_mc.listContainerMc["coupon" + slectedIndex].active = false;
         selectIndex(this.index,!this.impossible);
         this.active = true;
      };
      _loc4_ = _loc4_ + 1;
   }
   isUpdate = Boolean(Number(isUpdate));
   if(slectedIndex != undefined)
   {
      if(_loc5_ - 1 < slectedIndex && _loc5_ > 0)
      {
         slectedIndex = _loc5_ - 1;
      }
      container_mc.listContainerMc["coupon" + slectedIndex].active = true;
      if(isUpdate)
      {
         selectIndex(slectedIndex,!container_mc.listContainerMc["coupon" + slectedIndex].impossible);
      }
   }
};
myListener.OnGame_CouponBox_SetCouponList2 = function(_data, currentpage, maxpage, isUpdate)
{
   if(tab.activedNum == 1)
   {
      container_mc.scrollbar2._visible = true;
      container_mc.numberSteper2._visible = true;
   }
   listClear2();
   detailInfoClear2();
   container_mc.numberSteper2.setPage(Number(currentpage),Number(maxpage));
   var _loc6_ = lib.util.ExtString.split(_data,"\n");
   var _loc5_ = _loc6_.length;
   if(_loc5_ == 0)
   {
      slectedIndex = undefined;
      use_btn.setEnabled(false);
      remove_btn.setEnabled(false);
      container_mc.detailInfoMc2.defaultstr._visible = true;
   }
   else
   {
      container_mc.detailInfoMc2.defaultstr._visible = false;
   }
   var _loc4_ = 0;
   while(_loc4_ < _loc5_)
   {
      var _loc3_ = lib.util.ExtString.split(_loc6_[_loc4_],"\t");
      var _loc2_ = container_mc.listContainerMc2["coupon" + _loc4_];
      _loc2_.SLOT.enabled = true;
      _loc2_.setLineNum(2);
      _loc2_.index = _loc3_[0];
      _loc2_.draw(_loc3_[2]);
      lib.manager.ToolTip.add(_loc2_.SLOT,_loc3_[0] + "\t0",6);
      _loc2_.up_txt.setText(_loc3_[1]);
      _loc2_.down_txt.setText(_loc3_[3]);
      container_mc.listContainerMc2["newIcon" + _loc4_]._visible = Number(_loc3_[4]);
      _loc2_.impossible = Number(_loc3_[5]);
      _loc2_.onRelease2 = function()
      {
         if(slectedIndex == this.index)
         {
            return undefined;
         }
         container_mc.listContainerMc2["coupon" + slectedIndex].active = false;
         selectIndex(this.index,!this.impossible);
         this.active = true;
      };
      _loc4_ = _loc4_ + 1;
   }
   isUpdate = Boolean(Number(isUpdate));
   if(slectedIndex != undefined)
   {
      if(_loc5_ - 1 < slectedIndex && _loc5_ > 0)
      {
         slectedIndex = _loc5_ - 1;
      }
      container_mc.listContainerMc2["coupon" + slectedIndex].active = true;
      if(isUpdate)
      {
         selectIndex(slectedIndex,!container_mc.listContainerMc2["coupon" + slectedIndex].impossible);
      }
   }
};
myListener.OnGame_CouponBox_UpdateCoupon = function(index)
{
   var _loc1_ = container_mc.listContainerMc["coupon" + index];
   _loc1_.newIcon._visible = false;
};
myListener.OnGame_CouponBox_UpdateCoupon2 = function(index)
{
   var _loc1_ = container_mc.listContainerMc2["coupon" + index];
   _loc1_.newIcon._visible = false;
};
myListener.OnGame_CouponBox_SetDetailInfo = function(_title, itemList, date, limit, desc)
{
   detailInfoClear();
   container_mc.itemName_mc._visible = true;
   container_mc.detailInfoMc.titleFd.text = _title;
   container_mc.detailInfoMc.dateFd.text = date;
   container_mc.detailInfoMc.limitFd.text = limit;
   container_mc.detailInfoMc.descFd.htmlText = desc;
   if(container_mc.detailInfoMc.descFd.text != "")
   {
      container_mc.detailInfoMc.descNoticeIcon._visible = true;
   }
   if(container_mc.detailInfoMc.dateFd.text != "")
   {
      container_mc.detailInfoMc.dateFd_label._visible = true;
   }
   if(container_mc.detailInfoMc.limitFd.text != "")
   {
      container_mc.detailInfoMc.limitFd_label._visible = true;
   }
   var _loc4_ = lib.util.ExtString.split(itemList,"\n");
   var _loc5_ = 0;
   var _loc3_ = 0;
   while(_loc3_ < _loc4_.length)
   {
      var _loc2_ = lib.util.ExtString.split(_loc4_[_loc3_],"\t");
      var _loc1_ = container_mc.detailInfoMc.itemListMc.attachMovie("Slot_link","item" + _loc3_,_loc3_);
      _loc1_._x = _loc3_ % LINEMAX * (_loc1_.SLOT._width + 4);
      _loc1_._y = int(_loc3_ / LINEMAX) * (_loc1_.SLOT._height + 4);
      _loc1_.index = _loc2_[0];
      _loc1_.draw(_loc2_[1]);
      _loc1_.SLOT.enabled = false;
      _loc1_.display = true;
      _loc1_.grade = _loc2_[4];
      _loc1_.sealType = _loc2_[5];
      _loc1_.masterpiece = _loc2_[6];
      if(Number(_loc2_[3]))
      {
         _loc1_.num = _loc2_[3];
      }
      lib.manager.ToolTip.add(_loc1_.SLOT,_loc2_[0],6);
      _loc5_ = (int(_loc3_ / LINEMAX) + 1) * (_loc1_.SLOT._height + 4);
      _loc3_ = _loc3_ + 1;
   }
   var _loc6_ = displayDetailInfo(_loc5_);
   container_mc.scrollbar.pageSize = _loc6_;
};
myListener.OnGame_CouponBox_SetDetailInfo2 = function(_title, itemList, date, limit, desc)
{
   detailInfoClear2();
   container_mc.itemName_mc._visible = true;
   container_mc.detailInfoMc2.titleFd.text = _title;
   container_mc.detailInfoMc2.dateFd.text = date;
   container_mc.detailInfoMc2.limitFd.text = limit;
   container_mc.detailInfoMc2.descFd.htmlText = desc;
   if(container_mc.detailInfoMc2.descFd.text != "")
   {
      container_mc.detailInfoMc2.descNoticeIcon._visible = true;
   }
   if(container_mc.detailInfoMc2.dateFd.text != "")
   {
      container_mc.detailInfoMc2.dateFd_label._visible = true;
   }
   if(container_mc.detailInfoMc2.limitFd.text != "")
   {
      container_mc.detailInfoMc2.limitFd_label._visible = true;
   }
   var _loc4_ = lib.util.ExtString.split(itemList,"\n");
   var _loc5_ = 0;
   var _loc3_ = 0;
   while(_loc3_ < _loc4_.length)
   {
      var _loc2_ = lib.util.ExtString.split(_loc4_[_loc3_],"\t");
      var _loc1_ = container_mc.detailInfoMc2.itemListMc.attachMovie("Slot_link","item" + _loc3_,_loc3_);
      _loc1_._x = _loc3_ % LINEMAX * (_loc1_.SLOT._width + 4);
      _loc1_._y = int(_loc3_ / LINEMAX) * (_loc1_.SLOT._height + 4);
      _loc1_.index = _loc2_[0];
      _loc1_.draw(_loc2_[1]);
      _loc1_.SLOT.enabled = false;
      _loc1_.display = true;
      _loc1_.grade = _loc2_[4];
      _loc1_.sealType = _loc2_[5];
      _loc1_.masterpiece = _loc2_[6];
      if(Number(_loc2_[3]))
      {
         _loc1_.num = _loc2_[3];
      }
      lib.manager.ToolTip.add(_loc1_.SLOT,_loc2_[0],6);
      _loc5_ = (int(_loc3_ / LINEMAX) + 1) * (_loc1_.SLOT._height + 4);
      _loc3_ = _loc3_ + 1;
   }
   var _loc6_ = displayDetailInfo2(_loc5_);
   container_mc.scrollbar2.pageSize = _loc6_;
};
myListener.OnGame_CouponBox_SetUseBtn = function(enable)
{
   use_btn.setEnabled(Number(enable));
};
myListener.OnGame_CouponBox_SetRemoveBtn = function(enable)
{
   remove_btn.setEnabled(Number(enable));
};
var all_btn = container_mc.txtBtn1.txtBtn;
all_btn.setRelease(ToGame_CouponBox_UseAll);
myListener.OnGame_CouponBox_EnableUseAllBtn = function(enable)
{
   if(enable == "-1")
   {
      container_mc.txtBtn1._visible = false;
      container_mc.txtBtn0._x = 201;
   }
   else
   {
      container_mc.txtBtn1._visible = true;
      all_btn.setEnabled(Number(enable));
      container_mc.txtBtn0._x = 326;
   }
};
myListener.OnGame_CouponBox_EnableUseAllBtn("-1");
myListener.OnGame_CouponBox_SetTabVisible(_index,_enable);
tab.setVisible(_index,_enable);
myListener.OnGame_CouponBox_SetTabSetText(_index,_settext);
tab.setText(_index,_settext);
myListener.OnGame_CouponBox_SetTab = function(index)
{
   tab.setTab(index,1);
};
var detailContainerY = container_mc.detailInfoMc._y;
container_mc.scrollbar.displaySize = container_mc.detailInfoMc._height;
container_mc.scrollbar.rowHeight = 100;
container_mc.scrollbar.pageSize = container_mc.detailInfoMc._height;
container_mc.scrollbar.addListener(container_mc.detailInfoMc);
container_mc.scrollbar.setWheel(container_mc.detailInfoMc);
container_mc.detailInfoMc.onScroll = function(sc)
{
   this._y = detailContainerY - sc;
};
var detailContainerY2 = container_mc.detailInfoMc2._y;
container_mc.scrollbar2.displaySize = container_mc.detailInfoMc2._height;
container_mc.scrollbar2.rowHeight = 100;
container_mc.scrollbar2.pageSize = container_mc.detailInfoMc2._height;
container_mc.scrollbar2.addListener(container_mc.detailInfoMc2);
container_mc.scrollbar2.setWheel(container_mc.detailInfoMc2);
container_mc.detailInfoMc2.onScroll = function(sc)
{
   this._y = detailContainerY2 - sc;
};
container_mc.detailInfoMc.titleFd.autoSize = true;
container_mc.detailInfoMc.dateFd.autoSize = true;
container_mc.detailInfoMc.limitFd.autoSize = true;
container_mc.detailInfoMc.descFd.autoSize = true;
container_mc.detailInfoMc2.titleFd.autoSize = true;
container_mc.detailInfoMc2.dateFd.autoSize = true;
container_mc.detailInfoMc2.limitFd.autoSize = true;
container_mc.detailInfoMc2.descFd.autoSize = true;
container_mc.numberSteper.onChanged = function(page)
{
   ToGame_CouponBox_RequestPage(page);
};
container_mc.numberSteper2.onChanged = function(page)
{
   ToGame_CouponBox_RequestPage(page);
};
var x_btn = new lib.util.TxtBtn(container_mc.x_mc);
var use_btn = container_mc.txtBtn0.txtBtn;
x_btn.setRelease(ToGame_CouponBox_CloseUI);
use_btn.setRelease(ToGame_CouponBox_UseCoupon);
use_btn.setEnabled(false);
var tab = container_mc.tabBtn.tab;
detailInfoClear();
detailInfoClear2();
ToGame_CouponBox_Init();
tab.setRelease(release2);
tab.setTab(0,1);
