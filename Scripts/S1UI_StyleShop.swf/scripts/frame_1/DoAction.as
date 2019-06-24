function setComboBox()
{
   if(TCATDISABLE)
   {
      comboMc.data = ["$500117","$500118","$500119","$500120","$500121","$500122"];
   }
   else
   {
      comboMc.data = ["$500117","$500120","$500121","$500122"];
   }
   comboMc.addListener(comboMc);
}
function findCategoryTab(id)
{
   var _loc2_ = undefined;
   var _loc1_ = undefined;
   var _loc3_ = cateLen;
   _loc1_ = 0;
   while(_loc1_ < _loc3_)
   {
      _loc2_ = categoryButtonArray[_loc1_];
      if(_loc2_.idx == id)
      {
         return _loc2_;
      }
      _loc1_ = _loc1_ + 1;
   }
   return null;
}
function rearrangeCategoryTab()
{
   var _loc3_ = 0;
   var _loc2_ = undefined;
   var _loc1_ = undefined;
   var _loc4_ = cateLen;
   _loc1_ = 0;
   while(_loc1_ < _loc4_)
   {
      _loc2_ = categoryButtonArray[_loc1_];
      if(_loc2_._visible)
      {
         _loc3_;
         _loc2_._y = categoryButtonPositionArray[_loc3_++];
      }
      _loc1_ = _loc1_ + 1;
   }
}
function selectFirstCategoryTab()
{
   var _loc2_ = undefined;
   var _loc1_ = undefined;
   var _loc3_ = cateLen;
   _loc1_ = 0;
   while(_loc1_ < _loc3_)
   {
      _loc2_ = categoryButtonArray[_loc1_];
      if(_loc2_._visible)
      {
         _loc2_.onRelease();
         return undefined;
      }
      _loc1_ = _loc1_ + 1;
   }
}
function setPostion()
{
   var _loc2_ = rightMc.productBox;
   var _loc3_ = 0;
   if(_loc2_.benefitMc)
   {
      _loc3_ = 98;
   }
   var _loc1_ = 0;
   while(_loc1_ < productLen)
   {
      _loc2_["slotMc" + _loc1_]._y = _loc3_ + _loc1_ * 98;
      _loc1_ = _loc1_ + 1;
   }
   scrollBar1.pageSize = _loc2_._height;
   scrollBar1.scroll = 0;
}
function convertColorValue(value)
{
   if(value == null || value.length == 0)
   {
      return 0;
   }
   var _loc1_ = value.split(",");
   if(_loc1_.length != 3)
   {
      return 0;
   }
   return Number(_loc1_[0]) << 16 | Number(_loc1_[1]) << 8 | Number(_loc1_[2]);
}
function toggleSelectColor(mc, bSendToClient)
{
   if(mc == selectedColorMC)
   {
      mc = null;
   }
   if(selectedColorMC != null)
   {
      gotoFrameBySelectedState(selectedColorMC,false);
      ToGame_StyleShop_ColorClick(selectedColorMC.id,false);
      selectedColorMC = null;
   }
   if(mc != null)
   {
      selectedColorMC = mc;
      gotoFrameBySelectedState(selectedColorMC,true);
      ToGame_StyleShop_ColorClick(selectedColorMC.id,true);
   }
}
function setSelectColor(mc, selected)
{
   if(selected)
   {
      if(selectedColorMC != null)
      {
         gotoFrameBySelectedState(selectedColorMC,false);
      }
      selectedColorMC = mc;
      gotoFrameBySelectedState(mc,true);
   }
   else
   {
      if(mc == selectedColorMC)
      {
         selectedColorMC = null;
      }
      gotoFrameBySelectedState(mc,false);
   }
}
function gotoFrameBySelectedState(mc, selected)
{
   if(selected)
   {
      mc.bgMc.gotoAndStop(3);
   }
   else
   {
      mc.bgMc.gotoAndStop(1);
   }
}
function updateUIPosition()
{
   if(rightMc.benefitMc._visible)
   {
      if(rightMc.mc_info._visible)
      {
         rightMc.benefitMc._y = rightMc.mc_info._y - rightMc.benefitMc._height - 10;
      }
      else
      {
         rightMc.benefitMc._y = regY_benefitMc;
      }
   }
}
function ToGame_StyleShop_Init()
{
   fscommand("ToGame_StyleShop_Init");
}
function ToGame_StyleShop_Close()
{
   fscommand("ToGame_StyleShop_Close");
}
function ToGame_StyleShop_Coupon()
{
   fscommand("ToGame_StyleShop_Coupon");
}
function ToGame_StyleShop_ScreenShot()
{
   fscommand("ToGame_StyleShop_ScreenShot");
}
function ToGame_StyleShop_SlotAllClear()
{
   fscommand("ToGame_StyleShop_SlotAllClear");
}
function ToGame_StyleShop_GotoShopBtn()
{
   fscommand("ToGame_StyleShop_GotoShopBtn");
}
function ToGame_StyleShop_CateGoryClick(idx)
{
   getURL("FSCommand:ToGame_StyleShop_CateGoryClick",idx);
}
function ToGame_StyleShop_ItemClick(id, type)
{
   getURL("FSCommand:ToGame_StyleShop_ItemClick",id + "\t" + type);
}
function ToGame_StyleShop_ProductClick(id)
{
   getURL("FSCommand:ToGame_StyleShop_ProductClick",id);
}
function ToGame_StyleShop_SocialClick(id)
{
   getURL("FSCommand:ToGame_StyleShop_SocialClick",id);
}
function ToGame_StyleShop_SlotClick(id, index)
{
   getURL("FSCommand:ToGame_StyleShop_SlotClick",id + "\t" + index);
}
function ToGame_StyleShop_FilterCheck(type)
{
   getURL("FSCommand:ToGame_StyleShop_FilterCheck",type);
}
function ToGame_StyleShop_Benefit()
{
   fscommand("ToGame_StyleShop_Benefit");
}
function ToGame_StyleShop_SetFilter(index)
{
   getURL("FSCommand:ToGame_StyleShop_SetFilter",index);
}
function ToGame_StyleShop_Search()
{
   var _loc1_ = leftMc.mc_search_area.inputTxt.text;
   getURL("FSCommand:ToGame_StyleShop_Search",_loc1_);
}
function ToGame_StyleShop_ColorClick(id, checked)
{
   getURL("FSCommand:ToGame_StyleShop_ColorClick",id + "\t" + (!checked?0:1));
}
function socialBtn(btnMc, disable)
{
   if(!disable)
   {
      btnMc.gotoAndStop(4);
      btnMc.onRollOver = btnMc.onRollOut = btnMc.onRelease = btnMc.onReleaseOutside = function()
      {
      };
      return undefined;
   }
   btnMc.gotoAndStop(1);
   btnMc.onRollOver = function()
   {
      this.gotoAndStop(2);
   };
   btnMc.onRollOut = btnMc.onReleaseOutside = function()
   {
      this.gotoAndStop(1);
   };
   btnMc.onPress = function()
   {
      this.gotoAndStop(3);
   };
   btnMc.onRelease = function()
   {
      this.gotoAndStop(1);
      socialMotion(this.moveNum);
   };
}
function socialMotion(num)
{
   socialBoxCount = socialBoxCount + num * 5;
   if(socialBoxCount <= 0)
   {
      socialBoxCount = 0;
      socialBtn(btmMc.preBtn,false);
      socialBtn(btmMc.nextBtn,true);
   }
   else if(socialBoxCount >= socialBoxMax)
   {
      socialBoxCount = socialBoxMax;
      socialBtn(btmMc.preBtn,true);
      socialBtn(btmMc.nextBtn,false);
   }
   else
   {
      socialBtn(btmMc.preBtn,true);
      socialBtn(btmMc.nextBtn,true);
   }
   var _loc1_ = socialBoxCount * -56 - 140;
   gs.TweenLite.killTweensOf(btmMc.socialBox);
   gs.TweenLite.to(btmMc.socialBox,0.3,{_x:_loc1_,ease:gs.easing.Strong.easeOut});
}
function listClear(pMc)
{
   for(var _loc2_ in pMc)
   {
      if(typeof pMc[_loc2_] == "movieclip")
      {
         pMc[_loc2_].removeMovieClip();
      }
   }
}
function hideEvent(bHide)
{
   _root.container_logout_mc._visible = !bHide;
   _root.container_mainmenu_mc._visible = !bHide;
   _root.container_question_mc._visible = !bHide;
   _root.container_villager_mc._visible = !bHide;
   _root.container_battleUp_mc._visible = !bHide;
   _root.container_normal_mc._visible = !bHide;
   _root.container_battle_mc._visible = !bHide;
   _root.container_overlayMap_mc._visible = !bHide;
   _root.container_chat_mc._visible = !bHide;
   _root.container_inGameMovie_mc._visible = !bHide;
}
function drawWithScaling(mc, bitmapID, width, height)
{
   if(mc == null || bitmapID == null || bitmapID.length == 0 || isNaN(width) || width <= 0 || isNaN(height) || height <= 0)
   {
      return undefined;
   }
   var _loc2_ = flash.display.BitmapData.loadBitmap(bitmapID);
   var _loc5_ = new flash.geom.Matrix();
   _loc5_.createBox(width / _loc2_.width,height / _loc2_.height);
   mc.beginBitmapFill(_loc2_,_loc5_,false,true);
   mc.moveTo(0,0);
   mc.lineTo(width,0);
   mc.lineTo(width,height);
   mc.lineTo(0,height);
   mc.lineTo(0,0);
   mc.endFill();
}
var UI = this;
UI._visible = false;
var UIname = "StyleShop";
this.bWindowOpen = false;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
goldMc.bg.hitTestDisable = true;
var TYPE_COLOR = "typeColor";
var SLOT_TYPE_PAPER_DOLL = 0;
var SLOT_TYPE_ITEM = 1;
var SLOT_TYPE_PRODUCT = 2;
var STYLE_SHOP_PREVIEW_ITEM_TYPE_HAIR = 9;
var STYLE_SHOP_PREVIEW_ITEM_TYPE_FACE = 10;
var STYLE_SHOP_PREVIEW_ITEM_TYPE_HAIR_TONE = 11;
var STYLE_SHOP_PREVIEW_ITEM_TYPE_FACE_TONE = 12;
goldMc.closeBtn.txt.setText("$500067");
var close_Btn = new lib.util.TxtBtn(goldMc.closeBtn.btn,goldMc.closeBtn.txt);
close_Btn.setRelease(ToGame_StyleShop_Close);
goldMc.couponBtn.txt.setText("$500068");
var Coupon_Btn = new lib.util.TxtBtn(goldMc.couponBtn.btn,goldMc.couponBtn.txt);
Coupon_Btn.setRelease(ToGame_StyleShop_Coupon);
var CAMERA_TOOLTIP = lib.util.UIString.getUIString("$500081");
var camera_btn = new lib.util.TxtBtn(btmMc.cameraBtn);
camera_btn.setRelease(ToGame_StyleShop_ScreenShot);
lib.manager.ToolTip.add(btmMc.cameraBtn,CAMERA_TOOLTIP,1);
var clear_btn = new lib.util.TxtBtn(paperDollMc.clearBtn);
clear_btn.setRelease(ToGame_StyleShop_SlotAllClear);
var buy_btn = new lib.util.TxtBtn(goldMc.coin1.plusBtn);
buy_btn.setRelease(ToGame_StyleShop_GotoShopBtn);
rightMc.mc_info.text_info.verticalAlign = "center";
rightMc.mc_info.text_info.wordWrap = true;
rightMc.mc_info.text_info.multiline = true;
rightMc.mc_info.text_info.align = "center";
rightMc.mc_info.text_info.text = "";
rightMc.mc_info._visible = false;
var regY_benefitMc = rightMc.benefitMc._y;
var regY_accessoryCustom = rightMc.mc_info._y;
leftMc.colorBox.text_info.verticalAlign = "center";
leftMc.colorBox.text_info.textAutoSize = "shrink";
leftMc.colorBox.text_info.wordWrap = true;
leftMc.colorBox.text_info.multiline = true;
leftMc.colorBox.text_info.align = "center";
leftMc.colorBox.text_info.text = "";
var cateTooltip = ["$500069","$500070","$500071","$500072","$500073","$500074","$500075","$500076","$500077","$500125","$500126"];
goldMc.coin0._visible = false;
goldMc.coin1._visible = false;
goldMc.coin2._visible = false;
goldMc.tag._visible = false;
goldMc.coin0.txt0.textAutoSize = "shrink";
goldMc.coin1.txt0.textAutoSize = "shrink";
goldMc.coin2.txt0.textAutoSize = "shrink";
var categoryButtonArray = [];
var categoryButtonPositionArray = [];
var cateLen = 11;
var cateFocus = 0;
leftMc.cate0.gotoAndStop(3);
var k = 0;
while(k <= STYLE_SHOP_PREVIEW_ITEM_TYPE_FACE_TONE)
{
   var mc = paperDollMc["slot" + k];
   if(mc != null)
   {
      mc.clear();
      mc.clickEvent = false;
      lib.manager.ToolTip.remove(mc);
   }
   k++;
}
var i = 0;
while(i < cateLen)
{
   var cateBtn = leftMc["cate" + i];
   categoryButtonArray.push(cateBtn);
   categoryButtonPositionArray.push(cateBtn._y);
   var frameNum = i * 3 + 1;
   cateBtn.idx = i;
   cateBtn.nor = frameNum;
   cateBtn.ove = frameNum + 1;
   cateBtn.pre = frameNum + 2;
   cateBtn.scrollSave = 0;
   cateBtn.gotoAndStop(frameNum);
   lib.manager.ToolTip.add(cateBtn.hit,cateTooltip[i],1);
   cateBtn.onRelease = function()
   {
      var _loc2_ = this.idx;
      if(cateFocus == _loc2_)
      {
         return undefined;
      }
      var _loc3_ = leftMc["cate" + cateFocus];
      _loc3_.gotoAndStop(_loc3_.nor);
      cateFocus = _loc2_;
      this.gotoAndStop(this.pre);
      ToGame_StyleShop_CateGoryClick(_loc2_);
   };
   cateBtn.onRollOver = function()
   {
      if(cateFocus == this.idx)
      {
         return undefined;
      }
      this.gotoAndStop(this.ove);
   };
   cateBtn.onRollOut = menuMc.onReleaseOutside = function()
   {
      if(cateFocus == this.idx)
      {
         return undefined;
      }
      this.gotoAndStop(this.nor);
   };
   i++;
}
var listY0 = leftMc.itemBox._y;
var scrollBar0 = leftMc.scroll0;
scrollBar0.addListener(leftMc.itemBox);
leftMc.itemBox.onScroll = function()
{
   fscommand("ToGame_StyleShop_ScrollLock");
   leftMc.itemBox._y = listY0 - arguments[0];
};
scrollBar0.setWheel(leftMc.maskMc);
scrollBar0.wheelDelta = 1;
scrollBar0.pageSize = 0;
scrollBar0.displaySize = leftMc.maskMc._height;
scrollBar0.defaultBarSizeRatio = 0.3333333333333333;
scrollBar0.rowHeight = 64;
scrollBar0.scroll = 0;
var listY1 = rightMc.productBox._y;
var scrollBar1 = rightMc.scroll1;
scrollBar1.addListener(rightMc.productBox);
rightMc.productBox.onScroll = function()
{
   fscommand("ToGame_StyleShop_ScrollLock");
   rightMc.productBox._y = listY1 - arguments[0];
};
scrollBar1.setWheel(rightMc.maskMc);
scrollBar1.wheelDelta = 1;
scrollBar1.pageSize = 0;
scrollBar1.displaySize = rightMc.maskMc._height;
scrollBar1.defaultBarSizeRatio = 0.3333333333333333;
scrollBar1.rowHeight = 64;
scrollBar1.scroll = 0;
var comboMc = leftMc.mc_search_area.comboBox;
comboMc.onChanged = function(This, selected, selectedIndex)
{
   var _loc1_ = undefined;
   if(TCATDISABLE)
   {
      _loc1_ = [0,1,2,3,4,5];
   }
   else
   {
      _loc1_ = [0,3,4,5];
   }
   var _loc2_ = _loc1_[selected];
   ToGame_StyleShop_SetFilter(_loc2_);
};
comboMc.rowMax = 6;
var TCATDISABLE = lib.gamedata.DefaultData.getDefaultUIData("TcatEnable").param0 != 0;
setComboBox();
var targetFd = new lib.util.ExtTextField(leftMc.mc_search_area.inputTxt,0,leftMc.mc_search_area.inputFocus);
var searchMc = new lib.util.TxtBtn(leftMc.mc_search_area.searchBtn);
searchMc.setRelease(ToGame_StyleShop_Search);
targetFd.onChanged = function()
{
   lib.util.StrByteLen.getLenth3(leftMc.mc_search_area.inputTxt,30);
   ToGame_StyleShop_Search();
};
myListener.OnGameEventShowWindow = function(_WindowName, _bShow)
{
   if(_WindowName.toLowerCase() == UIname.toLowerCase())
   {
      bWindowOpen = _bShow;
      if(_global.gbUIMode && bWindowOpen)
      {
         UI._visible = true;
         hideEvent(true);
      }
      else
      {
         UI._visible = false;
         hideEvent(false);
      }
   }
};
myListener.OnGame_ChangeStageSize = function()
{
   var _loc2_ = lib.info.AlignInfo.xRatioToPixel(100);
   var _loc1_ = lib.info.AlignInfo.yRatioToPixel(100);
   var _loc3_ = lib.info.AlignInfo.yRatioToPixel(0);
   goldMc._x = _loc2_;
   goldMc._y = _loc3_;
   paperDollMc._x = 0;
   paperDollMc._y = _loc3_;
   rightMc._x = _loc2_;
   rightMc._y = _loc1_ - 500;
   leftMc._y = _loc1_ - 500;
   btmMc._y = _loc1_;
   btmMc._x = _loc2_ / 2;
};
myListener.OnGame_StyleShop_CouponTag = function(count)
{
   if(count > 0)
   {
      goldMc.tag.txt.text = count;
      goldMc.tag._visible = true;
   }
   else
   {
      goldMc.tag._visible = false;
   }
};
myListener.OnGame_StyleShop_Point = function(gold, tcat, repute, goldType)
{
   var _loc1_ = 130;
   if(gold != undefined && gold != "")
   {
      goldMc.coin0._visible = true;
      goldMc.coin0.txt1.htmlText = gold;
      goldMc.coin0._y = _loc1_;
      _loc1_ = _loc1_ + 40;
      goldMc.coin0.gotoAndStop(Number(goldType) + 1);
   }
   if(tcat != undefined && tcat != "")
   {
      goldMc.coin1._visible = true;
      goldMc.coin1.txt1.htmlText = tcat;
      goldMc.coin1._y = _loc1_;
      _loc1_ = _loc1_ + 40;
   }
   if(repute != undefined && repute != "")
   {
      goldMc.coin2._visible = true;
      goldMc.coin2.txt1.htmlText = repute;
      goldMc.coin2._y = _loc1_;
      _loc1_ = _loc1_ + 40;
   }
};
myListener.OnGame_StyleShop_CategoryFocus = function(idx)
{
   var _loc1_ = leftMc["cate" + cateFocus];
   var _loc2_ = leftMc["cate" + idx];
   _loc1_.scrollSave = scrollBar0.scroll;
   _loc1_.gotoAndStop(_loc1_.nor);
   _loc2_.gotoAndStop(_loc2_.pre);
   cateFocus = idx;
};
myListener.OnGame_StyleShop_SetCategoryTabVisible = function(dataList)
{
   var _loc6_ = lib.util.ExtString.split(dataList,"\n");
   var _loc7_ = false;
   var _loc2_ = undefined;
   var _loc8_ = _loc6_.length;
   _loc2_ = 0;
   while(_loc2_ < _loc8_)
   {
      var _loc4_ = lib.util.ExtString.split(_loc6_[_loc2_],"\t");
      var _loc3_ = Number(_loc4_[0]);
      var _loc1_ = findCategoryTab(_loc3_);
      if(_loc1_ != null)
      {
         var _loc5_ = Boolean(Number(_loc4_[1]));
         if(_loc5_)
         {
            _loc1_._visible = true;
         }
         else
         {
            _loc1_._visible = false;
            if(_loc3_ == cateFocus)
            {
               _loc7_ = true;
            }
         }
      }
      _loc2_ = _loc2_ + 1;
   }
   rearrangeCategoryTab();
   if(_loc7_)
   {
      selectFirstCategoryTab();
   }
};
myListener.OnGame_StyleShop_SetPaperDoll = function(index)
{
   paperDollMc.gotoAndStop(Number(index) + 1);
};
myListener.OnGame_StyleShop_PaperDollSlot = function(index, dataList)
{
   var _loc1_ = paperDollMc["slot" + index];
   if(_loc1_ == null)
   {
      return undefined;
   }
   _loc1_.clear();
   _loc1_.clickEvent = false;
   lib.manager.ToolTip.remove(_loc1_);
   if(dataList == undefined || dataList == "")
   {
      return undefined;
   }
   var _loc2_ = lib.util.ExtString.split(dataList,"\t");
   switch(Number(index))
   {
      case STYLE_SHOP_PREVIEW_ITEM_TYPE_HAIR_TONE:
      case STYLE_SHOP_PREVIEW_ITEM_TYPE_FACE_TONE:
         _loc1_.id = _loc2_[0];
         _loc1_.index = index;
         _loc1_.clickEvent = true;
         drawWithScaling(_loc1_,_loc2_[1],42,42);
         break;
      default:
         _loc1_.id = _loc2_[0];
         _loc1_.index = index;
         _loc1_.clickEvent = true;
         lib.manager.ToolTip.add(_loc1_,_loc2_[0] + "\t" + SLOT_TYPE_PAPER_DOLL + "\t" + index,6);
         drawWithScaling(_loc1_,_loc2_[1],42,42);
   }
};
myListener.OnGame_StyleShop_ItemListUpDate = function(id, dataList)
{
   var _loc4_ = leftMc.itemBox;
   for(var _loc7_ in _loc4_)
   {
      var _loc1_ = _loc4_[_loc7_];
      if(typeof _loc1_ == "movieclip")
      {
         if(_loc1_.id == id)
         {
            var _loc2_ = lib.util.ExtString.split(dataList,"\t");
            var _loc3_ = Boolean(Number(_loc2_[0]));
            _loc1_.checkMode = _loc3_;
            if(_loc3_)
            {
               _loc1_.gotoAndStop(3);
            }
            else
            {
               _loc1_.gotoAndStop(1);
            }
            if(_loc2_[1] == "1")
            {
               _loc1_.disableMc._visible = true;
            }
            else
            {
               _loc1_.disableMc._visible = false;
            }
         }
      }
   }
};
myListener.OnGame_StyleShop_ItemList = function(dataList)
{
   var _loc6_ = leftMc.itemBox;
   listClear(_loc6_);
   scrollBar0.scroll = 0;
   var _loc7_ = lib.util.ExtString.split(dataList,"\n");
   var _loc8_ = _loc7_.length;
   var _loc4_ = 0;
   while(_loc4_ < _loc8_)
   {
      var _loc3_ = lib.util.ExtString.split(_loc7_[_loc4_],"\t");
      var _loc2_ = _loc6_.attachMovie("slotMc","slotMc" + _loc4_,_loc6_.getNextHighestDepth());
      _loc2_.id = _loc3_[0];
      _loc2_.clickEvent = true;
      lib.manager.ToolTip.add(_loc2_,_loc2_.id + "\t" + SLOT_TYPE_ITEM,6);
      _loc2_._xscale = 125;
      _loc2_._yscale = 125;
      drawWithScaling(_loc2_.img,_loc3_[1],48,48);
      if(_loc3_[2] != "" || _loc3_[2] != undefined)
      {
         drawWithScaling(_loc2_.img,_loc3_[2],36,36);
      }
      _loc2_._x = _loc4_ % 4 * 69 + 2;
      _loc2_._y = int(_loc4_ / 4) * 69 + 2;
      var _loc5_ = Boolean(Number(_loc3_[3]));
      _loc2_.checkMode = _loc5_;
      if(_loc5_)
      {
         _loc2_.gotoAndStop(3);
      }
      else
      {
         _loc2_.gotoAndStop(1);
      }
      if(_loc3_[4] == "1")
      {
         _loc2_.disableMc._visible = true;
      }
      else
      {
         _loc2_.disableMc._visible = false;
      }
      _loc2_.onRelease = function()
      {
         if(this.disableMc._visible)
         {
            return undefined;
         }
         if(this.checkMode)
         {
            this.checkMode = false;
            this.gotoAndStop(1);
         }
         else
         {
            this.checkMode = true;
            this.gotoAndStop(3);
         }
         ToGame_StyleShop_ItemClick(this.id,this.checkMode);
      };
      _loc2_.onRollOver = function()
      {
         if(this.disableMc._visible)
         {
            return undefined;
         }
         if(this.checkMode)
         {
            return undefined;
         }
         this.gotoAndStop(2);
      };
      _loc2_.onRollOut = _loc2_.onReleaseOutside = function()
      {
         if(this.disableMc._visible)
         {
            return undefined;
         }
         if(this.checkMode)
         {
            return undefined;
         }
         this.gotoAndStop(1);
      };
      _loc4_ = _loc4_ + 1;
   }
   scrollBar0.pageSize = _loc6_._height;
   switch(cateFocus)
   {
      case STYLE_SHOP_PREVIEW_ITEM_TYPE_HAIR:
      case STYLE_SHOP_PREVIEW_ITEM_TYPE_FACE:
         leftMc.mc_search_area._visible = false;
         break;
      default:
         leftMc.mc_search_area._visible = true;
   }
};
var BENEFIT_BTN_STR = lib.util.UIString.getUIString("$500115");
var SALE_STR = lib.util.UIString.getUIString("$500123");
var SHOP_STR = lib.util.UIString.getUIString("$500124");
var btnTxt = ["$500078","$500079","$500114"];
var productLen = 0;
myListener.OnGame_StyleShop_ProductList = function(dataList)
{
   var _loc8_ = rightMc.productBox;
   listClear(_loc8_);
   var _loc9_ = lib.util.ExtString.split(dataList,"\n");
   productLen = _loc9_.length;
   var _loc5_ = 0;
   while(_loc5_ < productLen)
   {
      var _loc3_ = lib.util.ExtString.split(_loc9_[_loc5_],"\t");
      var _loc2_ = _loc8_.attachMovie("slotMc2","slotMc" + _loc5_,_loc8_.getNextHighestDepth());
      _loc2_.id = _loc3_[0];
      _loc2_.itemType = _loc3_[6];
      _loc2_._y = _loc5_ * 98;
      lib.display.DrawBitmapData.draw(_loc2_.img,_loc3_[1],0,0,0,0,48,48,0.75);
      lib.manager.ToolTip.add(_loc2_,_loc2_.id + "\t" + SLOT_TYPE_PRODUCT,6);
      _loc2_.nameTxt.htmlText = _loc3_[3];
      if(_loc3_[7] > 0)
      {
         _loc2_.priceMc.gotoAndStop(2);
         _loc2_.priceMc.txt0.htmlText = _loc3_[4];
         _loc2_.priceMc.txt1.htmlText = _loc3_[6];
         _loc2_.priceMc.saleMc.txt.htmlText = "(" + _loc3_[7] + "%)";
         var _loc6_ = _loc2_.priceMc.txt0.textWidth;
         _loc2_.priceMc.arrowMc._x = _loc6_ + 60;
         _loc2_.priceMc.txt1._x = _loc6_ + 70;
         _loc2_.priceMc.lineMc._width = _loc6_ + 5;
         _loc2_.priceMc._x = 260 - (_loc2_.priceMc.txt1._x + _loc2_.priceMc.txt1.textWidth);
      }
      else
      {
         _loc2_.saleMc._visible = false;
         _loc2_.priceMc.txt0.htmlText = _loc3_[4];
      }
      if(_loc3_[8] == undefined || _loc3_[8] == "")
      {
         _loc2_.guideTxt._visible = false;
         _loc2_.priceMc._visible = true;
      }
      else
      {
         _loc2_.guideTxt._visible = true;
         _loc2_.priceMc._visible = false;
         _loc2_.guideTxt.htmlText = _loc3_[8];
      }
      var _loc4_ = _loc2_.btn.btn;
      if(_loc3_[5] == 1)
      {
         _loc4_.gotoAndStop(1);
         _loc2_.btn.txt.text = lib.util.UIString.getUIString("$500127");
         _loc4_.onPress = function()
         {
            this.gotoAndStop(3);
         };
         _loc4_.onRelease = function()
         {
            this.gotoAndStop(1);
            var _loc2_ = this._parent._parent;
            ToGame_StyleShop_ProductClick(_loc2_.id);
         };
         _loc4_.onRollOver = function()
         {
            this.gotoAndStop(2);
         };
         _loc4_.onRollOut = _loc4_.onReleaseOutside = function()
         {
            this.gotoAndStop(1);
         };
      }
      else
      {
         _loc4_.gotoAndStop(4);
         _loc4_.onPress = _loc4_.onRelease = _loc4_.onRollOver = _loc4_.onRollOut = _loc4_.onReleaseOutside = function()
         {
         };
         _loc2_.btn.txt.text = lib.util.UIString.getUIString("$500128");
      }
      _loc5_ = _loc5_ + 1;
   }
   scrollBar1.pageSize = _loc8_._height;
   scrollBar1.scroll = 0;
};
myListener.OnGame_SytleShop_SetFilter = function(index)
{
   comboMc.setSelectedId(index);
};
myListener.OnGame_StyleShop_Benefit = function(bool, str, type, tooltip)
{
   var _loc1_ = rightMc.benefitMc;
   if(bool == "0")
   {
      _loc1_._visible = false;
      updateUIPosition();
      return undefined;
   }
   _loc1_._visible = true;
   updateUIPosition();
   var _loc2_ = new lib.util.TxtBtn(_loc1_.btn,_loc1_.txt);
   _loc2_.setRelease(ToGame_StyleShop_Benefit);
   _loc2_.setTextColor("0xcccccc","0xffffff","0xcccccc","0x999999");
   _loc1_.txt.text = BENEFIT_BTN_STR;
   if(str != undefined && str != "")
   {
   }
   if(tooltip != undefined && tooltip != "")
   {
      lib.manager.ToolTip.add(_loc1_.txt,tooltip,1);
   }
   else
   {
      lib.manager.ToolTip.remove(_loc1_.btn);
   }
   _loc2_.setEnabled(Boolean(Number(type)));
};
rightMc.benefitMc._visible = false;
myListener.OnGame_StyleShop_ProductMode = function(bool)
{
   var _loc1_ = Boolean(Number(bool));
   rightMc.productBg._visible = _loc1_;
   rightMc.productBtn._visible = _loc1_;
   rightMc.scroll1._visible = _loc1_;
   rightMc.tcatTxt0._visible = _loc1_;
   rightMc.tcatTxt1._visible = _loc1_;
   rightMc.productBox._visible = _loc1_;
};
var socialFocus = null;
myListener.OnGame_StyleShop_SocialList = function(dataList)
{
   var _loc6_ = btmMc.socialBox;
   listClear(_loc6_);
   var _loc8_ = lib.util.ExtString.split(dataList,"\n");
   var _loc7_ = _loc8_.length;
   socialBoxMax = _loc7_ - 5;
   if(_loc7_ > 5)
   {
      socialBtn(btmMc.nextBtn,true);
   }
   var _loc3_ = 0;
   while(_loc3_ < _loc7_)
   {
      var _loc4_ = lib.util.ExtString.split(_loc8_[_loc3_],"\t");
      var _loc2_ = _loc6_.attachMovie("slotMc3","slotMc" + _loc3_,_loc6_.getNextHighestDepth());
      _loc2_.id = _loc4_[0];
      _loc2_.idx = _loc3_;
      lib.manager.ToolTip.add(_loc2_.SLOT,_loc4_[3],1);
      lib.display.DrawBitmapData.draw(_loc2_.img,_loc4_[1],0,0,0,0,52,52,0.8125);
      _loc2_._x = _loc3_ * 56;
      var _loc5_ = _loc4_[2];
      if(_loc5_ == 1)
      {
         btmMc.socialBox["slotMc" + socialFocus].gotoAndStop(1);
         socialFocus = _loc3_;
         _loc2_.gotoAndStop(3);
      }
      if(_loc5_ == -1)
      {
         _loc2_.disableMc._visible = true;
      }
      else
      {
         _loc2_.disableMc._visible = false;
      }
      _loc2_.onRelease = function()
      {
         if(this.disableMc._visible)
         {
            return undefined;
         }
         if(socialFocus == this.idx)
         {
            socialFocus = null;
            this.gotoAndStop(1);
         }
         else
         {
            btmMc.socialBox["slotMc" + socialFocus].gotoAndStop(1);
            socialFocus = this.idx;
            this.gotoAndStop(3);
         }
         ToGame_StyleShop_SocialClick(this.id);
      };
      _loc2_.onRollOver = function()
      {
         if(this.disableMc._visible)
         {
            return undefined;
         }
         if(socialFocus == this.idx)
         {
            this.gotoAndStop(3);
         }
         else
         {
            this.gotoAndStop(2);
         }
      };
      _loc2_.onRollOut = _loc2_.onReleaseOutside = function()
      {
         if(this.disableMc._visible)
         {
            return undefined;
         }
         if(socialFocus == this.idx)
         {
            this.gotoAndStop(3);
         }
         else
         {
            this.gotoAndStop(1);
         }
      };
      _loc3_ = _loc3_ + 1;
   }
};
var disableMode = false;
myListener.OnGame_StyleShop_Disable = function(type)
{
   disableMode = Boolean(Number(type));
   _root.setDisableUI(paperDollMc,disableMode);
   _root.setDisableUI(goldMc,disableMode);
   _root.setDisableUI(rightMc,disableMode);
   _root.setDisableUI(leftMc,disableMode);
   _root.setDisableUI(btmMc,disableMode);
};
myListener.OnGame_StyleShop_FilterCheck = function(type)
{
   btmMc.checkBox.checked = Boolean(Number(type));
};
myListener.OnGame_StyleShop_GotoShopBtn = function(type, tooltip)
{
   if(type == "-1")
   {
      goldMc.coin1.plusBtn._visible = false;
   }
   else
   {
      goldMc.coin1.plusBtn._visible = true;
   }
   buy_btn.setEnabled(Boolean(Number(type)));
   var _loc1_ = SHOP_STR;
   if(tooltip != undefined)
   {
      _loc1_ = tooltip;
   }
   lib.manager.ToolTip.add(goldMc.coin1.plusBtn,_loc1_,1);
};
myListener.OnGame_StyleShop_GotoShopBtn(1);
leftMc.colorBox._visible = false;
var selectedColorMC;
myListener.OnGame_StyleShop_SetColor = function(bool, img, colorDataList, infoText)
{
   leftMc.colorBox._visible = Boolean(Number(bool));
   leftMc.colorBox.text_info.text = infoText;
   var _loc13_ = lib.util.ExtString.split(colorDataList,"\n");
   var _loc14_ = _loc13_.length;
   var _loc11_ = leftMc.colorBox.colorContainer;
   var _loc12_ = 0;
   var _loc10_ = 0;
   selectedColorMC = null;
   listClear(_loc11_);
   var _loc3_ = 0;
   while(_loc3_ < _loc14_)
   {
      var _loc5_ = lib.util.ExtString.split(_loc13_[_loc3_],"\t");
      var _loc2_ = _loc11_.attachMovie("colorSlot","slot" + _loc3_,_loc11_.getNextHighestDepth());
      _loc2_.$type = TYPE_COLOR;
      _loc2_.id = _loc5_[0];
      _loc12_ = int(_loc3_ % 5) * 35;
      _loc10_ = int(_loc3_ / 5) * 35;
      _loc2_._x = _loc12_;
      _loc2_._y = _loc10_;
      var _loc7_ = 28;
      var _loc6_ = 28;
      _loc2_.iconMc.clear();
      var _loc4_ = _loc5_[1];
      if(_loc4_ == null || _loc4_.length == 0 || _loc4_ == 0 || _loc4_ == "0")
      {
         var _loc8_ = convertColorValue(_loc5_[2]);
         _loc2_.iconMc.beginFill(_loc8_,100);
         _loc2_.iconMc.moveTo(0,0);
         _loc2_.iconMc.lineTo(_loc7_,0);
         _loc2_.iconMc.lineTo(_loc7_,_loc6_);
         _loc2_.iconMc.lineTo(0,_loc6_);
         _loc2_.iconMc.lineTo(0,0);
         _loc2_.iconMc.endFill();
      }
      else
      {
         lib.display.DrawBitmapData.draw(_loc2_.iconMc,_loc4_,0,0,0,0,_loc7_,_loc6_,1);
      }
      var _loc9_ = Boolean(Number(_loc5_[3]));
      setSelectColor(_loc2_,_loc9_);
      _loc2_.bgMc.onRelease = function()
      {
         toggleSelectColor(this._parent);
      };
      _loc2_.bgMc.onRollOver = function()
      {
         if(selectedColorMC == this._parent)
         {
            return undefined;
         }
         this.gotoAndStop(2);
      };
      _loc2_.bgMc.onRollOut = menuMc.onReleaseOutside = function()
      {
         if(selectedColorMC == this._parent)
         {
            return undefined;
         }
         this.gotoAndStop(1);
      };
      _loc3_ = _loc3_ + 1;
   }
   leftMc.colorBox.bg._height = _loc10_ + 50;
};
myListener.OnGame_StyleShop_SetColorUpdate = function(id, dataList)
{
   var _loc3_ = leftMc.colorBox.colorContainer;
   for(var _loc6_ in _loc3_)
   {
      var _loc1_ = _loc3_[_loc6_];
      if(typeof _loc1_ == "movieclip")
      {
         if(_loc1_.id == id)
         {
            var _loc2_ = Boolean(Number(dataList));
            setSelectColor(_loc1_,_loc2_);
            return undefined;
         }
      }
   }
};
myListener.OnGame_StyleShop_SetAdditionalInfoMessage = function(visible, text)
{
   rightMc.mc_info._visible = visible;
   rightMc.mc_info.text_info.text = text;
   updateUIPosition();
};
var socialBoxCount = 0;
var socialBoxMax = 5;
btmMc.preBtn.moveNum = -1;
btmMc.nextBtn.moveNum = 1;
socialBtn(btmMc.preBtn,false);
socialBtn(btmMc.nextBtn,false);
myListener.OnGame_MouseDown = function(button, target)
{
   if(disableMode)
   {
      return undefined;
   }
   if(button == 2)
   {
      if(target._name == "SLOT")
      {
         var _loc2_ = target._parent;
         if(_loc2_.id != undefined && _loc2_.clickEvent)
         {
            if(_loc2_.checkMode == undefined)
            {
               ToGame_StyleShop_SlotClick(_loc2_.id,_loc2_.index);
            }
            else if(_loc2_.checkMode == true)
            {
               if(_loc2_.disableMc._visible)
               {
                  return undefined;
               }
               _loc2_.checkMode = false;
               _loc2_.gotoAndStop(1);
               ToGame_StyleShop_ItemClick(_loc2_.id,_loc2_.checkMode);
            }
            else
            {
               if(_loc2_.disableMc._visible)
               {
                  return undefined;
               }
               _loc2_.checkMode = true;
               _loc2_.gotoAndStop(3);
               ToGame_StyleShop_ItemClick(_loc2_.id,_loc2_.checkMode);
            }
         }
      }
      else
      {
         var _loc1_ = target;
         while(_loc1_ != null)
         {
            if(_loc1_.$type == TYPE_COLOR)
            {
               toggleSelectColor(_loc1_);
               return undefined;
            }
            _loc1_ = _loc1_._parent;
         }
      }
   }
};
btmMc.checkBox.onChanged = function(checked)
{
   ToGame_StyleShop_FilterCheck(Number(checked));
};
myListener.OnGame_ChangeStageSize();
ToGame_StyleShop_Init();
myListener.OnGame_StyleShop_CategoryFocus(0);
