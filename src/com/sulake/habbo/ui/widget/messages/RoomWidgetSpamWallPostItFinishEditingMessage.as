package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetSpamWallPostItFinishEditingMessage extends RoomWidgetMessage
   {
      
      public static const const_800:String = "RWSWPFEE_SEND_POSTIT_DATA";
       
      
      private var var_238:int;
      
      private var var_472:String;
      
      private var _text:String;
      
      private var var_359:String;
      
      public function RoomWidgetSpamWallPostItFinishEditingMessage(param1:String, param2:int, param3:String, param4:String, param5:String)
      {
         super(param1);
         this.var_238 = param2;
         this.var_472 = param3;
         this._text = param4;
         this.var_359 = param5;
      }
      
      public function get location() : String
      {
         return this.var_472;
      }
      
      public function get objectId() : int
      {
         return this.var_238;
      }
      
      public function get text() : String
      {
         return this._text;
      }
      
      public function get colorHex() : String
      {
         return this.var_359;
      }
   }
}
