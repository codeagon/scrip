class g4.model.ModelCalls
{
   function ModelCalls()
   {
      super();
   }
   function sendToGame(command, parameters)
   {
      g4.model.GameInterface.callGameInterface(command,parameters);
   }
}
