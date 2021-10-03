package com.sulake.habbo.communication.messages.incoming.avatar
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import com.sulake.habbo.communication.messages.parser.avatar.ChangeUserNameResultMessageParser;
   
   public class ChangeUserNameResultMessageEvent extends MessageEvent implements IMessageEvent
   {
      
      public static var var_504:int = 0;
      
      public static var var_923:int = 1;
      
      public static var var_927:int = 2;
      
      public static var var_924:int = 3;
      
      public static var var_925:int = 4;
      
      public static var var_926:int = 5;
      
      public static var var_1139:int = 6;
      
      public static var var_1140:int = 7;
       
      
      public function ChangeUserNameResultMessageEvent(param1:Function)
      {
         super(param1,ChangeUserNameResultMessageParser);
      }
      
      public function getParser() : ChangeUserNameResultMessageParser
      {
         return var_10 as ChangeUserNameResultMessageParser;
      }
   }
}
