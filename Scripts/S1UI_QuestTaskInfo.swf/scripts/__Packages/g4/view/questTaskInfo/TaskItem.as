class g4.view.questTaskInfo.TaskItem extends MovieClip
{
   function TaskItem()
   {
      super();
   }
   function resetData()
   {
      this.isQuestComplete = false;
      this.taskName = null;
      this.taskCurrent = -1;
      this.taskMax = -1;
      this.isFail = false;
   }
   function onLoad()
   {
   }
   function setData($data)
   {
      if(this.taskName != null && this.taskName == $data[0])
      {
         if(this.taskCurrent != Number($data[1]))
         {
            this.animStep = 0;
            this.playAnim();
         }
      }
      else
      {
         this.taskName = $data[0];
      }
      this.taskCurrent = Number($data[1]);
      this.taskMax = Number($data[2]);
      this.isFail = Number($data[3]) == 1;
      this.checkTextColor();
   }
   function checkTextColor()
   {
      if(this.textField != null)
      {
         this.textField.removeTextField();
      }
      var _loc6_ = this.getNextHighestDepth();
      this.textField = this.createTextField("textField",_loc6_,0,0,190,22);
      this.textField.multiline = true;
      this.textField.selectable = false;
      this.textField.border = false;
      this.textField.type = "dynamic";
      this.textField.background = false;
      this.textField.wordWrap = true;
      var _loc5_ = new TextFormat("$BasicFont",12,16777215,false,false,false,null,null,"left",0,0,0,0);
      _loc5_.align = "left";
      this.textField.setNewTextFormat(_loc5_);
      g4.util.UIUtil.setTextFieldStyle(this.textField,g4.util.UIUtil.TEXT_FIELD_STYLE_1);
      this.textField.styleSheet = new TextField.StyleSheet();
      var _loc2_ = lib.info.TextColor.UI_QUESTINFO_SHORT;
      var _loc4_ = this.taskName;
      if(this.isQuestComplete)
      {
         _loc2_ = lib.info.TextColor.FILL_FULL;
      }
      else if(this.isFail)
      {
         _loc2_ = lib.info.TextColor.GENERAL_IMPOSSIBLE;
      }
      else if(this.taskCurrent == 0 && this.taskMax == 0)
      {
         _loc2_ = lib.info.TextColor.UI_QUESTINFO_SHORT;
      }
      else if(this.taskCurrent == 1 && (this.taskMax == 0 || this.taskMax == 1))
      {
         _loc2_ = lib.info.TextColor.UI_QUESTINFO_FULL;
      }
      else if(this.taskMax > 1)
      {
         _loc4_ = this.taskName + " &lt;" + this.taskCurrent + "/" + this.taskMax + "&gt;";
         if(this.taskCurrent == this.taskMax)
         {
            _loc2_ = lib.info.TextColor.UI_QUESTINFO_FULL;
         }
         else
         {
            _loc2_ = lib.info.TextColor.UI_QUESTINFO_SHORT;
         }
      }
      if(this.taskName.charAt(0) == "<" && this.taskName.charAt(this.taskName.length - 1) == ">")
      {
         this.textField.htmlText = "<img src=\'icon_location\' vspace=\'-4\'>" + _loc4_;
         var _loc3_ = new TextField.StyleSheet();
         _loc3_.setStyle("a",{color:"#FFFFFF",textDecoration:"underline"});
         _loc3_.setStyle("a:hover",{color:"#FF9D5E",textDecoration:"underline",cursor:"pointer"});
         this.textField.styleSheet = _loc3_;
         this.textField.hitTestDisable = false;
         this.textField.html = true;
      }
      else
      {
         this.textField.htmlText = _loc4_;
         this.textField.html = false;
      }
      this.textField.textColor = _loc2_;
      this.textField._height = Math.round(this.textField.textHeight + 4);
   }
   function playAnim()
   {
      g4.util.TweenX.killTweenOf(this);
      switch(this.animStep)
      {
         case 0:
         case 2:
         case 4:
            g4.util.TweenX.to(this,0.3,{_alpha:0},gs.easing.Linear.easeNone,this);
            break;
         case 1:
         case 3:
            g4.util.TweenX.to(this,0.3,{_alpha:100},gs.easing.Linear.easeNone,this);
            break;
         case 5:
            g4.util.TweenX.to(this,0.3,{_alpha:100},gs.easing.Linear.easeNone);
            this.animStep = 0;
      }
   }
   function onComplete()
   {
      this.animStep = this.animStep + 1;
      this.playAnim();
   }
}
