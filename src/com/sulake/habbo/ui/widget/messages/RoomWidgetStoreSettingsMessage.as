package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetStoreSettingsMessage extends RoomWidgetMessage
   {
      
      public static const const_1851:String = "RWSSM_STORE_SETTINGS";
      
      public static const const_899:String = "RWSSM_STORE_SOUND";
      
      public static const const_896:String = "RWSSM_PREVIEW_SOUND";
       
      
      private var var_1002:Number;
      
      public function RoomWidgetStoreSettingsMessage(param1:String)
      {
         super(param1);
      }
      
      public function get volume() : Number
      {
         return this.var_1002;
      }
      
      public function set volume(param1:Number) : void
      {
         this.var_1002 = param1;
      }
   }
}
