package com.sulake.core.utils.profiler.tracking
{
   import flash.display.BitmapData;
   
   public class TrackedBitmapData extends BitmapData
   {
      
      public static const const_2210:int = 16777215;
      
      public static const const_1336:int = 8191;
      
      public static const const_1368:int = 8191;
      
      public static const const_2129:int = 1;
      
      public static const const_1256:int = 1;
      
      public static const const_1171:int = 1;
      
      private static var var_566:uint = 0;
      
      private static var var_567:uint = 0;
       
      
      private var _owner:Object;
      
      private var _disposed:Boolean = false;
      
      public function TrackedBitmapData(param1:*, param2:int, param3:int, param4:Boolean = true, param5:uint = 4.294967295E9)
      {
         if(param2 > const_1336)
         {
            param2 = const_1336;
         }
         else if(param2 < const_1256)
         {
            param2 = const_1256;
         }
         if(param3 > const_1368)
         {
            param3 = const_1368;
         }
         else if(param3 < const_1171)
         {
            param3 = const_1171;
         }
         super(param2,param3,param4,param5);
         ++var_566;
         var_567 += param2 * param3 * 4;
         this._owner = param1;
      }
      
      public static function get numInstances() : uint
      {
         return var_566;
      }
      
      public static function get allocatedByteCount() : uint
      {
         return var_567;
      }
      
      override public function dispose() : void
      {
         if(!this._disposed)
         {
            var_567 -= width * height * 4;
            --var_566;
            this._disposed = true;
            this._owner = null;
            super.dispose();
         }
      }
   }
}
