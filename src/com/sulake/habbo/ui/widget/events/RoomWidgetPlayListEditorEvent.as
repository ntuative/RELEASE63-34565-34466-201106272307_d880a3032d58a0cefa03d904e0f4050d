package com.sulake.habbo.ui.widget.events
{
   public class RoomWidgetPlayListEditorEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_742:String = "RWPLEE_SHOW_PLAYLIST_EDITOR";
      
      public static const const_877:String = "RWPLEE_HIDE_PLAYLIST_EDITOR";
      
      public static const const_843:String = "RWPLEE_INVENTORY_UPDATED";
      
      public static const const_892:String = "RWPLEE_SONG_DISK_INVENTORY_UPDATED";
      
      public static const const_102:String = "RWPLEE_PLAY_LIST_UPDATED";
      
      public static const const_167:String = "RWPLEE_PLAY_LIST_FULL";
       
      
      private var _furniId:int;
      
      public function RoomWidgetPlayListEditorEvent(param1:String, param2:int = -1, param3:Boolean = false, param4:Boolean = false)
      {
         super(param1,param3,param4);
         this._furniId = param2;
      }
      
      public function get furniId() : int
      {
         return this._furniId;
      }
   }
}
