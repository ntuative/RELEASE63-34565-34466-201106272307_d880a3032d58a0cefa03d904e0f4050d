package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class PublicRoomData implements IDisposable
   {
       
      
      private var var_2311:String;
      
      private var var_2312:int;
      
      private var var_2310:int;
      
      private var var_2314:String;
      
      private var var_2313:int;
      
      private var var_2166:int;
      
      private var _disposed:Boolean;
      
      public function PublicRoomData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2311 = param1.readString();
         this.var_2312 = param1.readInteger();
         this.var_2310 = param1.readInteger();
         this.var_2314 = param1.readString();
         this.var_2313 = param1.readInteger();
         this.var_2166 = param1.readInteger();
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get unitPropertySet() : String
      {
         return this.var_2311;
      }
      
      public function get unitPort() : int
      {
         return this.var_2312;
      }
      
      public function get worldId() : int
      {
         return this.var_2310;
      }
      
      public function get castLibs() : String
      {
         return this.var_2314;
      }
      
      public function get maxUsers() : int
      {
         return this.var_2313;
      }
      
      public function get nodeId() : int
      {
         return this.var_2166;
      }
   }
}
