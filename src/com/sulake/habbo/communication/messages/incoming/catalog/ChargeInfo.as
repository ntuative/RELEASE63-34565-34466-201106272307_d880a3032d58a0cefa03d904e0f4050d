package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ChargeInfo
   {
       
      
      private var var_2433:int;
      
      private var var_2500:int;
      
      private var var_1328:int;
      
      private var var_1327:int;
      
      private var var_2045:int;
      
      private var var_2499:int;
      
      public function ChargeInfo(param1:IMessageDataWrapper)
      {
         super();
         this.var_2433 = param1.readInteger();
         this.var_2500 = param1.readInteger();
         this.var_1328 = param1.readInteger();
         this.var_1327 = param1.readInteger();
         this.var_2045 = param1.readInteger();
         this.var_2499 = param1.readInteger();
      }
      
      public function get stuffId() : int
      {
         return this.var_2433;
      }
      
      public function get charges() : int
      {
         return this.var_2500;
      }
      
      public function get priceInCredits() : int
      {
         return this.var_1328;
      }
      
      public function get priceInActivityPoints() : int
      {
         return this.var_1327;
      }
      
      public function get chargePatchSize() : int
      {
         return this.var_2499;
      }
      
      public function get activityPointType() : int
      {
         return this.var_2045;
      }
   }
}
