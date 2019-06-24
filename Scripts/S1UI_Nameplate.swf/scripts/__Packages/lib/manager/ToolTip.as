class lib.manager.ToolTip
{
   static var TOOL_TIP_TYPE_PREMIUM_WINDOW = 13;
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
      lib.manager.ToolTip.tooltiplist[String(tgmc)] = {tg:tgmc,val:val,type:type,iconhas:iconmc != undefined};
      if(tgmc && lib.manager.ToolTip.tooltipmodule.seletTarget.tg == tgmc)
      {
         lib.manager.ToolTip.tooltipmodule.showToolTip(lib.manager.ToolTip.tooltiplist[String(tgmc)]);
      }
      if(iconmc != undefined)
      {
         lib.manager.ToolTip.tooltiplist[String(tgmc)].ic = iconmc;
      }
   }
   static function link(val)
   {
      lib.manager.ToolTip.tooltipmodule.ToGame_ToolTip_RequestItemLink(val);
   }
   static function show(object, type, val)
   {
      lib.manager.ToolTip.tooltipmodule.DirectShow(object,type,val);
   }
   static function hide()
   {
      lib.manager.ToolTip.tooltipmodule.DirectHide();
   }
   static function move(x, y)
   {
      lib.manager.ToolTip.tooltipmodule.toolTipMove(x,y);
   }
   static function remove(tgmc)
   {
      var _loc1_ = lib.manager.ToolTip.tooltiplist[String(tgmc)];
      if(_loc1_ != undefined)
      {
         if(lib.manager.ToolTip.tooltipmodule.seletTarget == _loc1_)
         {
            lib.manager.ToolTip.tooltipmodule.DirectHide();
         }
         delete lib.manager.ToolTip.tooltiplist[String(tgmc)];
         lib.manager.ToolTip.refresh();
      }
   }
   static function clear()
   {
      lib.manager.ToolTip.tooltiplist = {};
   }
   static function refresh()
   {
      lib.manager.ToolTip.invalidateTooltipList();
   }
   static function invalidateTooltipList()
   {
      if(!lib.manager.ToolTip.instance)
      {
         lib.manager.ToolTip.instance = new lib.manager.ToolTip();
      }
      if(lib.manager.ToolTip.invalidationIntervalID)
      {
         return undefined;
      }
      lib.manager.ToolTip.invalidationIntervalID = setInterval(lib.manager.ToolTip.instance,"refreshNow",1);
   }
   function refreshNow()
   {
      clearInterval(lib.manager.ToolTip.invalidationIntervalID);
      delete lib.manager.ToolTip.invalidationIntervalID;
      for(var _loc2_ in lib.manager.ToolTip.tooltiplist)
      {
         var _loc1_ = lib.manager.ToolTip.tooltiplist[_loc2_];
         if(_loc1_.tg.enabled == undefined || _loc1_.iconhas && _loc1_.ic.enabled == undefined)
         {
            false;
         }
      }
   }
}
