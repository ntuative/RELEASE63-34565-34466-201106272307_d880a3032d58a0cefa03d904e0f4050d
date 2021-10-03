package com.sulake.habbo.toolbar
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.communication.messages.incoming.handshake.AuthenticationOKMessageEvent;
   import com.sulake.habbo.communication.messages.outgoing.tracking.EventLogMessageComposer;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.inventory.IHabboInventory;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.toolbar.extensions.ClubStatusBarExtension;
   import com.sulake.habbo.toolbar.extensions.ExtraToolsExtension;
   import com.sulake.habbo.toolbar.extensions.purse.PurseExtension;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.iid.IIDCoreLocalizationManager;
   import com.sulake.iid.IIDHabboCatalog;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import com.sulake.iid.IIDHabboInventory;
   import flash.display.BitmapData;
   import flash.geom.Rectangle;
   import iid.IIDHabboWindowManager;
   
   public class HabboToolbar extends Component implements IHabboToolbar
   {
       
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_289:IHabboCommunicationManager;
      
      private var _config:IHabboConfigurationManager;
      
      private var _view:ToolbarView;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var _isInitialized:Boolean;
      
      private var var_842:ExtraToolsExtension;
      
      private var _connection:IConnection;
      
      private var _catalog:IHabboCatalog;
      
      private var var_1530:PurseExtension;
      
      private var var_1531:ClubStatusBarExtension;
      
      private var _localization:ICoreLocalizationManager;
      
      private var var_13:IHabboInventory;
      
      public function HabboToolbar(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         super(param1,param2,param3);
         lock();
         this._assetLibrary = param3;
         queueInterface(new IIDHabboCommunicationManager(),this.onCommunicationManagerReady);
         queueInterface(new IIDHabboConfigurationManager(),this.onConfigurationManagerReady);
         queueInterface(new IIDHabboWindowManager(),this.onWindowManagerReady);
         queueInterface(new IIDHabboCatalog(),this.onCatalogReady);
         queueInterface(new IIDCoreLocalizationManager(),this.onLocalizationManagerReady);
         queueInterface(new IIDHabboInventory(),this.onInventoryReady);
      }
      
      override public function dispose() : void
      {
         this._isInitialized = false;
         this._connection = null;
         if(this.var_1531)
         {
            this.var_1531.dispose();
            this.var_1531 = null;
         }
         if(this.var_1530)
         {
            this.var_1530.dispose();
            this.var_1530 = null;
         }
         if(this.var_842)
         {
            this.var_842.dispose();
            this.var_842 = null;
         }
         if(this.var_289)
         {
            this.var_289.release(new IIDHabboCommunicationManager());
            this.var_289 = null;
         }
         if(this._windowManager)
         {
            this._windowManager.release(new IIDHabboWindowManager());
            this._windowManager = null;
         }
         if(this._config)
         {
            this._config.release(new IIDHabboConfigurationManager());
            this._config = null;
         }
         if(this._catalog != null)
         {
            this._catalog.release(new IIDHabboCatalog());
            this._catalog = null;
         }
         if(this._view != null)
         {
            this._view.dispose();
            this._view = null;
         }
         super.dispose();
      }
      
      private function onCommunicationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this.var_289 = IHabboCommunicationManager(param2);
         this._connection = this.var_289.getHabboMainConnection(null);
         this.tryInitialize();
      }
      
      private function onWindowManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this._windowManager = IHabboWindowManager(param2);
         this.tryInitialize();
      }
      
      private function onConfigurationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this._config = IHabboConfigurationManager(param2);
         this.tryInitialize();
      }
      
      private function onLocalizationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this._localization = ICoreLocalizationManager(param2);
         this.tryInitialize();
      }
      
      private function onInventoryReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this.var_13 = IHabboInventory(param2);
         this.tryInitialize();
      }
      
      private function onCatalogReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this._catalog = param2 as IHabboCatalog;
         this.tryInitialize();
      }
      
      private function tryInitialize() : void
      {
         if(this.var_289 && this._windowManager && this._config && this._localization && this.var_13 && this._catalog)
         {
            this.var_289.addHabboConnectionMessageEvent(new AuthenticationOKMessageEvent(this.onAuthenticationOK));
            unlock();
         }
      }
      
      private function onAuthenticationOK(param1:IMessageEvent) : void
      {
         this._view = new ToolbarView(this,this._windowManager,this._assetLibrary,this._connection,this._catalog,events,this._config);
         if(this._config && this._config.getKey("client.logout.enabled","false") == "true")
         {
            this.var_842 = new ExtraToolsExtension(this,this._windowManager,this._assetLibrary,events,this._config);
            if(this._config.getBoolean("club.membership.extend.promotion.enabled",false))
            {
               this.var_1531 = new ClubStatusBarExtension(this._windowManager,assets,events,this._config,this._localization,this.var_13,this._catalog,this._connection);
            }
            this.var_1530 = new PurseExtension(this._windowManager,this._assetLibrary,events,this._config,this._catalog);
         }
         if(this._view == null)
         {
            Logger.log("Error, toolbar view was not available");
            return;
         }
         this._isInitialized = true;
      }
      
      public function toggleWindowVisibility(param1:String) : void
      {
         var _loc2_:String = "null";
         var _loc3_:HabboToolbarEvent = new HabboToolbarEvent(HabboToolbarEvent.const_49);
         _loc3_.iconId = _loc2_;
         _loc3_.iconName = param1;
         events.dispatchEvent(_loc3_);
         var _loc4_:EventLogMessageComposer = new EventLogMessageComposer("Toolbar",param1,"client.toolbar.clicked");
         if(this._connection)
         {
            this._connection.send(_loc4_);
         }
      }
      
      public function getIconVerticalLocation(param1:String) : int
      {
         return this._view.getIconVerticalLocation(param1);
      }
      
      public function setUnseenItemCount(param1:String, param2:int) : void
      {
         this._view.setUnseenItemCount(param1,param2);
      }
      
      public function setToolbarState(param1:String) : void
      {
         switch(param1)
         {
            case HabboToolbarEnum.const_775:
               this.toolbarExtensionVisible(false);
               break;
            case HabboToolbarEnum.const_801:
               this.toolbarExtensionVisible(true);
         }
         if(this._view)
         {
            this._view.setToolbarState(param1);
         }
      }
      
      private function toolbarExtensionVisible(param1:Boolean) : void
      {
         if(!this.var_842)
         {
            return;
         }
         if(param1)
         {
            this.var_842.showRoomInfo();
         }
         else
         {
            this.var_842.hideRoomInfo();
         }
      }
      
      public function setIconBitmap(param1:String, param2:BitmapData) : void
      {
         if(this._view)
         {
            this._view.setIconBitmap(param1,param2);
         }
      }
      
      public function getRect() : Rectangle
      {
         if(this._view)
         {
            return this._view.window.rectangle.clone();
         }
         return new Rectangle();
      }
   }
}
