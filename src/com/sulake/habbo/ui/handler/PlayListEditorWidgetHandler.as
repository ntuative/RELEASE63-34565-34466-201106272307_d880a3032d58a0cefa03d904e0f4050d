package com.sulake.habbo.ui.handler
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.inventory.furni.FurniListInsertEvent;
   import com.sulake.habbo.communication.messages.incoming.inventory.furni.FurniListRemoveEvent;
   import com.sulake.habbo.communication.messages.incoming.inventory.furni.FurniListUpdateEvent;
   import com.sulake.habbo.communication.messages.outgoing.room.engine.UseFurnitureMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.sound.AddJukeboxDiskComposer;
   import com.sulake.habbo.communication.messages.outgoing.sound.RemoveJukeboxDiskComposer;
   import com.sulake.habbo.room.events.RoomEngineSoundMachineEvent;
   import com.sulake.habbo.sound.events.NowPlayingEvent;
   import com.sulake.habbo.sound.events.PlayListStatusEvent;
   import com.sulake.habbo.sound.events.SongDiskInventoryReceivedEvent;
   import com.sulake.habbo.ui.IRoomWidgetHandler;
   import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
   import com.sulake.habbo.ui.widget.enums.RoomWidgetEnum;
   import com.sulake.habbo.ui.widget.events.RoomWidgetPlayListEditorEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetPlayListEditorNowPlayingEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetFurniToWidgetMessage;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetPlayListModificationMessage;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetPlayListPlayStateMessage;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetPlayListUserActionMessage;
   import com.sulake.room.object.IRoomObject;
   import flash.events.Event;
   
   public class PlayListEditorWidgetHandler implements IRoomWidgetHandler
   {
       
      
      private var _disposed:Boolean = false;
      
      private var _container:IRoomWidgetHandlerContainer;
      
      private var _connection:IConnection = null;
      
      private var var_1656:IMessageEvent;
      
      private var var_2130:IMessageEvent;
      
      private var var_2129:IMessageEvent;
      
      public function PlayListEditorWidgetHandler()
      {
         super();
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get type() : String
      {
         return RoomWidgetEnum.const_539;
      }
      
      public function set container(param1:IRoomWidgetHandlerContainer) : void
      {
         this._container = param1;
         if(this._container.soundManager)
         {
            this._container.soundManager.events.addEventListener(SongDiskInventoryReceivedEvent.SONG_DISK_INVENTORY_RECEIVED,this.processSoundManagerEvent);
            this._container.soundManager.events.addEventListener(PlayListStatusEvent.const_102,this.processSoundManagerEvent);
            this._container.soundManager.events.addEventListener(PlayListStatusEvent.const_167,this.processSoundManagerEvent);
            this._container.soundManager.events.addEventListener(NowPlayingEvent.const_105,this.processSoundManagerEvent);
            this._container.soundManager.events.addEventListener(NowPlayingEvent.const_123,this.processSoundManagerEvent);
            this._container.soundManager.events.addEventListener(NowPlayingEvent.const_134,this.processSoundManagerEvent);
         }
      }
      
      public function set connection(param1:IConnection) : void
      {
         this.var_1656 = new FurniListUpdateEvent(this.onFurniListUpdated);
         this.var_2130 = new FurniListRemoveEvent(this.onFurniListUpdated);
         this.var_2129 = new FurniListInsertEvent(this.onFurniListUpdated);
         this._connection = param1;
         this._connection.addMessageEvent(this.var_1656);
         this._connection.addMessageEvent(this.var_2130);
         this._connection.addMessageEvent(this.var_2129);
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            this._disposed = true;
            if(this._connection)
            {
               this._connection.removeMessageEvent(this.var_1656);
               this._connection.removeMessageEvent(this.var_2130);
               this._connection.removeMessageEvent(this.var_2129);
            }
            this._connection = null;
            this.var_1656 = null;
            if(this._container)
            {
               if(this._container.soundManager)
               {
                  if(this._container.soundManager.events)
                  {
                     this._container.soundManager.events.removeEventListener(SongDiskInventoryReceivedEvent.SONG_DISK_INVENTORY_RECEIVED,this.processSoundManagerEvent);
                     this._container.soundManager.events.removeEventListener(PlayListStatusEvent.const_102,this.processSoundManagerEvent);
                     this._container.soundManager.events.removeEventListener(PlayListStatusEvent.const_167,this.processSoundManagerEvent);
                     this._container.soundManager.events.removeEventListener(NowPlayingEvent.const_105,this.processSoundManagerEvent);
                     this._container.soundManager.events.removeEventListener(NowPlayingEvent.const_123,this.processSoundManagerEvent);
                     this._container.soundManager.events.removeEventListener(NowPlayingEvent.const_134,this.processSoundManagerEvent);
                  }
               }
               this._container = null;
            }
         }
      }
      
      public function getWidgetMessages() : Array
      {
         return [RoomWidgetFurniToWidgetMessage.const_982,RoomWidgetPlayListModificationMessage.const_835,RoomWidgetPlayListModificationMessage.const_883,RoomWidgetPlayListPlayStateMessage.const_983,RoomWidgetPlayListUserActionMessage.const_997];
      }
      
      public function processWidgetMessage(param1:RoomWidgetMessage) : RoomWidgetUpdateEvent
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:Boolean = false;
         var _loc8_:* = null;
         switch(param1.type)
         {
            case RoomWidgetFurniToWidgetMessage.const_982:
               _loc2_ = param1 as RoomWidgetFurniToWidgetMessage;
               _loc3_ = this._container.roomEngine.getRoomObject(_loc2_.roomId,_loc2_.roomCategory,_loc2_.id,_loc2_.category);
               if(_loc3_ != null)
               {
                  _loc7_ = this._container.roomSession.isRoomOwner;
                  if(_loc7_)
                  {
                     _loc8_ = new RoomWidgetPlayListEditorEvent(RoomWidgetPlayListEditorEvent.const_742,_loc2_.id);
                     this._container.events.dispatchEvent(_loc8_);
                  }
               }
               break;
            case RoomWidgetPlayListModificationMessage.const_835:
               _loc4_ = param1 as RoomWidgetPlayListModificationMessage;
               if(this._connection != null)
               {
                  this._connection.send(new AddJukeboxDiskComposer(_loc4_.diskId,_loc4_.slotNumber));
               }
               break;
            case RoomWidgetPlayListModificationMessage.const_883:
               _loc5_ = param1 as RoomWidgetPlayListModificationMessage;
               if(this._connection != null)
               {
                  this._connection.send(new RemoveJukeboxDiskComposer(_loc5_.slotNumber));
               }
               break;
            case RoomWidgetPlayListPlayStateMessage.const_983:
               _loc6_ = param1 as RoomWidgetPlayListPlayStateMessage;
               if(this._connection != null)
               {
                  this._connection.send(new UseFurnitureMessageComposer(_loc6_.furniId,_loc6_.position));
               }
               break;
            case RoomWidgetPlayListUserActionMessage.const_997:
               this._container.habboTracking.trackGoogle("playlistEditorPanelOpenCatalogue","click");
         }
         return null;
      }
      
      public function getProcessedEvents() : Array
      {
         var _loc1_:* = [];
         _loc1_.push(RoomEngineSoundMachineEvent.const_259);
         return _loc1_;
      }
      
      public function processEvent(param1:Event) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         switch(param1.type)
         {
            case RoomEngineSoundMachineEvent.const_259:
               _loc2_ = param1 as RoomEngineSoundMachineEvent;
               _loc3_ = new RoomWidgetPlayListEditorEvent(RoomWidgetPlayListEditorEvent.const_877,_loc2_.objectId);
               this._container.events.dispatchEvent(_loc3_);
         }
      }
      
      public function update() : void
      {
      }
      
      private function onFurniListUpdated(param1:IMessageEvent) : void
      {
         if(this._container != null)
         {
            if(this._container.events != null)
            {
               this._container.events.dispatchEvent(new RoomWidgetPlayListEditorEvent(RoomWidgetPlayListEditorEvent.const_843,-1));
            }
         }
      }
      
      private function processSoundManagerEvent(param1:Event) : void
      {
         var _loc2_:* = null;
         switch(param1.type)
         {
            case SongDiskInventoryReceivedEvent.SONG_DISK_INVENTORY_RECEIVED:
               this._container.events.dispatchEvent(new RoomWidgetPlayListEditorEvent(RoomWidgetPlayListEditorEvent.const_892));
               break;
            case PlayListStatusEvent.const_102:
               this._container.events.dispatchEvent(new RoomWidgetPlayListEditorEvent(RoomWidgetPlayListEditorEvent.const_102));
               break;
            case PlayListStatusEvent.const_167:
               this._container.events.dispatchEvent(new RoomWidgetPlayListEditorEvent(RoomWidgetPlayListEditorEvent.const_167));
               break;
            case NowPlayingEvent.const_105:
               _loc2_ = param1 as NowPlayingEvent;
               this._container.events.dispatchEvent(new RoomWidgetPlayListEditorNowPlayingEvent(RoomWidgetPlayListEditorNowPlayingEvent.const_105,_loc2_.id,_loc2_.position,_loc2_.priority));
               break;
            case NowPlayingEvent.const_123:
               _loc2_ = param1 as NowPlayingEvent;
               this._container.events.dispatchEvent(new RoomWidgetPlayListEditorNowPlayingEvent(RoomWidgetPlayListEditorNowPlayingEvent.const_123,_loc2_.id,_loc2_.position,_loc2_.priority));
               break;
            case NowPlayingEvent.const_134:
               _loc2_ = param1 as NowPlayingEvent;
               this._container.events.dispatchEvent(new RoomWidgetPlayListEditorNowPlayingEvent(RoomWidgetPlayListEditorNowPlayingEvent.const_134,_loc2_.id,_loc2_.position,_loc2_.priority));
         }
      }
   }
}
