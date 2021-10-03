package com.sulake.habbo.quest
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.notifications.AchievementLevelUpData;
   import com.sulake.habbo.communication.messages.outgoing.tracking.EventLogMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.users.GetAchievementShareIdComposer;
   import com.sulake.habbo.utils.HabboWebTools;
   import flash.display.BitmapData;
   import flash.filters.ColorMatrixFilter;
   import flash.geom.Point;
   
   public class AchievementLevelUp implements IDisposable
   {
      
      private static const const_1120:int = 2000;
      
      private static const const_1626:int = 500;
      
      private static const const_1625:int = 500;
      
      private static const const_2089:int = 300;
      
      private static const const_1627:int = 1400;
      
      private static const const_1624:Number = 1;
      
      private static const const_1628:int = 3;
      
      private static const const_1119:int = 0;
      
      private static const const_1121:int = 1;
      
      private static const const_719:int = 2;
      
      private static const const_1118:int = 3;
       
      
      private var _window:IFrameWindow;
      
      private var _questEngine:HabboQuestEngine;
      
      private var var_69:AchievementLevelUpData;
      
      private var var_884:Array;
      
      private var var_883:int;
      
      private var var_2041:int = 0;
      
      private var var_2042:int;
      
      private var var_578:int;
      
      private var var_1617:int;
      
      private var var_1618:int = 3;
      
      private var var_882:BitmapData;
      
      private var var_2816:Point;
      
      private var var_577:Array;
      
      private var var_2040:ColorMatrixFilter;
      
      private var var_666:Animation;
      
      public function AchievementLevelUp(param1:HabboQuestEngine)
      {
         this.var_884 = new Array();
         this.var_577 = [1,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,1,0];
         this.var_2040 = new ColorMatrixFilter(this.var_577);
         super();
         this._questEngine = param1;
      }
      
      public function dispose() : void
      {
         this._questEngine = null;
         this.var_884 = null;
         this.var_69 = null;
         if(this._window)
         {
            this._window.dispose();
            this._window = null;
         }
         if(this.var_666)
         {
            this.var_666.dispose();
            this.var_666 = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._window == null;
      }
      
      public function onLevelUp(param1:AchievementLevelUpData) : void
      {
         this.var_884.push(param1);
         this._questEngine.sessionDataManager.getBadgeImage(param1.badgeCode);
         this._questEngine.sessionDataManager.getBadgeImage(this._questEngine.localization.getPreviousLevelBadgeId(param1.badgeCode));
         if(this._window == null || !this._window.visible)
         {
            this.var_883 = const_1120;
         }
         this.prepare();
      }
      
      private function close() : void
      {
         if(this._window)
         {
            this._window.visible = false;
            if(this.var_884.length > 0)
            {
               this.var_883 = const_1626;
            }
         }
      }
      
      private function prepare() : void
      {
         if(this._window != null)
         {
            return;
         }
         this._window = IFrameWindow(this._questEngine.getXmlWindow("AchievementLevelUp"));
         this._window.findChildByTag("close").procedure = this.onCloseLink;
         this._window.findChildByName("ok_button").procedure = this.onOkButton;
         this._window.findChildByName("share_button").procedure = this.onShareButton;
         new PendingImage(this._questEngine,this._window.findChildByName("reward_icon"),"ach_receive_star");
         this._window.findChildByName("achievements_link_region").procedure = this.onAchievementsLink;
         this._window.findChildByName("close_link_region").procedure = this.onCloseLink;
         this.var_666 = this._questEngine.getTwinkleAnimation(this._window);
         this._window.visible = false;
      }
      
      private function show() : void
      {
         this.prepare();
         this.registerParameter("achievements.levelup.title","category",this._questEngine.getAchievementCategoryName(this.var_69.category));
         this.registerParameter("achievements.levelup.reward","amount","" + this.var_69.levelRewardPoints);
         this.registerParameter("achievements.levelup.reward","currency_name",this._questEngine.getActivityPointName(this.var_69.levelRewardPointType));
         this.registerParameter("achievements.levelup.score","amount","" + this.var_69.points);
         this.registerParameter("achievements.levelup.sharedesc","amount","" + this.var_69.bonusPoints);
         this._window.findChildByName("achievement_name_txt").caption = "\'" + this._questEngine.localization.getBadgeName(this.var_69.badgeCode) + "\'";
         var _loc1_:Boolean = this.isFacebookPostingEnabled();
         this._window.findChildByName("achievements_link_region").visible = !_loc1_;
         this._window.findChildByName("close_link_region").visible = _loc1_;
         this._window.findChildByName("ok_button").visible = !_loc1_;
         this._window.findChildByName("share_button").visible = _loc1_;
         this._window.findChildByName("facebook_info_txt").visible = _loc1_;
         this.doFacebookLogging();
         if(this.var_69.level > 1)
         {
            this.setFadeStatus(const_1121);
         }
         else
         {
            this.setFadeStatus(const_719,const_1627);
         }
         this.var_666.restart();
      }
      
      private function setFadeStatus(param1:int, param2:int = 300) : void
      {
         this.var_882 = null;
         this.var_2041 = param1;
         this.var_578 = param2;
         this.var_2042 = param2;
         this.var_1617 = const_1625;
      }
      
      private function isFacebookPostingEnabled() : Boolean
      {
         return this.var_69.bonusPoints > 0 && this.isPostingEnabled() && this._questEngine.configuration.keyExists("facebook.user");
      }
      
      private function isPostingEnabled() : Boolean
      {
         return this._questEngine.configuration.getKey("achievement.post.enabled","1") != "0";
      }
      
      private function doFacebookLogging() : void
      {
         var _loc1_:Boolean = this._questEngine.configuration.keyExists("facebook.user");
         var _loc2_:String = this.var_69.badgeCode;
         if(this.var_69.bonusPoints <= 0 || !this.isPostingEnabled())
         {
            this._questEngine.send(new EventLogMessageComposer("Achievements",_loc2_,"client.show.no_post"));
         }
         else if(_loc1_)
         {
            this._questEngine.send(new EventLogMessageComposer("Achievements",_loc2_,"client.show.post"));
         }
         else
         {
            this._questEngine.send(new EventLogMessageComposer("Achievements",_loc2_,"client.show.no_fb"));
         }
      }
      
      private function onOkButton(param1:WindowEvent, param2:IWindow = null) : void
      {
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            this.close();
         }
      }
      
      private function onCloseLink(param1:WindowEvent, param2:IWindow = null) : void
      {
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            this.close();
         }
      }
      
      private function onAchievementsLink(param1:WindowEvent, param2:IWindow = null) : void
      {
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            this._questEngine.achievementController.show();
            this.close();
         }
      }
      
      private function onShareButton(param1:WindowEvent, param2:IWindow = null) : void
      {
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            this._questEngine.send(new GetAchievementShareIdComposer(this.var_69.achievementID));
            this._questEngine.send(new EventLogMessageComposer("Achievements",this.var_69.badgeCode,"client.start_post"));
         }
      }
      
      public function update(param1:uint) : void
      {
         if(this.var_883 > 0)
         {
            this.checkDialogOpen(param1);
            return;
         }
         if(this.var_666 != null)
         {
            this.var_666.update(param1);
         }
         if(this._window == null || this.var_2041 == const_1119)
         {
            return;
         }
         switch(this.var_2041)
         {
            case const_1121:
               this.var_1617 -= param1;
               this.method_5(true);
               if(this.var_1617 < 0)
               {
                  this.setFadeStatus(const_1118);
               }
               break;
            case const_1118:
               this.var_578 -= param1;
               this.method_5(true);
               if(this.var_578 < 0)
               {
                  this.setFadeStatus(const_719);
               }
               break;
            case const_719:
               this.var_578 -= param1;
               this.method_5(false);
               if(this.var_578 < 0)
               {
                  this.setFadeStatus(const_1119);
               }
         }
      }
      
      private function checkDialogOpen(param1:uint) : void
      {
         this.var_883 -= param1;
         if(this.var_883 > 0)
         {
            return;
         }
         if(this.var_884.length < 1)
         {
            return;
         }
         var _loc2_:AchievementLevelUpData = this.var_884.pop();
         if(this._questEngine.sessionDataManager.getBadgeImageWithInfo(_loc2_.badgeCode).placeHolder || this._questEngine.sessionDataManager.getBadgeImageWithInfo(this._questEngine.localization.getPreviousLevelBadgeId(_loc2_.badgeCode)).placeHolder)
         {
            if(this.var_1618 > 0)
            {
               this.var_884.push(_loc2_);
               this.var_883 = const_1120;
               --this.var_1618;
               return;
            }
            this.var_1618 = const_1628;
         }
         this.var_69 = _loc2_;
         this.show();
         this._window.center();
         this._window.visible = true;
         this._window.activate();
      }
      
      public function requestFacebookPostDialog(param1:String, param2:String) : void
      {
         if(this._window == null || this.var_69 == null || this.var_69.badgeCode != param1)
         {
            Logger.log("Invalid facebook post: " + param1 + ", " + (this.var_69 == null ? "current is null" : this.var_69.badgeCode));
            return;
         }
         var _loc3_:String = this.getFacebookText("notifications.text.achievement_facebook");
         var _loc4_:String = this.getFacebookText("notifications.text.achievement_facebook_title");
         HabboWebTools.facebookAchievementPost(this.var_69.badgeCode,_loc4_,_loc3_,param2);
         this.close();
      }
      
      private function getFacebookText(param1:String) : String
      {
         var _loc2_:String = this._questEngine.sessionDataManager.userName;
         var _loc3_:String = this._questEngine.sessionDataManager.realName;
         var _loc4_:String = this._questEngine.localization.getAchievementNameForFacebook(this.var_69.badgeCode,_loc2_,_loc3_,this.var_69.level);
         var _loc5_:String = this._questEngine.localization.getAchievementDescForFacebook(this.var_69.badgeCode,_loc2_,_loc3_,this.var_69.level);
         this.registerParameter(param1,"badge_name",this._questEngine.localization.getBadgeName(this.var_69.badgeCode));
         this.registerParameter(param1,"badge_desc",this._questEngine.localization.getBadgeDesc(this.var_69.badgeCode));
         this.registerParameter(param1,"badge_name_fb",_loc4_);
         this.registerParameter(param1,"badge_desc_fb",_loc5_);
         this.registerParameter(param1,"level",this.var_69.level.toString());
         this.registerParameter(param1,"name",_loc2_);
         this.registerParameter(param1,"realname",_loc3_);
         return this._questEngine.localization.getKey(param1,param1);
      }
      
      private function registerParameter(param1:String, param2:String, param3:String) : void
      {
         this._questEngine.localization.registerParameter(param1,param2,param3);
      }
      
      private function method_5(param1:Boolean) : void
      {
         this.changeBadgeColorFilter(param1);
         var _loc2_:IBitmapWrapperWindow = IBitmapWrapperWindow(this._window.findChildByName("achievement_pic_bitmap"));
         if(_loc2_.bitmap == null)
         {
            _loc2_.bitmap = new BitmapData(_loc2_.width,_loc2_.height,true,0);
         }
         if(this.var_882 == null)
         {
            this.var_882 = !!param1 ? this._questEngine.sessionDataManager.getBadgeImage(this._questEngine.localization.getPreviousLevelBadgeId(this.var_69.badgeCode)) : this._questEngine.sessionDataManager.getBadgeImage(this.var_69.badgeCode);
            this.var_2816 = new Point((_loc2_.width - this.var_882.width) / 2,(_loc2_.height - this.var_882.height) / 2);
         }
         _loc2_.bitmap.fillRect(_loc2_.bitmap.rect,0);
         _loc2_.bitmap.applyFilter(this.var_882,this.var_882.rect,this.var_2816,this.var_2040);
         _loc2_.invalidate(_loc2_.rectangle);
      }
      
      private function changeBadgeColorFilter(param1:Boolean) : void
      {
         var _loc2_:int = Math.max(0,!param1 ? Number(this.var_578) : Number(this.var_2042 - this.var_578));
         var _loc3_:Number = _loc2_ / this.var_2042 * const_1624;
         this.var_577[3] = _loc3_;
         this.var_577[8] = _loc3_;
         this.var_577[13] = _loc3_;
         this.var_577[0] = 1 - _loc3_;
         this.var_577[6] = 1 - _loc3_;
         this.var_577[12] = 1 - _loc3_;
         this.var_2040.matrix = this.var_577;
      }
   }
}
