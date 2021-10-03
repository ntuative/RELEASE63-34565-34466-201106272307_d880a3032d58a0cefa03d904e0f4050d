package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceConfigurationParser implements IMessageParser
   {
       
      
      private var var_1642:Boolean;
      
      private var var_2337:int;
      
      private var var_1745:int;
      
      private var var_1744:int;
      
      private var var_2338:int;
      
      private var var_2333:int;
      
      private var var_2332:int;
      
      private var var_2335:int;
      
      public function MarketplaceConfigurationParser()
      {
         super();
      }
      
      public function get isEnabled() : Boolean
      {
         return this.var_1642;
      }
      
      public function get commission() : int
      {
         return this.var_2337;
      }
      
      public function get tokenBatchPrice() : int
      {
         return this.var_1745;
      }
      
      public function get tokenBatchSize() : int
      {
         return this.var_1744;
      }
      
      public function get offerMinPrice() : int
      {
         return this.var_2333;
      }
      
      public function get offerMaxPrice() : int
      {
         return this.var_2338;
      }
      
      public function get expirationHours() : int
      {
         return this.var_2332;
      }
      
      public function get averagePricePeriod() : int
      {
         return this.var_2335;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1642 = param1.readBoolean();
         this.var_2337 = param1.readInteger();
         this.var_1745 = param1.readInteger();
         this.var_1744 = param1.readInteger();
         this.var_2333 = param1.readInteger();
         this.var_2338 = param1.readInteger();
         this.var_2332 = param1.readInteger();
         this.var_2335 = param1.readInteger();
         return true;
      }
   }
}
