package com.sulake.habbo.room.object.logic
{
   import com.sulake.habbo.avatar.enum.AvatarAction;
   import com.sulake.habbo.room.events.RoomObjectFurnitureActionEvent;
   import com.sulake.habbo.room.events.RoomObjectMoveEvent;
   import com.sulake.habbo.room.messages.RoomObjectAvatarCarryObjectUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarChatUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarDanceUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarEffectUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarFigureUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarFlatControlUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarGestureUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarPlayerValueUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarPostureUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarSelectedMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarSignUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarSleepUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarTypingUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarUseObjectUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarWaveUpdateMessage;
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.room.events.RoomObjectEvent;
   import com.sulake.room.events.RoomObjectMouseEvent;
   import com.sulake.room.events.RoomSpriteMouseEvent;
   import com.sulake.room.messages.RoomObjectUpdateMessage;
   import com.sulake.room.object.IRoomObjectModelController;
   import com.sulake.room.utils.IRoomGeometry;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   import flash.events.MouseEvent;
   import flash.utils.getTimer;
   
   public class AvatarLogic extends MovingObjectLogic
   {
      
      private static const const_1138:Number = 1.5;
      
      private static const const_1137:int = 28;
      
      private static const const_1136:int = 29;
      
      private static const const_1135:int = 500;
      
      private static const const_1679:int = 999999999;
       
      
      private var _selected:Boolean = false;
      
      private var var_568:Vector3d = null;
      
      private var var_898:int = 0;
      
      private var var_1658:int = 0;
      
      private var var_1594:int = 0;
      
      private var var_1115:int = 0;
      
      private var var_899:int = 0;
      
      private var var_1356:int = 0;
      
      private var var_1593:int = 0;
      
      private var var_1660:int = 0;
      
      private var var_1116:int = 0;
      
      private var var_2132:Boolean = false;
      
      private var var_1657:int = 0;
      
      private var var_2131:int = 0;
      
      private var var_1659:int = 0;
      
      public function AvatarLogic()
      {
         super();
         this.var_2131 = getTimer() + this.getBlinkInterval();
      }
      
      override public function getEventTypes() : Array
      {
         var _loc1_:Array = [RoomObjectMouseEvent.const_172,RoomObjectMoveEvent.const_421,RoomObjectMouseEvent.const_195,RoomObjectMouseEvent.const_182,RoomObjectFurnitureActionEvent.const_283,RoomObjectFurnitureActionEvent.const_334];
         return getAllEventTypes(super.getEventTypes(),_loc1_);
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         if(this._selected && object != null)
         {
            if(eventDispatcher != null)
            {
               _loc1_ = new RoomObjectMoveEvent(RoomObjectMoveEvent.const_1005,object.getId(),object.getType());
               eventDispatcher.dispatchEvent(_loc1_);
            }
         }
         super.dispose();
         this.var_568 = null;
      }
      
      override public function processUpdateMessage(param1:RoomObjectUpdateMessage) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:* = null;
         var _loc16_:* = null;
         var _loc17_:* = null;
         var _loc18_:* = null;
         var _loc19_:* = null;
         var _loc20_:* = null;
         var _loc21_:* = null;
         var _loc22_:* = null;
         var _loc23_:* = null;
         if(param1 == null || object == null)
         {
            return;
         }
         super.processUpdateMessage(param1);
         var _loc2_:IRoomObjectModelController = object.getModelController();
         if(param1 is RoomObjectAvatarPostureUpdateMessage)
         {
            _loc3_ = param1 as RoomObjectAvatarPostureUpdateMessage;
            _loc2_.setString(RoomObjectVariableEnum.const_249,_loc3_.postureType);
            _loc2_.setString(RoomObjectVariableEnum.const_960,_loc3_.parameter);
            return;
         }
         if(param1 is RoomObjectAvatarChatUpdateMessage)
         {
            _loc4_ = param1 as RoomObjectAvatarChatUpdateMessage;
            _loc2_.setNumber(RoomObjectVariableEnum.const_196,1);
            this.var_1594 = getTimer() + _loc4_.numberOfWords * 1000;
            return;
         }
         if(param1 is RoomObjectAvatarTypingUpdateMessage)
         {
            _loc5_ = param1 as RoomObjectAvatarTypingUpdateMessage;
            _loc2_.setNumber(RoomObjectVariableEnum.const_551,Number(_loc5_.isTyping));
            return;
         }
         if(param1 is RoomObjectAvatarUpdateMessage)
         {
            _loc6_ = param1 as RoomObjectAvatarUpdateMessage;
            _loc2_.setNumber(RoomObjectVariableEnum.const_231,_loc6_.dirHead);
            return;
         }
         if(param1 is RoomObjectAvatarGestureUpdateMessage)
         {
            _loc7_ = param1 as RoomObjectAvatarGestureUpdateMessage;
            _loc2_.setNumber(RoomObjectVariableEnum.const_157,_loc7_.gesture);
            this.var_1593 = getTimer() + 3000;
            return;
         }
         if(param1 is RoomObjectAvatarWaveUpdateMessage)
         {
            _loc8_ = param1 as RoomObjectAvatarWaveUpdateMessage;
            if(_loc8_.isWaving)
            {
               _loc2_.setNumber(RoomObjectVariableEnum.const_253,1);
               this.var_1356 = getTimer() + 0;
            }
            else
            {
               _loc2_.setNumber(RoomObjectVariableEnum.const_253,0);
               this.var_1356 = 0;
            }
            return;
         }
         if(param1 is RoomObjectAvatarDanceUpdateMessage)
         {
            _loc9_ = param1 as RoomObjectAvatarDanceUpdateMessage;
            _loc2_.setNumber(RoomObjectVariableEnum.const_570,_loc9_.danceStyle);
            return;
         }
         if(param1 is RoomObjectAvatarSleepUpdateMessage)
         {
            _loc10_ = param1 as RoomObjectAvatarSleepUpdateMessage;
            _loc2_.setNumber(RoomObjectVariableEnum.const_300,Number(_loc10_.isSleeping));
            return;
         }
         if(param1 is RoomObjectAvatarPlayerValueUpdateMessage)
         {
            _loc11_ = param1 as RoomObjectAvatarPlayerValueUpdateMessage;
            _loc2_.setNumber(RoomObjectVariableEnum.const_443,_loc11_.value);
            this.var_1659 = getTimer() + 3000;
            return;
         }
         if(param1 is RoomObjectAvatarEffectUpdateMessage)
         {
            _loc12_ = param1 as RoomObjectAvatarEffectUpdateMessage;
            _loc13_ = _loc12_.effect;
            _loc14_ = _loc12_.delayMilliSeconds;
            this.updateEffect(_loc13_,_loc14_,_loc2_);
            return;
         }
         if(param1 is RoomObjectAvatarCarryObjectUpdateMessage)
         {
            _loc15_ = param1 as RoomObjectAvatarCarryObjectUpdateMessage;
            _loc2_.setNumber(RoomObjectVariableEnum.const_351,_loc15_.itemType);
            if(_loc15_.itemType < const_1679)
            {
               this.var_1116 = getTimer() + 100000;
               this.var_2132 = true;
            }
            else
            {
               this.var_1116 = getTimer() + 1500;
               this.var_2132 = false;
            }
            return;
         }
         if(param1 is RoomObjectAvatarUseObjectUpdateMessage)
         {
            _loc16_ = param1 as RoomObjectAvatarUseObjectUpdateMessage;
            _loc2_.setNumber(RoomObjectVariableEnum.const_298,_loc16_.itemType);
            return;
         }
         if(param1 is RoomObjectAvatarSignUpdateMessage)
         {
            _loc17_ = param1 as RoomObjectAvatarSignUpdateMessage;
            _loc2_.setNumber(RoomObjectVariableEnum.const_400,_loc17_.signType);
            this.var_1660 = getTimer() + 5000;
            return;
         }
         if(param1 is RoomObjectAvatarFlatControlUpdateMessage)
         {
            _loc18_ = param1 as RoomObjectAvatarFlatControlUpdateMessage;
            _loc2_.setString(RoomObjectVariableEnum.const_749,_loc18_.rawData);
            _loc2_.setNumber(RoomObjectVariableEnum.const_1974,Number(_loc18_.isAdmin));
            return;
         }
         if(param1 is RoomObjectAvatarFigureUpdateMessage)
         {
            _loc19_ = param1 as RoomObjectAvatarFigureUpdateMessage;
            _loc20_ = _loc2_.getString(RoomObjectVariableEnum.const_210);
            _loc21_ = _loc19_.figure;
            _loc22_ = _loc19_.gender;
            if(_loc20_ != null && _loc20_.indexOf(".bds-") != -1)
            {
               _loc21_ += _loc20_.substr(_loc20_.indexOf(".bds-"));
            }
            _loc2_.setString(RoomObjectVariableEnum.const_210,_loc21_);
            _loc2_.setString(RoomObjectVariableEnum.AVATAR_GENDER,_loc22_);
            return;
         }
         if(param1 is RoomObjectAvatarSelectedMessage)
         {
            _loc23_ = param1 as RoomObjectAvatarSelectedMessage;
            this._selected = _loc23_.selected;
            this.var_568 = null;
            return;
         }
      }
      
      private function updateEffect(param1:int, param2:int, param3:IRoomObjectModelController) : void
      {
         if(param1 == const_1137)
         {
            this.var_898 = getTimer() + const_1135;
            this.var_1658 = const_1136;
         }
         else if(param3.getNumber(RoomObjectVariableEnum.const_600) == const_1136)
         {
            this.var_898 = getTimer() + const_1135;
            this.var_1658 = param1;
            param1 = const_1137;
         }
         else
         {
            if(param2 != 0)
            {
               this.var_898 = getTimer() + param2;
               this.var_1658 = param1;
               return;
            }
            this.var_898 = 0;
         }
         param3.setNumber(RoomObjectVariableEnum.const_600,param1);
      }
      
      override public function mouseEvent(param1:RoomSpriteMouseEvent, param2:IRoomGeometry) : void
      {
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc6_:* = null;
         if(object == null || param1 == null)
         {
            return;
         }
         var _loc3_:* = null;
         switch(param1.type)
         {
            case MouseEvent.CLICK:
               _loc3_ = "null";
               break;
            case MouseEvent.ROLL_OVER:
               _loc3_ = "null";
               eventDispatcher.dispatchEvent(new RoomObjectFurnitureActionEvent(RoomObjectFurnitureActionEvent.const_283,object.getId(),object.getType()));
               break;
            case MouseEvent.ROLL_OUT:
               _loc3_ = "null";
               eventDispatcher.dispatchEvent(new RoomObjectFurnitureActionEvent(RoomObjectFurnitureActionEvent.const_334,object.getId(),object.getType()));
         }
         if(_loc3_ != null)
         {
            _loc4_ = object.getId();
            _loc5_ = object.getType();
            if(eventDispatcher != null)
            {
               _loc6_ = new RoomObjectMouseEvent(_loc3_,param1.eventId,_loc4_,_loc5_,param1.altKey,param1.ctrlKey,param1.shiftKey,param1.buttonDown);
               eventDispatcher.dispatchEvent(_loc6_);
            }
         }
      }
      
      override public function update(param1:int) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         super.update(param1);
         if(this._selected && object != null)
         {
            if(eventDispatcher != null)
            {
               _loc2_ = object.getLocation();
               if(this.var_568 == null || this.var_568.x != _loc2_.x || this.var_568.y != _loc2_.y || this.var_568.z != _loc2_.z)
               {
                  if(this.var_568 == null)
                  {
                     this.var_568 = new Vector3d();
                  }
                  this.var_568.assign(_loc2_);
                  _loc3_ = new RoomObjectMoveEvent(RoomObjectMoveEvent.const_421,object.getId(),object.getType());
                  eventDispatcher.dispatchEvent(_loc3_);
               }
            }
         }
         if(object != null && object.getModelController() != null)
         {
            this.updateActions(param1,object.getModelController());
         }
      }
      
      private function updateActions(param1:int, param2:IRoomObjectModelController) : void
      {
         if(this.var_1594 > 0)
         {
            if(param1 > this.var_1594)
            {
               param2.setNumber(RoomObjectVariableEnum.const_196,0);
               this.var_1594 = 0;
               this.var_899 = 0;
               this.var_1115 = 0;
            }
            else if(this.var_1115 == 0 && this.var_899 == 0)
            {
               this.var_899 = param1 + this.getTalkingPauseInterval();
               this.var_1115 = this.var_899 + this.getTalkingPauseLength();
            }
            else if(this.var_899 > 0 && param1 > this.var_899)
            {
               param2.setNumber(RoomObjectVariableEnum.const_196,0);
               this.var_899 = 0;
            }
            else if(this.var_1115 > 0 && param1 > this.var_1115)
            {
               param2.setNumber(RoomObjectVariableEnum.const_196,1);
               this.var_1115 = 0;
            }
         }
         if(this.var_1356 > 0 && param1 > this.var_1356)
         {
            param2.setNumber(RoomObjectVariableEnum.const_253,0);
            this.var_1356 = 0;
         }
         if(this.var_1593 > 0 && param1 > this.var_1593)
         {
            param2.setNumber(RoomObjectVariableEnum.const_157,0);
            this.var_1593 = 0;
         }
         if(this.var_1660 > 0 && param1 > this.var_1660)
         {
            param2.setNumber(RoomObjectVariableEnum.const_400,0);
            this.var_1660 = 0;
         }
         if(this.var_1116 > 0)
         {
            if(param1 > this.var_1116)
            {
               param2.setNumber(RoomObjectVariableEnum.const_351,0);
               this.var_1116 = 0;
            }
            else if((this.var_1116 - param1) % 10000 < 1000 && this.var_2132)
            {
               param2.setNumber(RoomObjectVariableEnum.const_298,1);
            }
            else
            {
               param2.setNumber(RoomObjectVariableEnum.const_298,0);
            }
         }
         if(param1 > this.var_2131)
         {
            param2.setNumber(RoomObjectVariableEnum.const_904,1);
            this.var_2131 = param1 + this.getBlinkInterval();
            this.var_1657 = param1 + this.getBlinkLength();
         }
         if(this.var_1657 > 0 && param1 > this.var_1657)
         {
            param2.setNumber(RoomObjectVariableEnum.const_904,0);
            this.var_1657 = 0;
         }
         if(this.var_898 > 0 && param1 > this.var_898)
         {
            param2.setNumber(RoomObjectVariableEnum.const_600,this.var_1658);
            this.var_898 = 0;
         }
         if(this.var_1659 > 0 && param1 > this.var_1659)
         {
            param2.setNumber(RoomObjectVariableEnum.const_443,0);
            this.var_1659 = 0;
         }
      }
      
      private function getTalkingPauseInterval() : int
      {
         return 100 + Math.random() * 200;
      }
      
      private function getTalkingPauseLength() : int
      {
         return 75 + Math.random() * 75;
      }
      
      private function getBlinkInterval() : int
      {
         return 4500 + Math.random() * 1000;
      }
      
      private function getBlinkLength() : int
      {
         return 50 + Math.random() * 200;
      }
      
      private function targetIsWarping(param1:IVector3d) : Boolean
      {
         var _loc2_:IVector3d = object.getLocation();
         if(param1 == null)
         {
            return false;
         }
         if(_loc2_.x == 0 && _loc2_.y == 0)
         {
            return false;
         }
         if(Math.abs(_loc2_.x - param1.x) > const_1138 || Math.abs(_loc2_.y - param1.y) > const_1138)
         {
            return true;
         }
         return false;
      }
   }
}
