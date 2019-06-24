Object.registerClass("FocusManager",mx.managers.FocusManager);
if(_root.focusManager == undefined)
{
   mx.managers.DepthManager.highestDepth = mx.managers.DepthManager.highestDepth - 1;
   _root.createClassObject(mx.managers.FocusManager,"focusManager",mx.managers.DepthManager.highestDepth);
}
