package com.sulake.habbo.communication.messages.outgoing.room.avatar
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class LookToMessageComposer implements IMessageComposer
   {
       
      
      private var var_2497:int;
      
      private var var_2498:int;
      
      public function LookToMessageComposer(param1:int, param2:int)
      {
         super();
         this.var_2497 = param1;
         this.var_2498 = param2;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2497,this.var_2498];
      }
      
      public function dispose() : void
      {
      }
   }
}
