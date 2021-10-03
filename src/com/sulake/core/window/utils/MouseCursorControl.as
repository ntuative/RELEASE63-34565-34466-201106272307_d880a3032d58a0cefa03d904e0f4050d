package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.MouseCursorType;
   import flash.display.DisplayObject;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.ui.Mouse;
   import flash.ui.MouseCursor;
   import flash.utils.Dictionary;
   
   public class MouseCursorControl
   {
      
      private static var _type:uint = MouseCursorType.const_30;
      
      private static var var_155:Stage;
      
      private static var var_327:Boolean = true;
      
      private static var _disposed:Boolean = false;
      
      private static var var_843:Boolean = true;
      
      private static var var_132:DisplayObject;
      
      private static var var_1532:Dictionary = new Dictionary();
       
      
      public function MouseCursorControl(param1:DisplayObject)
      {
         super();
         var_155 = param1.stage;
      }
      
      public static function dispose() : void
      {
         if(!_disposed)
         {
            if(var_132)
            {
               var_155.removeChild(var_132);
               var_155.removeEventListener(Event.MOUSE_LEAVE,onStageMouseLeave);
               var_155.removeEventListener(MouseEvent.MOUSE_MOVE,onStageMouseMove);
               var_155.removeEventListener(MouseEvent.MOUSE_OVER,onStageMouseMove);
               var_155.removeEventListener(MouseEvent.MOUSE_OUT,onStageMouseMove);
            }
            _disposed = true;
         }
      }
      
      public static function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public static function get type() : uint
      {
         return _type;
      }
      
      public static function set type(param1:uint) : void
      {
         if(_type != param1)
         {
            _type = param1;
            var_843 = true;
         }
      }
      
      public static function get visible() : Boolean
      {
         return var_327;
      }
      
      public static function set visible(param1:Boolean) : void
      {
         var_327 = param1;
         if(var_327)
         {
            if(var_132)
            {
               var_132.visible = true;
            }
            else
            {
               Mouse.show();
            }
         }
         else if(var_132)
         {
            var_132.visible = false;
         }
         else
         {
            Mouse.hide();
         }
      }
      
      public static function change() : void
      {
         var _loc1_:* = null;
         if(var_843)
         {
            _loc1_ = var_1532[_type];
            if(_loc1_)
            {
               if(var_132)
               {
                  var_155.removeChild(var_132);
               }
               else
               {
                  var_155.addEventListener(Event.MOUSE_LEAVE,onStageMouseLeave);
                  var_155.addEventListener(MouseEvent.MOUSE_MOVE,onStageMouseMove);
                  var_155.addEventListener(MouseEvent.MOUSE_OVER,onStageMouseMove);
                  var_155.addEventListener(MouseEvent.MOUSE_OUT,onStageMouseMove);
                  Mouse.hide();
               }
               var_132 = _loc1_;
               var_155.addChild(var_132);
            }
            else
            {
               if(var_132)
               {
                  var_155.removeChild(var_132);
                  var_155.removeEventListener(Event.MOUSE_LEAVE,onStageMouseLeave);
                  var_155.removeEventListener(MouseEvent.MOUSE_MOVE,onStageMouseMove);
                  var_155.removeEventListener(MouseEvent.MOUSE_OVER,onStageMouseMove);
                  var_155.removeEventListener(MouseEvent.MOUSE_OUT,onStageMouseMove);
                  var_132 = null;
                  Mouse.show();
               }
               switch(_type)
               {
                  case MouseCursorType.const_30:
                  case MouseCursorType.ARROW:
                     Mouse.cursor = MouseCursor.ARROW;
                     break;
                  case MouseCursorType.const_322:
                     Mouse.cursor = MouseCursor.BUTTON;
                     break;
                  case MouseCursorType.const_954:
                  case MouseCursorType.const_246:
                  case MouseCursorType.const_1797:
                  case MouseCursorType.const_1766:
                     Mouse.cursor = MouseCursor.HAND;
                     break;
                  case MouseCursorType.NONE:
                     Mouse.cursor = MouseCursor.ARROW;
                     Mouse.hide();
               }
            }
            var_843 = false;
         }
      }
      
      public static function defineCustomCursorType(param1:uint, param2:DisplayObject) : void
      {
         var_1532[param1] = param2;
      }
      
      private static function onStageMouseMove(param1:MouseEvent) : void
      {
         if(var_132)
         {
            var_132.x = param1.stageX - 2;
            var_132.y = param1.stageY;
            if(_type == MouseCursorType.const_30)
            {
               var_327 = false;
               Mouse.show();
            }
            else
            {
               var_327 = true;
               Mouse.hide();
            }
         }
      }
      
      private static function onStageMouseLeave(param1:Event) : void
      {
         if(var_132 && _type != MouseCursorType.const_30)
         {
            Mouse.hide();
            var_327 = false;
         }
      }
   }
}
