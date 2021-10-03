package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetChatTypingMessage extends RoomWidgetMessage
   {
      
      public static const const_761:String = "RWCTM_TYPING_STATUS";
       
      
      private var var_741:Boolean;
      
      public function RoomWidgetChatTypingMessage(param1:Boolean)
      {
         super(const_761);
         this.var_741 = param1;
      }
      
      public function get isTyping() : Boolean
      {
         return this.var_741;
      }
   }
}
