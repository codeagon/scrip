class g4.view.chat.ChatUtil
{
   function ChatUtil()
   {
   }
   static function getActualScaleRatio()
   {
      return g4.util.UIUtil.getActualUIScaleRatio(g4.view.ViewID.CHAT_2);
   }
   static function convertScaledSize(value)
   {
      return value * g4.view.chat.ChatUtil.getActualScaleRatio();
   }
}
