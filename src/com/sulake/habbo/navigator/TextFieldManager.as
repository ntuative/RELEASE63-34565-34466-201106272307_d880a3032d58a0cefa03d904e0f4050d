package com.sulake.habbo.navigator
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowKeyboardEvent;
   import flash.geom.Point;
   import flash.ui.Keyboard;
   
   public class TextFieldManager
   {
       
      
      private var _navigator:HabboNavigator;
      
      private var var_70:ITextFieldWindow;
      
      private var var_721:Boolean;
      
      private var var_1652:String = "";
      
      private var var_2136:int;
      
      private var var_2135:Function;
      
      private var var_2941:String = "";
      
      private var var_115:IWindowContainer;
      
      private var _orgTextBackground:Boolean;
      
      private var var_2942:uint;
      
      private var _orgTextColor:uint;
      
      public function TextFieldManager(param1:HabboNavigator, param2:ITextFieldWindow, param3:int = 1000, param4:Function = null, param5:String = null)
      {
         super();
         this._navigator = param1;
         this.var_70 = param2;
         this.var_2136 = param3;
         this.var_2135 = param4;
         if(param5 != null)
         {
            this.var_721 = true;
            this.var_1652 = param5;
            this.var_70.text = param5;
         }
         Util.setProcDirectly(this.var_70,this.onInputClick);
         this.var_70.addEventListener(WindowKeyboardEvent.const_185,this.checkEnterPress);
         this.var_70.addEventListener(WindowEvent.const_114,this.checkMaxLen);
         this._orgTextBackground = this.var_70.textBackground;
         this.var_2942 = this.var_70.textBackgroundColor;
         this._orgTextColor = this.var_70.textColor;
      }
      
      public function dispose() : void
      {
         if(this.var_70)
         {
            this.var_70.dispose();
            this.var_70 = null;
         }
         if(this.var_115)
         {
            this.var_115.dispose();
            this.var_115 = null;
         }
         this._navigator = null;
      }
      
      public function checkMandatory(param1:String) : Boolean
      {
         if(!this.isInputValid())
         {
            this.displayError(param1);
            return false;
         }
         this.restoreBackground();
         return true;
      }
      
      public function restoreBackground() : void
      {
         this.var_70.textBackground = this._orgTextBackground;
         this.var_70.textBackgroundColor = this.var_2942;
         this.var_70.textColor = this._orgTextColor;
      }
      
      public function displayError(param1:String) : void
      {
         this.var_70.textBackground = true;
         this.var_70.textBackgroundColor = 4294021019;
         this.var_70.textColor = 4278190080;
         if(this.var_115 == null)
         {
            this.var_115 = IWindowContainer(this._navigator.getXmlWindow("nav_error_popup"));
            this._navigator.refreshButton(this.var_115,"popup_arrow_down",true,null,0);
            IWindowContainer(this.var_70.parent).addChild(this.var_115);
         }
         var _loc2_:ITextWindow = ITextWindow(this.var_115.findChildByName("error_text"));
         _loc2_.text = param1;
         _loc2_.width = _loc2_.textWidth + 5;
         this.var_115.findChildByName("border").width = _loc2_.width + 15;
         this.var_115.width = _loc2_.width + 15;
         var _loc3_:Point = new Point();
         this.var_70.getLocalPosition(_loc3_);
         this.var_115.x = _loc3_.x;
         this.var_115.y = _loc3_.y - this.var_115.height + 3;
         var _loc4_:IWindow = this.var_115.findChildByName("popup_arrow_down");
         _loc4_.x = this.var_115.width / 2 - _loc4_.width / 2;
         this.var_115.x += (this.var_70.width - this.var_115.width) / 2;
         this.var_115.visible = true;
      }
      
      public function goBackToInitialState() : void
      {
         this.clearErrors();
         if(this.var_1652 != null)
         {
            this.var_70.text = this.var_1652;
            this.var_721 = true;
         }
         else
         {
            this.var_70.text = "";
            this.var_721 = false;
         }
      }
      
      public function getText() : String
      {
         if(this.var_721)
         {
            return this.var_2941;
         }
         return this.var_70.text;
      }
      
      public function setText(param1:String) : void
      {
         this.var_721 = false;
         this.var_70.text = param1;
      }
      
      public function clearErrors() : void
      {
         this.restoreBackground();
         if(this.var_115 != null)
         {
            this.var_115.visible = false;
         }
      }
      
      public function get input() : ITextFieldWindow
      {
         return this.var_70;
      }
      
      private function isInputValid() : Boolean
      {
         return !this.var_721 && Util.trim(this.getText()).length > 2;
      }
      
      private function onInputClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowEvent.const_381)
         {
            return;
         }
         if(!this.var_721)
         {
            return;
         }
         this.var_70.text = this.var_2941;
         this.var_721 = false;
         this.restoreBackground();
      }
      
      private function checkEnterPress(param1:WindowKeyboardEvent) : void
      {
         if(param1.charCode == Keyboard.ENTER)
         {
            if(this.var_2135 != null)
            {
               this.var_2135();
            }
         }
      }
      
      private function checkMaxLen(param1:WindowEvent) : void
      {
         var _loc2_:String = this.var_70.text;
         if(_loc2_.length > this.var_2136)
         {
            this.var_70.text = _loc2_.substring(0,this.var_2136);
         }
      }
   }
}
