package com.sulake.habbo.communication.encryption
{
   import com.hurlant.math.BigInteger;
   import com.sulake.core.communication.handshake.IKeyExchange;
   import com.sulake.core.utils.ErrorReportStorage;
   
   public class DiffieHellman implements IKeyExchange
   {
       
      
      private var var_1136:BigInteger;
      
      private var var_2798:BigInteger;
      
      private var var_2179:BigInteger;
      
      private var var_3019:BigInteger;
      
      private var var_1687:BigInteger;
      
      private var var_2180:BigInteger;
      
      public function DiffieHellman(param1:BigInteger, param2:BigInteger)
      {
         super();
         this.var_1687 = param1;
         this.var_2180 = param2;
      }
      
      public function init(param1:String, param2:uint = 16) : Boolean
      {
         ErrorReportStorage.addDebugData("DiffieHellman","Prime: " + this.var_1687.toString() + ",generator: " + this.var_2180.toString() + ",secret: " + param1);
         this.var_1136 = new BigInteger();
         this.var_1136.fromRadix(param1,param2);
         this.var_2798 = this.var_2180.modPow(this.var_1136,this.var_1687);
         return true;
      }
      
      public function generateSharedKey(param1:String, param2:uint = 16) : String
      {
         this.var_2179 = new BigInteger();
         this.var_2179.fromRadix(param1,param2);
         this.var_3019 = this.var_2179.modPow(this.var_1136,this.var_1687);
         return this.getSharedKey(param2);
      }
      
      public function getPublicKey(param1:uint = 16) : String
      {
         return this.var_2798.toRadix(param1);
      }
      
      public function getSharedKey(param1:uint = 16) : String
      {
         return this.var_3019.toRadix(param1);
      }
   }
}
