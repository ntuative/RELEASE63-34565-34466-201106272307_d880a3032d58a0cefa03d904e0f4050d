package com.sulake.core.runtime
{
   import flash.utils.getQualifiedClassName;
   
   final class InterfaceStruct implements IDisposable
   {
       
      
      private var var_1487:IID;
      
      private var var_1823:String;
      
      private var var_122:IUnknown;
      
      private var var_797:uint;
      
      function InterfaceStruct(param1:IID, param2:IUnknown)
      {
         super();
         this.var_1487 = param1;
         this.var_1823 = getQualifiedClassName(this.var_1487);
         this.var_122 = param2;
         this.var_797 = 0;
      }
      
      public function get iid() : IID
      {
         return this.var_1487;
      }
      
      public function get iis() : String
      {
         return this.var_1823;
      }
      
      public function get unknown() : IUnknown
      {
         return this.var_122;
      }
      
      public function get references() : uint
      {
         return this.var_797;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_122 == null;
      }
      
      public function dispose() : void
      {
         this.var_1487 = null;
         this.var_1823 = null;
         this.var_122 = null;
         this.var_797 = 0;
      }
      
      public function reserve() : uint
      {
         return ++this.var_797;
      }
      
      public function release() : uint
      {
         return this.references > 0 ? uint(--this.var_797) : uint(0);
      }
   }
}
