package com.sulake.habbo.ui.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetBadgeImageUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_888:String = "RWBIUE_BADGE_IMAGE";
       
      
      private var var_2565:String;
      
      private var var_2566:BitmapData;
      
      public function RoomWidgetBadgeImageUpdateEvent(param1:String, param2:BitmapData, param3:Boolean = false, param4:Boolean = false)
      {
         super(const_888,param3,param4);
         this.var_2565 = param1;
         this.var_2566 = param2;
      }
      
      public function get badgeID() : String
      {
         return this.var_2565;
      }
      
      public function get badgeImage() : BitmapData
      {
         return this.var_2566;
      }
   }
}
