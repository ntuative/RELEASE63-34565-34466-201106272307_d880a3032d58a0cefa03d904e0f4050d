package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class OpenPetPackageMessageComposer implements IMessageComposer
   {
       
      
      private var var_238:int;
      
      private var var_2880:String;
      
      public function OpenPetPackageMessageComposer(param1:int, param2:String)
      {
         super();
         this.var_238 = param1;
         this.var_2880 = param2;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_238,this.var_2880];
      }
      
      public function dispose() : void
      {
      }
   }
}
