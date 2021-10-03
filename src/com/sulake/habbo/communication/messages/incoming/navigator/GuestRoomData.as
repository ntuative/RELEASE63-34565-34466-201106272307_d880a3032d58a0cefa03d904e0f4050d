package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class GuestRoomData implements IDisposable
   {
       
      
      private var var_390:int;
      
      private var var_784:Boolean;
      
      private var var_1083:String;
      
      private var _ownerName:String;
      
      private var var_2294:int;
      
      private var var_2362:int;
      
      private var var_2696:int;
      
      private var var_1919:String;
      
      private var var_2697:int;
      
      private var var_2680:Boolean;
      
      private var var_863:int;
      
      private var var_1489:int;
      
      private var var_2694:String;
      
      private var var_937:Array;
      
      private var var_2698:RoomThumbnailData;
      
      private var var_2296:Boolean;
      
      private var var_2695:Boolean;
      
      private var _disposed:Boolean;
      
      public function GuestRoomData(param1:IMessageDataWrapper)
      {
         var _loc4_:* = null;
         this.var_937 = new Array();
         super();
         this.var_390 = param1.readInteger();
         this.var_784 = param1.readBoolean();
         this.var_1083 = param1.readString();
         this._ownerName = param1.readString();
         this.var_2294 = param1.readInteger();
         this.var_2362 = param1.readInteger();
         this.var_2696 = param1.readInteger();
         this.var_1919 = param1.readString();
         this.var_2697 = param1.readInteger();
         this.var_2680 = param1.readBoolean();
         this.var_863 = param1.readInteger();
         this.var_1489 = param1.readInteger();
         this.var_2694 = param1.readString();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readString();
            this.var_937.push(_loc4_);
            _loc3_++;
         }
         this.var_2698 = new RoomThumbnailData(param1);
         this.var_2296 = param1.readBoolean();
         this.var_2695 = param1.readBoolean();
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
      
      public function get flatId() : int
      {
         return this.var_390;
      }
      
      public function get event() : Boolean
      {
         return this.var_784;
      }
      
      public function get roomName() : String
      {
         return this.var_1083;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get doorMode() : int
      {
         return this.var_2294;
      }
      
      public function get userCount() : int
      {
         return this.var_2362;
      }
      
      public function get maxUserCount() : int
      {
         return this.var_2696;
      }
      
      public function get description() : String
      {
         return this.var_1919;
      }
      
      public function get srchSpecPrm() : int
      {
         return this.var_2697;
      }
      
      public function get allowTrading() : Boolean
      {
         return this.var_2680;
      }
      
      public function get score() : int
      {
         return this.var_863;
      }
      
      public function get categoryId() : int
      {
         return this.var_1489;
      }
      
      public function get eventCreationTime() : String
      {
         return this.var_2694;
      }
      
      public function get tags() : Array
      {
         return this.var_937;
      }
      
      public function get thumbnail() : RoomThumbnailData
      {
         return this.var_2698;
      }
      
      public function get allowPets() : Boolean
      {
         return this.var_2296;
      }
      
      public function get displayRoomEntryAd() : Boolean
      {
         return this.var_2695;
      }
   }
}
