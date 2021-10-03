package com.sulake.habbo.communication.messages.parser.room.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetInfoMessageParser implements IMessageParser
   {
       
      
      private var var_1756:int;
      
      private var _name:String;
      
      private var var_1160:int;
      
      private var var_2725:int;
      
      private var var_2593:int;
      
      private var _energy:int;
      
      private var _nutrition:int;
      
      private var _figure:String;
      
      private var var_2723:int;
      
      private var var_2722:int;
      
      private var var_2724:int;
      
      private var var_2646:int;
      
      private var var_2598:int;
      
      private var _ownerName:String;
      
      private var var_520:int;
      
      public function PetInfoMessageParser()
      {
         super();
      }
      
      public function get petId() : int
      {
         return this.var_1756;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get level() : int
      {
         return this.var_1160;
      }
      
      public function get maxLevel() : int
      {
         return this.var_2725;
      }
      
      public function get experience() : int
      {
         return this.var_2593;
      }
      
      public function get energy() : int
      {
         return this._energy;
      }
      
      public function get nutrition() : int
      {
         return this._nutrition;
      }
      
      public function get figure() : String
      {
         return this._figure;
      }
      
      public function get experienceRequiredToLevel() : int
      {
         return this.var_2723;
      }
      
      public function get maxEnergy() : int
      {
         return this.var_2722;
      }
      
      public function get maxNutrition() : int
      {
         return this.var_2724;
      }
      
      public function get respect() : int
      {
         return this.var_2646;
      }
      
      public function get ownerId() : int
      {
         return this.var_2598;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get age() : int
      {
         return this.var_520;
      }
      
      public function flush() : Boolean
      {
         this.var_1756 = -1;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         this.var_1756 = param1.readInteger();
         this._name = param1.readString();
         this.var_1160 = param1.readInteger();
         this.var_2725 = param1.readInteger();
         this.var_2593 = param1.readInteger();
         this.var_2723 = param1.readInteger();
         this._energy = param1.readInteger();
         this.var_2722 = param1.readInteger();
         this._nutrition = param1.readInteger();
         this.var_2724 = param1.readInteger();
         this._figure = param1.readString();
         this.var_2646 = param1.readInteger();
         this.var_2598 = param1.readInteger();
         this.var_520 = param1.readInteger();
         this._ownerName = param1.readString();
         return true;
      }
   }
}
