package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureBottleVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1133:int = 20;
      
      private static const const_723:int = 9;
      
      private static const const_1546:int = -1;
       
      
      private var var_345:Array;
      
      private var var_888:Boolean = false;
      
      public function FurnitureBottleVisualization()
      {
         this.var_345 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == -1)
         {
            if(!this.var_888)
            {
               this.var_888 = true;
               this.var_345 = new Array();
               this.var_345.push(const_1546);
               return;
            }
         }
         if(param1 >= 0 && param1 <= 7)
         {
            if(this.var_888)
            {
               this.var_888 = false;
               this.var_345 = new Array();
               this.var_345.push(const_1133);
               this.var_345.push(const_723 + param1);
               this.var_345.push(param1);
               return;
            }
            super.setAnimation(param1);
         }
      }
      
      override protected function updateAnimation(param1:Number) : int
      {
         if(super.getLastFramePlayed(0))
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
