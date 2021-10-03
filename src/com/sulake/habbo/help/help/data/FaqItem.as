package com.sulake.habbo.help.help.data
{
   public class FaqItem
   {
       
      
      private var var_1981:int;
      
      private var var_2650:String;
      
      private var var_1980:String;
      
      private var _index:int;
      
      private var _category:FaqCategory;
      
      private var var_2649:Boolean = false;
      
      public function FaqItem(param1:int, param2:String, param3:int, param4:FaqCategory)
      {
         super();
         this.var_1981 = param1;
         this.var_2650 = param2;
         this._index = param3;
         this._category = param4;
      }
      
      public function get questionId() : int
      {
         return this.var_1981;
      }
      
      public function get questionText() : String
      {
         return this.var_2650;
      }
      
      public function get answerText() : String
      {
         return this.var_1980;
      }
      
      public function get hasAnswer() : Boolean
      {
         return this.var_2649;
      }
      
      public function get index() : int
      {
         return this._index;
      }
      
      public function get category() : FaqCategory
      {
         return this._category;
      }
      
      public function set answerText(param1:String) : void
      {
         this.var_1980 = param1;
         this.var_2649 = true;
      }
   }
}
