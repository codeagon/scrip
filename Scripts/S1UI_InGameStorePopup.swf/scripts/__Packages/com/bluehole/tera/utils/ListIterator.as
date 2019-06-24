class com.bluehole.tera.utils.ListIterator extends com.bluehole.tera.utils.Iterator
{
   function ListIterator(list)
   {
      super();
      this.list = list;
      list.addEventListener("added",this,"list_addedHandler");
      list.addEventListener("removed",this,"list_removedHandler");
      this.listArray = list.list;
      this.listLength = 0;
      if(this.listArray && this.listArray.length > 0)
      {
         this.listLength = this.listArray.length;
      }
      this.index = 0;
   }
   function hasNext()
   {
      return this.listLength > this.index;
   }
   function next()
   {
      if(this.listLength > 0 && this.index < this.listLength)
      {
         var _loc2_ = this.listArray[this.index];
         this.index = this.index + 1;
         return _loc2_;
      }
      return null;
   }
   function list_addedHandler(e)
   {
      this.listLength = this.listLength + 1;
   }
   function list_removedHandler(e)
   {
      var _loc2_ = Number(e.index);
      if(this.index && this.index >= 0)
      {
         if(this.index >= _loc2_)
         {
            this.index = this.index - 1;
         }
      }
   }
}
