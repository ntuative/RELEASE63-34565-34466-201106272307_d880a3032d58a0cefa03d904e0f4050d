package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class PerformanceLogMessageComposer implements IMessageComposer
   {
       
      
      private var var_2630:int = 0;
      
      private var var_1446:String = "";
      
      private var var_1748:String = "";
      
      private var var_2342:String = "";
      
      private var var_2627:String = "";
      
      private var var_1898:int = 0;
      
      private var var_2629:int = 0;
      
      private var var_2628:int = 0;
      
      private var var_1447:int = 0;
      
      private var var_2626:int = 0;
      
      private var var_1449:int = 0;
      
      public function PerformanceLogMessageComposer(param1:int, param2:String, param3:String, param4:String, param5:String, param6:Boolean, param7:int, param8:int, param9:int, param10:int, param11:int)
      {
         super();
         this.var_2630 = param1;
         this.var_1446 = param2;
         this.var_1748 = param3;
         this.var_2342 = param4;
         this.var_2627 = param5;
         if(param6)
         {
            this.var_1898 = 1;
         }
         else
         {
            this.var_1898 = 0;
         }
         this.var_2629 = param7;
         this.var_2628 = param8;
         this.var_1447 = param9;
         this.var_2626 = param10;
         this.var_1449 = param11;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2630,this.var_1446,this.var_1748,this.var_2342,this.var_2627,this.var_1898,this.var_2629,this.var_2628,this.var_1447,this.var_2626,this.var_1449];
      }
   }
}
