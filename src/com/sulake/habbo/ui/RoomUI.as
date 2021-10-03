package com.sulake.habbo.ui
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.runtime.ComponentContext;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.core.runtime.IUpdateReceiver;
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.habbo.advertisement.IAdManager;
   import com.sulake.habbo.advertisement.events.AdEvent;
   import com.sulake.habbo.advertisement.events.InterstitialEvent;
   import com.sulake.habbo.avatar.IAvatarRenderManager;
   import com.sulake.habbo.avatar.IHabboAvatarEditor;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.friendlist.IHabboFriendList;
   import com.sulake.habbo.help.IHabboHelp;
   import com.sulake.habbo.inventory.IHabboInventory;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.moderation.IHabboModeration;
   import com.sulake.habbo.navigator.IHabboNavigator;
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.room.events.RoomEngineDimmerStateEvent;
   import com.sulake.habbo.room.events.RoomEngineEvent;
   import com.sulake.habbo.room.events.RoomEngineObjectEvent;
   import com.sulake.habbo.room.events.RoomEngineRoomColorEvent;
   import com.sulake.habbo.room.events.RoomEngineSoundMachineEvent;
   import com.sulake.habbo.roomevents.IHabboUserDefinedRoomEvents;
   import com.sulake.habbo.session.IRoomSession;
   import com.sulake.habbo.session.IRoomSessionManager;
   import com.sulake.habbo.session.ISessionDataManager;
   import com.sulake.habbo.session.events.RoomSessionChatEvent;
   import com.sulake.habbo.session.events.RoomSessionDanceEvent;
   import com.sulake.habbo.session.events.RoomSessionDimmerPresetsEvent;
   import com.sulake.habbo.session.events.RoomSessionDoorbellEvent;
   import com.sulake.habbo.session.events.RoomSessionErrorMessageEvent;
   import com.sulake.habbo.session.events.RoomSessionEvent;
   import com.sulake.habbo.session.events.RoomSessionFriendRequestEvent;
   import com.sulake.habbo.session.events.RoomSessionPetPackageEvent;
   import com.sulake.habbo.session.events.RoomSessionPollEvent;
   import com.sulake.habbo.session.events.RoomSessionPresentEvent;
   import com.sulake.habbo.session.events.RoomSessionQueueEvent;
   import com.sulake.habbo.session.events.RoomSessionUserBadgesEvent;
   import com.sulake.habbo.session.events.RoomSessionUserDataUpdateEvent;
   import com.sulake.habbo.session.events.RoomSessionUserNotificationEvent;
   import com.sulake.habbo.session.events.RoomSessionViralFurniStatusEvent;
   import com.sulake.habbo.session.events.RoomSessionVoteEvent;
   import com.sulake.habbo.sound.IHabboSoundManager;
   import com.sulake.habbo.toolbar.HabboToolbarEnum;
   import com.sulake.habbo.toolbar.IHabboToolbar;
   import com.sulake.habbo.tracking.IHabboTracking;
   import com.sulake.habbo.ui.widget.RoomWidgetFactory;
   import com.sulake.habbo.ui.widget.enums.RoomWidgetEnum;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.utils.IAlertDialog;
   import com.sulake.iid.IIDAvatarRenderManager;
   import com.sulake.iid.IIDHabboAdManager;
   import com.sulake.iid.IIDHabboAvatarEditor;
   import com.sulake.iid.IIDHabboCatalog;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import com.sulake.iid.IIDHabboFriendList;
   import com.sulake.iid.IIDHabboHelp;
   import com.sulake.iid.IIDHabboInventory;
   import com.sulake.iid.IIDHabboLocalizationManager;
   import com.sulake.iid.IIDHabboModeration;
   import com.sulake.iid.IIDHabboNavigator;
   import com.sulake.iid.IIDHabboRoomSessionManager;
   import com.sulake.iid.IIDHabboSoundManager;
   import com.sulake.iid.IIDHabboToolbar;
   import com.sulake.iid.IIDHabboTracking;
   import com.sulake.iid.IIDHabboUserDefinedRoomEvents;
   import com.sulake.iid.IIDRoomEngine;
   import com.sulake.iid.IIDSessionDataManager;
   import iid.IIDHabboWindowManager;
   
   public class RoomUI extends ComponentContext implements IRoomUI, IUpdateReceiver
   {
       
      
      private var _windowManager:IHabboWindowManager;
      
      private var _roomEngine:IRoomEngine;
      
      private var var_16:IRoomSessionManager;
      
      private var var_1259:IRoomWidgetFactory;
      
      private var var_372:ISessionDataManager;
      
      private var _friendList:IHabboFriendList;
      
      private var var_1020:IAvatarRenderManager;
      
      private var var_13:IHabboInventory;
      
      private var _toolbar:IHabboToolbar;
      
      private var _navigator:IHabboNavigator;
      
      private var var_1465:IHabboAvatarEditor = null;
      
      private var _catalog:IHabboCatalog;
      
      private var var_336:IAdManager;
      
      private var _localization:IHabboLocalizationManager;
      
      private var var_1307:IHabboHelp;
      
      private var var_1053:IHabboModeration;
      
      private var _config:IHabboConfigurationManager;
      
      private var _soundManager:IHabboSoundManager;
      
      private var var_335:Map;
      
      private var var_1586:int;
      
      private var var_1585:Boolean;
      
      private var _interstitialRoomId:int;
      
      private var var_2739:int;
      
      private var _connection:IConnection;
      
      private var _habboTracking:IHabboTracking;
      
      private var var_1308:IHabboUserDefinedRoomEvents;
      
      public function RoomUI(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         this.var_1586 = RoomDesktop.const_592;
         super(param1,param2,param3);
         var _loc4_:RoomWidgetFactory = new RoomWidgetFactory(this,0,param3);
         this.var_1259 = _loc4_;
         attachComponent(_loc4_,[]);
         queueInterface(new IIDHabboWindowManager(),this.onWindowManagerReady);
         queueInterface(new IIDRoomEngine(),this.onRoomEngineReady);
         queueInterface(new IIDHabboRoomSessionManager(),this.onRoomSessionManagerReady);
         queueInterface(new IIDSessionDataManager(),this.onSessionDataManagerReady);
         queueInterface(new IIDHabboFriendList(),this.onFriendListReady);
         queueInterface(new IIDAvatarRenderManager(),this.onAvatarRenderManagerReady);
         queueInterface(new IIDHabboInventory(),this.onInventoryReady);
         queueInterface(new IIDHabboToolbar(),this.onToolbarReady);
         queueInterface(new IIDHabboNavigator(),this.onNavigatorReady);
         queueInterface(new IIDHabboAvatarEditor(),this.onAvatarEditorReady);
         queueInterface(new IIDHabboCatalog(),this.onCatalogReady);
         queueInterface(new IIDHabboAdManager(),this.onAdManagerReady);
         queueInterface(new IIDHabboLocalizationManager(),this.onLocalizationManagerReady);
         queueInterface(new IIDHabboHelp(),this.onHabboHelpReady);
         queueInterface(new IIDHabboModeration(),this.onHabboModerationReady);
         queueInterface(new IIDHabboConfigurationManager(),this.onConfigurationManagerReady);
         queueInterface(new IIDHabboSoundManager(),this.onSoundManagerReady);
         queueInterface(new IIDHabboCommunicationManager(),this.onCommunicationReady);
         queueInterface(new IIDHabboUserDefinedRoomEvents(),this.onUserDefinedRoomEventsReady);
         queueInterface(new IIDHabboTracking(),this.onHabboTrackingReady);
         this.var_335 = new Map();
         registerUpdateReceiver(this,0);
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(this._windowManager != null)
         {
            this._windowManager.release(new IIDHabboWindowManager());
            this._windowManager = null;
         }
         if(this._roomEngine != null)
         {
            this._roomEngine.release(new IIDRoomEngine());
            this._roomEngine = null;
         }
         if(this.var_16 != null)
         {
            this.var_16.release(new IIDHabboRoomSessionManager());
            this.var_16 = null;
         }
         if(this.var_1259 != null)
         {
            this.var_1259.dispose();
            this.var_1259 = null;
         }
         if(this.var_13 != null)
         {
            this.var_13.release(new IIDHabboInventory());
            this.var_13 = null;
         }
         if(this._toolbar != null)
         {
            this._toolbar.release(new IIDHabboToolbar());
            this._toolbar = null;
         }
         if(this._config != null)
         {
            this._config.release(new IIDHabboConfigurationManager());
            this._config = null;
         }
         if(this._soundManager != null)
         {
            this._soundManager.release(new IIDHabboSoundManager());
            this._soundManager = null;
         }
         if(this.var_336 != null)
         {
            this.var_336.release(new IIDHabboAdManager());
            this.var_336 = null;
         }
         if(this.var_1020 != null)
         {
            this.var_1020.release(new IIDAvatarRenderManager());
            this.var_1020 = null;
         }
         if(this._catalog != null)
         {
            this._catalog.release(new IIDHabboCatalog());
            this._catalog = null;
         }
         if(this._friendList != null)
         {
            this._friendList.release(new IIDHabboFriendList());
            this._friendList = null;
         }
         if(this.var_1307 != null)
         {
            this.var_1307.release(new IIDHabboHelp());
            this.var_1307 = null;
         }
         if(this._localization != null)
         {
            this._localization.release(new IIDHabboLocalizationManager());
            this._localization = null;
         }
         if(this.var_1053 != null)
         {
            this.var_1053.release(new IIDHabboModeration());
            this.var_1053 = null;
         }
         if(this._navigator != null)
         {
            this._navigator.release(new IIDHabboNavigator());
            this._navigator = null;
         }
         if(this.var_372 != null)
         {
            this.var_372.release(new IIDSessionDataManager());
            this.var_372 = null;
         }
         if(this._habboTracking != null)
         {
            this._habboTracking.release(new IIDHabboTracking());
            this._habboTracking = null;
         }
         if(this.var_1308)
         {
            this.var_1308.release(new IIDHabboUserDefinedRoomEvents());
            this.var_1308 = null;
         }
         this.var_1465 = null;
         this._connection = null;
         if(this.var_335)
         {
            while(this.var_335.length > 0)
            {
               _loc1_ = this.var_335.getKey(0) as String;
               _loc2_ = this.var_335.remove(_loc1_) as RoomDesktop;
               if(_loc2_ != null)
               {
                  _loc2_.dispose();
               }
            }
            this.var_335.dispose();
            this.var_335 = null;
         }
         removeUpdateReceiver(this);
         super.dispose();
      }
      
      private function onWindowManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this._windowManager = param2 as IHabboWindowManager;
      }
      
      private function onRoomSessionManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this.var_16 = param2 as IRoomSessionManager;
         this.registerSessionEvents();
         if(this.var_16 != null && this._roomEngine != null && this._roomEngine.isInitialized)
         {
            this.var_16.roomEngineReady = true;
         }
      }
      
      private function onSessionDataManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this.var_372 = param2 as ISessionDataManager;
      }
      
      private function onFriendListReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this._friendList = param2 as IHabboFriendList;
      }
      
      private function onAvatarRenderManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this.var_1020 = param2 as IAvatarRenderManager;
      }
      
      private function onInventoryReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this.var_13 = param2 as IHabboInventory;
      }
      
      private function onToolbarReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this._toolbar = param2 as IHabboToolbar;
      }
      
      private function onNavigatorReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this._navigator = param2 as IHabboNavigator;
      }
      
      private function onAvatarEditorReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this.var_1465 = param2 as IHabboAvatarEditor;
      }
      
      private function onCatalogReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this._catalog = param2 as IHabboCatalog;
      }
      
      private function onAdManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this.var_336 = param2 as IAdManager;
         if(this.var_336 != null && this.var_336.events != null)
         {
            this.var_336.events.addEventListener(InterstitialEvent.const_655,this.interstitialCompleteEventHandler);
            this.var_336.events.addEventListener(InterstitialEvent.const_641,this.adEventHandler);
            this.var_336.events.addEventListener(AdEvent.const_568,this.adEventHandler);
         }
      }
      
      private function onLocalizationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this._localization = param2 as IHabboLocalizationManager;
      }
      
      private function onHabboHelpReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this.var_1307 = param2 as IHabboHelp;
      }
      
      private function onHabboModerationReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this.var_1053 = param2 as IHabboModeration;
         Logger.log("XXXX GOT HABBO MODERATION: " + this.var_1053);
      }
      
      private function onConfigurationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this._config = param2 as IHabboConfigurationManager;
      }
      
      private function onSoundManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this._soundManager = param2 as IHabboSoundManager;
      }
      
      private function registerSessionEvents() : void
      {
         if(this.var_16)
         {
            this.var_16.events.addEventListener(RoomSessionEvent.const_257,this.roomSessionStateEventHandler);
            this.var_16.events.addEventListener(RoomSessionEvent.const_73,this.roomSessionStateEventHandler);
            this.var_16.events.addEventListener(RoomSessionEvent.const_83,this.roomSessionStateEventHandler);
            this.var_16.events.addEventListener(RoomSessionChatEvent.const_227,this.roomSessionEventHandler);
            this.var_16.events.addEventListener(RoomSessionChatEvent.const_594,this.roomSessionEventHandler);
            this.var_16.events.addEventListener(RoomSessionUserBadgesEvent.const_151,this.roomSessionEventHandler);
            this.var_16.events.addEventListener(RoomSessionDoorbellEvent.const_136,this.roomSessionEventHandler);
            this.var_16.events.addEventListener(RoomSessionDoorbellEvent.const_146,this.roomSessionEventHandler);
            this.var_16.events.addEventListener(RoomSessionDoorbellEvent.const_59,this.roomSessionEventHandler);
            this.var_16.events.addEventListener(RoomSessionPresentEvent.const_323,this.roomSessionEventHandler);
            this.var_16.events.addEventListener(RoomSessionPetPackageEvent.const_526,this.roomSessionEventHandler);
            this.var_16.events.addEventListener(RoomSessionPetPackageEvent.const_625,this.roomSessionEventHandler);
            this.var_16.events.addEventListener(RoomSessionViralFurniStatusEvent.const_581,this.roomSessionEventHandler);
            this.var_16.events.addEventListener(RoomSessionViralFurniStatusEvent.const_548,this.roomSessionEventHandler);
            this.var_16.events.addEventListener(RoomSessionErrorMessageEvent.const_302,this.roomSessionDialogEventHandler);
            this.var_16.events.addEventListener(RoomSessionErrorMessageEvent.const_272,this.roomSessionDialogEventHandler);
            this.var_16.events.addEventListener(RoomSessionErrorMessageEvent.const_758,this.roomSessionDialogEventHandler);
            this.var_16.events.addEventListener(RoomSessionErrorMessageEvent.const_1284,this.roomSessionDialogEventHandler);
            this.var_16.events.addEventListener(RoomSessionErrorMessageEvent.const_1372,this.roomSessionDialogEventHandler);
            this.var_16.events.addEventListener(RoomSessionErrorMessageEvent.const_273,this.roomSessionDialogEventHandler);
            this.var_16.events.addEventListener(RoomSessionErrorMessageEvent.const_315,this.roomSessionDialogEventHandler);
            this.var_16.events.addEventListener(RoomSessionErrorMessageEvent.const_284,this.roomSessionDialogEventHandler);
            this.var_16.events.addEventListener(RoomSessionErrorMessageEvent.const_270,this.roomSessionDialogEventHandler);
            this.var_16.events.addEventListener(RoomSessionErrorMessageEvent.const_314,this.roomSessionDialogEventHandler);
            this.var_16.events.addEventListener(RoomSessionErrorMessageEvent.const_291,this.roomSessionDialogEventHandler);
            this.var_16.events.addEventListener(RoomSessionErrorMessageEvent.const_269,this.roomSessionDialogEventHandler);
            this.var_16.events.addEventListener(RoomSessionErrorMessageEvent.const_738,this.roomSessionDialogEventHandler);
            this.var_16.events.addEventListener(RoomSessionErrorMessageEvent.const_804,this.roomSessionDialogEventHandler);
            this.var_16.events.addEventListener(RoomSessionErrorMessageEvent.const_224,this.roomSessionDialogEventHandler);
            this.var_16.events.addEventListener(RoomSessionErrorMessageEvent.const_901,this.roomSessionDialogEventHandler);
            this.var_16.events.addEventListener(RoomSessionErrorMessageEvent.const_908,this.roomSessionDialogEventHandler);
            this.var_16.events.addEventListener(RoomSessionQueueEvent.const_514,this.roomSessionEventHandler);
            this.var_16.events.addEventListener(RoomSessionVoteEvent.const_171,this.roomSessionEventHandler);
            this.var_16.events.addEventListener(RoomSessionVoteEvent.const_150,this.roomSessionEventHandler);
            this.var_16.events.addEventListener(RoomSessionPollEvent.const_147,this.roomSessionEventHandler);
            this.var_16.events.addEventListener(RoomSessionPollEvent.const_70,this.roomSessionEventHandler);
            this.var_16.events.addEventListener(RoomSessionPollEvent.const_169,this.roomSessionEventHandler);
            this.var_16.events.addEventListener(RoomSessionDimmerPresetsEvent.const_668,this.roomSessionEventHandler);
            this.var_16.events.addEventListener(RoomSessionFriendRequestEvent.const_162,this.roomSessionEventHandler);
            this.var_16.events.addEventListener(RoomSessionUserNotificationEvent.const_124,this.roomSessionEventHandler);
            this.var_16.events.addEventListener(RoomSessionUserDataUpdateEvent.const_122,this.roomSessionEventHandler);
            this.var_16.events.addEventListener(RoomSessionDanceEvent.const_154,this.roomSessionEventHandler);
         }
      }
      
      private function roomSessionStateEventHandler(param1:RoomSessionEvent) : void
      {
         if(this._roomEngine == null)
         {
            return;
         }
         switch(param1.type)
         {
            case RoomSessionEvent.const_257:
               this.createDesktop(param1.session);
               break;
            case RoomSessionEvent.const_73:
               this._toolbar.setToolbarState(HabboToolbarEnum.const_801);
               break;
            case RoomSessionEvent.const_83:
               if(param1.session != null)
               {
                  this.disposeDesktop(this.getRoomIdentifier(param1.session.roomId,param1.session.roomCategory));
                  this._toolbar.setToolbarState(HabboToolbarEnum.const_775);
               }
         }
      }
      
      private function roomSessionEventHandler(param1:RoomSessionEvent) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(this._roomEngine == null)
         {
            return;
         }
         if(param1.session != null)
         {
            _loc2_ = this.getRoomIdentifier(param1.session.roomId,param1.session.roomCategory);
            _loc3_ = this.getDesktop(_loc2_);
            if(_loc3_ != null)
            {
               _loc3_.processEvent(param1);
            }
         }
      }
      
      private function roomSessionDialogEventHandler(param1:RoomSessionEvent) : void
      {
         var errorMessage:String = null;
         var event:RoomSessionEvent = param1;
         var errorTitle:String = "${error.title}";
         switch(event.type)
         {
            case RoomSessionErrorMessageEvent.const_302:
               errorMessage = "${room.error.cant_trade_stuff}";
               break;
            case RoomSessionErrorMessageEvent.const_272:
               errorMessage = "${room.error.cant_set_item}";
               break;
            case RoomSessionErrorMessageEvent.const_758:
               errorMessage = "${room.error.cant_set_not_owner}";
               break;
            case RoomSessionErrorMessageEvent.const_273:
               errorMessage = "${room.error.max_furniture}";
               break;
            case RoomSessionErrorMessageEvent.const_224:
               errorMessage = "${room.error.max_pets}";
               break;
            case RoomSessionErrorMessageEvent.const_315:
               errorMessage = "${room.error.max_queuetiles}";
               break;
            case RoomSessionErrorMessageEvent.const_284:
               errorMessage = "${room.error.max_soundfurni}";
               break;
            case RoomSessionErrorMessageEvent.const_270:
               errorMessage = "${room.error.max_stickies}";
               break;
            case RoomSessionErrorMessageEvent.const_314:
               errorMessage = "${room.error.kicked}";
               errorTitle = "${generic.alert.title}";
               break;
            case RoomSessionErrorMessageEvent.const_269:
               errorMessage = "${room.error.guide.not.available}";
               break;
            case RoomSessionErrorMessageEvent.const_291:
               errorMessage = "${room.error.guide.already.exists}";
               break;
            case RoomSessionErrorMessageEvent.const_738:
               errorMessage = "${room.error.pets.forbidden_in_hotel}";
               break;
            case RoomSessionErrorMessageEvent.const_804:
               errorMessage = "${room.error.pets.forbidden_in_flat}";
               break;
            case RoomSessionErrorMessageEvent.const_901:
               errorMessage = "${room.error.pets.no_free_tiles}";
               break;
            case RoomSessionErrorMessageEvent.const_908:
               errorMessage = "${room.error.pets.selected_tile_not_free}";
               break;
            default:
               return;
         }
         this._windowManager.alert(errorTitle,errorMessage,0,function(param1:IAlertDialog, param2:WindowEvent):void
         {
            param1.dispose();
         });
      }
      
      private function interstitialCompleteEventHandler(param1:InterstitialEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc2_:String = this.getRoomIdentifier(this._interstitialRoomId,this.var_2739);
         var _loc3_:RoomDesktop = this.getDesktop(_loc2_) as RoomDesktop;
         if(_loc3_ == null)
         {
            return;
         }
         _loc3_.processEvent(param1);
         this.var_1585 = false;
      }
      
      private function adEventHandler(param1:AdEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc2_:String = this.getRoomIdentifier(param1.roomId,param1.roomCategory);
         var _loc3_:RoomDesktop = this.getDesktop(_loc2_) as RoomDesktop;
         if(_loc3_ == null)
         {
            return;
         }
         _loc3_.processEvent(param1);
      }
      
      private function onRoomEngineReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this._roomEngine = param2 as IRoomEngine;
         this.initializeRoomEngineEvents();
         if(this.var_16 != null && this._roomEngine != null && this._roomEngine.isInitialized)
         {
            this.var_16.roomEngineReady = true;
         }
      }
      
      private function onCommunicationReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         var _loc3_:IHabboCommunicationManager = param2 as IHabboCommunicationManager;
         if(_loc3_ != null)
         {
            this._connection = _loc3_.getHabboMainConnection(this.onConnectionReady);
            if(this._connection != null)
            {
               this.onConnectionReady(this._connection);
            }
         }
      }
      
      private function onUserDefinedRoomEventsReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this.var_1308 = param2 as IHabboUserDefinedRoomEvents;
      }
      
      private function onHabboTrackingReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this._habboTracking = param2 as IHabboTracking;
      }
      
      private function onConnectionReady(param1:IConnection) : void
      {
         if(disposed)
         {
            return;
         }
         if(param1 != null)
         {
            this._connection = param1;
         }
      }
      
      private function initializeRoomEngineEvents() : void
      {
         if(this._roomEngine != null && this._roomEngine.events != null)
         {
            this._roomEngine.events.addEventListener(RoomEngineEvent.const_937,this.roomEngineEventHandler);
            this._roomEngine.events.addEventListener(RoomEngineEvent.const_197,this.roomEventHandler);
            this._roomEngine.events.addEventListener(RoomEngineEvent.const_373,this.roomEventHandler);
            this._roomEngine.events.addEventListener(RoomEngineEvent.const_572,this.roomEngineEventHandler);
            this._roomEngine.events.addEventListener(RoomEngineEvent.const_530,this.roomEngineEventHandler);
            this._roomEngine.events.addEventListener(RoomEngineDimmerStateEvent.const_67,this.roomEventHandler);
            this._roomEngine.events.addEventListener(RoomEngineRoomColorEvent.const_838,this.roomEventHandler);
            this._roomEngine.events.addEventListener(RoomEngineObjectEvent.const_852,this.roomObjectEventHandler);
            this._roomEngine.events.addEventListener(RoomEngineObjectEvent.const_661,this.roomObjectEventHandler);
            this._roomEngine.events.addEventListener(RoomEngineObjectEvent.const_188,this.roomObjectEventHandler);
            this._roomEngine.events.addEventListener(RoomEngineObjectEvent.const_395,this.roomObjectEventHandler);
            this._roomEngine.events.addEventListener(RoomEngineObjectEvent.const_156,this.roomObjectEventHandler);
            this._roomEngine.events.addEventListener(RoomEngineObjectEvent.const_759,this.roomObjectEventHandler);
            this._roomEngine.events.addEventListener(RoomEngineObjectEvent.const_195,this.roomObjectEventHandler);
            this._roomEngine.events.addEventListener(RoomEngineObjectEvent.const_182,this.roomObjectEventHandler);
            this._roomEngine.events.addEventListener(RoomEngineObjectEvent.ROOM_OBJECT_WIDGET_REQUEST_CREDITFURNI,this.roomObjectEventHandler);
            this._roomEngine.events.addEventListener(RoomEngineObjectEvent.const_140,this.roomObjectEventHandler);
            this._roomEngine.events.addEventListener(RoomEngineObjectEvent.const_164,this.roomObjectEventHandler);
            this._roomEngine.events.addEventListener(RoomEngineObjectEvent.const_170,this.roomObjectEventHandler);
            this._roomEngine.events.addEventListener(RoomEngineObjectEvent.const_142,this.roomObjectEventHandler);
            this._roomEngine.events.addEventListener(RoomEngineObjectEvent.const_175,this.roomObjectEventHandler);
            this._roomEngine.events.addEventListener(RoomEngineObjectEvent.const_165,this.roomObjectEventHandler);
            this._roomEngine.events.addEventListener(RoomEngineObjectEvent.const_173,this.roomObjectEventHandler);
            this._roomEngine.events.addEventListener(RoomEngineObjectEvent.const_596,this.roomObjectEventHandler);
            this._roomEngine.events.addEventListener(RoomEngineObjectEvent.const_584,this.roomObjectEventHandler);
            this._roomEngine.events.addEventListener(RoomEngineObjectEvent.const_541,this.roomObjectEventHandler);
            this._roomEngine.events.addEventListener(RoomEngineObjectEvent.const_637,this.roomObjectEventHandler);
            this._roomEngine.events.addEventListener(RoomEngineObjectEvent.const_111,this.roomObjectEventHandler);
            this._roomEngine.events.addEventListener(RoomEngineObjectEvent.const_161,this.roomObjectEventHandler);
            this._roomEngine.events.addEventListener(RoomEngineObjectEvent.const_177,this.roomObjectEventHandler);
            this._roomEngine.events.addEventListener(RoomEngineSoundMachineEvent.const_259,this.roomObjectEventHandler);
         }
      }
      
      private function roomEngineEventHandler(param1:RoomEngineEvent) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(param1 == null)
         {
            return;
         }
         if(param1.type == RoomEngineEvent.const_937)
         {
            if(this.var_16 != null)
            {
               this.var_16.roomEngineReady = true;
            }
         }
         else if(param1.type == RoomEngineEvent.const_530 || param1.type == RoomEngineEvent.const_572)
         {
            _loc2_ = this.getRoomIdentifier(param1.roomId,param1.roomCategory);
            _loc3_ = this.getDesktop(_loc2_) as RoomDesktop;
            if(_loc3_ == null)
            {
               return;
            }
            _loc3_.roomEngineEventHandler(param1);
         }
      }
      
      private function roomEventHandler(param1:RoomEngineEvent) : void
      {
         var _loc4_:* = null;
         var _loc5_:Boolean = false;
         var _loc6_:* = null;
         if(param1 == null)
         {
            return;
         }
         if(this._roomEngine == null)
         {
            return;
         }
         var _loc2_:String = this.getRoomIdentifier(param1.roomId,param1.roomCategory);
         var _loc3_:RoomDesktop = this.getDesktop(_loc2_) as RoomDesktop;
         if(_loc3_ == null)
         {
            if(this.var_16 == null)
            {
               return;
            }
            _loc4_ = this.var_16.getSession(param1.roomId,param1.roomCategory);
            if(_loc4_ != null)
            {
               _loc3_ = this.createDesktop(_loc4_) as RoomDesktop;
            }
         }
         if(_loc3_ == null)
         {
            return;
         }
         switch(param1.type)
         {
            case RoomEngineEvent.const_197:
               _loc5_ = false;
               _loc3_.createRoomView(this.getActiveCanvasId(param1.roomId,param1.roomCategory));
               if(this._roomEngine != null)
               {
                  this._roomEngine.setActiveRoom(param1.roomId,param1.roomCategory);
                  if(this._roomEngine.isPublicRoomWorldType(this._roomEngine.getWorldType(param1.roomId,param1.roomCategory)))
                  {
                     _loc5_ = true;
                  }
               }
               _loc3_.disposeWidget(RoomWidgetEnum.const_500);
               _loc3_.createWidget(RoomWidgetEnum.const_409);
               _loc3_.createWidget(RoomWidgetEnum.const_547);
               if(!_loc3_.session.isSpectatorMode)
               {
                  _loc3_.createWidget(RoomWidgetEnum.const_629);
                  _loc3_.createWidget(RoomWidgetEnum.const_350);
                  _loc3_.createWidget(RoomWidgetEnum.const_162);
                  if(this._config.getKey("avatar.widget.enabled","0") == "1")
                  {
                     _loc3_.createWidget(RoomWidgetEnum.const_121);
                  }
               }
               _loc3_.createWidget(RoomWidgetEnum.const_913);
               _loc3_.createWidget(RoomWidgetEnum.const_609);
               _loc3_.createWidget(RoomWidgetEnum.const_502);
               _loc3_.createWidget(RoomWidgetEnum.const_542);
               _loc3_.createWidget(RoomWidgetEnum.const_492);
               _loc3_.createWidget(RoomWidgetEnum.const_647);
               _loc3_.createWidget(RoomWidgetEnum.const_564);
               _loc3_.createWidget(RoomWidgetEnum.const_560);
               _loc3_.createWidget(RoomWidgetEnum.const_136);
               _loc3_.createWidget(RoomWidgetEnum.const_399);
               _loc3_.createWidget(RoomWidgetEnum.const_129);
               _loc3_.createWidget(RoomWidgetEnum.const_653);
               _loc3_.createWidget(RoomWidgetEnum.const_520);
               _loc3_.createWidget(RoomWidgetEnum.const_867);
               _loc3_.createWidget(RoomWidgetEnum.const_124);
               _loc3_.createWidget(RoomWidgetEnum.const_508);
               _loc3_.createWidget(RoomWidgetEnum.const_149);
               if(!_loc5_)
               {
                  _loc3_.createWidget(RoomWidgetEnum.const_646);
               }
               _loc3_.createWidget(RoomWidgetEnum.const_343);
               if(this.var_1586 != RoomDesktop.const_592)
               {
                  _loc3_.initializeWidget(RoomWidgetEnum.const_343,this.var_1586);
               }
               if(this.var_336 != null)
               {
                  this.var_336.showRoomAd(param1.roomId,param1.roomCategory);
               }
               _loc3_.createWidget(RoomWidgetEnum.const_539);
               _loc3_.createWidget(RoomWidgetEnum.const_615);
               break;
            case RoomEngineEvent.const_373:
               this.disposeDesktop(_loc2_);
               break;
            case RoomEngineRoomColorEvent.const_838:
               _loc6_ = param1 as RoomEngineRoomColorEvent;
               if(_loc6_ == null)
               {
                  break;
               }
               if(_loc6_.bgOnly)
               {
                  _loc3_.setRoomViewColor(16777215,255);
               }
               else
               {
                  _loc3_.setRoomViewColor(_loc6_.color,_loc6_.brightness);
               }
               break;
            case RoomEngineDimmerStateEvent.const_67:
               _loc3_.processEvent(param1);
         }
      }
      
      private function roomObjectEventHandler(param1:RoomEngineObjectEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(this._roomEngine == null)
         {
            return;
         }
         var _loc2_:String = this.getRoomIdentifier(param1.roomId,param1.roomCategory);
         var _loc3_:RoomDesktop = this.getDesktop(_loc2_) as RoomDesktop;
         if(_loc3_ == null)
         {
            return;
         }
         _loc3_.roomObjectEventHandler(param1);
      }
      
      public function processWidgetMessage(param1:int, param2:int, param3:RoomWidgetMessage) : void
      {
         if(param3 == null)
         {
            return;
         }
         if(this._roomEngine == null)
         {
            return;
         }
         var _loc4_:String = this.getRoomIdentifier(param1,param2);
         var _loc5_:RoomDesktop = this.getDesktop(_loc4_) as RoomDesktop;
         if(_loc5_ == null)
         {
            return;
         }
         _loc5_.processWidgetMessage(param3);
      }
      
      public function createDesktop(param1:IRoomSession) : IRoomDesktop
      {
         if(param1 == null)
         {
            return null;
         }
         if(this._roomEngine == null)
         {
            return null;
         }
         var _loc2_:String = this.getRoomIdentifier(param1.roomId,param1.roomCategory);
         var _loc3_:RoomDesktop = this.getDesktop(_loc2_) as RoomDesktop;
         if(_loc3_ != null)
         {
            return _loc3_;
         }
         _loc3_ = new RoomDesktop(param1,assets,this._connection);
         _loc3_.roomEngine = this._roomEngine;
         _loc3_.windowManager = this._windowManager;
         _loc3_.roomWidgetFactory = this.var_1259;
         _loc3_.sessionDataManager = this.var_372;
         _loc3_.roomSessionManager = this.var_16;
         _loc3_.friendList = this._friendList;
         _loc3_.avatarRenderManager = this.var_1020;
         _loc3_.inventory = this.var_13;
         _loc3_.toolbar = this._toolbar;
         _loc3_.navigator = this._navigator;
         _loc3_.avatarEditor = this.var_1465;
         _loc3_.catalog = this._catalog;
         _loc3_.adManager = this.var_336;
         _loc3_.localization = this._localization;
         _loc3_.habboHelp = this.var_1307;
         _loc3_.moderation = this.var_1053;
         _loc3_.config = this._config;
         _loc3_.soundManager = this._soundManager;
         _loc3_.habboTracking = this._habboTracking;
         _loc3_.userDefinedRoomEvents = this.var_1308;
         var _loc4_:XmlAsset = assets.getAssetByName("room_desktop_layout_xml") as XmlAsset;
         if(_loc4_ != null)
         {
            _loc3_.layout = _loc4_.content as XML;
         }
         _loc3_.createWidget(RoomWidgetEnum.const_657);
         _loc3_.createWidget(RoomWidgetEnum.const_500);
         _loc3_.init();
         if(_loc3_.showInterstitial())
         {
            this.var_1585 = true;
            this._interstitialRoomId = param1.roomId;
            this.var_2739 = param1.roomCategory;
         }
         else
         {
            this.var_1585 = false;
         }
         this.var_335.add(_loc2_,_loc3_);
         return _loc3_;
      }
      
      public function disposeDesktop(param1:String) : void
      {
         var _loc3_:int = 0;
         var _loc2_:RoomDesktop = this.var_335.remove(param1) as RoomDesktop;
         if(_loc2_ != null)
         {
            _loc3_ = _loc2_.getWidgetState(RoomWidgetEnum.const_343);
            if(_loc3_ != RoomDesktop.const_592)
            {
               this.var_1586 = _loc3_;
            }
            _loc2_.dispose();
            this.var_1585 = false;
         }
      }
      
      public function getDesktop(param1:String) : IRoomDesktop
      {
         return this.var_335.getValue(param1) as RoomDesktop;
      }
      
      public function getActiveCanvasId(param1:int, param2:int) : int
      {
         return 1;
      }
      
      public function update(param1:uint) : void
      {
         var _loc3_:* = null;
         var _loc2_:int = 0;
         while(_loc2_ < this.var_335.length)
         {
            _loc3_ = this.var_335.getWithIndex(_loc2_) as RoomDesktop;
            if(_loc3_ != null)
            {
               _loc3_.update();
            }
            _loc2_++;
         }
      }
      
      private function getRoomIdentifier(param1:int, param2:int) : String
      {
         return "hard_coded_room_id";
      }
   }
}
