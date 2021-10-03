package com.sulake.habbo.ui.widget.events
{
   public class RoomWidgetChatInputContentUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_957:String = "RWWCIDE_CHAT_INPUT_CONTENT";
      
      public static const const_1304:String = "whisper";
      
      public static const const_1790:String = "shout";
       
      
      private var var_2973:String = "";
      
      private var _userName:String = "";
      
      public function RoomWidgetChatInputContentUpdateEvent(param1:String, param2:String, param3:Boolean = false, param4:Boolean = false)
      {
         super(const_957,param3,param4);
         this.var_2973 = param1;
         this._userName = param2;
      }
      
      public function get messageType() : String
      {
         return this.var_2973;
      }
      
      public function get userName() : String
      {
         return this._userName;
      }
   }
}
