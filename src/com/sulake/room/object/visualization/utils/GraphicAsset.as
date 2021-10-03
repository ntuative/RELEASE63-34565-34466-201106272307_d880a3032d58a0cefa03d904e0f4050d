package com.sulake.room.object.visualization.utils
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAsset;
   import flash.display.BitmapData;
   
   public class GraphicAsset implements IGraphicAsset
   {
       
      
      private var var_2331:String;
      
      private var var_2940:String;
      
      private var var_474:BitmapDataAsset;
      
      private var var_1677:Boolean;
      
      private var var_1678:Boolean;
      
      private var var_2939:Boolean;
      
      private var _offsetX:int;
      
      private var var_1171:int;
      
      private var var_234:int;
      
      private var _height:int;
      
      private var var_796:Boolean;
      
      public function GraphicAsset(param1:String, param2:String, param3:IAsset, param4:Boolean, param5:Boolean, param6:int, param7:int, param8:Boolean = false)
      {
         super();
         this.var_2331 = param1;
         this.var_2940 = param2;
         var _loc9_:BitmapDataAsset = param3 as BitmapDataAsset;
         if(_loc9_ != null)
         {
            this.var_474 = _loc9_;
            this.var_796 = false;
         }
         else
         {
            this.var_474 = null;
            this.var_796 = true;
         }
         this.var_1677 = param4;
         this.var_1678 = param5;
         this._offsetX = param6;
         this.var_1171 = param7;
         this.var_2939 = param8;
      }
      
      public function dispose() : void
      {
         this.var_474 = null;
      }
      
      private function initialize() : void
      {
         var _loc1_:* = null;
         if(!this.var_796 && this.var_474 != null)
         {
            _loc1_ = this.var_474.content as BitmapData;
            if(_loc1_ != null)
            {
               this.var_234 = _loc1_.width;
               this._height = _loc1_.height;
            }
            this.var_796 = true;
         }
      }
      
      public function get flipV() : Boolean
      {
         return this.var_1678;
      }
      
      public function get flipH() : Boolean
      {
         return this.var_1677;
      }
      
      public function get width() : int
      {
         this.initialize();
         return this.var_234;
      }
      
      public function get height() : int
      {
         this.initialize();
         return this._height;
      }
      
      public function get assetName() : String
      {
         return this.var_2331;
      }
      
      public function get libraryAssetName() : String
      {
         return this.var_2940;
      }
      
      public function get asset() : IAsset
      {
         return this.var_474;
      }
      
      public function get usesPalette() : Boolean
      {
         return this.var_2939;
      }
      
      public function get offsetX() : int
      {
         if(!this.var_1677)
         {
            return this._offsetX;
         }
         return -(this.width + this._offsetX);
      }
      
      public function get offsetY() : int
      {
         if(!this.var_1678)
         {
            return this.var_1171;
         }
         return -(this.height + this.var_1171);
      }
      
      public function get originalOffsetX() : int
      {
         return this._offsetX;
      }
      
      public function get originalOffsetY() : int
      {
         return this.var_1171;
      }
   }
}
