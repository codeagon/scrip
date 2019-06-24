class g4.view.debugger.GameInterfaceTester extends gfx.core.UIComponent
{
   var nextStep = 0;
   function GameInterfaceTester()
   {
      super();
   }
   function configUI()
   {
      super.configUI();
      this.mc_tree.__set__itemRenderer("TreeItemRenderer");
      this.mc_tree.__set__scrollBar(this.mc_scroll_bar);
      this.mc_tree.__set__labelFunction(gfx.utils.Delegate.create(this,this.generateItemLabel));
      this.mc_tree.addEventListener("itemClick",this,"mc_tree_itemClickHandler_forTreeDefaultBehavior");
      this.mc_tree.addEventListener("itemClick",this,"mc_tree_itemClickHandler_forTestRun");
      this.mc_bg.onRelease = null;
      if(_global.gfxPlayer)
      {
         this.executeNextStep();
      }
      else
      {
         this.nextStep = 2;
         this.executeNextStep();
      }
   }
   function executeNextStep()
   {
      this.nextStep = this.nextStep + 1;
      switch(this.nextStep)
      {
         case 0:
            g4.view.debugger.test.StrSheetUIXML.load(gfx.utils.Delegate.create(this,this.executeNextStep));
            break;
         case 1:
            g4.view.debugger.test.LoadUIXML.load(gfx.utils.Delegate.create(this,this.executeNextStep));
            break;
         case 2:
            this.createDataProvider();
      }
   }
   function createDataProvider()
   {
      var _loc13_ = new g4.view.debugger.test.testData.TestDatas();
      if(!_loc13_.__get__hasTestDatas())
      {
         return undefined;
      }
      var _loc11_ = _loc13_.getTestDatas();
      var _loc6_ = undefined;
      var _loc7_ = [];
      var _loc4_ = undefined;
      var _loc12_ = [];
      var _loc2_ = undefined;
      var _loc9_ = _loc11_.length;
      _loc2_ = 0;
      while(_loc2_ < _loc9_)
      {
         _loc6_ = _loc11_[_loc2_];
         _loc4_ = new g4.view.debugger.TreeNode();
         _loc4_.depth = 0;
         _loc4_.index = _loc2_;
         _loc4_.label = _loc6_.name;
         _loc4_.data = _loc6_;
         _loc12_.push(_loc4_);
         _loc7_.push(_loc4_);
         _loc2_ = _loc2_ + 1;
      }
      var _loc3_ = undefined;
      var _loc10_ = undefined;
      var _loc5_ = undefined;
      while(_loc7_.length > 0)
      {
         _loc4_ = (g4.view.debugger.TreeNode)_loc7_.pop();
         _loc6_ = (g4.view.debugger.test.testData.TestDataModel)_loc4_.data;
         if(_loc6_.__get__hasTestDatas())
         {
            _loc10_ = _loc6_.getTestDatas();
            var _loc8_ = [];
            _loc9_ = _loc10_.length;
            _loc2_ = 0;
            while(_loc2_ < _loc9_)
            {
               _loc5_ = _loc10_[_loc2_];
               _loc3_ = new g4.view.debugger.TreeNode();
               _loc3_.depth = _loc4_.depth + 1;
               _loc3_.index = _loc2_;
               _loc3_.label = _loc5_.name;
               _loc3_.data = _loc5_;
               _loc8_.push(_loc3_);
               _loc7_.push(_loc3_);
               _loc2_ = _loc2_ + 1;
            }
            _loc4_.nodes = _loc8_;
         }
      }
      var _loc14_ = new g4.view.debugger.TreeNode("UI Test",_loc12_);
      this.dp = new g4.view.debugger.TreeViewDataProvider(_loc14_,false);
      this.mc_tree.__set__dataProvider(this.dp);
   }
   function generateItemLabel(item)
   {
      if(item == null)
      {
         return "";
      }
      var _loc3_ = "";
      var _loc2_ = item;
      while(_loc2_ && !_loc2_.isRoot)
      {
         _loc3_ = _loc2_.index + 1 + "." + _loc3_;
         _loc2_ = _loc2_.parent;
      }
      if(_loc3_.length > 0)
      {
         var _loc5_ = " ";
         if(item.nodes && item.nodes.length > 0)
         {
            if(item.type == g4.view.debugger.TreeViewConstants.TYPE_OPEN)
            {
               _loc5_ = "-";
            }
            else
            {
               _loc5_ = "+";
            }
         }
         return this.getIndent(item.depth) + _loc5_ + " " + _loc3_ + " " + item.label;
      }
      return item.label;
   }
   function getIndent(depth)
   {
      var _loc1_ = "";
      while((depth = depth - 1) >= 0)
      {
         _loc1_ = _loc1_ + "    ";
      }
      return _loc1_;
   }
   function mc_tree_itemClickHandler_forTreeDefaultBehavior(event)
   {
      var _loc2_ = (g4.view.debugger.TreeNode)this.dp.requestItemAt(event.index);
      if(_loc2_ == null || _loc2_.nodes == null || _loc2_.nodes.length == 0)
      {
         return undefined;
      }
      _loc2_.type = _loc2_.type != g4.view.debugger.TreeViewConstants.TYPE_OPEN?g4.view.debugger.TreeViewConstants.TYPE_OPEN:g4.view.debugger.TreeViewConstants.TYPE_CLOSED;
      this.dp.invalidate();
   }
   function mc_tree_itemClickHandler_forTestRun(event)
   {
      var _loc2_ = (g4.view.debugger.TreeNode)this.dp.requestItemAt(event.index);
      if(_loc2_ == null)
      {
         return undefined;
      }
      (g4.view.debugger.test.testData.TestDataModel)_loc2_.data.run();
   }
}
