package com.sulake.habbo.communication.messages.incoming.inventory.trading
{
   public class ItemDataStructure
   {
       
      
      private var var_2605:int;
      
      private var var_1513:String;
      
      private var var_2607:int;
      
      private var var_2604:int;
      
      private var _category:int;
      
      private var var_2248:String;
      
      private var var_1602:int;
      
      private var var_2606:int;
      
      private var var_2601:int;
      
      private var var_2603:int;
      
      private var var_2608:int;
      
      private var var_2602:Boolean;
      
      private var var_3108:int;
      
      public function ItemDataStructure(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:int, param8:int, param9:int, param10:int, param11:int, param12:Boolean)
      {
         super();
         this.var_2605 = param1;
         this.var_1513 = param2;
         this.var_2607 = param3;
         this.var_2604 = param4;
         this._category = param5;
         this.var_2248 = param6;
         this.var_1602 = param7;
         this.var_2606 = param8;
         this.var_2601 = param9;
         this.var_2603 = param10;
         this.var_2608 = param11;
         this.var_2602 = param12;
      }
      
      public function get itemID() : int
      {
         return this.var_2605;
      }
      
      public function get itemType() : String
      {
         return this.var_1513;
      }
      
      public function get roomItemID() : int
      {
         return this.var_2607;
      }
      
      public function get itemTypeID() : int
      {
         return this.var_2604;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function get stuffData() : String
      {
         return this.var_2248;
      }
      
      public function get extra() : int
      {
         return this.var_1602;
      }
      
      public function get timeToExpiration() : int
      {
         return this.var_2606;
      }
      
      public function get creationDay() : int
      {
         return this.var_2601;
      }
      
      public function get creationMonth() : int
      {
         return this.var_2603;
      }
      
      public function get creationYear() : int
      {
         return this.var_2608;
      }
      
      public function get groupable() : Boolean
      {
         return this.var_2602;
      }
      
      public function get songID() : int
      {
         return this.var_1602;
      }
   }
}
