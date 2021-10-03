package com.sulake.habbo.communication.messages.outgoing.facebook
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class FaceBookIsLoggedOnMessageComposer implements IMessageComposer
   {
       
      
      private var var_1766:Array;
      
      public function FaceBookIsLoggedOnMessageComposer(param1:String, param2:String, param3:String)
      {
         super();
         this.var_1766 = [param1,param2,param3];
      }
      
      public function getMessageArray() : Array
      {
         return this.var_1766;
      }
      
      public function dispose() : void
      {
         this.var_1766 = null;
      }
   }
}
