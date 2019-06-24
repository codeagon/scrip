var UI = this;
UI._visible = false;
var UIname = "TradeHouse";
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
container_mc.title_txt.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
var itemblockDisable = lib.gamedata.DefaultData.getDefaultUIData("itemblockDisable").param0 == "1";
function setDetailOptionCheckBox()
{
   var _loc6_ = container_mc.itemList_mc.detailOptionMc;
   var _loc5_ = checkBoxLavel.length;
   var _loc1_ = 0;
   while(_loc1_ < _loc5_)
   {
      var _loc3_ = _loc1_ + 1;
      var _loc2_ = String(_loc3_);
      var _loc4_ = _loc6_["checkBox1_" + _loc2_];
      _loc4_.label = checkBoxLavel[_loc1_];
      _loc1_ = _loc1_ + 1;
   }
}
function checkMode()
{
   if(container_mc.reg_mc._visible)
   {
      return 2;
   }
   if(container_mc.wait_mc._visible)
   {
      return 0;
   }
   if(container_mc.sold_mc._visible)
   {
      return 1;
   }
   if(container_mc.saleList_mc._visible)
   {
      return 3;
   }
   if(container_mc.buyList_mc._visible)
   {
      return 4;
   }
}
function resetDetailSearchOption()
{
   var _loc1_ = container_mc.itemList_mc.detailOptionMc;
   _loc1_.checkBox1_1.checked = false;
   _loc1_.checkBox1_2.checked = false;
   if(false == reformItemFarming)
   {
      _loc1_.checkBox1_3.checked = false;
      _loc1_.checkBox1_4.checked = false;
   }
   _loc1_.radioBox0_0.checked = true;
   _loc1_.radioBox0_1.checked = false;
   _loc1_.radioBox0_2.checked = false;
   detailMintxt0.setChanged(false);
   detailMaxtxt0.setChanged(false);
   detailMintxt1.setChanged(false);
   detailMaxtxt1.setChanged(false);
   detailMintxt2.setChanged(false);
   detailMaxtxt2.setChanged(false);
   detailMintxt2.setChanged(false);
   detailMaxtxt2.setChanged(false);
   detailMintxt0.min = DefaultMinMax[0].min;
   detailMintxt0.max = DefaultMinMax[0].max;
   detailMaxtxt0.min = DefaultMinMax[0].min;
   detailMaxtxt0.max = DefaultMinMax[0].max;
   detailMintxt1.min = DefaultMinMax[1].min;
   detailMintxt1.max = DefaultMinMax[1].max;
   detailMaxtxt1.min = DefaultMinMax[1].min;
   detailMaxtxt1.max = DefaultMinMax[1].max;
   detailMintxt2.min = DefaultMinMax[2].min;
   detailMintxt2.max = DefaultMinMax[2].max;
   detailMaxtxt2.min = DefaultMinMax[2].min;
   detailMaxtxt2.max = DefaultMinMax[2].max;
   detailMintxt0.caption = DefaultMinMax[0].min;
   detailMaxtxt0.caption = DefaultMinMax[0].max;
   detailMintxt1.caption = DefaultMinMax[1].min;
   detailMaxtxt1.caption = DefaultMinMax[1].max;
   detailMintxt2.caption = DefaultMinMax[2].min;
   detailMaxtxt2.caption = DefaultMinMax[2].max;
   detailMintxt3.total = String(DefaultMinMax[3].min);
   detailMaxtxt3.total = String(DefaultMinMax[3].max);
   detailMaxtxt3.max = String(DefaultMinMax[3].max);
   detailMaxtxt3.min = String(DefaultMinMax[3].min);
   detailMintxt3.max = String(DefaultMinMax[3].max);
   detailMintxt3.min = String(DefaultMinMax[3].min);
   detailMaxtxt4.max = String(DefaultMinMax[4].max);
   detailMaxtxt4.min = String(DefaultMinMax[4].min);
   detailMintxt4.max = String(DefaultMinMax[4].max);
   detailMintxt4.min = String(DefaultMinMax[4].min);
   detailMintxt4.text = String(DefaultMinMax[4].min);
   detailMaxtxt4.text = String(DefaultMinMax[4].max);
   checkDetailOption();
}
function resetSmartSearch()
{
   var _loc1_ = container_mc.itemList_mc.smartOptionMc;
   _loc1_.smartContainer["line" + selectedSmartIndex].bgMc.gotoAndStop(1);
   selectedSmartIndex = undefined;
   container_mc.itemList_mc.smartBtn.activeMc._alpha = 0;
   container_mc.itemList_mc.smartGuideTxt.setText("",1);
}
function ToGame_TradeHouse_SelectSmartSearch(index)
{
   container_mc.itemList_mc.smartBtn.activeMc._alpha = 100;
   resetDetailSearchOption();
   getURL("FSCommand:ToGame_TradeHouse_SelectSmartSearch",index);
}
function openSmartOption()
{
   container_mc.itemList_mc.smartOptionMc._visible = !container_mc.itemList_mc.smartOptionMc._visible;
   container_mc.itemList_mc.detailOptionMc._visible = false;
}
function openDetailOption()
{
   checkDetailOption();
   container_mc.itemList_mc.detailOptionMc._visible = !container_mc.itemList_mc.detailOptionMc._visible;
   container_mc.itemList_mc.smartOptionMc._visible = false;
}
function checkDetailOption()
{
   var _loc2_ = container_mc.itemList_mc.detailOptionMc;
   var _loc1_ = false;
   _loc1_ = _loc1_ || _loc2_.checkBox1_1.checked;
   _loc1_ = _loc1_ || _loc2_.checkBox1_2.checked;
   if(false == reformItemFarming)
   {
      _loc1_ = _loc1_ || _loc2_.checkBox1_3.checked;
      _loc1_ = _loc1_ || _loc2_.checkBox1_4.checked;
   }
   _loc1_ = _loc1_ || _loc2_.radioBox0_1.checked;
   _loc1_ = _loc1_ || _loc2_.radioBox0_2.checked;
   _loc1_ = _loc1_ || detailMintxt0.changed;
   _loc1_ = _loc1_ || detailMaxtxt0.changed;
   _loc1_ = _loc1_ || detailMintxt1.changed;
   _loc1_ = _loc1_ || detailMaxtxt1.changed;
   _loc1_ = _loc1_ || detailMintxt2.changed;
   _loc1_ = _loc1_ || detailMaxtxt2.changed;
   _loc1_ = _loc1_ || detailMintxt3.total_nums != DefaultMinMax[3].min;
   _loc1_ = _loc1_ || detailMaxtxt3.total_nums != DefaultMinMax[3].max;
   _loc1_ = _loc1_ || detailMintxt4.text != DefaultMinMax[4].min;
   _loc1_ = _loc1_ || detailMaxtxt4.text != DefaultMinMax[4].max;
   if(_loc1_)
   {
      container_mc.itemList_mc.detailBtn.activeMc._alpha = 100;
   }
   else
   {
      container_mc.itemList_mc.detailBtn.activeMc._alpha = 0;
   }
}
function sortArrang(tg)
{
   if(tg._parent == container_mc.wait_mc)
   {
      container_mc.wait_mc.uperBtn._visible = tg._name != "uperBtn";
      container_mc.wait_mc.lowerBtn._visible = tg._name != "lowerBtn";
      var _loc2_ = !container_mc.wait_mc.lowerBtn._visible?2:1;
      ToGame_TradeHouse_SortWaitList(container_mc.wait_mc.combobox.selected,_loc2_);
   }
   else if(tg._parent == container_mc.sold_mc)
   {
      container_mc.sold_mc.uperBtn._visible = tg._name != "uperBtn";
      container_mc.sold_mc.lowerBtn._visible = tg._name != "lowerBtn";
      _loc2_ = !container_mc.sold_mc.lowerBtn._visible?2:1;
      ToGame_TradeHouse_SortSoldList(container_mc.sold_mc.combobox.selected,_loc2_);
   }
}
function addTree(depth, name, open)
{
   if(getLine(depth) == null)
   {
      var _loc4_ = depth.split("_");
      var _loc12_ = Number(_loc4_[0]);
      var _loc11_ = Number(_loc4_[1]);
      var _loc9_ = Number(_loc4_[2]);
      var _loc14_ = 0;
      if(_loc12_ == undefined || isNaN(_loc12_))
      {
         _loc12_ = 0;
      }
      if(_loc11_ == undefined || isNaN(_loc11_))
      {
         _loc11_ = 0;
      }
      if(_loc9_ == undefined || isNaN(_loc9_))
      {
         _loc9_ = 0;
      }
      if(_loc11_ == 0)
      {
         _loc14_ = 1;
      }
      else if(_loc11_ != 0 && _loc9_ == 0)
      {
         _loc14_ = 2;
      }
      else if(_loc11_ != 0 && _loc9_ != 0)
      {
         _loc14_ = 3;
      }
      var _loc3_ = container_mc.itemList_mc.category_mc.blank.attachMovie("depth" + _loc14_,depth,container_mc.itemList_mc.category_mc.blank.getNextHighestDepth());
      _loc3_.txt.autoSize = true;
      _loc3_.txt.text = name;
      if(_loc3_.txt._width > 175)
      {
         listWidth = _loc3_.txt._width;
      }
      listWidth_Array.push(_loc3_);
      _loc3_.hit.onRollOver = function()
      {
         if(treeClickedMc != this._parent && this._parent.bg._currentframe != 4)
         {
            this._parent.bg.gotoAndStop(2);
         }
      };
      _loc3_.hit.onRollOut = _loc3_.hit.onReleaseOutside = function()
      {
         if(treeClickedMc != this._parent)
         {
            this._parent.bg.gotoAndStop(1);
         }
         else
         {
            this._parent.bg.gotoAndStop(4);
         }
      };
      _loc3_.hit.onPress = function()
      {
         if(this._parent.bg._currentframe != 4)
         {
            this._parent.bg.gotoAndStop(3);
         }
      };
      _loc3_.hit.onRelease = function()
      {
         lib.manager.UISound.play(lib.manager.UISound.MAIN_BTN);
         if(arguments[0] != 1)
         {
            ToGame_TradeHouse_SelectCategory(this._parent.o.depth);
         }
         if(this._parent.o.depth3 == 0)
         {
            if(this._parent.o.open)
            {
               setOpen(this._parent.o.depth,0);
            }
            else
            {
               setOpen(this._parent.o.depth,1);
            }
         }
         if(treeClickedMc != this._parent)
         {
            if(treeClickedMc != null)
            {
               treeClickedMc.bg.gotoAndStop(1);
            }
            treeClickedMc = this._parent;
            this._parent.bg.gotoAndStop(4);
         }
      };
      _loc3_.open_btn.onRelease = function()
      {
         lib.manager.UISound.play(lib.manager.UISound.MAIN_BTN);
         setOpen(this._parent._name,!this._parent.o.open);
      };
      var _loc5_ = {depth1:_loc12_,depth2:_loc11_,depth3:_loc9_,depth:depth,thisDepth:_loc14_,label:name,open:open,mc:_loc3_};
      treeObj_array.push(_loc5_);
      _loc3_.o = _loc5_;
   }
   if(listWidth > 0)
   {
      listWidth_align();
   }
}
function listWidth_align()
{
   var _loc1_ = 0;
   while(_loc1_ < listWidth_Array.length)
   {
      listWidth_Array[_loc1_].bg._width = 192 + (listWidth - 165);
      listWidth_Array[_loc1_].hit._width = 192 + (listWidth - 165);
      _loc1_ = _loc1_ + 1;
   }
}
function getLine(depth)
{
   var _loc2_ = treeObj_array.length;
   var _loc1_ = 0;
   while(_loc1_ < _loc2_)
   {
      if(treeObj_array[_loc1_].depth == depth)
      {
         return treeObj_array[_loc1_];
      }
      _loc1_ = _loc1_ + 1;
   }
   return null;
}
function setOpen(depth, bTrue)
{
   var _loc1_ = getLine(depth);
   if(_loc1_ != null)
   {
      if(_loc1_.mc.open_btn._visible == false)
      {
         return undefined;
      }
      _loc1_.open = bTrue;
      align();
   }
}
function align()
{
   var _loc9_ = 28;
   var _loc3_ = [];
   var _loc12_ = treeObj_array.length;
   var _loc8_ = 0;
   while(_loc8_ < _loc12_)
   {
      var _loc1_ = treeObj_array[_loc8_];
      if(_loc1_.thisDepth == 1)
      {
         if(_loc3_[_loc1_.depth1] == undefined)
         {
            _loc3_[_loc1_.depth1] = new Array();
         }
         _loc3_[_loc1_.depth1].o = _loc1_;
      }
      else if(_loc1_.thisDepth == 2)
      {
         if(_loc3_[_loc1_.depth1][_loc1_.depth2] == undefined)
         {
            _loc3_[_loc1_.depth1][_loc1_.depth2] = new Array();
         }
         _loc3_[_loc1_.depth1][_loc1_.depth2].o = _loc1_;
      }
      else if(_loc1_.thisDepth == 3)
      {
         if(_loc3_[_loc1_.depth1][_loc1_.depth2][_loc1_.depth3] == undefined)
         {
            _loc3_[_loc1_.depth1][_loc1_.depth2][_loc1_.depth3] = new Array();
         }
         _loc3_[_loc1_.depth1][_loc1_.depth2][_loc1_.depth3].o = _loc1_;
      }
      _loc8_ = _loc8_ + 1;
   }
   var _loc13_ = _loc3_.length;
   _loc8_ = 1;
   while(_loc8_ < _loc13_)
   {
      var _loc5_ = _loc3_[_loc8_].o;
      _loc5_.mc._y = _loc9_;
      _loc9_ = _loc9_ + _loc5_.mc._height;
      _loc5_.mc.open_btn.gotoAndStop(_loc5_.open + 1);
      var _loc11_ = _loc3_[_loc8_].length;
      if(_loc11_ <= 0)
      {
         _loc5_.mc.open_btn._visible = false;
      }
      var _loc7_ = 1;
      while(_loc7_ < _loc11_)
      {
         var _loc2_ = _loc3_[_loc8_][_loc7_].o;
         if(_loc5_.open)
         {
            _loc2_.mc._y = _loc9_;
            _loc9_ = _loc9_ + _loc2_.mc._height;
         }
         else
         {
            _loc2_.mc._y = 0;
         }
         _loc2_.mc._visible = _loc5_.open;
         _loc2_.mc.open_btn.gotoAndStop(_loc2_.open + 1);
         var _loc10_ = _loc3_[_loc8_][_loc7_].length;
         if(_loc10_ <= 0)
         {
            _loc2_.mc.open_btn._visible = false;
         }
         var _loc6_ = 1;
         while(_loc6_ < _loc10_)
         {
            var _loc4_ = _loc3_[_loc8_][_loc7_][_loc6_].o;
            if(_loc2_.open && _loc5_.open)
            {
               _loc4_.mc._y = _loc9_;
               _loc9_ = _loc9_ + _loc4_.mc._height;
            }
            else
            {
               _loc4_.mc._y = 0;
            }
            _loc4_.mc._visible = _loc2_.open && _loc5_.open;
            _loc6_ = _loc6_ + 1;
         }
         _loc7_ = _loc7_ + 1;
      }
      _loc8_ = _loc8_ + 1;
   }
   var _loc14_ = true;
   if(scrollBar.__get__scroll() == scrollBar.__get__scrollMax() && scrollBar.__get__scrollMax() != 0)
   {
      _loc14_ = false;
   }
   scrollBar.__set__pageSize(list._height + 30);
   if(!_loc14_)
   {
      scrollBar.__set__scroll(scrollBar.scrollMax);
   }
   scrollBar_w.__set__pageSize(list._width);
}
function allCategoryClose()
{
   var _loc2_ = treeObj_array.length;
   var _loc1_ = 0;
   while(_loc1_ < _loc2_)
   {
      treeObj_array[_loc1_].open = false;
      _loc1_ = _loc1_ + 1;
   }
}
function clearCategory()
{
   for(str in container_mc.itemList_mc.category_mc.blank)
   {
      var _loc1_ = container_mc.itemList_mc.category_mc.blank[str];
      if(_loc1_ != container_mc.itemList_mc.category_mc.blank.all_btn && _loc1_ != container_mc.itemList_mc.category_mc.blank)
      {
         _loc1_.removeMovieClip();
      }
   }
   container_mc.itemList_mc.category_mc.blank.all_btn.bg.gotoAndStop(1);
   treeObj_array = [];
   treeClickedMc = null;
}
function ToGame_TradeHouse_CloseUI()
{
   fscommand("ToGame_TradeHouse_CloseUI");
}
function ToGame_TradeHouse_CancelReg(id)
{
   getURL("FSCommand:ToGame_TradeHouse_CancelReg",id);
}
function ToGame_TradeHouse_RequestSetTab(tab)
{
   getURL("FSCommand:ToGame_TradeHouse_RequestSetTab",tab);
}
function ToGame_TradeHouse_RefreshList()
{
   fscommand("ToGame_TradeHouse_RefreshList");
}
function ToGame_TradeHouse_SelectWaitList()
{
   fscommand("ToGame_TradeHouse_SelectWaitList");
}
function ToGame_TradeHouse_SelectSoldList()
{
   fscommand("ToGame_TradeHouse_SelectSoldList");
}
function ToGame_TradeHouse_RequestBargain(lineId)
{
   getURL("FSCommand:ToGame_TradeHouse_RequestBargain",lineId);
}
function ToGame_TradeHouse_CalculateSaleList(id)
{
   if(id == undefined)
   {
      getURL("FSCommand:ToGame_TradeHouse_CalculateSaleList",saleListClickId);
   }
   else
   {
      getURL("FSCommand:ToGame_TradeHouse_CalculateSaleList",id);
   }
}
function ToGame_TradeHouse_CalculateAllSaleList()
{
   fscommand("ToGame_TradeHouse_CalculateAllSaleList");
}
function ToGame_TradeHouse_CalculateBuyList(id)
{
   if(id == undefined)
   {
      getURL("FSCommand:ToGame_TradeHouse_CalculateBuyList",buyListClickId);
   }
   else
   {
      getURL("FSCommand:ToGame_TradeHouse_CalculateBuyList",id);
   }
}
function ToGame_TradeHouse_CalculateAllBuyList()
{
   fscommand("ToGame_TradeHouse_CalculateAllBuyList");
}
function ToGame_TradeHouse_InitSearchCondition()
{
   resetSmartSearch();
   fscommand("ToGame_TradeHouse_InitSearchCondition");
}
function ToGame_TradeHouse_SearchItem()
{
   resetSmartSearch();
   container_mc.itemList_mc.detailOptionMc._visible = false;
   container_mc.itemList_mc.smartOptionMc._visible = false;
   checkDetailOption();
   var _loc1_ = getSearchConditionStr();
   lib.Debuger.trace("값" + lib.manager.Focus.dataId);
   if(lib.manager.Focus.dataId)
   {
      getURL("FSCommand:ToGame_TradeHouse_SearchItem",_loc1_ + "\t" + lib.manager.Focus.dataId);
   }
   else
   {
      getURL("FSCommand:ToGame_TradeHouse_SearchItem",_loc1_);
   }
}
function getSearchConditionStr()
{
   var _loc1_ = "";
   var _loc4_ = container_mc.itemList_mc.combobox1.selected;
   var _loc5_ = container_mc.itemList_mc.combobox0.selected;
   var _loc3_ = lib.util.ExtString.trim(searchInput_txt.text);
   if(_loc3_ == lib.util.UIString.getUIString("$321046"))
   {
      _loc3_ = "";
   }
   _loc1_ = minLevel_txt.text + "\t" + maxLevel_txt.text + "\t" + _loc3_ + "\t" + _loc4_ + "\t" + _loc5_;
   var _loc2_ = container_mc.itemList_mc.detailOptionMc;
   _loc1_ = _loc1_ + ("\t" + Number(_loc2_.checkBox1_1.checked));
   _loc1_ = _loc1_ + Number(_loc2_.checkBox1_2.checked);
   if(false == reformItemFarming)
   {
      _loc1_ = _loc1_ + Number(_loc2_.checkBox1_3.checked);
      _loc1_ = _loc1_ + Number(_loc2_.checkBox1_4.checked);
   }
   if(_loc2_.radioBox0_0.checked)
   {
      _loc1_ = _loc1_ + "\t0";
   }
   else if(_loc2_.radioBox0_1.checked)
   {
      _loc1_ = _loc1_ + "\t1";
   }
   else if(_loc2_.radioBox0_2.checked)
   {
      _loc1_ = _loc1_ + "\t2";
   }
   if(lib.util.ExtString.trim(_loc2_.mintxt2.text) == "")
   {
      _loc1_ = _loc1_ + "\t-1";
   }
   else
   {
      _loc1_ = _loc1_ + ("\t" + lib.util.ExtString.trimChar(_loc2_.mintxt2.text));
   }
   if(lib.util.ExtString.trim(_loc2_.maxtxt2.text) == "")
   {
      _loc1_ = _loc1_ + "\t-1";
   }
   else
   {
      _loc1_ = _loc1_ + ("\t" + lib.util.ExtString.trimChar(_loc2_.maxtxt2.text));
   }
   if(lib.util.ExtString.trim(_loc2_.mintxt0.text) == "")
   {
      _loc1_ = _loc1_ + "\t-1";
   }
   else
   {
      _loc1_ = _loc1_ + ("\t" + lib.util.ExtString.trimChar(_loc2_.mintxt0.text));
   }
   if(lib.util.ExtString.trim(_loc2_.maxtxt0.text) == "")
   {
      _loc1_ = _loc1_ + "\t-1";
   }
   else
   {
      _loc1_ = _loc1_ + ("\t" + lib.util.ExtString.trimChar(_loc2_.maxtxt0.text));
   }
   if(lib.util.ExtString.trim(_loc2_.mintxt1.text) == "")
   {
      _loc1_ = _loc1_ + "\t-1";
   }
   else
   {
      _loc1_ = _loc1_ + ("\t" + lib.util.ExtString.trimChar(_loc2_.mintxt1.text));
   }
   if(lib.util.ExtString.trim(_loc2_.maxtxt1.text) == "")
   {
      _loc1_ = _loc1_ + "\t-1";
   }
   else
   {
      _loc1_ = _loc1_ + ("\t" + lib.util.ExtString.trimChar(_loc2_.maxtxt1.text));
   }
   _loc1_ = _loc1_ + ("\t" + lib.util.ExtString.trimChar(detailMintxt3.total_nums));
   _loc1_ = _loc1_ + ("\t" + lib.util.ExtString.trimChar(detailMaxtxt3.total_nums));
   _loc1_ = _loc1_ + ("\t" + lib.util.ExtString.trimChar(detailMintxt4.text));
   _loc1_ = _loc1_ + ("\t" + lib.util.ExtString.trimChar(detailMaxtxt4.text));
   return _loc1_;
}
function ToGame_TradeHouse_SelectCategory(depth)
{
   getURL("FSCommand:ToGame_TradeHouse_SelectCategory",depth);
}
function ToGame_TradeHouse_DirectBuy(id)
{
   getURL("FSCommand:ToGame_TradeHouse_DirectBuy",id);
}
function ToGame_TradeHouse_TcatBuy(id)
{
   getURL("FSCommand:ToGame_TradeHouse_TcatBuy",id);
}
function ToGame_TradeHouse_CheckedTradeAble(checked)
{
   getURL("FSCommand:ToGame_TradeHouse_CheckedTradeAble",checked);
}
function ToGame_TradeHouse_RightBtnClicked(id)
{
   getURL("FSCommand:ToGame_TradeHouse_RightBtnClicked",id);
}
function selectedSortBtnOfWaitList(index, bNotifyClient)
{
   container_mc.wait_mc.combobox.cation = "$321137";
   container_mc.wait_mc.lowerBtn._visible = true;
   container_mc.wait_mc.uperBtn._visible = false;
   container_mc.wait_mc.lowerBtn.gotoAndStop(4);
   container_mc.wait_mc.lowerBtn.enabled = false;
   container_mc.wait_mc["sortArowMc" + waitSlotObj.rindex]._visible = false;
   container_mc.wait_mc["sortArowMc" + index]._visible = true;
   var _loc1_ = index;
   var _loc3_ = 0;
   waitSlotObj.pressCount = !(waitSlotObj.pressCount == undefined || waitSlotObj.index != _loc1_)?waitSlotObj.pressCount + 1:0;
   waitSlotObj.index = _loc1_;
   waitSlotObj.rindex = index;
   if(_loc1_ == 3 || _loc1_ == 4 || _loc1_ == 5)
   {
      if(waitSlotObj.pressCount % 4 < 2)
      {
         if(_loc1_ == 3)
         {
            container_mc.wait_mc.sortBtn["sortBtn" + index].labelFd.text = sortChangeStr_2;
         }
         if(_loc1_ == 4)
         {
            container_mc.wait_mc.sortBtn["sortBtn" + index].labelFd.text = sortChangeStr_0;
         }
         if(_loc1_ == 5)
         {
            container_mc.wait_mc.sortBtn["sortBtn" + index].labelFd.text = traceTypeStr_0;
         }
         waitSlotObj.priceIns = 0;
         if(_loc1_ == 3)
         {
            _loc3_ = 7;
         }
         if(_loc1_ == 4)
         {
            if(TCATDISABLE == 1)
            {
               _loc3_ = 16;
            }
            else
            {
               _loc3_ = 14;
            }
         }
         if(_loc1_ == 5)
         {
            _loc3_ = 11;
         }
      }
      else
      {
         if(_loc1_ == 3)
         {
            container_mc.wait_mc.sortBtn["sortBtn" + index].labelFd.text = sortChangeStr_3;
         }
         if(_loc1_ == 4)
         {
            container_mc.wait_mc.sortBtn["sortBtn" + index].labelFd.text = sortChangeStr_1;
         }
         if(_loc1_ == 5)
         {
            if(TCATDISABLE == 1)
            {
               container_mc.wait_mc.sortBtn["sortBtn" + index].labelFd.text = traceTypeStr_1;
            }
            else
            {
               container_mc.wait_mc.sortBtn["sortBtn" + index].labelFd.text = traceTypeStr_0;
            }
         }
         waitSlotObj.priceIns = 1;
         if(_loc1_ == 3)
         {
            _loc3_ = 8;
         }
         if(_loc1_ == 4)
         {
            if(TCATDISABLE == 1)
            {
               _loc3_ = 17;
            }
            else
            {
               _loc3_ = 15;
            }
         }
         if(_loc1_ == 5)
         {
            if(TCATDISABLE == 1)
            {
               _loc3_ = 13;
            }
            else
            {
               _loc3_ = 11;
            }
         }
      }
      var _loc4_ = waitSlotObj.pressCount % 2 + 1;
      if(_loc4_ == 2)
      {
         container_mc.wait_mc["sortArowMc" + index]._yscale = -100;
      }
      else
      {
         container_mc.wait_mc["sortArowMc" + index]._yscale = 100;
      }
   }
   else if(_loc1_ == 2)
   {
      _loc4_ = waitSlotObj.pressCount % 2 + 1;
      if(_loc4_ == 2)
      {
         container_mc.wait_mc["sortArowMc" + index]._yscale = -100;
      }
      else
      {
         container_mc.wait_mc["sortArowMc" + index]._yscale = 100;
      }
      _loc3_ = 5;
   }
   if(bNotifyClient)
   {
      ToGame_TradeHouse_SortWaitList(_loc3_,waitSlotObj.pressCount % 2 + 1);
   }
}
function ToGame_TradeHouse_SortWaitList(aSort, upOrDown)
{
   getURL("FSCommand:ToGame_TradeHouse_SortWaitList",aSort + "\t" + upOrDown);
}
function ToGame_TradeHouse_SortSoldList(aSort, upOrDown)
{
   getURL("FSCommand:ToGame_TradeHouse_SortSoldList",aSort + "\t" + upOrDown);
}
function ToGame_TradeHouse_RequestSetPage(pageNum)
{
   getURL("FSCommand:ToGame_TradeHouse_RequestSetPage",pageNum);
}
function ToGame_TradeHouse_SearchCondition()
{
   var _loc1_ = getSearchConditionStr();
}
function release(num, noRequestEvent)
{
   setTab(num,noRequestEvent);
}
function setTab(selectTab, noRequestEvent)
{
   var _loc2_ = selectTab;
   if(selectTab == 0)
   {
      waitOrSold = "wait";
      container_mc.reg_mc._visible = false;
      container_mc.itemList_mc._visible = true;
      container_mc.wait_mc._visible = true;
      container_mc.sold_mc._visible = false;
      container_mc.saleList_mc._visible = false;
      container_mc.buyList_mc._visible = false;
      container_mc.itemList_mc.checkBox._visible = true;
      container_mc.itemList_mc.fd0._visible = true;
   }
   else if(selectTab == 1)
   {
      waitOrSold = "sold";
      container_mc.reg_mc._visible = false;
      container_mc.itemList_mc._visible = true;
      container_mc.wait_mc._visible = false;
      container_mc.sold_mc._visible = true;
      container_mc.saleList_mc._visible = false;
      container_mc.buyList_mc._visible = false;
      container_mc.itemList_mc.checkBox._visible = false;
      container_mc.itemList_mc.fd0._visible = false;
   }
   else if(selectTab == 2)
   {
      container_mc.reg_mc._visible = true;
      container_mc.itemList_mc._visible = false;
      container_mc.wait_mc._visible = false;
      container_mc.sold_mc._visible = false;
      container_mc.saleList_mc._visible = false;
      container_mc.buyList_mc._visible = false;
   }
   else if(selectTab == 3)
   {
      container_mc.reg_mc._visible = false;
      container_mc.itemList_mc._visible = false;
      container_mc.wait_mc._visible = false;
      container_mc.sold_mc._visible = false;
      container_mc.saleList_mc._visible = true;
      container_mc.buyList_mc._visible = false;
      myListener.OnGame_TradeHouse_SetPageInfo(1,1);
   }
   else if(selectTab == 4)
   {
      container_mc.reg_mc._visible = false;
      container_mc.itemList_mc._visible = false;
      container_mc.wait_mc._visible = false;
      container_mc.sold_mc._visible = false;
      container_mc.saleList_mc._visible = false;
      container_mc.buyList_mc._visible = true;
      myListener.OnGame_TradeHouse_SetPageInfo(1,1);
   }
   if(noRequestEvent != 1)
   {
      if(_loc2_ == 0)
      {
         ToGame_TradeHouse_SelectWaitList();
      }
      else if(_loc2_ == 1)
      {
         ToGame_TradeHouse_SelectSoldList();
      }
      else
      {
         ToGame_TradeHouse_RequestSetTab(_loc2_ - 1);
      }
   }
   directChangeTip();
}
if(itemblockDisable)
{
   container_mc.itemList_mc.detailOptionMc.lb1._visible = false;
   container_mc.itemList_mc.detailOptionMc.radioBox0_0._visible = false;
   container_mc.itemList_mc.detailOptionMc.radioBox0_1._visible = false;
   container_mc.itemList_mc.detailOptionMc.radioBox0_2._visible = false;
   container_mc.itemList_mc.detailOptionMc.lb0._y = 58;
   container_mc.itemList_mc.detailOptionMc.checkBox1_1._y = 64.5;
   container_mc.itemList_mc.detailOptionMc.checkBox1_2._y = 64.5;
   container_mc.itemList_mc.detailOptionMc.checkBox1_3._y = 64.5;
   container_mc.itemList_mc.detailOptionMc.checkBox1_4._y = 64.5;
}
var reformItemFarming = lib.gamedata.DefaultData.getDefaultUIData("reformItemFarming").param0 == "1";
var detailMc = container_mc.itemList_mc.detailOptionMc;
if(reformItemFarming)
{
   detailMc.checkBox1_3._visible = detailMc.checkBox1_4._visible = false;
   detailMc.listBg._width = 540;
}
var checkBoxLavel = !reformItemFarming?["$321114","$321115","$321116","$321161"]:["$321114","$321116"];
var comboBoxData_beforeReform = [{id:0,label:"$321119"},{id:1,label:"$321120"},{id:3,label:"$321122"},{id:6,label:"$321125"},{id:7,label:"$321126"},{id:8,label:"$321127"},{id:9,label:"$321128"},{id:10,label:"$321129"}];
var comboBoxData_afterReform = [{id:0,label:"$321119"},{id:1,label:"$321120"},{id:2,label:"$321126"},{id:3,label:"$321129"}];
container_mc.wait_mc.combobox.data = !reformItemFarming?comboBoxData_beforeReform:comboBoxData_afterReform;
container_mc.sold_mc.combobox.data = !reformItemFarming?comboBoxData_beforeReform:comboBoxData_afterReform;
setDetailOptionCheckBox();
lib.manager.Focus.TRADEHOUSE_SEARCH_INPUT = container_mc.itemList_mc.searchInput_txt;
container_mc.reg_mc._visible = false;
container_mc.itemList_mc._visible = false;
container_mc.wait_mc._visible = false;
container_mc.sold_mc._visible = false;
container_mc.saleList_mc._visible = false;
container_mc.buyList_mc._visible = false;
container_mc.reg_mc.TradeHouse_RegArea.GetName = function()
{
   return this._name;
};
container_mc.itemList_mc.fd0.verticalAlign = "center";
container_mc.reg_mc.defaultStr.hitTestDisable = true;
container_mc.wait_mc.defaultStr.hitTestDisable = true;
container_mc.sold_mc.defaultStr.hitTestDisable = true;
container_mc.saleList_mc.defaultStr.hitTestDisable = true;
container_mc.buyList_mc.defaultStr.hitTestDisable = true;
var searchGrade0 = lib.util.UIString.getUIString("$321084");
var searchGrade1 = lib.util.UIString.getUIString("$321085");
var searchGrade2 = lib.util.UIString.getUIString("$321086");
var searchGrade3 = lib.util.UIString.getUIString("$321087");
container_mc.itemList_mc.combobox0.data = [searchGrade0,searchGrade1,searchGrade2,searchGrade3];
container_mc.itemList_mc.combobox1.cation = "$321102";
container_mc.itemList_mc.combobox1.data = ["$321014","$321015"];
container_mc.itemList_mc.combobox1.cation = "$321103";
var itemNumStr = lib.util.UIString.getUIString("$321076");
var itemLevelStr = lib.util.UIString.getUIString("$321077");
var eachPriceStr = lib.util.UIString.getUIString("$321088");
var tradePriceStr = lib.util.UIString.getUIString("$321069");
var tradeDateStr = lib.util.UIString.getUIString("$321070");
var bargainBuyStr = lib.util.UIString.getUIString("$321089");
var directBuyStr = lib.util.UIString.getUIString("$321090");
var termStr = lib.util.UIString.getUIString("$321068");
var bargainBuyPriceStr = lib.util.UIString.getUIString("$321066");
var directBuyPriceStr = lib.util.UIString.getUIString("$321067");
var defaultStr1 = lib.util.UIString.getUIString("$321092");
var defaultStr2 = lib.util.UIString.getUIString("$321093");
var defaultStr3 = lib.util.UIString.getUIString("$321094");
var defaultStr4 = lib.util.UIString.getUIString("$321095");
var tipStr = lib.util.UIString.getUIString("$321047");
var tip_reg_1 = lib.util.UIString.getUIString("$321048");
var tip_reg_2 = lib.util.UIString.getUIString("$321049");
var tip_reg_3 = lib.util.UIString.getUIString("$321050");
var tip_list_1 = lib.util.UIString.getUIString("$321051");
var tip_list_2 = lib.util.UIString.getUIString("$321052");
var tip_list_3 = lib.util.UIString.getUIString("$321053");
var tip_list_4 = lib.util.UIString.getUIString("$321054");
var tip_calc_1 = lib.util.UIString.getUIString("$321055");
var tip_calc_2 = lib.util.UIString.getUIString("$321056");
var tip_calc_3 = lib.util.UIString.getUIString("$321057");
var tip_calc_4 = lib.util.UIString.getUIString("$321058");
var tip_calc_5 = lib.util.UIString.getUIString("$321059");
var tip_reg = [tipStr + " - " + tip_reg_1,tipStr + " - " + tip_reg_2,tipStr + " - " + tip_reg_3];
var tip_list = [tipStr + " - " + tip_list_1,tipStr + " - " + tip_list_2,tipStr + " - " + tip_list_3,tipStr + " - " + tip_list_4];
var tip_calc = [tipStr + " - " + tip_calc_1,tipStr + " - " + tip_calc_2,tipStr + " - " + tip_calc_3,tipStr + " - " + tip_calc_4,tipStr + " - " + tip_calc_5];
var itemGradeStr = ["$321096","$321085","$321086","$321087"];
var tipCoolTime;
var listWidth = 0;
var listWidth_Array = new Array();
var NameTextLength_Local = 0;
bWidgetOpen = false;
var waitOrSold = "wait";
var list = container_mc.itemList_mc.category_mc.blank;
var scrollBar;
var ROWSPACE = 0;
var lineHeight = 30;
var contentsHeight = container_mc.itemList_mc.category_mc._height;
var scrollBar = container_mc.itemList_mc.scrollbar;
var listObj = {};
var waitSlotObj = {};
var soldSlotObj = {};
scrollBar.addListener(listObj);
listObj.onScroll = function()
{
   list._y = - arguments[0];
};
scrollBar.setWheel(container_mc.itemList_mc.category_mc);
scrollBar.__set__pageSize(0);
scrollBar.__set__displaySize(contentsHeight - 20);
scrollBar.__set__rowHeight(lineHeight + ROWSPACE);
scrollBar.__set__scroll(0);
var scrollBar_w;
var ROWSPACE2 = 0;
var lineHeight2 = 10;
var contentsHeight2 = container_mc.itemList_mc.category_mc._width;
var scrollBar_w = container_mc.itemList_mc.scrollbar_w;
scrollBar_w._width = 180;
var listObj2 = {};
var waitSlotObj2 = {};
var soldSlotObj2 = {};
scrollBar_w.addListener(listObj2);
listObj2.onScroll2 = function()
{
   list._x = - arguments[0];
};
scrollBar_w.__set__pageSize(0);
scrollBar_w.__set__displaySize(contentsHeight2);
scrollBar_w.__set__rowHeight(lineHeight2 + ROWSPACE2);
scrollBar_w.__set__scroll(0);
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
myListener.OnGame_MouseDown = function(button, target)
{
   var _loc2_ = target.toString().split(".");
   var _loc3_ = undefined;
   if(button == 2)
   {
      if(target._name == "SLOT" && _loc2_[2] == UIname)
      {
         _loc3_ = target._parent._parent;
         ToGame_TradeHouse_RightBtnClicked(_loc3_.id);
      }
      else if(_loc2_[4] == "buyList_mc" && _loc2_[6].substr(0,9) == "calc_line")
      {
         _loc3_ = container_mc.buyList_mc.list_mc[_loc2_[6]];
         ToGame_TradeHouse_CalculateBuyList(_loc3_.id);
      }
      else if(_loc2_[4] == "saleList_mc" && _loc2_[6].substr(0,9) == "calc_line")
      {
         _loc3_ = container_mc.saleList_mc.list_mc[_loc2_[6]];
         ToGame_TradeHouse_CalculateSaleList(_loc3_.id);
      }
   }
   else if(button == 1)
   {
      if(!container_mc.itemList_mc.detailBtn.hitTest(_root._xmouse,_root._ymouse) && !container_mc.itemList_mc.detailOptionMc.hitTest(_root._xmouse,_root._ymouse) && container_mc.itemList_mc.detailOptionMc._visible)
      {
         openDetailOption();
      }
      else if(!container_mc.itemList_mc.smartBtn.hitTest(_root._xmouse,_root._ymouse) && !container_mc.itemList_mc.smartOptionMc.hitTest(_root._xmouse,_root._ymouse) && container_mc.itemList_mc.smartOptionMc._visible)
      {
         openSmartOption();
      }
   }
};
var CustomScaleEvent;
var PREMIUMUSER = 0;
var TCATDISABLE = 0;
var m_TcatMc = container_mc.itemList_mc.detailOptionMc.tcatMc;
var traceTypeStr_0 = lib.util.UIString.getUIString("$321104");
var traceTypeStr_1 = lib.util.UIString.getUIString("$321157");
var BuyTypeStr0 = lib.util.UIString.getUIString("$321148");
var BuyTypeStr1 = lib.util.UIString.getUIString("$321149");
var BuyTypeStr2 = lib.util.UIString.getUIString("$321152");
var SaleTypeStr0 = lib.util.UIString.getUIString("$321150");
var SaleTypeStr1 = lib.util.UIString.getUIString("$321151");
var SaleTypeStr2 = lib.util.UIString.getUIString("$321153");
var sortChangeStr_0 = "";
var sortChangeStr_1 = "";
var sortChangeStr_2 = "";
var sortChangeStr_3 = "";
var a_Sort_1Array = [];
var a_Sort_2Array = [];
var a_Sort_3Array = [];
var a_Sort_Default = [];
myListener.OnGame_TradeHouse_PremiumUser = function(type)
{
   PREMIUMUSER = type;
};
TCATDISABLE = lib.gamedata.DefaultData.getDefaultUIData("TcatEnable").param0;
TCATTYPE = lib.gamedata.DefaultData.getDefaultUIData("TcatEnable").param1;
TCATDISABLE = 0;
TCATTYPE = 0;
if(TCATDISABLE == "1")
{
   m_TcatMc._visible = true;
   m_TcatMc.minInput.right_mc._visible = false;
   m_TcatMc.minInput.left_mc._visible = false;
   m_TcatMc.maxInput.right_mc._visible = false;
   m_TcatMc.maxInput.left_mc._visible = false;
   m_TcatMc.minInput.bgMc._width = 215;
   m_TcatMc.minInput.inputFd._width = 210;
   m_TcatMc.minInput.inputFd_focus._width = 221;
   m_TcatMc.maxInput.bgMc._width = 215;
   m_TcatMc.maxInput.inputFd._width = 210;
   m_TcatMc.maxInput.inputFd_focus._width = 221;
   m_TcatMc.minInput.inputFd.text = 0;
   m_TcatMc.maxInput.inputFd.text = 0;
   m_TcatMc.minInput.max_mc.gotoAndStop(1);
   m_TcatMc.minInput.max_mc.enabled = true;
   m_TcatMc.maxInput.max_mc.gotoAndStop(1);
   m_TcatMc.maxInput.max_mc.enabled = true;
   container_mc.itemList_mc.detailOptionMc.listBg._height = 410;
   container_mc.itemList_mc.detailOptionMc.hit._height = 403;
   container_mc.itemList_mc.detailOptionMc.guideMc._y = 372;
   sortChangeStr_0 = lib.util.UIString.getUIString("$321146");
   sortChangeStr_1 = lib.util.UIString.getUIString("$321156");
   sortChangeStr_2 = lib.util.UIString.getUIString("$321155");
   sortChangeStr_3 = lib.util.UIString.getUIString("$321144");
   a_Sort_1Array = ["$321136","","$321076","$321155","$321146","$321104"];
   a_Sort_2Array = ["$321136","","$321076","$321104","$321069","$321080"];
   a_Sort_3Array = ["$321006","$321077","$321075","$321076","$321145","$321147","$321068"];
   a_Sort_Default = [587,64,159,64,228,229,182];
   m_TcatMc.tIcon_0.htmlText = m_TcatMc.tIcon_1.htmlText = lib.util.GoldCurrency.SetTCatText("",TCATTYPE);
}
else
{
   m_TcatMc._visible = false;
   container_mc.itemList_mc.detailOptionMc.listBg._height = 341;
   container_mc.itemList_mc.detailOptionMc.hit._height = 334;
   container_mc.itemList_mc.detailOptionMc.guideMc._y = 303;
   sortChangeStr_0 = lib.util.UIString.getUIString("$321066");
   sortChangeStr_1 = lib.util.UIString.getUIString("$321105");
   sortChangeStr_2 = lib.util.UIString.getUIString("$321067");
   sortChangeStr_3 = lib.util.UIString.getUIString("$321106");
   a_Sort_1Array = ["$321136","","$321076","$321067","$321066","$321104"];
   a_Sort_2Array = ["$321136","","$321076","$321104","$321069","$321080"];
   a_Sort_3Array = ["$321006","$321077","$321075","$321076","$321066","$321068"];
   a_Sort_Default = [625,102,197,102,267,220];
}
container_mc.wait_mc.sortBtn.labels = a_Sort_1Array;
container_mc.sold_mc.sortBtn.labels = a_Sort_2Array;
container_mc.reg_mc.sortBtn.labels = a_Sort_3Array;
container_mc.reg_mc.sortBtn.colums = a_Sort_Default;
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
         ToGame_TradeHouse_SearchCondition();
      }
      if(UI._visible == true)
      {
         CustomScaleEvent = new CustomScaleEvent();
         CustomScaleEvent.CustomScaleEventCheck(UI,UIname);
         UI.scaleExpander.scaleExpanderEventCheck(UI,UIname);
      }
      else
      {
         CustomScaleEvent.CustomScaleEventRemoveCheck();
      }
   }
};
myListener.OnGameEventChangeUIMode = function(bShow)
{
   _global.gbUIMode = bShow;
   if(_global.gbUIMode && bWidgetOpen)
   {
      UI._visible = true;
   }
   else
   {
      UI._visible = false;
   }
};
var DefaultMinMax = [];
myListener.OnGame_TradeHouse_DetailSearchOption = function()
{
   var _loc17_ = arguments[0];
   var _loc16_ = arguments[1];
   var _loc9_ = arguments[2];
   var _loc7_ = arguments[3];
   var _loc6_ = 0;
   var _loc5_ = 0;
   var _loc8_ = undefined;
   var _loc10_ = undefined;
   var _loc12_ = undefined;
   var _loc13_ = undefined;
   var _loc14_ = undefined;
   var _loc11_ = undefined;
   var _loc15_ = undefined;
   _loc6_ = arguments[4];
   _loc5_ = arguments[5];
   _loc8_ = arguments[6];
   _loc10_ = arguments[7];
   _loc12_ = arguments[8];
   _loc13_ = arguments[9];
   _loc14_ = arguments[10];
   _loc11_ = arguments[11];
   _loc15_ = arguments[12];
   if(Number(_loc15_) == 1)
   {
      DefaultMinMax[2] = {min:Number(_loc9_),max:Number(_loc7_)};
      DefaultMinMax[0] = {min:Number(_loc6_),max:Number(_loc5_)};
      DefaultMinMax[1] = {min:Number(_loc8_),max:Number(_loc10_)};
      DefaultMinMax[3] = {min:Number(_loc12_),max:Number(_loc13_)};
      DefaultMinMax[4] = {min:Number(_loc14_),max:Number(_loc11_)};
      resetDetailSearchOption();
      return undefined;
   }
   resetDetailSearchOption();
   var _loc4_ = container_mc.itemList_mc.detailOptionMc;
   var _loc3_ = lib.util.ExtString.split(_loc17_,"");
   var _loc2_ = 0;
   while(_loc2_ < _loc3_.length)
   {
      _loc4_["checkBox1_" + (_loc2_ + 1)].checked = _loc3_[_loc2_] == "1";
      _loc2_ = _loc2_ + 1;
   }
   _loc4_.radioBox0_0.checked = false;
   _loc4_["radioBox0_" + _loc16_].checked = true;
   if(Number(_loc6_) != DefaultMinMax[0].min)
   {
      detailMintxt0.text = _loc6_;
   }
   if(Number(_loc5_) != DefaultMinMax[0].max)
   {
      detailMaxtxt0.text = _loc5_;
   }
   if(Number(_loc8_) != DefaultMinMax[1].min)
   {
      detailMintxt1.text = _loc8_;
   }
   if(Number(_loc10_) != DefaultMinMax[1].max)
   {
      detailMaxtxt1.text = _loc10_;
   }
   if(Number(_loc9_) != DefaultMinMax[2].min)
   {
      detailMintxt2.text = _loc9_;
   }
   if(Number(_loc7_) != DefaultMinMax[2].max)
   {
      detailMaxtxt2.text = _loc7_;
   }
   detailMintxt3.total = _loc12_;
   detailMaxtxt3.total = _loc13_;
   detailMintxt4.text = _loc14_;
   detailMaxtxt4.text = _loc11_;
   checkDetailOption();
};
var goldType = 0;
myListener.OnGame_TradeHouse_SetGoldType = function(type)
{
   goldType = Number(type);
   container_mc.itemList_mc.detailOptionMc.mintxt3.setGoldType(goldType);
   container_mc.itemList_mc.detailOptionMc.maxtxt3.setGoldType(goldType);
};
resetDetailSearchOption();
var selectedSmartIndex;
var smartContainerY = container_mc.itemList_mc.smartOptionMc.smartContainer._y;
myListener.OnGame_TradeHouse_SmartSearch = function(optionList, _selectedIndex)
{
   resetSmartSearch();
   var _loc6_ = container_mc.itemList_mc.smartOptionMc;
   var _loc8_ = lib.util.ExtString.split(optionList,"\t");
   var _loc9_ = _loc8_.length;
   var _loc5_ = undefined;
   var _loc4_ = 0;
   while(_loc4_ < _loc9_)
   {
      var _loc3_ = _loc6_.smartContainer.attachMovie("smart_line","line" + _loc4_,_loc4_);
      _loc3_.index = _loc4_;
      if(_loc5_ == undefined)
      {
         _loc3_._y = 0;
      }
      _loc3_._y = _loc5_._height + _loc5_._y;
      _loc5_ = _loc3_;
      _loc3_.txt.htmlText = _loc8_[_loc4_];
      if(_loc3_.txt.textHeight > 25)
      {
         _loc3_.txt._height = _loc3_.txt.textHeight + 4;
         _loc3_.bgMc._height = _loc3_.txt.textHeight + 6;
      }
      _loc3_.onRelease = function()
      {
         this._parent["line" + selectedSmartIndex].bgMc.gotoAndStop(1);
         this.bgMc.gotoAndStop(4);
         selectedSmartIndex = this.index;
         openSmartOption();
         var _loc2_ = "<img src=\'Icon_smart\' vspace=\'-7\'>" + this.txt.htmlText;
         container_mc.itemList_mc.smartGuideTxt.setText(_loc2_);
         ToGame_TradeHouse_SelectSmartSearch(this.index);
      };
      _loc3_.onRollOver = function()
      {
         if(selectedSmartIndex != this.index)
         {
            this.bgMc.gotoAndStop(2);
         }
      };
      _loc3_.onRollOut = _loc3_.onReleaseOutside = function()
      {
         if(selectedSmartIndex != this.index)
         {
            this.bgMc.gotoAndStop(1);
         }
      };
      _loc3_.onPress = function()
      {
         if(selectedSmartIndex != this.index)
         {
            this.bgMc.gotoAndStop(3);
         }
      };
      if(Number(_selectedIndex) == _loc4_)
      {
         _loc3_.bgMc.gotoAndStop(4);
      }
      _loc4_ = _loc4_ + 1;
   }
   _loc6_.scrollBar.pageSize = _loc6_.smartContainer._height;
   _loc6_.scrollBar.displaySize = _loc6_.maskMc._height;
   _loc6_.scrollBar.rowHeight = 100;
   _loc6_.scrollBar.scroll = 0;
   _loc6_.scrollBar.addListener(container_mc.itemList_mc.smartOptionMc.smartContainer);
   container_mc.itemList_mc.smartOptionMc.smartContainer.onScroll = function()
   {
      container_mc.itemList_mc.smartOptionMc.smartContainer._y = smartContainerY - arguments[0];
   };
   _loc6_.scrollBar.setWheel(container_mc.itemList_mc.smartOptionMc.smartContainer);
   if(_selectedIndex != undefined && _selectedIndex != "" && _selectedIndex != "-1")
   {
      selectedSmartIndex = Number(_selectedIndex);
      container_mc.itemList_mc.smartBtn.activeMc._alpha = 100;
      var _loc10_ = "<img src=\'Icon_smart\' vspace=\'-7\'>" + _loc6_.smartContainer["line" + selectedSmartIndex].txt.htmlText;
      container_mc.itemList_mc.smartGuideTxt.setText(_loc10_);
   }
   else
   {
      container_mc.itemList_mc.smartBtn.activeMc._alpha = 0;
   }
};
var guide0Th = container_mc.itemList_mc.smartOptionMc.guideMc.txt._height;
var guide1Th = container_mc.itemList_mc.detailOptionMc.guideMc.txt._height;
container_mc.itemList_mc.smartOptionMc.guideMc.txt.text = "$321132";
container_mc.itemList_mc.detailOptionMc.guideMc.txt.text = "$321133";
if(guide0Th < container_mc.itemList_mc.smartOptionMc.guideMc.txt.textHeight + 4)
{
   var g = container_mc.itemList_mc.smartOptionMc.guideMc.txt.textHeight + 4 - guide0Th;
   container_mc.itemList_mc.smartOptionMc.guideMc.bgMc._height = container_mc.itemList_mc.smartOptionMc.guideMc.bgMc._height + g;
   container_mc.itemList_mc.smartOptionMc.listBg._height = container_mc.itemList_mc.smartOptionMc.listBg._height + g;
   container_mc.itemList_mc.smartOptionMc.hit._height = container_mc.itemList_mc.smartOptionMc.listBg._height;
   container_mc.itemList_mc.smartOptionMc.guideMc.txt._height = container_mc.itemList_mc.smartOptionMc.guideMc.txt._height + g;
}
if(guide1Th < container_mc.itemList_mc.detailOptionMc.guideMc.txt.textHeight + 4)
{
   var g = container_mc.itemList_mc.detailOptionMc.guideMc.txt.textHeight + 4 - guide1Th;
   container_mc.itemList_mc.detailOptionMc.guideMc.bgMc._height = container_mc.itemList_mc.detailOptionMc.guideMc.bgMc._height + g;
   container_mc.itemList_mc.detailOptionMc.listBg._height = container_mc.itemList_mc.detailOptionMc.listBg._height + g;
   container_mc.itemList_mc.smartOptionMc.hit._height = container_mc.itemList_mc.smartOptionMc.listBg._height;
   container_mc.itemList_mc.detailOptionMc.guideMc.txt._height = container_mc.itemList_mc.detailOptionMc.guideMc.txt._height + g;
}
var smartBtn = new lib.util.TxtBtn(container_mc.itemList_mc.smartBtn);
var detailBtn = new lib.util.TxtBtn(container_mc.itemList_mc.detailBtn);
lib.manager.ToolTip.add(container_mc.itemList_mc.smartBtn,"$321130",1);
lib.manager.ToolTip.add(container_mc.itemList_mc.detailBtn,"$321131",1);
smartBtn.setRelease(openSmartOption);
detailBtn.setRelease(openDetailOption);
container_mc.itemList_mc.detailOptionMc.radioBox0_0.onChanged = function()
{
   if(this.checked)
   {
      container_mc.itemList_mc.detailOptionMc.radioBox0_1.checked = false;
      container_mc.itemList_mc.detailOptionMc.radioBox0_2.checked = false;
   }
};
container_mc.itemList_mc.detailOptionMc.radioBox0_1.onChanged = function()
{
   if(this.checked)
   {
      container_mc.itemList_mc.detailOptionMc.radioBox0_0.checked = false;
      container_mc.itemList_mc.detailOptionMc.radioBox0_2.checked = false;
   }
};
container_mc.itemList_mc.detailOptionMc.radioBox0_2.onChanged = function()
{
   if(this.checked)
   {
      container_mc.itemList_mc.detailOptionMc.radioBox0_0.checked = false;
      container_mc.itemList_mc.detailOptionMc.radioBox0_1.checked = false;
   }
};
openSmartOption();
var sortListner = {};
sortListner.onChanged = function(target, id, index)
{
   if(id == undefined)
   {
      return undefined;
   }
   if(target == container_mc.wait_mc.combobox)
   {
      container_mc.wait_mc.lowerBtn.gotoAndStop(1);
      container_mc.wait_mc.lowerBtn.enabled = true;
      container_mc.wait_mc["sortArowMc" + waitSlotObj.rindex]._visible = false;
      var _loc2_ = !container_mc.wait_mc.lowerBtn._visible?2:1;
      ToGame_TradeHouse_SortWaitList(id,_loc2_);
   }
   else if(target == container_mc.sold_mc.combobox)
   {
      container_mc.sold_mc.lowerBtn.gotoAndStop(1);
      container_mc.sold_mc.lowerBtn.enabled = true;
      container_mc.sold_mc["sortArowMc" + soldSlotObj.rindex]._visible = false;
      _loc2_ = !container_mc.sold_mc.lowerBtn._visible?2:1;
      ToGame_TradeHouse_SortSoldList(id,_loc2_);
   }
};
container_mc.wait_mc.combobox.addListener(sortListner);
container_mc.sold_mc.combobox.addListener(sortListner);
var waitUpperBtn = new lib.util.TxtBtn(container_mc.wait_mc.uperBtn);
var waitLowerBtn = new lib.util.TxtBtn(container_mc.wait_mc.lowerBtn);
var soldUpperBtn = new lib.util.TxtBtn(container_mc.sold_mc.uperBtn);
var soldLowerBtn = new lib.util.TxtBtn(container_mc.sold_mc.lowerBtn);
waitUpperBtn.setRelease(function()
{
   sortArrang(container_mc.wait_mc.uperBtn);
}
);
waitLowerBtn.setRelease(function()
{
   sortArrang(container_mc.wait_mc.lowerBtn);
}
);
soldUpperBtn.setRelease(function()
{
   sortArrang(container_mc.sold_mc.uperBtn);
}
);
soldLowerBtn.setRelease(function()
{
   sortArrang(container_mc.sold_mc.lowerBtn);
}
);
myListener.OnGame_TradeHouse_SetTab = function(tabNum)
{
   tabNum = Number(tabNum);
   if(tabNum == 4)
   {
      tabNum = 1;
   }
   else if(tabNum > 0)
   {
      tabNum = tabNum + 1;
   }
   tab.setTab(tabNum,1);
};
myListener.OnGame_TradeHouse_SetPageInfo = function(currentPage, totalPage)
{
   var _loc1_ = undefined;
   if(tab.activedNum == 3)
   {
      _loc1_ = container_mc.saleList_mc.numberSteper;
   }
   else if(tab.activedNum == 0)
   {
      _loc1_ = container_mc.wait_mc.numberSteper;
   }
   else if(tab.activedNum == 1)
   {
      _loc1_ = container_mc.sold_mc.numberSteper;
   }
   else if(tab.activedNum == 4)
   {
      _loc1_ = container_mc.buyList_mc.numberSteper;
   }
   else if(tab.activedNum == 2)
   {
      _loc1_ = container_mc.reg_mc.numberSteper;
   }
   currentPage = Number(currentPage);
   totalPage = Number(totalPage);
   _loc1_.setPage(currentPage,totalPage,true);
   _loc1_.onChanged = function(changed)
   {
      if(changed)
      {
         ToGame_TradeHouse_RequestSetPage(changed);
      }
   };
};
container_mc.saleList_mc.numberSteper.setPage(1,1,true);
container_mc.wait_mc.numberSteper.setPage(1,1,true);
container_mc.sold_mc.numberSteper.setPage(1,1,true);
container_mc.buyList_mc.numberSteper.setPage(1,1,true);
container_mc.reg_mc.numberSteper.setPage(1,1,true);
myListener.OnGame_TradeHouse_SetSearchItemInfo = function(minLevlDefaultText, maxLevelDefaultText, searchInputDefaultText, wordOption, itemGrade, itemSearchMaxLevel)
{
   if(itemGrade == undefined)
   {
      itemGrade = 0;
   }
   itemGrade = Number(itemGrade);
   minLevel_txt.setChanged(false);
   maxLevel_txt.setChanged(false);
   searchInput_txt.setChanged(false);
   if(itemSearchMaxLevel != undefined)
   {
      minLevel_txt.max = Number(itemSearchMaxLevel);
      maxLevel_txt.max = Number(itemSearchMaxLevel);
   }
   minLevel_txt.caption = minLevlDefaultText;
   maxLevel_txt.caption = maxLevelDefaultText;
   searchInput_txt.textField.text = searchInputDefaultText;
   wordOption = Number(wordOption);
   container_mc.itemList_mc.combobox1.selectedIndex = wordOption;
   container_mc.itemList_mc.combobox0.selectedIndex = itemGrade;
};
var treeObj_array = new Array();
var treeHeight = 0;
var treeClickedMc = null;
container_mc.itemList_mc.category_mc.blank.all_btn.txt.text = "$081004";
container_mc.itemList_mc.category_mc.blank.all_btn.open_btn._visible = false;
container_mc.itemList_mc.category_mc.blank.all_btn.hit.onRollOver = function()
{
   if(treeClickedMc != this._parent)
   {
      this._parent.bg.gotoAndStop(2);
   }
};
container_mc.itemList_mc.category_mc.blank.all_btn.hit.onRollOut = container_mc.itemList_mc.category_mc.blank.all_btn.hit.onReleaseOutside = function()
{
   if(treeClickedMc != this._parent)
   {
      this._parent.bg.gotoAndStop(1);
   }
   else
   {
      this._parent.bg.gotoAndStop(4);
   }
};
container_mc.itemList_mc.category_mc.blank.all_btn.hit.onRelease = function()
{
   lib.manager.UISound.play(lib.manager.UISound.MAIN_BTN);
   if(treeClickedMc != this._parent)
   {
      if(treeClickedMc != null)
      {
         treeClickedMc.bg.gotoAndStop(1);
      }
      treeClickedMc = this._parent;
      allCategoryClose();
      align();
      ToGame_TradeHouse_SelectCategory(0);
      this._parent.bg.gotoAndStop(4);
   }
};
container_mc.itemList_mc.category_mc.blank.all_btn.hit.onPress = function()
{
   if(treeClickedMc != this._parent)
   {
      this._parent.bg.gotoAndStop(3);
   }
};
myListener.OnGame_TradeHouse_SetCategory = function(dataList, defaultSelect)
{
   clearCategory();
   var _loc3_ = dataList.split("\n");
   if(_loc3_[_loc3_.length - 1] == "0" || _loc3_[_loc3_.length - 1] == "undefined" || _loc3_[_loc3_.length - 1] == "")
   {
      _loc3_.splice(_loc3_.length - 1,1);
   }
   var _loc4_ = _loc3_.length;
   var _loc1_ = 0;
   while(_loc1_ < _loc4_)
   {
      var _loc2_ = _loc3_[_loc1_].split("\t");
      addTree(_loc2_[0],_loc2_[1],0);
      _loc1_ = _loc1_ + 1;
   }
   listWidth_Array = new Array();
   if(defaultSelect != undefined && defaultSelect != 0)
   {
      var _loc5_ = getLine(defaultSelect);
      _loc5_.mc.hit.onRelease(1);
      setOpen(_loc5_.depth1,true);
      setOpen(_loc5_.depth1 + "_" + _loc5_.depth2,true);
   }
   else
   {
      treeClickedMc = container_mc.itemList_mc.category_mc.blank.all_btn;
      container_mc.itemList_mc.category_mc.blank.all_btn.bg.gotoAndStop(4);
      align();
   }
};
var regList = new lib.util.List(container_mc.reg_mc.list_mc,"reg_line",0);
regList.bg = "bg_mc";
var regClickId = null;
myListener.OnGame_TradeHouse_AddRegListItem = function(id, itemData, price, term)
{
   container_mc.reg_mc.defaultStr.text = "";
   var _loc2_ = undefined;
   if(TCATDISABLE == 1)
   {
      _loc2_ = regList.add(id,"reg_line");
   }
   else
   {
      _loc2_ = regList.add(id,"reg_line2");
   }
   var _loc3_ = itemData.split("\t");
   if(_loc3_[_loc3_.length - 1] == "undefined" || _loc3_[_loc3_.length - 1] == "")
   {
      _loc3_.pop();
   }
   _loc2_.item_txt.verticalAlign = "center";
   _loc2_.name_txt.verticalAlign = "center";
   _loc2_.level_txt.verticalAlign = "center";
   _loc2_.grade_txt.verticalAlign = "center";
   _loc2_.num_txt.verticalAlign = "center";
   _loc2_.price1_txt.verticalAlign = "center";
   _loc2_.term_txt.verticalAlign = "center";
   var _loc17_ = itemGradeStr[Number(_loc3_[6])];
   _loc2_.grade_txt.text = _loc17_;
   _loc2_.Slot.id = id;
   lib.display.DrawBitmapData.draw(_loc2_.Slot.Icon,_loc3_[0],0,0,0,0,50,50,0.78);
   _loc2_.Slot.Icon.TEX = _loc3_[0];
   lib.manager.ToolTip.add(_loc2_.Slot.SLOT,_loc2_.id + "\t2",6,_loc2_.Slot.Icon);
   var _loc19_ = Number(_loc3_[1]);
   var enchantNum = Number(_loc3_[2]);
   var _loc15_ = Number(_loc3_[4]);
   var grade = Number(_loc3_[6]);
   var sealType = _loc3_[7];
   var bMasterpiece = _loc3_[8];
   var _loc5_ = "";
   if(enchantNum > 0)
   {
      _loc5_ = "+" + enchantNum + " " + _loc3_[3];
   }
   else
   {
      _loc5_ = _loc3_[3];
   }
   _loc2_.num_txt.text = _loc15_;
   _loc2_.level_txt.text = _loc3_[5];
   lib.util.ExtString.textCut(_loc2_.item_txt,_loc5_,1);
   _loc17_ = itemGradeStr[Number(_loc3_[6])];
   _loc2_.grade_txt.text = _loc17_;
   var _loc4_ = price.split("\t");
   var _loc14_ = lib.util.GoldCurrency.SetGoldText(_loc4_[0],0,0,0,goldType);
   var _loc13_ = _loc14_;
   var _loc18_ = lib.util.GoldCurrency.SetGoldText(_loc4_[1],0,0,0,goldType);
   var _loc12_ = eachPriceStr + _loc18_;
   _loc2_.price1_txt.textAutoSize = "shrink”";
   _loc2_.price1_txt.htmlText = _loc13_ + "\n" + "<font size=\'15\'>" + _loc12_ + "</font>";
   if(_loc2_.price1_txt.maxscroll > 1)
   {
      _loc2_.price1_txt.htmlText = "<font size=\'15\'>" + _loc13_ + "</font>" + "\n" + "<font size=\'12\'>" + _loc12_ + "</font>";
   }
   var _loc11_ = "";
   var _loc9_ = "";
   var _loc10_ = "";
   var _loc8_ = "";
   if(TCATDISABLE == 1)
   {
      _loc11_ = lib.util.GoldCurrency.SetTCatText(_loc4_[4],TCATTYPE);
      _loc10_ = eachPriceStr + lib.util.GoldCurrency.SetTCatText(_loc4_[5],TCATTYPE);
   }
   else if(PREMIUMUSER == 1)
   {
      _loc11_ = lib.util.GoldCurrency.SetGoldText(_loc4_[2],0,0,0,goldType);
      _loc10_ = eachPriceStr + lib.util.GoldCurrency.SetGoldText(_loc4_[3],0,0,0,goldType);
   }
   _loc9_ = _loc11_;
   _loc8_ = _loc10_;
   _loc2_.price2_txt.textAutoSize = "shrink”";
   _loc2_.price2_txt.htmlText = _loc9_ + "\n" + "<font size=\'15\'>" + _loc8_ + "</font>";
   if(_loc2_.price2_txt.maxscroll > 1)
   {
      _loc2_.price2_txt.htmlText = "<font size=\'15\'>" + _loc9_ + "</font>" + "\n" + "<font size=\'12\'>" + _loc8_ + "</font>";
   }
   _loc2_.Slot.onEnterFrame = function()
   {
      if(this.drag != undefined)
      {
         this.drag = false;
         this.sealType = sealType;
         this.masterpiece = bMasterpiece;
         this.grade = grade;
         var _loc2_ = this.enchantFd;
         var _loc3_ = 21433;
         if(enchantNum > 11 && enchantNum < 15)
         {
            _loc3_ = 8915599;
         }
         else if(enchantNum > 14)
         {
            _loc3_ = 10624002;
         }
         _loc2_.shadowColor = _loc3_;
         _loc2_.text = "+" + enchantNum;
         _loc2_._visible = enchantNum > 0;
         delete this.onEnterFrame;
      }
   };
   if(grade == 0)
   {
      _loc2_.item_txt.textColor = lib.info.TextColor.RAREGRADE0;
      _loc2_.level_txt.textColor = lib.info.TextColor.RAREGRADE0;
      _loc2_.num_txt.textColor = lib.info.TextColor.RAREGRADE0;
      _loc2_.grade_txt.textColor = lib.info.TextColor.RAREGRADE0;
   }
   else if(grade == 1)
   {
      _loc2_.item_txt.textColor = lib.info.TextColor.RAREGRADE1;
      _loc2_.level_txt.textColor = lib.info.TextColor.RAREGRADE1;
      _loc2_.num_txt.textColor = lib.info.TextColor.RAREGRADE1;
      _loc2_.grade_txt.textColor = lib.info.TextColor.RAREGRADE1;
   }
   else if(grade == 2)
   {
      _loc2_.item_txt.textColor = lib.info.TextColor.RAREGRADE2;
      _loc2_.level_txt.textColor = lib.info.TextColor.RAREGRADE2;
      _loc2_.num_txt.textColor = lib.info.TextColor.RAREGRADE2;
      _loc2_.grade_txt.textColor = lib.info.TextColor.RAREGRADE2;
   }
   else if(grade == 3)
   {
      _loc2_.item_txt.textColor = lib.info.TextColor.RAREGRADE3;
      _loc2_.level_txt.textColor = lib.info.TextColor.RAREGRADE3;
      _loc2_.num_txt.textColor = lib.info.TextColor.RAREGRADE3;
      _loc2_.grade_txt.textColor = lib.info.TextColor.RAREGRADE3;
   }
   _loc2_.term_txt.text = term;
   _loc2_.hit.onRollOver = function()
   {
      if(regClickId != this._parent.id)
      {
         this._parent.effect_mc.gotoAndStop("over");
      }
   };
   _loc2_.hit.onRollOut = _loc2_.hit.onReleaseOutside = function()
   {
      if(regClickId != this._parent.id)
      {
         this._parent.effect_mc.gotoAndStop("out");
      }
   };
   _loc2_.hit.onPress = function()
   {
      if(regClickId != this._parent.id)
      {
         this._parent.effect_mc.gotoAndStop("press");
      }
   };
   _loc2_.hit.onRelease = function()
   {
      if(regClickId != this._parent.id)
      {
         regList.getLine(regClickId).effect_mc.gotoAndStop("out");
         regClickId = this._parent.id;
         this._parent.effect_mc.gotoAndStop("active");
         regCancel_btn.setEnabled(true);
      }
   };
};
myListener.OnGame_TradeHouse_UpdateRegListItem = function(id, itemData, price, term)
{
   var _loc2_ = regList.getLine(id);
   var _loc3_ = itemData.split("\t");
   if(_loc3_[_loc3_.length - 1] == "undefined" || _loc3_[_loc3_.length - 1] == "")
   {
      _loc3_.pop();
   }
   lib.display.DrawBitmapData.draw(_loc2_.Slot.Icon,_loc3_[0],0,0,0,0,50,50,0.78);
   _loc2_.Slot.Icon.TEX = _loc3_[0];
   lib.manager.ToolTip.add(_loc2_.Slot.SLOT,_loc2_.id + "\t2",6,_loc2_.Slot.Icon);
   var _loc18_ = Number(_loc3_[1]);
   var enchantNum = Number(_loc3_[2]);
   var _loc15_ = Number(_loc3_[4]);
   var grade = Number(_loc3_[6]);
   var _loc16_ = itemGradeStr[Number(_loc3_[6])];
   var sealType = _loc3_[7];
   var bMasterpiece = _loc3_[8];
   _loc2_.grade_txt.text = _loc16_;
   var _loc5_ = "";
   if(enchantNum > 0)
   {
      _loc5_ = "+" + enchantNum + " " + _loc3_[3];
   }
   else
   {
      _loc5_ = _loc3_[3];
   }
   _loc2_.num_txt.text = _loc15_;
   _loc2_.level_txt.text = _loc3_[5];
   lib.util.ExtString.textCut(_loc2_.item_txt,_loc5_,1);
   var _loc4_ = price.split("\t");
   var _loc14_ = lib.util.GoldCurrency.SetGoldText(_loc4_[0],0,0,0,goldType);
   var _loc13_ = _loc14_;
   var _loc17_ = lib.util.GoldCurrency.SetGoldText(_loc4_[1],0,0,0,goldType);
   var _loc12_ = eachPriceStr + _loc17_;
   _loc2_.price1_txt.textAutoSize = "shrink”";
   _loc2_.price1_txt.htmlText = _loc13_ + "\n" + "<font size=\'15\'>" + _loc12_ + "</font>";
   if(_loc2_.price1_txt.maxscroll > 1)
   {
      _loc2_.price1_txt.htmlText = "<font size=\'15\'>" + _loc13_ + "</font>" + "\n" + "<font size=\'12\'>" + _loc12_ + "</font>";
   }
   var _loc11_ = "";
   var _loc9_ = "";
   var _loc10_ = "";
   var _loc8_ = "";
   if(TCATDISABLE == 1)
   {
      _loc11_ = lib.util.GoldCurrency.SetTCatText(_loc4_[4],TCATTYPE);
      _loc10_ = eachPriceStr + lib.util.GoldCurrency.SetTCatText(_loc4_[5],TCATTYPE);
   }
   else if(PREMIUMUSER == 1)
   {
      _loc11_ = lib.util.GoldCurrency.SetGoldText(_loc4_[2],0,0,0,goldType);
      _loc10_ = eachPriceStr + lib.util.GoldCurrency.SetGoldText(_loc4_[3],0,0,0,goldType);
   }
   _loc9_ = _loc11_;
   _loc8_ = _loc10_;
   _loc2_.price2_txt.textAutoSize = "shrink”";
   _loc2_.price2_txt.htmlText = _loc9_ + "\n" + "<font size=\'15\'>" + _loc8_ + "</font>";
   if(_loc2_.price2_txt.maxscroll > 1)
   {
      _loc2_.price2_txt.htmlText = "<font size=\'15\'>" + _loc9_ + "</font>" + "\n" + "<font size=\'12\'>" + _loc8_ + "</font>";
   }
   _loc2_.Slot.onEnterFrame = function()
   {
      if(this.drag != undefined)
      {
         this.drag = false;
         this.sealType = sealType;
         this.masterpiece = bMasterpiece;
         this.grade = grade;
         var _loc2_ = this.enchantFd;
         var _loc3_ = 21433;
         if(enchantNum > 11 && enchantNum < 15)
         {
            _loc3_ = 8915599;
         }
         else if(enchantNum > 14)
         {
            _loc3_ = 10624002;
         }
         _loc2_.shadowColor = _loc3_;
         _loc2_.text = "+" + enchantNum;
         _loc2_._visible = enchantNum > 0;
         delete this.onEnterFrame;
      }
   };
   if(grade == 0)
   {
      _loc2_.item_txt.textColor = lib.info.TextColor.RAREGRADE0;
      _loc2_.level_txt.textColor = lib.info.TextColor.RAREGRADE0;
      _loc2_.num_txt.textColor = lib.info.TextColor.RAREGRADE0;
      _loc2_.grade_txt.textColor = lib.info.TextColor.RAREGRADE0;
   }
   else if(grade == 1)
   {
      _loc2_.item_txt.textColor = lib.info.TextColor.RAREGRADE1;
      _loc2_.level_txt.textColor = lib.info.TextColor.RAREGRADE1;
      _loc2_.num_txt.textColor = lib.info.TextColor.RAREGRADE1;
      _loc2_.grade_txt.textColor = lib.info.TextColor.RAREGRADE1;
   }
   else if(grade == 2)
   {
      _loc2_.item_txt.textColor = lib.info.TextColor.RAREGRADE2;
      _loc2_.level_txt.textColor = lib.info.TextColor.RAREGRADE2;
      _loc2_.num_txt.textColor = lib.info.TextColor.RAREGRADE2;
      _loc2_.grade_txt.textColor = lib.info.TextColor.RAREGRADE2;
   }
   else if(grade == 3)
   {
      _loc2_.item_txt.textColor = lib.info.TextColor.RAREGRADE3;
      _loc2_.level_txt.textColor = lib.info.TextColor.RAREGRADE3;
      _loc2_.num_txt.textColor = lib.info.TextColor.RAREGRADE3;
      _loc2_.grade_txt.textColor = lib.info.TextColor.RAREGRADE3;
   }
   _loc2_.term_txt.text = term;
};
myListener.OnGame_TradeHouse_RemoveRegListItem = function(id)
{
   if(id == regClickId)
   {
      regCancel_btn.setEnabled(false);
      regClickId = null;
   }
   regList.remove(id);
   if(regList.length <= 0)
   {
      container_mc.reg_mc.defaultStr.htmlText = defaultStr1;
   }
};
myListener.OnGame_TradeHouse_ClearRegList = function()
{
   regList.clear();
   regCancel_btn.setEnabled(false);
   regClickId = null;
   container_mc.reg_mc.defaultStr.htmlText = defaultStr1;
};
var waitList = new lib.util.List(container_mc.wait_mc.list_mc,"wait_line",0);
waitList.bg = "bg_mc";
var waitClickId = null;
myListener.OnGame_TradeHouse_AddWaitListItem = function(id, itemData, price, sellerName, bSellerStates, bDelegateInfo)
{
   if(bSearch)
   {
      bSearch = false;
      waitSlotObj.pressCount = 2;
      waitSlotObj.index = 3;
      waitSlotObj.rindex = 3;
      selectedSortBtnOfWaitList(3,false);
   }
   container_mc.wait_mc.defaultStr.text = "";
   var mc = waitList.add(id,"wait_line");
   var _loc2_ = itemData.split("\t");
   if(_loc2_[_loc2_.length - 1] == "undefined" || _loc2_[_loc2_.length - 1] == "")
   {
      _loc2_.pop();
   }
   var grade = Number(_loc2_[6]);
   var _loc23_ = itemGradeStr[Number(_loc2_[6])];
   var sealType = _loc2_[7];
   var bMasterpiece = _loc2_[8];
   var _loc14_ = _loc2_[9];
   var _loc13_ = _loc2_[10];
   mc.num_txt.verticalAlign = "center";
   mc.price1_txt.verticalAlign = "center";
   mc.price2_txt.verticalAlign = "center";
   mc.Slot.id = id;
   lib.display.DrawBitmapData.draw(mc.Slot.Icon,_loc2_[0],0,0,0,0,50,50,0.78);
   mc.Slot.Icon.TEX = _loc2_[0];
   lib.manager.ToolTip.add(mc.Slot.SLOT,mc.id + "\t0",6,mc.Slot.Icon);
   var _loc21_ = Number(_loc2_[1]);
   var enchantNum = Number(_loc2_[2]);
   var _loc18_ = Number(_loc2_[4]);
   var _loc9_ = "";
   if(enchantNum > 0)
   {
      _loc9_ = "+" + enchantNum + " " + _loc2_[3];
   }
   else
   {
      _loc9_ = _loc2_[3];
   }
   mc.num_txt.text = _loc18_;
   mc.levelMc.txt.text = _loc2_[5];
   lib.util.ExtString.textCut(mc.item_txt,_loc9_,1);
   var _loc8_ = "";
   if(_loc14_ != "" && _loc14_ != undefined)
   {
      _loc8_ = _loc8_ + _loc14_;
   }
   if(_loc13_ != "" && _loc13_ != undefined)
   {
      if(_loc8_ != "")
      {
         _loc8_ = _loc8_ + "/";
      }
      _loc8_ = _loc8_ + ("<img src=\'icon_itemlevel\' vspace=\'-3\'><font color=\'#2280FF\'>" + _loc13_ + "</font>");
   }
   mc.stat_txt.htmlText = _loc8_;
   var _loc3_ = price.split("\t");
   var _loc19_ = lib.util.GoldCurrency.SetGoldText(_loc3_[0],0,0,0,goldType);
   var _loc7_ = _loc19_;
   var _loc20_ = lib.util.GoldCurrency.SetGoldText(_loc3_[1],0,0,0,goldType);
   var _loc6_ = eachPriceStr + _loc20_;
   if(waitSlotObj.priceIns == 1)
   {
      mc.price1_txt.textAutoSize = "shrink”";
      mc.price1_txt.htmlText = "<font size=\'15\'>" + _loc6_ + "</font>" + "\n" + "<font size=\'14\'>" + _loc7_ + "</font>";
      if(mc.price1_txt.maxscroll > 1)
      {
         mc.price1_txt.htmlText = "<font size=\'14\'>" + _loc6_ + "</font>" + "\n" + "<font size=\'12\'>" + _loc7_ + "</font>";
         if(mc.price1_txt.maxscroll > 1)
         {
            mc.price1_txt.htmlText = "<font size=\'13\'>" + _loc6_ + "</font>" + "\n" + "<font size=\'12\'>" + _loc7_ + "</font>";
         }
      }
   }
   else
   {
      mc.price1_txt.textAutoSize = "shrink”";
      mc.price1_txt.htmlText = _loc7_ + "\n" + "<font size=\'15\'>" + _loc6_ + "</font>";
      if(mc.price1_txt.maxscroll > 1)
      {
         mc.price1_txt.htmlText = "<font size=\'15\'>" + _loc7_ + "</font>" + "\n" + "<font size=\'12\'>" + _loc6_ + "</font>";
      }
   }
   var _loc15_ = "";
   var _loc5_ = "";
   var _loc10_ = "";
   var _loc4_ = "";
   if(TCATDISABLE == 1)
   {
      _loc15_ = lib.util.GoldCurrency.SetTCatText(_loc3_[4],TCATTYPE);
      _loc10_ = eachPriceStr + lib.util.GoldCurrency.SetTCatText(_loc3_[5],TCATTYPE);
   }
   else
   {
      _loc15_ = lib.util.GoldCurrency.SetGoldText(_loc3_[2],0,0,0,goldType);
      _loc10_ = eachPriceStr + lib.util.GoldCurrency.SetGoldText(_loc3_[3],0,0,0,goldType);
   }
   _loc5_ = _loc15_;
   _loc4_ = _loc10_;
   if(waitSlotObj.priceIns == 1)
   {
      mc.price2_txt.textAutoSize = "shrink”";
      mc.price2_txt.htmlText = "<font size=\'15\'>" + _loc4_ + "</font>" + "\n" + "<font size=\'14\'>" + _loc5_ + "</font>";
      if(mc.price2_txt.maxscroll > 1)
      {
         mc.price2_txt.htmlText = "<font size=\'14\'>" + _loc4_ + "</font>" + "\n" + "<font size=\'12\'>" + _loc5_ + "</font>";
         if(mc.price2_txt.maxscroll > 1)
         {
            mc.price2_txt.htmlText = "<font size=\'13\'>" + _loc4_ + "</font>" + "\n" + "<font size=\'12\'>" + _loc5_ + "</font>";
         }
      }
   }
   else
   {
      mc.price2_txt.textAutoSize = "shrink”";
      mc.price2_txt.htmlText = _loc5_ + "\n" + "<font size=\'15\'>" + _loc4_ + "</font>";
      if(mc.price2_txt.maxscroll > 1)
      {
         mc.price2_txt.htmlText = "<font size=\'15\'>" + _loc5_ + "</font>" + "\n" + "<font size=\'12\'>" + _loc4_ + "</font>";
      }
   }
   mc.Slot.onEnterFrame = function()
   {
      if(this.drag != undefined)
      {
         this.drag = false;
         this.sealType = sealType;
         this.masterpiece = bMasterpiece;
         this.grade = grade;
         var _loc2_ = this.enchantFd;
         var _loc3_ = 21433;
         if(enchantNum > 11 && enchantNum < 15)
         {
            _loc3_ = 8915599;
         }
         else if(enchantNum > 14)
         {
            _loc3_ = 10624002;
         }
         _loc2_.shadowColor = _loc3_;
         _loc2_.text = "+" + enchantNum;
         _loc2_._visible = enchantNum > 0;
         delete this.onEnterFrame;
      }
   };
   if(grade == 0)
   {
      mc.item_txt.textColor = lib.info.TextColor.RAREGRADE0;
      mc.levelMc.txt.textColor = lib.info.TextColor.RAREGRADE0;
   }
   else if(grade == 1)
   {
      mc.item_txt.textColor = lib.info.TextColor.RAREGRADE1;
      mc.levelMc.txt.textColor = lib.info.TextColor.RAREGRADE1;
   }
   else if(grade == 2)
   {
      mc.item_txt.textColor = lib.info.TextColor.RAREGRADE2;
      mc.levelMc.txt.textColor = lib.info.TextColor.RAREGRADE2;
   }
   else if(grade == 3)
   {
      mc.item_txt.textColor = lib.info.TextColor.RAREGRADE3;
      mc.levelMc.txt.textColor = lib.info.TextColor.RAREGRADE3;
   }
   var _DelegateInfo = bDelegateInfo.split("\t");
   bSellerStates = Number(bSellerStates);
   if(bSellerStates == 1)
   {
      mc.name_txt.setText("<font color=\'#" + lib.info.TextColor.LIST_OFFLINE.toString(16) + "\'>" + sellerName + "</font>");
   }
   else if(bSellerStates == 0 || bSellerStates == 3)
   {
      mc.name_txt.setText("<font color=\'#" + lib.info.TextColor.LIST_NORMAL.toString(16) + "\'>" + sellerName + "</font>");
   }
   if(TCATDISABLE == 1)
   {
      var _loc17_ = lib.util.UIString.getUIString("$321066") + ": " + lib.util.GoldCurrency.SetGoldText(_loc3_[2],0,0,0,goldType);
      _loc17_ = _loc17_ + ("\n" + lib.util.UIString.getUIString("$321105") + ": " + lib.util.GoldCurrency.SetGoldText(_loc3_[3],0,0,0,goldType));
      lib.manager.ToolTip.add(mc.bargainBtn,_loc17_,1);
      mc.gotoAndStop(2);
      mc.tcatBtn.onLoad = function()
      {
         var _loc2_ = this.txtBtn;
         if(bSellerStates == 3 || _DelegateInfo[2] == 0)
         {
            _loc2_.setEnabled(false);
         }
         _loc2_.setRelease(function()
         {
            ToGame_TradeHouse_TcatBuy(id);
         }
         );
      };
   }
   else
   {
      mc.gotoAndStop(1);
   }
   mc.bargainBtn.onLoad = function()
   {
      var _loc2_ = this.txtBtn;
      if(bSellerStates == 1 || bSellerStates == 3 || _DelegateInfo[1] == 0)
      {
         _loc2_.setEnabled(false);
         lib.manager.ToolTip.remove(mc.bargainBtn);
      }
      else
      {
         _loc2_.setEnabled(true);
      }
      _loc2_.setRelease(function()
      {
         ToGame_TradeHouse_RequestBargain(id);
      }
      );
   };
   mc.buyBtn.onLoad = function()
   {
      var _loc2_ = this.txtBtn;
      if(bSellerStates == 3 || _DelegateInfo[0] == 0)
      {
         _loc2_.setEnabled(false);
      }
      _loc2_.setRelease(function()
      {
         ToGame_TradeHouse_DirectBuy(id);
      }
      );
   };
   mc.hit.onRollOver = function()
   {
      if(waitClickId != this._parent.id)
      {
         this._parent.effect_mc.gotoAndStop("over");
      }
   };
   mc.hit.onRollOut = mc.hit.onReleaseOutside = function()
   {
      if(waitClickId != this._parent.id)
      {
         this._parent.effect_mc.gotoAndStop("out");
      }
   };
   mc.hit.onPress = function()
   {
      if(waitClickId != this._parent.id)
      {
         this._parent.effect_mc.gotoAndStop("press");
      }
   };
   mc.hit.onRelease = function()
   {
      if(waitClickId != this._parent.id)
      {
         waitList.getLine(waitClickId).effect_mc.gotoAndStop("out");
         waitClickId = this._parent.id;
         this._parent.effect_mc.gotoAndStop("active");
      }
   };
};
myListener.OnGame_TradeHouse_UpdateWaitListItem = function(id, itemData, price, sellerName, bSellerStates, bDelegateInfo)
{
   var mc = waitList.getLine(id);
   var _loc2_ = itemData.split("\t");
   if(_loc2_[_loc2_.length - 1] == "undefined" || _loc2_[_loc2_.length - 1] == "")
   {
      _loc2_.pop();
   }
   var grade = Number(_loc2_[6]);
   var _loc23_ = itemGradeStr[Number(_loc2_[6])];
   var sealType = _loc2_[7];
   var bMasterpiece = _loc2_[8];
   var _loc15_ = _loc2_[9];
   var _loc14_ = _loc2_[10];
   mc.num_txt.verticalAlign = "center";
   mc.price1_txt.verticalAlign = "center";
   mc.price2_txt.verticalAlign = "center";
   mc.Slot.id = id;
   lib.display.DrawBitmapData.draw(mc.Slot.Icon,_loc2_[0],0,0,0,0,50,50,0.78);
   mc.Slot.Icon.TEX = _loc2_[0];
   lib.manager.ToolTip.add(mc.Slot.SLOT,mc.id + "\t0",6,mc.Slot.Icon);
   var _loc21_ = Number(_loc2_[1]);
   var enchantNum = Number(_loc2_[2]);
   var _loc19_ = Number(_loc2_[4]);
   var _loc9_ = "";
   if(enchantNum > 0)
   {
      _loc9_ = "+" + enchantNum + " " + _loc2_[3];
   }
   else
   {
      _loc9_ = _loc2_[3];
   }
   mc.num_txt.text = _loc19_;
   mc.levelMc.txt.text = _loc2_[5];
   lib.util.ExtString.textCut(mc.item_txt,_loc9_,1);
   var _loc8_ = "";
   if(_loc15_ != "" && _loc15_ != undefined)
   {
      _loc8_ = _loc8_ + _loc15_;
   }
   if(_loc14_ != "" && _loc14_ != undefined)
   {
      if(_loc8_ != "")
      {
         _loc8_ = _loc8_ + "/";
      }
      _loc8_ = _loc8_ + ("<img src=\'icon_itemlevel\' vspace=\'-3\'><font color=\'#2280FF\'>" + _loc14_ + "</font>");
   }
   mc.stat_txt.htmlText = _loc8_;
   var _loc3_ = price.split("\t");
   var _loc20_ = lib.util.GoldCurrency.SetGoldText(_loc3_[0],0,0,0,goldType);
   var _loc7_ = _loc20_;
   var _loc18_ = lib.util.GoldCurrency.SetGoldText(_loc3_[1],0,0,0,goldType);
   var _loc6_ = eachPriceStr + _loc18_;
   if(waitSlotObj.priceIns == 1)
   {
      mc.price1_txt.textAutoSize = "shrink”";
      mc.price1_txt.htmlText = "<font size=\'15\'>" + _loc6_ + "</font>" + "\n" + "<font size=\'14\'>" + _loc7_ + "</font>";
      if(mc.price1_txt.maxscroll > 1)
      {
         mc.price1_txt.htmlText = "<font size=\'14\'>" + _loc6_ + "</font>" + "\n" + "<font size=\'12\'>" + _loc7_ + "</font>";
         if(mc.price1_txt.maxscroll > 1)
         {
            mc.price1_txt.htmlText = "<font size=\'13\'>" + _loc6_ + "</font>" + "\n" + "<font size=\'12\'>" + _loc7_ + "</font>";
         }
      }
   }
   else
   {
      mc.price1_txt.textAutoSize = "shrink”";
      mc.price1_txt.htmlText = _loc7_ + "\n" + "<font size=\'15\'>" + _loc6_ + "</font>";
      if(mc.price1_txt.maxscroll > 1)
      {
         mc.price1_txt.htmlText = "<font size=\'15\'>" + _loc7_ + "</font>" + "\n" + "<font size=\'12\'>" + _loc6_ + "</font>";
      }
   }
   var _loc11_ = "";
   var _loc5_ = "";
   var _loc12_ = "";
   var _loc4_ = "";
   if(TCATDISABLE == 1)
   {
      _loc11_ = lib.util.GoldCurrency.SetTCatText(_loc3_[4],TCATTYPE);
      _loc12_ = eachPriceStr + lib.util.GoldCurrency.SetTCatText(_loc3_[5],TCATTYPE);
   }
   else
   {
      _loc11_ = lib.util.GoldCurrency.SetGoldText(_loc3_[2],0,0,0,goldType);
      _loc12_ = eachPriceStr + lib.util.GoldCurrency.SetGoldText(_loc3_[3],0,0,0,goldType);
   }
   _loc5_ = _loc11_;
   _loc4_ = _loc12_;
   if(waitSlotObj.priceIns == 1)
   {
      mc.price2_txt.textAutoSize = "shrink”";
      mc.price2_txt.htmlText = "<font size=\'15\'>" + _loc4_ + "</font>" + "\n" + "<font size=\'14\'>" + _loc5_ + "</font>";
      if(mc.price2_txt.maxscroll > 1)
      {
         mc.price2_txt.htmlText = "<font size=\'14\'>" + _loc4_ + "</font>" + "\n" + "<font size=\'12\'>" + _loc5_ + "</font>";
         if(mc.price2_txt.maxscroll > 1)
         {
            mc.price2_txt.htmlText = "<font size=\'13\'>" + _loc4_ + "</font>" + "\n" + "<font size=\'12\'>" + _loc5_ + "</font>";
         }
      }
   }
   else
   {
      mc.price2_txt.textAutoSize = "shrink”";
      mc.price2_txt.htmlText = _loc5_ + "\n" + "<font size=\'15\'>" + _loc4_ + "</font>";
      if(mc.price2_txt.maxscroll > 1)
      {
         mc.price2_txt.htmlText = "<font size=\'15\'>" + _loc5_ + "</font>" + "\n" + "<font size=\'12\'>" + _loc4_ + "</font>";
      }
   }
   mc.Slot.onEnterFrame = function()
   {
      if(this.drag != undefined)
      {
         this.drag = false;
         this.sealType = sealType;
         this.masterpiece = bMasterpiece;
         this.grade = grade;
         var _loc2_ = this.enchantFd;
         var _loc3_ = 21433;
         if(enchantNum > 11 && enchantNum < 15)
         {
            _loc3_ = 8915599;
         }
         else if(enchantNum > 14)
         {
            _loc3_ = 10624002;
         }
         _loc2_.shadowColor = _loc3_;
         _loc2_.text = "+" + enchantNum;
         _loc2_._visible = enchantNum > 0;
         delete this.onEnterFrame;
      }
   };
   if(grade == 0)
   {
      mc.item_txt.textColor = lib.info.TextColor.RAREGRADE0;
      mc.levelMc.txt.textColor = lib.info.TextColor.RAREGRADE0;
   }
   else if(grade == 1)
   {
      mc.item_txt.textColor = lib.info.TextColor.RAREGRADE1;
      mc.levelMc.txt.textColor = lib.info.TextColor.RAREGRADE1;
   }
   else if(grade == 2)
   {
      mc.item_txt.textColor = lib.info.TextColor.RAREGRADE2;
      mc.levelMc.txt.textColor = lib.info.TextColor.RAREGRADE2;
   }
   else if(grade == 3)
   {
      mc.item_txt.textColor = lib.info.TextColor.RAREGRADE3;
      mc.levelMc.txt.textColor = lib.info.TextColor.RAREGRADE3;
   }
   var _DelegateInfo = bDelegateInfo.split("\t");
   bSellerStates = Number(bSellerStates);
   if(bSellerStates == 1)
   {
      mc.name_txt.setText("<font color=\'#" + lib.info.TextColor.LIST_OFFLINE.toString(16) + "\'>" + sellerName + "</font>");
   }
   else if(bSellerStates == 0 || bSellerStates == 3)
   {
      mc.name_txt.setText("<font color=\'#" + lib.info.TextColor.LIST_NORMAL.toString(16) + "\'>" + sellerName + "</font>");
   }
   if(TCATDISABLE == 1)
   {
      var _loc17_ = lib.util.UIString.getUIString("$321066") + ": " + lib.util.GoldCurrency.SetGoldText(_loc3_[2],0,0,0,goldType);
      _loc17_ = _loc17_ + ("\n" + lib.util.UIString.getUIString("$321105") + ": " + lib.util.GoldCurrency.SetGoldText(_loc3_[3],0,0,0,goldType));
      lib.manager.ToolTip.add(mc.bargainBtn,_loc17_,1);
      mc.gotoAndStop(2);
      mc.tcatBtn.onLoad = function()
      {
         var _loc2_ = this.txtBtn;
         if(bSellerStates == 3 || _DelegateInfo[2] == 0)
         {
            _loc2_.setEnabled(false);
         }
         _loc2_.setRelease(function()
         {
            ToGame_TradeHouse_TcatBuy(id);
         }
         );
      };
   }
   else
   {
      mc.gotoAndStop(1);
   }
   mc.bargainBtn.onLoad = function()
   {
      var _loc2_ = this.txtBtn;
      if(bSellerStates == 1 || bSellerStates == 3 || _DelegateInfo[1] == 0)
      {
         _loc2_.setEnabled(false);
         lib.manager.ToolTip.remove(mc.bargainBtn);
      }
      else
      {
         _loc2_.setEnabled(true);
      }
      _loc2_.setRelease(function()
      {
         ToGame_TradeHouse_RequestBargain(id);
      }
      );
   };
   mc.buyBtn.onLoad = function()
   {
      var _loc2_ = this.txtBtn;
      if(bSellerStates == 3 || _DelegateInfo[0] == 0)
      {
         _loc2_.setEnabled(false);
      }
      _loc2_.setRelease(function()
      {
         ToGame_TradeHouse_DirectBuy(id);
      }
      );
   };
};
myListener.OnGame_TradeHouse_RemoveWaitListItem = function(id)
{
   if(id == waitClickId)
   {
      waitClickId = null;
   }
   waitList.remove(id);
   if(waitList.length <= 0)
   {
      container_mc.wait_mc.defaultStrhtmlText = "<img src=\'icon_notice\' vspace=\'-0\'> " + defaultStr2;
   }
};
myListener.OnGame_TradeHouse_ClearWaitList = function()
{
   waitList.clear();
   waitClickId = null;
   container_mc.wait_mc.defaultStr.htmlText = defaultStr2;
};
var soldList = new lib.util.List(container_mc.sold_mc.list_mc,"sold_line",0);
soldList.bg = "bg_mc";
var soldClickId = null;
myListener.OnGame_TradeHouse_AddSoldListItem = function(id, itemData, price, soldTime, soldType)
{
   container_mc.sold_mc.defaultStr.text = "";
   soldType = Number(soldType);
   var _loc2_ = soldList.add(id,"sold_line");
   var _loc3_ = itemData.split("\t");
   if(_loc3_[_loc3_.length - 1] == "undefined" || _loc3_[_loc3_.length - 1] == "")
   {
      _loc3_.pop();
   }
   var grade = Number(_loc3_[6]);
   var _loc19_ = itemGradeStr[Number(_loc3_[6])];
   var sealType = _loc3_[7];
   var bMasterpiece = _loc3_[8];
   var _loc15_ = _loc3_[9];
   var _loc14_ = _loc3_[10];
   _loc2_.num_txt.verticalAlign = "center";
   _loc2_.price1_txt.verticalAlign = "center";
   _loc2_.date_txt.verticalAlign = "center";
   _loc2_.soldType_txt.verticalAlign = "center";
   _loc2_.Slot.id = id;
   lib.display.DrawBitmapData.draw(_loc2_.Slot.Icon,_loc3_[0],0,0,0,0,50,50,0.78);
   _loc2_.Slot.Icon.TEX = _loc3_[0];
   lib.manager.ToolTip.add(_loc2_.Slot.SLOT,_loc2_.id + "\t1",6,_loc2_.Slot.Icon);
   var _loc17_ = Number(_loc3_[1]);
   var enchantNum = Number(_loc3_[2]);
   var _loc16_ = Number(_loc3_[4]);
   var _loc9_ = "";
   if(enchantNum > 0)
   {
      _loc9_ = "+" + enchantNum + " " + _loc3_[3];
   }
   else
   {
      _loc9_ = _loc3_[3];
   }
   _loc2_.num_txt.text = _loc16_;
   _loc2_.levelMc.txt.text = _loc3_[5];
   lib.util.ExtString.textCut(_loc2_.item_txt,_loc9_,1);
   var _loc6_ = "";
   if(_loc15_ != "" && _loc15_ != undefined)
   {
      _loc6_ = _loc6_ + _loc15_;
   }
   if(_loc14_ != "" && _loc14_ != undefined)
   {
      if(_loc6_ != "")
      {
         _loc6_ = _loc6_ + "/";
      }
      _loc6_ = _loc6_ + ("<img src=\'icon_itemlevel\' vspace=\'-3\'><font color=\'#2280FF\'>" + _loc14_ + "</font>");
   }
   _loc2_.stat_txt.htmlText = _loc6_;
   _loc2_.date_txt.text = soldTime;
   var _loc7_ = price.split("\t");
   var _loc12_ = "";
   var _loc5_ = "";
   var _loc10_ = "";
   var _loc4_ = "";
   if(soldType == 2)
   {
      _loc12_ = lib.util.GoldCurrency.SetTCatText(_loc7_[0],TCATTYPE);
      _loc10_ = eachPriceStr + lib.util.GoldCurrency.SetTCatText(_loc7_[1],TCATTYPE);
   }
   else
   {
      _loc12_ = lib.util.GoldCurrency.SetGoldText(_loc7_[0],0,0,0,goldType);
      _loc10_ = eachPriceStr + lib.util.GoldCurrency.SetGoldText(_loc7_[1],0,0,0,goldType);
   }
   _loc5_ = _loc12_;
   _loc4_ = _loc10_;
   if(soldSlotObj.priceIns == 1)
   {
      _loc2_.price1_txt.textAutoSize = "shrink”";
      _loc2_.price1_txt.htmlText = "<font size=\'15\'>" + _loc4_ + "</font>" + "\n" + "<font size=\'14\'>" + _loc5_ + "</font>";
      if(_loc2_.price1_txt.maxscroll > 1)
      {
         _loc2_.price1_txt.htmlText = "<font size=\'14\'>" + _loc4_ + "</font>" + "\n" + "<font size=\'12\'>" + _loc5_ + "</font>";
         if(_loc2_.price1_txt.maxscroll > 1)
         {
            _loc2_.price1_txt.htmlText = "<font size=\'13\'>" + _loc4_ + "</font>" + "\n" + "<font size=\'12\'>" + _loc5_ + "</font>";
         }
      }
   }
   else
   {
      _loc2_.price1_txt.textAutoSize = "shrink”";
      _loc2_.price1_txt.htmlText = _loc5_ + "\n" + "<font size=\'15\'>" + _loc4_ + "</font>";
      if(_loc2_.price1_txt.maxscroll > 1)
      {
         _loc2_.price1_txt.htmlText = "<font size=\'15\'>" + _loc5_ + "</font>" + "\n" + "<font size=\'12\'>" + _loc4_ + "</font>";
      }
   }
   _loc2_.Slot.onEnterFrame = function()
   {
      if(this.drag != undefined)
      {
         this.drag = false;
         this.sealType = sealType;
         this.masterpiece = bMasterpiece;
         this.grade = grade;
         var _loc2_ = this.enchantFd;
         var _loc3_ = 21433;
         if(enchantNum > 11 && enchantNum < 15)
         {
            _loc3_ = 8915599;
         }
         else if(enchantNum > 14)
         {
            _loc3_ = 10624002;
         }
         _loc2_.shadowColor = _loc3_;
         _loc2_.text = "+" + enchantNum;
         _loc2_._visible = enchantNum > 0;
         delete this.onEnterFrame;
      }
   };
   if(grade == 0)
   {
      _loc2_.item_txt.textColor = lib.info.TextColor.RAREGRADE0;
      _loc2_.levelMc.txt.textColor = lib.info.TextColor.RAREGRADE0;
   }
   else if(grade == 1)
   {
      _loc2_.item_txt.textColor = lib.info.TextColor.RAREGRADE1;
      _loc2_.levelMc.txt.textColor = lib.info.TextColor.RAREGRADE1;
   }
   else if(grade == 2)
   {
      _loc2_.item_txt.textColor = lib.info.TextColor.RAREGRADE2;
      _loc2_.levelMc.txt.textColor = lib.info.TextColor.RAREGRADE2;
   }
   else if(grade == 3)
   {
      _loc2_.item_txt.textColor = lib.info.TextColor.RAREGRADE3;
      _loc2_.levelMc.txt.textColor = lib.info.TextColor.RAREGRADE3;
   }
   if(soldType == 0)
   {
      _loc2_.soldType_txt.text = BuyTypeStr0;
   }
   else if(soldType == 1)
   {
      _loc2_.soldType_txt.text = BuyTypeStr1;
   }
   else if(soldType == 2)
   {
      _loc2_.soldType_txt.text = BuyTypeStr2;
   }
   _loc2_.hit.onRollOver = function()
   {
      if(soldClickId != this._parent.id)
      {
         this._parent.effect_mc.gotoAndStop("over");
      }
   };
   _loc2_.hit.onRollOut = _loc2_.hit.onReleaseOutside = function()
   {
      if(soldClickId != this._parent.id)
      {
         this._parent.effect_mc.gotoAndStop("out");
      }
   };
   _loc2_.hit.onPress = function()
   {
      if(soldClickId != this._parent.id)
      {
         this._parent.effect_mc.gotoAndStop("press");
      }
   };
   _loc2_.hit.onRelease = function()
   {
      if(soldClickId != this._parent.id)
      {
         soldList.getLine(soldClickId).effect_mc.gotoAndStop("out");
         soldClickId = this._parent.id;
         this._parent.effect_mc.gotoAndStop("active");
      }
   };
};
myListener.OnGame_TradeHouse_UpdateSoldListItem = function(id, itemData, price, soldTime, soldType)
{
   var _loc2_ = soldList.getLine(id);
   soldType = Number(soldType);
   var _loc3_ = itemData.split("\t");
   if(_loc3_[_loc3_.length - 1] == "undefined" || _loc3_[_loc3_.length - 1] == "")
   {
      _loc3_.pop();
   }
   var grade = Number(_loc3_[6]);
   var _loc19_ = itemGradeStr[Number(_loc3_[6])];
   var sealType = _loc3_[7];
   var bMasterpiece = _loc3_[8];
   var _loc14_ = _loc3_[9];
   var _loc13_ = _loc3_[10];
   _loc2_.num_txt.verticalAlign = "center";
   _loc2_.price1_txt.verticalAlign = "center";
   _loc2_.date_txt.verticalAlign = "center";
   _loc2_.soldType_txt.verticalAlign = "center";
   _loc2_.Slot.id = id;
   lib.display.DrawBitmapData.draw(_loc2_.Slot.Icon,_loc3_[0],0,0,0,0,50,50,0.78);
   _loc2_.Slot.Icon.TEX = _loc3_[0];
   lib.manager.ToolTip.add(_loc2_.Slot.SLOT,_loc2_.id + "\t1",6,_loc2_.Slot.Icon);
   var _loc17_ = Number(_loc3_[1]);
   var enchantNum = Number(_loc3_[2]);
   var _loc16_ = Number(_loc3_[4]);
   var _loc9_ = "";
   if(enchantNum > 0)
   {
      _loc9_ = "+" + enchantNum + " " + _loc3_[3];
   }
   else
   {
      _loc9_ = _loc3_[3];
   }
   _loc2_.num_txt.text = _loc16_;
   _loc2_.levelMc.txt.text = _loc3_[5];
   lib.util.ExtString.textCut(_loc2_.item_txt,_loc9_,1);
   var _loc6_ = "";
   if(_loc14_ != "" && _loc14_ != undefined)
   {
      _loc6_ = _loc6_ + _loc14_;
   }
   if(_loc13_ != "" && _loc13_ != undefined)
   {
      if(_loc6_ != "")
      {
         _loc6_ = _loc6_ + "/";
      }
      _loc6_ = _loc6_ + ("<img src=\'icon_itemlevel\' vspace=\'-3\'><font color=\'#2280FF\'>" + _loc13_ + "</font>");
   }
   _loc2_.stat_txt.htmlText = _loc6_;
   _loc2_.date_txt.text = soldTime;
   var _loc7_ = price.split("\t");
   var _loc11_ = "";
   var _loc5_ = "";
   var _loc15_ = "";
   var _loc4_ = "";
   if(soldType == 2)
   {
      _loc11_ = lib.util.GoldCurrency.SetTCatText(_loc7_[0],TCATTYPE);
      _loc15_ = eachPriceStr + lib.util.GoldCurrency.SetTCatText(_loc7_[1],TCATTYPE);
   }
   else
   {
      _loc11_ = lib.util.GoldCurrency.SetGoldText(_loc7_[0],0,0,0,goldType);
      _loc15_ = eachPriceStr + lib.util.GoldCurrency.SetGoldText(_loc7_[1],0,0,0,goldType);
   }
   _loc5_ = _loc11_;
   _loc4_ = _loc15_;
   if(soldSlotObj.priceIns == 1)
   {
      _loc2_.price1_txt.textAutoSize = "shrink”";
      _loc2_.price1_txt.htmlText = "<font size=\'15\'>" + _loc4_ + "</font>" + "\n" + "<font size=\'14\'>" + _loc5_ + "</font>";
      if(_loc2_.price1_txt.maxscroll > 1)
      {
         _loc2_.price1_txt.htmlText = "<font size=\'14\'>" + _loc4_ + "</font>" + "\n" + "<font size=\'12\'>" + _loc5_ + "</font>";
         if(_loc2_.price1_txt.maxscroll > 1)
         {
            _loc2_.price1_txt.htmlText = "<font size=\'13\'>" + _loc4_ + "</font>" + "\n" + "<font size=\'12\'>" + _loc5_ + "</font>";
         }
      }
   }
   else
   {
      _loc2_.price1_txt.textAutoSize = "shrink”";
      _loc2_.price1_txt.htmlText = _loc5_ + "\n" + "<font size=\'15\'>" + _loc4_ + "</font>";
      if(_loc2_.price1_txt.maxscroll > 1)
      {
         _loc2_.price1_txt.htmlText = "<font size=\'15\'>" + _loc5_ + "</font>" + "\n" + "<font size=\'12\'>" + _loc4_ + "</font>";
      }
   }
   _loc2_.Slot.onEnterFrame = function()
   {
      if(this.drag != undefined)
      {
         this.drag = false;
         this.sealType = sealType;
         this.masterpiece = bMasterpiece;
         this.grade = grade;
         var _loc2_ = this.enchantFd;
         var _loc3_ = 21433;
         if(enchantNum > 11 && enchantNum < 15)
         {
            _loc3_ = 8915599;
         }
         else if(enchantNum > 14)
         {
            _loc3_ = 10624002;
         }
         _loc2_.shadowColor = _loc3_;
         _loc2_.text = "+" + enchantNum;
         _loc2_._visible = enchantNum > 0;
         delete this.onEnterFrame;
      }
   };
   if(grade == 0)
   {
      _loc2_.item_txt.textColor = lib.info.TextColor.RAREGRADE0;
      _loc2_.levelMc.txt.textColor = lib.info.TextColor.RAREGRADE0;
   }
   else if(grade == 1)
   {
      _loc2_.item_txt.textColor = lib.info.TextColor.RAREGRADE1;
      _loc2_.levelMc.txt.textColor = lib.info.TextColor.RAREGRADE1;
   }
   else if(grade == 2)
   {
      _loc2_.item_txt.textColor = lib.info.TextColor.RAREGRADE2;
      _loc2_.level_txt.textColor = lib.info.TextColor.RAREGRADE2;
      _loc2_.num_txt.textColor = lib.info.TextColor.RAREGRADE2;
      _loc2_.grade_txt.textColor = lib.info.TextColor.RAREGRADE2;
   }
   else if(grade == 3)
   {
      _loc2_.item_txt.textColor = lib.info.TextColor.RAREGRADE3;
      _loc2_.levelMc.txt.textColor = lib.info.TextColor.RAREGRADE3;
   }
   if(soldType == 0)
   {
      _loc2_.soldType_txt.text = BuyTypeStr0;
   }
   else if(soldType == 1)
   {
      _loc2_.soldType_txt.text = BuyTypeStr1;
   }
   else if(soldType == 2)
   {
      _loc2_.soldType_txt.text = BuyTypeStr2;
   }
};
myListener.OnGame_TradeHouse_RemoveSoldListItem = function(id)
{
   if(id == soldClickId)
   {
      soldClickId = null;
   }
   soldList.remove(id);
   if(soldList.length <= 0)
   {
      container_mc.sold_mc.defaultStr.htmlText = defaultStr2;
   }
};
myListener.OnGame_TradeHouse_ClearSoldList = function()
{
   soldList.clear();
   soldClickId = null;
   container_mc.sold_mc.defaultStr.htmlText = defaultStr2;
};
var saleList = new lib.util.List(container_mc.saleList_mc.list_mc,"calc_line",0);
saleList.bg = "bg_mc";
var saleListClickId = null;
myListener.OnGame_TradeHouse_AddSaleListItem = function(id, itemData, price, soldTime, type, calcMoney)
{
   container_mc.saleList_mc.defaultStr.text = "";
   saleListCalcAll_btn.setEnabled(true);
   var _loc2_ = saleList.add(id,"calc_line");
   var _loc3_ = itemData.split("\t");
   if(_loc3_[_loc3_.length - 1] == "undefined" || _loc3_[_loc3_.length - 1] == "")
   {
      _loc3_.pop();
   }
   var grade = Number(_loc3_[6]);
   var _loc18_ = itemGradeStr[Number(_loc3_[6])];
   var sealType = _loc3_[7];
   var bMasterpiece = _loc3_[8];
   _loc2_.item_txt.verticalAlign = "center";
   _loc2_.name_txt.verticalAlign = "center";
   _loc2_.grade_txt.verticalAlign = "center";
   _loc2_.num_txt.verticalAlign = "center";
   _loc2_.price1_txt.verticalAlign = "center";
   _loc2_.price2_txt.verticalAlign = "center";
   _loc2_.date_txt.verticalAlign = "center";
   _loc2_.sellingType_txt.verticalAlign = "center";
   _loc2_.level_txt.verticalAlign = "center";
   _loc2_.Slot.id = id;
   lib.display.DrawBitmapData.draw(_loc2_.Slot.Icon,_loc3_[0],0,0,0,0,50,50,0.78);
   _loc2_.Slot.Icon.TEX = _loc3_[0];
   lib.manager.ToolTip.add(_loc2_.Slot.SLOT,_loc2_.id + "\t3",6,_loc2_.Slot.Icon);
   var _loc16_ = Number(_loc3_[1]);
   var enchantNum = Number(_loc3_[2]);
   var _loc14_ = Number(_loc3_[4]);
   type = Number(type);
   if(type == 0)
   {
      _loc2_.sellingType_txt.text = SaleTypeStr0;
   }
   else if(type == 1)
   {
      _loc2_.sellingType_txt.text = SaleTypeStr1;
   }
   else if(type == 2)
   {
      _loc2_.sellingType_txt.text = SaleTypeStr2;
   }
   var _loc7_ = "";
   if(enchantNum > 0)
   {
      _loc7_ = "+" + enchantNum + " " + _loc3_[3];
   }
   else
   {
      _loc7_ = _loc3_[3];
   }
   _loc2_.num_txt.text = _loc14_;
   _loc2_.level_txt.text = _loc3_[5];
   lib.util.ExtString.textCut(_loc2_.item_txt,_loc7_,1);
   _loc2_.grade_txt.text = itemGradeStr[Number(_loc3_[6])];
   _loc2_.date_txt.text = soldTime;
   var _loc4_ = price.split("\t");
   var _loc13_ = "";
   var _loc11_ = "";
   var _loc12_ = "";
   var _loc10_ = "";
   var _loc5_ = "";
   if(type == 2)
   {
      _loc13_ = lib.util.GoldCurrency.SetTCatText(_loc4_[0],TCATTYPE);
      _loc12_ = eachPriceStr + lib.util.GoldCurrency.SetTCatText(_loc4_[1],TCATTYPE);
      _loc5_ = lib.util.GoldCurrency.SetTCatText(calcMoney,TCATTYPE);
   }
   else
   {
      _loc13_ = lib.util.GoldCurrency.SetGoldText(_loc4_[0],0,0,0,goldType);
      _loc12_ = eachPriceStr + lib.util.GoldCurrency.SetGoldText(_loc4_[1],0,0,0,goldType);
      _loc5_ = lib.util.GoldCurrency.SetGoldText(calcMoney,0,0,0,goldType);
   }
   _loc11_ = _loc13_;
   _loc10_ = _loc12_;
   _loc2_.price1_txt.textAutoSize = "shrink”";
   _loc2_.price1_txt.htmlText = _loc11_ + "\n" + "<font size=\'15\'>" + _loc10_ + "</font>";
   if(_loc2_.price1_txt.maxscroll > 1)
   {
      _loc2_.price1_txt.htmlText = "<font size=\'15\'>" + _loc11_ + "</font>" + "\n" + "<font size=\'12\'>" + _loc10_ + "</font>";
   }
   _loc2_.price2_txt.textAutoSize = "shrink”";
   _loc2_.price2_txt.htmlText = "<font size=\'15\'>" + _loc5_ + "</font>";
   if(_loc2_.price1_txt.maxscroll > 1)
   {
      _loc2_.price2_txt.htmlText = _loc5_;
   }
   _loc2_.Slot.onEnterFrame = function()
   {
      if(this.drag != undefined)
      {
         this.drag = false;
         this.sealType = sealType;
         this.masterpiece = bMasterpiece;
         this.grade = grade;
         var _loc2_ = this.enchantFd;
         var _loc3_ = 21433;
         if(enchantNum > 11 && enchantNum < 15)
         {
            _loc3_ = 8915599;
         }
         else if(enchantNum > 14)
         {
            _loc3_ = 10624002;
         }
         _loc2_.shadowColor = _loc3_;
         _loc2_.text = "+" + enchantNum;
         _loc2_._visible = enchantNum > 0;
         delete this.onEnterFrame;
      }
   };
   if(grade == 0)
   {
      _loc2_.item_txt.textColor = lib.info.TextColor.RAREGRADE0;
      _loc2_.level_txt.textColor = lib.info.TextColor.RAREGRADE0;
      _loc2_.num_txt.textColor = lib.info.TextColor.RAREGRADE0;
      _loc2_.grade_txt.textColor = lib.info.TextColor.RAREGRADE0;
   }
   else if(grade == 1)
   {
      _loc2_.item_txt.textColor = lib.info.TextColor.RAREGRADE1;
      _loc2_.level_txt.textColor = lib.info.TextColor.RAREGRADE1;
      _loc2_.num_txt.textColor = lib.info.TextColor.RAREGRADE1;
      _loc2_.grade_txt.textColor = lib.info.TextColor.RAREGRADE1;
   }
   else if(grade == 2)
   {
      _loc2_.item_txt.textColor = lib.info.TextColor.RAREGRADE2;
      _loc2_.level_txt.textColor = lib.info.TextColor.RAREGRADE2;
      _loc2_.num_txt.textColor = lib.info.TextColor.RAREGRADE2;
      _loc2_.grade_txt.textColor = lib.info.TextColor.RAREGRADE2;
   }
   else if(grade == 3)
   {
      _loc2_.item_txt.textColor = lib.info.TextColor.RAREGRADE3;
      _loc2_.level_txt.textColor = lib.info.TextColor.RAREGRADE3;
      _loc2_.num_txt.textColor = lib.info.TextColor.RAREGRADE3;
      _loc2_.grade_txt.textColor = lib.info.TextColor.RAREGRADE3;
   }
   if(soldType == 0)
   {
      _loc2_.soldType_txt.text = SaleTypeStr0;
   }
   else if(soldType == 1)
   {
      _loc2_.soldType_txt.text = SaleTypeStr1;
   }
   else if(soldType == 2)
   {
      _loc2_.soldType_txt.text = SaleTypeStr2;
   }
   _loc2_.hit.onRollOver = function()
   {
      if(saleListClickId != this._parent.id)
      {
         this._parent.effect_mc.gotoAndStop("over");
      }
   };
   _loc2_.hit.onRollOut = _loc2_.hit.onReleaseOutside = function()
   {
      if(saleListClickId != this._parent.id)
      {
         this._parent.effect_mc.gotoAndStop("out");
      }
   };
   _loc2_.hit.onPress = function()
   {
      if(saleListClickId != this._parent.id)
      {
         this._parent.effect_mc.gotoAndStop("press");
      }
   };
   _loc2_.hit.onRelease = function()
   {
      if(saleListClickId != this._parent.id)
      {
         saleList.getLine(saleListClickId).effect_mc.gotoAndStop("out");
         saleListClickId = this._parent.id;
         this._parent.effect_mc.gotoAndStop("active");
         saleListCalc_btn.setEnabled(true);
      }
   };
};
myListener.OnGame_TradeHouse_UpdateSaleListItem = function(id, itemData, price, soldTime, type, calcMoney)
{
   var _loc2_ = saleList.getLine(id);
   container_mc.saleList_mc.defaultStr.text = "";
   saleListCalcAll_btn.setEnabled(true);
   _loc2_ = saleList.add(id,"calc_line");
   var _loc3_ = itemData.split("\t");
   if(_loc3_[_loc3_.length - 1] == "undefined" || _loc3_[_loc3_.length - 1] == "")
   {
      _loc3_.pop();
   }
   var grade = Number(_loc3_[6]);
   var _loc18_ = itemGradeStr[Number(_loc3_[6])];
   var sealType = _loc3_[7];
   var bMasterpiece = _loc3_[8];
   _loc2_.item_txt.verticalAlign = "center";
   _loc2_.name_txt.verticalAlign = "center";
   _loc2_.grade_txt.verticalAlign = "center";
   _loc2_.num_txt.verticalAlign = "center";
   _loc2_.price1_txt.verticalAlign = "center";
   _loc2_.price2_txt.verticalAlign = "center";
   _loc2_.date_txt.verticalAlign = "center";
   _loc2_.sellingType_txt.verticalAlign = "center";
   _loc2_.level_txt.verticalAlign = "center";
   _loc2_.Slot.id = id;
   lib.display.DrawBitmapData.draw(_loc2_.Slot.Icon,_loc3_[0],0,0,0,0,50,50,0.78);
   _loc2_.Slot.Icon.TEX = _loc3_[0];
   _loc2_.Slot.drag = false;
   lib.manager.ToolTip.add(_loc2_.Slot.SLOT,_loc2_.id + "\t3",6,_loc2_.Slot.Icon);
   var _loc17_ = Number(_loc3_[1]);
   var enchantNum = Number(_loc3_[2]);
   var _loc14_ = Number(_loc3_[4]);
   type = Number(type);
   if(type == 0)
   {
      _loc2_.sellingType_txt.text = SaleTypeStr0;
   }
   else if(type == 1)
   {
      _loc2_.sellingType_txt.text = SaleTypeStr1;
   }
   else if(type == 2)
   {
      _loc2_.sellingType_txt.text = SaleTypeStr2;
   }
   var _loc7_ = "";
   if(enchantNum > 0)
   {
      _loc7_ = "+" + enchantNum + " " + _loc3_[3];
   }
   else
   {
      _loc7_ = _loc3_[3];
   }
   _loc2_.num_txt.text = _loc14_;
   _loc2_.level_txt.text = _loc3_[5];
   lib.util.ExtString.textCut(_loc2_.item_txt,_loc7_,1);
   _loc2_.grade_txt.text = itemGradeStr[Number(_loc3_[6])];
   _loc2_.date_txt.text = soldTime;
   var _loc5_ = price.split("\t");
   var _loc12_ = "";
   var _loc11_ = "";
   var _loc13_ = "";
   var _loc10_ = "";
   var _loc4_ = "";
   if(type == 2)
   {
      _loc12_ = lib.util.GoldCurrency.SetTCatText(_loc5_[0],TCATTYPE);
      _loc13_ = eachPriceStr + lib.util.GoldCurrency.SetTCatText(_loc5_[1],TCATTYPE);
      _loc4_ = lib.util.GoldCurrency.SetTCatText(calcMoney,TCATTYPE);
   }
   else
   {
      _loc12_ = lib.util.GoldCurrency.SetGoldText(_loc5_[0],0,0,0,goldType);
      _loc13_ = eachPriceStr + lib.util.GoldCurrency.SetGoldText(_loc5_[1],0,0,0,goldType);
      _loc4_ = lib.util.GoldCurrency.SetGoldText(calcMoney,0,0,0,goldType);
   }
   _loc11_ = _loc12_;
   _loc10_ = _loc13_;
   _loc2_.price1_txt.textAutoSize = "shrink”";
   _loc2_.price1_txt.htmlText = _loc11_ + "\n" + "<font size=\'15\'>" + _loc10_ + "</font>";
   if(_loc2_.price1_txt.maxscroll > 1)
   {
      _loc2_.price1_txt.htmlText = "<font size=\'15\'>" + _loc11_ + "</font>" + "\n" + "<font size=\'12\'>" + _loc10_ + "</font>";
   }
   _loc2_.price2_txt.textAutoSize = "shrink”";
   _loc2_.price2_txt.htmlText = "<font size=\'15\'>" + _loc4_ + "</font>";
   if(_loc2_.price1_txt.maxscroll > 1)
   {
      _loc2_.price2_txt.htmlText = _loc4_;
   }
   _loc2_.Slot.onEnterFrame = function()
   {
      if(this.drag != undefined)
      {
         this.drag = false;
         this.sealType = sealType;
         this.masterpiece = bMasterpiece;
         this.grade = grade;
         var _loc2_ = this.enchantFd;
         var _loc3_ = 21433;
         if(enchantNum > 11 && enchantNum < 15)
         {
            _loc3_ = 8915599;
         }
         else if(enchantNum > 14)
         {
            _loc3_ = 10624002;
         }
         _loc2_.shadowColor = _loc3_;
         _loc2_.text = "+" + enchantNum;
         _loc2_._visible = enchantNum > 0;
         delete this.onEnterFrame;
      }
   };
   if(grade == 0)
   {
      _loc2_.item_txt.textColor = lib.info.TextColor.RAREGRADE0;
      _loc2_.level_txt.textColor = lib.info.TextColor.RAREGRADE0;
      _loc2_.num_txt.textColor = lib.info.TextColor.RAREGRADE0;
      _loc2_.grade_txt.textColor = lib.info.TextColor.RAREGRADE0;
   }
   else if(grade == 1)
   {
      _loc2_.item_txt.textColor = lib.info.TextColor.RAREGRADE1;
      _loc2_.level_txt.textColor = lib.info.TextColor.RAREGRADE1;
      _loc2_.num_txt.textColor = lib.info.TextColor.RAREGRADE1;
      _loc2_.grade_txt.textColor = lib.info.TextColor.RAREGRADE1;
   }
   else if(grade == 2)
   {
      _loc2_.item_txt.textColor = lib.info.TextColor.RAREGRADE2;
      _loc2_.level_txt.textColor = lib.info.TextColor.RAREGRADE2;
      _loc2_.num_txt.textColor = lib.info.TextColor.RAREGRADE2;
      _loc2_.grade_txt.textColor = lib.info.TextColor.RAREGRADE2;
   }
   else if(grade == 3)
   {
      _loc2_.item_txt.textColor = lib.info.TextColor.RAREGRADE3;
      _loc2_.level_txt.textColor = lib.info.TextColor.RAREGRADE3;
      _loc2_.num_txt.textColor = lib.info.TextColor.RAREGRADE3;
      _loc2_.grade_txt.textColor = lib.info.TextColor.RAREGRADE3;
   }
   if(soldType == 0)
   {
      _loc2_.soldType_txt.text = SaleTypeStr0;
   }
   else if(soldType == 1)
   {
      _loc2_.soldType_txt.text = SaleTypeStr1;
   }
   else if(soldType == 2)
   {
      _loc2_.soldType_txt.text = SaleTypeStr2;
   }
};
myListener.OnGame_TradeHouse_RemoveSaleListItem = function(id)
{
   if(id == saleListClickId)
   {
      saleListClickId = null;
   }
   saleList.remove(id);
   if(saleList.length <= 0)
   {
      saleListCalc_btn.setEnabled(false);
      saleListCalcAll_btn.setEnabled(false);
      container_mc.saleList_mc.defaultStr.htmlText = defaultStr3;
   }
};
myListener.OnGame_TradeHouse_ClearSaleList = function()
{
   saleList.clear();
   saleListClickId = null;
   saleListCalc_btn.setEnabled(false);
   saleListCalcAll_btn.setEnabled(false);
   container_mc.saleList_mc.defaultStr.htmlText = defaultStr3;
};
var buyList = new lib.util.List(container_mc.buyList_mc.list_mc,"calc_line",0);
buyList.bg = "bg_mc";
var buyListClickId = null;
myListener.OnGame_TradeHouse_AddBuyListItem = function(id, itemData, price, soldTime, buyType)
{
   container_mc.buyList_mc.defaultStr.text = "";
   buyListCalcAll_btn.setEnabled(true);
   var _loc2_ = buyList.add(id,"buy_line");
   var _loc3_ = itemData.split("\t");
   if(_loc3_[_loc3_.length - 1] == "undefined" || _loc3_[_loc3_.length - 1] == "")
   {
      _loc3_.pop();
   }
   buyType = Number(buyType);
   var grade = Number(_loc3_[6]);
   var _loc16_ = itemGradeStr[Number(_loc3_[6])];
   var sealType = _loc3_[7];
   var bMasterpiece = _loc3_[8];
   _loc2_.item_txt.verticalAlign = "center";
   _loc2_.name_txt.verticalAlign = "center";
   _loc2_.grade_txt.verticalAlign = "center";
   _loc2_.num_txt.verticalAlign = "center";
   _loc2_.price1_txt.verticalAlign = "center";
   _loc2_.date_txt.verticalAlign = "center";
   _loc2_.buyType_txt.verticalAlign = "center";
   _loc2_.level_txt.verticalAlign = "center";
   _loc2_.Slot.id = id;
   lib.display.DrawBitmapData.draw(_loc2_.Slot.Icon,_loc3_[0],0,0,0,0,50,50,0.78);
   _loc2_.Slot.Icon.TEX = _loc3_[0];
   lib.manager.ToolTip.add(_loc2_.Slot.SLOT,_loc2_.id + "\t4",6,_loc2_.Slot.Icon);
   var _loc14_ = Number(_loc3_[1]);
   var enchantNum = Number(_loc3_[2]);
   var _loc13_ = Number(_loc3_[4]);
   if(buyType == 0)
   {
      _loc2_.buyType_txt.text = BuyTypeStr0;
   }
   else if(buyType == 1)
   {
      _loc2_.buyType_txt.text = BuyTypeStr1;
   }
   else if(buyType == 2)
   {
      _loc2_.buyType_txt.text = BuyTypeStr2;
   }
   var _loc6_ = "";
   if(enchantNum > 0)
   {
      _loc6_ = "+" + enchantNum + " " + _loc3_[3];
   }
   else
   {
      _loc6_ = _loc3_[3];
   }
   _loc2_.num_txt.text = _loc13_;
   _loc2_.level_txt.text = _loc3_[5];
   lib.util.ExtString.textCut(_loc2_.item_txt,_loc6_,1);
   _loc2_.grade_txt.text = itemGradeStr[Number(_loc3_[6])];
   _loc2_.date_txt.text = soldTime;
   var _loc4_ = price.split("\t");
   var _loc9_ = "";
   var _loc12_ = "";
   var _loc8_ = "";
   var _loc11_ = "";
   if(buyType == 2)
   {
      _loc9_ = lib.util.GoldCurrency.SetTCatText(_loc4_[0],TCATTYPE);
      _loc8_ = eachPriceStr + lib.util.GoldCurrency.SetTCatText(_loc4_[1],TCATTYPE);
   }
   else
   {
      _loc9_ = lib.util.GoldCurrency.SetGoldText(_loc4_[0],0,0,0,goldType);
      _loc8_ = eachPriceStr + lib.util.GoldCurrency.SetGoldText(_loc4_[1],0,0,0,goldType);
   }
   _loc12_ = _loc9_;
   _loc11_ = _loc8_;
   _loc2_.price1_txt.textAutoSize = "shrink”";
   _loc2_.price1_txt.htmlText = _loc12_ + "\n" + "<font size=\'15\'>" + _loc11_ + "</font>";
   if(_loc2_.price1_txt.maxscroll > 1)
   {
      _loc2_.price1_txt.htmlText = "<font size=\'15\'>" + _loc12_ + "</font>" + "\n" + "<font size=\'12\'>" + _loc11_ + "</font>";
   }
   _loc2_.Slot.onEnterFrame = function()
   {
      if(this.drag != undefined)
      {
         this.drag = false;
         this.sealType = sealType;
         this.masterpiece = bMasterpiece;
         this.grade = grade;
         var _loc2_ = this.enchantFd;
         var _loc3_ = 21433;
         if(enchantNum > 11 && enchantNum < 15)
         {
            _loc3_ = 8915599;
         }
         else if(enchantNum > 14)
         {
            _loc3_ = 10624002;
         }
         _loc2_.shadowColor = _loc3_;
         _loc2_.text = "+" + enchantNum;
         _loc2_._visible = enchantNum > 0;
         delete this.onEnterFrame;
      }
   };
   if(grade == 0)
   {
      _loc2_.item_txt.textColor = lib.info.TextColor.RAREGRADE0;
      _loc2_.level_txt.textColor = lib.info.TextColor.RAREGRADE0;
      _loc2_.num_txt.textColor = lib.info.TextColor.RAREGRADE0;
      _loc2_.grade_txt.textColor = lib.info.TextColor.RAREGRADE0;
   }
   else if(grade == 1)
   {
      _loc2_.item_txt.textColor = lib.info.TextColor.RAREGRADE1;
      _loc2_.level_txt.textColor = lib.info.TextColor.RAREGRADE1;
      _loc2_.num_txt.textColor = lib.info.TextColor.RAREGRADE1;
      _loc2_.grade_txt.textColor = lib.info.TextColor.RAREGRADE1;
   }
   else if(grade == 2)
   {
      _loc2_.item_txt.textColor = lib.info.TextColor.RAREGRADE2;
      _loc2_.level_txt.textColor = lib.info.TextColor.RAREGRADE2;
      _loc2_.num_txt.textColor = lib.info.TextColor.RAREGRADE2;
      _loc2_.grade_txt.textColor = lib.info.TextColor.RAREGRADE2;
   }
   else if(grade == 3)
   {
      _loc2_.item_txt.textColor = lib.info.TextColor.RAREGRADE3;
      _loc2_.level_txt.textColor = lib.info.TextColor.RAREGRADE3;
      _loc2_.num_txt.textColor = lib.info.TextColor.RAREGRADE3;
      _loc2_.grade_txt.textColor = lib.info.TextColor.RAREGRADE3;
   }
   _loc2_.hit.onRollOver = function()
   {
      if(buyListClickId != this._parent.id)
      {
         this._parent.effect_mc.gotoAndStop("over");
      }
   };
   _loc2_.hit.onRollOut = _loc2_.hit.onReleaseOutside = function()
   {
      if(buyListClickId != this._parent.id)
      {
         this._parent.effect_mc.gotoAndStop("out");
      }
   };
   _loc2_.hit.onPress = function()
   {
      if(buyListClickId != this._parent.id)
      {
         this._parent.effect_mc.gotoAndStop("press");
      }
   };
   _loc2_.hit.onRelease = function()
   {
      if(buyListClickId != this._parent.id)
      {
         buyList.getLine(buyListClickId).effect_mc.gotoAndStop("out");
         buyListClickId = this._parent.id;
         this._parent.effect_mc.gotoAndStop("active");
         buyListCalc_btn.setEnabled(true);
      }
   };
};
myListener.OnGame_TradeHouse_UpdateBuyListItem = function(id, itemData, price, realPrice, soldTime, type, calcMoney)
{
   var _loc2_ = buyList.getLine(id);
   var _loc3_ = itemData.split("\t");
   if(_loc3_[_loc3_.length - 1] == "undefined" || _loc3_[_loc3_.length - 1] == "")
   {
      _loc3_.pop();
   }
   buyType = Number(buyType);
   var grade = Number(_loc3_[6]);
   var _loc15_ = itemGradeStr[Number(_loc3_[6])];
   var sealType = _loc3_[7];
   var bMasterpiece = _loc3_[8];
   _loc2_.item_txt.verticalAlign = "center";
   _loc2_.name_txt.verticalAlign = "center";
   _loc2_.grade_txt.verticalAlign = "center";
   _loc2_.num_txt.verticalAlign = "center";
   _loc2_.price1_txt.verticalAlign = "center";
   _loc2_.date_txt.verticalAlign = "center";
   _loc2_.buyType_txt.verticalAlign = "center";
   _loc2_.level_txt.verticalAlign = "center";
   _loc2_.Slot.id = id;
   lib.display.DrawBitmapData.draw(_loc2_.Slot.Icon,_loc3_[0],0,0,0,0,50,50,0.78);
   _loc2_.Slot.Icon.TEX = _loc3_[0];
   lib.manager.ToolTip.add(_loc2_.Slot.SLOT,_loc2_.id + "\t4",6,_loc2_.Slot.Icon);
   var _loc13_ = Number(_loc3_[1]);
   var enchantNum = Number(_loc3_[2]);
   var _loc12_ = Number(_loc3_[4]);
   if(buyType == 0)
   {
      _loc2_.buyType_txt.text = BuyTypeStr0;
   }
   else if(buyType == 1)
   {
      _loc2_.buyType_txt.text = BuyTypeStr1;
   }
   else if(buyType == 2)
   {
      _loc2_.buyType_txt.text = BuyTypeStr2;
   }
   var _loc5_ = "";
   if(enchantNum > 0)
   {
      _loc5_ = "+" + enchantNum + " " + _loc3_[3];
   }
   else
   {
      _loc5_ = _loc3_[3];
   }
   _loc2_.num_txt.text = _loc12_;
   _loc2_.level_txt.text = _loc3_[5];
   lib.util.ExtString.textCut(_loc2_.item_txt,_loc5_,1);
   _loc2_.grade_txt.text = itemGradeStr[Number(_loc3_[6])];
   _loc2_.date_txt.text = soldTime;
   var _loc4_ = price.split("\t");
   var _loc7_ = "";
   var _loc10_ = "";
   var _loc11_ = "";
   var _loc9_ = "";
   if(buyType == 2)
   {
      _loc7_ = lib.util.GoldCurrency.SetTCatText(_loc4_[0],TCATTYPE);
      _loc11_ = eachPriceStr + lib.util.GoldCurrency.SetTCatText(_loc4_[1],TCATTYPE);
   }
   else
   {
      _loc7_ = lib.util.GoldCurrency.SetGoldText(_loc4_[0],0,0,0,goldType);
      _loc11_ = eachPriceStr + lib.util.GoldCurrency.SetGoldText(_loc4_[1],0,0,0,goldType);
   }
   _loc10_ = _loc7_;
   _loc9_ = _loc11_;
   _loc2_.price1_txt.textAutoSize = "shrink”";
   _loc2_.price1_txt.htmlText = _loc10_ + "\n" + "<font size=\'15\'>" + _loc9_ + "</font>";
   if(_loc2_.price1_txt.maxscroll > 1)
   {
      _loc2_.price1_txt.htmlText = "<font size=\'15\'>" + _loc10_ + "</font>" + "\n" + "<font size=\'12\'>" + _loc9_ + "</font>";
   }
   _loc2_.Slot.onEnterFrame = function()
   {
      if(this.drag != undefined)
      {
         this.drag = false;
         this.sealType = sealType;
         this.masterpiece = bMasterpiece;
         this.grade = grade;
         var _loc2_ = this.enchantFd;
         var _loc3_ = 21433;
         if(enchantNum > 11 && enchantNum < 15)
         {
            _loc3_ = 8915599;
         }
         else if(enchantNum > 14)
         {
            _loc3_ = 10624002;
         }
         _loc2_.shadowColor = _loc3_;
         _loc2_.text = "+" + enchantNum;
         _loc2_._visible = enchantNum > 0;
         delete this.onEnterFrame;
      }
   };
   if(grade == 0)
   {
      _loc2_.item_txt.textColor = lib.info.TextColor.RAREGRADE0;
      _loc2_.level_txt.textColor = lib.info.TextColor.RAREGRADE0;
      _loc2_.num_txt.textColor = lib.info.TextColor.RAREGRADE0;
      _loc2_.grade_txt.textColor = lib.info.TextColor.RAREGRADE0;
   }
   else if(grade == 1)
   {
      _loc2_.item_txt.textColor = lib.info.TextColor.RAREGRADE1;
      _loc2_.level_txt.textColor = lib.info.TextColor.RAREGRADE1;
      _loc2_.num_txt.textColor = lib.info.TextColor.RAREGRADE1;
      _loc2_.grade_txt.textColor = lib.info.TextColor.RAREGRADE1;
   }
   else if(grade == 2)
   {
      _loc2_.item_txt.textColor = lib.info.TextColor.RAREGRADE2;
      _loc2_.level_txt.textColor = lib.info.TextColor.RAREGRADE2;
      _loc2_.num_txt.textColor = lib.info.TextColor.RAREGRADE2;
      _loc2_.grade_txt.textColor = lib.info.TextColor.RAREGRADE2;
   }
   else if(grade == 3)
   {
      _loc2_.item_txt.textColor = lib.info.TextColor.RAREGRADE3;
      _loc2_.level_txt.textColor = lib.info.TextColor.RAREGRADE3;
      _loc2_.num_txt.textColor = lib.info.TextColor.RAREGRADE3;
      _loc2_.grade_txt.textColor = lib.info.TextColor.RAREGRADE3;
   }
};
myListener.OnGame_TradeHouse_RemoveBuyListItem = function(id)
{
   if(id == buyListClickId)
   {
      buyListClickId = null;
   }
   buyList.remove(id);
   if(buyList.length <= 0)
   {
      buyListCalc_btn.setEnabled(false);
      buyListCalcAll_btn.setEnabled(false);
      container_mc.buyList_mc.defaultStr.htmlText = defaultStr4;
   }
};
myListener.OnGame_TradeHouse_ClearBuyList = function()
{
   buyList.clear();
   buyListClickId = null;
   buyListCalc_btn.setEnabled(false);
   buyListCalcAll_btn.setEnabled(false);
   container_mc.buyList_mc.defaultStr.htmlText = defaultStr4;
};
myListener.OnGame_TradeHouse_SetDeal = function(flag)
{
   container_mc.itemList_mc.checkBox.checked = Boolean(Number(flag));
};
var sortW = 0;
var i = 0;
while(i < container_mc.wait_mc.sortBtn._colums.length)
{
   container_mc.wait_mc["sortArowMc" + i]._x = container_mc.wait_mc.sortBtn._x + sortW - container_mc.wait_mc.sortBtn._space;
   container_mc.wait_mc["sortArowMc" + i]._y = container_mc.wait_mc.sortBtn._y + container_mc.wait_mc.sortBtn._height - container_mc.wait_mc["sortArowMc" + i]._height / 2;
   container_mc.wait_mc["sortArowMc" + i].barMc._width = container_mc.wait_mc.sortBtn._colums[i];
   container_mc.wait_mc["sortArowMc" + i].arrowMc._x = container_mc.wait_mc.sortBtn._colums[i] / 2;
   sortW = sortW + (container_mc.wait_mc.sortBtn._colums[i] + container_mc.wait_mc.sortBtn._space);
   i++;
}
container_mc.wait_mc.sortBtn.onSelected = function(index)
{
   if(index < 2)
   {
      return undefined;
   }
   selectedSortBtnOfWaitList(index,true);
};
sortW = 0;
var i = 0;
while(i < container_mc.sold_mc.sortBtn._colums.length)
{
   container_mc.sold_mc["sortArowMc" + i]._x = container_mc.sold_mc.sortBtn._x + sortW - container_mc.sold_mc.sortBtn._space;
   container_mc.sold_mc["sortArowMc" + i]._y = container_mc.sold_mc.sortBtn._y + container_mc.sold_mc.sortBtn._height - container_mc.sold_mc["sortArowMc" + i]._height / 2;
   container_mc.sold_mc["sortArowMc" + i].barMc._width = container_mc.sold_mc.sortBtn._colums[i];
   container_mc.sold_mc["sortArowMc" + i].arrowMc._x = container_mc.sold_mc.sortBtn._colums[i] / 2;
   sortW = sortW + (container_mc.sold_mc.sortBtn._colums[i] + container_mc.sold_mc.sortBtn._space);
   i++;
}
container_mc.sold_mc.uperBtn._visible = false;
container_mc.sold_mc.sortBtn.onSelected = function(index)
{
   if(index < 2)
   {
      return undefined;
   }
   container_mc.sold_mc.combobox.cation = "$321137";
   container_mc.sold_mc.lowerBtn._visible = true;
   container_mc.sold_mc.uperBtn._visible = false;
   container_mc.sold_mc.lowerBtn.gotoAndStop(4);
   container_mc.sold_mc.lowerBtn.enabled = false;
   container_mc.sold_mc["sortArowMc" + soldSlotObj.rindex]._visible = false;
   container_mc.sold_mc["sortArowMc" + index]._visible = true;
   var _loc3_ = index;
   soldSlotObj.pressCount = !(soldSlotObj.pressCount == undefined || soldSlotObj.index != _loc3_)?soldSlotObj.pressCount + 1:0;
   soldSlotObj.index = _loc3_;
   soldSlotObj.rindex = index;
   if(_loc3_ == 4)
   {
      if(soldSlotObj.pressCount % 4 < 2)
      {
         this["sortBtn" + index].labelFd.text = "$321069";
         ToGame_TradeHouse_SortSoldList(7,soldSlotObj.pressCount % 2 + 1);
         soldSlotObj.priceIns = 0;
      }
      else
      {
         this["sortBtn" + index].labelFd.text = "$321107";
         ToGame_TradeHouse_SortSoldList(8,soldSlotObj.pressCount % 2 + 1);
         soldSlotObj.priceIns = 1;
      }
      var _loc4_ = soldSlotObj.pressCount % 2 + 1;
      if(_loc4_ == 2)
      {
         container_mc.sold_mc["sortArowMc" + index]._yscale = -100;
      }
      else
      {
         container_mc.sold_mc["sortArowMc" + index]._yscale = 100;
      }
   }
   else if(_loc3_ == 2)
   {
      _loc4_ = soldSlotObj.pressCount % 2 + 1;
      if(_loc4_ == 2)
      {
         container_mc.sold_mc["sortArowMc" + index]._yscale = -100;
      }
      else
      {
         container_mc.sold_mc["sortArowMc" + index]._yscale = 100;
      }
      ToGame_TradeHouse_SortSoldList(5,soldSlotObj.pressCount % 2 + 1);
   }
   else if(_loc3_ == 3)
   {
      _loc4_ = soldSlotObj.pressCount % 2 + 1;
      if(_loc4_ == 2)
      {
         container_mc.sold_mc["sortArowMc" + index]._yscale = -100;
      }
      else
      {
         container_mc.sold_mc["sortArowMc" + index]._yscale = 100;
      }
      ToGame_TradeHouse_SortSoldList(11,soldSlotObj.pressCount % 2 + 1);
   }
   else if(_loc3_ == 5)
   {
      _loc4_ = soldSlotObj.pressCount % 2 + 1;
      if(_loc4_ == 2)
      {
         container_mc.sold_mc["sortArowMc" + index]._yscale = -100;
      }
      else
      {
         container_mc.sold_mc["sortArowMc" + index]._yscale = 100;
      }
      ToGame_TradeHouse_SortSoldList(12,soldSlotObj.pressCount % 2 + 1);
   }
};
var minLevel_txt = new lib.util.ExtTextField(container_mc.itemList_mc.minLevel_txt,1,container_mc.itemList_mc.minLevel_focus);
var maxLevel_txt = new lib.util.ExtTextField(container_mc.itemList_mc.maxLevel_txt,1,container_mc.itemList_mc.maxLevel_focus);
var searchInput_txt = new lib.util.ExtTextField(container_mc.itemList_mc.searchInput_txt,0,container_mc.itemList_mc.searchInput_focus);
searchInput_txt.onChanged = function()
{
   var _loc1_ = 0;
   if(NameTextLength_Local > 0)
   {
      _loc1_ = NameTextLength_Local;
   }
   else
   {
      _loc1_ = 80;
   }
   lib.util.StrByteLen.getLenth3(container_mc.itemList_mc.searchInput_txt,_loc1_);
};
minLevel_txt.onEnterKey = function()
{
   Selection.setFocus(maxLevel_txt.textField);
};
maxLevel_txt.onEnterKey = function()
{
   Selection.setFocus(searchInput_txt.textField);
};
var bSearch = false;
searchInput_txt.onEnterKey = function()
{
   bSearch = true;
   ToGame_TradeHouse_SearchItem();
};
var detailMintxt0 = new lib.util.ExtTextField(container_mc.itemList_mc.detailOptionMc.mintxt0,1,container_mc.itemList_mc.detailOptionMc.minfocus0);
var detailMintxt1 = new lib.util.ExtTextField(container_mc.itemList_mc.detailOptionMc.mintxt1,1,container_mc.itemList_mc.detailOptionMc.minfocus1);
var detailMintxt2 = new lib.util.ExtTextField(container_mc.itemList_mc.detailOptionMc.mintxt2,1,container_mc.itemList_mc.detailOptionMc.minfocus2);
var detailMintxt3 = container_mc.itemList_mc.detailOptionMc.mintxt3;
var detailMintxt4 = m_TcatMc.minInput;
detailMintxt4.inputFd.type = "input";
var detailMaxtxt0 = new lib.util.ExtTextField(container_mc.itemList_mc.detailOptionMc.maxtxt0,1,container_mc.itemList_mc.detailOptionMc.maxfocus0);
var detailMaxtxt1 = new lib.util.ExtTextField(container_mc.itemList_mc.detailOptionMc.maxtxt1,1,container_mc.itemList_mc.detailOptionMc.maxfocus1);
var detailMaxtxt2 = new lib.util.ExtTextField(container_mc.itemList_mc.detailOptionMc.maxtxt2,1,container_mc.itemList_mc.detailOptionMc.maxfocus2);
var detailMaxtxt3 = container_mc.itemList_mc.detailOptionMc.maxtxt3;
var detailMaxtxt4 = m_TcatMc.maxInput;
detailMaxtxt4.inputFd.type = "input";
detailMintxt0.onEnterKey = function()
{
   Selection.setFocus(detailMaxtxt0.textField);
};
detailMintxt1.onEnterKey = function()
{
   Selection.setFocus(detailMaxtxt1.textField);
};
detailMintxt2.onEnterKey = function()
{
   Selection.setFocus(detailMaxtxt2.textField);
};
detailMaxtxt0.onEnterKey = function()
{
   Selection.setFocus(detailMintxt1.textField);
};
detailMaxtxt1.onEnterKey = function()
{
   Selection.setFocus(detailMintxt2.textField);
};
detailMaxtxt2.onEnterKey = function()
{
   Selection.setFocus(detailMintxt3._txt0_txt.textField);
};
detailMintxt3._txt2_txt.onEnterKey = function()
{
   Selection.setFocus(detailMaxtxt3._txt0_txt.textField);
};
detailMaxtxt3._txt2_txt.onEnterKey = function()
{
   Selection.setFocus(detailMintxt4.ext_textField.textField);
};
detailMintxt4.ext_textField.onEnterKey = function()
{
   Selection.setFocus(detailMaxtxt4.ext_textField.textField);
};
detailMaxtxt4.ext_textField.onEnterKey = function()
{
   Selection.setFocus(detailMintxt0.textField);
};
detailMintxt0.onKillFocusEvent = function()
{
   var _loc2_ = this.text;
   if(_loc2_ < this.min)
   {
      this.setChanged(false);
      this.caption = this.min;
   }
   detailMaxtxt0.min = _loc2_;
};
detailMaxtxt0.onKillFocusEvent = function()
{
   var _loc2_ = this.text;
   if(_loc2_ < this.min)
   {
      this.setChanged(false);
      this.caption = this.max;
   }
   detailMintxt0.max = _loc2_;
};
detailMintxt1.onKillFocusEvent = function()
{
   var _loc2_ = this.text;
   if(_loc2_ < this.min)
   {
      this.setChanged(false);
      this.caption = this.min;
   }
   detailMaxtxt1.min = _loc2_;
};
detailMaxtxt1.onKillFocusEvent = function()
{
   var _loc2_ = this.text;
   if(_loc2_ < this.min)
   {
      this.setChanged(false);
      this.caption = this.max;
   }
   detailMintxt1.max = _loc2_;
};
detailMintxt2.onKillFocusEvent = function()
{
   var _loc2_ = this.text;
   if(_loc2_ < this.min)
   {
      this.setChanged(false);
      this.caption = this.min;
   }
   detailMaxtxt2.min = _loc2_;
};
detailMaxtxt2.onKillFocusEvent = function()
{
   var _loc2_ = this.text;
   if(_loc2_ < this.min)
   {
      this.setChanged(false);
      this.caption = this.max;
   }
   detailMintxt2.max = _loc2_;
};
detailMintxt3._func = function()
{
   var _loc1_ = String(detailMintxt3.total_nums);
   detailMaxtxt3.min = _loc1_;
};
detailMaxtxt3._func = function()
{
   var _loc1_ = String(detailMaxtxt3.total_nums);
   detailMintxt3.max = _loc1_;
};
detailMintxt4.onChanged = function()
{
   var _loc1_ = String(detailMintxt4.text);
   detailMaxtxt4.min = _loc1_;
   if(_loc1_ == detailMaxtxt4.text)
   {
      detailMaxtxt4.min_mc.enabled = false;
      detailMaxtxt4.min_mc.gotoAndStop(4);
   }
   else
   {
      detailMaxtxt4.min_mc.enabled = true;
      detailMaxtxt4.min_mc.gotoAndStop(1);
   }
};
detailMaxtxt4.onChanged = function()
{
   var _loc1_ = String(detailMaxtxt4.text);
   detailMintxt4.max = _loc1_;
   if(_loc1_ == detailMintxt4.text)
   {
      detailMintxt4.max_mc.enabled = false;
      detailMintxt4.max_mc.gotoAndStop(4);
   }
   else
   {
      detailMintxt4.max_mc.enabled = true;
      detailMintxt4.max_mc.gotoAndStop(1);
   }
};
var focusGroup = [minLevel_txt,maxLevel_txt,searchInput_txt,detailMintxt0,detailMaxtxt0,detailMintxt1,detailMaxtxt1,detailMintxt2,detailMaxtxt2,detailMintxt3._txt0_txt,detailMintxt3._txt1_txt,detailMintxt3._txt2_txt,detailMaxtxt3._txt0_txt,detailMaxtxt3._txt1_txt,detailMaxtxt3._txt2_txt,detailMintxt4.ext_textField.textField,detailMaxtxt4.ext_textField.textField];
var focusGroup_reformItemFarming = [minLevel_txt,maxLevel_txt,searchInput_txt,detailMintxt1,detailMaxtxt1,detailMintxt2,detailMaxtxt2,detailMintxt3._txt0_txt,detailMintxt3._txt1_txt,detailMintxt3._txt2_txt,detailMaxtxt3._txt0_txt,detailMaxtxt3._txt1_txt,detailMaxtxt3._txt2_txt,detailMintxt4.ext_textField.textField,detailMaxtxt4.ext_textField.textField];
var focusGroup_array = !reformItemFarming?focusGroup:focusGroup_reformItemFarming;
lib.manager.Focus.addFocusGroup(UIname,1,focusGroup);
searchInput_txt.caption = lib.util.UIString.getUIString("$321046");
var x_btn = new lib.util.TxtBtn(container_mc.x_mc);
x_btn.setRelease(function()
{
   ToGame_TradeHouse_CloseUI();
}
);
var tab = container_mc.tabBtn.tab;
tab.setRelease(release);
var regCancel_btn = container_mc.reg_mc.cancelBtn.txtBtn;
regCancel_btn.setEnabled(false);
regCancel_btn.setRelease(function()
{
   ToGame_TradeHouse_CancelReg(regClickId);
}
);
var refresh_btn = container_mc.itemListBtn.txtBtn;
var search_btn = new lib.util.TxtBtn(container_mc.itemList_mc.searchBtn);
var init_btn = new lib.util.TxtBtn(container_mc.itemList_mc.initBtn);
refresh_btn.setRelease(ToGame_TradeHouse_RefreshList);
search_btn.setRelease(ToGame_TradeHouse_SearchItem);
init_btn.setRelease(ToGame_TradeHouse_InitSearchCondition);
lib.manager.ToolTip.add(container_mc.itemList_mc.searchBtn,"$321139",1);
lib.manager.ToolTip.add(container_mc.itemList_mc.initBtn,"$321140",1);
var saleListCalc_btn = container_mc.saleList_mc.calculateBtn.txtBtn;
saleListCalc_btn.setRelease(ToGame_TradeHouse_CalculateSaleList);
saleListCalc_btn.setEnabled(false);
var saleListCalcAll_btn = container_mc.saleList_mc.calculateAllBtn.txtBtn;
saleListCalcAll_btn.setRelease(ToGame_TradeHouse_CalculateAllSaleList);
saleListCalcAll_btn.setEnabled(false);
var buyListCalc_btn = container_mc.buyList_mc.calculateBtn.txtBtn;
buyListCalc_btn.setRelease(ToGame_TradeHouse_CalculateBuyList);
buyListCalc_btn.setEnabled(false);
var buyListCalcAll_btn = container_mc.buyList_mc.calculateAllBtn.txtBtn;
buyListCalcAll_btn.setRelease(ToGame_TradeHouse_CalculateAllBuyList);
buyListCalcAll_btn.setEnabled(false);
container_mc.itemList_mc.checkBox.checked = false;
container_mc.itemList_mc.checkBox.onChanged = function(checked)
{
   ToGame_TradeHouse_CheckedTradeAble(Number(checked));
};
container_mc.itemList_mc.checkBox.setText(container_mc.itemList_mc.fd0);
tab.setTab(0,1);
myListener.OnGame_TradeHouse_SetSearchItemInfo("$321044","$321045","$321046",0,0);
nextTip();
container_mc.sold_mc.combobox.cation = "$321137";
container_mc.sold_mc.lowerBtn._visible = true;
container_mc.sold_mc.lowerBtn.gotoAndStop(4);
container_mc.sold_mc.lowerBtn.enabled = false;
soldSlotObj.rindex = 5;
container_mc.sold_mc.sortArowMc5.onLoad = function()
{
   this._visible = true;
   this._yscale = -100;
};
container_mc.x_mc.onEnterFrame = function()
{
   if(searchInput_txt.textField != undefined)
   {
      Selection.setFocus(searchInput_txt.textField);
      delete this.onEnterFrame;
   }
};
myListener.OnGame_SenatorTaxSet_LengthLocal = function(lengthnum)
{
   NameTextLength_Local = lengthnum;
};
fscommand("ToGame_TradeHouse_Init");
