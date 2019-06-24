class com.bluehole.tera.utils.List
{
   function List()
   {
      this.list = [];
   }
   function __get__iterator()
   {
      return new com.bluehole.tera.utils.ListIterator(this.list);
   }
   function add(item)
   {
      var _loc2_ = this.list.length - 1;
      while(_loc2_ >= 0)
      {
         if(this.list[_loc2_] == item)
         {
            this.list.splice(_loc2_,1);
            break;
         }
         _loc2_ = _loc2_ - 1;
      }
      this.list.push(item);
   }
   function remove(item)
   {
      var _loc2_ = this.list.length - 1;
      while(_loc2_ >= 0)
      {
         if(this.list[_loc2_] == item)
         {
            this.list.splice(_loc2_,1);
         }
         _loc2_ = _loc2_ - 1;
      }
   }
   function removeAll()
   {
      this.list = [];
   }
}
