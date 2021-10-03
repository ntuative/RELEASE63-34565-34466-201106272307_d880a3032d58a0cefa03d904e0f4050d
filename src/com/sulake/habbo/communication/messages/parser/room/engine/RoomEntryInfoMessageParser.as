package com.sulake.habbo.communication.messages.parser.room.engine
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   
   public class RoomEntryInfoMessageParser implements IMessageParser
   {
       
      
      private var var_1724:Boolean;
      
      private var var_2278:int;
      
      private var _owner:Boolean;
      
      private var var_1159:PublicRoomShortData;
      
      public function RoomEntryInfoMessageParser()
      {
         super();
      }
      
      public function get privateRoom() : Boolean
      {
         return this.var_1724;
      }
      
      public function get guestRoomId() : int
      {
         return this.var_2278;
      }
      
      public function get publicSpace() : PublicRoomShortData
      {
         return this.var_1159;
      }
      
      public function get owner() : Boolean
      {
         return this._owner;
      }
      
      public function flush() : Boolean
      {
         if(this.var_1159 != null)
         {
            this.var_1159.dispose();
            this.var_1159 = null;
         }
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1724 = param1.readBoolean();
         if(this.var_1724)
         {
            this.var_2278 = param1.readInteger();
            this._owner = param1.readBoolean();
         }
         else
         {
            this.var_1159 = new PublicRoomShortData(param1);
         }
         return true;
      }
   }
}