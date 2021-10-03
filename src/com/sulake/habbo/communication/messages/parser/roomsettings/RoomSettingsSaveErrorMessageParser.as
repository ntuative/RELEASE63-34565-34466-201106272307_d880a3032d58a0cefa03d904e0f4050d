package com.sulake.habbo.communication.messages.parser.roomsettings
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class RoomSettingsSaveErrorMessageParser implements IMessageParser
   {
      
      public static const const_2142:int = 1;
      
      public static const const_2222:int = 2;
      
      public static const const_2235:int = 3;
      
      public static const const_2106:int = 4;
      
      public static const const_1852:int = 5;
      
      public static const const_2322:int = 6;
      
      public static const const_1752:int = 7;
      
      public static const const_1751:int = 8;
      
      public static const const_2203:int = 9;
      
      public static const const_1952:int = 10;
      
      public static const const_1903:int = 11;
      
      public static const const_1775:int = 12;
       
      
      private var _roomId:int;
      
      private var var_1725:int;
      
      private var var_638:String;
      
      public function RoomSettingsSaveErrorMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._roomId = param1.readInteger();
         this.var_1725 = param1.readInteger();
         this.var_638 = param1.readString();
         return true;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get errorCode() : int
      {
         return this.var_1725;
      }
      
      public function get info() : String
      {
         return this.var_638;
      }
   }
}
