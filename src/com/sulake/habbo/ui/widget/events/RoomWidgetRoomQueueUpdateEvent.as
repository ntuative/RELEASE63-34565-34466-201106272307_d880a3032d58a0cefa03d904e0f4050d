package com.sulake.habbo.ui.widget.events
{
   public class RoomWidgetRoomQueueUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_432:String = "RWRQUE_VISITOR_QUEUE_STATUS";
      
      public static const const_510:String = "RWRQUE_SPECTATOR_QUEUE_STATUS";
       
      
      private var var_1186:int;
      
      private var var_2684:Boolean;
      
      private var var_551:Boolean;
      
      private var var_1769:Boolean;
      
      public function RoomWidgetRoomQueueUpdateEvent(param1:String, param2:int, param3:Boolean, param4:Boolean, param5:Boolean, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param6,param7);
         this.var_1186 = param2;
         this.var_2684 = param3;
         this.var_551 = param4;
         this.var_1769 = param5;
      }
      
      public function get position() : int
      {
         return this.var_1186;
      }
      
      public function get hasHabboClub() : Boolean
      {
         return this.var_2684;
      }
      
      public function get isActive() : Boolean
      {
         return this.var_551;
      }
      
      public function get isClubQueue() : Boolean
      {
         return this.var_1769;
      }
   }
}
