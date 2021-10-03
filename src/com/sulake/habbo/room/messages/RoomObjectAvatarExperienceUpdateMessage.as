package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarExperienceUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_2635:int;
      
      public function RoomObjectAvatarExperienceUpdateMessage(param1:int)
      {
         super();
         this.var_2635 = param1;
      }
      
      public function get gainedExperience() : int
      {
         return this.var_2635;
      }
   }
}
