package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetOpenInventoryMessage extends RoomWidgetMessage
   {
      
      public static const const_951:String = "RWGOI_MESSAGE_OPEN_INVENTORY";
      
      public static const const_2022:String = "inventory_effects";
      
      public static const const_1268:String = "inventory_badges";
      
      public static const const_1767:String = "inventory_clothes";
      
      public static const const_1944:String = "inventory_furniture";
       
      
      private var var_2759:String;
      
      public function RoomWidgetOpenInventoryMessage(param1:String)
      {
         super(const_951);
         this.var_2759 = param1;
      }
      
      public function get inventoryType() : String
      {
         return this.var_2759;
      }
   }
}
