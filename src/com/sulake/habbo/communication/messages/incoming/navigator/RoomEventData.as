package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomEventData implements IDisposable
   {
       
      
      private var var_1928:Boolean;
      
      private var var_2665:int;
      
      private var var_2666:String;
      
      private var var_390:int;
      
      private var var_2664:int;
      
      private var var_2032:String;
      
      private var var_2668:String;
      
      private var var_2667:String;
      
      private var var_937:Array;
      
      private var _disposed:Boolean;
      
      public function RoomEventData(param1:IMessageDataWrapper)
      {
         var _loc5_:* = null;
         this.var_937 = new Array();
         super();
         var _loc2_:String = param1.readString();
         if(_loc2_ == "-1")
         {
            Logger.log("Got null room event");
            this.var_1928 = false;
            return;
         }
         this.var_1928 = true;
         this.var_2665 = int(_loc2_);
         this.var_2666 = param1.readString();
         this.var_390 = int(param1.readString());
         this.var_2664 = param1.readInteger();
         this.var_2032 = param1.readString();
         this.var_2668 = param1.readString();
         this.var_2667 = param1.readString();
         var _loc3_:int = param1.readInteger();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = param1.readString();
            this.var_937.push(_loc5_);
            _loc4_++;
         }
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         this.var_937 = null;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get ownerAvatarId() : int
      {
         return this.var_2665;
      }
      
      public function get ownerAvatarName() : String
      {
         return this.var_2666;
      }
      
      public function get flatId() : int
      {
         return this.var_390;
      }
      
      public function get eventType() : int
      {
         return this.var_2664;
      }
      
      public function get eventName() : String
      {
         return this.var_2032;
      }
      
      public function get eventDescription() : String
      {
         return this.var_2668;
      }
      
      public function get creationTime() : String
      {
         return this.var_2667;
      }
      
      public function get tags() : Array
      {
         return this.var_937;
      }
      
      public function get exists() : Boolean
      {
         return this.var_1928;
      }
   }
}
