package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceItemStatsParser implements IMessageParser
   {
       
      
      private var var_2315:int;
      
      private var var_2431:int;
      
      private var var_2429:int;
      
      private var _dayOffsets:Array;
      
      private var var_1785:Array;
      
      private var var_1786:Array;
      
      private var var_2432:int;
      
      private var var_2430:int;
      
      public function MarketplaceItemStatsParser()
      {
         super();
      }
      
      public function get averagePrice() : int
      {
         return this.var_2315;
      }
      
      public function get offerCount() : int
      {
         return this.var_2431;
      }
      
      public function get historyLength() : int
      {
         return this.var_2429;
      }
      
      public function get dayOffsets() : Array
      {
         return this._dayOffsets;
      }
      
      public function get averagePrices() : Array
      {
         return this.var_1785;
      }
      
      public function get soldAmounts() : Array
      {
         return this.var_1786;
      }
      
      public function get furniTypeId() : int
      {
         return this.var_2432;
      }
      
      public function get furniCategoryId() : int
      {
         return this.var_2430;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_2315 = param1.readInteger();
         this.var_2431 = param1.readInteger();
         this.var_2429 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         this._dayOffsets = [];
         this.var_1785 = [];
         this.var_1786 = [];
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            this._dayOffsets.push(param1.readInteger());
            this.var_1785.push(param1.readInteger());
            this.var_1786.push(param1.readInteger());
            _loc3_++;
         }
         this.var_2430 = param1.readInteger();
         this.var_2432 = param1.readInteger();
         return true;
      }
   }
}
