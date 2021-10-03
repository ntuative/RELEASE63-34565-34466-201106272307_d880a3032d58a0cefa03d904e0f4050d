package com.sulake.habbo.ui.handler
{
   import com.sulake.habbo.session.events.RoomSessionDoorbellEvent;
   import com.sulake.habbo.ui.IRoomWidgetHandler;
   import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
   import com.sulake.habbo.ui.widget.enums.RoomWidgetEnum;
   import com.sulake.habbo.ui.widget.events.RoomWidgetDoorbellEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetLetUserInMessage;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
   import flash.events.Event;
   
   public class DoorbellWidgetHandler implements IRoomWidgetHandler
   {
       
      
      private var var_1142:Boolean = false;
      
      private var _container:IRoomWidgetHandlerContainer = null;
      
      public function DoorbellWidgetHandler()
      {
         super();
      }
      
      public function get disposed() : Boolean
      {
         return this.var_1142;
      }
      
      public function get type() : String
      {
         return RoomWidgetEnum.const_136;
      }
      
      public function set container(param1:IRoomWidgetHandlerContainer) : void
      {
         this._container = param1;
      }
      
      public function dispose() : void
      {
         this.var_1142 = true;
         this._container = null;
      }
      
      public function getWidgetMessages() : Array
      {
         return [RoomWidgetLetUserInMessage.const_739];
      }
      
      public function processWidgetMessage(param1:RoomWidgetMessage) : RoomWidgetUpdateEvent
      {
         var _loc2_:* = null;
         switch(param1.type)
         {
            case RoomWidgetLetUserInMessage.const_739:
               _loc2_ = param1 as RoomWidgetLetUserInMessage;
               this._container.roomSession.letUserIn(_loc2_.userName,_loc2_.canEnter);
         }
         return null;
      }
      
      public function getProcessedEvents() : Array
      {
         return [RoomSessionDoorbellEvent.const_136,RoomSessionDoorbellEvent.const_146,RoomSessionDoorbellEvent.const_59];
      }
      
      public function processEvent(param1:Event) : void
      {
         var _loc2_:* = null;
         switch(param1.type)
         {
            case RoomSessionDoorbellEvent.const_136:
               _loc2_ = param1 as RoomSessionDoorbellEvent;
               if(_loc2_ == null)
               {
                  return;
               }
               this._container.events.dispatchEvent(new RoomWidgetDoorbellEvent(RoomWidgetDoorbellEvent.const_745,_loc2_.userName));
               break;
            case RoomSessionDoorbellEvent.const_146:
               _loc2_ = param1 as RoomSessionDoorbellEvent;
               if(_loc2_ == null)
               {
                  return;
               }
               this._container.events.dispatchEvent(new RoomWidgetDoorbellEvent(RoomWidgetDoorbellEvent.const_146,_loc2_.userName));
               break;
            case RoomSessionDoorbellEvent.const_59:
               _loc2_ = param1 as RoomSessionDoorbellEvent;
               if(_loc2_ == null)
               {
                  return;
               }
               this._container.events.dispatchEvent(new RoomWidgetDoorbellEvent(RoomWidgetDoorbellEvent.const_59,_loc2_.userName));
               break;
         }
      }
      
      public function update() : void
      {
      }
   }
}
