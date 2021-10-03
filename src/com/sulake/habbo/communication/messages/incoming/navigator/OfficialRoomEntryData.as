package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class OfficialRoomEntryData implements IDisposable
   {
      
      public static const const_1322:int = 1;
      
      public static const const_889:int = 2;
      
      public static const const_802:int = 3;
      
      public static const const_1798:int = 4;
       
      
      private var _index:int;
      
      private var var_2465:String;
      
      private var var_2466:String;
      
      private var var_2469:Boolean;
      
      private var var_2467:String;
      
      private var var_1110:String;
      
      private var var_2468:int;
      
      private var var_2362:int;
      
      private var _type:int;
      
      private var var_2330:String;
      
      private var var_974:GuestRoomData;
      
      private var var_975:PublicRoomData;
      
      private var _open:Boolean;
      
      private var _disposed:Boolean;
      
      public function OfficialRoomEntryData(param1:IMessageDataWrapper)
      {
         super();
         this._index = param1.readInteger();
         this.var_2465 = param1.readString();
         this.var_2466 = param1.readString();
         this.var_2469 = param1.readInteger() == 1;
         this.var_2467 = param1.readString();
         this.var_1110 = param1.readString();
         this.var_2468 = param1.readInteger();
         this.var_2362 = param1.readInteger();
         this._type = param1.readInteger();
         if(this._type == const_1322)
         {
            this.var_2330 = param1.readString();
         }
         else if(this._type == const_802)
         {
            this.var_975 = new PublicRoomData(param1);
         }
         else if(this._type == const_889)
         {
            this.var_974 = new GuestRoomData(param1);
         }
         else
         {
            this._open = param1.readBoolean();
         }
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         if(this.var_974 != null)
         {
            this.var_974.dispose();
            this.var_974 = null;
         }
         if(this.var_975 != null)
         {
            this.var_975.dispose();
            this.var_975 = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get index() : int
      {
         return this._index;
      }
      
      public function get popupCaption() : String
      {
         return this.var_2465;
      }
      
      public function get popupDesc() : String
      {
         return this.var_2466;
      }
      
      public function get showDetails() : Boolean
      {
         return this.var_2469;
      }
      
      public function get picText() : String
      {
         return this.var_2467;
      }
      
      public function get picRef() : String
      {
         return this.var_1110;
      }
      
      public function get folderId() : int
      {
         return this.var_2468;
      }
      
      public function get tag() : String
      {
         return this.var_2330;
      }
      
      public function get userCount() : int
      {
         return this.var_2362;
      }
      
      public function get guestRoomData() : GuestRoomData
      {
         return this.var_974;
      }
      
      public function get publicRoomData() : PublicRoomData
      {
         return this.var_975;
      }
      
      public function get open() : Boolean
      {
         return this._open;
      }
      
      public function toggleOpen() : void
      {
         this._open = !this._open;
      }
      
      public function get maxUsers() : int
      {
         if(this.type == const_1322)
         {
            return 0;
         }
         if(this.type == const_889)
         {
            return this.var_974.maxUserCount;
         }
         if(this.type == const_802)
         {
            return this.var_975.maxUsers;
         }
         return 0;
      }
   }
}
