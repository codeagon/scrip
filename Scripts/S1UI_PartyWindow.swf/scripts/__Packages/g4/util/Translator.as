class g4.util.Translator
{
   static var secondText = "";
   static var minuteText = "";
   static var hourText = "";
   static var dayText = "";
   function Translator()
   {
   }
   static function init(secondText, minuteText, hourText, dayText)
   {
      g4.util.Translator.secondText = secondText;
      g4.util.Translator.minuteText = minuteText;
      g4.util.Translator.hourText = hourText;
      g4.util.Translator.dayText = dayText;
   }
   static function convertSecond(second)
   {
      if(second <= 60)
      {
         return second + g4.util.Translator.secondText;
      }
      if(second <= 3600)
      {
         return Math.floor(second / 60) + g4.util.Translator.minuteText;
      }
      if(second <= 86400)
      {
         return Math.floor(second / 3600) + g4.util.Translator.hourText;
      }
      return Math.floor(second / 86400) + g4.util.Translator.dayText;
   }
}
