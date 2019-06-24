class lib.gamedata.MapMarker implements lib.gamedata.GameData
{
   var id = undefined;
   var img = "Inven_0_TEX";
   var bRollOver = 0;
   var leftMargin = 0;
   var topMargin = 1;
   var depth = 0;
   function MapMarker(id)
   {
      if(typeof id == "object")
      {
         this.getPropInObject(id);
      }
      else
      {
         this.setId(id);
      }
   }
   function getId()
   {
      return this.id;
   }
   function setId(_id)
   {
      this.id = _id;
   }
   function getImg()
   {
      return this.img;
   }
   function setImg(_img)
   {
      this.img = _img;
   }
   function getOverImg()
   {
      return this.overImg;
   }
   function setOverImg(_img)
   {
      this.overImg = _img;
   }
   function getLeftMargin()
   {
      return this.leftMargin;
   }
   function setLeftMargin(margin)
   {
      this.leftMargin = margin;
   }
   function getTopMargin()
   {
      return this.topMargin;
   }
   function setTopMargin(margin)
   {
      this.topMargin = margin;
   }
   function getDepth()
   {
      return this.depth;
   }
   function setDepth(_depth)
   {
      this.depth = _depth;
   }
   function getRollOver()
   {
      return this.bRollOver;
   }
   function setRollOver(bTrue)
   {
      this.bRollOver = bTrue;
   }
   function updateData(dataObject)
   {
      this.getPropInObject(dataObject);
   }
   function getPropInObject(obj)
   {
      for(var _loc4_ in obj)
      {
         var _loc2_ = obj[_loc4_];
         if(_loc4_ == "id" || _loc4_ == "ID")
         {
            this.setId(_loc2_);
         }
         else if(_loc4_ == "img")
         {
            this.setImg(_loc2_);
         }
         else if(_loc4_ == "overImg")
         {
            this.setOverImg(_loc2_);
         }
         else if(_loc4_ == "leftMargin")
         {
            this.setLeftMargin(Number(_loc2_));
         }
         else if(_loc4_ == "topMargin")
         {
            this.setTopMargin(Number(_loc2_));
         }
         else if(_loc4_ == "depth")
         {
            this.setDepth(Number(_loc2_));
         }
         else if(_loc4_ == "rollOver" || _loc4_ == "bRollOver")
         {
            this.setRollOver(Number(_loc2_));
         }
      }
   }
}
