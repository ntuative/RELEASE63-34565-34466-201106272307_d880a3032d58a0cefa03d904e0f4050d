package com.sulake.habbo.catalog.club
{
   import com.sulake.core.assets.AssetLoaderStruct;
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.assets.loaders.AssetLoaderEvent;
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.catalog.ClubOfferExtendData;
   import flash.display.BitmapData;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.net.URLRequest;
   import flash.utils.Timer;
   
   public class ClubExtendConfirmationDialog
   {
      
      private static const const_389:int = 7;
      
      private static const const_1592:String = "your_price_icon";
      
      private static const const_1593:String = "http://images.habbo.com/c_images/catalogue/vip_extend_tsr.png";
      
      private static const const_1595:String = "image/png";
      
      private static const const_1596:int = 2000;
      
      private static const const_1594:int = 75;
      
      protected static const const_2052:uint = 0;
      
      protected static const LINK_COLOR_HOVER:uint = 9552639;
       
      
      private var var_27:ClubExtendController;
      
      private var _view:IFrameWindow;
      
      private var var_106:ClubOfferExtendData;
      
      private var var_684:IRegionWindow;
      
      private var var_685:ITextWindow;
      
      private var var_396:IBitmapWrapperWindow;
      
      private var var_686:Vector.<BitmapData>;
      
      private var var_864:Timer;
      
      private var var_475:Timer;
      
      private var var_683:int = 0;
      
      private var var_1591:int = 0;
      
      private var _disposed:Boolean = false;
      
      public function ClubExtendConfirmationDialog(param1:ClubExtendController, param2:ClubOfferExtendData)
      {
         super();
         this.var_27 = param1;
         this.var_106 = param2;
         this.var_686 = new Vector.<BitmapData>(const_389);
      }
      
      public function dispose() : void
      {
         var _loc1_:int = 0;
         if(this._disposed)
         {
            return;
         }
         this.var_106 = null;
         this.var_27 = null;
         this.clearAnimation();
         if(this.var_684)
         {
            this.var_684.removeEventListener(WindowMouseEvent.const_25,this.onMouseOutLaterRegion);
            this.var_684.removeEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,this.onMouseOverLaterRegion);
            this.var_684 = null;
         }
         if(this.var_685)
         {
            this.var_685 = null;
         }
         if(this.var_396)
         {
            this.var_396 = null;
         }
         if(this.var_686)
         {
            while(_loc1_ < const_389)
            {
               this.var_686[_loc1_].dispose();
               this.var_686[_loc1_] = null;
               _loc1_++;
            }
            this.var_686 = null;
         }
         if(this._view)
         {
            this._view.dispose();
            this._view = null;
         }
         this._disposed = true;
      }
      
      public function showConfirmation() : void
      {
         var _loc2_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         if(!this.var_106 || !this.var_27 || this._disposed)
         {
            return;
         }
         this._view = this.createWindow("club_extend_confirmation") as IFrameWindow;
         if(!this._view)
         {
            return;
         }
         this._view.procedure = this.windowEventHandler;
         this._view.center();
         var _loc1_:ICoreLocalizationManager = this.var_27.localization;
         if(this.var_106.subscriptionDaysLeft > 1)
         {
            _loc1_.registerParameter("catalog.club.extend.expiration_days_left","day",this.var_106.subscriptionDaysLeft.toString());
            _loc2_ = _loc1_.getKey("catalog.club.extend.expiration_days_left");
         }
         else
         {
            _loc2_ = _loc1_.getKey("catalog.club.extend.expires_today");
         }
         this._view.findChildByName("offer_expiration").caption = _loc2_;
         this._view.findChildByName("normal_price_price").caption = this.var_106.originalPrice.toString();
         this._view.findChildByName("you_save_price").caption = this.var_106.discountAmount.toString();
         this._view.findChildByName("your_price_price").caption = this.var_106.price.toString();
         this.var_684 = this._view.findChildByName("maybe_later_region") as IRegionWindow;
         this.var_685 = this._view.findChildByName("maybe_later_link") as ITextWindow;
         if(!this.var_684 || !this.var_685)
         {
            return;
         }
         this.var_684.addEventListener(WindowMouseEvent.const_25,this.onMouseOutLaterRegion);
         this.var_684.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,this.onMouseOverLaterRegion);
         var _loc3_:BitmapData = this.getBitmapDataFromAsset("icon_credit_0");
         this.setElementBitmapData("normal_price_icon",_loc3_);
         this.setElementBitmapData("you_save_icon",_loc3_);
         var _loc4_:IBitmapWrapperWindow = this._view.findChildByName("club_teaser") as IBitmapWrapperWindow;
         _loc4_.x = 1;
         _loc4_.y = this._view.height - 144;
         _loc4_.height = 144;
         _loc4_.width = 133;
         this.loadAssetFromUrl("club_teaser","club_teaser",const_1593,const_1595,this.onTeaserLoaded);
         var _loc5_:IItemListWindow = this._view.findChildByName("itemlist_vertical") as IItemListWindow;
         if(!_loc5_)
         {
            return;
         }
         var _loc6_:IWindowContainer = this._view.findChildByName("total_amount_line") as IWindowContainer;
         if(!_loc6_)
         {
            return;
         }
         var _loc7_:IWindowContainer = this._view.findChildByName("background_container") as IWindowContainer;
         if(!_loc7_)
         {
            return;
         }
         _loc7_.height = _loc5_.y + _loc6_.height + _loc6_.y;
         this.var_396 = this._view.findChildByName(const_1592) as IBitmapWrapperWindow;
         if(this.var_396 == null)
         {
            return;
         }
         var _loc8_:int = 0;
         while(_loc8_ < const_389)
         {
            _loc9_ = this.var_27.assets.getAssetByName("icon_credit_" + _loc8_) as BitmapDataAsset;
            _loc10_ = _loc9_.content as BitmapData;
            this.var_686[_loc8_] = _loc10_.clone();
            _loc8_++;
         }
         this.startAnimation();
      }
      
      private function onMouseOutLaterRegion(param1:WindowMouseEvent) : void
      {
         if(this.var_685)
         {
            this.var_685.textColor = const_2052;
         }
      }
      
      private function onMouseOverLaterRegion(param1:WindowMouseEvent) : void
      {
         if(this.var_685)
         {
            this.var_685.textColor = LINK_COLOR_HOVER;
         }
      }
      
      private function startAnimation() : void
      {
         if(this.var_864)
         {
            this.clearAnimation();
         }
         this.setAnimationFrame();
         this.var_864 = new Timer(const_1596);
         this.var_864.addEventListener(TimerEvent.TIMER,this.onAnimationTrigger);
         this.var_864.start();
      }
      
      private function clearAnimation() : void
      {
         this.var_683 = 0;
         this.var_1591 = 0;
         if(this.var_475)
         {
            this.var_475.stop();
            this.var_475 = null;
         }
         if(this.var_864)
         {
            this.var_864.stop();
            this.var_864 = null;
         }
      }
      
      private function setAnimationFrame() : void
      {
         if(!this.var_396)
         {
            return;
         }
         if(this.var_396.bitmap)
         {
            this.var_396.bitmap.dispose();
         }
         if(this.var_683 < const_389)
         {
            this.var_396.bitmap = new BitmapData(this.var_396.width,this.var_396.height,true,0);
            this.var_396.bitmap.copyPixels(this.var_686[this.var_683],this.var_686[this.var_683].rect,new Point(0,0));
         }
         else
         {
            Logger.log("Animation frame " + this.var_683);
         }
      }
      
      private function startAnimationFrame() : void
      {
         this.var_475 = new Timer(const_1594,const_389 - 1);
         this.var_475.addEventListener(TimerEvent.TIMER,this.onAnimationFrame);
         this.var_475.addEventListener(TimerEvent.TIMER_COMPLETE,this.onAnimationFrameComplete);
         this.var_475.start();
      }
      
      private function onAnimationTrigger(param1:TimerEvent) : void
      {
         this.startAnimationFrame();
      }
      
      private function onAnimationFrame(param1:TimerEvent) : void
      {
         this.var_683 += 1;
         this.setAnimationFrame();
      }
      
      private function onAnimationFrameComplete(param1:TimerEvent) : void
      {
         if(this.var_475)
         {
            this.var_475.stop();
            this.var_475 = null;
         }
         this.var_683 = 0;
         this.setAnimationFrame();
         if(this.var_1591 == 0)
         {
            this.var_1591 = 1;
            this.startAnimationFrame();
         }
         else
         {
            this.var_1591 = 0;
         }
      }
      
      private function getBitmapDataFromAsset(param1:String) : BitmapData
      {
         var _loc2_:BitmapDataAsset = this.var_27.assets.getAssetByName(param1) as BitmapDataAsset;
         if(_loc2_ != null)
         {
            return _loc2_.content as BitmapData;
         }
         return null;
      }
      
      private function setElementBitmapData(param1:String, param2:BitmapData) : void
      {
         var _loc3_:IBitmapWrapperWindow = this._view.findChildByName(param1) as IBitmapWrapperWindow;
         if(_loc3_.bitmap != null)
         {
            _loc3_.bitmap.dispose();
         }
         if(param2 != null && _loc3_ != null)
         {
            if(_loc3_.width != param2.width)
            {
               _loc3_.width = param2.width;
            }
            if(_loc3_.height != param2.height)
            {
               _loc3_.height = param2.height;
            }
            _loc3_.bitmap = new BitmapData(_loc3_.width,_loc3_.height,true,0);
            _loc3_.bitmap.copyPixels(param2,param2.rect,new Point(0,0));
         }
      }
      
      private function loadAssetFromUrl(param1:String, param2:String, param3:String, param4:String, param5:Function) : Boolean
      {
         var _loc6_:BitmapData = this.getBitmapDataFromAsset(param2);
         if(_loc6_ != null)
         {
            this.setElementBitmapData(param1,_loc6_);
            return true;
         }
         var _loc7_:URLRequest = new URLRequest(param3);
         var _loc8_:AssetLoaderStruct = this.var_27.assets.loadAssetFromFile(param2,_loc7_,param4);
         if(!_loc8_)
         {
            return false;
         }
         _loc8_.addEventListener(AssetLoaderEvent.ASSET_LOADER_EVENT_COMPLETE,param5);
         return true;
      }
      
      private function onTeaserLoaded(param1:AssetLoaderEvent) : void
      {
         var _loc3_:* = null;
         var _loc2_:AssetLoaderStruct = param1.target as AssetLoaderStruct;
         if(_loc2_ != null)
         {
            _loc3_ = this.getBitmapDataFromAsset(_loc2_.assetName);
            this.setElementBitmapData("club_teaser",_loc3_);
         }
      }
      
      private function windowEventHandler(param1:WindowEvent, param2:IWindow) : void
      {
         if(!param1 || !param2 || !this.var_27 || !this.var_106 || this._disposed)
         {
            return;
         }
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         switch(param2.name)
         {
            case "buy_now_button":
               this.var_27.confirmSelection();
               break;
            case "header_button_close":
            case "maybe_later_region":
               this.var_27.closeConfirmation();
         }
      }
      
      private function createWindow(param1:String) : IWindow
      {
         if(!this.var_27 || !this.var_27.assets || !this.var_27.windowManager || this._disposed)
         {
            return null;
         }
         var _loc2_:XmlAsset = this.var_27.assets.getAssetByName(param1) as XmlAsset;
         if(!_loc2_ || !_loc2_.content)
         {
            return null;
         }
         var _loc3_:XML = _loc2_.content as XML;
         if(!_loc3_)
         {
            return null;
         }
         return this.var_27.windowManager.buildFromXML(_loc3_);
      }
   }
}
