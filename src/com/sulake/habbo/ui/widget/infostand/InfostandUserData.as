package com.sulake.habbo.ui.widget.infostand
{
   import com.sulake.habbo.ui.widget.events.RoomWidgetUserInfoUpdateEvent;
   
   public class InfostandUserData
   {
       
      
      private var _userId:int = 0;
      
      private var _userName:String = "";
      
      private var var_259:Array;
      
      private var var_1544:int = 0;
      
      private var var_2706:String = "";
      
      private var var_1340:int = 0;
      
      private var var_2705:int = 0;
      
      private var var_2704:int = 0;
      
      private var _type:String;
      
      private var var_892:int = 0;
      
      public function InfostandUserData()
      {
         this.var_259 = [];
         super();
      }
      
      public function set userId(param1:int) : void
      {
         this._userId = param1;
      }
      
      public function set userName(param1:String) : void
      {
         this._userName = param1;
      }
      
      public function set badges(param1:Array) : void
      {
         this.var_259 = param1;
      }
      
      public function set groupId(param1:int) : void
      {
         this.var_1544 = param1;
      }
      
      public function set groupBadgeId(param1:String) : void
      {
         this.var_2706 = param1;
      }
      
      public function set respectLeft(param1:int) : void
      {
         this.var_1340 = param1;
      }
      
      public function set method_2(param1:int) : void
      {
         this.var_2705 = param1;
      }
      
      public function set userRoomId(param1:int) : void
      {
         this.var_2704 = param1;
      }
      
      public function set type(param1:String) : void
      {
         this._type = param1;
      }
      
      public function set petRespectLeft(param1:int) : void
      {
         this.var_892 = param1;
      }
      
      public function get userId() : int
      {
         return this._userId;
      }
      
      public function get userName() : String
      {
         return this._userName;
      }
      
      public function get badges() : Array
      {
         return this.var_259.slice();
      }
      
      public function get groupId() : int
      {
         return this.var_1544;
      }
      
      public function get groupBadgeId() : String
      {
         return this.var_2706;
      }
      
      public function get respectLeft() : int
      {
         return this.var_1340;
      }
      
      public function get method_2() : int
      {
         return this.var_2705;
      }
      
      public function get userRoomId() : int
      {
         return this.var_2704;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get petRespectLeft() : int
      {
         return this.var_892;
      }
      
      public function isBot() : Boolean
      {
         return this.type == RoomWidgetUserInfoUpdateEvent.BOT;
      }
      
      public function setData(param1:RoomWidgetUserInfoUpdateEvent) : void
      {
         this.userId = param1.webID;
         this.userName = param1.name;
         this.badges = param1.badges;
         this.groupId = param1.groupId;
         this.groupBadgeId = param1.groupBadgeId;
         this.respectLeft = param1.respectLeft;
         this.method_2 = param1.method_2;
         this.userRoomId = param1.userRoomId;
         this.type = param1.type;
      }
   }
}
