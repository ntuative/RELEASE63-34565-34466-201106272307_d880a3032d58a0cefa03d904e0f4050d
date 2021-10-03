package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ChatlineData
   {
       
      
      private var var_2624:int;
      
      private var var_2622:int;
      
      private var var_2625:int;
      
      private var var_2623:String;
      
      private var var_2019:String;
      
      public function ChatlineData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2624 = param1.readInteger();
         this.var_2622 = param1.readInteger();
         this.var_2625 = param1.readInteger();
         this.var_2623 = param1.readString();
         this.var_2019 = param1.readString();
      }
      
      public function get hour() : int
      {
         return this.var_2624;
      }
      
      public function get minute() : int
      {
         return this.var_2622;
      }
      
      public function get chatterId() : int
      {
         return this.var_2625;
      }
      
      public function get chatterName() : String
      {
         return this.var_2623;
      }
      
      public function get msg() : String
      {
         return this.var_2019;
      }
   }
}
