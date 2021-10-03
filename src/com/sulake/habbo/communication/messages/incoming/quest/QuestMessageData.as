package com.sulake.habbo.communication.messages.incoming.quest
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class QuestMessageData
   {
       
      
      private var var_1931:String;
      
      private var var_1935:int;
      
      private var var_1934:int;
      
      private var var_2045:int;
      
      private var _id:int;
      
      private var var_1936:Boolean;
      
      private var _type:String;
      
      private var var_2675:String;
      
      private var var_2676:int;
      
      private var var_1933:String;
      
      private var var_2677:int;
      
      private var var_2674:int;
      
      private var var_1554:int;
      
      private var var_1932:Date;
      
      public function QuestMessageData(param1:IMessageDataWrapper)
      {
         this.var_1932 = new Date();
         super();
         this.var_1931 = param1.readString();
         this.var_1935 = param1.readInteger();
         this.var_1934 = param1.readInteger();
         this.var_2045 = param1.readInteger();
         this._id = param1.readInteger();
         this.var_1936 = param1.readBoolean();
         this._type = param1.readString();
         this.var_2675 = param1.readString();
         this.var_2676 = param1.readInteger();
         this.var_1933 = param1.readString();
         this.var_2677 = param1.readInteger();
         this.var_2674 = param1.readInteger();
         this.var_1554 = param1.readInteger();
      }
      
      public function get campaignCode() : String
      {
         return this.var_1931;
      }
      
      public function get localizationCode() : String
      {
         return this.var_1933;
      }
      
      public function get completedQuestsInCampaign() : int
      {
         return this.var_1935;
      }
      
      public function get questCountInCampaign() : int
      {
         return this.var_1934;
      }
      
      public function get activityPointType() : int
      {
         return this.var_2045;
      }
      
      public function get accepted() : Boolean
      {
         return this.var_1936;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get imageVersion() : String
      {
         return this.var_2675;
      }
      
      public function get rewardCurrencyAmount() : int
      {
         return this.var_2676;
      }
      
      public function get completedSteps() : int
      {
         return this.var_2677;
      }
      
      public function get totalSteps() : int
      {
         return this.var_2674;
      }
      
      public function get waitPeriodSeconds() : int
      {
         if(this.var_1554 < 1)
         {
            return 0;
         }
         var _loc1_:Date = new Date();
         var _loc2_:int = _loc1_.getTime() - this.var_1932.getTime();
         return int(Math.max(0,this.var_1554 - Math.floor(_loc2_ / 1000)));
      }
      
      public function getCampaignLocalizationKey() : String
      {
         return "quests." + this.var_1931;
      }
      
      public function getQuestLocalizationKey() : String
      {
         return this.getCampaignLocalizationKey() + "." + this.var_1933;
      }
      
      public function get completedCampaign() : Boolean
      {
         return this._id < 1;
      }
      
      public function set id(param1:int) : void
      {
         this._id = param1;
      }
      
      public function set accepted(param1:Boolean) : void
      {
         this.var_1936 = param1;
      }
      
      public function get lastQuestInCampaign() : Boolean
      {
         return this.var_1935 >= this.var_1934;
      }
      
      public function get receiveTime() : Date
      {
         return this.var_1932;
      }
      
      public function set waitPeriodSeconds(param1:int) : void
      {
         this.var_1554 = param1;
      }
   }
}
