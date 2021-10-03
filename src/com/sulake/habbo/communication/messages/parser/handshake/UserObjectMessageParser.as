package com.sulake.habbo.communication.messages.parser.handshake
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class UserObjectMessageParser implements IMessageParser
   {
       
      
      private var _id:int;
      
      private var _name:String;
      
      private var _figure:String;
      
      private var var_1105:String;
      
      private var var_2378:String;
      
      private var var_1819:String;
      
      private var var_2374:int;
      
      private var var_2377:String;
      
      private var var_2375:int;
      
      private var var_2376:int;
      
      private var var_2271:int;
      
      private var var_1340:int;
      
      private var var_892:int;
      
      private var var_2379:int;
      
      public function UserObjectMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._id = int(param1.readString());
         this._name = param1.readString();
         this._figure = param1.readString();
         this.var_1105 = param1.readString();
         this.var_2378 = param1.readString();
         this.var_1819 = param1.readString();
         this.var_2374 = param1.readInteger();
         this.var_2377 = param1.readString();
         this.var_2375 = param1.readInteger();
         this.var_2376 = param1.readInteger();
         this.var_2271 = param1.readInteger();
         this.var_1340 = param1.readInteger();
         this.var_892 = param1.readInteger();
         this.var_2379 = param1.readInteger();
         return true;
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
      
      public function get sex() : String
      {
         return this.var_1105;
      }
      
      public function get customData() : String
      {
         return this.var_2378;
      }
      
      public function get realName() : String
      {
         return this.var_1819;
      }
      
      public function get tickets() : int
      {
         return this.var_2374;
      }
      
      public function get poolFigure() : String
      {
         return this.var_2377;
      }
      
      public function get photoFilm() : int
      {
         return this.var_2375;
      }
      
      public function get directMail() : int
      {
         return this.var_2376;
      }
      
      public function get respectTotal() : int
      {
         return this.var_2271;
      }
      
      public function get respectLeft() : int
      {
         return this.var_1340;
      }
      
      public function get petRespectLeft() : int
      {
         return this.var_892;
      }
      
      public function get identityId() : int
      {
         return this.var_2379;
      }
   }
}
