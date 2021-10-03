package com.sulake.habbo.room.object.visualization.room.mask
{
   import com.sulake.room.object.visualization.utils.IGraphicAsset;
   
   public class PlaneMaskBitmap
   {
      
      public static const const_60:Number = -1;
      
      public static const MAX_NORMAL_COORDINATE_VALUE:Number = 1;
       
      
      private var var_474:IGraphicAsset = null;
      
      private var var_2708:Number = -1.0;
      
      private var _normalMaxX:Number = 1.0;
      
      private var var_2707:Number = -1.0;
      
      private var var_2709:Number = 1.0;
      
      public function PlaneMaskBitmap(param1:IGraphicAsset, param2:Number = -1.0, param3:Number = 1.0, param4:Number = -1.0, param5:Number = 1.0)
      {
         super();
         this.var_2708 = param2;
         this._normalMaxX = param3;
         this.var_2707 = param4;
         this.var_2709 = param5;
         this.var_474 = param1;
      }
      
      public function get asset() : IGraphicAsset
      {
         return this.var_474;
      }
      
      public function get normalMinX() : Number
      {
         return this.var_2708;
      }
      
      public function get normalMaxX() : Number
      {
         return this._normalMaxX;
      }
      
      public function get normalMinY() : Number
      {
         return this.var_2707;
      }
      
      public function get normalMaxY() : Number
      {
         return this.var_2709;
      }
      
      public function dispose() : void
      {
         this.var_474 = null;
      }
   }
}
