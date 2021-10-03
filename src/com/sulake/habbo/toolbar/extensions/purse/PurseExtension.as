package com.sulake.habbo.toolbar.extensions.purse
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.toolbar.extensions.purse.indicators.CreditsIndicator;
   import com.sulake.habbo.toolbar.extensions.purse.indicators.PixelsIndicator;
   import com.sulake.habbo.toolbar.extensions.purse.indicators.ShellsIndicator;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.events.IEventDispatcher;
   
   public class PurseExtension
   {
      
      private static const const_1095:int = 3;
       
      
      private var _windowManager:IHabboWindowManager;
      
      private var _events:IEventDispatcher;
      
      private var var_150:IHabboConfigurationManager;
      
      private var _catalog:IHabboCatalog;
      
      private var _view:IWindowContainer;
      
      private var var_1273:Vector.<ICurrencyIndicator>;
      
      private var _disposed:Boolean = false;
      
      public function PurseExtension(param1:IHabboWindowManager, param2:IAssetLibrary, param3:IEventDispatcher, param4:IHabboConfigurationManager, param5:IHabboCatalog)
      {
         var _loc7_:* = null;
         this.var_1273 = new Vector.<ICurrencyIndicator>();
         super();
         this._windowManager = param1;
         this._events = param3;
         this.var_150 = param4;
         this._catalog = param5;
         var _loc6_:XmlAsset = param2.getAssetByName("purse_xml") as XmlAsset;
         if(_loc6_)
         {
            this._view = param1.buildFromXML(_loc6_.content as XML,1) as IWindowContainer;
            _loc7_ = this._view.findChildByName("indicator_itemlist") as IItemListWindow;
            if(_loc7_)
            {
               this.addIndicator(_loc7_,new CreditsIndicator(param1,param2,this._catalog) as ICurrencyIndicator,this._catalog.events);
               if(this.var_150.getKey("purse.widget.currency.shells.enabled","0") == "1")
               {
                  this.addIndicator(_loc7_,new ShellsIndicator(param1,param2,this._catalog) as ICurrencyIndicator,this._catalog.events);
               }
               this.addIndicator(_loc7_,new PixelsIndicator(param1,param2,this._catalog) as ICurrencyIndicator,this._catalog.events);
            }
            this.rePosition();
         }
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         if(!this._disposed)
         {
            if(this.var_1273)
            {
               for each(_loc1_ in this.var_1273)
               {
                  _loc1_.unregisterUpdateEvents(this._catalog.events);
                  _loc1_.dispose();
               }
               this.var_1273 = null;
            }
            if(this._catalog)
            {
               this._catalog = null;
            }
            this._disposed = true;
         }
      }
      
      private function addIndicator(param1:IItemListWindow, param2:ICurrencyIndicator, param3:IEventDispatcher) : void
      {
         param1.addListItem(param2.view);
         param2.registerUpdateEvents(param3);
         this.var_1273.push(param2);
      }
      
      private function rePosition() : void
      {
         var _loc1_:IWindowContainer = this._view.desktop;
         this._view.x = _loc1_.width - this._view.width - const_1095;
         this._view.y = const_1095;
      }
   }
}
