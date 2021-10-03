package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class EventStreamData
   {
      
      public static const const_1873:uint = 0;
      
      public static const const_1988:uint = 1;
      
      public static const const_1762:uint = 2;
      
      public static const const_2114:int = 0;
      
      public static const const_2212:int = 1;
      
      public static const LINK_TARGET_VISIT_ROOM:int = 2;
      
      public static const const_2276:int = 3;
       
      
      private var _id:int;
      
      private var var_2533:int;
      
      private var var_2532:String;
      
      private var var_2531:String;
      
      private var var_2528:String;
      
      private var var_2530:int;
      
      private var var_2529:int;
      
      private var var_2534:Object;
      
      public function EventStreamData(param1:int, param2:int, param3:String, param4:String, param5:String, param6:int, param7:int, param8:IMessageDataWrapper)
      {
         super();
         this._id = param1;
         this.var_2533 = param2;
         this.var_2532 = param3;
         this.var_2531 = param4;
         this.var_2528 = param5;
         this.var_2530 = param6;
         this.var_2529 = param7;
         this.var_2534 = parse(param2,param8);
      }
      
      protected static function parse(param1:int, param2:IMessageDataWrapper) : Object
      {
         var _loc3_:Object = new Object();
         switch(param1)
         {
            case const_1873:
               _loc3_.friendId = param2.readString();
               _loc3_.friendName = param2.readString();
               break;
            case const_1988:
               _loc3_.roomId = param2.readString();
               _loc3_.roomName = param2.readString();
               break;
            case const_1762:
               _loc3_.achievementCode = param2.readString();
         }
         return _loc3_;
      }
      
      public function get actionId() : int
      {
         return this.var_2533;
      }
      
      public function get accountId() : String
      {
         return this.var_2532;
      }
      
      public function get accountName() : String
      {
         return this.var_2531;
      }
      
      public function get imageFilePath() : String
      {
         return this.var_2528;
      }
      
      public function get minutesSinceEvent() : int
      {
         return this.var_2530;
      }
      
      public function get linkTargetType() : int
      {
         return this.var_2529;
      }
      
      public function get extraDataStruct() : Object
      {
         return this.var_2534;
      }
   }
}

class Struct
{
    
   
   function Struct()
   {
      super();
   }
}

class FriendMadeStruct extends Struct
{
    
   
   public var friendId:String;
   
   public var friendName:String;
   
   function FriendMadeStruct(param1:String, param2:String)
   {
      super();
      this.friendId = param1;
      this.friendName = param2;
   }
}

class RoomLikedStruct extends Struct
{
    
   
   public var roomId:String;
   
   public var roomName:String;
   
   function RoomLikedStruct(param1:String, param2:String)
   {
      super();
      this.roomId = param1;
      this.roomName = param2;
   }
}

class AchievementEarnedStruct extends Struct
{
    
   
   public var achievementCode:String;
   
   function AchievementEarnedStruct(param1:String)
   {
      super();
      this.achievementCode = param1;
   }
}
