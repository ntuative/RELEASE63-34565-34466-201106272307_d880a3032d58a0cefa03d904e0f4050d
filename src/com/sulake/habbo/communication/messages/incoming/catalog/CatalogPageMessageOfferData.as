package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageOfferData
   {
       
      
      private var var_1250:int;
      
      private var var_2044:String;
      
      private var var_1328:int;
      
      private var var_1327:int;
      
      private var var_2045:int;
      
      private var var_2097:int;
      
      private var var_1385:Array;
      
      public function CatalogPageMessageOfferData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1250 = param1.readInteger();
         this.var_2044 = param1.readString();
         this.var_1328 = param1.readInteger();
         this.var_1327 = param1.readInteger();
         this.var_2045 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         this.var_1385 = new Array();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            this.var_1385.push(new CatalogPageMessageProductData(param1));
            _loc3_++;
         }
         this.var_2097 = param1.readInteger();
      }
      
      public function get offerId() : int
      {
         return this.var_1250;
      }
      
      public function get localizationId() : String
      {
         return this.var_2044;
      }
      
      public function get priceInCredits() : int
      {
         return this.var_1328;
      }
      
      public function get priceInActivityPoints() : int
      {
         return this.var_1327;
      }
      
      public function get products() : Array
      {
         return this.var_1385;
      }
      
      public function get activityPointType() : int
      {
         return this.var_2045;
      }
      
      public function get clubLevel() : int
      {
         return this.var_2097;
      }
   }
}
