package com.sulake.core.window.services
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IInteractiveWindow;
   import com.sulake.core.window.components.IToolTipWindow;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.enum.WindowType;
   import flash.display.DisplayObject;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.utils.Timer;
   
   public class WindowToolTipAgent extends WindowMouseOperator implements IToolTipAgentService
   {
       
      
      protected var var_1418:String;
      
      protected var var_311:IToolTipWindow;
      
      protected var var_427:Timer;
      
      protected var var_1419:Point;
      
      protected var var_915:Point;
      
      protected var var_1705:uint;
      
      public function WindowToolTipAgent(param1:DisplayObject)
      {
         this.var_915 = new Point();
         this.var_1419 = new Point(20,20);
         this.var_1705 = 500;
         super(param1);
      }
      
      override public function begin(param1:IWindow, param2:uint = 0) : IWindow
      {
         if(param1 && !param1.disposed)
         {
            if(param1 is IInteractiveWindow)
            {
               this.var_1418 = IInteractiveWindow(param1).toolTipCaption;
               this.var_1705 = IInteractiveWindow(param1).toolTipDelay;
            }
            else
            {
               this.var_1418 = param1.caption;
               this.var_1705 = 500;
            }
            _mouse.x = _root.mouseX;
            _mouse.y = _root.mouseY;
            getMousePositionRelativeTo(param1,_mouse,this.var_915);
            if(this.var_1418 != null && this.var_1418 != "")
            {
               if(this.var_427 == null)
               {
                  this.var_427 = new Timer(this.var_1705,1);
                  this.var_427.addEventListener(TimerEvent.TIMER,this.showToolTip);
               }
               this.var_427.reset();
               this.var_427.start();
            }
         }
         return super.begin(param1,param2);
      }
      
      override public function end(param1:IWindow) : IWindow
      {
         if(this.var_427 != null)
         {
            this.var_427.stop();
            this.var_427.removeEventListener(TimerEvent.TIMER,this.showToolTip);
            this.var_427 = null;
         }
         this.hideToolTip();
         return super.end(param1);
      }
      
      override public function operate(param1:int, param2:int) : void
      {
         if(_window && true)
         {
            _mouse.x = param1;
            _mouse.y = param2;
            getMousePositionRelativeTo(_window,_mouse,this.var_915);
            if(this.var_311 != null && !this.var_311.disposed)
            {
               this.var_311.x = param1 + this.var_1419.x;
               this.var_311.y = param2 + this.var_1419.y;
            }
         }
      }
      
      protected function showToolTip(param1:TimerEvent) : void
      {
         var _loc2_:* = null;
         if(this.var_427 != null)
         {
            this.var_427.reset();
         }
         if(_window && true)
         {
            if(this.var_311 == null || this.var_311.disposed)
            {
               this.var_311 = _window.context.create("undefined::ToolTip",this.var_1418,WindowType.const_413,_window.style,0 | 0,null,null,null,0,null,null) as IToolTipWindow;
            }
            _loc2_ = new Point();
            _window.getGlobalPosition(_loc2_);
            this.var_311.x = _loc2_.x + this.var_915.x + this.var_1419.x;
            this.var_311.y = _loc2_.y + this.var_915.y + this.var_1419.y;
         }
      }
      
      protected function hideToolTip() : void
      {
         if(this.var_311 != null && !this.var_311.disposed)
         {
            this.var_311.destroy();
            this.var_311 = null;
         }
      }
   }
}
