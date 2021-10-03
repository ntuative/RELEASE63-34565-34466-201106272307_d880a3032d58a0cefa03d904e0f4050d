package com.sulake.habbo.communication.messages.parser.quest
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.quest.QuestMessageData;
   
   public class QuestCompletedMessageParser implements IMessageParser
   {
       
      
      private var var_2003:QuestMessageData;
      
      public function QuestCompletedMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         this.var_2003 = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_2003 = new QuestMessageData(param1);
         return true;
      }
      
      public function get questData() : QuestMessageData
      {
         return this.var_2003;
      }
   }
}
