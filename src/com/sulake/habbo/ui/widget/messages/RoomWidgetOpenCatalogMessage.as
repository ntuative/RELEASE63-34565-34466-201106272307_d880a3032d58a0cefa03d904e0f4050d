package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetOpenCatalogMessage extends RoomWidgetMessage
   {
      
      public static const const_918:String = "RWGOI_MESSAGE_OPEN_CATALOG";
      
      public static const const_1362:String = "RWOCM_CLUB_MAIN";
      
      public static const const_2124:String = "RWOCM_PIXELS";
      
      public static const const_2291:String = "RWOCM_CREDITS";
      
      public static const const_2261:String = "RWOCM_SHELLS";
       
      
      private var var_2736:String = "";
      
      public function RoomWidgetOpenCatalogMessage(param1:String)
      {
         super(const_918);
         this.var_2736 = param1;
      }
      
      public function get pageKey() : String
      {
         return this.var_2736;
      }
   }
}
