package com.sulake.habbo.communication.messages.outgoing.moderator
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.IDisposable;
   
   public class ModBanMessageComposer implements IMessageComposer, IDisposable
   {
       
      
      private var var_35:Array;
      
      public function ModBanMessageComposer(param1:int, param2:String, param3:int, param4:String)
      {
         this.var_35 = new Array();
         super();
         this.var_35.push(param1);
         this.var_35.push(param2);
         this.var_35.push(param3);
         this.var_35.push(param4);
      }
      
      public function getMessageArray() : Array
      {
         return this.var_35;
      }
      
      public function dispose() : void
      {
         this.var_35 = null;
      }
      
      public function get disposed() : Boolean
      {
         return false;
      }
   }
}
