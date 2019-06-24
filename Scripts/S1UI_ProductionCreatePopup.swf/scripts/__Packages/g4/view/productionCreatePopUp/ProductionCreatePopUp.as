class g4.view.productionCreatePopUp.ProductionCreatePopUp extends g4.core.View implements g4.gameInterface.IProductionCreatePopUp
{
   function ProductionCreatePopUp(targetMovie)
   {
      super(targetMovie);
      this.GRADE_STR = lib.util.UIString.getUIString("$153027");
      this.SUCCESS_STR_NOR = lib.util.UIString.getUIString("$153018");
      this.SUCCESS_STR_CRI = lib.util.UIString.getUIString("$153025");
      this.SUCCESS_STR_PER = lib.util.UIString.getUIString("$153061") + " " + lib.util.UIString.getUIString("$153062");
      this._gradeBm1 = flash.display.BitmapData.loadBitmap("iconGrade1");
      this._gradeBm2 = flash.display.BitmapData.loadBitmap("iconGrade2");
      this._gradeBm3 = flash.display.BitmapData.loadBitmap("iconGrade3");
      this._bigSuccess = false;
      this._gageY = 240;
      this._prevGage = 0;
      this._gradeTextColor = ["0xFFFFFF","0x4ecd30","0x00aeef","0xffcc00"];
      this._amountTextFormat = new TextFormat("$NormalFont",14,14145495,false,false,false,null,null,"right",0,0,0,0);
      this._bWidgetOpen = false;
   }
   function getUIName()
   {
      return g4.view.ViewID.PRODUCTION_CREATE_POP_UP;
   }
   function configUI()
   {
      this._container_mc = this._targetMovieClip.container_mc;
      this._titleTxt = this._container_mc.titleTxt;
      this._resultTxt = this._container_mc.resultTxt;
      this._progressTxt = this._container_mc.progressTxt;
      this._totalTxt = this._container_mc.totalTxt;
      this._gageMc0 = this._container_mc.gageMc0;
      this._gageMc1 = this._container_mc.gageMc1;
      this._effect = this._container_mc.effect;
      this._gradeTxt = this._container_mc.gradeTxt;
      this._gradeTxt2 = this._container_mc.gradeTxt2;
      var _loc2_ = new lib.util.TxtBtn(this._container_mc.cancelBtn.btn,this._container_mc.cancelBtn.txt);
      _loc2_.setTextColor("0xD7D7D7","0xFFFFFF","0xFFFFFF","0x485460");
      _loc2_.setRelease(this.ToGame_ProductionCreatePopUp_Cancel);
      var _loc3_ = this._targetMovieClip.uiDrager;
      _loc3_.setData(this.getUIName(),this._targetMovieClip);
      this._targetMovieClip._visible = false;
      this._progressTxt._visible = false;
      this.gageSize();
      this.ToGame_ProductionCreatePopUp_Init();
   }
   function configGameInterface()
   {
      this.registerGameInterface("OnGameEventShowWindow",g4.util.Delegate.create(this,this.OnGameEventShowWindow));
      this.registerGameInterface("OnGame_ProductionCreatePopUp_SetTitle",g4.util.Delegate.create(this,this.OnGame_ProductionCreatePopUp_SetTitle));
      this.registerGameInterface("OnGame_ProductionCreatePopUp_SetTargetItem",g4.util.Delegate.create(this,this.OnGame_ProductionCreatePopUp_SetTargetItem));
      this.registerGameInterface("OnGame_ProductionCreatePopUp_SetResult",g4.util.Delegate.create(this,this.OnGame_ProductionCreatePopUp_SetResult));
      this.registerGameInterface("OnGame_ProductionCreatePopUp_UpdateProgress",g4.util.Delegate.create(this,this.OnGame_ProductionCreatePopUp_UpdateProgress));
      this.registerGameInterface("OnGame_ProductionCreatePopUp_UpdateProgressLinear",g4.util.Delegate.create(this,this.OnGame_ProductionCreatePopUp_UpdateProgressLinear));
      this.registerGameInterface("OnGame_ProductionCreatePopUp_UpdateTotalProgress",g4.util.Delegate.create(this,this.OnGame_ProductionCreatePopUp_UpdateTotalProgress));
   }
   function fadeCritical()
   {
      if(this._container_mc.successSlot)
      {
         gs.TweenLite.to(this._container_mc.successSlot,0.3,{delay:1,_alpha:0,ease:gs.easing.Strong.easeOut,onComplete:this.fadeEnd});
      }
      gs.TweenLite.to(this._resultTxt,0.3,{delay:1,_alpha:0});
   }
   function fadeEnd()
   {
      this.clearSlot(this._container_mc.successSlot);
   }
   function clearSlot(tgMc)
   {
      lib.manager.ToolTip.remove(tgMc);
      tgMc.removeMovieClip();
   }
   function setDecimal(num)
   {
      var _loc2_ = Number(num);
      var _loc1_ = num * 10 % 10;
      if(_loc1_ != 0)
      {
         _loc2_ = _loc2_ + _loc1_ * 0.1;
      }
      return _loc2_;
   }
   function clearBox(tgMc)
   {
      for(var _loc3_ in tgMc)
      {
         var _loc1_ = tgMc[_loc3_];
         lib.manager.ToolTip.remove(_loc1_);
         _loc1_.removeMovieClip();
      }
   }
   function drawSlot(tgMc, id, img, grade, num)
   {
      lib.manager.ToolTip.add(tgMc,id,6);
      lib.display.DrawBitmapData.draw(tgMc,img,0,0,0,0,36,36,0.56);
      if(grade > 0)
      {
         lib.display.DrawBitmapData.draw(tgMc,this._targetMovieClip["_gradeBm" + grade],0,0,0,0,14,14);
      }
      if(num > 0)
      {
         lib.display.TextBuilder.draw(tgMc,"numTxt",25,25,36,16,this._amountTextFormat);
         this._container_mc.itemDraw.numTxt.text = num;
      }
   }
   function gageSize()
   {
      this._gageMc0._x = -178;
      this._gageMc1._x = -178;
   }
   function OnGameEventShowWindow(widgetName, bShow)
   {
      if(widgetName.toLowerCase() == this.getUIName().toLowerCase())
      {
         this._bWidgetOpen = bShow;
         if(_global.gbUIMode && this._bWidgetOpen)
         {
            this._targetMovieClip._visible = true;
         }
         else
         {
            this._targetMovieClip._visible = false;
         }
      }
   }
   function OnGame_ProductionCreatePopUp_SetTitle(str)
   {
      this._titleTxt.htmlText = str;
   }
   function OnGame_ProductionCreatePopUp_SetTargetItem(num, data)
   {
      this.clearSlot(this._container_mc.targetSlot);
      var _loc2_ = lib.util.ExtString.split(data,"\t");
      var _loc3_ = this._container_mc.attachMovie("slotDraw","targetSlot",this._container_mc.getNextHighestDepth());
      _loc3_._x = 143;
      _loc3_._y = 42;
      this.drawSlot(_loc3_,_loc2_[0],_loc2_[2],_loc2_[3],_loc2_[4]);
      this._titleTxt.textColor = this._gradeTextColor[Number(_loc2_[3])];
      var _loc5_ = lib.util.ExtString.split(num,"\t");
      var _loc4_ = this.setDecimal(_loc5_[0]);
      if(_loc4_ > 0)
      {
         this._gradeTxt.htmlText = this.GRADE_STR + " <font color=\'#80E71C\'>+" + _loc4_ + "</font>";
      }
      else
      {
         this._gradeTxt.htmlText = this.GRADE_STR + " <font color=\'#BB0000\'>+" + _loc4_ + "</font>";
      }
      var _loc6_ = this.setDecimal(_loc5_[1]);
      if(_loc6_ > 0)
      {
         this._gradeTxt2.htmlText = "<font color=\'#80e71c\'>" + this.SUCCESS_STR_CRI + " " + this.SUCCESS_STR_PER + "</font>";
      }
      else
      {
         this._gradeTxt2.htmlText = "";
      }
   }
   function OnGame_ProductionCreatePopUp_SetResult(type, success)
   {
      this._resultTxt.alpha = 0;
      if(type == "1")
      {
         this._bigSuccess = true;
         var _loc3_ = lib.util.ExtString.split(success,"\t");
         var _loc2_ = this._container_mc.attachMovie("slotDraw","successSlot",this._container_mc.getNextHighestDepth());
         _loc2_._x = 250;
         _loc2_._y = 48;
         _loc2_._alpha = 0;
         _loc2_._xscale = 80;
         _loc2_._yscale = 80;
         gs.TweenLite.to(_loc2_,0.3,{_alpha:100,ease:gs.easing.Strong.easeOut});
         this.drawSlot(_loc2_,_loc3_[0],_loc3_[2],"",_loc3_[4]);
         this._gageMc0.gotoAndPlay(2);
         this._effect.gotoAndPlay(2);
         this._effect._visible = true;
         return undefined;
      }
      if(this._bigSuccess == false)
      {
         this._resultTxt.text = this.SUCCESS_STR_NOR;
      }
      else
      {
         this._resultTxt.text = this.SUCCESS_STR_CRI;
      }
      this._bigSuccess = false;
      this._resultTxt._alpha = 0;
      gs.TweenLite.to(this._resultTxt,0.5,{_alpha:100,onComplete:this.fadeCritical});
   }
   function OnGame_ProductionCreatePopUp_UpdateProgress(percent)
   {
      this._gageMc0.gotoAndStop(1);
      var _loc2_ = percent / 100 * this._gageY - 178;
      if(_loc2_ < this._prevGage)
      {
         this._gageMc0._x = -178;
      }
      this._prevGage = _loc2_;
      gs.TweenLite.killTweensOf(this._gageMc0,false);
      gs.TweenLite.to(this._gageMc0,0.3,{_x:_loc2_,ease:gs.easing.Strong.easeOut});
   }
   function OnGame_ProductionCreatePopUp_UpdateProgressLinear(maxTime)
   {
      this._gaugeTime = Number(maxTime);
      this._gageMc0.gotoAndStop(1);
      this._gageMc0._x = -178;
      var _loc2_ = 62;
      gs.TweenLite.killTweensOf(this._gageMc0,false);
      gs.TweenLite.to(this._gageMc0,this._gaugeTime,{_x:_loc2_,ease:gs.easing.Linear.easeNone,onUpdate:this.updateProgress,onUpdateScope:this});
      this.updateProgress();
   }
   function updateProgress()
   {
      var _loc3_ = (this._gageMc0._x + 178) / 240;
      var _loc2_ = String(this._gaugeTime - Math.floor(this._gaugeTime * _loc3_ * 10) * 0.1);
      if(_loc2_.indexOf(".") == -1)
      {
         _loc2_ = _loc2_ + ".0";
      }
      this._progressTxt.text = _loc2_ + " " + lib.util.UIString.getUIString("$005033");
   }
   function OnGame_ProductionCreatePopUp_UpdateTotalProgress(curNum, totalNum)
   {
      this._totalTxt.text = curNum + "/" + totalNum;
      var _loc2_ = curNum / totalNum * this._gageY - 178;
      gs.TweenLite.killTweensOf(this._gageMc1,false);
      gs.TweenLite.to(this._gageMc1,0.3,{_x:_loc2_,ease:gs.easing.Strong.easeOut});
      this._progressTxt._visible = curNum != totalNum;
   }
   function ToGame_ProductionCreatePopUp_Init()
   {
      fscommand("ToGame_ProductionCreatePopUp_Init");
   }
   function ToGame_ProductionCreatePopUp_Cancel()
   {
      fscommand("ToGame_ProductionCreatePopUp_Cancel");
   }
}
