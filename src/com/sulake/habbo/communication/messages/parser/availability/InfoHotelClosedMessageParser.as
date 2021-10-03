package com.sulake.habbo.communication.messages.parser.availability
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class InfoHotelClosedMessageParser implements IMessageParser
   {
       
      
      private var _openHour:int;
      
      private var var_2105:int;
      
      private var var_2104:Boolean;
      
      public function InfoHotelClosedMessageParser()
      {
         super();
      }
      
      public function get openHour() : int
      {
         return this._openHour;
      }
      
      public function get openMinute() : int
      {
         return this.var_2105;
      }
      
      public function get userThrownOutAtClose() : Boolean
      {
         return this.var_2104;
      }
      
      public function flush() : Boolean
      {
         this._openHour = 0;
         this.var_2105 = 0;
         this.var_2104 = false;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._openHour = param1.readInteger();
         this.var_2105 = param1.readInteger();
         this.var_2104 = param1.readInteger() > 0;
         return true;
      }
   }
}
