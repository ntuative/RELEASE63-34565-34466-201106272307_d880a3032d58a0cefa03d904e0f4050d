package com.sulake.core.window.services
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.events.WindowEvent;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class GestureAgentService implements IGestureAgentService, IDisposable
   {
       
      
      private var _disposed:Boolean = false;
      
      protected var _working:Boolean;
      
      protected var _window:IWindow;
      
      protected var var_223:Timer;
      
      protected var var_1688:uint = 0;
      
      protected var var_310:Function;
      
      protected var var_1415:int;
      
      protected var var_1414:int;
      
      public function GestureAgentService()
      {
         super();
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function dispose() : void
      {
         this.end(this._window);
         this._disposed = true;
      }
      
      public function begin(param1:IWindow, param2:Function, param3:uint, param4:int, param5:int) : IWindow
      {
         this.var_1688 = param3;
         var _loc6_:IWindow = this._window;
         if(this._window != null)
         {
            this.end(this._window);
         }
         if(param1 && !param1.disposed)
         {
            this._window = param1;
            this._window.addEventListener(WindowEvent.const_338,this.clientWindowDestroyed);
            this.var_310 = param2;
            this._working = true;
            this.var_1415 = param4;
            this.var_1414 = param5;
            this.var_223 = new Timer(40,0);
            this.var_223.addEventListener(TimerEvent.TIMER,this.operate);
            this.var_223.start();
         }
         return _loc6_;
      }
      
      protected function operate(param1:TimerEvent) : void
      {
         this.var_1415 *= 0.75;
         this.var_1414 *= 0.75;
         if(Math.abs(this.var_1415) <= 1 && Math.abs(this.var_1414) <= 1)
         {
            this.end(this._window);
         }
         else if(this.var_310 != null)
         {
            this.var_310(this.var_1415,this.var_1414);
         }
      }
      
      public function end(param1:IWindow) : IWindow
      {
         var _loc2_:IWindow = this._window;
         if(this.var_223)
         {
            this.var_223.stop();
            this.var_223.removeEventListener(TimerEvent.TIMER,this.operate);
            this.var_223 = null;
         }
         if(this._working)
         {
            if(this._window == param1)
            {
               if(!this._window.disposed)
               {
                  this._window.removeEventListener(WindowEvent.const_338,this.clientWindowDestroyed);
               }
               this._window = null;
               this._working = false;
            }
         }
         return _loc2_;
      }
      
      private function clientWindowDestroyed(param1:WindowEvent) : void
      {
         this.end(this._window);
      }
   }
}
