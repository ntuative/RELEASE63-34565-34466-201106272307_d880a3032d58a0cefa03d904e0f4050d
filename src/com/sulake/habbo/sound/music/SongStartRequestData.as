package com.sulake.habbo.sound.music
{
   import flash.utils.getTimer;
   
   public class SongStartRequestData
   {
       
      
      private var var_1742:int;
      
      private var var_1921:Number;
      
      private var var_2661:Number;
      
      private var var_2658:int;
      
      private var var_2660:Number;
      
      private var var_2659:Number;
      
      public function SongStartRequestData(param1:int, param2:Number, param3:Number, param4:Number = 2.0, param5:Number = 1.0)
      {
         super();
         this.var_1742 = param1;
         this.var_1921 = param2;
         this.var_2661 = param3;
         this.var_2660 = param4;
         this.var_2659 = param5;
         this.var_2658 = getTimer();
      }
      
      public function get songId() : int
      {
         return this.var_1742;
      }
      
      public function get startPos() : Number
      {
         if(this.var_1921 < 0)
         {
            return 0;
         }
         return this.var_1921 + (getTimer() - this.var_2658) / 1000;
      }
      
      public function get playLength() : Number
      {
         return this.var_2661;
      }
      
      public function get fadeInSeconds() : Number
      {
         return this.var_2660;
      }
      
      public function get fadeOutSeconds() : Number
      {
         return this.var_2659;
      }
   }
}
