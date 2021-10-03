package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CfhChatlogData
   {
       
      
      private var var_2053:int;
      
      private var var_2818:int;
      
      private var var_1676:int;
      
      private var var_2819:int;
      
      private var var_130:RoomChatlogData;
      
      public function CfhChatlogData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2053 = param1.readInteger();
         this.var_2818 = param1.readInteger();
         this.var_1676 = param1.readInteger();
         this.var_2819 = param1.readInteger();
         this.var_130 = new RoomChatlogData(param1);
         Logger.log("READ CFHCHATLOGDATA: callId: " + this.var_2053);
      }
      
      public function get callId() : int
      {
         return this.var_2053;
      }
      
      public function get callerUserId() : int
      {
         return this.var_2818;
      }
      
      public function get reportedUserId() : int
      {
         return this.var_1676;
      }
      
      public function get chatRecordId() : int
      {
         return this.var_2819;
      }
      
      public function get room() : RoomChatlogData
      {
         return this.var_130;
      }
   }
}
