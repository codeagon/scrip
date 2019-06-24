class g4.view.tooltip.ToolTip_EPGroup extends MovieClip
{
   function ToolTip_EPGroup()
   {
      super();
      this.epFont0 = "<font color=\'#8A1013\'>[" + lib.util.UIString.getUIString("$670023") + "]</font>";
      this.epFont1 = "<font color=\'#9B4E0C\'>[" + lib.util.UIString.getUIString("$670024") + "]</font>";
      this.epFont2 = "<font color=\'#C5C441\'>[" + lib.util.UIString.getUIString("$670025") + "]</font>";
      this.epFont3 = "<font color=\'#1A7219\'>[" + lib.util.UIString.getUIString("$670026") + "]</font>";
      this.epFont4 = "<font color=\'#19527F\'>[" + lib.util.UIString.getUIString("$670027") + "]</font>";
      this.epFont5 = "<font color=\'#6829A8\'>[" + lib.util.UIString.getUIString("$670028") + "]</font>";
      this.epFont6 = "<font color=\'#A6A6A6\'>[" + lib.util.UIString.getUIString("$670029") + "]</font>";
      this.epFontArr = [this.epFont0,this.epFont1,this.epFont2,this.epFont3,this.epFont4,this.epFont5,this.epFont6];
      this.epFontArr2 = ["","$670030","$670031","$670032","$670033"];
   }
   function setData($text, $infoD, $skillData)
   {
      this.mainTxt.htmlText = $text;
      this.txt1._visible = Boolean($infoD[5]);
      var _loc7_ = Number($infoD[1]) + 1;
      if(Number($infoD[1]) > 0)
      {
         this.txt0.text = $infoD[0] + " " + $infoD[1] + lib.util.UIString.getUIString("$670020");
         this.txt1.text = lib.util.UIString.getUIString("$670034","count",_loc7_);
      }
      else
      {
         this.txt0.text = $infoD[0];
         this.txt1.text = lib.util.UIString.getUIString("$670034","count","1");
      }
      var _loc5_ = Number($infoD[3]);
      var _loc4_ = Number($infoD[4]);
      this.colorMc.gotoAndStop(_loc5_ + 1);
      this.typeMc.gotoAndStop(_loc4_ + 1);
      this.typeMc2.gotoAndStop(_loc4_ + 1);
      this.txt3.htmlText = this.epFontArr[_loc5_];
      this.txt3._width = this.txt3.textWidth + 4;
      this.txt4.text = this.epFontArr2[_loc4_];
      this.txt4._width = this.txt4.textWidth + 4;
      var _loc2_ = 10;
      if($skillData)
      {
         var _loc6_ = lib.util.ExtString.split($skillData,"\t");
         this.txt2.text = _loc6_[0];
         lib.display.DrawBitmapData.draw(this,_loc6_[1],8,128,0,0,24,24,0.375);
         _loc2_ = _loc2_ + (this.txt2.textWidth + 32);
      }
      this.txt3._x = _loc2_;
      _loc2_ = _loc2_ + (this.txt3._width + 10);
      this.typeMc2._x = _loc2_;
      _loc2_ = _loc2_ + 22;
      this.txt4._x = _loc2_;
   }
}
