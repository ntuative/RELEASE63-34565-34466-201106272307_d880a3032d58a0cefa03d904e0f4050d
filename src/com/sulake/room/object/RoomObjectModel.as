package com.sulake.room.object
{
   import flash.utils.Dictionary;
   
   public class RoomObjectModel implements IRoomObjectModelController
   {
       
      
      private var var_633:Dictionary;
      
      private var var_632:Dictionary;
      
      private var var_631:Dictionary;
      
      private var var_630:Dictionary;
      
      private var var_1475:Array;
      
      private var var_1474:Array;
      
      private var _numberArrayReadOnlyList:Array;
      
      private var _stringArrayReadOnlyList:Array;
      
      private var _updateID:int;
      
      public function RoomObjectModel()
      {
         super();
         this.var_633 = new Dictionary();
         this.var_632 = new Dictionary();
         this.var_631 = new Dictionary();
         this.var_630 = new Dictionary();
         this.var_1475 = [];
         this.var_1474 = [];
         this._numberArrayReadOnlyList = [];
         this._stringArrayReadOnlyList = [];
         this._updateID = 0;
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         if(this.var_633 != null)
         {
            for(_loc1_ in this.var_633)
            {
               delete this.var_633[_loc1_];
            }
            this.var_633 = null;
         }
         if(this.var_632 != null)
         {
            for(_loc1_ in this.var_632)
            {
               delete this.var_632[_loc1_];
            }
            this.var_632 = null;
         }
         if(this.var_631 != null)
         {
            for(_loc1_ in this.var_631)
            {
               delete this.var_631[_loc1_];
            }
            this.var_631 = null;
         }
         if(this.var_630 != null)
         {
            for(_loc1_ in this.var_630)
            {
               delete this.var_630[_loc1_];
            }
            this.var_630 = null;
         }
         this.var_1474 = [];
         this.var_1475 = [];
         this._stringArrayReadOnlyList = [];
         this._numberArrayReadOnlyList = [];
      }
      
      public function getNumber(param1:String) : Number
      {
         return this.var_633[param1];
      }
      
      public function getString(param1:String) : String
      {
         return this.var_632[param1];
      }
      
      public function getNumberArray(param1:String) : Array
      {
         var _loc2_:Array = this.var_631[param1];
         if(_loc2_ != null)
         {
            _loc2_ = _loc2_.slice();
         }
         return _loc2_;
      }
      
      public function getStringArray(param1:String) : Array
      {
         var _loc2_:Array = this.var_630[param1];
         if(_loc2_ != null)
         {
            _loc2_ = _loc2_.slice();
         }
         return _loc2_;
      }
      
      public function setNumber(param1:String, param2:Number, param3:Boolean = false) : void
      {
         if(this.var_1475.indexOf(param1) >= 0)
         {
            return;
         }
         if(param3)
         {
            this.var_1475.push(param1);
         }
         if(this.var_633[param1] != param2)
         {
            this.var_633[param1] = param2;
            ++this._updateID;
         }
      }
      
      public function setString(param1:String, param2:String, param3:Boolean = false) : void
      {
         if(this.var_1474.indexOf(param1) >= 0)
         {
            return;
         }
         if(param3)
         {
            this.var_1474.push(param1);
         }
         if(this.var_632[param1] != param2)
         {
            this.var_632[param1] = param2;
            ++this._updateID;
         }
      }
      
      public function setNumberArray(param1:String, param2:Array, param3:Boolean = false) : void
      {
         if(param2 == null)
         {
            return;
         }
         if(this._numberArrayReadOnlyList.indexOf(param1) >= 0)
         {
            return;
         }
         if(param3)
         {
            this._numberArrayReadOnlyList.push(param1);
         }
         var _loc4_:* = [];
         var _loc5_:int = 0;
         _loc5_ = 0;
         while(_loc5_ < param2.length)
         {
            if(param2[_loc5_] is Number)
            {
               _loc4_.push(param2[_loc5_]);
            }
            _loc5_++;
         }
         var _loc6_:Array = this.var_631[param1];
         var _loc7_:Boolean = true;
         if(_loc6_ != null && _loc6_.length == _loc4_.length)
         {
            _loc5_ = _loc4_.length - 1;
            while(_loc5_ >= 0)
            {
               if(_loc4_[_loc5_] as Number != _loc6_[_loc5_] as Number)
               {
                  _loc7_ = false;
                  break;
               }
               _loc5_--;
            }
         }
         else
         {
            _loc7_ = false;
         }
         if(_loc7_)
         {
            return;
         }
         this.var_631[param1] = _loc4_;
         ++this._updateID;
      }
      
      public function setStringArray(param1:String, param2:Array, param3:Boolean = false) : void
      {
         if(param2 == null)
         {
            return;
         }
         if(this._stringArrayReadOnlyList.indexOf(param1) >= 0)
         {
            return;
         }
         if(param3)
         {
            this._stringArrayReadOnlyList.push(param1);
         }
         var _loc4_:* = [];
         var _loc5_:int = 0;
         _loc5_ = 0;
         while(_loc5_ < param2.length)
         {
            if(param2[_loc5_] is String)
            {
               _loc4_.push(param2[_loc5_]);
            }
            _loc5_++;
         }
         var _loc6_:Array = this.var_630[param1];
         var _loc7_:Boolean = true;
         if(_loc6_ != null && _loc6_.length == _loc4_.length)
         {
            _loc5_ = _loc4_.length - 1;
            while(_loc5_ >= 0)
            {
               if(_loc4_[_loc5_] as String != _loc6_[_loc5_] as String)
               {
                  _loc7_ = false;
                  break;
               }
               _loc5_--;
            }
         }
         else
         {
            _loc7_ = false;
         }
         if(_loc7_)
         {
            return;
         }
         this.var_630[param1] = _loc4_;
         ++this._updateID;
      }
      
      public function getUpdateID() : int
      {
         return this._updateID;
      }
   }
}
