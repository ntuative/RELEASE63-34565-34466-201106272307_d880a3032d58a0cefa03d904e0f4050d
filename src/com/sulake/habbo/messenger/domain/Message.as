package com.sulake.habbo.messenger.domain
{
   public class Message
   {
      
      public static const const_980:int = 1;
      
      public static const const_922:int = 2;
      
      public static const const_962:int = 3;
      
      public static const const_1355:int = 4;
      
      public static const const_783:int = 5;
      
      public static const const_1181:int = 6;
       
      
      private var _type:int;
      
      private var var_1366:int;
      
      private var var_2282:String;
      
      private var var_2283:String;
      
      public function Message(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         this._type = param1;
         this.var_1366 = param2;
         this.var_2282 = param3;
         this.var_2283 = param4;
      }
      
      public function get messageText() : String
      {
         return this.var_2282;
      }
      
      public function get time() : String
      {
         return this.var_2283;
      }
      
      public function get senderId() : int
      {
         return this.var_1366;
      }
      
      public function get type() : int
      {
         return this._type;
      }
   }
}
