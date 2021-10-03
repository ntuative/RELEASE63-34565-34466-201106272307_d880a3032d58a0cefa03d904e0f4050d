package com.sulake.habbo.communication.messages.outgoing.handshake
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class InitCryptoMessageComposer implements IMessageComposer
   {
       
      
      private var var_197:Array;
      
      public function InitCryptoMessageComposer(param1:int)
      {
         super();
         this.var_197 = new Array();
         this.var_197.push(param1);
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return this.var_197;
      }
   }
}
