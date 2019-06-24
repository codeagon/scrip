class com.bluehole.tera.utils.List extends gfx.events.EventDispatcher
{
   function List()
   {
      super();
      this.list = [];
   }
   function __get__iterator()
   {
      return new com.bluehole.tera.utils.ListIterator(this);
   }
   function add(item)
   {
      var _loc3_ = false;
      var _loc2_ = this.list.length - 1;
      while(_loc2_ >= 0)
      {
         if(this.list[_loc2_] == item)
         {
            _loc3_ = true;
            this.list.splice(_loc2_,1);
            break;
         }
         _loc2_ = _loc2_ - 1;
      }
      this.list.push(item);
      if(!_loc3_)
      {
         this.dispatchEvent({type:"added"});
      }
   }
   function remove(item, compareField)
   {
      var _loc2_ = this.list.length - 1;
      if(compareField == undefined)
      {
         while(_loc2_ >= 0)
         {
            if(this.list[_loc2_] == item)
            {
               this.list.splice(_loc2_,1);
               break;
            }
            _loc2_ = _loc2_ - 1;
         }
      }
      else
      {
         while(_loc2_ >= 0)
         {
            if(this.list[_loc2_][compareField] == item)
            {
               this.list.splice(_loc2_,1);
               break;
            }
            _loc2_ = _loc2_ - 1;
         }
      }
      if(_loc2_ >= 0)
      {
         this.dispatchEvent({type:"removed",index:_loc2_});
      }
   }
   function removeAll()
   {
      this.list = [];
   }
}
