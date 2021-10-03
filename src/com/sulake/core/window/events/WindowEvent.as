package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   
   public class WindowEvent
   {
      
      public static const const_1788:String = "WE_DESTROY";
      
      public static const const_338:String = "WE_DESTROYED";
      
      public static const const_1740:String = "WE_OPEN";
      
      public static const const_1800:String = "WE_OPENED";
      
      public static const const_1823:String = "WE_CLOSE";
      
      public static const const_1961:String = "WE_CLOSED";
      
      public static const const_1821:String = "WE_FOCUS";
      
      public static const const_381:String = "WE_FOCUSED";
      
      public static const const_1808:String = "WE_UNFOCUS";
      
      public static const const_1966:String = "WE_UNFOCUSED";
      
      public static const const_1306:String = "WE_ACTIVATE";
      
      public static const const_580:String = "WE_ACTIVATED";
      
      public static const const_1806:String = "WE_DEACTIVATE";
      
      public static const const_527:String = "WE_DEACTIVATED";
      
      public static const const_332:String = "WE_SELECT";
      
      public static const const_48:String = "WE_SELECTED";
      
      public static const const_673:String = "WE_UNSELECT";
      
      public static const const_665:String = "WE_UNSELECTED";
      
      public static const const_1917:String = "WE_LOCK";
      
      public static const const_1742:String = "WE_LOCKED";
      
      public static const const_1792:String = "WE_UNLOCK";
      
      public static const const_1787:String = "WE_UNLOCKED";
      
      public static const const_950:String = "WE_ENABLE";
      
      public static const const_301:String = "WE_ENABLED";
      
      public static const const_806:String = "WE_DISABLE";
      
      public static const const_294:String = "WE_DISABLED";
      
      public static const WINDOW_EVENT_RELOCATE:String = "WE_RELOCATE";
      
      public static const const_406:String = "WE_RELOCATED";
      
      public static const const_1376:String = "WE_RESIZE";
      
      public static const const_40:String = "WE_RESIZED";
      
      public static const const_1912:String = "WE_MINIMIZE";
      
      public static const const_1940:String = "WE_MINIMIZED";
      
      public static const const_2001:String = "WE_MAXIMIZE";
      
      public static const const_2035:String = "WE_MAXIMIZED";
      
      public static const const_1932:String = "WE_RESTORE";
      
      public static const const_1926:String = "WE_RESTORED";
      
      public static const const_575:String = "WE_CHILD_ADDED";
      
      public static const const_412:String = "WE_CHILD_REMOVED";
      
      public static const const_216:String = "WE_CHILD_RELOCATED";
      
      public static const const_141:String = "WE_CHILD_RESIZED";
      
      public static const const_374:String = "WE_CHILD_ACTIVATED";
      
      public static const const_595:String = "WE_PARENT_ADDED";
      
      public static const const_1757:String = "WE_PARENT_REMOVED";
      
      public static const const_1768:String = "WE_PARENT_RELOCATED";
      
      public static const const_549:String = "WE_PARENT_RESIZED";
      
      public static const const_1403:String = "WE_PARENT_ACTIVATED";
      
      public static const const_174:String = "WE_OK";
      
      public static const const_512:String = "WE_CANCEL";
      
      public static const const_114:String = "WE_CHANGE";
      
      public static const const_602:String = "WE_SCROLL";
      
      public static const const_109:String = "";
      
      private static const POOL:Array = [];
       
      
      protected var _type:String;
      
      protected var _window:IWindow;
      
      protected var var_747:IWindow;
      
      protected var var_1144:Boolean;
      
      protected var var_506:Boolean;
      
      protected var var_166:Boolean;
      
      protected var var_748:Array;
      
      public function WindowEvent()
      {
         super();
      }
      
      public static function allocate(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false) : WindowEvent
      {
         var _loc5_:WindowEvent = POOL.length > 0 ? POOL.pop() : new WindowEvent();
         _loc5_._type = param1;
         _loc5_._window = param2;
         _loc5_.var_747 = param3;
         _loc5_.var_506 = param4;
         _loc5_.var_166 = false;
         _loc5_.var_748 = POOL;
         return _loc5_;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get target() : IWindow
      {
         return this._window;
      }
      
      public function get window() : IWindow
      {
         return this._window;
      }
      
      public function get related() : IWindow
      {
         return this.var_747;
      }
      
      public function get cancelable() : Boolean
      {
         return this.var_506;
      }
      
      public function recycle() : void
      {
         if(this.var_166)
         {
            throw new Error("Event already recycled!");
         }
         this.var_747 = null;
         this._window = null;
         this.var_166 = true;
         this.var_1144 = false;
         this.var_748.push(this);
      }
      
      public function clone() : WindowEvent
      {
         return allocate(this._type,this.window,this.related,this.cancelable);
      }
      
      public function preventDefault() : void
      {
         this.preventWindowOperation();
      }
      
      public function isDefaultPrevented() : Boolean
      {
         return this.var_1144;
      }
      
      public function preventWindowOperation() : void
      {
         if(this.cancelable)
         {
            this.var_1144 = true;
            return;
         }
         throw new Error("Attempted to prevent window operation that is not cancelable!");
      }
      
      public function isWindowOperationPrevented() : Boolean
      {
         return this.var_1144;
      }
      
      public function stopPropagation() : void
      {
         this.var_1144 = true;
      }
      
      public function stopImmediatePropagation() : void
      {
         this.var_1144 = true;
      }
      
      public function toString() : String
      {
         return "WindowEvent { type: " + this._type + " cancelable: " + this.var_506 + " window: " + this._window + " }";
      }
   }
}
