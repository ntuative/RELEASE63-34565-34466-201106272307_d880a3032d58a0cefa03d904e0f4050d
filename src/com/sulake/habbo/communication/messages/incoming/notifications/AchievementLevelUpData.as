package com.sulake.habbo.communication.messages.incoming.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class AchievementLevelUpData
   {
       
      
      private var _type:int;
      
      private var var_1160:int;
      
      private var var_1716:int;
      
      private var var_2810:int;
      
      private var var_2808:int;
      
      private var var_2691:int;
      
      private var var_1920:int;
      
      private var var_2811:String = "";
      
      private var var_2809:String = "";
      
      private var var_2807:int;
      
      private var _category:String;
      
      public function AchievementLevelUpData(param1:IMessageDataWrapper)
      {
         super();
         this._type = param1.readInteger();
         this.var_1160 = param1.readInteger();
         this.var_1920 = param1.readInteger();
         this.var_2811 = param1.readString();
         this.var_1716 = param1.readInteger();
         this.var_2810 = param1.readInteger();
         this.var_2808 = param1.readInteger();
         this.var_2691 = param1.readInteger();
         this.var_2807 = param1.readInteger();
         this.var_2809 = param1.readString();
         this._category = param1.readString();
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get level() : int
      {
         return this.var_1160;
      }
      
      public function get points() : int
      {
         return this.var_1716;
      }
      
      public function get levelRewardPoints() : int
      {
         return this.var_2810;
      }
      
      public function get levelRewardPointType() : int
      {
         return this.var_2808;
      }
      
      public function get bonusPoints() : int
      {
         return this.var_2691;
      }
      
      public function get badgeId() : int
      {
         return this.var_1920;
      }
      
      public function get badgeCode() : String
      {
         return this.var_2811;
      }
      
      public function get removedBadgeCode() : String
      {
         return this.var_2809;
      }
      
      public function get achievementID() : int
      {
         return this.var_2807;
      }
      
      public function get category() : String
      {
         return this._category;
      }
   }
}
