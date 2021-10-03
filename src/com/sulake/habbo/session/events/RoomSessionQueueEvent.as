package com.sulake.habbo.session.events
{
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionQueueEvent extends RoomSessionEvent
   {
      
      public static const const_514:String = "RSQE_QUEUE_STATUS";
      
      public static const const_1243:String = "c";
      
      public static const const_2009:String = "d";
      
      public static const const_1396:int = 2;
      
      public static const const_1224:int = 1;
       
      
      private var _name:String;
      
      private var _target:int;
      
      private var var_1473:Map;
      
      private var var_551:Boolean;
      
      private var var_3118:String;
      
      public function RoomSessionQueueEvent(param1:IRoomSession, param2:String, param3:int, param4:Boolean = false, param5:Boolean = false, param6:Boolean = false)
      {
         super(const_514,param1,param5,param6);
         this._name = param2;
         this._target = param3;
         this.var_1473 = new Map();
         this.var_551 = param4;
      }
      
      public function get isActive() : Boolean
      {
         return this.var_551;
      }
      
      public function get queueSetName() : String
      {
         return this._name;
      }
      
      public function get queueSetTarget() : int
      {
         return this._target;
      }
      
      public function get queueTypes() : Array
      {
         return this.var_1473.getKeys();
      }
      
      public function getQueueSize(param1:String) : int
      {
         return this.var_1473.getValue(param1);
      }
      
      public function addQueue(param1:String, param2:int) : void
      {
         this.var_1473.add(param1,param2);
      }
   }
}
