package com.sulake.core.runtime
{
   class ComponentInterfaceQueue implements IDisposable
   {
       
      
      private var var_2102:IID;
      
      private var var_1142:Boolean;
      
      private var var_1344:Array;
      
      function ComponentInterfaceQueue(param1:IID)
      {
         super();
         this.var_2102 = param1;
         this.var_1344 = new Array();
         this.var_1142 = false;
      }
      
      public function get identifier() : IID
      {
         return this.var_2102;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_1142;
      }
      
      public function get receivers() : Array
      {
         return this.var_1344;
      }
      
      public function dispose() : void
      {
         if(!this.var_1142)
         {
            this.var_1142 = true;
            this.var_2102 = null;
            while(this.var_1344.length > 0)
            {
               this.var_1344.pop();
            }
            this.var_1344 = null;
         }
      }
   }
}
