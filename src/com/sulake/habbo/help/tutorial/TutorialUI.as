package com.sulake.habbo.help.tutorial
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.avatar.ChangeUserNameResultMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.avatar.CheckUserNameResultMessageEvent;
   import com.sulake.habbo.communication.messages.outgoing.avatar.ChangeUserNameMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.avatar.CheckUserNameMessageComposer;
   import com.sulake.habbo.communication.messages.parser.avatar.ChangeUserNameResultMessageParser;
   import com.sulake.habbo.communication.messages.parser.avatar.CheckUserNameResultMessageParser;
   import com.sulake.habbo.help.HabboHelp;
   import com.sulake.habbo.help.INameChangeUI;
   import com.sulake.habbo.help.enum.HabboHelpTutorialEvent;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.session.events.HabboSessionFigureUpdatedEvent;
   import com.sulake.habbo.window.utils.IAlertDialog;
   
   public class TutorialUI implements INameChangeUI
   {
      
      public static const const_99:String = "TUI_MAIN_VIEW";
      
      public static const const_359:String = "TUI_NAME_VIEW";
      
      public static const const_402:String = "TUI_CLOTHES_VIEW";
      
      public static const const_528:String = "TUI_GUIDEBOT_VIEW";
       
      
      private var var_2515:int = 0;
      
      private var var_2516:int = 0;
      
      private var var_36:HabboHelp;
      
      private var _window:IFrameWindow;
      
      private var var_53:ITutorialUIView;
      
      private var var_375:NameChangeView;
      
      private var var_1214:Boolean = false;
      
      private var var_1213:Boolean = false;
      
      private var var_1496:Boolean = false;
      
      private var var_1846:Boolean = false;
      
      private var var_2514:Boolean;
      
      public function TutorialUI(param1:HabboHelp, param2:Boolean = true)
      {
         super();
         this.var_36 = param1;
         this.var_2514 = param2;
         this.var_36.events.addEventListener(HabboHelpTutorialEvent.const_619,this.onTaskDoneEvent);
         this.var_36.events.addEventListener(HabboHelpTutorialEvent.const_533,this.onTaskDoneEvent);
         this.var_36.events.addEventListener(HabboHelpTutorialEvent.const_663,this.onTaskDoneEvent);
         if(this.var_36.sessionDataManager != null)
         {
            this.var_36.sessionDataManager.events.addEventListener(HabboSessionFigureUpdatedEvent.const_348,this.onFigureUpdate);
         }
      }
      
      public function get help() : HabboHelp
      {
         return this.var_36;
      }
      
      public function get assets() : IAssetLibrary
      {
         return this.var_36.assets;
      }
      
      public function get localization() : IHabboLocalizationManager
      {
         return this.var_36.localization;
      }
      
      public function get myName() : String
      {
         return this.var_36.ownUserName;
      }
      
      public function get hasTasksDone() : Boolean
      {
         return this.var_1214 && this.var_1213 && this.var_1496;
      }
      
      public function get hasChangedLooks() : Boolean
      {
         return this.var_1214;
      }
      
      public function get hasChangedName() : Boolean
      {
         return this.var_1213;
      }
      
      public function get hasCalledGuideBot() : Boolean
      {
         return this.var_1496;
      }
      
      public function dispose() : void
      {
         this.disposeView();
         if(this.var_36)
         {
            this.var_36.events.removeEventListener(HabboHelpTutorialEvent.const_619,this.onTaskDoneEvent);
            this.var_36.events.removeEventListener(HabboHelpTutorialEvent.const_533,this.onTaskDoneEvent);
            this.var_36.events.removeEventListener(HabboHelpTutorialEvent.const_663,this.onTaskDoneEvent);
            if(this.var_36.sessionDataManager != null)
            {
               this.var_36.sessionDataManager.events.removeEventListener(HabboSessionFigureUpdatedEvent.const_348,this.onFigureUpdate);
            }
            this.var_36 = null;
         }
      }
      
      public function update(param1:Boolean, param2:Boolean, param3:Boolean) : void
      {
         this.var_1214 = param1;
         this.var_1213 = param2;
         this.var_1496 = param3;
         if(this.var_53 == null || this.var_53.id == const_99)
         {
            this.prepareForTutorial();
            this.showView(const_99);
         }
      }
      
      public function onTaskDoneEvent(param1:HabboHelpTutorialEvent) : void
      {
         switch(param1.type)
         {
            case HabboHelpTutorialEvent.const_619:
               this.var_1496 = true;
               if(this.var_53 != null && this.var_53.id == const_528)
               {
                  this.showView(const_99);
               }
               break;
            case HabboHelpTutorialEvent.const_533:
               if(this.var_53 != null && this.var_53.id == const_402)
               {
                  this.var_1846 = true;
                  this.disposeWindow();
               }
               break;
            case HabboHelpTutorialEvent.const_663:
               if(this.var_1846)
               {
                  this.var_1846 = false;
                  this.showView(const_99);
               }
         }
      }
      
      public function showView(param1:String) : void
      {
         var _loc2_:* = null;
         if(this.hasTasksDone)
         {
            if(this.var_36)
            {
               this.var_36.removeTutorialUI();
            }
            return;
         }
         var _loc3_:Boolean = false;
         if(this._window == null)
         {
            this._window = this.buildXmlWindow("tutorial_frame") as IFrameWindow;
            if(this._window == null)
            {
               return;
            }
            this._window.procedure = this.windowProcedure;
            _loc2_ = this._window.findChildByName("content_list") as IItemListWindow;
            if(_loc2_ == null)
            {
               return;
            }
            this.var_2515 = this._window.width - _loc2_.width;
            this.var_2516 = this._window.height;
            _loc3_ = true;
         }
         _loc2_ = this._window.findChildByName("content_list") as IItemListWindow;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.destroyListItems();
         _loc2_.height = 0;
         if(this.var_53 != null)
         {
            this.var_53.dispose();
         }
         this._window.visible = true;
         switch(param1)
         {
            case const_99:
               if(this.var_375 != null)
               {
                  this.var_375.dispose();
               }
               if(this.var_2514)
               {
                  this.var_53 = new TutorialMainView(_loc2_,this);
                  break;
               }
               this._window.visible = false;
               return;
               break;
            case const_359:
               this._window.visible = false;
               if(this.var_375 == null)
               {
                  this.var_375 = new NameChangeView(this);
               }
               this.var_375.showMainView();
               this.prepareForTutorial();
               break;
            case const_402:
               this.var_53 = new TutorialClothesChangeView(_loc2_,this);
               break;
            case const_528:
               this.var_53 = new TutorialCallGuideBotView(_loc2_,this);
         }
         this._window.height = _loc2_.height + this.var_2516;
         this._window.width = _loc2_.width + this.var_2515;
         if(_loc3_)
         {
            if(this._window == null)
            {
               return;
            }
            this._window.x = this._window.context.getDesktopWindow().width / 2 - this._window.width / 2;
            this._window.y = 0;
         }
      }
      
      public function buildXmlWindow(param1:String, param2:uint = 1) : IWindow
      {
         if(this.var_36 == null || this.var_36.assets == null)
         {
            return null;
         }
         var _loc3_:XmlAsset = XmlAsset(this.var_36.assets.getAssetByName(param1 + "_xml"));
         if(_loc3_ == null || this.var_36.windowManager == null)
         {
            return null;
         }
         return this.var_36.windowManager.buildFromXML(XML(_loc3_.content),param2);
      }
      
      private function disposeWindow(param1:WindowEvent = null) : void
      {
         if(this._window != null)
         {
            this._window.dispose();
            this._window = null;
         }
      }
      
      private function disposeView() : void
      {
         if(this.var_53 != null)
         {
            this.var_53.dispose();
            this.var_53 = null;
         }
         if(this.var_375 != null)
         {
            this.var_375.dispose();
            this.var_375 = null;
         }
         this.disposeWindow();
      }
      
      public function setRoomSessionStatus(param1:Boolean) : void
      {
         if(param1 == false)
         {
            this.disposeView();
         }
      }
      
      public function prepareForTutorial() : void
      {
         if(this.var_36 == null || this.var_36.events == null)
         {
            return;
         }
         this.var_36.hideUI();
         this.var_36.events.dispatchEvent(new HabboHelpTutorialEvent(HabboHelpTutorialEvent.const_135));
      }
      
      public function windowProcedure(param1:WindowEvent, param2:IWindow) : void
      {
         switch(param1.type)
         {
            case WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK:
               if(param2.name == "header_button_close")
               {
                  this.disposeView();
               }
         }
      }
      
      public function changeName(param1:String) : void
      {
         this.disposeWindow();
         this.var_36.sendMessage(new ChangeUserNameMessageComposer(param1));
      }
      
      public function checkName(param1:String) : void
      {
         this.disposeWindow();
         this.var_36.sendMessage(new CheckUserNameMessageComposer(param1));
      }
      
      public function onUserNameChanged(param1:String) : void
      {
         var name:String = param1;
         if(!this.var_36 || !this.var_36.localization || !this.var_36.windowManager)
         {
            return;
         }
         this.var_1213 = true;
         this.var_36.localization.registerParameter("help.tutorial.name.changed","name",name);
         this.var_36.windowManager.alert("${generic.notice}","${help.tutorial.name.changed}",0,function(param1:IAlertDialog, param2:WindowEvent):void
         {
            param1.dispose();
         });
         if(this.var_53 != null && (this.var_53.id == const_359 || this.var_53.id == const_99))
         {
            this.showView(const_99);
         }
      }
      
      private function onFigureUpdate(param1:HabboSessionFigureUpdatedEvent) : void
      {
         var _loc2_:* = false;
         if(this.var_36 == null || param1 == null)
         {
            return;
         }
         if(!this.var_1214)
         {
            if(this.var_36.sessionDataManager != null)
            {
               _loc2_ = param1.userId == this.var_36.sessionDataManager.userId;
               if(_loc2_)
               {
                  this.var_36.sessionDataManager.events.removeEventListener(HabboSessionFigureUpdatedEvent.const_348,this.onFigureUpdate);
                  this.onUserChanged();
               }
            }
         }
      }
      
      public function onUserChanged() : void
      {
         this.var_1214 = true;
         if(this.var_53 != null && (this.var_53.id == const_402 || this.var_53.id == const_99))
         {
            this.showView(const_99);
         }
      }
      
      public function onChangeUserNameResult(param1:ChangeUserNameResultMessageEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc2_:ChangeUserNameResultMessageParser = param1.getParser();
         if(_loc2_.resultCode == ChangeUserNameResultMessageEvent.var_504)
         {
            this.var_1213 = true;
            this.showView(TutorialUI.const_99);
         }
         else
         {
            this.var_375.setNameNotAvailableView(_loc2_.resultCode,_loc2_.name,_loc2_.nameSuggestions);
         }
      }
      
      public function onCheckUserNameResult(param1:CheckUserNameResultMessageEvent) : void
      {
         if(!param1)
         {
            return;
         }
         var _loc2_:CheckUserNameResultMessageParser = param1.getParser();
         if(_loc2_.resultCode == ChangeUserNameResultMessageEvent.var_504)
         {
            this.var_375.checkedName = _loc2_.name;
         }
         else
         {
            this.var_375.setNameNotAvailableView(_loc2_.resultCode,_loc2_.name,_loc2_.nameSuggestions);
         }
      }
   }
}
