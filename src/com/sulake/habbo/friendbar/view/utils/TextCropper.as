package com.sulake.habbo.friendbar.view.utils
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.components.ITextWindow;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   
   public class TextCropper implements IDisposable
   {
       
      
      private var _disposed:Boolean = false;
      
      private var var_575:TextField;
      
      private var var_1078:TextFormat;
      
      private var var_3085:String = "...";
      
      private var var_3086:int = 20;
      
      public function TextCropper()
      {
         super();
         this.var_575 = new TextField();
         this.var_575.autoSize = TextFieldAutoSize.LEFT;
         this.var_1078 = this.var_575.defaultTextFormat;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            this.var_575 = null;
            this._disposed = true;
         }
      }
      
      public function crop(param1:ITextWindow) : void
      {
         var _loc3_:int = 0;
         this.var_1078.font = param1.fontFace;
         this.var_1078.size = param1.fontSize;
         this.var_1078.bold = param1.bold;
         this.var_1078.italic = param1.italic;
         this.var_575.setTextFormat(this.var_1078);
         this.var_575.text = param1.getLineText(0);
         var _loc2_:int = this.var_575.textWidth;
         if(_loc2_ > param1.width)
         {
            _loc3_ = this.var_575.getCharIndexAtPoint(param1.width - this.var_3086,this.var_575.textHeight / 2);
            param1.text = param1.text.slice(0,_loc3_) + this.var_3085;
         }
      }
   }
}
