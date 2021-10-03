package com.sulake.habbo.ui.widget.furniture.stickie
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.habbo.ui.IRoomWidgetHandler;
   import com.sulake.habbo.ui.widget.events.RoomWidgetSpamWallPostItEditEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetStickieDataUpdateEvent;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetSpamWallPostItFinishEditingMessage;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.events.IEventDispatcher;
   
   public class SpamWallPostItFurniWidget extends StickieFurniWidget
   {
       
      
      private var var_472:String = "";
      
      public function SpamWallPostItFurniWidget(param1:IRoomWidgetHandler, param2:IHabboWindowManager, param3:IAssetLibrary = null)
      {
         var_2250 = "spamwall_postit_container";
         super(param1,param2,param3);
      }
      
      override public function dispose() : void
      {
         var_238 = -1;
         this.var_472 = "";
         super.dispose();
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         param1.addEventListener(RoomWidgetSpamWallPostItEditEvent.const_621,this.onEditPostItRequest);
         super.registerUpdateEvents(param1);
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener(RoomWidgetSpamWallPostItEditEvent.const_621,this.onEditPostItRequest);
      }
      
      override protected function onObjectUpdate(param1:RoomWidgetStickieDataUpdateEvent) : void
      {
      }
      
      private function onEditPostItRequest(param1:RoomWidgetSpamWallPostItEditEvent) : void
      {
         hideInterface(false);
         var_238 = param1.objectId;
         this.var_472 = param1.location;
         var_1422 = param1.objectType;
         _text = "";
         var_359 = "FFFF33";
         var_27 = true;
         showInterface();
      }
      
      override protected function sendUpdate() : void
      {
         var _loc1_:* = null;
         if(var_238 != -1)
         {
            storeTextFromField();
            Logger.log("Spamwall Post-It Widget Send Update");
            if(messageListener != null)
            {
               _loc1_ = new RoomWidgetSpamWallPostItFinishEditingMessage(RoomWidgetSpamWallPostItFinishEditingMessage.const_800,var_238,this.var_472,_text,var_359);
               messageListener.processWidgetMessage(_loc1_);
            }
            hideInterface(false);
         }
      }
      
      override protected function sendSetColor(param1:uint) : void
      {
         storeTextFromField();
         var _loc2_:String = param1.toString(16).toUpperCase();
         if(_loc2_.length > 6)
         {
            _loc2_ = _loc2_.slice(_loc2_.length - 6,_loc2_.length);
         }
         if(_loc2_ == var_359)
         {
            return;
         }
         var_359 = _loc2_;
         showInterface();
      }
      
      override protected function sendDelete() : void
      {
         hideInterface(false);
      }
   }
}
