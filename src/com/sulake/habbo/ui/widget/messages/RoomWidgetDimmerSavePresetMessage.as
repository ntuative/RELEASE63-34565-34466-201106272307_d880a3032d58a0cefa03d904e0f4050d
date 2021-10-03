package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetDimmerSavePresetMessage extends RoomWidgetMessage
   {
      
      public static const const_936:String = "RWSDPM_SAVE_PRESET";
       
      
      private var var_2689:int;
      
      private var var_2688:int;
      
      private var _color:uint;
      
      private var var_1382:int;
      
      private var var_2744:Boolean;
      
      public function RoomWidgetDimmerSavePresetMessage(param1:int, param2:int, param3:uint, param4:int, param5:Boolean)
      {
         super(const_936);
         this.var_2689 = param1;
         this.var_2688 = param2;
         this._color = param3;
         this.var_1382 = param4;
         this.var_2744 = param5;
      }
      
      public function get presetNumber() : int
      {
         return this.var_2689;
      }
      
      public function get effectTypeId() : int
      {
         return this.var_2688;
      }
      
      public function get color() : uint
      {
         return this._color;
      }
      
      public function get brightness() : int
      {
         return this.var_1382;
      }
      
      public function get apply() : Boolean
      {
         return this.var_2744;
      }
   }
}
