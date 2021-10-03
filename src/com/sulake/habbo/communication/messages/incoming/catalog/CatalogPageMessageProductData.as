package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageProductData
   {
      
      public static const const_65:String = "i";
      
      public static const const_78:String = "s";
      
      public static const const_194:String = "e";
       
      
      private var var_1471:String;
      
      private var var_2287:int;
      
      private var var_965:String;
      
      private var var_1472:int;
      
      private var var_1792:int;
      
      public function CatalogPageMessageProductData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1471 = param1.readString();
         this.var_2287 = param1.readInteger();
         this.var_965 = param1.readString();
         this.var_1472 = param1.readInteger();
         this.var_1792 = param1.readInteger();
      }
      
      public function get productType() : String
      {
         return this.var_1471;
      }
      
      public function get furniClassId() : int
      {
         return this.var_2287;
      }
      
      public function get extraParam() : String
      {
         return this.var_965;
      }
      
      public function get productCount() : int
      {
         return this.var_1472;
      }
      
      public function get expiration() : int
      {
         return this.var_1792;
      }
   }
}
