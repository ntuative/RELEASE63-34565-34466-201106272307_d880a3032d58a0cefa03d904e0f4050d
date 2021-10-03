package com.sulake.habbo.tracking
{
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   
   public class FramerateTracker
   {
       
      
      private var var_1747:int;
      
      private var var_3005:int;
      
      private var var_810:int;
      
      private var var_519:Number;
      
      private var var_3007:Boolean;
      
      private var var_3006:int;
      
      private var var_2173:int;
      
      public function FramerateTracker()
      {
         super();
      }
      
      public function get frameRate() : int
      {
         return Math.round(1000 / this.var_519);
      }
      
      public function configure(param1:IHabboConfigurationManager) : void
      {
         this.var_3005 = int(param1.getKey("tracking.framerate.reportInterval.seconds","300")) * 1000;
         this.var_3006 = int(param1.getKey("tracking.framerate.maximumEvents","5"));
         this.var_3007 = true;
      }
      
      public function trackUpdate(param1:uint, param2:IHabboTracking, param3:int) : void
      {
         var _loc4_:Number = NaN;
         ++this.var_810;
         if(this.var_810 == 1)
         {
            this.var_519 = param1;
            this.var_1747 = param3;
         }
         else
         {
            _loc4_ = Number(this.var_810);
            this.var_519 = this.var_519 * (_loc4_ - 1) / _loc4_ + Number(param1) / _loc4_;
         }
         if(this.var_3007 && param3 - this.var_1747 >= this.var_3005)
         {
            this.var_810 = 0;
            if(this.var_2173 < this.var_3006)
            {
               param2.trackGoogle("performance","averageFramerate",this.frameRate);
               ++this.var_2173;
               this.var_1747 = param3;
            }
         }
      }
      
      public function dispose() : void
      {
      }
   }
}
