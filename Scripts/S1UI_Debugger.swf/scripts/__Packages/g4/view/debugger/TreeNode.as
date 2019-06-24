class g4.view.debugger.TreeNode
{
   var isRoot = false;
   var type = g4.view.debugger.TreeViewConstants.TYPE_CLOSED;
   var depth = -1;
   var index = -1;
   function TreeNode(label, nodes)
   {
      super();
      this.label = label;
      this.nodes = nodes;
   }
}
