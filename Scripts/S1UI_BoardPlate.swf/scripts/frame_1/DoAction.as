function OnGame_BoardPlate_SetData(str, single)
{
   nameTxt.htmlText = str;
   nameTxt.multiline = single != "1";
   nameTxt.wordWrap = single != "1";
   if(single == "1")
   {
      nameTxt.textAutoSize = "shrink";
   }
   else
   {
      nameTxt.textAutoSize = "none";
   }
}
_global.gfxExtensions = true;
nameTxt.verticalAlign = "center";
nameTxt.noTranslate = true;
