package com.sulake.habbo.ui.widget.events
{
   public class RoomWidgetVoteUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_171:String = "RWPUE_VOTE_QUESTION";
      
      public static const const_150:String = "RWPUE_VOTE_RESULT";
       
      
      private var var_1253:String;
      
      private var var_1557:Array;
      
      private var var_1157:Array;
      
      private var var_1943:int;
      
      public function RoomWidgetVoteUpdateEvent(param1:String, param2:String, param3:Array, param4:Array = null, param5:int = 0, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param6,param7);
         this.var_1253 = param2;
         this.var_1557 = param3;
         this.var_1157 = param4;
         if(this.var_1157 == null)
         {
            this.var_1157 = [];
         }
         this.var_1943 = param5;
      }
      
      public function get question() : String
      {
         return this.var_1253;
      }
      
      public function get choices() : Array
      {
         return this.var_1557.slice();
      }
      
      public function get votes() : Array
      {
         return this.var_1157.slice();
      }
      
      public function get totalVotes() : int
      {
         return this.var_1943;
      }
   }
}
