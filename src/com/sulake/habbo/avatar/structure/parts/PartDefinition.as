package com.sulake.habbo.avatar.structure.parts
{
   public class PartDefinition
   {
       
      
      private var var_2353:String;
      
      private var var_1759:String;
      
      private var var_2352:String;
      
      private var var_1761:Boolean;
      
      private var var_1760:int = -1;
      
      public function PartDefinition(param1:XML)
      {
         super();
         this.var_2353 = String(param1["set-type"]);
         this.var_1759 = String(param1["flipped-set-type"]);
         this.var_2352 = String(param1["remove-set-type"]);
         this.var_1761 = false;
      }
      
      public function hasStaticId() : Boolean
      {
         return this.var_1760 >= 0;
      }
      
      public function get staticId() : int
      {
         return this.var_1760;
      }
      
      public function set staticId(param1:int) : void
      {
         this.var_1760 = param1;
      }
      
      public function get setType() : String
      {
         return this.var_2353;
      }
      
      public function get flippedSetType() : String
      {
         return this.var_1759;
      }
      
      public function get removeSetType() : String
      {
         return this.var_2352;
      }
      
      public function get appendToFigure() : Boolean
      {
         return this.var_1761;
      }
      
      public function set appendToFigure(param1:Boolean) : void
      {
         this.var_1761 = param1;
      }
      
      public function set flippedSetType(param1:String) : void
      {
         this.var_1759 = param1;
      }
   }
}
