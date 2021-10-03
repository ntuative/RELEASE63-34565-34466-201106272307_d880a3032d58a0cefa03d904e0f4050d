package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureValRandomizerVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1133:int = 20;
      
      private static const const_723:int = 10;
      
      private static const const_1665:int = 31;
      
      private static const const_1546:int = 32;
      
      private static const const_722:int = 30;
       
      
      private var var_345:Array;
      
      private var var_888:Boolean = false;
      
      public function FurnitureValRandomizerVisualization()
      {
         this.var_345 = new Array();
         super();
         super.setAnimation(const_722);
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == 0)
         {
            if(!this.var_888)
            {
               this.var_888 = true;
               this.var_345 = new Array();
               this.var_345.push(const_1665);
               this.var_345.push(const_1546);
               return;
            }
         }
         if(param1 > 0 && param1 <= const_723)
         {
            if(this.var_888)
            {
               this.var_888 = false;
               this.var_345 = new Array();
               if(direction == 2)
               {
                  this.var_345.push(const_1133 + 5 - param1);
                  this.var_345.push(const_723 + 5 - param1);
               }
               else
               {
                  this.var_345.push(const_1133 + param1);
                  this.var_345.push(const_723 + param1);
               }
               this.var_345.push(const_722);
               return;
            }
            super.setAnimation(const_722);
         }
      }
      
      override protected function updateAnimation(param1:Number) : int
      {
         if(super.getLastFramePlayed(11))
         {
            if(this.var_345.length > 0)
            {
               super.setAnimation(this.var_345.shift());
            }
         }
         return super.updateAnimation(param1);
      }
   }
}
