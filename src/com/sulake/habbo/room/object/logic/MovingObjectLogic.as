package com.sulake.habbo.room.object.logic
{
   import com.sulake.habbo.room.messages.RoomObjectMoveUpdateMessage;
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.room.messages.RoomObjectUpdateMessage;
   import com.sulake.room.object.IRoomObjectController;
   import com.sulake.room.object.IRoomObjectModelController;
   import com.sulake.room.object.logic.ObjectLogicBase;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class MovingObjectLogic extends ObjectLogicBase
   {
      
      public static const const_926:int = 500;
      
      private static var var_724:Vector3d = new Vector3d();
       
      
      private var var_490:Vector3d;
      
      private var var_104:Vector3d;
      
      private var var_1122:Number = 0.0;
      
      private var _lastUpdateTime:int = 0;
      
      private var var_2955:int;
      
      private var var_1123:int = 500;
      
      public function MovingObjectLogic()
      {
         this.var_490 = new Vector3d();
         this.var_104 = new Vector3d();
         super();
      }
      
      protected function get lastUpdateTime() : int
      {
         return this._lastUpdateTime;
      }
      
      override public function dispose() : void
      {
         super.dispose();
         this.var_104 = null;
         this.var_490 = null;
      }
      
      override public function set object(param1:IRoomObjectController) : void
      {
         super.object = param1;
         if(param1 != null)
         {
            this.var_104.assign(param1.getLocation());
         }
      }
      
      protected function set moveUpdateInterval(param1:int) : void
      {
         if(param1 <= 0)
         {
            param1 = 1;
         }
         this.var_1123 = param1;
      }
      
      override public function processUpdateMessage(param1:RoomObjectUpdateMessage) : void
      {
         var _loc3_:* = null;
         if(param1 == null)
         {
            return;
         }
         super.processUpdateMessage(param1);
         if(param1.loc != null)
         {
            this.var_104.assign(param1.loc);
         }
         var _loc2_:RoomObjectMoveUpdateMessage = param1 as RoomObjectMoveUpdateMessage;
         if(_loc2_ == null)
         {
            return;
         }
         if(object != null)
         {
            if(param1.loc != null)
            {
               _loc3_ = _loc2_.targetLoc;
               this.var_2955 = this._lastUpdateTime;
               this.var_490.assign(_loc3_);
               this.var_490.sub(this.var_104);
            }
         }
      }
      
      protected function getLocationOffset() : IVector3d
      {
         return null;
      }
      
      override public function update(param1:int) : void
      {
         var _loc4_:int = 0;
         var _loc2_:IVector3d = this.getLocationOffset();
         var _loc3_:IRoomObjectModelController = object.getModelController();
         if(_loc3_ != null)
         {
            if(_loc2_ != null)
            {
               if(this.var_1122 != _loc2_.z)
               {
                  this.var_1122 = _loc2_.z;
                  _loc3_.setNumber(RoomObjectVariableEnum.const_814,this.var_1122);
               }
            }
            else if(this.var_1122 != 0)
            {
               this.var_1122 = 0;
               _loc3_.setNumber(RoomObjectVariableEnum.const_814,this.var_1122);
            }
         }
         if(this.var_490.length > 0 || _loc2_ != null)
         {
            _loc4_ = param1 - this.var_2955;
            if(_loc4_ == this.var_1123 >> 1)
            {
               _loc4_++;
            }
            if(_loc4_ > this.var_1123)
            {
               _loc4_ = this.var_1123;
            }
            if(this.var_490.length > 0)
            {
               var_724.assign(this.var_490);
               var_724.mul(_loc4_ / Number(this.var_1123));
               var_724.add(this.var_104);
            }
            else
            {
               var_724.assign(this.var_104);
            }
            if(_loc2_ != null)
            {
               var_724.add(_loc2_);
            }
            if(object != null)
            {
               object.setLocation(var_724);
            }
            if(_loc4_ == this.var_1123)
            {
               this.var_490.x = 0;
               this.var_490.y = 0;
               this.var_490.z = 0;
            }
         }
         this._lastUpdateTime = param1;
      }
   }
}
