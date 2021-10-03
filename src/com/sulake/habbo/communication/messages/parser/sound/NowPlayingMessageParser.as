package com.sulake.habbo.communication.messages.parser.sound
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class NowPlayingMessageParser implements IMessageParser
   {
       
      
      private var var_2121:int;
      
      private var _currentPosition:int;
      
      private var var_2124:int;
      
      private var var_2122:int;
      
      private var var_2123:int;
      
      public function NowPlayingMessageParser()
      {
         super();
      }
      
      public function get currentSongId() : int
      {
         return this.var_2121;
      }
      
      public function get currentPosition() : int
      {
         return this._currentPosition;
      }
      
      public function get nextSongId() : int
      {
         return this.var_2124;
      }
      
      public function get nextPosition() : int
      {
         return this.var_2122;
      }
      
      public function get syncCount() : int
      {
         return this.var_2123;
      }
      
      public function flush() : Boolean
      {
         this.var_2121 = -1;
         this._currentPosition = -1;
         this.var_2124 = -1;
         this.var_2122 = -1;
         this.var_2123 = -1;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_2121 = param1.readInteger();
         this._currentPosition = param1.readInteger();
         this.var_2124 = param1.readInteger();
         this.var_2122 = param1.readInteger();
         this.var_2123 = param1.readInteger();
         return true;
      }
   }
}
