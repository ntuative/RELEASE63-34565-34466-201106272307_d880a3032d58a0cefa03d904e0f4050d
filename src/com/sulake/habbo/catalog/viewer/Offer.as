package com.sulake.habbo.catalog.viewer
{
   import com.sulake.habbo.catalog.IPurchasableOffer;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.session.product.IProductData;
   
   public class Offer implements IPurchasableOffer
   {
      
      public static const const_1817:String = "pricing_model_unknown";
      
      public static const const_396:String = "pricing_model_single";
      
      public static const const_394:String = "pricing_model_multi";
      
      public static const const_550:String = "pricing_model_bundle";
      
      public static const const_2029:String = "price_type_none";
      
      public static const const_903:String = "price_type_credits";
      
      public static const const_1347:String = "price_type_activitypoints";
      
      public static const const_1167:String = "price_type_credits_and_activitypoints";
       
      
      private var var_885:String;
      
      private var var_1329:String;
      
      private var var_1250:int;
      
      private var var_2044:String;
      
      private var var_1328:int;
      
      private var var_1327:int;
      
      private var var_2045:int;
      
      private var var_408:ICatalogPage;
      
      private var var_700:IProductContainer;
      
      private var _disposed:Boolean = false;
      
      private var var_2097:int = 0;
      
      private var var_2817:int;
      
      public function Offer(param1:int, param2:String, param3:int, param4:int, param5:int, param6:int, param7:Array, param8:ICatalogPage)
      {
         super();
         this.var_1250 = param1;
         this.var_2044 = param2;
         this.var_1328 = param3;
         this.var_1327 = param4;
         this.var_2045 = param5;
         this.var_408 = param8;
         this.var_2097 = param6;
         this.analyzePricingModel(param7);
         this.analyzePriceType();
         this.createProductContainer(param7);
      }
      
      public function get clubLevel() : int
      {
         return this.var_2097;
      }
      
      public function get page() : ICatalogPage
      {
         return this.var_408;
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
      
      public function get activityPointType() : int
      {
         return this.var_2045;
      }
      
      public function get productContainer() : IProductContainer
      {
         return this.var_700;
      }
      
      public function get pricingModel() : String
      {
         return this.var_885;
      }
      
      public function get priceType() : String
      {
         return this.var_1329;
      }
      
      public function get previewCallbackId() : int
      {
         return this.var_2817;
      }
      
      public function set previewCallbackId(param1:int) : void
      {
         this.var_2817 = param1;
      }
      
      public function dispose() : void
      {
         if(this.disposed)
         {
            return;
         }
         this._disposed = true;
         this.var_1250 = 0;
         this.var_2044 = "";
         this.var_1328 = 0;
         this.var_1327 = 0;
         this.var_2045 = 0;
         this.var_408 = null;
         if(this.var_700 != null)
         {
            this.var_700.dispose();
            this.var_700 = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      private function createProductContainer(param1:Array) : void
      {
         switch(this.var_885)
         {
            case const_396:
               this.var_700 = new SingleProductContainer(this,param1);
               break;
            case const_394:
               this.var_700 = new MultiProductContainer(this,param1);
               break;
            case const_550:
               this.var_700 = new BundleProductContainer(this,param1);
               break;
            default:
               Logger.log("[Offer] Unknown pricing model" + this.var_885);
         }
      }
      
      private function analyzePricingModel(param1:Array) : void
      {
         var _loc2_:* = null;
         if(param1.length == 1)
         {
            _loc2_ = param1[0];
            if(_loc2_.productCount == 1)
            {
               this.var_885 = const_396;
            }
            else
            {
               this.var_885 = const_394;
            }
         }
         else if(param1.length > 1)
         {
            this.var_885 = const_550;
         }
         else
         {
            this.var_885 = const_1817;
         }
      }
      
      private function analyzePriceType() : void
      {
         if(this.var_1328 > 0 && this.var_1327 > 0)
         {
            this.var_1329 = const_1167;
         }
         else if(this.var_1328 > 0)
         {
            this.var_1329 = const_903;
         }
         else if(this.var_1327 > 0)
         {
            this.var_1329 = const_1347;
         }
         else
         {
            this.var_1329 = const_2029;
         }
      }
      
      public function clone() : Offer
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc1_:Array = new Array();
         var _loc2_:IProductData = this.var_408.viewer.catalog.getProductData(this.localizationId);
         for each(_loc3_ in this.var_700.products)
         {
            _loc4_ = this.var_408.viewer.catalog.getFurnitureData(_loc3_.productClassId,_loc3_.productType);
            _loc5_ = new Product(_loc3_.productType,_loc3_.productClassId,_loc3_.extraParam,_loc3_.productCount,_loc3_.expiration,_loc2_,_loc4_);
            _loc1_.push(_loc5_);
         }
         return new Offer(this.offerId,this.localizationId,this.priceInCredits,this.priceInActivityPoints,this.activityPointType,this.clubLevel,_loc1_,this.page);
      }
   }
}
