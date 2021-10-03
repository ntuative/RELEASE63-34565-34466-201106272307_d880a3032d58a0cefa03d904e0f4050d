package com.sulake.habbo.tracking
{
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   
   public class ToolbarClickTracker
   {
       
      
      private var var_1433:IHabboTracking;
      
      private var var_2108:Boolean = false;
      
      private var var_2762:int = 0;
      
      private var var_1996:int = 0;
      
      public function ToolbarClickTracker(param1:IHabboTracking)
      {
         super();
         this.var_1433 = param1;
      }
      
      public function dispose() : void
      {
         this.var_1433 = null;
      }
      
      public function configure(param1:IHabboConfigurationManager) : void
      {
         this.var_2108 = Boolean(parseInt(param1.getKey("toolbar.tracking.enabled","1")));
         this.var_2762 = parseInt(param1.getKey("toolbar.tracking.max.events","100"));
      }
      
      public function track(param1:String) : void
      {
         if(!this.var_2108)
         {
            return;
         }
         ++this.var_1996;
         if(this.var_1996 <= this.var_2762)
         {
            this.var_1433.trackGoogle("toolbar",param1);
         }
      }
   }
}
