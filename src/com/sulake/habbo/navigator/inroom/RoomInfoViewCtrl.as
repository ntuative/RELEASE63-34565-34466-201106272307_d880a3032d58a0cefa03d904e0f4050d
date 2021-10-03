package com.sulake.habbo.navigator.inroom
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.IContainerButtonWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.outgoing.navigator.AddFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.CanCreateEventMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.DeleteFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.RateFlatMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.ToggleStaffPickMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.UpdateNavigatorSettingsMessageComposer;
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.SimpleAlertView;
   import com.sulake.habbo.navigator.TagRenderer;
   import com.sulake.habbo.navigator.Util;
   import com.sulake.habbo.navigator.events.HabboNavigatorEvent;
   import com.sulake.habbo.navigator.events.HabboRoomSettingsTrackingEvent;
   import com.sulake.habbo.navigator.roomsettings.IRoomSettingsCtrlOwner;
   import com.sulake.habbo.navigator.roomsettings.RoomSettingsCtrl;
   import com.sulake.habbo.navigator.roomthumbnails.RoomThumbnailCtrl;
   import com.sulake.habbo.utils.HabboWebTools;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class RoomInfoViewCtrl implements IRoomSettingsCtrlOwner
   {
       
      
      private var _navigator:HabboNavigator;
      
      private var _window:IWindowContainer;
      
      private var var_197:IWindowContainer;
      
      private var var_3087:int;
      
      private var var_406:RoomEventViewCtrl;
      
      private var var_405:Timer;
      
      private var var_160:RoomSettingsCtrl;
      
      private var var_291:RoomThumbnailCtrl;
      
      private var var_1082:TagRenderer;
      
      private var var_404:IWindowContainer;
      
      private var var_407:IWindowContainer;
      
      private var var_698:IWindowContainer;
      
      private var var_2034:IWindowContainer;
      
      private var var_2033:IWindowContainer;
      
      private var var_1324:IWindowContainer;
      
      private var var_1083:ITextWindow;
      
      private var var_1079:ITextWindow;
      
      private var _ownerName:ITextWindow;
      
      private var var_878:ITextWindow;
      
      private var var_1323:ITextWindow;
      
      private var var_1081:ITextWindow;
      
      private var var_879:ITextWindow;
      
      private var var_1615:ITextWindow;
      
      private var var_290:IWindowContainer;
      
      private var var_876:IWindowContainer;
      
      private var var_1613:IWindowContainer;
      
      private var var_2032:ITextWindow;
      
      private var var_699:ITextWindow;
      
      private var var_2035:IWindow;
      
      private var var_1319:IContainerButtonWindow;
      
      private var var_1321:IContainerButtonWindow;
      
      private var var_1325:IContainerButtonWindow;
      
      private var _remFavouriteButton:IContainerButtonWindow;
      
      private var var_1320:IContainerButtonWindow;
      
      private var var_1610:IButtonWindow;
      
      private var var_1614:IButtonWindow;
      
      private var var_1612:IButtonWindow;
      
      private var var_877:IWindowContainer;
      
      private var var_1322:ITextWindow;
      
      private var var_1080:ITextFieldWindow;
      
      private var _buttons:IWindowContainer;
      
      private var var_875:IButtonWindow;
      
      private var var_1611:Boolean = false;
      
      private const const_1014:int = 75;
      
      private const const_813:int = 3;
      
      private const const_972:int = 45;
      
      public function RoomInfoViewCtrl(param1:HabboNavigator)
      {
         super();
         this._navigator = param1;
         this.var_406 = new RoomEventViewCtrl(this._navigator);
         this.var_160 = new RoomSettingsCtrl(this._navigator,this,true);
         this.var_291 = new RoomThumbnailCtrl(this._navigator);
         this.var_1082 = new TagRenderer(this._navigator);
         this._navigator.roomSettingsCtrls.push(this.var_160);
         this.var_405 = new Timer(6000,1);
         this.var_405.addEventListener(TimerEvent.TIMER,this.hideInfo);
      }
      
      public function dispose() : void
      {
         if(this.var_405)
         {
            this.var_405.removeEventListener(TimerEvent.TIMER,this.hideInfo);
            this.var_405.reset();
            this.var_405 = null;
         }
         this._navigator = null;
         this.var_406 = null;
         this.var_160 = null;
         this.var_291 = null;
         if(this.var_1082)
         {
            this.var_1082.dispose();
            this.var_1082 = null;
         }
         this.var_197 = null;
         this.var_404 = null;
         this.var_407 = null;
         this.var_698 = null;
         this.var_2034 = null;
         this.var_2033 = null;
         this.var_1324 = null;
         this.var_1083 = null;
         this.var_1079 = null;
         this._ownerName = null;
         this.var_878 = null;
         this.var_1323 = null;
         this.var_1081 = null;
         this.var_879 = null;
         this.var_1615 = null;
         this.var_290 = null;
         this.var_876 = null;
         this.var_1613 = null;
         this.var_2032 = null;
         this.var_699 = null;
         this.var_2035 = null;
         this.var_1319 = null;
         this.var_1321 = null;
         this.var_1325 = null;
         this._remFavouriteButton = null;
         this.var_1320 = null;
         this.var_1610 = null;
         this.var_1614 = null;
         this.var_1612 = null;
         this.var_877 = null;
         this.var_1322 = null;
         this.var_1080 = null;
         this._buttons = null;
         this.var_875 = null;
         if(this._window)
         {
            this._window.dispose();
            this._window = null;
         }
      }
      
      public function roomSettingsRefreshNeeded() : void
      {
         this.refresh();
      }
      
      public function startEventEdit() : void
      {
         this.var_405.reset();
         this.var_406.active = true;
         this.var_160.active = false;
         this.var_291.active = false;
         this.reload();
      }
      
      public function startRoomSettingsEdit(param1:int) : void
      {
         this.var_405.reset();
         this.var_160.load(param1);
         this.var_160.active = true;
         this.var_406.active = false;
         this.var_291.active = false;
         this._navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      public function backToRoomSettings() : void
      {
         this.var_160.active = true;
         this.var_406.active = false;
         this.var_291.active = false;
         this.reload();
         this._navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      public function startThumbnailEdit() : void
      {
         this.var_405.reset();
         this.var_160.active = false;
         this.var_406.active = false;
         this.var_291.active = true;
         this.reload();
         this._navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_THUMBS));
      }
      
      public function close() : void
      {
         if(this._window == null)
         {
            return;
         }
         this._window.visible = false;
         this.var_1611 = false;
         this._navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_CLOSED));
      }
      
      public function reload() : void
      {
         if(this._window != null && this._window.visible)
         {
            this.refresh();
         }
      }
      
      public function toggle() : void
      {
         this.var_405.reset();
         this.var_406.active = false;
         this.var_160.active = false;
         this.var_291.active = false;
         this.refresh();
         this._window.visible = !this._window.visible;
         this._window.x = this._window.desktop.width - this._window.width - this.const_813;
         this._window.y = this.const_1014;
         if(this._navigator.configuration.getBoolean("club.membership.extend.promotion.enabled",false))
         {
            this._window.y = 91;
         }
         if(this._window.visible)
         {
            this._window.activate();
         }
      }
      
      private function refresh() : void
      {
         this.prepareWindow();
         this.refreshRoom();
         this.refreshEvent();
         this.refreshEmbed();
         this.refreshButtons();
         Util.moveChildrenToColumn(this.var_197,["room_info","event_info","embed_info","buttons_container"],0,2);
         this.var_197.height = Util.method_1(this.var_197);
         var _loc1_:int = this._window.desktop.height - this._window.height - this.const_972;
         if(this._window.y > _loc1_)
         {
            this._window.y = _loc1_ < 0 ? 0 : int(_loc1_);
         }
      }
      
      private function refreshRoom() : void
      {
         Util.hideChildren(this.var_404);
         var _loc1_:GuestRoomData = this._navigator.data.enteredGuestRoom;
         var _loc2_:Boolean = _loc1_ != null && _loc1_.flatId == this._navigator.data.homeRoomId;
         this.refreshRoomDetails(_loc1_,_loc2_);
         this.refreshPublicSpaceDetails(this._navigator.data.enteredPublicSpace);
         this.refreshRoomButtons(_loc2_);
         this.var_160.refresh(this.var_404);
         this.var_291.refresh(this.var_404);
         Util.moveChildrenToColumn(this.var_404,["room_details","room_buttons"],0,2);
         this.var_404.height = Util.method_1(this.var_404);
         this.var_404.visible = true;
         Logger.log("XORP: " + this.var_407.visible + ", " + this.var_1324.visible + ", " + this.var_698.visible + ", " + this.var_698.rectangle + ", " + this.var_404.rectangle);
      }
      
      private function refreshEvent() : void
      {
         Util.hideChildren(this.var_290);
         var _loc1_:RoomEventData = this._navigator.data.roomEventData;
         this.refreshEventDetails(_loc1_);
         this.refreshEventButtons(_loc1_);
         this.var_406.refresh(this.var_290);
         if(Util.hasVisibleChildren(this.var_290) && !(this.var_160.active || this.var_291.active))
         {
            Util.moveChildrenToColumn(this.var_290,["event_details","event_buttons"],0,2);
            this.var_290.height = Util.method_1(this.var_290);
            this.var_290.visible = true;
         }
         else
         {
            this.var_290.visible = false;
         }
         Logger.log("EVENT: " + this.var_290.visible + ", " + this.var_290.rectangle);
      }
      
      private function refreshEmbed() : void
      {
         var _loc1_:* = this._navigator.configuration.getKey("embed.showInRoomInfo","false") == "true";
         var _loc2_:* = this._navigator.data.enteredGuestRoom != null;
         if(_loc2_ && _loc1_ && !this.var_160.active && !this.var_291.active && !this.var_406.active)
         {
            this.var_877.visible = true;
            this.var_1080.text = this.getEmbedData();
         }
         else
         {
            this.var_877.visible = false;
         }
      }
      
      private function refreshButtons() : void
      {
         var _loc1_:* = false;
         if(!this._buttons)
         {
            return;
         }
         if(this.var_160.active)
         {
            this._buttons.visible = false;
            return;
         }
         this._buttons.visible = true;
         if(this.var_875)
         {
            _loc1_ = this._navigator.data.enteredGuestRoom != null;
            this.var_875.visible = _loc1_;
            if(this.var_1611)
            {
               this.var_875.caption = "${navigator.zoom.in}";
            }
            else
            {
               this.var_875.caption = "${navigator.zoom.out}";
            }
         }
      }
      
      private function refreshRoomDetails(param1:GuestRoomData, param2:Boolean) : void
      {
         if(param1 == null || this.var_160.active || this.var_291.active)
         {
            return;
         }
         this.var_1083.text = param1.roomName;
         this.var_1083.height = this.var_1083.textHeight + 5;
         this._ownerName.text = param1.ownerName;
         this.var_878.text = param1.description;
         this.var_1082.refreshTags(this.var_407,param1.tags);
         this.var_878.visible = false;
         if(param1.description != "")
         {
            this.var_878.height = this.var_878.textHeight + 5;
            this.var_878.visible = true;
         }
         var _loc3_:Boolean = Boolean(this._navigator.configuration.getKey("client.allow.facebook.like") == "1");
         this._navigator.refreshButton(this.var_1321,"facebook_logo_small",_loc3_,null,0);
         this.var_1321.visible = _loc3_;
         var _loc4_:* = this._navigator.data.currentRoomRating == -1;
         this._navigator.refreshButton(this.var_1319,"thumb_up",_loc4_,null,0);
         this.var_1319.visible = _loc4_;
         this.var_879.visible = !_loc4_;
         this.var_1615.visible = !_loc4_;
         this.var_1615.text = "" + this._navigator.data.currentRoomRating;
         this.refreshStuffPick();
         this._navigator.refreshButton(this.var_407,"home",param2,null,0);
         this._navigator.refreshButton(this.var_407,"favourite",!param2 && this._navigator.data.isCurrentRoomFavourite(),null,0);
         Util.moveChildrenToColumn(this.var_407,["room_name","owner_name_cont","tags","room_desc","rating_cont","staff_pick_button"],this.var_1083.y,0);
         this.var_407.visible = true;
         this.var_407.height = Util.method_1(this.var_407);
      }
      
      private function refreshStuffPick() : void
      {
         var _loc1_:IWindow = this.var_407.findChildByName("staff_pick_button");
         if(!this._navigator.data.roomPicker)
         {
            _loc1_.visible = false;
            return;
         }
         _loc1_.visible = true;
         _loc1_.caption = this._navigator.getText(!!this._navigator.data.currentRoomIsStaffPick ? "navigator.staffpicks.unpick" : "navigator.staffpicks.pick");
      }
      
      private function refreshPublicSpaceDetails(param1:PublicRoomShortData) : void
      {
         if(param1 == null || this.var_160.active || this.var_291.active)
         {
            return;
         }
         this.var_1079.text = this._navigator.getPublicSpaceName(param1.unitPropertySet,param1.worldId);
         this.var_1079.height = this.var_1079.textHeight + 5;
         this.var_1323.text = this._navigator.getPublicSpaceDesc(param1.unitPropertySet,param1.worldId);
         this.var_1323.height = this.var_1323.textHeight + 5;
         Util.moveChildrenToColumn(this.var_698,["public_space_name","public_space_desc"],this.var_1079.y,0);
         this.var_698.visible = true;
         this.var_698.height = Math.max(86,Util.method_1(this.var_698));
      }
      
      private function refreshEventDetails(param1:RoomEventData) : void
      {
         if(param1 == null || this.var_406.active)
         {
            return;
         }
         this.var_2032.text = param1.eventName;
         this.var_699.text = param1.eventDescription;
         this.var_1082.refreshTags(this.var_876,[this._navigator.getText("roomevent_type_" + param1.eventType),param1.tags[0],param1.tags[1]]);
         this.var_699.visible = false;
         if(param1.eventDescription != "")
         {
            this.var_699.height = this.var_699.textHeight + 5;
            this.var_699.y = Util.method_1(this.var_876) + 2;
            this.var_699.visible = true;
         }
         this.var_876.visible = true;
         this.var_876.height = Util.method_1(this.var_876);
      }
      
      private function refreshRoomButtons(param1:Boolean) : void
      {
         if(this._navigator.data.enteredGuestRoom == null || this.var_160.active || this.var_291.active)
         {
            return;
         }
         this.var_1610.visible = this._navigator.data.canEditRoomSettings;
         var _loc2_:Boolean = this._navigator.data.isCurrentRoomFavourite();
         this.var_1325.visible = this._navigator.data.canAddFavourite && !_loc2_;
         this._remFavouriteButton.visible = this._navigator.data.canAddFavourite && _loc2_;
         this.var_1320.visible = this._navigator.data.canEditRoomSettings && !param1;
         this.var_1324.visible = Util.hasVisibleChildren(this.var_1324);
      }
      
      private function refreshEventButtons(param1:RoomEventData) : void
      {
         if(this.var_406.active)
         {
            return;
         }
         this.var_1614.visible = param1 == null && this._navigator.data.currentRoomOwner;
         this.var_1612.visible = param1 != null && (this._navigator.data.currentRoomOwner || this._navigator.data.eventMod);
         this.var_1613.visible = Util.hasVisibleChildren(this.var_1613);
      }
      
      private function prepareWindow() : void
      {
         if(this._window != null)
         {
            return;
         }
         this._window = IWindowContainer(this._navigator.getXmlWindow("iro_room_details_framed"));
         this.var_197 = this._window.findChildByName("content") as IWindowContainer;
         this._window.visible = false;
         this.var_404 = IWindowContainer(this.find("room_info"));
         this.var_407 = IWindowContainer(this.find("room_details"));
         this.var_698 = IWindowContainer(this.find("public_space_details"));
         this.var_2034 = IWindowContainer(this.find("owner_name_cont"));
         this.var_2033 = IWindowContainer(this.find("rating_cont"));
         this.var_1324 = IWindowContainer(this.find("room_buttons"));
         this.var_1083 = ITextWindow(this.find("room_name"));
         this.var_1079 = ITextWindow(this.find("public_space_name"));
         this._ownerName = ITextWindow(this.find("owner_name"));
         this.var_878 = ITextWindow(this.find("room_desc"));
         this.var_1323 = ITextWindow(this.find("public_space_desc"));
         this.var_1081 = ITextWindow(this.find("owner_caption"));
         this.var_879 = ITextWindow(this.find("rating_caption"));
         this.var_1615 = ITextWindow(this.find("rating_txt"));
         this.var_290 = IWindowContainer(this.find("event_info"));
         this.var_876 = IWindowContainer(this.find("event_details"));
         this.var_1613 = IWindowContainer(this.find("event_buttons"));
         this.var_2032 = ITextWindow(this.find("event_name"));
         this.var_699 = ITextWindow(this.find("event_desc"));
         this.var_1321 = IContainerButtonWindow(this.find("facebook_like_button"));
         this.var_1319 = IContainerButtonWindow(this.find("rate_up_button"));
         this.var_2035 = this.find("staff_pick_button");
         this.var_1325 = IContainerButtonWindow(this.find("add_favourite_button"));
         this._remFavouriteButton = IContainerButtonWindow(this.find("rem_favourite_button"));
         this.var_1320 = IContainerButtonWindow(this.find("make_home_button"));
         this.var_1610 = IButtonWindow(this.find("room_settings_button"));
         this.var_1614 = IButtonWindow(this.find("create_event_button"));
         this.var_1612 = IButtonWindow(this.find("edit_event_button"));
         this.var_877 = IWindowContainer(this.find("embed_info"));
         this.var_1322 = ITextWindow(this.find("embed_info_txt"));
         this.var_1080 = ITextFieldWindow(this.find("embed_src_txt"));
         this._buttons = IWindowContainer(this.find("buttons_container"));
         this.var_875 = IButtonWindow(this.find("zoom_button"));
         this.addMouseClickListener(this.var_1325,this.onAddFavouriteClick);
         this.addMouseClickListener(this._remFavouriteButton,this.onRemoveFavouriteClick);
         this.addMouseClickListener(this.var_1610,this.onRoomSettingsClick);
         this.addMouseClickListener(this.var_1320,this.onMakeHomeClick);
         this.addMouseClickListener(this.var_1614,this.onEventSettingsClick);
         this.addMouseClickListener(this.var_1612,this.onEventSettingsClick);
         this.addMouseClickListener(this.var_1080,this.onEmbedSrcClick);
         this.addMouseClickListener(this.var_1319,this.onThumbUp);
         this.addMouseClickListener(this.var_2035,this.onStaffPick);
         this.addMouseClickListener(this.var_1321,this.onFacebookLike);
         this.addMouseClickListener(this.var_875,this.onZoomClick);
         this._navigator.refreshButton(this.var_1325,"favourite",true,null,0);
         this._navigator.refreshButton(this._remFavouriteButton,"favourite",true,null,0);
         this._navigator.refreshButton(this.var_1320,"home",true,null,0);
         this.addMouseClickListener(this._window.findChildByTag("close"),this.onCloseButtonClick);
         this.addMouseOverListener(this.var_404,this.onHover);
         this.addMouseOverListener(this.var_290,this.onHover);
         this.var_1081.width = this.var_1081.textWidth;
         Util.moveChildrenToRow(this.var_2034,["owner_caption","owner_name"],this.var_1081.x,this.var_1081.y,3);
         this.var_879.width = this.var_879.textWidth;
         Util.moveChildrenToRow(this.var_2033,["rating_caption","rating_txt"],this.var_879.x,this.var_879.y,3);
         this.var_1322.height = this.var_1322.textHeight + 5;
         Util.moveChildrenToColumn(this.var_877,["embed_info_txt","embed_src_txt"],this.var_1322.y,2);
         this.var_877.height = Util.method_1(this.var_877) + 5;
         this.var_3087 = this._window.y + this._window.height;
      }
      
      private function addMouseClickListener(param1:IWindow, param2:Function) : void
      {
         if(param1 != null)
         {
            param1.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,param2);
         }
      }
      
      private function addMouseOverListener(param1:IWindow, param2:Function) : void
      {
         if(param1 != null)
         {
            param1.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,param2);
         }
      }
      
      private function find(param1:String) : IWindow
      {
         var _loc2_:IWindow = this._window.findChildByName(param1);
         if(_loc2_ == null)
         {
            throw new Error("Window element with name: " + param1 + " cannot be found!");
         }
         return _loc2_;
      }
      
      public function onAddFavouriteClick(param1:WindowEvent) : void
      {
         var _loc2_:* = null;
         if(this._navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         if(this._navigator.data.isFavouritesFull())
         {
            _loc2_ = new SimpleAlertView(this._navigator,"${navigator.favouritesfull.title}","${navigator.favouritesfull.body}");
            _loc2_.show();
         }
         else
         {
            this._navigator.send(new AddFavouriteRoomMessageComposer(this._navigator.data.enteredGuestRoom.flatId));
         }
      }
      
      public function onRemoveFavouriteClick(param1:WindowEvent) : void
      {
         if(this._navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         this._navigator.send(new DeleteFavouriteRoomMessageComposer(this._navigator.data.enteredGuestRoom.flatId));
      }
      
      private function onEventSettingsClick(param1:WindowEvent) : void
      {
         if(this._navigator.data.roomEventData == null)
         {
            if(this._navigator.data.currentRoomOwner)
            {
               this._navigator.send(new CanCreateEventMessageComposer());
            }
         }
         else
         {
            this.startEventEdit();
         }
      }
      
      private function onRoomSettingsClick(param1:WindowEvent) : void
      {
         var _loc2_:GuestRoomData = this._navigator.data.enteredGuestRoom;
         if(_loc2_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         this.startRoomSettingsEdit(_loc2_.flatId);
      }
      
      private function onMakeHomeClick(param1:WindowEvent) : void
      {
         var _loc2_:GuestRoomData = this._navigator.data.enteredGuestRoom;
         if(_loc2_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         Logger.log("SETTING HOME ROOM TO: " + _loc2_.flatId);
         this._navigator.send(new UpdateNavigatorSettingsMessageComposer(_loc2_.flatId));
      }
      
      private function onCloseButtonClick(param1:WindowEvent) : void
      {
         this.hideInfo(null);
      }
      
      private function onThumbUp(param1:WindowEvent) : void
      {
         this._navigator.send(new RateFlatMessageComposer(1));
      }
      
      private function onStaffPick(param1:WindowEvent) : void
      {
         this._navigator.send(new ToggleStaffPickMessageComposer(this._navigator.data.enteredGuestRoom.flatId,this._navigator.data.currentRoomIsStaffPick));
      }
      
      private function onFacebookLike(param1:WindowEvent) : void
      {
         HabboWebTools.facebookLike(this._navigator.data.enteredGuestRoom.flatId);
      }
      
      private function onEmbedSrcClick(param1:WindowEvent) : void
      {
         this.var_1080.setSelection(0,this.var_1080.text.length);
      }
      
      private function onZoomClick(param1:WindowEvent) : void
      {
         this._navigator.events.dispatchEvent(new HabboNavigatorEvent(HabboNavigatorEvent.const_362));
         this.var_1611 = !this.var_1611;
         this.refreshButtons();
      }
      
      private function onHover(param1:WindowEvent) : void
      {
         this.var_405.reset();
      }
      
      private function hideInfo(param1:Event) : void
      {
         this._window.visible = false;
         if(this.var_160 != null)
         {
            this.var_160.resetView();
         }
      }
      
      private function getEmbedData() : String
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(this._navigator.data.enteredGuestRoom != null)
         {
            _loc1_ = "private";
            _loc2_ = "" + this._navigator.data.enteredGuestRoom.flatId;
         }
         else
         {
            _loc1_ = "public";
            _loc2_ = "" + this._navigator.data.publicSpaceNodeId;
            Logger.log("Node id is: " + _loc2_);
         }
         var _loc3_:String = this._navigator.configuration.getKey("user.hash","");
         this._navigator.registerParameter("navigator.embed.src","roomType",_loc1_);
         this._navigator.registerParameter("navigator.embed.src","embedCode",_loc3_);
         this._navigator.registerParameter("navigator.embed.src","roomId",_loc2_);
         return this._navigator.getText("navigator.embed.src");
      }
   }
}
