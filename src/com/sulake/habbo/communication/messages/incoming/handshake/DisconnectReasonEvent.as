package com.sulake.habbo.communication.messages.incoming.handshake
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import com.sulake.habbo.communication.messages.parser.handshake.DisconnectReasonParser;
   
   public class DisconnectReasonEvent extends MessageEvent implements IMessageEvent
   {
      
      public static const const_2109:int = 0;
      
      public static const const_1859:int = 1;
      
      public static const const_1869:int = 2;
      
      public static const const_2312:int = 3;
      
      public static const const_2125:int = 4;
      
      public static const const_2182:int = 5;
      
      public static const const_1834:int = 10;
      
      public static const const_2220:int = 11;
      
      public static const const_2282:int = 12;
      
      public static const const_2175:int = 13;
      
      public static const const_2301:int = 16;
      
      public static const const_2194:int = 17;
      
      public static const const_2107:int = 18;
      
      public static const const_2243:int = 19;
      
      public static const const_2240:int = 20;
      
      public static const const_2225:int = 22;
      
      public static const const_2148:int = 23;
      
      public static const const_2207:int = 24;
      
      public static const const_2264:int = 25;
      
      public static const const_2153:int = 26;
      
      public static const const_2252:int = 27;
      
      public static const const_2144:int = 28;
      
      public static const const_2200:int = 29;
      
      public static const const_2286:int = 100;
      
      public static const const_2177:int = 101;
      
      public static const const_2170:int = 102;
      
      public static const const_2278:int = 103;
      
      public static const const_2209:int = 104;
      
      public static const const_2145:int = 105;
      
      public static const const_2138:int = 106;
      
      public static const const_2229:int = 107;
      
      public static const const_2215:int = 108;
      
      public static const const_2161:int = 109;
      
      public static const const_2256:int = 110;
      
      public static const const_2323:int = 111;
      
      public static const const_2147:int = 112;
      
      public static const const_2331:int = 113;
      
      public static const const_2128:int = 114;
      
      public static const const_2307:int = 115;
      
      public static const const_2213:int = 116;
      
      public static const const_2141:int = 117;
      
      public static const const_2120:int = 118;
      
      public static const const_2140:int = 119;
       
      
      public function DisconnectReasonEvent(param1:Function)
      {
         super(param1,DisconnectReasonParser);
      }
      
      public function get reason() : int
      {
         return (this.var_10 as DisconnectReasonParser).reason;
      }
      
      public function get reasonString() : String
      {
         switch(this.reason)
         {
            case const_1859:
            case const_1834:
               return "banned";
            case const_1869:
               return "concurrentlogin";
            default:
               return "logout";
         }
      }
   }
}
