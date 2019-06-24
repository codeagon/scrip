class lib.controls.S_DragScale extends MovieClip
{
   var UIName = "";
   var S_DragScale_Test = "S_DragScale_Test???? ";
   var scale_before_position_x = 0;
   var scale_before_position_y = 0;
   var scale_save = 0;
   var scale_orign = 1;
   static var test = "test!!!!!!!!!!!!!!!!!!!!";
   function S_DragScale()
   {
      super();
      this._instance = this;
      this.stage_w = Stage.width;
      this.stage_h = Stage.height;
   }
   function test1()
   {
   }
   function scaleExpanderEventCheck(_ui, _uistr)
   {
      this.UI = _ui;
      this.UIName = _uistr.toUpperCase();
      this.UI.scaleExpander._x = this.UI.hit._width - 18;
      this.UI.scaleExpander._y = this.UI.hit._height - 21;
      this.UI.container_mc.hit._width = this.UI.hit._width;
      this.UI.container_mc.hit._height = this.UI.hit._height;
      this.UI.container_mc.scaleExpander2._x = this.UI.container_mc.hit._width - 18;
      this.UI.container_mc.scaleExpander2._y = this.UI.container_mc.hit._height - 21;
      this.UI["img://__S1UIRES_Emblem.Emblem_" + _uistr];
      this.realObj_originWidth = this.UI.container_mc._width;
      this.realObj_originHeight = this.UI.container_mc._height;
      this.realObj_centerX = this.UI.container_mc._width / 1 + this.UI.container_mc._x;
      this.realObj_centerY = this.UI.container_mc._height / 1 + this.UI.container_mc._y;
      this.scale_before_position_x = this.UI.container_mc._width;
      this.scale_before_position_y = this.UI.container_mc._height;
      this.UI_width_orign = this.scale_before_position_x - this.UI.hit._width;
      this.UI_height_orign = this.scale_before_position_y - this.UI.hit._height;
      this.customizeData = lib.gamedata.CustomizedUIDataCollection.getInstance();
      var UIs = this.UI;
      var UINames = this.UIName;
      var realObj_originWidths = this.realObj_originWidth;
      var realObj_originHeights = this.realObj_originHeight;
      var realObj_centerXs = this.realObj_centerX;
      var realObj_centerYs = this.realObj_centerY;
      var scale_before_position_xs = this.scale_before_position_x;
      var scale_before_position_ys = this.scale_before_position_y;
      var scale_saves = this.scale_save;
      var scale_origns = this.scale_orign;
      var UI_width_origns = this.UI_width_orign;
      var _loc9_ = this.UI_height_orign;
      var UI_Emblems = this.UI["img://__S1UIRES_Emblem.Emblem_" + _uistr];
      UI_Emblems._x = 0;
      var customizeDatas = this.customizeData;
      var _loc8_ = this.stage_w;
      var _loc7_ = this.stage_h;
      var stage_cover_x;
      var stage_cover_y;
      stage_cover_x = Number(UIs._x) + Number(UIs.hit._width) * (UIs._xscale / 100);
      stage_cover_y = Number(UIs._y) + Number(UIs.hit._height) * (UIs._xscale / 100);
      var _loc3_ = _root.GetRegisterUIData(UINames);
      var ScaleCustom = 1;
      if(_loc3_.ScaleCustom)
      {
         ScaleCustom = Number(_loc3_.ScaleCustom) / Number(lib.gamedata.DefaultData.getDefaultUIData("uiscale").param0);
      }
      if(UIs._xscale >= 138)
      {
         if(stage_cover_y > 1080)
         {
            if(lib.info.AlignInfo["SCALE_" + UINames + "_PERCENT"] < 100)
            {
               lib.info.AlignInfo["SCALE_" + UINames + "_PERCENT"] = 80;
            }
            else
            {
               lib.info.AlignInfo["SCALE_" + UINames + "_PERCENT"] = 100;
            }
         }
      }
      customizeDatas.saveData(lib.gamedata.CustomizedUIDataKey["UISCALE_" + UINames + "_PERCENT"],Math.round(lib.info.AlignInfo["SCALE_" + UINames + "_PERCENT"]),true);
      this._instance.expander.onRollOver = function()
      {
         UIs.container_mc.scaleExpander2.expander2.gotoAndStop(2);
      };
      this._instance.expander.onRollOut = this._instance.expander.onReleaseOutside = function()
      {
         UIs.container_mc.scaleExpander2.expander2.gotoAndStop(1);
      };
      this._instance.expander.onPress = function()
      {
         scale_origns = lib.info.AlignInfo["SCALE_" + UINames + "_PERCENT"] * lib.info.AlignInfo.scaleRatio * ScaleCustom;
         scale_before_position_xs = UIs.container_mc._width;
         scale_before_position_ys = UIs.container_mc._height;
         this.onEnterFrame = null;
         this.onEnterFrame = function()
         {
            this._parent._x = UIs._xmouse / 1;
            this._parent._y = UIs._xmouse / 1;
            UIs.container_mc._width = (this._parent._x + 10 - realObj_centerXs) * 1 + realObj_originWidths + UI_width_origns;
            UIs.container_mc._height = (this._parent._y + 10 - realObj_centerYs) * 1 + realObj_originHeights + UI_width_origns;
            scale_saves = UIs.container_mc._width / scale_before_position_xs * UIs._xscale;
            var _loc2_ = Math.round(scale_saves / (lib.info.AlignInfo.scaleRatio * ScaleCustom));
            scale_saves = _loc2_ * (lib.info.AlignInfo.scaleRatio * ScaleCustom);
            UIs.container_mc._width = scale_before_position_xs;
            UIs.container_mc._height = scale_before_position_ys;
            UIs._xscale = scale_saves;
            UIs._yscale = scale_saves;
            UI_Emblems._xscale = 100;
            UI_Emblems._yscale = 100;
            UI_Emblems._y = -80;
            this.onRelease = this.onReleaseOutside = function()
            {
               this.onEnterFrame = null;
               UIs.container_mc.scaleExpander2.expander2.gotoAndStop(1);
               this._parent._x = UIs.hit._width - 18;
               this._parent._y = UIs.hit._height - 21;
               lib.info.AlignInfo["SCALE_" + UINames + "_PERCENT"] = Math.round(UIs._xscale / (lib.info.AlignInfo.scaleRatio * ScaleCustom));
               var _loc2_ = lib.info.AlignInfo.uiScaleLimit(UIs._xscale / 100);
               if(UIs._xscale >= 150 * ScaleCustom)
               {
                  lib.info.AlignInfo["SCALE_" + UINames + "_PERCENT"] = 187;
               }
               if(UIs._xscale <= 50 * ScaleCustom)
               {
                  lib.info.AlignInfo["SCALE_" + UINames + "_PERCENT"] = 63;
               }
               UIs._xscale = UIs._yscale = _loc2_ * 100;
               customizeDatas.saveData(lib.gamedata.CustomizedUIDataKey["UISCALE_" + UINames + "_PERCENT"],Math.round(lib.info.AlignInfo["SCALE_" + UINames + "_PERCENT"]),true);
               stage_cover_x = Number(UIs._x) + Number(UIs.hit._width) * (UIs._xscale / 100);
               stage_cover_y = Number(UIs._y) + Number(UIs.hit._height) * (UIs._xscale / 100);
               if(UIs._xscale >= 138 * ScaleCustom)
               {
                  if(stage_cover_y > 1080)
                  {
                     if(lib.info.AlignInfo["SCALE_" + UINames + "_PERCENT"] < 100)
                     {
                        lib.info.AlignInfo["SCALE_" + UINames + "_PERCENT"] = 80;
                     }
                     else
                     {
                        lib.info.AlignInfo["SCALE_" + UINames + "_PERCENT"] = 100;
                     }
                  }
                  customizeDatas.saveData(lib.gamedata.CustomizedUIDataKey["UISCALE_" + UINames + "_PERCENT"],Math.round(lib.info.AlignInfo["SCALE_" + UINames + "_PERCENT"]),true);
               }
            };
         };
      };
   }
}
