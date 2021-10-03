package com.sulake.habbo.communication.messages.incoming.inventory.furni
{
   public class FurniData
   {
       
      
      private var var_2651:int;
      
      private var var_1513:String;
      
      private var _objId:int;
      
      private var var_1899:int;
      
      private var _category:int;
      
      private var var_2248:String;
      
      private var var_2802:Boolean;
      
      private var var_2800:Boolean;
      
      private var var_2801:Boolean;
      
      private var var_2799:Boolean;
      
      private var var_2803:int;
      
      private var var_1602:int;
      
      private var var_2098:String = "";
      
      private var var_1742:int = -1;
      
      public function FurniData(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:Boolean, param8:Boolean, param9:Boolean, param10:Boolean, param11:int)
      {
         super();
         this.var_2651 = param1;
         this.var_1513 = param2;
         this._objId = param3;
         this.var_1899 = param4;
         this._category = param5;
         this.var_2248 = param6;
         this.var_2802 = param7;
         this.var_2800 = param8;
         this.var_2801 = param9;
         this.var_2799 = param10;
         this.var_2803 = param11;
      }
      
      public function setExtraData(param1:String, param2:int) : void
      {
         this.var_2098 = param1;
         this.var_1602 = param2;
      }
      
      public function get stripId() : int
      {
         return this.var_2651;
      }
      
      public function get itemType() : String
      {
         return this.var_1513;
      }
      
      public function get objId() : int
      {
         return this._objId;
      }
      
      public function get classId() : int
      {
         return this.var_1899;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function get stuffData() : String
      {
         return this.var_2248;
      }
      
      public function get isGroupable() : Boolean
      {
         return this.var_2802;
      }
      
      public function get isRecyclable() : Boolean
      {
         return this.var_2800;
      }
      
      public function get isTradeable() : Boolean
      {
         return this.var_2801;
      }
      
      public function get isSellable() : Boolean
      {
         return this.var_2799;
      }
      
      public function get expiryTime() : int
      {
         return this.var_2803;
      }
      
      public function get slotId() : String
      {
         return this.var_2098;
      }
      
      public function get songId() : int
      {
         return this.var_1742;
      }
      
      public function get extra() : int
      {
         return this.var_1602;
      }
   }
}
