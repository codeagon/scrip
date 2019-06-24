class lib.manager.ToolTip
{
   function ToolTip()
   {
   }
   static function init()
   {
      if(lib.manager.ToolTip.tooltiplist == undefined)
      {
         lib.manager.ToolTip.tooltiplist = {};
      }
   }
   static function add(tgmc, val, type, iconmc)
   {
      if(lib.manager.ToolTip.tooltiplist == undefined)
      {
         lib.manager.ToolTip.tooltiplist = {};
      }
      lib.Debuger.trace("::ToolTip ADD :: " + tgmc + "   " + val + "   " + type + "     " + iconmc + "   " + lib.manager.ToolTip.tooltipmodule);
      lib.manager.ToolTip.tooltiplist[String(tgmc)] = {tg:tgmc,val:val,type:type,iconhas:iconmc != undefined};
      if(iconmc != undefined)
      {
         lib.manager.ToolTip.tooltiplist[String(tgmc)].ic = iconmc;
      }
   }
   static function link(val)
   {
      lib.manager.ToolTip.tooltipmodule.ToGame_ToolTip_RequestItemLink(val);
   }
   static function remove(tgmc)
   {
      if(lib.manager.ToolTip.tooltiplist[String(tgmc)] != undefined)
      {
         delete lib.manager.ToolTip.tooltiplist[String(tgmc)];
      }
   }
   static function clear()
   {
      lib.manager.ToolTip.tooltiplist = {};
   }
   static function refresh()
   {
      for(var _loc2_ in lib.manager.ToolTip.tooltiplist)
      {
         var _loc1_ = lib.manager.ToolTip.tooltiplist[_loc2_];
         if(_loc1_.tg.enabled == undefined)
         {
            false;
         }
         else if(_loc1_.iconhas && _loc1_.ic.enabled == undefined)
         {
            false;
         }
      }
   }
}
