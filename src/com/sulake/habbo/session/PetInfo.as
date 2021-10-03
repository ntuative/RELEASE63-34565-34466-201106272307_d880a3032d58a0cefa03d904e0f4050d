package com.sulake.habbo.session
{
   public class PetInfo implements IPetInfo
   {
       
      
      private var var_1756:int;
      
      private var var_1160:int;
      
      private var var_2597:int;
      
      private var var_2593:int;
      
      private var var_2594:int;
      
      private var _energy:int;
      
      private var var_2595:int;
      
      private var _nutrition:int;
      
      private var var_2596:int;
      
      private var var_2598:int;
      
      private var _ownerName:String;
      
      private var var_2646:int;
      
      private var var_520:int;
      
      public function PetInfo()
      {
         super();
      }
      
      public function get petId() : int
      {
         return this.var_1756;
      }
      
      public function get level() : int
      {
         return this.var_1160;
      }
      
      public function get levelMax() : int
      {
         return this.var_2597;
      }
      
      public function get experience() : int
      {
         return this.var_2593;
      }
      
      public function get experienceMax() : int
      {
         return this.var_2594;
      }
      
      public function get energy() : int
      {
         return this._energy;
      }
      
      public function get energyMax() : int
      {
         return this.var_2595;
      }
      
      public function get nutrition() : int
      {
         return this._nutrition;
      }
      
      public function get nutritionMax() : int
      {
         return this.var_2596;
      }
      
      public function get ownerId() : int
      {
         return this.var_2598;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get respect() : int
      {
         return this.var_2646;
      }
      
      public function get age() : int
      {
         return this.var_520;
      }
      
      public function set petId(param1:int) : void
      {
         this.var_1756 = param1;
      }
      
      public function set level(param1:int) : void
      {
         this.var_1160 = param1;
      }
      
      public function set levelMax(param1:int) : void
      {
         this.var_2597 = param1;
      }
      
      public function set experience(param1:int) : void
      {
         this.var_2593 = param1;
      }
      
      public function set experienceMax(param1:int) : void
      {
         this.var_2594 = param1;
      }
      
      public function set energy(param1:int) : void
      {
         this._energy = param1;
      }
      
      public function set energyMax(param1:int) : void
      {
         this.var_2595 = param1;
      }
      
      public function set nutrition(param1:int) : void
      {
         this._nutrition = param1;
      }
      
      public function set nutritionMax(param1:int) : void
      {
         this.var_2596 = param1;
      }
      
      public function set ownerId(param1:int) : void
      {
         this.var_2598 = param1;
      }
      
      public function set ownerName(param1:String) : void
      {
         this._ownerName = param1;
      }
      
      public function set respect(param1:int) : void
      {
         this.var_2646 = param1;
      }
      
      public function set age(param1:int) : void
      {
         this.var_520 = param1;
      }
   }
}
