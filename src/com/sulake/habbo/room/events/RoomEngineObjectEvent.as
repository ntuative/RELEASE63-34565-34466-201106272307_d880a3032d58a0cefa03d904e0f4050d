package com.sulake.habbo.room.events
{
   public class RoomEngineObjectEvent extends RoomEngineEvent
   {
      
      public static const const_852:String = "REOE_OBJECT_SELECTED";
      
      public static const const_661:String = "REOE_OBJECT_DESELECTED";
      
      public static const const_188:String = "REOB_OBJECT_ADDED";
      
      public static const const_395:String = "REOE_OBJECT_REMOVED";
      
      public static const const_156:String = "REOB_OBJECT_PLACED";
      
      public static const const_736:String = "REOB_OBJECT_CONTENT_UPDATED";
      
      public static const const_759:String = "REOB_OBJECT_REQUEST_MOVE";
      
      public static const const_195:String = "REOB_OBJECT_MOUSE_ENTER";
      
      public static const const_182:String = "REOB_OBJECT_MOUSE_LEAVE";
      
      public static const const_165:String = "REOE_WIDGET_REQUEST_PLACEHOLDER";
      
      public static const ROOM_OBJECT_WIDGET_REQUEST_CREDITFURNI:String = "REOE_WIDGET_REQUEST_CREDITFURNI";
      
      public static const const_140:String = "REOE_WIDGET_REQUEST_STICKIE";
      
      public static const const_164:String = "REOE_WIDGET_REQUEST_PRESENT";
      
      public static const const_170:String = "REOE_WIDGET_REQUEST_TROPHY";
      
      public static const const_142:String = "REOE_WIDGET_REQUEST_TEASER";
      
      public static const const_175:String = "REOE_WIDGET_REQUEST_ECOTRONBOX";
      
      public static const const_173:String = "REOE_WIDGET_REQUEST_DIMMER";
      
      public static const const_111:String = "REOR_REMOVE_DIMMER";
      
      public static const const_161:String = "REOR_REQUEST_CLOTHING_CHANGE";
      
      public static const const_177:String = "REOR_WIDGET_REQUEST_PLAYLIST_EDITOR";
      
      public static const const_596:String = "REOE_ROOM_AD_FURNI_CLICK";
      
      public static const const_584:String = "REOE_ROOM_AD_FURNI_DOUBLE_CLICK";
      
      public static const const_541:String = "REOE_ROOM_AD_TOOLTIP_SHOW";
      
      public static const const_637:String = "REOE_ROOM_AD_TOOLTIP_HIDE";
       
      
      private var var_238:int;
      
      private var _category:int;
      
      public function RoomEngineObjectEvent(param1:String, param2:int, param3:int, param4:int, param5:int, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param2,param3,param6,param7);
         this.var_238 = param4;
         this._category = param5;
      }
      
      public function get objectId() : int
      {
         return this.var_238;
      }
      
      public function get category() : int
      {
         return this._category;
      }
   }
}
