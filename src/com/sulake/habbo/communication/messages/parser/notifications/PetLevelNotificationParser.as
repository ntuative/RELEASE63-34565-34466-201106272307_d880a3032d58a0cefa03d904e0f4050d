package com.sulake.habbo.communication.messages.parser.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetLevelNotificationParser implements IMessageParser
   {
       
      
      private var var_1756:int;
      
      private var var_2880:String;
      
      private var var_1160:int;
      
      private var var_1234:int;
      
      private var var_1870:int;
      
      private var _color:String;
      
      public function PetLevelNotificationParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1756 = param1.readInteger();
         this.var_2880 = param1.readString();
         this.var_1160 = param1.readInteger();
         this.var_1234 = param1.readInteger();
         this.var_1870 = param1.readInteger();
         this._color = param1.readString();
         return true;
      }
      
      public function get petId() : int
      {
         return this.var_1756;
      }
      
      public function get petName() : String
      {
         return this.var_2880;
      }
      
      public function get level() : int
      {
         return this.var_1160;
      }
      
      public function get petType() : int
      {
         return this.var_1234;
      }
      
      public function get breed() : int
      {
         return this.var_1870;
      }
      
      public function get color() : String
      {
         return this._color;
      }
   }
}
