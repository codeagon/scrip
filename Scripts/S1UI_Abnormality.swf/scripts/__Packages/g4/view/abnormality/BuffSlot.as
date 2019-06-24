class g4.view.abnormality.BuffSlot extends g4.core.SimpleView
{
   var COOLTIME_SIZE = 30;
   var COOLTIME_COLOR = 0;
   var COOLTIME_ALPHA = 50;
   var ICON_SIZE = 28;
   var warningVisible = false;
   function BuffSlot(targetMovieClip)
   {
      super(targetMovieClip);
      this.slot = (lib.util.Slot)targetMovieClip;
      this.configUI();
   }
   function configUI()
   {
      this.mc_hit_area = this.__get__targetMovieClip().SLOT;
      this.mc_frame = this.__get__targetMovieClip().frame_mc;
      this.mc_icon = this.__get__targetMovieClip().Icon;
      this.text_coolTime = this.__get__targetMovieClip().Count.txt;
      this.mc_coolTime = this.__get__targetMovieClip().CoolTime;
      this.text_count = this.__get__targetMovieClip().stack;
      g4.util.UIUtil.setMouseEnabled(this.mc_frame,false);
      g4.util.UIUtil.setMouseEnabled(this.mc_icon,false);
      g4.util.UIUtil.setMouseEnabled(this.__get__targetMovieClip().Count,false);
      g4.util.UIUtil.setMouseEnabled(this.text_coolTime,false);
      g4.util.UIUtil.setMouseEnabled(this.mc_coolTime,false);
      g4.util.UIUtil.setMouseEnabled(this.text_count,false);
      g4.util.UIUtil.setTextFieldStyle(this.text_coolTime,g4.util.UIUtil.TEXT_FIELD_STYLE_1);
      g4.util.UIUtil.setTextFieldStyle(this.text_count,g4.util.UIUtil.TEXT_FIELD_STYLE_1);
      this.slot.__set__drag(false);
      this.coolTime = new g4.util.CoolTime(gfx.utils.Delegate.create(this,this.coolTime_updateHandler),gfx.utils.Delegate.create(this,this.coolTime_completeHandler));
      this.cleanUp();
   }
   function cleanUp()
   {
      this.id = -1;
      this.stackCnt = 0;
      this.type = -1;
      this.img = null;
      this.remain = -1;
      this.total = -1;
      this.startTime = -1;
      this.timePaused = false;
      this.__get__targetMovieClip()._visible = false;
      this.setCount(0);
      this.coolTime.cleanUp();
      this.setCoolTimeText("");
      this.mc_coolTime.clear();
      this.stopWarning();
   }
   function startWarning()
   {
      if(this.timePaused)
      {
         return undefined;
      }
      if(this.warningVisible)
      {
         return undefined;
      }
      this.warningVisible = true;
      lib.util.Warning.add(this.__get__targetMovieClip());
   }
   function stopWarning()
   {
      if(!this.warningVisible)
      {
         return undefined;
      }
      this.warningVisible = false;
      lib.util.Warning.remove(this.__get__targetMovieClip(),true);
      this.__get__targetMovieClip()._alpha = 100;
   }
   function setCount(value)
   {
      if(isNaN(value) || value == 0 || value == 1)
      {
         this.text_count.text = "";
      }
      else
      {
         var _loc3_ = 0;
         if(value < 0)
         {
            _loc3_ = 13369345;
         }
         else if(value > 1)
         {
            _loc3_ = 16777215;
         }
         this.text_count.textColor = _loc3_;
         this.text_count.text = String(value);
      }
   }
   function setCoolTimeText(value)
   {
      this.text_coolTime.text = value;
   }
   function setData(data)
   {
      var _loc3_ = false;
      if(data.id != this.id)
      {
         this.cleanUp();
         this.id = data.id;
         _loc3_ = true;
      }
      var _loc5_ = false;
      if(_loc3_ || data.img != this.img)
      {
         this.img = data.img;
         _loc5_ = true;
         this.slot.draw(this.img,this.ICON_SIZE,this.ICON_SIZE);
      }
      var _loc4_ = false;
      if(_loc3_ || data.timePaused != this.timePaused)
      {
         this.timePaused = data.timePaused;
         this.coolTime.setTimePaused(this.timePaused);
         if(this.timePaused)
         {
            this.stopWarning();
         }
         _loc4_ = true;
      }
      if(_loc3_ || data.type != this.type)
      {
         this.type = data.type;
         _loc4_ = true;
      }
      if(_loc4_)
      {
         if(this.timePaused)
         {
            this.mc_frame.gotoAndStop(3);
         }
         else if(this.isBuff(this.type))
         {
            this.mc_frame.gotoAndStop(1);
         }
         else
         {
            this.mc_frame.gotoAndStop(2);
         }
      }
      if(_loc3_ || data.stackCnt != this.stackCnt)
      {
         this.stackCnt = data.stackCnt;
         this.setCount(this.stackCnt);
      }
      if(_loc3_ || data.remain != this.remain || data.total != this.total || data.startTime != this.startTime)
      {
         this.remain = data.remain;
         this.total = data.total;
         this.startTime = data.startTime;
         this.coolTime.setLived(false);
         this.setCoolTimeText("");
         this.mc_coolTime.clear();
         this.stopWarning();
         if(this.total > 0)
         {
            var _loc8_ = getTimer();
            var _loc6_ = this.startTime + this.total - _loc8_;
            this.coolTime.setCoolTime(_loc6_,this.total);
         }
      }
      if(_loc5_)
      {
         var _loc7_ = this.img.substring(20);
         lib.manager.ToolTip.add(this.mc_hit_area,_loc7_,4);
      }
   }
   function isBuff(type)
   {
      return type == 0;
   }
   function remove()
   {
      this.setCoolTimeText("");
      this.mc_coolTime.clear();
      this.startWarning();
   }
   function updateCoolTime()
   {
      this.setCoolTimeText(this.coolTime.getRemainTimeText());
      this.drawCoolTime(this.coolTime.getDegree());
      if(this.coolTime.getRemainTimeSecond() <= g4.view.abnormality.AbnormalityConstants.COOLTIME_WARNING_SEC)
      {
         this.startWarning();
      }
   }
   function drawCoolTime(degree)
   {
      g4.util.CoolTime.draw(this.mc_coolTime,this.COOLTIME_SIZE,this.COOLTIME_SIZE,degree,this.COOLTIME_COLOR,this.COOLTIME_ALPHA,true);
   }
   function coolTime_updateHandler()
   {
      this.updateCoolTime();
   }
   function coolTime_completeHandler()
   {
      this.remove();
   }
}
