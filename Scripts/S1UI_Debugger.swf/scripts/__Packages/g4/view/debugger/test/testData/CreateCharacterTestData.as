class g4.view.debugger.test.testData.CreateCharacterTestData extends g4.view.debugger.test.testData.UITestDataModel
{
   function CreateCharacterTestData()
   {
      super(g4.view.ViewID.CREATE_CHARACTER,"캐릭터 생성",[new g4.view.debugger.test.testData.TestDataModel("더미 데이터 설정 #1",this,this.setDummyData1),new g4.view.debugger.test.testData.TestDataModel("더미 데이터 설정 #2",this,this.setDummyData2)]);
      this.init();
   }
   function uiLoadComplete()
   {
      this.processFirst();
   }
   function init()
   {
   }
   function processFirst()
   {
      this.OnGame_CreateCharacter_SetButtonLock(false);
      this.OnGame_CreateCharacter_SetSecond(false);
   }
   function setDummyData1()
   {
      var _loc10_ = "0\timg://customize__201000\n1\timg://customize__201001\n2\timg://customize__201002\n3\timg://customize__201003\n4\timg://customize__201004\n5\timg://customize__201005\n6\timg://customize__201006\n7\timg://customize__201007\n8\timg://customize__201008\n9\timg://customize__201009\n10\timg://customize__201010\n11\timg://customize__201011\n12\timg://customize__201012\n13\timg://customize__201013\n";
      var _loc11_ = "0\timg://customize__101000\n1\timg://customize__101001\n2\timg://customize__101002\n3\timg://customize__101003\n4\timg://customize__101004\n5\timg://customize__101005\n6\timg://customize__101006\n7\timg://customize__101007\n8\timg://customize__101008\n9\timg://customize__101009\n10\timg://customize__101010\n11\timg://customize__101011\n12\timg://customize__101012\n13\timg://customize__101013\n14\timg://customize__101014\n15\timg://customize__101015\n16\timg://customize__101016\n17\timg://customize__101017\n";
      var _loc16_ = "0\timg://customize__301000\n1\timg://customize__301001\n2\timg://customize__301002\n3\timg://customize__301003\n4\timg://customize__301004\n5\timg://customize__301005\n6\timg://customize__301006\n7\timg://customize__301007\n8\timg://customize__301008\n9\timg://customize__301009\n10\timg://customize__301010\n11\timg://customize__301011\n12\timg://customize__301012\n13\timg://customize__301013\n14\timg://customize__301014\n15\timg://customize__301015\n16\timg://customize__301016\n17\timg://customize__301017\n18\timg://customize__301018\n19\timg://customize__301019\n20\timg://customize__301020\n21\timg://customize__301021\n22\timg://customize__301022\n23\timg://customize__301023\n24\timg://customize__301024\n25\timg://customize__301025\n26\timg://customize__301026\n27\timg://customize__301027\n28\timg://customize__301028\n29\timg://customize__301029\n30\timg://customize__301030\n31\timg://customize__301031\n32\timg://customize__301032\n";
      var _loc4_ = "0\timg://customize__10100000\n1\timg://customize__10100001\n2\timg://customize__10100002\n3\timg://customize__10100003\n4\timg://customize__10100004\n5\timg://customize__10100005\n6\timg://customize__10100006\n7\timg://customize__10100007\n8\timg://customize__10100008\n9\timg://customize__10100009\n10\timg://customize__10100010\n11\timg://customize__10100011\n12\timg://customize__10100012\n13\timg://customize__10100013\n14\timg://customize__10100014\n15\timg://customize__10100015\n16\timg://customize__10100016\n17\timg://customize__10100017\n18\timg://customize__10100018\n19\timg://customize__10100019\n20\timg://customize__10100020\n21\timg://customize__10100021\n22\timg://customize__10100022\n23\timg://customize__10100023\n24\timg://customize__10100024\n25\timg://customize__10100025\n26\timg://customize__10100026\n27\timg://customize__10100027\n28\timg://customize__10100028\n29\timg://customize__10100029\n30\timg://customize__10100030\n31\timg://customize__10100031\n32\t0\t255,0,0\n33\t0\t0,255,0\n34\t0\t0,0,255\n";
      var _loc12_ = "0\timg://customize__20101300\n1\timg://customize__20101301\n2\timg://customize__20101302\n";
      var _loc13_ = "";
      var _loc17_ = "0\timg://customize__50200\n1\timg://customize__50206\n2\timg://customize__50213\n3\timg://customize__50215\n4\timg://customize__50216\n5\timg://customize__50220\n6\timg://customize__50221\n";
      var _loc3_ = 13;
      var _loc9_ = 8;
      var _loc18_ = 24;
      var _loc2_ = 11;
      var _loc14_ = 0;
      var _loc15_ = 0;
      var _loc8_ = 0;
      var _loc5_ = "0\timg://customize__901000\n1\timg://customize__901001\n2\timg://customize__901002\n3\timg://customize__901003\n4\timg://customize__901004\n5\timg://customize__901005\n6\timg://customize__901006\n7\timg://customize__901007\n8\timg://customize__901008\n9\timg://customize__901009\n10\timg://customize__901010\n11\timg://customize__901011\n12\timg://customize__901012\n13\timg://customize__901013\n14\timg://customize__901014\n15\timg://customize__901015\n16\timg://customize__901016\n17\timg://customize__901017\n18\timg://customize__901018\n19\timg://customize__901019\n999\timg://customize__912000\n";
      var _loc6_ = 0;
      var _loc7_ = 9000;
      this.OnGame_CreateCharacter_SetCustomizingData(_loc10_,_loc11_,_loc16_,_loc4_,_loc12_,_loc13_,_loc17_,_loc3_,_loc9_,_loc18_,_loc2_,_loc14_,_loc15_,_loc8_,_loc5_,_loc6_,_loc7_);
   }
   function setDummyData2()
   {
      var _loc10_ = "0\timg://customize__201000\n1\timg://customize__201001\n2\timg://customize__201002\n3\timg://customize__201003\n4\timg://customize__201004\n5\timg://customize__201005\n6\timg://customize__201006\n7\timg://customize__201007\n8\timg://customize__201008\n9\timg://customize__201009\n10\timg://customize__201010\n11\timg://customize__201011\n12\timg://customize__201012\n13\timg://customize__201013\n";
      var _loc11_ = "0\timg://customize__101000\n1\timg://customize__101001\n2\timg://customize__101002\n3\timg://customize__101003\n4\timg://customize__101004\n5\timg://customize__101005\n6\timg://customize__101006\n7\timg://customize__101007\n8\timg://customize__101008\n9\timg://customize__101009\n10\timg://customize__101010\n11\timg://customize__101011\n12\timg://customize__101012\n13\timg://customize__101013\n14\timg://customize__101014\n15\timg://customize__101015\n16\timg://customize__101016\n17\timg://customize__101017\n";
      var _loc16_ = "0\timg://customize__301000\n1\timg://customize__301001\n2\timg://customize__301002\n3\timg://customize__301003\n4\timg://customize__301004\n5\timg://customize__301005\n6\timg://customize__301006\n7\timg://customize__301007\n8\timg://customize__301008\n9\timg://customize__301009\n10\timg://customize__301010\n11\timg://customize__301011\n12\timg://customize__301012\n13\timg://customize__301013\n14\timg://customize__301014\n15\timg://customize__301015\n16\timg://customize__301016\n17\timg://customize__301017\n18\timg://customize__301018\n19\timg://customize__301019\n20\timg://customize__301020\n21\timg://customize__301021\n22\timg://customize__301022\n23\timg://customize__301023\n24\timg://customize__301024\n25\timg://customize__301025\n26\timg://customize__301026\n27\timg://customize__301027\n28\timg://customize__301028\n29\timg://customize__301029\n30\timg://customize__301030\n31\timg://customize__301031\n32\timg://customize__301032\n";
      var _loc4_ = "0\timg://customize__10100000\n1\timg://customize__10100001\n2\timg://customize__10100002\n3\timg://customize__10100003\n4\timg://customize__10100004\n5\timg://customize__10100005\n6\timg://customize__10100006\n7\timg://customize__10100007\n8\timg://customize__10100008\n9\timg://customize__10100009\n10\timg://customize__10100010\n11\timg://customize__10100011\n12\timg://customize__10100012\n13\timg://customize__10100013\n14\timg://customize__10100014\n15\timg://customize__10100015\n16\timg://customize__10100016\n17\timg://customize__10100017\n18\timg://customize__10100018\n19\timg://customize__10100019\n20\timg://customize__10100020\n21\timg://customize__10100021\n22\timg://customize__10100022\n23\timg://customize__10100023\n24\timg://customize__10100024\n25\timg://customize__10100025\n26\timg://customize__10100026\n27\timg://customize__10100027\n28\timg://customize__10100028\n29\timg://customize__10100029\n30\timg://customize__10100030\n31\timg://customize__10100031\n32\t0\t255,0,0\n33\t0\t0,255,0\n34\t0\t0,0,255\n35\t0\t255,255,0\n36\t0\t0,255,255\n";
      var _loc12_ = "0\timg://customize__20101300\n1\timg://customize__20101301\n2\timg://customize__20101302\n";
      var _loc13_ = "";
      var _loc17_ = "0\timg://customize__50200\n1\timg://customize__50206\n2\timg://customize__50213\n3\timg://customize__50215\n4\timg://customize__50216\n5\timg://customize__50220\n6\timg://customize__50221\n";
      var _loc3_ = 13;
      var _loc9_ = 8;
      var _loc18_ = 24;
      var _loc2_ = 11;
      var _loc14_ = 0;
      var _loc15_ = 0;
      var _loc8_ = 0;
      var _loc5_ = "0\timg://customize__901000\n1\timg://customize__901001\n2\timg://customize__901002\n3\timg://customize__901003\n4\timg://customize__901004\n5\timg://customize__901005\n6\timg://customize__901006\n7\timg://customize__901007\n8\timg://customize__901008\n9\timg://customize__901009\n10\timg://customize__901010\n11\timg://customize__901011\n12\timg://customize__901012\n13\timg://customize__901013\n14\timg://customize__901014\n15\timg://customize__901015\n16\timg://customize__901016\n17\timg://customize__901017\n18\timg://customize__901018\n19\timg://customize__901019\n999\timg://customize__912000\n";
      var _loc6_ = 0;
      var _loc7_ = 9000;
      this.OnGame_CreateCharacter_SetCustomizingData(_loc10_,_loc11_,_loc16_,_loc4_,_loc12_,_loc13_,_loc17_,_loc3_,_loc9_,_loc18_,_loc2_,_loc14_,_loc15_,_loc8_,_loc5_,_loc6_,_loc7_);
   }
   function OnGame_CreateCharacter_SetCustomizingData(faceDataList, hairDataList, skinColorDataList, hairColorDataList, decalDataList, decoDataList, equipDataList, selectFaceID, selectHairID, selectSkinID, selectHairColorID, selectDecalID, selectDecoID, selectEquipID, presetList, selectPresetID, randomList)
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_CreateCharacter_SetCustomizingData",faceDataList,hairDataList,skinColorDataList,hairColorDataList,decalDataList,decoDataList,equipDataList,selectFaceID,selectHairID,selectSkinID,selectHairColorID,selectDecalID,selectDecoID,selectEquipID,presetList,selectPresetID,randomList);
   }
   function OnGame_CreateCharacter_SetButtonLock(bLocked)
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_CreateCharacter_SetButtonLock",bLocked);
   }
   function OnGame_CreateCharacter_SetSecond(value)
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_CreateCharacter_SetSecond",value);
   }
}
