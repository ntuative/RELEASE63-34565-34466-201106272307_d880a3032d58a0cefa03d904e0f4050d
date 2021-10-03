package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   
   public class WindowKeyboardEvent extends WindowEvent
   {
      
      public static const const_344:String = "WKE_KEY_UP";
      
      public static const const_185:String = "WKE_KEY_DOWN";
      
      private static const POOL:Array = [];
       
      
      private var var_784:KeyboardEvent;
      
      public function WindowKeyboardEvent()
      {
         super();
      }
      
      public static function allocate(param1:String, param2:Event, param3:IWindow, param4:IWindow, param5:Boolean = false) : WindowKeyboardEvent
      {
         var _loc6_:WindowKeyboardEvent = POOL.length > 0 ? POOL.pop() : new WindowKeyboardEvent();
         _loc6_._type = param1;
         _loc6_.var_784 = param2 as KeyboardEvent;
         _loc6_._window = param3;
         _loc6_.var_747 = param4;
         _loc6_.var_166 = false;
         _loc6_.var_506 = param5;
         _loc6_.var_748 = POOL;
         return _loc6_;
      }
      
      public function get charCode() : uint
      {
         return this.var_784.charCode;
      }
      
      public function get keyCode() : uint
      {
         return this.var_784.keyCode;
      }
      
      public function get keyLocation() : uint
      {
         return this.var_784.keyLocation;
      }
      
      public function get altKey() : Boolean
      {
         return this.var_784.altKey;
      }
      
      public function get shiftKey() : Boolean
      {
         return this.var_784.shiftKey;
      }
      
      override public function clone() : WindowEvent
      {
         return allocate(_type,this.var_784,window,related,cancelable);
      }
      
      override public function toString() : String
      {
         return "WindowKeyboardEvent { type: " + _type + " cancelable: " + var_506 + " window: " + _window + " charCode: " + this.charCode + " }";
      }
   }
}
