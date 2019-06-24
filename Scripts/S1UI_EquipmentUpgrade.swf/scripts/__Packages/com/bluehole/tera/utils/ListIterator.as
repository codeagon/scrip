class com.bluehole.tera.utils.ListIterator extends com.bluehole.tera.utils.Iterator
{
   function ListIterator(list)
   {
      super();
      this.list = list;
      this.listLength = list.length;
      this.index = 0;
   }
   function hasNext()
   {
      return this.listLength - 1 >= this.index;
   }
   function next()
   {
      var _loc2_ = this.list[this.index];
      this.index = this.index + 1;
      return _loc2_;
   }
}
