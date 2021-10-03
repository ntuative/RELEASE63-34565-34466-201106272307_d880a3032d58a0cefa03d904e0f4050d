package com.sulake.habbo.catalog.purse
{
   import flash.utils.Dictionary;
   
   public class Purse implements IPurse
   {
       
      
      private var var_1871:int = 0;
      
      private var var_1579:Dictionary;
      
      private var var_1979:int = 0;
      
      private var var_1978:int = 0;
      
      private var var_2511:Boolean = false;
      
      private var var_2509:int = 0;
      
      private var var_2504:int = 0;
      
      private var var_2728:Boolean = false;
      
      public function Purse()
      {
         this.var_1579 = new Dictionary();
         super();
      }
      
      public function get credits() : int
      {
         return this.var_1871;
      }
      
      public function set credits(param1:int) : void
      {
         this.var_1871 = param1;
      }
      
      public function get clubDays() : int
      {
         return this.var_1979;
      }
      
      public function set clubDays(param1:int) : void
      {
         this.var_1979 = param1;
      }
      
      public function get clubPeriods() : int
      {
         return this.var_1978;
      }
      
      public function set clubPeriods(param1:int) : void
      {
         this.var_1978 = param1;
      }
      
      public function get hasClubLeft() : Boolean
      {
         return this.var_1979 > 0 || this.var_1978 > 0;
      }
      
      public function get isVIP() : Boolean
      {
         return this.var_2511;
      }
      
      public function get isExpiring() : Boolean
      {
         return this.var_2728;
      }
      
      public function set isExpiring(param1:Boolean) : void
      {
         this.var_2728 = param1;
      }
      
      public function set isVIP(param1:Boolean) : void
      {
         this.var_2511 = param1;
      }
      
      public function get pastClubDays() : int
      {
         return this.var_2509;
      }
      
      public function set pastClubDays(param1:int) : void
      {
         this.var_2509 = param1;
      }
      
      public function get pastVipDays() : int
      {
         return this.var_2504;
      }
      
      public function set pastVipDays(param1:int) : void
      {
         this.var_2504 = param1;
      }
      
      public function get activityPoints() : Dictionary
      {
         return this.var_1579;
      }
      
      public function set activityPoints(param1:Dictionary) : void
      {
         this.var_1579 = param1;
      }
      
      public function getActivityPointsForType(param1:int) : int
      {
         return this.var_1579[param1];
      }
   }
}
