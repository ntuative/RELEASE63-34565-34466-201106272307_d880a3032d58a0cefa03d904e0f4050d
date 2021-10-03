package com.sulake.habbo.communication.messages.parser.error
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ErrorReportMessageParser implements IMessageParser
   {
       
      
      private var var_1725:int;
      
      private var var_1831:int;
      
      private var var_1830:String;
      
      public function ErrorReportMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1831 = param1.readInteger();
         this.var_1725 = param1.readInteger();
         this.var_1830 = param1.readString();
         return true;
      }
      
      public function flush() : Boolean
      {
         this.var_1725 = 0;
         this.var_1831 = 0;
         this.var_1830 = null;
         return true;
      }
      
      public function get errorCode() : int
      {
         return this.var_1725;
      }
      
      public function get messageId() : int
      {
         return this.var_1831;
      }
      
      public function get timestamp() : String
      {
         return this.var_1830;
      }
   }
}
