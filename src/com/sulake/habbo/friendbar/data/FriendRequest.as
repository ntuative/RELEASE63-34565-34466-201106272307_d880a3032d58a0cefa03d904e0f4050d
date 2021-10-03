package com.sulake.habbo.friendbar.data
{
   public class FriendRequest
   {
       
      
      private var _id:int;
      
      private var _name:String;
      
      private var _figure:String;
      
      public function FriendRequest(param1:int, param2:String, param3:String)
      {
         super();
         this._id = param1;
         this._name = param2;
         this._figure = param3;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get figure() : String
      {
         return this._figure;
      }
   }
}
