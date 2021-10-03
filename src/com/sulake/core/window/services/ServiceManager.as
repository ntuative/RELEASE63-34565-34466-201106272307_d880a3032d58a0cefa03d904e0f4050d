package com.sulake.core.window.services
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindowContext;
   import flash.display.DisplayObject;
   
   public class ServiceManager implements IInternalWindowServices, IDisposable
   {
       
      
      private var var_3095:uint;
      
      private var _root:DisplayObject;
      
      private var _disposed:Boolean = false;
      
      private var var_663:IWindowContext;
      
      private var var_1400:IMouseDraggingService;
      
      private var var_1398:IMouseScalingService;
      
      private var var_1403:IMouseListenerService;
      
      private var var_1401:IFocusManagerService;
      
      private var var_1402:IToolTipAgentService;
      
      private var var_1399:IGestureAgentService;
      
      public function ServiceManager(param1:IWindowContext, param2:DisplayObject)
      {
         super();
         this.var_3095 = 0;
         this._root = param2;
         this.var_663 = param1;
         this.var_1400 = new WindowMouseDragger(param2);
         this.var_1398 = new WindowMouseScaler(param2);
         this.var_1403 = new WindowMouseListener(param2);
         this.var_1401 = new FocusManager(param2);
         this.var_1402 = new WindowToolTipAgent(param2);
         this.var_1399 = new GestureAgentService();
      }
      
      public function dispose() : void
      {
         if(this.var_1400 != null)
         {
            this.var_1400.dispose();
            this.var_1400 = null;
         }
         if(this.var_1398 != null)
         {
            this.var_1398.dispose();
            this.var_1398 = null;
         }
         if(this.var_1403 != null)
         {
            this.var_1403.dispose();
            this.var_1403 = null;
         }
         if(this.var_1401 != null)
         {
            this.var_1401.dispose();
            this.var_1401 = null;
         }
         if(this.var_1402 != null)
         {
            this.var_1402.dispose();
            this.var_1402 = null;
         }
         if(this.var_1399 != null)
         {
            this.var_1399.dispose();
            this.var_1399 = null;
         }
         this._root = null;
         this.var_663 = null;
         this._disposed = true;
      }
      
      public function getMouseDraggingService() : IMouseDraggingService
      {
         return this.var_1400;
      }
      
      public function getMouseScalingService() : IMouseScalingService
      {
         return this.var_1398;
      }
      
      public function getMouseListenerService() : IMouseListenerService
      {
         return this.var_1403;
      }
      
      public function getFocusManagerService() : IFocusManagerService
      {
         return this.var_1401;
      }
      
      public function getToolTipAgentService() : IToolTipAgentService
      {
         return this.var_1402;
      }
      
      public function getGestureAgentService() : IGestureAgentService
      {
         return this.var_1399;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
   }
}
