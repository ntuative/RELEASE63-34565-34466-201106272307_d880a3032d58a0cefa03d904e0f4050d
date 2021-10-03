package com.sulake.habbo.room.object
{
   public class RoomStairData
   {
       
      
      private var var_2678:int;
      
      private var var_1938:Boolean;
      
      private var var_1937:Boolean;
      
      private var var_48:Boolean;
      
      public function RoomStairData(param1:int, param2:Boolean, param3:Boolean, param4:Boolean)
      {
         super();
         this.var_48 = param4;
         this.var_2678 = param1;
         this.var_1938 = param2;
         this.var_1937 = param3;
      }
      
      public function get stairHeight() : int
      {
         return this.var_2678;
      }
      
      public function get neighbourStairMin() : Boolean
      {
         return this.var_1938;
      }
      
      public function get neighbourStairMax() : Boolean
      {
         return this.var_1937;
      }
      
      public function get neighbourStair() : Boolean
      {
         return this.var_1938 || this.var_1937;
      }
      
      public function get border() : Boolean
      {
         return this.var_48;
      }
   }
}
