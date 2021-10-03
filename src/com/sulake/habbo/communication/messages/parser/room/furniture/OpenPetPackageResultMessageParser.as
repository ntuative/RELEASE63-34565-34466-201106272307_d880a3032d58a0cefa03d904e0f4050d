package com.sulake.habbo.communication.messages.parser.room.furniture
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class OpenPetPackageResultMessageParser implements IMessageParser
   {
       
      
      private var var_238:int = 0;
      
      private var var_2026:int = 0;
      
      private var var_1813:String = null;
      
      public function OpenPetPackageResultMessageParser()
      {
         super();
      }
      
      public function get objectId() : int
      {
         return this.var_238;
      }
      
      public function get nameValidationStatus() : int
      {
         return this.var_2026;
      }
      
      public function get nameValidationInfo() : String
      {
         return this.var_1813;
      }
      
      public function flush() : Boolean
      {
         this.var_238 = 0;
         this.var_2026 = 0;
         this.var_1813 = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         this.var_238 = param1.readInteger();
         this.var_2026 = param1.readInteger();
         this.var_1813 = param1.readString();
         return true;
      }
   }
}
