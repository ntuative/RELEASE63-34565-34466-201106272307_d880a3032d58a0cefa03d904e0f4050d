package com.sulake.room.renderer.cache
{
   public class RoomObjectCacheItem
   {
       
      
      private var var_472:RoomObjectLocationCacheItem = null;
      
      private var var_228:RoomObjectSortableSpriteCacheItem = null;
      
      public function RoomObjectCacheItem(param1:String)
      {
         super();
         this.var_472 = new RoomObjectLocationCacheItem(param1);
         this.var_228 = new RoomObjectSortableSpriteCacheItem();
      }
      
      public function get location() : RoomObjectLocationCacheItem
      {
         return this.var_472;
      }
      
      public function get sprites() : RoomObjectSortableSpriteCacheItem
      {
         return this.var_228;
      }
      
      public function dispose() : void
      {
         if(this.var_472 != null)
         {
            this.var_472.dispose();
            this.var_472 = null;
         }
         if(this.var_228 != null)
         {
            this.var_228.dispose();
            this.var_228 = null;
         }
      }
   }
}
