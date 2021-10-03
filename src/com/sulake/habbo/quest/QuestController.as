package com.sulake.habbo.quest
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.IUpdateReceiver;
   import com.sulake.habbo.communication.messages.incoming.quest.QuestMessageData;
   
   public class QuestController implements IDisposable, IUpdateReceiver
   {
       
      
      private var _questEngine:HabboQuestEngine;
      
      private var var_548:QuestsList;
      
      private var var_460:QuestDetails;
      
      private var _questCompleted:QuestCompleted;
      
      private var var_380:QuestTracker;
      
      private var var_658:NextQuestTimer;
      
      public function QuestController(param1:HabboQuestEngine)
      {
         super();
         this._questEngine = param1;
         this.var_380 = new QuestTracker(this._questEngine);
         this.var_548 = new QuestsList(this._questEngine);
         this.var_460 = new QuestDetails(this._questEngine);
         this._questCompleted = new QuestCompleted(this._questEngine);
         this.var_658 = new NextQuestTimer(this._questEngine);
      }
      
      public function onToolbarClick() : void
      {
         this.var_548.onToolbarClick();
      }
      
      public function onQuests(param1:Array, param2:Boolean) : void
      {
         this.var_548.onQuests(param1,param2);
      }
      
      public function onQuest(param1:QuestMessageData) : void
      {
         this.var_380.onQuest(param1);
         this.var_460.onQuest(param1);
         this._questCompleted.onQuest(param1);
         this.var_658.onQuest(param1);
      }
      
      public function onQuestCompleted(param1:QuestMessageData) : void
      {
         this.var_380.onQuestCompleted(param1);
         this.var_460.onQuestCompleted(param1);
         this._questCompleted.onQuestCompleted(param1);
      }
      
      public function onQuestCancelled() : void
      {
         this.var_380.onQuestCancelled();
         this.var_460.onQuestCancelled();
         this._questCompleted.onQuestCancelled();
         this.var_658.onQuestCancelled();
      }
      
      public function onRoomEnter() : void
      {
         this.var_380.onRoomEnter();
      }
      
      public function onRoomExit() : void
      {
         this.var_548.onRoomExit();
         this.var_380.onRoomExit();
         this.var_460.onRoomExit();
         this.var_658.onRoomExit();
      }
      
      public function update(param1:uint) : void
      {
         this._questCompleted.update(param1);
         this.var_380.update(param1);
         this.var_658.update(param1);
         this.var_548.update(param1);
         this.var_460.update(param1);
      }
      
      public function dispose() : void
      {
         this._questEngine = null;
         if(this.var_548)
         {
            this.var_548.dispose();
            this.var_548 = null;
         }
         if(this.var_380)
         {
            this.var_380.dispose();
            this.var_380 = null;
         }
         if(this.var_460)
         {
            this.var_460.dispose();
            this.var_460 = null;
         }
         if(this._questCompleted)
         {
            this._questCompleted.dispose();
            this._questCompleted = null;
         }
         if(this.var_658)
         {
            this.var_658.dispose();
            this.var_658 = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._questEngine == null;
      }
      
      public function get questsList() : QuestsList
      {
         return this.var_548;
      }
      
      public function get questDetails() : QuestDetails
      {
         return this.var_460;
      }
      
      public function get questTracker() : QuestTracker
      {
         return this.var_380;
      }
   }
}
