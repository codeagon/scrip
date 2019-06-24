class lib.gamedata.GameDataCollectionImpl implements mx.utils.Iterator, lib.gamedata.GameDataCollection
{
   var _cursor = 0;
   function GameDataCollectionImpl()
   {
      gfx.events.EventDispatcher.initialize(this.eventDispatcher = new Object());
      this.data_array = new Array();
   }
   function addData(data)
   {
      var _loc2_ = false;
      if(this.checkValidData(data))
      {
         if(this.contains(data))
         {
            _loc2_ = false;
         }
         else
         {
            this.data_array.push(data);
            _loc2_ = true;
            this.dispatchEvent({type:gfx.events.EventTypes.ADD,target:data,data:data,id:data.getId()});
         }
      }
      return _loc2_;
   }
   function getData(id, scope, callBack)
   {
      var _loc3_ = null;
      var _loc2_ = 0;
      while(_loc2_ < this.data_array.length)
      {
         if(this.data_array[_loc2_].getId() == id)
         {
            _loc3_ = (lib.gamedata.GameData)this.data_array[_loc2_];
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
      if(callBack)
      {
         scope[callBack].call(scope,_loc3_);
      }
      return _loc3_;
   }
   function getDataAt(index)
   {
      if(this.getLength() > 0)
      {
         return this.data_array[index];
      }
      return null;
   }
   function removeData(id)
   {
      var _loc4_ = null;
      var _loc3_ = null;
      if(typeof id == "object")
      {
         var _loc2_ = 0;
         while(_loc2_ < this.data_array.length)
         {
            if(this.data_array[_loc2_] == id)
            {
               _loc4_ = _loc2_;
               _loc3_ = this.data_array[_loc2_];
               break;
            }
            _loc2_ = _loc2_ + 1;
         }
      }
      else
      {
         _loc2_ = 0;
         while(_loc2_ < this.data_array.length)
         {
            if(this.data_array[_loc2_].getId() == id)
            {
               _loc4_ = _loc2_;
               _loc3_ = this.data_array[_loc2_];
               break;
            }
            _loc2_ = _loc2_ + 1;
         }
      }
      if(_loc4_ != null)
      {
         this.dispatchEvent({type:gfx.events.EventTypes.REMOVE,target:_loc3_,data:_loc3_,id:_loc3_.getId()});
         this.data_array.splice(_loc4_,1);
      }
   }
   function contains(id)
   {
      var _loc2_ = 0;
      if(typeof id == "object")
      {
         _loc2_ = 0;
         while(_loc2_ < this.data_array.length)
         {
            if(this.data_array[_loc2_] == id)
            {
               return true;
            }
            _loc2_ = _loc2_ + 1;
         }
      }
      else
      {
         _loc2_ = 0;
         while(_loc2_ < this.data_array.length)
         {
            if(this.data_array[_loc2_].getId() == id)
            {
               return true;
            }
            _loc2_ = _loc2_ + 1;
         }
      }
      return false;
   }
   function getLength()
   {
      return this.data_array.length;
   }
   function clear()
   {
      var _loc3_ = this.getIterator();
      while(_loc3_.hasNext())
      {
         var _loc2_ = _loc3_.next();
         this.dispatchEvent({type:gfx.events.EventTypes.REMOVE,target:_loc2_,id:_loc2_.getId()});
      }
      this.dispatchEvent({type:gfx.events.EventTypes.CLEAR,target:null});
      this.data_array.splice(0,this.getLength());
   }
   function isEmpty()
   {
      return this.data_array.length == 0;
   }
   function addEventListener(event, scope, callBack)
   {
      this.eventDispatcher.addEventListener(event,scope,callBack);
   }
   function removeEventListener(event, scope, callBack)
   {
      this.eventDispatcher.removeEventListener(event,scope,callBack);
   }
   function dispatchEvent(event)
   {
      this.eventDispatcher.dispatchEvent(event);
   }
   function getIterator()
   {
      return this.createIterator(this);
   }
   function hasNext()
   {
      return this._cursor < this.getLength();
   }
   function next()
   {
      this._cursor = this._cursor + 1;
      return this.getDataAt(this._cursor);
   }
   function clone()
   {
      var _loc7_ = new lib.gamedata.GameDataCollectionImpl();
      var _loc5_ = this.getIterator();
      while(_loc5_.hasNext())
      {
         var _loc2_ = _loc5_.next();
         var _loc4_ = new _loc2_.__proto__.constructor();
         for(var _loc6_ in _loc2_)
         {
            var _loc3_ = _loc2_[_loc6_];
            _loc4_[_loc6_] = _loc3_;
         }
         _loc7_.addData(_loc4_);
      }
      return _loc7_;
   }
   function checkValidData(data)
   {
      var _loc1_ = data.getId();
      if(_loc1_ != null && _loc1_ != undefined && _loc1_ != "")
      {
         return true;
      }
      return false;
   }
   function createIterator(collection)
   {
      this._cursor = 0;
      this.iterator = new mx.utils.Iterator();
      this.iterator.hasNext = function()
      {
         return collection.hasNext();
      };
      this.iterator.next = function()
      {
         return collection.next();
      };
      return this.iterator;
   }
}
