package com.sulake.habbo.communication.messages.parser.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class GiftWrappingConfigurationParser implements IMessageParser
   {
       
      
      private var var_2905:Boolean;
      
      private var var_2906:int;
      
      private var var_1888:Array;
      
      private var var_830:Array;
      
      private var var_828:Array;
      
      public function GiftWrappingConfigurationParser()
      {
         super();
      }
      
      public function get isWrappingEnabled() : Boolean
      {
         return this.var_2905;
      }
      
      public function get wrappingPrice() : int
      {
         return this.var_2906;
      }
      
      public function get stuffTypes() : Array
      {
         return this.var_1888;
      }
      
      public function get boxTypes() : Array
      {
         return this.var_830;
      }
      
      public function get ribbonTypes() : Array
      {
         return this.var_828;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc2_:int = 0;
         this.var_1888 = [];
         this.var_830 = [];
         this.var_828 = [];
         this.var_2905 = param1.readBoolean();
         this.var_2906 = param1.readInteger();
         var _loc3_:int = param1.readInteger();
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            this.var_1888.push(param1.readInteger());
            _loc2_++;
         }
         _loc3_ = param1.readInteger();
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            this.var_830.push(param1.readInteger());
            _loc2_++;
         }
         _loc3_ = param1.readInteger();
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            this.var_828.push(param1.readInteger());
            _loc2_++;
         }
         return true;
      }
   }
}
