class g4.view.abnormality.Abnormality extends g4.core.View
{
   var regX = 0;
   var regY = 0;
   function Abnormality(targetMovieClip)
   {
      super(targetMovieClip);
   }
   function getUIName()
   {
      return g4.view.ViewID.ABNORMALITY;
   }
   function configUI()
   {
      this.container_mc = this.__get__targetMovieClip().container_mc;
      this.button_option = this.container_mc.button_option;
      this.mc_buff_area = this.container_mc.mc_buff_area;
      this.button_option.addEventListener("press",this,"button_option_pressHandler");
      this.button_option.addEventListener("click",this,"button_option_clickHandler");
      this.button_option.addEventListener("releaseOutside",this,"button_option_releaseOutsideHandler");
      var _loc2_ = lib.gamedata.CustomizedUIDataCollection.getInstance();
      _loc2_.addEventListener(gfx.events.EventTypes.VALUE_CHANGE,this,"customData_valueChangeHandler");
      this.setAlignmentType(_loc2_.valueOf(lib.gamedata.CustomizedUIDataKey.ABNORMALITY_ALIGN_TYPE));
      this.updateByUIMode();
   }
   function configGameInterface()
   {
      this.registerGameInterface("OnGame_Abnormality_AddBuff",gfx.utils.Delegate.create(this,this.OnGame_Abnormality_AddBuff));
      this.registerGameInterface("OnGame_Abnormality_UpdateBuff",gfx.utils.Delegate.create(this,this.OnGame_Abnormality_UpdateBuff));
      this.registerGameInterface("OnGame_Abnormality_RemoveBuff",gfx.utils.Delegate.create(this,this.OnGame_Abnormality_RemoveBuff));
      this.registerGameInterface("OnGame_Abnormality_ClearBuff",gfx.utils.Delegate.create(this,this.OnGame_Abnormality_ClearBuff));
      this.registerGameInterface("OnGame_Abnormality_HoldBuff",gfx.utils.Delegate.create(this,this.OnGame_Abnormality_HoldBuff));
      g4.model.GameModel.addEventListener(g4.view.ViewID.ABNORMALITY,g4.model.GameModelEventType.MAIN_UI_MODE_CHANGED,this,"model_mainUIModeChangeHandler");
   }
   function updateByUIMode()
   {
      this.button_option._visible = g4.model.GameModel.mainModel.uiMode;
   }
   function setAlignmentType(alignmentType)
   {
      switch(alignmentType)
      {
         case g4.view.abnormality.AbnormalityConstants.BUFF_ALIGNMENT_TYPE_LEFT:
         case g4.view.abnormality.AbnormalityConstants.BUFF_ALIGNMENT_TYPE_RIGHT:
         case g4.view.abnormality.AbnormalityConstants.BUFF_ALIGNMENT_TYPE_UP:
         case g4.view.abnormality.AbnormalityConstants.BUFF_ALIGNMENT_TYPE_DOWN:
            if(alignmentType == g4.view.abnormality.AbnormalityGlobals.alignmentType)
            {
               return undefined;
            }
            g4.view.abnormality.AbnormalityGlobals.alignmentType = alignmentType;
            this.updateByAlignmentType();
            this.mc_buff_area.updateByAlignmentType();
         default:
            return undefined;
      }
   }
   function updateByAlignmentType()
   {
      g4.util.UIUtil.callLater(this,"_updateByAlignmentType");
   }
   function _updateByAlignmentType()
   {
      switch(g4.view.abnormality.AbnormalityGlobals.alignmentType)
      {
         case g4.view.abnormality.AbnormalityConstants.BUFF_ALIGNMENT_TYPE_LEFT:
            this.mc_buff_area._x = this.button_option._x - g4.view.abnormality.AbnormalityConstants.GAP_BETWEEN_OPTION_BUTTON_AND_BUFF;
            this.mc_buff_area._y = this.button_option._y;
            break;
         case g4.view.abnormality.AbnormalityConstants.BUFF_ALIGNMENT_TYPE_RIGHT:
            this.mc_buff_area._x = this.button_option._x + g4.view.abnormality.AbnormalityConstants.OPTION_BUTTON_WIDTH + g4.view.abnormality.AbnormalityConstants.GAP_BETWEEN_OPTION_BUTTON_AND_BUFF;
            this.mc_buff_area._y = this.button_option._y;
            break;
         case g4.view.abnormality.AbnormalityConstants.BUFF_ALIGNMENT_TYPE_UP:
            this.mc_buff_area._x = this.button_option._x;
            this.mc_buff_area._y = this.button_option._y - g4.view.abnormality.AbnormalityConstants.GAP_BETWEEN_OPTION_BUTTON_AND_BUFF;
            break;
         case g4.view.abnormality.AbnormalityConstants.BUFF_ALIGNMENT_TYPE_DOWN:
            this.mc_buff_area._x = this.button_option._x;
            this.mc_buff_area._y = this.button_option._y + g4.view.abnormality.AbnormalityConstants.OPTION_BUTTON_HEIGHT + g4.view.abnormality.AbnormalityConstants.GAP_BETWEEN_OPTION_BUTTON_AND_BUFF;
      }
   }
   function startDragging()
   {
      this.regX = this.__get__targetMovieClip()._x;
      this.regY = this.__get__targetMovieClip()._y;
      var _loc2_ = 20;
      var _loc6_ = Stage.visibleRect.left;
      var _loc5_ = Stage.visibleRect.top;
      var _loc4_ = Stage.visibleRect.left + Stage.visibleRect.width - _loc2_;
      var _loc3_ = Stage.visibleRect.top + Stage.visibleRect.height - _loc2_;
      this.__get__targetMovieClip().startDrag(false,_loc6_,_loc5_,_loc4_,_loc3_);
   }
   function stopDragging(openOption)
   {
      this.__get__targetMovieClip().stopDrag();
      lib.info.AlignInfo.savePos(this.__get__targetMovieClip(),true);
      if(openOption)
      {
         if(this.__get__targetMovieClip()._x == this.regX && this.__get__targetMovieClip()._y == this.regY)
         {
            g4.model.GameModel.mainModel.ToGame_AbnormalityOption_Open();
         }
      }
   }
   function OnGame_Abnormality_AddBuff(id, amount, type, group, bRelaxMerit, iconImg, remainTime, totalTime)
   {
      id = Number(id);
      amount = Number(amount);
      type = Number(type);
      group = Number(group);
      bRelaxMerit = g4.util.Converter.toBoolean(bRelaxMerit);
      remainTime = Math.abs(Number(remainTime));
      totalTime = Math.abs(Number(totalTime));
      var _loc6_ = getTimer();
      this.mc_buff_area.addBuff(id,amount,type,group,bRelaxMerit,iconImg,remainTime,totalTime,_loc6_);
   }
   function OnGame_Abnormality_UpdateBuff(id, group, stackCnt, useRelaxMerit, img, remain, total)
   {
      id = Number(id);
      group = Number(group);
      stackCnt = Number(stackCnt);
      useRelaxMerit = g4.util.Converter.toBoolean(useRelaxMerit);
      remain = Number(remain);
      total = Number(total);
      var _loc6_ = getTimer();
      this.mc_buff_area.updateBuff(id,group,stackCnt,useRelaxMerit,img,remain,total,_loc6_);
   }
   function OnGame_Abnormality_RemoveBuff(id, group)
   {
      id = Number(id);
      group = Number(group);
      this.mc_buff_area.removeBuff(id);
   }
   function OnGame_Abnormality_ClearBuff()
   {
      this.mc_buff_area.clearAllBuffs();
   }
   function OnGame_Abnormality_HoldBuff(id, group)
   {
      id = Number(id);
      group = Number(group);
      this.mc_buff_area.holdBuff(id,group);
   }
   function button_option_pressHandler(event)
   {
      this.startDragging();
   }
   function button_option_clickHandler(event)
   {
      this.stopDragging(true);
   }
   function button_option_releaseOutsideHandler(event)
   {
      this.stopDragging(false);
   }
   function customData_valueChangeHandler(event)
   {
      if(event.key == lib.gamedata.CustomizedUIDataKey.ABNORMALITY_ALIGN_TYPE)
      {
         this.setAlignmentType(Number(event.value));
      }
   }
   function model_mainUIModeChangeHandler(event)
   {
      this.updateByUIMode();
   }
}
