class g4.view.debugger.TreeViewDataProvider extends gfx.events.EventDispatcher
{
   var showRoot = false;
   var startIndex = 0;
   var endIndex = 0;
   var length = 0;
   function TreeViewDataProvider(root, showRoot)
   {
      super();
      this.root = root;
      this.showRoot = showRoot;
      this.preProcessRoot();
   }
   function requestItemAt(index, callback)
   {
      var _loc2_ = index - this.startIndex;
      if(this.actualDataList == null || _loc2_ < 0 || _loc2_ > this.actualDataList.length - 1)
      {
         return null;
      }
      if(callback != null)
      {
         callback(this.actualDataList[_loc2_]);
      }
      return this.actualDataList[_loc2_];
   }
   function requestItemRange(startIndex, endIndex, scope, callBack)
   {
      var _loc2_ = [];
      this.loadObjects(_loc2_,this.findObjectByIndex(startIndex),endIndex - startIndex);
      this.startIndex = startIndex;
      this.endIndex = endIndex;
      this.actualDataList = _loc2_;
      scope[callBack].call(scope,_loc2_);
      return null;
   }
   function invalidate(length)
   {
      this.validateLength();
      this.dispatchEvent({type:"change"});
   }
   function validateLength()
   {
      this.length = this.computeLength(this.root);
   }
   function loadObjects(data, currObj, reqLen)
   {
      data.push(currObj);
      reqLen = reqLen - 1;
      while(currObj && reqLen >= 0)
      {
         var _loc1_ = currObj;
         if(_loc1_.type == g4.view.debugger.TreeViewConstants.TYPE_OPEN && _loc1_.nodes)
         {
            currObj = _loc1_.nodes[0];
         }
         else
         {
            currObj = _loc1_.nextSibling;
         }
         while(!currObj && _loc1_.parent)
         {
            currObj = _loc1_.parent.nextSibling;
            _loc1_ = _loc1_.parent;
         }
         if(currObj)
         {
            data.push(currObj);
            reqLen = reqLen - 1;
         }
      }
      while(reqLen >= 0)
      {
         data.push(null);
         reqLen = reqLen - 1;
      }
   }
   function computeLength(obj)
   {
      var _loc3_ = obj;
      var _loc5_ = !obj.nextSibling?obj.parent:obj.nextSibling;
      var _loc4_ = !this.showRoot?-1:0;
      while(_loc3_ && _loc3_ != _loc5_)
      {
         _loc4_ = _loc4_ + 1;
         var _loc2_ = _loc3_;
         if(_loc2_.type == g4.view.debugger.TreeViewConstants.TYPE_OPEN && _loc2_.nodes)
         {
            _loc3_ = _loc2_.nodes[0];
         }
         else
         {
            _loc3_ = _loc2_.nextSibling;
         }
         while(!_loc3_ && _loc2_.parent)
         {
            _loc3_ = _loc2_.parent.nextSibling;
            _loc2_ = _loc2_.parent;
         }
      }
      return _loc4_;
   }
   function findObjectByIndex(index)
   {
      var _loc5_ = [this.root];
      var _loc6_ = !this.showRoot?-1:0;
      var _loc7_ = this.root;
      var _loc4_ = (g4.view.debugger.TreeNode)_loc5_.pop();
      while(_loc4_)
      {
         _loc7_ = _loc4_;
         if(_loc6_ == index)
         {
            break;
         }
         var _loc3_ = _loc4_.nodes;
         if(_loc3_ && _loc4_.type == g4.view.debugger.TreeViewConstants.TYPE_OPEN)
         {
            var _loc2_ = _loc3_.length - 1;
            while(_loc2_ > -1)
            {
               _loc5_.push(_loc3_[_loc2_]);
               _loc2_ = _loc2_ - 1;
            }
         }
         _loc6_ = _loc6_ + 1;
         _loc4_ = (g4.view.debugger.TreeNode)_loc5_.pop();
      }
      return _loc7_;
   }
   function preProcessRoot()
   {
      this.preProcess(this.root);
      this.root.isRoot = true;
      if(!this.showRoot)
      {
         this.root.type = g4.view.debugger.TreeViewConstants.TYPE_OPEN;
      }
      this.validateLength();
   }
   function preProcess(node, parent, depth, depthIcons)
   {
      node.depthIcons = !depthIcons?[]:depthIcons;
      node.parent = !parent?null:parent;
      node.type = !node.nodes?g4.view.debugger.TreeViewConstants.TYPE_LEAF:g4.view.debugger.TreeViewConstants.TYPE_CLOSED;
      var _loc3_ = node.nodes;
      if(_loc3_)
      {
         var _loc2_ = undefined;
         var _loc4_ = undefined;
         var _loc6_ = [];
         _loc4_ = node.depthIcons.length;
         _loc2_ = 0;
         while(_loc2_ < _loc4_)
         {
            _loc6_.push(node.depthIcons[_loc2_]);
            _loc2_ = _loc2_ + 1;
         }
         _loc6_.push(!node.nextSibling?0:1);
         _loc4_ = _loc3_.length;
         _loc2_ = 0;
         while(_loc2_ < _loc4_)
         {
            if(_loc2_ + 1 < _loc4_)
            {
               _loc3_[_loc2_].nextSibling = _loc3_[_loc2_ + 1];
            }
            this.preProcess(_loc3_[_loc2_],node,!depth?1:depth + 1,_loc6_);
            _loc2_ = _loc2_ + 1;
         }
      }
   }
}
