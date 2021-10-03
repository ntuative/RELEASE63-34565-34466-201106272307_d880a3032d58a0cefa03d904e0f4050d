package com.sulake.habbo.catalog.marketplace
{
   import flash.display.BitmapData;
   
   public class MarketPlaceOfferData implements IMarketPlaceOfferData
   {
      
      public static const const_117:int = 1;
      
      public static const const_71:int = 2;
       
      
      private var var_1250:int;
      
      private var _furniId:int;
      
      private var var_2316:int;
      
      private var var_2248:String;
      
      private var var_1901:int;
      
      private var var_2315:int;
      
      private var var_2632:int;
      
      private var var_428:int;
      
      private var var_2317:int = -1;
      
      private var var_1900:int;
      
      private var var_47:BitmapData;
      
      public function MarketPlaceOfferData(param1:int, param2:int, param3:int, param4:String, param5:int, param6:int, param7:int, param8:int = -1)
      {
         super();
         this.var_1250 = param1;
         this._furniId = param2;
         this.var_2316 = param3;
         this.var_2248 = param4;
         this.var_1901 = param5;
         this.var_428 = param6;
         this.var_2315 = param7;
         this.var_1900 = param8;
      }
      
      public function dispose() : void
      {
         if(this.var_47)
         {
            this.var_47.dispose();
            this.var_47 = null;
         }
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
      
      public function get averagePrice() : int
      {
         return this.var_2315;
      }
      
      public function get image() : BitmapData
      {
         return this.var_47;
      }
      
      public function set image(param1:BitmapData) : void
      {
         if(this.var_47 != null)
         {
            this.var_47.dispose();
         }
         this.var_47 = param1;
      }
      
      public function set imageCallback(param1:int) : void
      {
         this.var_2632 = param1;
      }
      
      public function get imageCallback() : int
      {
         return this.var_2632;
      }
      
      public function get status() : int
      {
         return this.var_428;
      }
      
      public function get timeLeftMinutes() : int
      {
         return this.var_2317;
      }
      
      public function set timeLeftMinutes(param1:int) : void
      {
         this.var_2317 = param1;
      }
      
      public function set price(param1:int) : void
      {
         this.var_1901 = param1;
      }
      
      public function set offerId(param1:int) : void
      {
         this.var_1250 = param1;
      }
      
      public function get offerCount() : int
      {
         return this.var_1900;
      }
      
      public function set offerCount(param1:int) : void
      {
         this.var_1900 = param1;
      }
   }
}
