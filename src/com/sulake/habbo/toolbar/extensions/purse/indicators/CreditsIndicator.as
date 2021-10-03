package com.sulake.habbo.toolbar.extensions.purse.indicators
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.catalog.purse.PurseEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.events.IEventDispatcher;
   
   public class CreditsIndicator extends IndicatorBase
   {
      
      private static const const_1543:uint = 4291993382;
      
      private static const const_1542:uint = 4290807040;
      
      private static const const_476:Array = ["icon_credit_0_png","icon_credit_1_png","icon_credit_2_png","icon_credit_3_png","icon_credit_4_png","icon_credit_5_png","icon_credit_6_png"];
       
      
      private var var_1871:int = -1;
      
      private var _catalog:IHabboCatalog;
      
      public function CreditsIndicator(param1:IHabboWindowManager, param2:IAssetLibrary, param3:IHabboCatalog)
      {
         super(param1,param2);
         this._catalog = param3;
         this.bgColorLight = const_1543;
         this.bgColorDark = const_1542;
         this.textElementName = "credits";
         this.textElementShadowName = "credits_shadow";
         this.iconAnimationSequence = const_476;
         this.iconAnimationDelay = 50;
         createWindow("purse_indicator_credits_xml",const_476[0]);
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(!param1)
         {
            return;
         }
         param1.addEventListener(PurseEvent.const_116,this.onCreditBalance);
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener(PurseEvent.const_116,this.onCreditBalance);
      }
      
      override protected function onContainerClick(param1:WindowMouseEvent) : void
      {
         this._catalog.openCreditsHabblet();
      }
      
      private function onCreditBalance(param1:PurseEvent) : void
      {
         var _loc2_:String = param1.balance.toString();
         if(_loc2_.length < 2)
         {
            _loc2_ = "  " + _loc2_;
         }
         this.setText(_loc2_);
         if(this.var_1871 != -1)
         {
            if(this.var_1871 > param1.balance)
            {
               animateIcon(IndicatorBase.ANIM_DIRECTION_FORWARD);
            }
            else
            {
               animateIcon(IndicatorBase.ANIM_DIRECTION_BACKWARD);
            }
         }
         this.var_1871 = param1.balance;
      }
   }
}
