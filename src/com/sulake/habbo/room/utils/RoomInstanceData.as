package com.sulake.habbo.room.utils
{
   import com.sulake.core.utils.Map;
   
   public class RoomInstanceData
   {
       
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var var_836:TileHeightMap = null;
      
      private var var_1256:LegacyWallGeometry = null;
      
      private var var_1257:RoomCamera = null;
      
      private var var_837:SelectedRoomObjectData = null;
      
      private var var_835:SelectedRoomObjectData = null;
      
      private var _worldType:String = null;
      
      private var var_553:Map;
      
      private var var_552:Map;
      
      public function RoomInstanceData(param1:int, param2:int)
      {
         this.var_553 = new Map();
         this.var_552 = new Map();
         super();
         this._roomId = param1;
         this._roomCategory = param2;
         this.var_1256 = new LegacyWallGeometry();
         this.var_1257 = new RoomCamera();
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get roomCategory() : int
      {
         return this._roomCategory;
      }
      
      public function get tileHeightMap() : TileHeightMap
      {
         return this.var_836;
      }
      
      public function set tileHeightMap(param1:TileHeightMap) : void
      {
         if(this.var_836 != null)
         {
            this.var_836.dispose();
         }
         this.var_836 = param1;
      }
      
      public function get legacyGeometry() : LegacyWallGeometry
      {
         return this.var_1256;
      }
      
      public function get roomCamera() : RoomCamera
      {
         return this.var_1257;
      }
      
      public function get worldType() : String
      {
         return this._worldType;
      }
      
      public function set worldType(param1:String) : void
      {
         this._worldType = param1;
      }
      
      public function get selectedObject() : SelectedRoomObjectData
      {
         return this.var_837;
      }
      
      public function set selectedObject(param1:SelectedRoomObjectData) : void
      {
         if(this.var_837 != null)
         {
            this.var_837.dispose();
         }
         this.var_837 = param1;
      }
      
      public function get placedObject() : SelectedRoomObjectData
      {
         return this.var_835;
      }
      
      public function set placedObject(param1:SelectedRoomObjectData) : void
      {
         if(this.var_835 != null)
         {
            this.var_835.dispose();
         }
         this.var_835 = param1;
      }
      
      public function dispose() : void
      {
         if(this.var_836 != null)
         {
            this.var_836.dispose();
            this.var_836 = null;
         }
         if(this.var_1256 != null)
         {
            this.var_1256.dispose();
            this.var_1256 = null;
         }
         if(this.var_1257 != null)
         {
            this.var_1257.dispose();
            this.var_1257 = null;
         }
         if(this.var_837 != null)
         {
            this.var_837.dispose();
            this.var_837 = null;
         }
         if(this.var_835 != null)
         {
            this.var_835.dispose();
            this.var_835 = null;
         }
         if(this.var_553 != null)
         {
            this.var_553.dispose();
            this.var_553 = null;
         }
         if(this.var_552 != null)
         {
            this.var_552.dispose();
            this.var_552 = null;
         }
      }
      
      public function addFurnitureData(param1:FurnitureData) : void
      {
         if(param1 != null)
         {
            this.var_553.remove(param1.id);
            this.var_553.add(param1.id,param1);
         }
      }
      
      public function getFurnitureData() : FurnitureData
      {
         if(this.var_553.length > 0)
         {
            return this.getFurnitureDataWithId(this.var_553.getKey(0));
         }
         return null;
      }
      
      public function getFurnitureDataWithId(param1:int) : FurnitureData
      {
         return this.var_553.remove(param1);
      }
      
      public function addWallItemData(param1:FurnitureData) : void
      {
         if(param1 != null)
         {
            this.var_552.remove(param1.id);
            this.var_552.add(param1.id,param1);
         }
      }
      
      public function getWallItemData() : FurnitureData
      {
         if(this.var_552.length > 0)
         {
            return this.getWallItemDataWithId(this.var_552.getKey(0));
         }
         return null;
      }
      
      public function getWallItemDataWithId(param1:int) : FurnitureData
      {
         return this.var_552.remove(param1);
      }
   }
}
