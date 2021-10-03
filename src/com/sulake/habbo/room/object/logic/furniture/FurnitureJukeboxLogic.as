package com.sulake.habbo.room.object.logic.furniture
{
   import com.sulake.habbo.room.events.RoomObjectFurnitureActionEvent;
   import com.sulake.habbo.room.events.RoomObjectStateChangeEvent;
   import com.sulake.habbo.room.events.RoomObjectWidgetRequestEvent;
   import com.sulake.habbo.room.messages.RoomObjectDataUpdateMessage;
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.habbo.ui.widget.enums.RoomWidgetInfostandExtraParamEnum;
   import com.sulake.room.events.RoomObjectEvent;
   import com.sulake.room.events.RoomSpriteMouseEvent;
   import com.sulake.room.messages.RoomObjectUpdateMessage;
   import com.sulake.room.object.IRoomObjectModelController;
   import com.sulake.room.utils.IRoomGeometry;
   import flash.events.MouseEvent;
   
   public class FurnitureJukeboxLogic extends FurnitureMultiStateLogic
   {
       
      
      private var var_1955:Boolean;
      
      private var _isInitialized:Boolean = false;
      
      private var var_1388:int = -1;
      
      public function FurnitureJukeboxLogic()
      {
         super();
      }
      
      override public function getEventTypes() : Array
      {
         var _loc1_:Array = [RoomObjectFurnitureActionEvent.const_579,RoomObjectFurnitureActionEvent.const_538,RoomObjectFurnitureActionEvent.const_583,RoomObjectFurnitureActionEvent.const_674,RoomObjectWidgetRequestEvent.const_177];
         return getAllEventTypes(super.getEventTypes(),_loc1_);
      }
      
      override public function dispose() : void
      {
         this.requestDispose();
         super.dispose();
      }
      
      override public function processUpdateMessage(param1:RoomObjectUpdateMessage) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:int = 0;
         super.processUpdateMessage(param1);
         if(object == null)
         {
            return;
         }
         if(!this._isInitialized)
         {
            this.requestInit();
         }
         if(object.getModelController().getNumber(RoomObjectVariableEnum.const_864) == 1)
         {
            object.getModelController().setString(RoomWidgetInfostandExtraParamEnum.const_415,RoomWidgetInfostandExtraParamEnum.const_582);
            _loc2_ = param1 as RoomObjectDataUpdateMessage;
            if(_loc2_ == null)
            {
               return;
            }
            _loc3_ = object.getModelController();
            if(_loc3_ == null)
            {
               return;
            }
            _loc4_ = object.getState(0);
            if(_loc4_ != this.var_1388)
            {
               this.var_1388 = _loc4_;
               if(_loc4_ == 1)
               {
                  this.requestPlayList();
               }
               else if(_loc4_ == 0)
               {
                  this.requestStopPlaying();
               }
            }
         }
      }
      
      override public function mouseEvent(param1:RoomSpriteMouseEvent, param2:IRoomGeometry) : void
      {
         if(param1 == null || param2 == null)
         {
            return;
         }
         if(object == null)
         {
            return;
         }
         switch(param1.type)
         {
            case MouseEvent.DOUBLE_CLICK:
               this.useObject();
               break;
            default:
               super.mouseEvent(param1,param2);
         }
      }
      
      override public function useObject() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(eventDispatcher != null && object != null)
         {
            _loc1_ = object.getId();
            _loc2_ = object.getType();
            _loc3_ = new RoomObjectWidgetRequestEvent(RoomObjectWidgetRequestEvent.const_177,_loc1_,_loc2_);
            eventDispatcher.dispatchEvent(_loc3_);
            eventDispatcher.dispatchEvent(new RoomObjectStateChangeEvent(RoomObjectStateChangeEvent.const_68,_loc1_,_loc2_,-1));
         }
      }
      
      private function requestInit() : void
      {
         if(object == null || eventDispatcher == null)
         {
            return;
         }
         this.var_1955 = true;
         var _loc1_:RoomObjectFurnitureActionEvent = new RoomObjectFurnitureActionEvent(RoomObjectFurnitureActionEvent.const_674,object.getId(),object.getType());
         eventDispatcher.dispatchEvent(_loc1_);
         this._isInitialized = true;
      }
      
      private function requestPlayList() : void
      {
         if(object == null || eventDispatcher == null)
         {
            return;
         }
         this.var_1955 = true;
         var _loc1_:RoomObjectFurnitureActionEvent = new RoomObjectFurnitureActionEvent(RoomObjectFurnitureActionEvent.const_579,object.getId(),object.getType());
         eventDispatcher.dispatchEvent(_loc1_);
      }
      
      private function requestStopPlaying() : void
      {
         if(object == null || eventDispatcher == null)
         {
            return;
         }
         var _loc1_:RoomObjectFurnitureActionEvent = new RoomObjectFurnitureActionEvent(RoomObjectFurnitureActionEvent.const_538,object.getId(),object.getType());
         eventDispatcher.dispatchEvent(_loc1_);
      }
      
      private function requestDispose() : void
      {
         if(!this.var_1955)
         {
            return;
         }
         if(object == null || eventDispatcher == null)
         {
            return;
         }
         var _loc1_:RoomObjectFurnitureActionEvent = new RoomObjectFurnitureActionEvent(RoomObjectFurnitureActionEvent.const_583,object.getId(),object.getType());
         eventDispatcher.dispatchEvent(_loc1_);
      }
   }
}
