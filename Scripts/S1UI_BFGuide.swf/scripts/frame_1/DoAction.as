function showGuide()
{
   container_mc.emblem._visible = true;
   container_mc.x_mc._visible = true;
   container_mc.UIDrager._visible = true;
   container_mc.x_mc._x = 983;
   guide._visible = true;
   UI._visible = true;
}
function hideGuide()
{
   container_mc.emblem._visible = false;
   container_mc.x_mc._visible = false;
   container_mc.UIDrager._visible = false;
   container_mc.txtDoNotShowAgain._visible = container_mc.showCheck._visible = false;
   if(guide && guide._visible)
   {
      guide._visible = false;
      UI._visible = false;
      getURL("FSCommand:ToGame_BFGuide_Closed",!container_mc.showCheck.checked?"0\t" + guideIndex:1);
   }
}
var UI = this;
var currentPopup;
UI._visible = false;
var UIname = "BFGuide";
bWidgetOpen = true;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
container_mc.UIDrager.setData(UIname,UI);
container_mc.txtDoNotShowAgain.text = lib.util.UIString.getUIString("$279436");
var x_btn = new lib.util.TxtBtn(container_mc.x_mc);
x_btn.setRelease(hideGuide);
var guides = [];
var guideIndex = 1;
var guide;
do
{
   guide = container_mc["bfGuide" + guideIndex];
   if(guide)
   {
      guide._visible = false;
      guide.guideIndex = guideIndex;
      var closeBtn = new lib.util.TxtBtn(guide.x_mc);
      closeBtn.setRelease(hideGuide);
      guides.push(guide);
   }
   guideIndex++;
}
while(guide != undefined);

var i = 0;
while(i < guides.length)
{
   guide = guides[i];
   switch(i)
   {
      case 0:
         guide.txtTitle.htmlText = lib.util.UIString.getUIString("$279400");
         guide.txtSubTitle1.htmlText = lib.util.UIString.getUIString("$279401");
         guide.txtSubTitle2.htmlText = lib.util.UIString.getUIString("$279402");
         guide.txtMapMarker.htmlText = lib.util.UIString.getUIString("$279404");
         guide.txtGuardTower.htmlText = lib.util.UIString.getUIString("$279405");
         guide.txtAttackFortress.htmlText = lib.util.UIString.getUIString("$279406");
         guide.txtDefenceFortress.htmlText = lib.util.UIString.getUIString("$279407");
         guide.txtRevive.htmlText = lib.util.UIString.getUIString("$279408");
         guide.txtGate.htmlText = lib.util.UIString.getUIString("$279409");
         guide.txtLadder.htmlText = lib.util.UIString.getUIString("$279410");
         guide.txtFlight.htmlText = lib.util.UIString.getUIString("$279411");
         guide.txtTip0.htmlText = lib.util.UIString.getUIString("$279412");
         guide.txtTip1.htmlText = lib.util.UIString.getUIString("$279413");
         guide.txtTip2.htmlText = lib.util.UIString.getUIString("$279414");
         guide.txtTip3.htmlText = lib.util.UIString.getUIString("$279415");
         guide.txtLocalName0.htmlText = lib.util.UIString.getUIString("$279416");
         guide.txtLocalName1.htmlText = lib.util.UIString.getUIString("$279417");
         guide.txtLocalName2.htmlText = lib.util.UIString.getUIString("$279418");
         guide.txtLocalName3.htmlText = lib.util.UIString.getUIString("$279419");
         guide.txtLocalName4.htmlText = lib.util.UIString.getUIString("$279420");
         guide.txtLocalName5.htmlText = lib.util.UIString.getUIString("$279421");
         guide.txtLocalName6.htmlText = lib.util.UIString.getUIString("$279422");
         guide.txtLocalName7.htmlText = lib.util.UIString.getUIString("$279423");
         guide.txtLocalName8.htmlText = lib.util.UIString.getUIString("$279424");
         guide.txtLocalName9.htmlText = lib.util.UIString.getUIString("$279425");
         guide.txtLocalName10.htmlText = lib.util.UIString.getUIString("$279426");
         guide.txtLocalName11.htmlText = lib.util.UIString.getUIString("$279427");
         guide.txtLocalName12.htmlText = lib.util.UIString.getUIString("$279428");
         guide.txtLocalName13.htmlText = lib.util.UIString.getUIString("$279429");
         guide.txtLocalName14.htmlText = lib.util.UIString.getUIString("$279430");
         guide.txtLocalName15.htmlText = lib.util.UIString.getUIString("$279431");
         guide.txtLocalName16.htmlText = lib.util.UIString.getUIString("$279432");
         guide.txtLocalName17.htmlText = lib.util.UIString.getUIString("$279433");
         guide.txtLocalName18.htmlText = lib.util.UIString.getUIString("$279434");
         guide.txtLocalName19.htmlText = lib.util.UIString.getUIString("$279435");
         break;
      case 1:
         guide.txtTitle.htmlText = lib.util.UIString.getUIString("$279400");
         guide.txtSubTitle1.htmlText = lib.util.UIString.getUIString("$279401");
         guide.txtSubTitle2.htmlText = lib.util.UIString.getUIString("$279403");
         guide.txtMapMarker.htmlText = lib.util.UIString.getUIString("$279404");
         guide.txtGuardTower.htmlText = lib.util.UIString.getUIString("$279405");
         guide.txtAttackFortress.htmlText = lib.util.UIString.getUIString("$279406");
         guide.txtDefenceFortress.htmlText = lib.util.UIString.getUIString("$279407");
         guide.txtRevive.htmlText = lib.util.UIString.getUIString("$279408");
         guide.txtGate.htmlText = lib.util.UIString.getUIString("$279409");
         guide.txtLadder.htmlText = lib.util.UIString.getUIString("$279410");
         guide.txtFlight.htmlText = lib.util.UIString.getUIString("$279411");
         guide.txtTip0.htmlText = lib.util.UIString.getUIString("$279437");
         guide.txtTip1.htmlText = lib.util.UIString.getUIString("$279438");
         guide.txtTip2.htmlText = lib.util.UIString.getUIString("$279439");
         guide.txtLocalName0.htmlText = lib.util.UIString.getUIString("$279416");
         guide.txtLocalName1.htmlText = lib.util.UIString.getUIString("$279417");
         guide.txtLocalName2.htmlText = lib.util.UIString.getUIString("$279418");
         guide.txtLocalName3.htmlText = lib.util.UIString.getUIString("$279419");
         guide.txtLocalName4.htmlText = lib.util.UIString.getUIString("$279420");
         guide.txtLocalName5.htmlText = lib.util.UIString.getUIString("$279421");
         guide.txtLocalName6.htmlText = lib.util.UIString.getUIString("$279422");
         guide.txtLocalName7.htmlText = lib.util.UIString.getUIString("$279423");
         guide.txtLocalName8.htmlText = lib.util.UIString.getUIString("$279424");
         guide.txtLocalName9.htmlText = lib.util.UIString.getUIString("$279425");
         guide.txtLocalName10.htmlText = lib.util.UIString.getUIString("$279426");
         guide.txtLocalName11.htmlText = lib.util.UIString.getUIString("$279427");
         guide.txtLocalName12.htmlText = lib.util.UIString.getUIString("$279428");
         guide.txtLocalName13.htmlText = lib.util.UIString.getUIString("$279429");
         guide.txtLocalName14.htmlText = lib.util.UIString.getUIString("$279430");
         guide.txtLocalName15.htmlText = lib.util.UIString.getUIString("$279431");
         guide.txtLocalName16.htmlText = lib.util.UIString.getUIString("$279440");
         guide.txtLocalName17.htmlText = lib.util.UIString.getUIString("$279441");
         break;
      case 2:
         guide.txtTitle.htmlText = lib.util.UIString.getUIString("$279400");
         guide.txtSubTitle1.htmlText = lib.util.UIString.getUIString("$279442");
         guide.txtSubTitle2.htmlText = lib.util.UIString.getUIString("$279443");
         guide.txtMapMarker.htmlText = lib.util.UIString.getUIString("$279404");
         guide.txtPrecious.htmlText = lib.util.UIString.getUIString("$279444");
         guide.txtHumanStartPoint.htmlText = lib.util.UIString.getUIString("$279445");
         guide.txtKumaStartPoint.htmlText = lib.util.UIString.getUIString("$279446");
         guide.txtPreciousDeliverer.htmlText = lib.util.UIString.getUIString("$279447");
         guide.txtTip0.htmlText = lib.util.UIString.getUIString("$279448");
         guide.txtTip1.htmlText = lib.util.UIString.getUIString("$279449");
         guide.txtTip2.htmlText = lib.util.UIString.getUIString("$279450");
         guide.txtLocalName0.htmlText = lib.util.UIString.getUIString("$279445");
         guide.txtLocalName1.htmlText = lib.util.UIString.getUIString("$279446");
         guide.txtLocalName2.htmlText = lib.util.UIString.getUIString("$279444");
         guide.txtLocalName3.htmlText = lib.util.UIString.getUIString("$279444");
         guide.txtLocalName4.htmlText = lib.util.UIString.getUIString("$279451");
         guide.txtLocalName5.htmlText = lib.util.UIString.getUIString("$279447");
         guide.delivererIcon0._x = guide.txtLocalName5._x + (guide.txtLocalName5._width - (_guide.txtLocalName5.textWidth << 1) >> 1) - 40;
         break;
      case 3:
         guide.txtTitle.htmlText = lib.util.UIString.getUIString("$279400");
         guide.txtSubTitle1.htmlText = lib.util.UIString.getUIString("$279442");
         guide.txtSubTitle2.htmlText = lib.util.UIString.getUIString("$279452");
         guide.txtMapMarker.htmlText = lib.util.UIString.getUIString("$279404");
         guide.txtPrecious.htmlText = lib.util.UIString.getUIString("$279444");
         guide.txtHumanStartPoint.htmlText = lib.util.UIString.getUIString("$279445");
         guide.txtKumaStartPoint.htmlText = lib.util.UIString.getUIString("$279446");
         guide.txtPreciousDeliverer.htmlText = lib.util.UIString.getUIString("$279447");
         guide.txtPreciousPosition.htmlText = lib.util.UIString.getUIString("$279451");
         guide.txtTip0.htmlText = lib.util.UIString.getUIString("$279453");
         guide.txtTip1.htmlText = lib.util.UIString.getUIString("$279454");
         guide.txtTip2.htmlText = lib.util.UIString.getUIString("$279455");
         guide.txtLocalName0.htmlText = lib.util.UIString.getUIString("$279445");
         guide.txtLocalName1.htmlText = lib.util.UIString.getUIString("$279446");
         guide.txtLocalName2.htmlText = lib.util.UIString.getUIString("$279444");
         guide.txtLocalName3.htmlText = lib.util.UIString.getUIString("$279444");
         guide.txtLocalName4.htmlText = lib.util.UIString.getUIString("$279447");
         guide.txtLocalName5.htmlText = lib.util.UIString.getUIString("$279451");
         guide.delivererIcon0._x = guide.txtLocalName4._x + (guide.txtLocalName4._width - (_guide.txtLocalName4.textWidth << 1) >> 1) - 40;
         guide.delivererIcon1._x = guide.txtLocalName5._x + (guide.txtLocalName5._width - (_guide.txtLocalName5.textWidth << 1) >> 1) - 42;
   }
   guide.txtSubTitle2._x = guide.txtSubTitle1._x + guide.txtSubTitle1.textWidth;
   i++;
}
myListener.OnGameEventShowWindow = function(WindowName, bShow)
{
   if(WindowName.toLowerCase() == UIname.toLowerCase())
   {
      lib.Debuger.trace("BFGuide - OnGameEventShowWindow : " + bShow);
      bWidgetOpen = bShow;
      if(_global.gbUIMode && bWidgetOpen)
      {
         UI._visible = true;
      }
      else
      {
         UI._visible = false;
      }
   }
};
myListener.OnGameEventChangeUIMode = function(bShow)
{
   if(_global.gbUIMode && bWidgetOpen)
   {
      UI._visible = true;
   }
   else
   {
      bWidgetOpen = false;
      hideGuide();
   }
};
myListener.OnGame_BFGuide_Show = function(bShow, index, showCheck)
{
   guide = guides[Number(index) - 1];
   guideIndex = Number(index);
   if(guide)
   {
      if(bShow)
      {
         showGuide();
      }
      else
      {
         hideGuide();
      }
   }
   container_mc.txtDoNotShowAgain._visible = container_mc.showCheck._visible = showCheck == 1;
};
fscommand("ToGame_BFGuide_Init");
