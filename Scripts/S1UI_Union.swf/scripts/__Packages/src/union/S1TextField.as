class src.union.S1TextField
{
   function S1TextField()
   {
      this._textFormat = new TextFormat("$NormalFont",16,14145495,false,false,false,null,null,"left",5,5,0,0);
   }
   function create(target, name, txt, posX, posY, w, h)
   {
      if(posX == undefined)
      {
         posX = 0;
      }
      if(posY == undefined)
      {
         posY = 0;
      }
      if(w == undefined)
      {
         w = 1;
      }
      if(h == undefined)
      {
         h = 20;
      }
      if(txt == undefined)
      {
         txt = "";
      }
      var _loc2_ = (TextField)target[name];
      if(_loc2_ == undefined)
      {
         _loc2_ = target.createTextField(name,target.getNextHighestDepth(),posX,posY,w,h);
      }
      _loc2_.wordWrap = false;
      _loc2_.multiline = false;
      _loc2_.selectable = false;
      _loc2_.html = true;
      _loc2_.setNewTextFormat(this._textFormat);
      _loc2_.setText(txt);
      _loc2_.verticalAlign = "center";
      return _loc2_;
   }
   function __get__textFormat()
   {
      return this._textFormat;
   }
}
