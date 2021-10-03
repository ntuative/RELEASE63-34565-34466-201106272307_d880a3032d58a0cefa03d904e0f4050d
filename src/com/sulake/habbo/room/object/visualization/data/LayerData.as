package com.sulake.habbo.room.object.visualization.data
{
   public class LayerData
   {
      
      public static const const_871:String = "";
      
      public static const const_428:int = 0;
      
      public static const const_507:int = 255;
      
      public static const const_973:Boolean = false;
      
      public static const const_644:int = 0;
      
      public static const const_503:int = 0;
      
      public static const const_408:int = 0;
      
      public static const const_1381:int = 1;
      
      public static const const_1409:int = 2;
      
      public static const INK_DARKEN:int = 3;
       
      
      private var var_2330:String = "";
      
      private var var_1849:int = 0;
      
      private var var_2328:int = 255;
      
      private var var_2521:Boolean = false;
      
      private var var_2522:int = 0;
      
      private var var_2523:int = 0;
      
      private var var_2520:Number = 0;
      
      public function LayerData()
      {
         super();
      }
      
      public function set tag(param1:String) : void
      {
         this.var_2330 = param1;
      }
      
      public function get tag() : String
      {
         return this.var_2330;
      }
      
      public function set ink(param1:int) : void
      {
         this.var_1849 = param1;
      }
      
      public function get ink() : int
      {
         return this.var_1849;
      }
      
      public function set alpha(param1:int) : void
      {
         this.var_2328 = param1;
      }
      
      public function get alpha() : int
      {
         return this.var_2328;
      }
      
      public function set ignoreMouse(param1:Boolean) : void
      {
         this.var_2521 = param1;
      }
      
      public function get ignoreMouse() : Boolean
      {
         return this.var_2521;
      }
      
      public function set xOffset(param1:int) : void
      {
         this.var_2522 = param1;
      }
      
      public function get xOffset() : int
      {
         return this.var_2522;
      }
      
      public function set yOffset(param1:int) : void
      {
         this.var_2523 = param1;
      }
      
      public function get yOffset() : int
      {
         return this.var_2523;
      }
      
      public function set zOffset(param1:Number) : void
      {
         this.var_2520 = param1;
      }
      
      public function get zOffset() : Number
      {
         return this.var_2520;
      }
      
      public function copyValues(param1:LayerData) : void
      {
         if(param1 != null)
         {
            this.tag = param1.tag;
            this.ink = param1.ink;
            this.alpha = param1.alpha;
            this.ignoreMouse = param1.ignoreMouse;
            this.xOffset = param1.xOffset;
            this.yOffset = param1.yOffset;
            this.zOffset = param1.zOffset;
         }
      }
   }
}
