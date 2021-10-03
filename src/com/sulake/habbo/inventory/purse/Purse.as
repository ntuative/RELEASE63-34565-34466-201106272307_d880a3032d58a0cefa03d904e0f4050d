package com.sulake.habbo.inventory.purse
{
   public class Purse
   {
       
      
      private var var_1979:int = 0;
      
      private var var_1978:int = 0;
      
      private var var_3023:int = 0;
      
      private var var_3024:Boolean = false;
      
      private var var_2511:Boolean = false;
      
      private var var_2728:Boolean = false;
      
      public function Purse()
      {
         super();
      }
      
      public function set clubDays(param1:int) : void
      {
         this.var_1979 = Math.max(0,param1);
      }
      
      public function set clubPeriods(param1:int) : void
      {
         this.var_1978 = Math.max(0,param1);
      }
      
      public function set clubPastPeriods(param1:int) : void
      {
         this.var_3023 = Math.max(0,param1);
      }
      
      public function set clubHasEverBeenMember(param1:Boolean) : void
      {
         this.var_3024 = param1;
      }
      
      public function set isVIP(param1:Boolean) : void
      {
         this.var_2511 = param1;
      }
      
      public function set clubIsExpiring(param1:Boolean) : void
      {
         this.var_2728 = param1;
      }
      
      public function get clubDays() : int
      {
         return this.var_1979;
      }
      
      public function get clubPeriods() : int
      {
         return this.var_1978;
      }
      
      public function get clubPastPeriods() : int
      {
         return this.var_3023;
      }
      
      public function get clubHasEverBeenMember() : Boolean
      {
         return this.var_3024;
      }
      
      public function get isVIP() : Boolean
      {
         return this.var_2511;
      }
      
      public function get clubIsExpiring() : Boolean
      {
         return this.var_2728;
      }
   }
}
