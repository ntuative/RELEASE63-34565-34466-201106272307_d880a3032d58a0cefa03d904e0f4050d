package com.sulake.habbo.communication.messages.incoming.avatar
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class OutfitData
   {
       
      
      private var var_2098:int;
      
      private var var_2277:String;
      
      private var var_1101:String;
      
      public function OutfitData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2098 = param1.readInteger();
         this.var_2277 = param1.readString();
         this.var_1101 = param1.readString();
      }
      
      public function get slotId() : int
      {
         return this.var_2098;
      }
      
      public function get figureString() : String
      {
         return this.var_2277;
      }
      
      public function get gender() : String
      {
         return this.var_1101;
      }
   }
}
