package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureQueueTileVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1546:int = 3;
      
      private static const const_1490:int = 2;
      
      private static const const_1489:int = 1;
      
      private static const const_1491:int = 15;
       
      
      private var var_345:Array;
      
      private var var_1188:int;
      
      public function FurnitureQueueTileVisualization()
      {
         this.var_345 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == const_1490)
         {
            this.var_345 = new Array();
            this.var_345.push(const_1489);
            this.var_1188 = const_1491;
         }
         super.setAnimation(param1);
      }
      
      override protected function updateAnimation(param1:Number) : int
      {
         if(this.var_1188 > 0)
         {
            --this.var_1188;
         }
         if(this.var_1188 == 0)
         {
            if(this.var_345.length > 0)
            {
               super.setAnimation(this.var_345.shift());
            }
         }
         return super.updateAnimation(param1);
      }
      
      override protected function usesAnimationResetting() : Boolean
      {
         return true;
      }
   }
}
