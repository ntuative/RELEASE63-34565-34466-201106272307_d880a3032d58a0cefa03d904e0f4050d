package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class HabboSearchResultData
   {
       
      
      private var var_2610:int;
      
      private var var_2036:String;
      
      private var var_2814:String;
      
      private var var_2974:Boolean;
      
      private var var_2977:Boolean;
      
      private var var_2976:int;
      
      private var var_2815:String;
      
      private var var_2975:String;
      
      private var var_1819:String;
      
      public function HabboSearchResultData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2610 = param1.readInteger();
         this.var_2036 = param1.readString();
         this.var_2814 = param1.readString();
         this.var_2974 = param1.readBoolean();
         this.var_2977 = param1.readBoolean();
         param1.readString();
         this.var_2976 = param1.readInteger();
         this.var_2815 = param1.readString();
         this.var_2975 = param1.readString();
         this.var_1819 = param1.readString();
      }
      
      public function get avatarId() : int
      {
         return this.var_2610;
      }
      
      public function get avatarName() : String
      {
         return this.var_2036;
      }
      
      public function get avatarMotto() : String
      {
         return this.var_2814;
      }
      
      public function get isAvatarOnline() : Boolean
      {
         return this.var_2974;
      }
      
      public function get canFollow() : Boolean
      {
         return this.var_2977;
      }
      
      public function get avatarGender() : int
      {
         return this.var_2976;
      }
      
      public function get avatarFigure() : String
      {
         return this.var_2815;
      }
      
      public function get lastOnlineDate() : String
      {
         return this.var_2975;
      }
      
      public function get realName() : String
      {
         return this.var_1819;
      }
   }
}
