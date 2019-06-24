class g4.view.namePlate.NamePlate implements g4.gameInterface.INamePlate
{
   var TOPFONTSIZE = 18;
   var BOOTOOMFONTSIZE = 15;
   var TEXTURE_WIDTH = 512;
   var FONTSIZES0 = 18;
   var FONTSIZES1 = 20;
   var FONTSIZES2 = 14;
   function NamePlate(movieClip)
   {
      super();
      this.movieClip = movieClip;
      this.nameFd = movieClip.nameFd;
      this.nameFd2 = movieClip.nameFd2;
      this.configUI();
   }
   function configUI()
   {
      _global.gfxExtensions = true;
      this.nameFd.verticalAlign = "bottom";
      this.nameFd.noTranslate = true;
      this.nameFd2.verticalAlign = "bottom";
      this.nameFd2.noTranslate = true;
      this.movieClip.OnGame_NamePlate_SetPcName = gfx.utils.Delegate.create(this,this.OnGame_NamePlate_SetPcName);
      this.movieClip.OnGame_NamePlate_GetPosition = gfx.utils.Delegate.create(this,this.OnGame_NamePlate_GetPosition);
      this.movieClip.OnGame_NamePlate_SetName = gfx.utils.Delegate.create(this,this.OnGame_NamePlate_SetName);
      this.movieClip.OnGame_NamePlate_SetCastleName = gfx.utils.Delegate.create(this,this.OnGame_NamePlate_SetCastleName);
   }
   function generateFontTag(text, color, size)
   {
      return "<font size=\"" + size + "\" color=\"" + color + "\">" + text + "</font>";
   }
   function OnGame_NamePlate_SetPcName(topIcon, bottomIcon, titleName, pcName, guildName)
   {
      var _loc10_ = lib.util.ExtString.split(titleName,"\t");
      var _loc12_ = lib.util.ExtString.split(pcName,"\t");
      var _loc11_ = lib.util.ExtString.split(guildName,"\t");
      var _loc6_ = "";
      var _loc5_ = -17;
      if(_loc10_[0] != "" && _loc10_[0] != undefined)
      {
         _loc6_ = _loc6_ + this.generateFontTag(_loc10_[0],_loc10_[1],18);
      }
      if(_loc12_[0] != "" && _loc12_[0] != undefined)
      {
         if(_loc6_.length > 0)
         {
            _loc6_ = _loc6_ + "<br />";
         }
         _loc6_ = _loc6_ + this.generateFontTag(_loc12_[0],_loc12_[1],20);
      }
      if(_loc11_[0] != "" && _loc11_[0] != undefined)
      {
         if(_loc6_.length > 0)
         {
            _loc6_ = _loc6_ + "<br />";
         }
         _loc6_ = _loc6_ + this.generateFontTag(_loc11_[0],_loc11_[1],14);
      }
      else
      {
         _loc5_ = 3;
      }
      _loc6_ = lib.util.ExtString.replace(_loc6_,"\r","");
      this.nameFd.htmlText = _loc6_;
      var _loc14_ = 60;
      var _loc22_ = this.nameFd.textWidth + _loc14_;
      var _loc23_ = (this.TEXTURE_WIDTH - _loc22_) / 2;
      var _loc4_ = _loc23_ + _loc14_;
      this.nameFd._x = _loc4_;
      this.movieClip.clear();
      var _loc7_ = false;
      var _loc3_ = lib.util.ExtString.split(topIcon,"\t");
      var _loc2_ = undefined;
      var _loc8_ = _loc3_.length;
      _loc2_ = 0;
      while(_loc2_ < _loc8_)
      {
         if(_loc3_[_loc2_] != "" && _loc3_[_loc2_] != undefined)
         {
            _loc7_ = true;
            lib.display.DrawBitmapData.draw(this.movieClip,_loc3_[_loc2_],_loc4_ - (_loc2_ + 1) * 33,_loc5_,0,0,30,30,0.937);
         }
         _loc2_ = _loc2_ + 1;
      }
      var _loc18_ = 0.609;
      var _loc16_ = 39;
      var _loc20_ = -45;
      var _loc19_ = 30;
      var _loc21_ = 0;
      var _loc15_ = lib.util.ExtString.split(bottomIcon,"\t");
      var _loc9_ = _loc15_[0];
      var _loc17_ = _loc15_[1];
      var _loc13_ = _loc15_[2];
      if(_loc17_ != "" && _loc17_ != undefined)
      {
         if(_loc13_ != "" && _loc13_ != undefined)
         {
            _loc18_ = 0.5;
            _loc16_ = 32;
            _loc20_ = -42;
            _loc19_ = 33;
            _loc21_ = -9;
            lib.display.DrawBitmapData.draw(this.movieClip,_loc13_,_loc4_ - 53,_loc5_ + 25,0,0,54,54,0.5);
         }
         _loc7_ = true;
         lib.display.DrawBitmapData.draw(this.movieClip,_loc17_,_loc4_ + _loc20_,_loc5_ + _loc19_,0,0,_loc16_,_loc16_,_loc18_);
         if(_loc9_ != "" && _loc9_ != undefined)
         {
            lib.display.DrawBitmapData.draw(this.movieClip,_loc9_,_loc4_ - 64 + _loc21_,_loc5_ + 29,0,0,19,39,0.609);
         }
      }
      else if(_loc9_ != "" && _loc9_ != undefined)
      {
         _loc7_ = true;
         lib.display.DrawBitmapData.draw(this.movieClip,_loc9_,_loc4_ - 27,_loc5_ + 29,0,0,19,39,0.609);
      }
      if(!_loc7_)
      {
         this.nameFd._x = this.nameFd._x - _loc14_ / 2;
      }
      this.nameFd2._visible = false;
      this.nameFd._visible = true;
   }
   function OnGame_NamePlate_GetPosition()
   {
      var _loc3_ = this.nameFd.getLineMetrics(0);
      var _loc2_ = this.nameFd._y + this.nameFd._height - this.nameFd.textHeight - 4 + 58;
      return this.nameFd._x + "\t" + _loc2_ + "\t" + _loc3_.width;
   }
   function OnGame_NamePlate_SetName()
   {
      this.movieClip.clear();
      var _loc6_ = "";
      var _loc4_ = undefined;
      var _loc7_ = arguments.length;
      _loc4_ = 0;
      while(_loc4_ < _loc7_)
      {
         if(!(arguments[_loc4_] == null || arguments[_loc4_] == ""))
         {
            var _loc3_ = lib.util.ExtString.split(arguments[_loc4_],"\t");
            var _loc5_ = _loc3_[0].indexOf("{@img:",0);
            if(_loc5_ != -1 && _loc5_ != undefined)
            {
               _loc3_[0] = lib.util.ExtString.replace(_loc3_[0],"{@img:","<img src=\'");
               _loc3_[0] = lib.util.ExtString.replace(_loc3_[0],"}","\' width=\'23\' height=\'23\' vspace=\'3\'>");
            }
            _loc6_ = _loc6_ + ("<font color=\'" + _loc3_[1] + "\'>" + _loc3_[0] + "</font><br />");
         }
         _loc4_ = _loc4_ + 1;
      }
      _loc6_ = lib.util.ExtString.replace(_loc6_,"\r","");
      this.nameFd._visible = false;
      this.nameFd2._visible = true;
      this.nameFd2.htmlText = _loc6_;
   }
   function OnGame_NamePlate_SetCastleName(guildIcon, guildName, pcName)
   {
      this.movieClip.clear();
      var _loc3_ = 64;
      var _loc7_ = 224;
      var _loc6_ = -30;
      lib.display.DrawBitmapData.draw(this.movieClip,guildIcon,_loc7_,_loc6_,0,0,_loc3_,_loc3_,1);
      var _loc5_ = lib.util.ExtString.split(pcName,"\t");
      var _loc4_ = lib.util.ExtString.split(guildName,"\t");
      var _loc2_ = "";
      _loc2_ = _loc2_ + ("<font size=\'24\' color=\'" + _loc5_[1] + "\'>" + _loc5_[0] + "</font><br />");
      _loc2_ = _loc2_ + ("<font size=\'16\' color=\'" + _loc4_[1] + "\'>" + _loc4_[0] + "</font>");
      _loc2_ = lib.util.ExtString.replace(_loc2_,"\r","");
      this.nameFd._visible = false;
      this.nameFd2._visible = true;
      this.nameFd2.htmlText = _loc2_;
      this.nameFd2._y = 0;
   }
}
