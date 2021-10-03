package com.sulake.habbo.ui.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetUserInfoUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_118:String = "RWUIUE_OWN_USER";
      
      public static const BOT:String = "RWUIUE_BOT";
      
      public static const const_163:String = "RWUIUE_PEER";
      
      public static const TRADE_REASON_OK:int = 0;
      
      public static const const_1012:int = 2;
      
      public static const const_988:int = 3;
      
      public static const const_1924:String = "BOT";
       
      
      private var _name:String = "";
      
      private var var_1817:String = "";
      
      private var var_2536:int;
      
      private var var_2732:int = 0;
      
      private var var_2729:int = 0;
      
      private var _figure:String = "";
      
      private var var_47:BitmapData = null;
      
      private var var_259:Array;
      
      private var var_1544:int = 0;
      
      private var var_2706:String = "";
      
      private var var_2705:int = 0;
      
      private var var_2704:int = 0;
      
      private var var_2197:Boolean = false;
      
      private var var_1819:String = "";
      
      private var var_2262:Boolean = false;
      
      private var var_2913:Boolean = false;
      
      private var var_2907:Boolean = true;
      
      private var var_1340:int = 0;
      
      private var var_2912:Boolean = false;
      
      private var var_2910:Boolean = false;
      
      private var var_2909:Boolean = false;
      
      private var var_2911:Boolean = false;
      
      private var var_2908:Boolean = false;
      
      private var var_2914:Boolean = false;
      
      private var var_2915:int = 0;
      
      private var var_2199:Boolean = false;
      
      public function RoomWidgetUserInfoUpdateEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         this.var_259 = [];
         super(param1,param2,param3);
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set motto(param1:String) : void
      {
         this.var_1817 = param1;
      }
      
      public function get motto() : String
      {
         return this.var_1817;
      }
      
      public function set achievementScore(param1:int) : void
      {
         this.var_2536 = param1;
      }
      
      public function get achievementScore() : int
      {
         return this.var_2536;
      }
      
      public function set webID(param1:int) : void
      {
         this.var_2732 = param1;
      }
      
      public function get webID() : int
      {
         return this.var_2732;
      }
      
      public function set xp(param1:int) : void
      {
         this.var_2729 = param1;
      }
      
      public function get xp() : int
      {
         return this.var_2729;
      }
      
      public function set figure(param1:String) : void
      {
         this._figure = param1;
      }
      
      public function get figure() : String
      {
         return this._figure;
      }
      
      public function set image(param1:BitmapData) : void
      {
         this.var_47 = param1;
      }
      
      public function get image() : BitmapData
      {
         return this.var_47;
      }
      
      public function set badges(param1:Array) : void
      {
         this.var_259 = param1;
      }
      
      public function get badges() : Array
      {
         return this.var_259;
      }
      
      public function set groupId(param1:int) : void
      {
         this.var_1544 = param1;
      }
      
      public function get groupId() : int
      {
         return this.var_1544;
      }
      
      public function set groupBadgeId(param1:String) : void
      {
         this.var_2706 = param1;
      }
      
      public function get groupBadgeId() : String
      {
         return this.var_2706;
      }
      
      public function set canBeAskedAsFriend(param1:Boolean) : void
      {
         this.var_2913 = param1;
      }
      
      public function get canBeAskedAsFriend() : Boolean
      {
         return this.var_2913;
      }
      
      public function set respectLeft(param1:int) : void
      {
         this.var_1340 = param1;
      }
      
      public function get respectLeft() : int
      {
         return this.var_1340;
      }
      
      public function set isIgnored(param1:Boolean) : void
      {
         this.var_2912 = param1;
      }
      
      public function get isIgnored() : Boolean
      {
         return this.var_2912;
      }
      
      public function set amIOwner(param1:Boolean) : void
      {
         this.var_2910 = param1;
      }
      
      public function get amIOwner() : Boolean
      {
         return this.var_2910;
      }
      
      public function set amIController(param1:Boolean) : void
      {
         this.var_2909 = param1;
      }
      
      public function get amIController() : Boolean
      {
         return this.var_2909;
      }
      
      public function set amIAnyRoomController(param1:Boolean) : void
      {
         this.var_2911 = param1;
      }
      
      public function get amIAnyRoomController() : Boolean
      {
         return this.var_2911;
      }
      
      public function set hasFlatControl(param1:Boolean) : void
      {
         this.var_2908 = param1;
      }
      
      public function get hasFlatControl() : Boolean
      {
         return this.var_2908;
      }
      
      public function set canTrade(param1:Boolean) : void
      {
         this.var_2914 = param1;
      }
      
      public function get canTrade() : Boolean
      {
         return this.var_2914;
      }
      
      public function set canTradeReason(param1:int) : void
      {
         this.var_2915 = param1;
      }
      
      public function get canTradeReason() : int
      {
         return this.var_2915;
      }
      
      public function set canBeKicked(param1:Boolean) : void
      {
         this.var_2907 = param1;
      }
      
      public function get canBeKicked() : Boolean
      {
         return this.var_2907;
      }
      
      public function set isRoomOwner(param1:Boolean) : void
      {
         this.var_2199 = param1;
      }
      
      public function get isRoomOwner() : Boolean
      {
         return this.var_2199;
      }
      
      public function set method_2(param1:int) : void
      {
         this.var_2705 = param1;
      }
      
      public function get method_2() : int
      {
         return this.var_2705;
      }
      
      public function set userRoomId(param1:int) : void
      {
         this.var_2704 = param1;
      }
      
      public function get userRoomId() : int
      {
         return this.var_2704;
      }
      
      public function set isSpectatorMode(param1:Boolean) : void
      {
         this.var_2197 = param1;
      }
      
      public function get isSpectatorMode() : Boolean
      {
         return this.var_2197;
      }
      
      public function set realName(param1:String) : void
      {
         this.var_1819 = param1;
      }
      
      public function get realName() : String
      {
         return this.var_1819;
      }
      
      public function set allowNameChange(param1:Boolean) : void
      {
         this.var_2262 = param1;
      }
      
      public function get allowNameChange() : Boolean
      {
         return this.var_2262;
      }
   }
}
