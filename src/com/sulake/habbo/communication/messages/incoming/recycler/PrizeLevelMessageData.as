package com.sulake.habbo.communication.messages.incoming.recycler
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class PrizeLevelMessageData
   {
       
      
      private var var_1541:int;
      
      private var var_2849:int;
      
      private var var_730:Array;
      
      public function PrizeLevelMessageData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1541 = param1.readInteger();
         this.var_2849 = param1.readInteger();
         this.var_730 = new Array();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            this.var_730.push(new PrizeMessageData(param1));
            _loc3_++;
         }
      }
      
      public function get prizeLevelId() : int
      {
         return this.var_1541;
      }
      
      public function get probabilityDenominator() : int
      {
         return this.var_2849;
      }
      
      public function get prizes() : Array
      {
         return this.var_730;
      }
   }
}
