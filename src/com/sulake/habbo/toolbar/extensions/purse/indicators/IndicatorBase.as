package com.sulake.habbo.toolbar.extensions.purse.indicators
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.toolbar.extensions.purse.ICurrencyIndicator;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.display.BitmapData;
   import flash.events.IEventDispatcher;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class IndicatorBase implements ICurrencyIndicator
   {
      
      protected static const ANIM_DIRECTION_FORWARD:int = 0;
      
      protected static const ANIM_DIRECTION_BACKWARD:int = 1;
       
      
      private var _view:IWindowContainer;
      
      private var _windowManager:IHabboWindowManager;
      
      private var _assets:IAssetLibrary;
      
      private var _disposed:Boolean = false;
      
      private var var_703:IBitmapWrapperWindow;
      
      private var var_2840:uint;
      
      private var var_2837:uint;
      
      private var var_2839:String;
      
      private var var_2838:String;
      
      private var var_292:Vector.<BitmapData>;
      
      private var var_2836:uint;
      
      private var var_256:int;
      
      private var var_2071:uint = 0;
      
      private var var_704:Timer;
      
      public function IndicatorBase(param1:IHabboWindowManager, param2:IAssetLibrary)
      {
         this.var_292 = new Vector.<BitmapData>();
         super();
         this._view = null;
         this._windowManager = param1;
         this._assets = param2;
         this.var_704 = null;
      }
      
      protected function set bgColorLight(param1:uint) : void
      {
         this.var_2840 = param1;
      }
      
      protected function set bgColorDark(param1:uint) : void
      {
         this.var_2837 = param1;
      }
      
      protected function set textElementName(param1:String) : void
      {
         this.var_2839 = param1;
      }
      
      protected function set textElementShadowName(param1:String) : void
      {
         this.var_2838 = param1;
      }
      
      protected function set iconAnimationDelay(param1:uint) : void
      {
         this.var_2836 = param1;
      }
      
      public function get view() : IWindowContainer
      {
         return this._view;
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         if(this.var_704)
         {
            this.var_704.stop();
            this.var_704 = null;
         }
         if(this.var_292)
         {
            this.var_292 = null;
         }
         if(this._view)
         {
            this._view.dispose();
            this._view = null;
         }
         this._disposed = true;
      }
      
      public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
      }
      
      public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
      }
      
      protected function onContainerClick(param1:WindowMouseEvent) : void
      {
      }
      
      protected function createWindow(param1:String, param2:String) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc3_:XmlAsset = this._assets.getAssetByName(param1) as XmlAsset;
         if(_loc3_)
         {
            this._view = this._windowManager.buildFromXML(_loc3_.content as XML,1) as IWindowContainer;
            this._view.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onContainerClick);
            this._view.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,this.onContainerMouseOver);
            this._view.addEventListener(WindowMouseEvent.const_25,this.onContainerMouseOut);
            _loc4_ = [];
            if(this._view.groupChildrenWithTag("ICON",_loc4_,true) == 1)
            {
               this.var_703 = _loc4_[0] as IBitmapWrapperWindow;
               _loc5_ = this._assets.getAssetByName(param2).content as BitmapData;
               if(_loc5_)
               {
                  this.setIconBitmap(_loc5_);
               }
            }
         }
      }
      
      protected function animateIcon(param1:int) : void
      {
         this.var_2071 = param1;
         if(this.var_703 && this.var_292.length > 0)
         {
            if(this.var_2071 == ANIM_DIRECTION_FORWARD)
            {
               this.var_256 = 0;
            }
            else
            {
               this.var_256 = this.var_292.length - 1;
            }
            this.var_704 = new Timer(this.var_2836,this.var_292.length + 1);
            this.var_704.addEventListener(TimerEvent.TIMER,this.onAnimationTimer);
            this.var_704.addEventListener(TimerEvent.TIMER_COMPLETE,this.onAnimationTimerComplete);
            this.var_704.start();
         }
      }
      
      protected function setText(param1:String) : void
      {
         if(this._view)
         {
            this._view.findChildByName(this.var_2839).caption = param1;
            this._view.findChildByName(this.var_2838).caption = param1;
         }
      }
      
      protected function set iconAnimationSequence(param1:Array) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         for each(_loc2_ in param1)
         {
            _loc3_ = this._assets.getAssetByName(_loc2_);
            if(_loc3_)
            {
               _loc4_ = _loc3_.content as BitmapData;
               if(_loc4_)
               {
                  this.var_292.push(_loc4_.clone());
               }
            }
         }
      }
      
      private function onAnimationTimer(param1:TimerEvent) : void
      {
         Logger.log("Anim frame " + this.var_256);
         if(this.var_703 && this.var_292.length > 0)
         {
            this.setIconBitmap(this.var_292[this.var_256]);
            if(this.var_2071 == ANIM_DIRECTION_FORWARD)
            {
               ++this.var_256;
               this.var_256 = this.var_256 < this.var_292.length ? int(this.var_256) : int(this.var_292.length - 1);
            }
            else
            {
               --this.var_256;
               this.var_256 = this.var_256 >= 0 ? int(this.var_256) : 0;
            }
         }
      }
      
      private function onAnimationTimerComplete(param1:TimerEvent) : void
      {
         Logger.log("Anim complete");
         if(this.var_292.length > 0)
         {
            this.setIconBitmap(this.var_292[0]);
         }
      }
      
      private function setIconBitmap(param1:BitmapData) : void
      {
         if(this.var_703)
         {
            this.var_703.bitmap = param1.clone();
            this.var_703.width = param1.width;
            this.var_703.height = param1.height;
            this.var_703.invalidate();
         }
      }
      
      private function onContainerMouseOver(param1:WindowMouseEvent) : void
      {
         this._view.color = this.var_2837;
      }
      
      private function onContainerMouseOut(param1:WindowMouseEvent) : void
      {
         this._view.color = this.var_2840;
      }
   }
}
