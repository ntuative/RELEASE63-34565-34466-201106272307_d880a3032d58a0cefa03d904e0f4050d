package com.sulake.habbo.communication.messages.parser.room.engine
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class UserChangeMessageParser implements IMessageParser
   {
       
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var _id:int;
      
      private var _figure:String;
      
      private var var_1105:String;
      
      private var var_2107:String;
      
      private var var_2536:int;
      
      public function UserChangeMessageParser()
      {
         super();
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get roomCategory() : int
      {
         return this._roomCategory;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get figure() : String
      {
         return this._figure;
      }
      
      public function get sex() : String
      {
         return this.var_1105;
      }
      
      public function get customInfo() : String
      {
         return this.var_2107;
      }
      
      public function get achievementScore() : int
      {
         return this.var_2536;
      }
      
      public function flush() : Boolean
      {
         this._id = 0;
         this._figure = "";
         this.var_1105 = "";
         this.var_2107 = "";
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._id = param1.readInteger();
         this._figure = param1.readString();
         this.var_1105 = param1.readString();
         this.var_2107 = param1.readString();
         this.var_2536 = param1.readInteger();
         if(this.var_1105)
         {
            this.var_1105 = this.var_1105.toUpperCase();
         }
         return true;
      }
   }
}
