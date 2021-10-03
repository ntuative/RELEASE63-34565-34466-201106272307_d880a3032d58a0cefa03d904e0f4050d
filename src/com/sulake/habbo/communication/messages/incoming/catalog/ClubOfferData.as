package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ClubOfferData
   {
       
      
      private var var_1250:int;
      
      private var var_1751:String;
      
      private var var_1901:int;
      
      private var _upgrade:Boolean;
      
      private var var_2884:Boolean;
      
      private var var_2888:int;
      
      private var var_2883:int;
      
      private var var_2886:int;
      
      private var var_2887:int;
      
      private var var_2885:int;
      
      public function ClubOfferData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1250 = param1.readInteger();
         this.var_1751 = param1.readString();
         this.var_1901 = param1.readInteger();
         this._upgrade = param1.readBoolean();
         this.var_2884 = param1.readBoolean();
         this.var_2888 = param1.readInteger();
         this.var_2883 = param1.readInteger();
         this.var_2886 = param1.readInteger();
         this.var_2887 = param1.readInteger();
         this.var_2885 = param1.readInteger();
      }
      
      public function get offerId() : int
      {
         return this.var_1250;
      }
      
      public function get productCode() : String
      {
         return this.var_1751;
      }
      
      public function get price() : int
      {
         return this.var_1901;
      }
      
      public function get upgrade() : Boolean
      {
         return this._upgrade;
      }
      
      public function get vip() : Boolean
      {
         return this.var_2884;
      }
      
      public function get periods() : int
      {
         return this.var_2888;
      }
      
      public function get daysLeftAfterPurchase() : int
      {
         return this.var_2883;
      }
      
      public function get year() : int
      {
         return this.var_2886;
      }
      
      public function get month() : int
      {
         return this.var_2887;
      }
      
      public function get day() : int
      {
         return this.var_2885;
      }
   }
}
