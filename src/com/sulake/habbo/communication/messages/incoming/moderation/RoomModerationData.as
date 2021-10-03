package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomModerationData implements IDisposable
   {
       
      
      private var var_390:int;
      
      private var var_2362:int;
      
      private var var_2763:Boolean;
      
      private var var_2598:int;
      
      private var _ownerName:String;
      
      private var var_130:RoomData;
      
      private var var_784:RoomData;
      
      private var _disposed:Boolean;
      
      public function RoomModerationData(param1:IMessageDataWrapper)
      {
         super();
         this.var_390 = param1.readInteger();
         this.var_2362 = param1.readInteger();
         this.var_2763 = param1.readBoolean();
         this.var_2598 = param1.readInteger();
         this._ownerName = param1.readString();
         this.var_130 = new RoomData(param1);
         this.var_784 = new RoomData(param1);
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         if(this.var_130 != null)
         {
            this.var_130.dispose();
            this.var_130 = null;
         }
         if(this.var_784 != null)
         {
            this.var_784.dispose();
            this.var_784 = null;
         }
      }
      
      public function get flatId() : int
      {
         return this.var_390;
      }
      
      public function get userCount() : int
      {
         return this.var_2362;
      }
      
      public function get ownerInRoom() : Boolean
      {
         return this.var_2763;
      }
      
      public function get ownerId() : int
      {
         return this.var_2598;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get room() : RoomData
      {
         return this.var_130;
      }
      
      public function get event() : RoomData
      {
         return this.var_784;
      }
   }
}
