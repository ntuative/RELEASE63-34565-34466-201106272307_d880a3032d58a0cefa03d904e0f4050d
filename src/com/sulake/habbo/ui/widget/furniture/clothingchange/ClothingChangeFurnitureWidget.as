package com.sulake.habbo.ui.widget.furniture.clothingchange
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.avatar.figuredata.FigureData;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.ui.IRoomWidgetHandler;
   import com.sulake.habbo.ui.widget.RoomWidgetBase;
   import com.sulake.habbo.ui.widget.events.RoomWidgetClothingChangeUpdateEvent;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetClothingChangeMessage;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import flash.events.IEventDispatcher;
   import flash.geom.Rectangle;
   
   public class ClothingChangeFurnitureWidget extends RoomWidgetBase
   {
      
      private static const const_1139:String = "Boy";
      
      private static const const_1140:String = "Girl";
       
      
      private var var_489:IWindowContainer;
      
      private var var_238:int = 0;
      
      private var var_2270:int = 0;
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      public function ClothingChangeFurnitureWidget(param1:IRoomWidgetHandler, param2:IHabboWindowManager, param3:IAssetLibrary = null, param4:IHabboLocalizationManager = null)
      {
         super(param1,param2,param3,param4);
      }
      
      override public function dispose() : void
      {
         this.hideGenderSelectionInterface();
         super.dispose();
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.addEventListener(RoomWidgetClothingChangeUpdateEvent.const_450,this.onUpdate);
         param1.addEventListener(RoomWidgetClothingChangeUpdateEvent.const_1238,this.onUpdate);
         super.registerUpdateEvents(param1);
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener(RoomWidgetClothingChangeUpdateEvent.const_450,this.onUpdate);
         param1.removeEventListener(RoomWidgetClothingChangeUpdateEvent.const_1238,this.onUpdate);
      }
      
      private function onUpdate(param1:RoomWidgetClothingChangeUpdateEvent) : void
      {
         switch(param1.type)
         {
            case RoomWidgetClothingChangeUpdateEvent.const_450:
               this.showGenderSelectionInterface(param1);
         }
      }
      
      private function showGenderSelectionInterface(param1:RoomWidgetClothingChangeUpdateEvent) : void
      {
         this.hideGenderSelectionInterface();
         this.var_238 = param1.objectId;
         this.var_2270 = param1.objectCategory;
         this._roomId = param1.roomId;
         this._roomCategory = param1.roomCategory;
         var _loc2_:IAsset = assets.getAssetByName("boygirl");
         var _loc3_:XmlAsset = XmlAsset(_loc2_);
         if(_loc3_ == null)
         {
            return;
         }
         this.var_489 = windowManager.createWindow("clothing change gender selection","",HabboWindowType.const_79,HabboWindowStyle.const_47,0 | 0 | 0 | 0,new Rectangle(100,100,200,200),null,0) as IWindowContainer;
         this.var_489.buildFromXML(XML(_loc3_.content));
         this.var_489.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onGenderSelectionMouseEvent);
         this.var_489.center();
         var _loc4_:IWindow = this.var_489.findChildByTag("close");
         if(_loc4_ != null)
         {
            _loc4_.procedure = this.onGenderSelectionWindowClose;
         }
         _loc4_ = this.var_489.findChildByName(const_1139);
         if(_loc4_ != null)
         {
            _loc4_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onGenderSelectionMouseEvent);
         }
         _loc4_ = this.var_489.findChildByName(const_1140);
         if(_loc4_ != null)
         {
            _loc4_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onGenderSelectionMouseEvent);
         }
      }
      
      private function hideGenderSelectionInterface() : void
      {
         if(this.var_489 != null)
         {
            this.var_489.dispose();
            this.var_489 = null;
         }
      }
      
      private function onGenderSelectionWindowClose(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this.hideGenderSelectionInterface();
      }
      
      private function onGenderSelectionMouseEvent(param1:WindowMouseEvent) : void
      {
         var _loc2_:IWindow = param1.target as IWindow;
         var _loc3_:String = _loc2_.name;
         switch(_loc3_)
         {
            case const_1139:
               this.requestBoyEditor();
               this.hideGenderSelectionInterface();
               break;
            case const_1140:
               this.requestGirlEditor();
               this.hideGenderSelectionInterface();
               break;
            case "close":
            case "close_btn":
               this.hideGenderSelectionInterface();
         }
      }
      
      private function requestBoyEditor() : void
      {
         this.requestEditor(FigureData.const_93);
      }
      
      private function requestGirlEditor() : void
      {
         this.requestEditor(FigureData.FEMALE);
      }
      
      private function requestEditor(param1:String) : void
      {
         var _loc2_:RoomWidgetClothingChangeMessage = new RoomWidgetClothingChangeMessage(RoomWidgetClothingChangeMessage.const_984,param1,this.var_238,this.var_2270,this._roomId,this._roomCategory);
         messageListener.processWidgetMessage(_loc2_);
      }
   }
}
