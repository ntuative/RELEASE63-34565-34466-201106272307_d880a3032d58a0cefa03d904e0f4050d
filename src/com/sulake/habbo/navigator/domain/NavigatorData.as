package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.communication.messages.incoming.navigator.FlatCategory;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomSearchResultData;
   import com.sulake.habbo.communication.messages.incoming.navigator.MsgWithRequestId;
   import com.sulake.habbo.communication.messages.incoming.navigator.OfficialRoomEntryData;
   import com.sulake.habbo.communication.messages.incoming.navigator.OfficialRoomsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PopularRoomTagsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.parser.navigator.FavouritesMessageParser;
   import com.sulake.habbo.communication.messages.parser.room.engine.RoomEntryInfoMessageParser;
   import com.sulake.habbo.navigator.HabboNavigator;
   import flash.utils.Dictionary;
   
   public class NavigatorData
   {
      
      private static const const_2097:int = 10;
       
      
      private var _navigator:HabboNavigator;
      
      private var var_231:MsgWithRequestId;
      
      private var var_720:RoomEventData;
      
      private var var_2930:Boolean;
      
      private var var_2929:Boolean;
      
      private var _currentRoomOwner:Boolean;
      
      private var var_2610:int;
      
      private var var_297:GuestRoomData;
      
      private var var_1114:PublicRoomShortData;
      
      private var var_2926:int;
      
      private var var_2934:Boolean;
      
      private var var_2933:int;
      
      private var var_2932:Boolean;
      
      private var var_2128:int;
      
      private var var_2927:Boolean;
      
      private var var_1523:Array;
      
      private var var_1655:Array;
      
      private var var_2935:int;
      
      private var var_1654:int;
      
      private var _favouriteIds:Dictionary;
      
      private var var_1355:Boolean;
      
      private var var_2936:int;
      
      private var var_2928:Boolean;
      
      private var var_2931:int = 0;
      
      private var var_2127:OfficialRoomEntryData;
      
      public function NavigatorData(param1:HabboNavigator)
      {
         this.var_1523 = new Array();
         this.var_1655 = new Array();
         this._favouriteIds = new Dictionary();
         super();
         this._navigator = param1;
      }
      
      public function get canAddFavourite() : Boolean
      {
         return this.var_297 != null && !this._currentRoomOwner;
      }
      
      public function get canEditRoomSettings() : Boolean
      {
         return this.var_297 != null && this._currentRoomOwner;
      }
      
      public function onRoomEnter(param1:RoomEntryInfoMessageParser) : void
      {
         this.var_1114 = null;
         this.var_297 = null;
         this._currentRoomOwner = false;
         if(param1.privateRoom)
         {
            this._currentRoomOwner = param1.owner;
         }
         else
         {
            this.var_1114 = param1.publicSpace;
            this.var_720 = null;
         }
      }
      
      public function onRoomExit() : void
      {
         if(this.var_720 != null)
         {
            this.var_720.dispose();
            this.var_720 = null;
         }
         if(this.var_1114 != null)
         {
            this.var_1114.dispose();
            this.var_1114 = null;
         }
         if(this.var_297 != null)
         {
            this.var_297.dispose();
            this.var_297 = null;
         }
         this._currentRoomOwner = false;
      }
      
      public function set enteredRoom(param1:GuestRoomData) : void
      {
         if(this.var_297 != null)
         {
            this.var_297.dispose();
         }
         this.var_297 = param1;
      }
      
      public function set roomEventData(param1:RoomEventData) : void
      {
         if(this.var_720 != null)
         {
            this.var_720.dispose();
         }
         this.var_720 = param1;
      }
      
      public function get popularTagsArrived() : Boolean
      {
         return this.var_231 != null && this.var_231 as PopularRoomTagsData != null;
      }
      
      public function get guestRoomSearchArrived() : Boolean
      {
         return this.var_231 != null && this.var_231 as GuestRoomSearchResultData != null;
      }
      
      public function get officialRoomsArrived() : Boolean
      {
         return this.var_231 != null && this.var_231 as OfficialRoomsData != null;
      }
      
      public function set guestRoomSearchResults(param1:GuestRoomSearchResultData) : void
      {
         this.disposeCurrentMsg();
         this.var_231 = param1;
         this.var_2127 = param1.ad;
         this.var_1355 = false;
      }
      
      public function set popularTags(param1:PopularRoomTagsData) : void
      {
         this.disposeCurrentMsg();
         this.var_231 = param1;
         this.var_1355 = false;
      }
      
      public function set officialRooms(param1:OfficialRoomsData) : void
      {
         this.disposeCurrentMsg();
         this.var_231 = param1;
         this.var_1355 = false;
      }
      
      private function disposeCurrentMsg() : void
      {
         if(this.var_231 == null)
         {
            return;
         }
         this.var_231.dispose();
         this.var_231 = null;
      }
      
      public function set adRoom(param1:OfficialRoomEntryData) : void
      {
         this.var_2127 = param1;
      }
      
      public function get adRoom() : OfficialRoomEntryData
      {
         return this.var_2127;
      }
      
      public function get guestRoomSearchResults() : GuestRoomSearchResultData
      {
         return this.var_231 as GuestRoomSearchResultData;
      }
      
      public function get popularTags() : PopularRoomTagsData
      {
         return this.var_231 as PopularRoomTagsData;
      }
      
      public function get officialRooms() : OfficialRoomsData
      {
         return this.var_231 as OfficialRoomsData;
      }
      
      public function get roomEventData() : RoomEventData
      {
         return this.var_720;
      }
      
      public function get avatarId() : int
      {
         return this.var_2610;
      }
      
      public function get eventMod() : Boolean
      {
         return this.var_2930;
      }
      
      public function get roomPicker() : Boolean
      {
         return this.var_2929;
      }
      
      public function get currentRoomOwner() : Boolean
      {
         return this._currentRoomOwner;
      }
      
      public function get enteredGuestRoom() : GuestRoomData
      {
         return this.var_297;
      }
      
      public function get enteredPublicSpace() : PublicRoomShortData
      {
         return this.var_1114;
      }
      
      public function get hcMember() : Boolean
      {
         return this.var_2934;
      }
      
      public function get createdFlatId() : int
      {
         return this.var_2933;
      }
      
      public function get homeRoomId() : int
      {
         return this.var_2128;
      }
      
      public function get hotRoomPopupOpen() : Boolean
      {
         return this.var_2932;
      }
      
      public function get currentRoomRating() : int
      {
         return this.var_2936;
      }
      
      public function get publicSpaceNodeId() : int
      {
         return this.var_2926;
      }
      
      public function get settingsReceived() : Boolean
      {
         return this.var_2927;
      }
      
      public function get adIndex() : int
      {
         return this.var_2931;
      }
      
      public function get currentRoomIsStaffPick() : Boolean
      {
         return this.var_2928;
      }
      
      public function set avatarId(param1:int) : void
      {
         this.var_2610 = param1;
      }
      
      public function set createdFlatId(param1:int) : void
      {
         this.var_2933 = param1;
      }
      
      public function set hcMember(param1:Boolean) : void
      {
         this.var_2934 = param1;
      }
      
      public function set eventMod(param1:Boolean) : void
      {
         this.var_2930 = param1;
      }
      
      public function set roomPicker(param1:Boolean) : void
      {
         this.var_2929 = param1;
      }
      
      public function set hotRoomPopupOpen(param1:Boolean) : void
      {
         this.var_2932 = param1;
      }
      
      public function set homeRoomId(param1:int) : void
      {
         this.var_2128 = param1;
      }
      
      public function set currentRoomRating(param1:int) : void
      {
         this.var_2936 = param1;
      }
      
      public function set publicSpaceNodeId(param1:int) : void
      {
         this.var_2926 = param1;
      }
      
      public function set settingsReceived(param1:Boolean) : void
      {
         this.var_2927 = param1;
      }
      
      public function set adIndex(param1:int) : void
      {
         this.var_2931 = param1;
      }
      
      public function set currentRoomIsStaffPick(param1:Boolean) : void
      {
         this.var_2928 = param1;
      }
      
      public function set categories(param1:Array) : void
      {
         var _loc2_:* = null;
         this.var_1523 = param1;
         this.var_1655 = new Array();
         for each(_loc2_ in this.var_1523)
         {
            if(_loc2_.visible)
            {
               this.var_1655.push(_loc2_);
            }
         }
      }
      
      public function get allCategories() : Array
      {
         return this.var_1523;
      }
      
      public function get visibleCategories() : Array
      {
         return this.var_1655;
      }
      
      public function onFavourites(param1:FavouritesMessageParser) : void
      {
         var _loc2_:int = 0;
         this.var_2935 = param1.limit;
         this.var_1654 = param1.favouriteRoomIds.length;
         this._favouriteIds = new Dictionary();
         for each(_loc2_ in param1.favouriteRoomIds)
         {
            this._favouriteIds[_loc2_] = "yes";
         }
      }
      
      public function favouriteChanged(param1:int, param2:Boolean) : void
      {
         this._favouriteIds[param1] = !!param2 ? "yes" : null;
         this.var_1654 += !!param2 ? 1 : -1;
      }
      
      public function isCurrentRoomFavourite() : Boolean
      {
         var _loc1_:int = this.var_297.flatId;
         return this._favouriteIds[_loc1_] != null;
      }
      
      public function isCurrentRoomHome() : Boolean
      {
         if(this.var_297 == null)
         {
            return false;
         }
         var _loc1_:int = this.var_297.flatId;
         return this.var_2128 == _loc1_;
      }
      
      public function isRoomFavourite(param1:int) : Boolean
      {
         return this._favouriteIds[param1] != null;
      }
      
      public function isFavouritesFull() : Boolean
      {
         return this.var_1654 >= this.var_2935;
      }
      
      public function startLoading() : void
      {
         this.var_1355 = true;
      }
      
      public function isLoading() : Boolean
      {
         return this.var_1355;
      }
   }
}
