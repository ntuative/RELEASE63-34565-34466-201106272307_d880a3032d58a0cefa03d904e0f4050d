package com.sulake.habbo.friendbar.utils
{
   public class LinkTarget
   {
      
      public static const NONE:uint = 0;
      
      public static const const_1950:uint = 1;
      
      public static const ROOM:uint = 2;
      
      public static const ACHIEVEMENTS:uint = 3;
       
      
      private var _text:String;
      
      private var _type:uint;
      
      private var var_2102:uint;
      
      public function LinkTarget(param1:String, param2:uint, param3:uint)
      {
         super();
         this._text = param1;
         this._type = param2;
         this.var_2102 = param3;
      }
      
      public function get text() : String
      {
         return this._text;
      }
      
      public function get type() : uint
      {
         return this._type;
      }
      
      public function get identifier() : uint
      {
         return this.var_2102;
      }
   }
}
