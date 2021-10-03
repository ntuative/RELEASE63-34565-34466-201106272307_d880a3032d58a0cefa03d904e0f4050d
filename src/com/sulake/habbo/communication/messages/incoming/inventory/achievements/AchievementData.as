package com.sulake.habbo.communication.messages.incoming.inventory.achievements
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class AchievementData
   {
       
      
      private var _type:int;
      
      private var var_1160:int;
      
      private var var_1920:String;
      
      private var var_2082:int;
      
      private var var_2810:int;
      
      private var var_2808:int;
      
      private var var_2080:int;
      
      private var var_2081:Boolean;
      
      private var _category:String;
      
      private var var_2853:int;
      
      public function AchievementData(param1:IMessageDataWrapper)
      {
         super();
         this._type = param1.readInteger();
         this.var_1160 = param1.readInteger();
         this.var_1920 = param1.readString();
         this.var_2082 = Math.max(1,param1.readInteger());
         this.var_2810 = param1.readInteger();
         this.var_2808 = param1.readInteger();
         this.var_2080 = param1.readInteger();
         this.var_2081 = param1.readBoolean();
         this._category = param1.readString();
         this.var_2853 = param1.readInteger();
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get badgeId() : String
      {
         return this.var_1920;
      }
      
      public function get level() : int
      {
         return this.var_1160;
      }
      
      public function get scoreLimit() : int
      {
         return this.var_2082;
      }
      
      public function get levelRewardPoints() : int
      {
         return this.var_2810;
      }
      
      public function get levelRewardPointType() : int
      {
         return this.var_2808;
      }
      
      public function get currentPoints() : int
      {
         return this.var_2080;
      }
      
      public function get finalLevel() : Boolean
      {
         return this.var_2081;
      }
      
      public function get category() : String
      {
         return this._category;
      }
      
      public function get levelCount() : int
      {
         return this.var_2853;
      }
      
      public function get firstLevelAchieved() : Boolean
      {
         return this.var_1160 > 1 || this.var_2081;
      }
      
      public function setMaxProgress() : void
      {
         this.var_2080 = this.var_2082;
      }
   }
}
