package com.sulake.habbo.room.object.logic.furniture
{
   import com.sulake.habbo.room.events.RoomObjectRoomAdEvent;
   import com.sulake.habbo.room.events.RoomObjectStateChangeEvent;
   import com.sulake.habbo.room.messages.RoomObjectDataUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectItemDataUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectMoveUpdateMessage;
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.habbo.room.object.logic.MovingObjectLogic;
   import com.sulake.room.events.RoomObjectEvent;
   import com.sulake.room.events.RoomObjectMouseEvent;
   import com.sulake.room.events.RoomSpriteMouseEvent;
   import com.sulake.room.messages.RoomObjectUpdateMessage;
   import com.sulake.room.object.IRoomObjectController;
   import com.sulake.room.object.IRoomObjectModelController;
   import com.sulake.room.utils.IRoomGeometry;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   import com.sulake.room.utils.XMLValidator;
   import flash.events.MouseEvent;
   
   public class FurnitureLogic extends MovingObjectLogic
   {
      
      private static const const_473:int = 8;
      
      private static const const_1081:Number = 0.0625;
       
      
      private var var_1229:Boolean = false;
      
      private var var_601:Number = 0.0;
      
      private var var_744:Number = 0.0;
      
      private var var_1507:Number = 0.0;
      
      private var var_2559:Number = 0.0;
      
      private var var_2560:Number = 0.0;
      
      private var var_1867:Number = 0.0;
      
      private var var_1866:Boolean = false;
      
      private var var_378:int = 0;
      
      private var var_1230:RoomObjectUpdateMessage;
      
      private var var_1000:Vector3d;
      
      private var var_283:Array;
      
      public function FurnitureLogic()
      {
         this.var_1000 = new Vector3d();
         this.var_283 = [];
         super();
      }
      
      override public function getEventTypes() : Array
      {
         var _loc1_:Array = [RoomObjectRoomAdEvent.const_380,RoomObjectRoomAdEvent.const_383,RoomObjectRoomAdEvent.const_518,RoomObjectStateChangeEvent.const_68,RoomObjectMouseEvent.const_172,RoomObjectRoomAdEvent.const_211,RoomObjectMouseEvent.const_669];
         return getAllEventTypes(super.getEventTypes(),_loc1_);
      }
      
      override public function dispose() : void
      {
         super.dispose();
         this.var_1230 = null;
         this.var_283 = null;
      }
      
      override public function set object(param1:IRoomObjectController) : void
      {
         super.object = param1;
         if(param1 != null && param1.getLocation().length > 0)
         {
            this.var_1866 = true;
         }
      }
      
      override public function initialize(param1:XML) : void
      {
         var _loc7_:* = null;
         var _loc8_:int = 0;
         if(param1 == null)
         {
            return;
         }
         this.var_601 = 0;
         this.var_744 = 0;
         this.var_1507 = 0;
         this.var_283 = [];
         var _loc2_:XMLList = param1.model.dimensions;
         if(_loc2_.length() == 0)
         {
            return;
         }
         var _loc3_:XMLList = _loc2_.@x;
         if(_loc3_.length() == 1)
         {
            this.var_601 = Number(_loc3_);
         }
         _loc3_ = _loc2_.@y;
         if(_loc3_.length() == 1)
         {
            this.var_744 = Number(_loc3_);
         }
         _loc3_ = _loc2_.@z;
         if(_loc3_.length() == 1)
         {
            this.var_1507 = Number(_loc3_);
         }
         this.var_2559 = this.var_601 / 2;
         this.var_2560 = this.var_744 / 2;
         _loc3_ = _loc2_.@centerZ;
         if(_loc3_.length() == 1)
         {
            this.var_1867 = Number(_loc3_);
         }
         else
         {
            this.var_1867 = this.var_1507 / 2;
         }
         var _loc4_:XMLList = param1.model.directions.direction;
         var _loc5_:* = ["id"];
         var _loc6_:int = 0;
         while(_loc6_ < _loc4_.length())
         {
            _loc7_ = _loc4_[_loc6_];
            if(XMLValidator.checkRequiredAttributes(_loc7_,_loc5_))
            {
               _loc8_ = parseInt(_loc7_.@id);
               this.var_283.push(_loc8_);
            }
            _loc6_++;
         }
         this.var_283.sort(Array.NUMERIC);
         if(object == null || object.getModelController() == null)
         {
            return;
         }
         object.getModelController().setNumber(RoomObjectVariableEnum.const_248,this.var_601,true);
         object.getModelController().setNumber(RoomObjectVariableEnum.const_360,this.var_744,true);
         object.getModelController().setNumber(RoomObjectVariableEnum.const_569,this.var_1507,true);
         object.getModelController().setNumber(RoomObjectVariableEnum.const_1755,this.var_2559,true);
         object.getModelController().setNumber(RoomObjectVariableEnum.const_1809,this.var_2560,true);
         object.getModelController().setNumber(RoomObjectVariableEnum.const_860,this.var_1867,true);
         object.getModelController().setNumberArray(RoomObjectVariableEnum.const_799,this.var_283,true);
         object.getModelController().setNumber(RoomObjectVariableEnum.const_378,1);
      }
      
      protected function getAdClickUrl(param1:IRoomObjectModelController) : String
      {
         return param1.getString(RoomObjectVariableEnum.const_401);
      }
      
      protected function handleAdClick(param1:int, param2:String, param3:String) : void
      {
         if(eventDispatcher != null)
         {
            eventDispatcher.dispatchEvent(new RoomObjectRoomAdEvent(RoomObjectRoomAdEvent.const_211,param1,param2));
         }
      }
      
      override public function mouseEvent(param1:RoomSpriteMouseEvent, param2:IRoomGeometry) : void
      {
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc6_:* = null;
         if(param1 == null || param2 == null)
         {
            return;
         }
         if(param1.type == MouseEvent.MOUSE_MOVE)
         {
            return;
         }
         if(object == null)
         {
            return;
         }
         var _loc3_:IRoomObjectModelController = object.getModel() as IRoomObjectModelController;
         if(_loc3_ == null)
         {
            return;
         }
         var _loc7_:String = this.getAdClickUrl(_loc3_);
         switch(param1.type)
         {
            case MouseEvent.ROLL_OVER:
               if(!this.var_1229)
               {
                  if(eventDispatcher != null && _loc7_ != null && _loc7_.indexOf("http") == 0)
                  {
                     _loc4_ = object.getId();
                     _loc5_ = object.getType();
                     eventDispatcher.dispatchEvent(new RoomObjectRoomAdEvent(RoomObjectRoomAdEvent.const_380,_loc4_,_loc5_));
                  }
                  this.var_1229 = true;
               }
               break;
            case MouseEvent.ROLL_OUT:
               if(this.var_1229)
               {
                  if(eventDispatcher != null && _loc7_ != null && _loc7_.indexOf("http") == 0)
                  {
                     _loc4_ = object.getId();
                     _loc5_ = object.getType();
                     eventDispatcher.dispatchEvent(new RoomObjectRoomAdEvent(RoomObjectRoomAdEvent.const_383,_loc4_,_loc5_));
                  }
                  this.var_1229 = false;
               }
               break;
            case MouseEvent.DOUBLE_CLICK:
               this.useObject();
               break;
            case MouseEvent.CLICK:
               _loc4_ = object.getId();
               _loc5_ = object.getType();
               if(eventDispatcher != null)
               {
                  _loc6_ = new RoomObjectMouseEvent(RoomObjectMouseEvent.const_172,param1.eventId,_loc4_,_loc5_,param1.altKey,param1.ctrlKey,param1.shiftKey,param1.buttonDown);
                  eventDispatcher.dispatchEvent(_loc6_);
               }
               if(eventDispatcher != null && _loc7_ != null && _loc7_.indexOf("http") == 0)
               {
                  this.handleAdClick(_loc4_,_loc5_,_loc7_);
               }
               break;
            case MouseEvent.MOUSE_DOWN:
               if(eventDispatcher != null)
               {
                  _loc4_ = object.getId();
                  _loc5_ = object.getType();
                  _loc6_ = new RoomObjectMouseEvent(RoomObjectMouseEvent.const_669,param1.eventId,_loc4_,_loc5_,param1.altKey,param1.ctrlKey,param1.shiftKey,param1.buttonDown);
                  eventDispatcher.dispatchEvent(_loc6_);
               }
         }
      }
      
      override public function useObject() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(object != null)
         {
            _loc1_ = object.getId();
            _loc2_ = object.getType();
            _loc3_ = object.getModel() as IRoomObjectModelController;
            if(_loc3_ != null)
            {
               _loc4_ = this.getAdClickUrl(_loc3_);
               if(eventDispatcher != null && _loc4_ != null && _loc4_.indexOf("http") == 0)
               {
                  eventDispatcher.dispatchEvent(new RoomObjectRoomAdEvent(RoomObjectRoomAdEvent.const_518,_loc1_,_loc2_));
               }
            }
            if(eventDispatcher != null)
            {
               eventDispatcher.dispatchEvent(new RoomObjectStateChangeEvent(RoomObjectStateChangeEvent.const_68,_loc1_,_loc2_));
            }
         }
      }
      
      private function handleDataUpdateMessage(param1:RoomObjectDataUpdateMessage) : void
      {
         var _loc2_:IRoomObjectModelController = object.getModelController();
         object.setState(param1.state,0);
         if(_loc2_ != null)
         {
            _loc2_.setString(RoomObjectVariableEnum.const_104,param1.data);
            if(!isNaN(param1.extra))
            {
               _loc2_.setString(RoomObjectVariableEnum.const_379,String(param1.extra));
            }
            _loc2_.setNumber(RoomObjectVariableEnum.const_776,lastUpdateTime);
         }
      }
      
      private function handleItemDataUpdateMessage(param1:RoomObjectItemDataUpdateMessage) : void
      {
         var _loc2_:IRoomObjectModelController = object.getModelController();
         if(_loc2_ != null)
         {
            _loc2_.setString(RoomObjectVariableEnum.const_1279,param1.itemData);
         }
      }
      
      override public function processUpdateMessage(param1:RoomObjectUpdateMessage) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc2_:RoomObjectDataUpdateMessage = param1 as RoomObjectDataUpdateMessage;
         if(_loc2_ != null)
         {
            this.handleDataUpdateMessage(_loc2_);
            return;
         }
         var _loc3_:RoomObjectItemDataUpdateMessage = param1 as RoomObjectItemDataUpdateMessage;
         if(_loc3_ != null)
         {
            this.handleItemDataUpdateMessage(_loc3_);
            return;
         }
         this.var_1229 = false;
         if(param1.dir != null && param1.loc != null)
         {
            if(!(param1 is RoomObjectMoveUpdateMessage))
            {
               _loc4_ = object.getDirection();
               _loc5_ = object.getLocation();
               if(_loc4_ != null && _loc4_.x != param1.dir.x && this.var_1866 && _loc5_ != null && _loc5_.x == param1.loc.x && _loc5_.y == param1.loc.y && _loc5_.z == param1.loc.z)
               {
                  this.var_378 = 1;
                  this.var_1230 = new RoomObjectUpdateMessage(param1.loc,param1.dir);
                  param1 = null;
               }
            }
            this.var_1866 = true;
         }
         super.processUpdateMessage(param1);
      }
      
      override protected function getLocationOffset() : IVector3d
      {
         if(this.var_378 > 0)
         {
            this.var_1000.x = 0;
            this.var_1000.y = 0;
            if(this.var_378 <= const_473 / 2)
            {
               this.var_1000.z = const_1081 * this.var_378;
            }
            else if(this.var_378 <= const_473)
            {
               if(this.var_1230)
               {
                  super.processUpdateMessage(this.var_1230);
                  this.var_1230 = null;
               }
               this.var_1000.z = const_1081 * (const_473 - this.var_378);
            }
            return this.var_1000;
         }
         return null;
      }
      
      override public function update(param1:int) : void
      {
         super.update(param1);
         if(this.var_378 > 0)
         {
            ++this.var_378;
            if(this.var_378 > const_473)
            {
               this.var_378 = 0;
            }
         }
      }
   }
}
