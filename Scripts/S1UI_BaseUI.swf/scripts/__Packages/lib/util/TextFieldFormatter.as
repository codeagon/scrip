class lib.util.TextFieldFormatter
{
   function TextFieldFormatter()
   {
   }
   static function setShadow(targetTF, shadowColor, shadowBlurSize, shadowStength, shadowDistance, shadowAngle)
   {
      targetTF.shadowColor = shadowColor != undefined?shadowColor:0;
      targetTF.shadowBlurX = shadowBlurSize != undefined?shadowBlurSize:1.7;
      targetTF.shadowBlurY = shadowBlurSize != undefined?shadowBlurSize:1.7;
      targetTF.shadowStrength = shadowStength != undefined?shadowStength:10;
      targetTF.shadowDistance = shadowDistance != undefined?shadowDistance:0;
      targetTF.shadowAngle = shadowAngle != undefined?shadowAngle:90;
   }
   static function setFont(targetTF, fontName, fontColor, fontSize)
   {
      var _loc1_ = targetTF.getNewTextFormat();
      _loc1_.font = fontName != undefined?fontName:"$ChatFont";
      _loc1_.color = fontColor != undefined?fontColor:16777215;
      _loc1_.size = fontSize != undefined?fontSize:18;
      targetTF.setNewTextFormat(_loc1_);
   }
   static function setAlign(targetTF, align, leading, indent, leftMargin, rightMargin)
   {
      var _loc1_ = targetTF.getNewTextFormat();
      _loc1_.align = align != undefined?align:"left";
      _loc1_.leading = leading != undefined?leading:6;
      _loc1_.indent = indent != undefined?indent:0;
      _loc1_.leftMargin = leftMargin != undefined?leftMargin:0;
      _loc1_.rightMargin = rightMargin != undefined?rightMargin:0;
      targetTF.setNewTextFormat(_loc1_);
   }
   static function setStyle(targetTF, styleName)
   {
      if(styleName == undefined || styleName == "default")
      {
         lib.util.TextFieldFormatter.setShadow(targetTF);
         lib.util.TextFieldFormatter.setFont(targetTF);
         lib.util.TextFieldFormatter.setAlign(targetTF);
         targetTF.selectable = false;
         targetTF.wordWrap = true;
         targetTF.type = "dynamic";
         targetTF.multiline = true;
         targetTF.html = true;
         targetTF.antiAliasType = "normal";
         targetTF._width = 255;
      }
      else if(styleName == "chat")
      {
      }
   }
   static function setShadowStyle(targetTF, styleName)
   {
   }
   static function setFontStyle(targetTF, styleName)
   {
   }
   static function setAlignStyle(targetTF, styleName)
   {
   }
}
