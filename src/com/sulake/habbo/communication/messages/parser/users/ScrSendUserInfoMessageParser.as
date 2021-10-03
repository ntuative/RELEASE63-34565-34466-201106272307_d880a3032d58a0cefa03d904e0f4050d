package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ScrSendUserInfoMessageParser implements IMessageParser
   {
      
      public static const const_2173:int = 1;
      
      public static const RESPONSE_TYPE_PURCHASE:int = 2;
      
      public static const const_1407:int = 3;
       
      
      private var var_1017:String;
      
      private var var_2506:int;
      
      private var var_2513:int;
      
      private var var_2508:int;
      
      private var var_2503:int;
      
      private var var_2507:Boolean;
      
      private var var_2511:Boolean;
      
      private var var_2509:int;
      
      private var var_2504:int;
      
      private var var_2512:Boolean;
      
      private var var_2505:int;
      
      private var var_2510:int;
      
      public function ScrSendUserInfoMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1017 = param1.readString();
         this.var_2506 = param1.readInteger();
         this.var_2513 = param1.readInteger();
         this.var_2508 = param1.readInteger();
         this.var_2503 = param1.readInteger();
         this.var_2507 = param1.readBoolean();
         this.var_2511 = param1.readBoolean();
         this.var_2509 = param1.readInteger();
         this.var_2504 = param1.readInteger();
         this.var_2512 = param1.readBoolean();
         this.var_2505 = param1.readInteger();
         this.var_2510 = param1.readInteger();
         return true;
      }
      
      public function get productName() : String
      {
         return this.var_1017;
      }
      
      public function get daysToPeriodEnd() : int
      {
         return this.var_2506;
      }
      
      public function get memberPeriods() : int
      {
         return this.var_2513;
      }
      
      public function get periodsSubscribedAhead() : int
      {
         return this.var_2508;
      }
      
      public function get responseType() : int
      {
         return this.var_2503;
      }
      
      public function get hasEverBeenMember() : Boolean
      {
         return this.var_2507;
      }
      
      public function get isVIP() : Boolean
      {
         return this.var_2511;
      }
      
      public function get pastClubDays() : int
      {
         return this.var_2509;
      }
      
      public function get pastVipDays() : int
      {
         return this.var_2504;
      }
      
      public function get isShowBasicPromo() : Boolean
      {
         return this.var_2512;
      }
      
      public function get basicNormalPrice() : int
      {
         return this.var_2505;
      }
      
      public function get basicPromoPrice() : int
      {
         return this.var_2510;
      }
   }
}
