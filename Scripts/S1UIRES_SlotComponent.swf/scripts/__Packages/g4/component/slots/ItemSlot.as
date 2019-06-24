class g4.component.slots.ItemSlot extends g4.component.slots.BasicSlot
{
   function ItemSlot()
   {
      super();
   }
   function configUI()
   {
      super.configUI();
      this._tf_amount = this.tf_amount;
      this._tf_amount.textAutoSize = "shrink";
      this._tf_enchant = this.tf_enchant;
      this._bitmapContainer = this.createEmptyMovieClip("bitmapContainer",0);
   }
   function setData(data)
   {
      super.setData(data);
      this._itemSloP = (g4.gameInterface.dataP.ItemSlotP)data;
   }
   function updateSlot()
   {
      this._tf_amount._visible = false;
      super.updateSlot();
      this._visible = true;
      if(this._bitmapContainer.iconPath != this._itemSloP.IconPath)
      {
         this._bitmapContainer.clear();
         lib.display.DrawBitmapData.draw(this._bitmapContainer,this._itemSloP.IconPath,2,2,0,0,34,34,0.54);
         this._bitmapContainer.iconPath = this._itemSloP.IconPath;
      }
      if(this._itemSloP.Amount > 0)
      {
         this._tf_amount._visible = true;
         this._tf_amount.text = String(this._itemSloP.Amount);
      }
      if(this._itemSloP.Enchant > 0)
      {
         var _loc4_ = 0 >= this._itemSloP.StateType?21433:3615811;
         if(11 < this._itemSloP.Enchant && this._itemSloP.Enchant < 15)
         {
            _loc4_ = 0 >= this._itemSloP.StateType?8915599:2299429;
         }
         else if(14 < this._itemSloP.Enchant)
         {
            _loc4_ = 0 >= this._itemSloP.StateType?10624002:4074792;
         }
         this._tf_enchant.text = "+" + this._itemSloP.Enchant;
         this._tf_enchant.shadowColor = _loc4_;
         this._tf_enchant._visible = true;
      }
      else
      {
         this._tf_enchant._visible = false;
      }
      if(this._itemSloP.StateType > 0)
      {
         var _loc5_ = ["","Slot_Disable","Slot_Impossible"];
         lib.display.DrawBitmapData.draw(this._bitmapContainer,flash.display.BitmapData.loadBitmap(_loc5_[this._itemSloP.StateType]),1,1,0,0,38,38,1);
         this._tf_amount.textColor = 14145495;
      }
      else
      {
         this._tf_amount.textColor = 7368816;
      }
      var _loc3_ = 0.6909090909090909;
      if(this._itemSloP.Grade > 0)
      {
         lib.display.DrawBitmapData.draw(this._bitmapContainer,flash.display.BitmapData.loadBitmap("IconGrade" + this._itemSloP.Grade),2,2,0,0,11,11,_loc3_);
      }
      if(this._itemSloP.Master > 0)
      {
         lib.display.DrawBitmapData.draw(this._bitmapContainer,flash.display.BitmapData.loadBitmap("Master" + this._itemSloP.Master),22,18,0,0,20,30,_loc3_);
      }
      if(this._itemSloP.SealType > 0)
      {
         lib.display.DrawBitmapData.draw(this._bitmapContainer,flash.display.BitmapData.loadBitmap("IconSeal" + this._itemSloP.SealType),11,6,0,0,20,28,_loc3_);
      }
      if(this._itemSloP.New)
      {
         lib.display.DrawBitmapData.draw(this._bitmapContainer,flash.display.BitmapData.loadBitmap("New"),0,0,0,0,38,38,1);
      }
      if(this._itemSloP.Durability > 0)
      {
         lib.display.DrawBitmapData.draw(this._bitmapContainer,flash.display.BitmapData.loadBitmap("Durability" + this._itemSloP.Durability),0,0,0,0,38,38,1);
      }
   }
}
