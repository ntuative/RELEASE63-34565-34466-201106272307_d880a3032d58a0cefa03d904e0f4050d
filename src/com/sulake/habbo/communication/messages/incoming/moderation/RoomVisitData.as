package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class RoomVisitData
   {
       
      
      private var var_2133:Boolean;
      
      private var _roomId:int;
      
      private var var_1083:String;
      
      private var var_2496:int;
      
      private var var_2495:int;
      
      public function RoomVisitData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2133 = param1.readBoolean();
         this._roomId = param1.readInteger();
         this.var_1083 = param1.readString();
         this.var_2496 = param1.readInteger();
         this.var_2495 = param1.readInteger();
      }
      
      public function get isPublic() : Boolean
      {
         return this.var_2133;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get roomName() : String
      {
         return this.var_1083;
      }
      
      public function get enterHour() : int
      {
         return this.var_2496;
      }
      
      public function get enterMinute() : int
      {
         return this.var_2495;
      }
   }
}
