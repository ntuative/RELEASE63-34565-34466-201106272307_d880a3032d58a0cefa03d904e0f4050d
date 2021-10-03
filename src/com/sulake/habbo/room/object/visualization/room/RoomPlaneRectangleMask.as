package com.sulake.habbo.room.object.visualization.room
{
   public class RoomPlaneRectangleMask
   {
       
      
      private var var_2896:Number = 0.0;
      
      private var var_2895:Number = 0.0;
      
      private var var_2893:Number = 0.0;
      
      private var var_2894:Number = 0.0;
      
      public function RoomPlaneRectangleMask(param1:Number, param2:Number, param3:Number, param4:Number)
      {
         super();
         this.var_2896 = param1;
         this.var_2895 = param2;
         this.var_2893 = param3;
         this.var_2894 = param4;
      }
      
      public function get leftSideLoc() : Number
      {
         return this.var_2896;
      }
      
      public function get rightSideLoc() : Number
      {
         return this.var_2895;
      }
      
      public function get leftSideLength() : Number
      {
         return this.var_2893;
      }
      
      public function get rightSideLength() : Number
      {
         return this.var_2894;
      }
   }
}
