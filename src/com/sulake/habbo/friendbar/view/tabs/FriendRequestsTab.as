package com.sulake.habbo.friendbar.view.tabs
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IBubbleWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.friendbar.data.FriendRequest;
   import flash.display.BitmapData;
   
   public class FriendRequestsTab extends Tab
   {
      
      protected static const const_2050:String = "friend_requests_tab_xml";
      
      protected static const ICON:String = "icon";
      
      protected static const const_1031:String = "label";
      
      protected static const const_466:String = "header";
      
      protected static const const_317:String = "canvas";
      
      protected static const const_463:String = "bubble";
      
      protected static const const_677:String = "request_entity_list";
      
      protected static const const_694:String = "name";
      
      protected static const const_2049:String = "badge_counter";
      
      protected static const const_2048:String = "button_accept_all";
      
      protected static const const_2051:String = "click_area_discard_all";
      
      protected static const const_1411:String = "button_close";
      
      protected static const const_2038:String = "button_accept";
      
      protected static const const_1032:String = "click_area_discard";
      
      protected static const const_1415:String = "text_discard";
      
      private static var var_1466:FriendRequestsTab;
      
      private static const const_75:uint = 4294625561;
      
      private static const const_1055:uint = 4294957414;
      
      private static const const_1572:uint = 4289431312;
      
      private static const const_1573:uint = 4290616362;
      
      private static const REGION_REJECT_COLOR_EXPOSED:uint = 16770666;
      
      private static const const_1488:uint = 16777215;
       
      
      private var _requests:Array;
      
      private var var_1972:Boolean = false;
      
      private var var_1299:IWindowContainer;
      
      public function FriendRequestsTab()
      {
         super();
         _window = this.allocateRequestsTabWindow();
      }
      
      public static function allocate(param1:Array) : FriendRequestsTab
      {
         var _loc2_:FriendRequestsTab = !!var_1466 ? var_1466 : new FriendRequestsTab();
         _loc2_.var_166 = false;
         _loc2_._requests = param1;
         _loc2_._window.findChildByName(const_2049).caption = String(param1.length);
         return _loc2_;
      }
      
      override public function dispose() : void
      {
         if(_window)
         {
            this.releaseRequestsTabWindow(_window);
            _window = null;
         }
         if(this.var_1299)
         {
            this.var_1299.dispose();
            this.var_1299 = null;
         }
         super.dispose();
      }
      
      override public function recycle() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(!disposed)
         {
            if(!var_166)
            {
               if(_window)
               {
                  _loc1_ = _window.findChildByName(const_463) as IBubbleWindow;
                  if(_loc1_)
                  {
                     _loc2_ = _loc1_.content.getChildByName(const_677) as IItemListWindow;
                     if(_loc2_)
                     {
                        while(_loc2_.numListItems > 0)
                        {
                           _loc2_.removeListItemAt(0).dispose();
                        }
                     }
                  }
               }
               this.var_1972 = false;
               this._requests = null;
               var_166 = true;
               var_1466 = this;
            }
         }
      }
      
      override public function select(param1:Boolean) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:* = null;
         if(!selected)
         {
            if(_window)
            {
               _loc2_ = _window.findChildByName(const_463) as IBubbleWindow;
               if(_loc2_)
               {
                  _loc2_.visible = true;
                  if(!this.var_1972)
                  {
                     _loc3_ = _loc2_.content.getChildByName(const_677) as IItemListWindow;
                     if(_loc3_)
                     {
                        _loc7_ = 0;
                        _loc8_ = 0;
                        while(_loc8_ < this._requests.length)
                        {
                           _loc4_ = this.var_1299.clone() as IWindowContainer;
                           _loc4_.color = _loc8_ % 2 == 0 ? uint(const_1572) : uint(const_1573);
                           _loc5_ = this._requests[_loc8_];
                           _loc4_.id = _loc5_.id;
                           _loc4_.getChildByName(const_694).caption = _loc5_.name;
                           _loc6_ = _loc4_.getChildByName(const_317) as IBitmapWrapperWindow;
                           _loc9_ = var_503.getAvatarFaceBitmap(_loc5_.figure);
                           if(_loc9_)
                           {
                              _loc6_.disposesBitmap = false;
                              _loc6_.bitmap = _loc9_;
                              _loc6_.width = _loc9_.width;
                              _loc6_.height = _loc9_.height;
                              _loc6_.disposesBitmap = true;
                           }
                           _loc3_.addListItem(_loc4_);
                           _loc7_ += _loc4_.height + _loc3_.spacing;
                           _loc8_++;
                        }
                        _loc3_.height = _loc7_;
                     }
                  }
                  this.var_1972 = true;
               }
            }
            super.select(param1);
         }
      }
      
      override public function deselect(param1:Boolean) : void
      {
         var _loc2_:* = null;
         if(selected)
         {
            if(_window)
            {
               _loc2_ = _window.findChildByName(const_463);
               if(_loc2_)
               {
                  _loc2_.visible = false;
               }
            }
            super.deselect(param1);
         }
      }
      
      override protected function expose() : void
      {
         super.expose();
         _window.color = !!exposed ? uint(const_1055) : uint(const_75);
         ITextWindow(_window.findChildByTag(const_1031)).underline = exposed;
      }
      
      override protected function conceal() : void
      {
         super.conceal();
         _window.color = !!exposed ? uint(const_1055) : uint(const_75);
         ITextWindow(_window.findChildByTag(const_1031)).underline = exposed;
      }
      
      private function allocateRequestsTabWindow() : IWindowContainer
      {
         var _loc5_:* = null;
         var _loc1_:IWindowContainer = WINDOWING.buildFromXML(ASSETS.getAssetByName(const_2050).content as XML) as IWindowContainer;
         var _loc2_:IBitmapWrapperWindow = IBitmapWrapperWindow(_loc1_.findChildByName(const_317));
         var _loc3_:IRegionWindow = IRegionWindow(_loc1_.findChildByName(const_466));
         var _loc4_:IBubbleWindow = _loc1_.findChildByName(const_463) as IBubbleWindow;
         _loc1_.x = 0;
         _loc1_.y = 0;
         _loc1_.width = name_2;
         _loc1_.height = name_1;
         _loc1_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onMouseClick);
         _loc1_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,onMouseOver);
         _loc1_.addEventListener(WindowMouseEvent.const_25,onMouseOut);
         _loc3_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onMouseClick);
         _loc3_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,onMouseOver);
         _loc3_.addEventListener(WindowMouseEvent.const_25,onMouseOut);
         _loc2_.disposesBitmap = true;
         _loc4_.visible = false;
         _loc4_.y = -(_loc4_.height - (_loc4_.height - _loc4_.margins.bottom)) - 1;
         _loc4_.procedure = this.bubbleEventProc;
         _loc5_ = ASSETS.getAssetByName("add_friends_icon_png") as BitmapDataAsset;
         var _loc6_:IBitmapWrapperWindow = _loc1_.findChildByName(ICON) as IBitmapWrapperWindow;
         _loc6_.disposesBitmap = false;
         _loc6_.bitmap = _loc5_.content as BitmapData;
         var _loc7_:IItemListWindow = _loc4_.content.getChildByName(const_677) as IItemListWindow;
         this.var_1299 = _loc7_.removeListItemAt(0) as IWindowContainer;
         return _loc1_;
      }
      
      private function releaseRequestsTabWindow(param1:IWindowContainer) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(param1 && !param1.disposed)
         {
            param1.procedure = null;
            param1.removeEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onMouseClick);
            param1.removeEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,onMouseOver);
            param1.removeEventListener(WindowMouseEvent.const_25,onMouseOut);
            _loc2_ = IRegionWindow(param1.findChildByName(const_466));
            _loc2_.removeEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onMouseClick);
            _loc2_.removeEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,onMouseOver);
            _loc2_.removeEventListener(WindowMouseEvent.const_25,onMouseOut);
            param1.width = name_2;
            param1.height = name_1;
            param1.color = const_75;
            _loc3_ = IBitmapWrapperWindow(param1.findChildByName(const_317));
            _loc3_.bitmap = null;
            ITextWindow(param1.findChildByTag(const_1031)).underline = false;
         }
      }
      
      private function bubbleEventProc(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            switch(param2.name)
            {
               case const_1411:
                  if(selected)
                  {
                     var_503.deSelect(true);
                  }
                  break;
               case const_2048:
                  var_354.acceptAllFriendRequests();
                  break;
               case const_2051:
                  var_354.declineAllFriendRequests();
                  break;
               case const_2038:
                  var_354.acceptFriendRequest(param2.parent.id);
                  break;
               case const_1032:
                  var_354.declineFriendRequest(param2.parent.id);
            }
         }
         else if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER)
         {
            if(param2.name == const_1032)
            {
               ITextWindow(IWindowContainer(param2).getChildByName(const_1415)).textColor = REGION_REJECT_COLOR_EXPOSED;
            }
         }
         else if(param1.type == WindowMouseEvent.const_25)
         {
            if(param2.name == const_1032)
            {
               ITextWindow(IWindowContainer(param2).getChildByName(const_1415)).textColor = const_1488;
            }
         }
      }
      
      public function avatarImageReady(param1:FriendRequest, param2:BitmapData) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:int = 0;
         var _loc7_:* = null;
         if(disposed)
         {
            return;
         }
         var _loc3_:IBubbleWindow = _window.findChildByName(const_463) as IBubbleWindow;
         if(_loc3_)
         {
            _loc4_ = _loc3_.content.getChildByName(const_677) as IItemListWindow;
            if(_loc4_)
            {
               _loc6_ = 0;
               while(_loc6_ < _loc4_.numListItems)
               {
                  _loc5_ = _loc4_.getListItemAt(_loc6_) as IWindowContainer;
                  if(_loc5_.id == param1.id)
                  {
                     _loc7_ = _loc5_.getChildByName(const_317) as IBitmapWrapperWindow;
                     _loc7_.disposesBitmap = true;
                     _loc7_.bitmap = param2;
                     _loc7_.width = param2.width;
                     _loc7_.height = param2.height;
                     return;
                  }
                  _loc6_++;
               }
            }
         }
      }
   }
}
