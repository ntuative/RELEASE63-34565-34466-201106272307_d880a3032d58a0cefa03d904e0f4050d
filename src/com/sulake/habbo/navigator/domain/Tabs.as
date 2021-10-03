package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.mainview.MainViewCtrl;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.EventsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.MyRoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.OfficialTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.RoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.SearchTabPageDecorator;
   
   public class Tabs
   {
      
      public static const const_368:int = 1;
      
      public static const const_215:int = 2;
      
      public static const const_292:int = 3;
      
      public static const const_357:int = 4;
      
      public static const const_304:int = 5;
      
      public static const const_451:int = 1;
      
      public static const const_809:int = 2;
      
      public static const const_851:int = 3;
      
      public static const const_902:int = 4;
      
      public static const const_255:int = 5;
      
      public static const const_839:int = 6;
      
      public static const const_764:int = 7;
      
      public static const const_456:int = 8;
      
      public static const const_535:int = 9;
      
      public static const const_2221:int = 10;
      
      public static const const_977:int = 11;
      
      public static const const_603:int = 12;
       
      
      private var var_443:Array;
      
      private var _navigator:HabboNavigator;
      
      public function Tabs(param1:HabboNavigator)
      {
         super();
         this._navigator = param1;
         this.var_443 = new Array();
         this.var_443.push(new Tab(this._navigator,const_368,const_603,new EventsTabPageDecorator(this._navigator),MainViewCtrl.const_666));
         this.var_443.push(new Tab(this._navigator,const_215,const_451,new RoomsTabPageDecorator(this._navigator),MainViewCtrl.const_666));
         this.var_443.push(new Tab(this._navigator,const_357,const_977,new OfficialTabPageDecorator(this._navigator),MainViewCtrl.const_1165));
         this.var_443.push(new Tab(this._navigator,const_292,const_255,new MyRoomsTabPageDecorator(this._navigator),MainViewCtrl.const_666));
         this.var_443.push(new Tab(this._navigator,const_304,const_456,new SearchTabPageDecorator(this._navigator),MainViewCtrl.const_1257));
         this.setSelectedTab(const_368);
      }
      
      public function onFrontPage() : Boolean
      {
         return this.getSelected().id == const_357;
      }
      
      public function get tabs() : Array
      {
         return this.var_443;
      }
      
      public function setSelectedTab(param1:int) : void
      {
         this.clearSelected();
         this.getTab(param1).selected = true;
      }
      
      public function getSelected() : Tab
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_443)
         {
            if(_loc1_.selected)
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      private function clearSelected() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_443)
         {
            _loc1_.selected = false;
         }
      }
      
      public function getTab(param1:int) : Tab
      {
         var _loc2_:* = null;
         for each(_loc2_ in this.var_443)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
   }
}
