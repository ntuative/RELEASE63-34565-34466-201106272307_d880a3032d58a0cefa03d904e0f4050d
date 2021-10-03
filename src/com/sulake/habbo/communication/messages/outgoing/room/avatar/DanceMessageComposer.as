package com.sulake.habbo.communication.messages.outgoing.room.avatar
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class DanceMessageComposer implements IMessageComposer
   {
       
      
      private var var_91:int;
      
      public function DanceMessageComposer(param1:int)
      {
         super();
         this.var_91 = param1;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_91];
      }
   }
}
