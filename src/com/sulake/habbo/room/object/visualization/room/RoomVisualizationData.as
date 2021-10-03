package com.sulake.habbo.room.object.visualization.room
{
   import com.sulake.habbo.room.object.visualization.room.mask.PlaneMaskManager;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.IPlaneRasterizer;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.animated.LandscapeRasterizer;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.basic.FloorRasterizer;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.basic.WallAdRasterizer;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.basic.WallRasterizer;
   import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
   import com.sulake.room.object.visualization.utils.IGraphicAssetCollection;
   
   public class RoomVisualizationData implements IRoomObjectVisualizationData
   {
       
      
      private var var_524:WallRasterizer;
      
      private var var_526:FloorRasterizer;
      
      private var var_782:WallAdRasterizer;
      
      private var var_525:LandscapeRasterizer;
      
      private var var_783:PlaneMaskManager;
      
      private var var_796:Boolean = false;
      
      public function RoomVisualizationData()
      {
         super();
         this.var_524 = new WallRasterizer();
         this.var_526 = new FloorRasterizer();
         this.var_782 = new WallAdRasterizer();
         this.var_525 = new LandscapeRasterizer();
         this.var_783 = new PlaneMaskManager();
      }
      
      public function get initialized() : Boolean
      {
         return this.var_796;
      }
      
      public function get floorRasterizer() : IPlaneRasterizer
      {
         return this.var_526;
      }
      
      public function get wallRasterizer() : IPlaneRasterizer
      {
         return this.var_524;
      }
      
      public function get wallAdRasterizr() : WallAdRasterizer
      {
         return this.var_782;
      }
      
      public function get landscapeRasterizer() : IPlaneRasterizer
      {
         return this.var_525;
      }
      
      public function get maskManager() : PlaneMaskManager
      {
         return this.var_783;
      }
      
      public function dispose() : void
      {
         if(this.var_524 != null)
         {
            this.var_524.dispose();
            this.var_524 = null;
         }
         if(this.var_526 != null)
         {
            this.var_526.dispose();
            this.var_526 = null;
         }
         if(this.var_782 != null)
         {
            this.var_782.dispose();
            this.var_782 = null;
         }
         if(this.var_525 != null)
         {
            this.var_525.dispose();
            this.var_525 = null;
         }
         if(this.var_783 != null)
         {
            this.var_783.dispose();
            this.var_783 = null;
         }
      }
      
      public function clearCache() : void
      {
         if(this.var_524 != null)
         {
            this.var_524.clearCache();
         }
         if(this.var_526 != null)
         {
            this.var_526.clearCache();
         }
         if(this.var_525 != null)
         {
            this.var_525.clearCache();
         }
      }
      
      public function initialize(param1:XML) : Boolean
      {
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         this.reset();
         if(param1 == null)
         {
            return false;
         }
         var _loc2_:XMLList = param1.wallData;
         if(_loc2_.length() > 0)
         {
            _loc7_ = _loc2_[0];
            this.var_524.initialize(_loc7_);
         }
         var _loc3_:XMLList = param1.floorData;
         if(_loc3_.length() > 0)
         {
            _loc8_ = _loc3_[0];
            this.var_526.initialize(_loc8_);
         }
         var _loc4_:XMLList = param1.wallAdData;
         if(_loc4_.length() > 0)
         {
            _loc9_ = _loc4_[0];
            this.var_782.initialize(_loc9_);
         }
         var _loc5_:XMLList = param1.landscapeData;
         if(_loc5_.length() > 0)
         {
            _loc10_ = _loc5_[0];
            this.var_525.initialize(_loc10_);
         }
         var _loc6_:XMLList = param1.maskData;
         if(_loc6_.length() > 0)
         {
            _loc11_ = _loc6_[0];
            this.var_783.initialize(_loc11_);
         }
         return true;
      }
      
      public function initializeAssetCollection(param1:IGraphicAssetCollection) : void
      {
         if(this.var_796)
         {
            return;
         }
         this.var_524.initializeAssetCollection(param1);
         this.var_526.initializeAssetCollection(param1);
         this.var_782.initializeAssetCollection(param1);
         this.var_525.initializeAssetCollection(param1);
         this.var_783.initializeAssetCollection(param1);
         this.var_796 = true;
      }
      
      protected function reset() : void
      {
      }
   }
}
