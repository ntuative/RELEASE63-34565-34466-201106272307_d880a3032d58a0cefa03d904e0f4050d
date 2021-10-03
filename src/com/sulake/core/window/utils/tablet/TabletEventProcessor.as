package com.sulake.core.window.utils.tablet
{
   import com.sulake.core.window.WindowController;
   import com.sulake.core.window.utils.EventProcessorState;
   import com.sulake.core.window.utils.IEventQueue;
   import com.sulake.core.window.utils.MouseEventProcessor;
   
   public class TabletEventProcessor extends MouseEventProcessor
   {
       
      
      private var var_3110:String = "";
      
      public function TabletEventProcessor()
      {
         super();
      }
      
      override public function process(param1:EventProcessorState, param2:IEventQueue) : void
      {
         if(param2.length == 0)
         {
            return;
         }
         var_95 = param1.desktop;
         var_71 = param1.var_1409 as WindowController;
         var_188 = param1.var_1406 as WindowController;
         var_185 = param1.renderer;
         var_931 = param1.var_1408;
         param2.begin();
         param2.end();
         param1.desktop = var_95;
         param1.var_1409 = var_71;
         param1.var_1406 = var_188;
         param1.renderer = var_185;
         param1.var_1408 = var_931;
      }
   }
}
