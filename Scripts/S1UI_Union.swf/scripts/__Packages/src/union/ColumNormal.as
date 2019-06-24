class src.union.ColumNormal
{
   function ColumNormal(w, h, align, leftMargin, rightMargin)
   {
      this._instanceTextFd = new src.union.S1TextField();
      if(align != undefined)
      {
         this._instanceTextFd.__get__textFormat().align = align;
      }
      if(leftMargin != undefined)
      {
         this._instanceTextFd.__get__textFormat().leftMargin = leftMargin;
      }
      if(rightMargin != undefined)
      {
         this._instanceTextFd.__get__textFormat().rightMargin = rightMargin;
      }
      this._w = w;
      this._h = h;
   }
   function create(target, name, value, posX, posY, select)
   {
      if(select)
      {
         this._instanceTextFd.__get__textFormat().color = 8382235;
      }
      return this._instanceTextFd.create(target,name,value[0],posX,posY,this._w,this._h);
   }
}
