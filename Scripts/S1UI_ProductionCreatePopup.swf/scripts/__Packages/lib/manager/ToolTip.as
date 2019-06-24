class lib.manager.ToolTip
{
   static var TOOL_TIP_TYPE_PREMIUM_WINDOW = 13;
   static var TOOL_TIP_TYPE_DELIVERY = 14;
   function ToolTip()
   {
   }
   static function add(tgmc, val, type, iconmc)
   {
      g4.manager.TooltipManager.getInstance().add(tgmc,val,type,iconmc);
   }
   static function show(object, type, val)
   {
      g4.manager.TooltipManager.getInstance().show(object,type,val);
   }
   static function hide()
   {
      g4.manager.TooltipManager.getInstance().hide();
   }
   static function move(x, y)
   {
      g4.manager.TooltipManager.getInstance().move(x,y);
   }
   static function remove(tgmc)
   {
      g4.manager.TooltipManager.getInstance().remove(tgmc);
   }
}
