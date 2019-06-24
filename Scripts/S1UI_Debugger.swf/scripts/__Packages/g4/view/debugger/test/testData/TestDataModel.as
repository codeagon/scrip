class g4.view.debugger.test.testData.TestDataModel
{
   function TestDataModel(name, scope, method, args, testDatas)
   {
      super();
      this._name = name;
      this.scope = scope;
      this.method = method;
      this.args = args;
      this.testDatas = testDatas;
   }
   function __get__name()
   {
      return this._name;
   }
   function __get__hasTestDatas()
   {
      return this.testDatas != null && this.testDatas.length > 0;
   }
   function run()
   {
      if(this.scope == null || this.method == null)
      {
         return undefined;
      }
      this.method.apply(this.scope,this.args);
   }
   function getTestDatas()
   {
      return this.testDatas;
   }
   function randRange(min, max)
   {
      return Math.floor(Math.random() * (max - min + 1)) + min;
   }
   function randBoolean()
   {
      return Math.random() < 0.5;
   }
   function toggleBoolean(id)
   {
      if(this.toggledBoolean == null)
      {
         this.toggledBoolean = {};
      }
      this.toggledBoolean[id] = !this.toggledBoolean[id];
      return this.toggledBoolean[id];
   }
   function randValueOne()
   {
      if(arguments == null || arguments.length == 0)
      {
         return null;
      }
      var _loc3_ = arguments;
      if(arguments.length == 1)
      {
         if(arguments[0] instanceof Array)
         {
            _loc3_ = arguments[0];
         }
      }
      return _loc3_[this.randRange(0,_loc3_.length - 1)];
   }
   function setTestValue(groupID, propName, value)
   {
      if(this.testValueObject == null)
      {
         this.testValueObject = {};
      }
      if(this.testValueObject[groupID] == null)
      {
         this.testValueObject[groupID] = {};
      }
      this.testValueObject[groupID][propName] = value;
   }
   function getTestValue(groupID, propName)
   {
      if(this.testValueObject == null)
      {
         return null;
      }
      if(this.testValueObject[groupID] == null)
      {
         return this.testValueObject[groupID];
      }
      return this.testValueObject[groupID][propName];
   }
}
