package com.sulake.habbo.toolbar.extensions.purse.indicators
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.catalog.enum.CatalogPageName;
   import com.sulake.habbo.catalog.purse.PurseEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.events.IEventDispatcher;
   
   public class ShellsIndicator extends IndicatorBase
   {
      
      private static const const_476:Array = ["icon_shell_0_png","icon_shell_1_png","icon_shell_2_png","icon_shell_3_png"];
       
      
      private const const_1543:uint = 4.283212437E9;
      
      private const const_1542:uint = 4.282748017E9;
      
      private var var_1956:int = -1;
      
      private var _catalog:IHabboCatalog;
      
      public function ShellsIndicator(param1:IHabboWindowManager, param2:IAssetLibrary, param3:IHabboCatalog)
      {
         super(param1,param2);
         this._catalog = param3;
         this.bgColorLight = this.const_1543;
         this.bgColorDark = this.const_1542;
         this.textElementName = "amount";
         this.textElementShadowName = "amount_shadow";
         this.iconAnimationSequence = const_476.concat(const_476).concat(const_476);
         this.iconAnimationDelay = 50;
         createWindow("purse_indicator_shells_xml",const_476[0]);
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(!param1)
         {
            return;
         }
         param1.addEventListener(PurseEvent.const_263,this.onShellBalance);
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener(PurseEvent.const_263,this.onShellBalance);
      }
      
      override protected function onContainerClick(param1:WindowMouseEvent) : void
      {
         this._catalog.openCatalogPage(CatalogPageName.const_1814,true);
      }
      
      private function onShellBalance(param1:PurseEvent) : void
      {
         var _loc2_:String = param1.balance.toString();
         if(_loc2_.length < 2)
         {
            _loc2_ = "  " + _loc2_;
         }
         setText(_loc2_);
         if(this.var_1956 != -1)
         {
            if(this.var_1956 > param1.balance)
            {
               animateIcon(IndicatorBase.ANIM_DIRECTION_FORWARD);
            }
            else
            {
               animateIcon(IndicatorBase.ANIM_DIRECTION_BACKWARD);
            }
         }
         this.var_1956 = param1.balance;
      }
   }
}
