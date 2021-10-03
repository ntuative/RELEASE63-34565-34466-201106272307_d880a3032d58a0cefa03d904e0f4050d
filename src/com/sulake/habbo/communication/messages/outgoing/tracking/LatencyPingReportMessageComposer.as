package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class LatencyPingReportMessageComposer implements IMessageComposer
   {
       
      
      private var var_2822:int;
      
      private var var_2821:int;
      
      private var var_2823:int;
      
      public function LatencyPingReportMessageComposer(param1:int, param2:int, param3:int)
      {
         super();
         this.var_2822 = param1;
         this.var_2821 = param2;
         this.var_2823 = param3;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2822,this.var_2821,this.var_2823];
      }
      
      public function dispose() : void
      {
      }
   }
}
