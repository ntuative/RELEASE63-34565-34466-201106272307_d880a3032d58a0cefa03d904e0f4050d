package com.sulake.habbo.communication.messages.incoming.marketplace
{
   public class MarketPlaceOffer
   {
       
      
      private var var_1250:int;
      
      private var _furniId:int;
      
      private var var_2316:int;
      
      private var var_2248:String;
      
      private var var_1901:int;
      
      private var var_428:int;
      
      private var var_2317:int = -1;
      
      private var var_2315:int;
      
      private var var_1900:int;
      
      public function MarketPlaceOffer(param1:int, param2:int, param3:int, param4:String, param5:int, param6:int, param7:int, param8:int, param9:int = -1)
      {
         super();
         this.var_1250 = param1;
         this._furniId = param2;
         this.var_2316 = param3;
         this.var_2248 = param4;
         this.var_1901 = param5;
         this.var_428 = param6;
         this.var_2317 = param7;
         this.var_2315 = param8;
         this.var_1900 = param9;
      }
      
      public function get offerId() : int
      {
         return this.var_1250;
      }
      
      public function get furniId() : int
      {
         return this._furniId;
      }
      
      public function get furniType() : int
      {
         return this.var_2316;
      }
      
      public function get stuffData() : String
      {
         return this.var_2248;
      }
      
      public function get price() : int
      {
         return this.var_1901;
      }
      
      public function get status() : int
      {
         return this.var_428;
      }
      
      public function get timeLeftMinutes() : int
      {
         return this.var_2317;
      }
      
      public function get averagePrice() : int
      {
         return this.var_2315;
      }
      
      public function get offerCount() : int
      {
         return this.var_1900;
      }
   }
}
