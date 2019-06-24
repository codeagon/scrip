class com.bluehole.tera.view.core.GradeIcon extends gfx.core.UIComponent
{
   var _grade = 0;
   var gradeChanged = false;
   function GradeIcon()
   {
      super();
   }
   function configUI()
   {
      super.configUI();
   }
   function draw()
   {
      super.draw();
      if(this.gradeChanged)
      {
         this.gradeChanged = false;
         this.setState(this._grade);
      }
   }
   function __get__grade()
   {
      return this._grade;
   }
   function __set__grade(value)
   {
      if(this._grade == value)
      {
         return undefined;
      }
      this._grade = value;
      this.gradeChanged = true;
      this.invalidate();
      return this.__get__grade();
   }
   function setState(value)
   {
      switch(value)
      {
         case com.bluehole.tera.contants.GradeType.GRADE_TYPE_NORMAL:
            this.gotoAndStop(com.bluehole.tera.contants.GradeType.GRADE_TYPE_NORMAL + 1);
            break;
         case com.bluehole.tera.contants.GradeType.GRADE_TYPE_RARE:
            this.gotoAndStop(com.bluehole.tera.contants.GradeType.GRADE_TYPE_RARE + 1);
            break;
         case com.bluehole.tera.contants.GradeType.GRADE_TYPE_LUXURY:
            this.gotoAndStop(com.bluehole.tera.contants.GradeType.GRADE_TYPE_LUXURY + 1);
            break;
         case com.bluehole.tera.contants.GradeType.GRADE_TYPE_REGENDARY:
            this.gotoAndStop(com.bluehole.tera.contants.GradeType.GRADE_TYPE_REGENDARY + 1);
            break;
         default:
            this.gotoAndStop(com.bluehole.tera.contants.GradeType.GRADE_TYPE_NORMAL + 1);
      }
   }
}
