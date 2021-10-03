package com.sulake.habbo.room.object
{
   import com.sulake.core.utils.Map;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   import com.sulake.room.utils.XMLValidator;
   import flash.geom.Point;
   
   public class RoomPlaneParser
   {
      
      private static const const_730:Number = 0.25;
      
      private static const const_1387:Number = 0.25;
      
      public static const const_69:int = -110;
      
      public static const const_113:int = -100;
       
      
      private var var_123:Array;
      
      private var _tileMatrixOriginal:Array;
      
      private var var_234:int = 0;
      
      private var _height:int = 0;
      
      private var _minX:int = 0;
      
      private var var_495:int = 0;
      
      private var var_496:int = 0;
      
      private var var_494:int = 0;
      
      private var var_162:Array;
      
      private var var_1681:Number = 0.0;
      
      private var var_1641:Number = 1.0;
      
      private var var_1133:Number = 1.0;
      
      private var var_981:Number = 0.0;
      
      private var var_352:Map = null;
      
      private var var_595:Array;
      
      public function RoomPlaneParser()
      {
         this.var_123 = [];
         this._tileMatrixOriginal = [];
         this.var_162 = [];
         this.var_595 = [];
         super();
         this.var_1681 = 3.6;
         this.var_1641 = 1;
         this.var_1133 = 1;
         this.var_352 = new Map();
      }
      
      private static function getFloorHeight(param1:Array) : Number
      {
         var _loc8_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:int = param1.length;
         if(_loc5_ == 0)
         {
            return 0;
         }
         var _loc7_:* = 0;
         _loc3_ = 0;
         while(_loc3_ < _loc5_)
         {
            _loc4_ = param1[_loc3_] as Array;
            _loc2_ = 0;
            while(_loc2_ < _loc4_.length)
            {
               _loc8_ = Number(_loc4_[_loc2_]);
               if(_loc8_ > _loc7_)
               {
                  _loc7_ = Number(_loc8_);
               }
               _loc2_++;
            }
            _loc3_++;
         }
         return _loc7_;
      }
      
      private static function findEntranceTile(param1:Array) : Point
      {
         if(param1 == null)
         {
            return null;
         }
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:int = param1.length;
         if(_loc5_ == 0)
         {
            return null;
         }
         var _loc6_:* = [];
         _loc3_ = 0;
         while(_loc3_ < _loc5_)
         {
            _loc4_ = param1[_loc3_] as Array;
            if(_loc4_ == null || _loc4_.length == 0)
            {
               return null;
            }
            _loc2_ = 0;
            while(_loc2_ < _loc4_.length)
            {
               if(Number(_loc4_[_loc2_]) >= 0)
               {
                  _loc6_.push(_loc2_);
                  break;
               }
               _loc2_++;
            }
            if(_loc6_.length < _loc3_ + 1)
            {
               _loc6_.push(_loc4_.length + 1);
            }
            _loc3_++;
         }
         _loc3_ = 1;
         while(_loc3_ < _loc6_.length - 1)
         {
            if(int(_loc6_[_loc3_]) <= int(_loc6_[_loc3_ - 1]) - 1 && int(_loc6_[_loc3_]) <= int(_loc6_[_loc3_ + 1]) - 1)
            {
               return new Point(int(_loc6_[_loc3_]),_loc3_);
            }
            _loc3_++;
         }
         return null;
      }
      
      public function get minX() : int
      {
         return this._minX;
      }
      
      public function get maxX() : int
      {
         return this.var_495;
      }
      
      public function get minY() : int
      {
         return this.var_496;
      }
      
      public function get maxY() : int
      {
         return this.var_494;
      }
      
      public function get tileMapWidth() : int
      {
         return this.var_234;
      }
      
      public function get tileMapHeight() : int
      {
         return this._height;
      }
      
      public function get planeCount() : int
      {
         return this.var_162.length;
      }
      
      public function get floorHeight() : Number
      {
         return this.var_981;
      }
      
      public function get wallHeight() : Number
      {
         return this.var_1681;
      }
      
      public function set wallHeight(param1:Number) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         this.var_1681 = param1;
      }
      
      public function get wallThicknessMultiplier() : Number
      {
         return this.var_1641;
      }
      
      public function set wallThicknessMultiplier(param1:Number) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         this.var_1641 = param1;
      }
      
      public function get floorThicknessMultiplier() : Number
      {
         return this.var_1133;
      }
      
      public function set floorThicknessMultiplier(param1:Number) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         this.var_1133 = param1;
      }
      
      public function dispose() : void
      {
         this.var_162 = null;
         this.var_123 = null;
         this._tileMatrixOriginal = null;
         this.var_595 = null;
         if(this.var_352 != null)
         {
            this.var_352.dispose();
            this.var_352 = null;
         }
      }
      
      public function reset() : void
      {
         this.var_162 = [];
         this.var_123 = [];
         this._tileMatrixOriginal = [];
         this.var_123 = [];
         this._tileMatrixOriginal = [];
         this.var_234 = 0;
         this._height = 0;
         this._minX = 0;
         this.var_495 = 0;
         this.var_496 = 0;
         this.var_494 = 0;
         this.var_981 = 0;
         this.var_595 = [];
      }
      
      public function initializeTileMap(param1:int, param2:int) : Boolean
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:int = 0;
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(param2 < 0)
         {
            param2 = 0;
         }
         this.var_123 = [];
         this._tileMatrixOriginal = [];
         this.var_595 = [];
         var _loc3_:int = 0;
         while(_loc3_ < param2)
         {
            _loc4_ = [];
            _loc5_ = [];
            _loc6_ = [];
            _loc7_ = 0;
            while(_loc7_ < param1)
            {
               _loc4_[_loc7_] = const_69;
               _loc5_[_loc7_] = const_69;
               _loc6_[_loc7_] = false;
               _loc7_++;
            }
            this.var_123.push(_loc4_);
            this._tileMatrixOriginal.push(_loc5_);
            this.var_595.push(_loc6_);
            _loc3_++;
         }
         this.var_234 = param1;
         this._height = param2;
         this._minX = this.var_234;
         this.var_495 = -1;
         this.var_496 = this._height;
         this.var_494 = -1;
         return true;
      }
      
      public function setTileHeight(param1:int, param2:int, param3:Number) : Boolean
      {
         var _loc4_:* = null;
         var _loc5_:Boolean = false;
         var _loc6_:int = 0;
         var _loc7_:Boolean = false;
         var _loc8_:int = 0;
         if(param1 >= 0 && param1 < this.var_234 && param2 >= 0 && param2 < this._height)
         {
            _loc4_ = this.var_123[param2] as Array;
            _loc4_[param1] = param3;
            if(param3 >= 0)
            {
               if(param1 < this._minX)
               {
                  this._minX = param1;
               }
               if(param1 > this.var_495)
               {
                  this.var_495 = param1;
               }
               if(param2 < this.var_496)
               {
                  this.var_496 = param2;
               }
               if(param2 > this.var_494)
               {
                  this.var_494 = param2;
               }
            }
            else
            {
               if(param1 == this._minX || param1 == this.var_495)
               {
                  _loc5_ = false;
                  _loc6_ = this.var_496;
                  while(_loc6_ < this.var_494)
                  {
                     if(this.getTileHeightInternal(param1,_loc6_) >= 0)
                     {
                        _loc5_ = true;
                        break;
                     }
                     _loc6_++;
                  }
                  if(!_loc5_)
                  {
                     if(param1 == this._minX)
                     {
                        ++this._minX;
                     }
                     if(param1 == this.var_495)
                     {
                        --this.var_495;
                     }
                  }
               }
               if(param2 == this.var_496 || param2 == this.var_494)
               {
                  _loc7_ = false;
                  _loc8_ = this._minX;
                  while(_loc8_ < this.var_495)
                  {
                     if(this.getTileHeight(_loc8_,param2) >= 0)
                     {
                        _loc7_ = true;
                        break;
                     }
                     _loc8_++;
                  }
                  if(!_loc7_)
                  {
                     if(param2 == this.var_496)
                     {
                        ++this.var_496;
                     }
                     if(param2 == this.var_494)
                     {
                        --this.var_494;
                     }
                  }
               }
            }
            return true;
         }
         return false;
      }
      
      public function getTileHeight(param1:int, param2:int) : Number
      {
         if(param1 < 0 || param1 >= this.var_234 || param2 < 0 || param2 >= this._height)
         {
            return const_69;
         }
         var _loc3_:Array = this.var_123[param2] as Array;
         return Math.abs(_loc3_[param1] as Number);
      }
      
      private function getTileHeightOriginal(param1:int, param2:int) : Number
      {
         if(param1 < 0 || param1 >= this.var_234 || param2 < 0 || param2 >= this._height)
         {
            return const_69;
         }
         if(this.var_595[param2][param1])
         {
            return const_113;
         }
         var _loc3_:Array = this._tileMatrixOriginal[param2] as Array;
         return _loc3_[param1] as Number;
      }
      
      private function getTileHeightInternal(param1:int, param2:int) : Number
      {
         if(param1 < 0 || param1 >= this.var_234 || param2 < 0 || param2 >= this._height)
         {
            return const_69;
         }
         var _loc3_:Array = this.var_123[param2] as Array;
         return _loc3_[param1] as Number;
      }
      
      public function initializeFromTileData(param1:Boolean = false) : Boolean
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         _loc3_ = 0;
         while(_loc3_ < this._height)
         {
            _loc2_ = 0;
            while(_loc2_ < this.var_234)
            {
               this._tileMatrixOriginal[_loc3_][_loc2_] = this.var_123[_loc3_][_loc2_];
               _loc2_++;
            }
            _loc3_++;
         }
         var _loc4_:Point = findEntranceTile(this.var_123);
         _loc3_ = 0;
         while(_loc3_ < this._height)
         {
            _loc2_ = 0;
            while(_loc2_ < this.var_234)
            {
               if(this.var_595[_loc3_][_loc2_])
               {
                  this.var_123[_loc3_][_loc2_] = const_113;
               }
               _loc2_++;
            }
            _loc3_++;
         }
         return this.initialize(_loc4_,param1);
      }
      
      private function initialize(param1:Point, param2:Boolean) : Boolean
      {
         var _loc7_:* = null;
         var _loc8_:int = 0;
         var _loc3_:int = 0;
         if(param1 != null)
         {
            _loc3_ = this.getTileHeight(param1.x,param1.y);
            this.setTileHeight(param1.x,param1.y,const_69);
         }
         this.var_981 = getFloorHeight(this.var_123);
         if(!param2)
         {
            this.createWallPlanes();
         }
         var _loc4_:* = null;
         var _loc5_:* = [];
         var _loc6_:int = 0;
         while(_loc6_ < this.var_123.length)
         {
            _loc4_ = this.var_123[_loc6_];
            _loc7_ = [];
            _loc8_ = 0;
            while(_loc8_ < _loc4_.length)
            {
               _loc7_.push(_loc4_[_loc8_]);
               _loc8_++;
            }
            _loc5_.push(_loc7_);
            _loc6_++;
         }
         while(this.extractFloorPlane(_loc5_,true))
         {
         }
         if(param1 != null)
         {
            this.setTileHeight(param1.x,param1.y,_loc3_);
            _loc4_ = _loc5_[param1.y];
            _loc4_[param1.x] = _loc3_;
            this.extractFloorPlane(_loc5_,false);
         }
         return true;
      }
      
      private function createWallPlanes() : Boolean
      {
         var _loc25_:* = null;
         var _loc26_:int = 0;
         var _loc27_:int = 0;
         var _loc28_:int = 0;
         var _loc29_:* = null;
         var _loc30_:* = null;
         var _loc31_:* = null;
         var _loc32_:int = 0;
         var _loc33_:int = 0;
         var _loc34_:int = 0;
         var _loc35_:Boolean = false;
         var _loc36_:* = NaN;
         var _loc37_:Number = NaN;
         var _loc38_:* = null;
         var _loc39_:Number = NaN;
         var _loc40_:* = null;
         var _loc41_:* = null;
         var _loc42_:int = 0;
         var _loc43_:* = null;
         var _loc44_:Boolean = false;
         var _loc45_:Boolean = false;
         var _loc46_:Boolean = false;
         var _loc47_:Number = NaN;
         var _loc1_:Array = this.var_123;
         if(_loc1_ == null)
         {
            return false;
         }
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:int = _loc1_.length;
         var _loc6_:int = 0;
         if(_loc5_ == 0)
         {
            return false;
         }
         _loc2_ = 0;
         while(_loc2_ < _loc5_)
         {
            _loc4_ = _loc1_[_loc2_] as Array;
            if(_loc4_ == null || _loc4_.length == 0)
            {
               return false;
            }
            if(_loc6_ > 0)
            {
               _loc6_ = Math.min(_loc6_,_loc4_.length);
            }
            else
            {
               _loc6_ = _loc4_.length;
            }
            _loc2_++;
         }
         var _loc7_:Number = getFloorHeight(_loc1_);
         var _loc8_:int = this.minX;
         var _loc9_:int = this.minY;
         _loc9_ = this.minY;
         while(_loc9_ <= this.maxY)
         {
            if(this.getTileHeightInternal(_loc8_,_loc9_) > const_113)
            {
               _loc9_--;
               break;
            }
            _loc9_++;
         }
         var _loc10_:Array = [this.extractTopWall,this.extractRightWall,this.extractBottomWall,this.extractLeftWall];
         var _loc11_:int = 0;
         var _loc12_:Point = new Point(_loc8_,_loc9_);
         var _loc13_:Point = new Point(_loc8_,_loc9_);
         var _loc14_:int = 0;
         var _loc15_:* = [];
         var _loc16_:* = [];
         var _loc17_:* = [];
         var _loc18_:* = [];
         var _loc19_:* = [];
         var _loc20_:* = [];
         var _loc21_:int = 0;
         var _loc22_:Boolean = true;
         while(_loc14_ < 1000)
         {
            _loc15_.push(_loc13_);
            _loc16_.push(_loc11_);
            _loc20_.push(false);
            if(_loc13_.x < this.minX || _loc13_.x > this.maxX || _loc13_.y < this.minY || _loc13_.y > this.maxY)
            {
               _loc19_.push(true);
            }
            else
            {
               _loc19_.push(false);
            }
            _loc25_ = _loc10_[_loc11_](_loc13_);
            if(_loc25_ == null)
            {
               _loc22_ = false;
               break;
            }
            _loc21_ = Math.abs(_loc25_.x - _loc13_.x) + Math.abs(_loc25_.y - _loc13_.y);
            if(_loc13_.x == _loc25_.x || _loc13_.y == _loc25_.y)
            {
               _loc11_ = (_loc11_ - 1 + _loc10_.length) % _loc10_.length;
               _loc21_ += 1;
               _loc18_.push(true);
            }
            else
            {
               _loc11_ = (_loc11_ + 1) % _loc10_.length;
               _loc21_--;
               _loc18_.push(false);
            }
            _loc17_.push(_loc21_);
            if(_loc25_.x == _loc12_.x && _loc25_.y == _loc12_.y && (_loc25_.x != _loc13_.x || _loc25_.y != _loc13_.y))
            {
               break;
            }
            _loc13_ = _loc25_;
            _loc14_++;
         }
         var _loc23_:* = [];
         _loc23_.push(new Vector3d(1,0,0));
         _loc23_.push(new Vector3d(0,1,0));
         _loc23_.push(new Vector3d(-1,0,0));
         _loc23_.push(new Vector3d(0,-1,0));
         var _loc24_:* = [];
         _loc24_.push(new Vector3d(0,1,0));
         _loc24_.push(new Vector3d(-1,0,0));
         _loc24_.push(new Vector3d(0,-1,0));
         _loc24_.push(new Vector3d(1,0,0));
         if(_loc15_.length != _loc16_.length || _loc16_.length != _loc17_.length || _loc17_.length != _loc18_.length || _loc18_.length != _loc19_.length)
         {
            _loc22_ = false;
         }
         if(_loc22_)
         {
            _loc26_ = _loc15_.length;
            _loc27_ = 0;
            _loc28_ = 0;
            _loc29_ = null;
            _loc2_ = 0;
            while(_loc2_ < _loc26_)
            {
               _loc32_ = _loc2_;
               _loc33_ = _loc2_;
               _loc34_ = 0;
               _loc35_ = false;
               while(!_loc19_[_loc2_] && _loc2_ < _loc26_)
               {
                  if(_loc18_[_loc2_])
                  {
                     _loc34_++;
                  }
                  else if(_loc34_ > 0)
                  {
                     _loc34_--;
                  }
                  if(_loc34_ > 1)
                  {
                     _loc35_ = true;
                  }
                  _loc33_ = _loc2_;
                  _loc2_++;
               }
               if(_loc35_)
               {
                  _loc3_ = _loc32_;
                  while(_loc3_ <= _loc33_)
                  {
                     _loc20_[_loc3_] = true;
                     _loc3_++;
                  }
               }
               _loc2_++;
            }
            _loc2_ = 0;
            while(_loc2_ < _loc26_)
            {
               if(!_loc20_[_loc2_])
               {
                  _loc29_ = _loc15_[_loc2_] as Point;
                  _loc27_ = _loc16_[_loc2_];
                  _loc21_ = _loc17_[_loc2_];
                  _loc30_ = _loc23_[_loc27_];
                  _loc31_ = _loc24_[_loc27_];
                  _loc3_ = 0;
                  while(_loc3_ < _loc21_)
                  {
                     if(this.getTileHeightInternal(_loc29_.x + _loc3_ * _loc30_.x - _loc31_.x,_loc29_.y + _loc3_ * _loc30_.y - _loc31_.y) == const_113)
                     {
                        _loc20_[_loc2_] = true;
                        break;
                     }
                     _loc3_++;
                  }
               }
               _loc2_++;
            }
            _loc2_ = 0;
            while(_loc2_ < _loc26_)
            {
               if(!_loc20_[_loc2_])
               {
                  _loc29_ = _loc15_[_loc2_] as Point;
                  _loc27_ = _loc16_[_loc2_];
                  _loc21_ = _loc17_[_loc2_];
                  _loc30_ = _loc23_[_loc27_];
                  _loc31_ = _loc24_[_loc27_];
                  _loc36_ = -1;
                  _loc3_ = 0;
                  while(_loc3_ < _loc21_)
                  {
                     _loc47_ = this.getTileHeightInternal(_loc29_.x + _loc3_ * _loc30_.x + _loc31_.x,_loc29_.y + _loc3_ * _loc30_.y + _loc31_.y);
                     if(_loc47_ >= 0 && (_loc47_ < _loc36_ || _loc36_ < 0))
                     {
                        _loc36_ = Number(_loc47_);
                     }
                     _loc3_++;
                  }
                  _loc37_ = _loc36_;
                  _loc38_ = new Vector3d(_loc29_.x,_loc29_.y,_loc37_);
                  _loc38_ = Vector3d.sum(_loc38_,Vector3d.product(_loc31_,0.5));
                  _loc38_ = Vector3d.sum(_loc38_,Vector3d.product(_loc30_,-0.5));
                  _loc39_ = this.wallHeight + _loc7_ - _loc36_;
                  _loc40_ = Vector3d.product(_loc30_,-_loc21_);
                  _loc41_ = new Vector3d(0,0,_loc39_);
                  _loc38_ = Vector3d.dif(_loc38_,_loc40_);
                  _loc28_ = _loc16_[(_loc2_ + 1) % _loc16_.length];
                  _loc42_ = _loc16_[(_loc2_ - 1 + _loc16_.length) % _loc16_.length];
                  _loc43_ = null;
                  if((_loc28_ - _loc27_ + 4) % 4 == 3)
                  {
                     _loc43_ = _loc24_[_loc28_];
                  }
                  else if((_loc27_ - _loc42_ + 4) % 4 == 3)
                  {
                     _loc43_ = _loc24_[_loc42_];
                  }
                  _loc44_ = _loc18_[_loc2_];
                  _loc45_ = _loc18_[(_loc2_ - 1 + _loc26_) % _loc26_];
                  _loc46_ = _loc20_[(_loc2_ + 1) % _loc26_];
                  this.addWall(_loc38_,_loc40_,_loc41_,_loc43_,!_loc45_,!_loc44_,!_loc46_);
               }
               _loc2_++;
            }
         }
         _loc3_ = 0;
         while(_loc3_ < this.tileMapHeight)
         {
            _loc2_ = 0;
            while(_loc2_ < this.tileMapWidth)
            {
               if(this.getTileHeightInternal(_loc2_,_loc3_) < 0)
               {
                  this.setTileHeight(_loc2_,_loc3_,-(_loc7_ + this.wallHeight));
               }
               _loc2_++;
            }
            _loc3_++;
         }
         return true;
      }
      
      private function extractTopWall(param1:Point) : Point
      {
         if(param1 == null)
         {
            return null;
         }
         var _loc2_:int = 1;
         while(_loc2_ < 1000)
         {
            if(this.getTileHeightInternal(param1.x + _loc2_,param1.y) > const_113)
            {
               return new Point(param1.x + _loc2_ - 1,param1.y);
            }
            if(this.getTileHeightInternal(param1.x + _loc2_,param1.y + 1) <= const_113)
            {
               return new Point(param1.x + _loc2_,param1.y + 1);
            }
            _loc2_++;
         }
         return null;
      }
      
      private function extractRightWall(param1:Point) : Point
      {
         if(param1 == null)
         {
            return null;
         }
         var _loc2_:int = 1;
         while(_loc2_ < 1000)
         {
            if(this.getTileHeightInternal(param1.x,param1.y + _loc2_) > const_113)
            {
               return new Point(param1.x,param1.y + (_loc2_ - 1));
            }
            if(this.getTileHeightInternal(param1.x - 1,param1.y + _loc2_) <= const_113)
            {
               return new Point(param1.x - 1,param1.y + _loc2_);
            }
            _loc2_++;
         }
         return null;
      }
      
      private function extractBottomWall(param1:Point) : Point
      {
         if(param1 == null)
         {
            return null;
         }
         var _loc2_:int = 1;
         while(_loc2_ < 1000)
         {
            if(this.getTileHeightInternal(param1.x - _loc2_,param1.y) > const_113)
            {
               return new Point(param1.x - (_loc2_ - 1),param1.y);
            }
            if(this.getTileHeightInternal(param1.x - _loc2_,param1.y - 1) <= const_113)
            {
               return new Point(param1.x - _loc2_,param1.y - 1);
            }
            _loc2_++;
         }
         return null;
      }
      
      private function extractLeftWall(param1:Point) : Point
      {
         if(param1 == null)
         {
            return null;
         }
         var _loc2_:int = 1;
         while(_loc2_ < 1000)
         {
            if(this.getTileHeightInternal(param1.x,param1.y - _loc2_) > const_113)
            {
               return new Point(param1.x,param1.y - (_loc2_ - 1));
            }
            if(this.getTileHeightInternal(param1.x + 1,param1.y - _loc2_) <= const_113)
            {
               return new Point(param1.x + 1,param1.y - _loc2_);
            }
            _loc2_++;
         }
         return null;
      }
      
      private function addWall(param1:IVector3d, param2:IVector3d, param3:IVector3d, param4:IVector3d, param5:Boolean, param6:Boolean, param7:Boolean) : void
      {
         var _loc12_:* = null;
         this.addPlane(RoomPlaneData.const_256,param1,param2,param3,[param4]);
         this.addPlane(RoomPlaneData.const_449,param1,param2,param3,[param4]);
         var _loc8_:Number = const_1387 * this.var_1641;
         var _loc9_:Number = const_730 * this.var_1133;
         var _loc10_:Vector3d = Vector3d.crossProduct(param2,param3);
         var _loc11_:Vector3d = Vector3d.product(_loc10_,1 / _loc10_.length * -_loc8_);
         this.addPlane(RoomPlaneData.const_256,Vector3d.sum(param1,param3),param2,_loc11_,[_loc10_,param4]);
         if(param5)
         {
            this.addPlane(RoomPlaneData.const_256,Vector3d.sum(Vector3d.sum(param1,param2),param3),Vector3d.product(param3,-(param3.length + _loc9_) / param3.length),_loc11_,[_loc10_,param4]);
         }
         if(param6)
         {
            this.addPlane(RoomPlaneData.const_256,Vector3d.sum(param1,Vector3d.product(param3,-_loc9_ / param3.length)),Vector3d.product(param3,(param3.length + _loc9_) / param3.length),_loc11_,[_loc10_,param4]);
            if(param7)
            {
               _loc12_ = Vector3d.product(param2,_loc8_ / param2.length);
               this.addPlane(RoomPlaneData.const_256,Vector3d.sum(Vector3d.sum(param1,param3),Vector3d.product(_loc12_,-1)),_loc12_,_loc11_,[_loc10_,param2,param4]);
            }
         }
      }
      
      private function findFloorRectangle(param1:Array, param2:int, param3:int) : RoomFloorRectangle
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:int = 0;
         var _loc9_:int = param2;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:* = -1;
         var _loc13_:* = 0;
         _loc5_ = 0;
         while(_loc5_ < param3)
         {
            _loc6_ = param1[_loc5_] as Array;
            _loc7_ = param1[_loc10_] as Array;
            if(_loc12_ >= 0)
            {
               if(_loc8_ > 0 && Number(_loc6_[_loc8_ - 1]) != Number(_loc7_[_loc8_ - 1]))
               {
                  _loc11_ = _loc5_;
                  break;
               }
               if(_loc9_ < param2 && _loc6_[_loc9_] != Number(_loc7_[_loc9_]))
               {
                  _loc11_ = _loc5_;
                  break;
               }
            }
            _loc4_ = _loc8_;
            while(_loc4_ < _loc9_)
            {
               _loc13_ = Number(Number(_loc6_[_loc4_]));
               if(_loc13_ >= 0)
               {
                  if(_loc12_ < 0)
                  {
                     _loc10_ = _loc5_;
                     _loc8_ = _loc4_;
                     _loc12_ = Number(_loc13_);
                  }
                  else if(_loc13_ != _loc12_)
                  {
                     if(_loc5_ > _loc10_)
                     {
                        _loc11_ = _loc5_;
                        _loc5_ = param3;
                        break;
                     }
                     _loc9_ = _loc4_;
                  }
               }
               else if(_loc12_ >= 0)
               {
                  if(_loc5_ == _loc10_)
                  {
                     _loc9_ = _loc4_;
                  }
                  else if(_loc4_ < _loc9_)
                  {
                     _loc11_ = _loc5_;
                     _loc5_ = param3;
                     break;
                  }
               }
               _loc11_ = _loc5_ + 1;
               _loc4_++;
            }
            _loc5_++;
         }
         if(_loc12_ < 0)
         {
            return null;
         }
         if(_loc9_ - _loc8_ < 1)
         {
            return null;
         }
         if(_loc11_ - _loc10_ < 1)
         {
            return null;
         }
         if(_loc10_ > 0)
         {
            _loc7_ = param1[_loc10_ - 1];
         }
         else
         {
            _loc7_ = null;
         }
         _loc6_ = param1[_loc11_];
         _loc4_ = _loc8_ + 1;
         while(_loc4_ < _loc9_)
         {
            if(_loc6_ != null && _loc6_[_loc4_] >= -1 != _loc6_[_loc8_] >= -1 || _loc7_ != null && _loc7_[_loc4_] >= -1 != _loc7_[_loc8_] >= -1)
            {
               _loc9_ = _loc4_;
               break;
            }
            _loc4_++;
         }
         _loc7_ = param1[_loc10_];
         _loc4_ = _loc10_ + 1;
         while(_loc4_ < _loc11_)
         {
            _loc6_ = param1[_loc4_];
            if(_loc8_ > 0 && _loc6_[_loc8_ - 1] >= -1 != _loc7_[_loc8_ - 1] >= -1 || _loc9_ < param2 && _loc6_[_loc9_] >= -1 != _loc7_[_loc9_] >= -1)
            {
               _loc11_ = _loc4_;
               break;
            }
            _loc4_++;
         }
         return new RoomFloorRectangle(_loc8_,_loc10_,_loc9_,_loc11_,_loc12_);
      }
      
      private function getHeightMapWidth(param1:Array) : int
      {
         var _loc2_:int = param1.length;
         if(_loc2_ == 0)
         {
            return 0;
         }
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         while(_loc6_ < _loc2_)
         {
            _loc3_ = param1[_loc6_] as Array;
            _loc4_ = this.var_123[_loc6_] as Array;
            if(_loc3_ == null || _loc3_.length == 0)
            {
               return 0;
            }
            if(_loc4_ == null || _loc4_.length == 0)
            {
               return 0;
            }
            if(_loc3_.length != _loc4_.length)
            {
               return 0;
            }
            if(_loc5_ > 0)
            {
               if(_loc3_.length < _loc5_)
               {
                  _loc5_ = _loc3_.length;
               }
            }
            else
            {
               _loc5_ = _loc3_.length;
            }
            _loc6_++;
         }
         return _loc5_;
      }
      
      private function getHorizontalStairInfo(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:Number) : RoomStairData
      {
         var _loc15_:int = 0;
         var _loc8_:int = 1;
         var _loc9_:Boolean = false;
         var _loc10_:Boolean = false;
         var _loc11_:Boolean = false;
         if(param4 < 0)
         {
            _loc8_ = 0;
         }
         if(param4 > param6 - 1)
         {
            _loc8_ = 0;
         }
         var _loc12_:int = param1;
         while(_loc12_ < param2)
         {
            if(_loc8_)
            {
               _loc15_ = Math.abs(this.getTileHeightInternal(_loc12_,param4) - this.getTileHeightInternal(_loc12_,param3));
               if(_loc15_ != 1)
               {
                  _loc8_ = 0;
               }
               else
               {
                  _loc8_ = this.getTileHeightInternal(_loc12_,param4) - this.getTileHeightInternal(_loc12_,param3);
               }
            }
            if(!_loc9_ && this.getTileHeightInternal(_loc12_,param4) < param7)
            {
               _loc9_ = true;
            }
            _loc12_++;
         }
         var _loc13_:int = 0;
         var _loc14_:int = param5;
         if(_loc8_)
         {
            _loc13_ = param1 - 1;
            _loc14_ = param2 + 1;
         }
         _loc12_ = param1 - 1;
         while(_loc12_ >= _loc13_)
         {
            _loc15_ = Math.abs(this.getTileHeightOriginal(_loc12_,param4) - this.getTileHeightOriginal(_loc12_,param3));
            if(_loc15_ == 1)
            {
               _loc10_ = true;
            }
            _loc12_--;
         }
         _loc12_ = param2;
         while(_loc12_ < _loc14_)
         {
            _loc15_ = Math.abs(this.getTileHeightOriginal(_loc12_,param4) - this.getTileHeightOriginal(_loc12_,param3));
            if(_loc15_ == 1)
            {
               _loc11_ = true;
            }
            _loc12_++;
         }
         return new RoomStairData(_loc8_,_loc10_,_loc11_,_loc9_);
      }
      
      private function getVerticalStairInfo(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:Number) : RoomStairData
      {
         var _loc15_:int = 0;
         var _loc8_:int = 1;
         var _loc9_:Boolean = false;
         var _loc10_:Boolean = false;
         var _loc11_:Boolean = false;
         if(param4 < 0)
         {
            _loc8_ = 0;
         }
         if(param4 > param5 - 2)
         {
            _loc8_ = 0;
         }
         var _loc12_:int = param1;
         while(_loc12_ < param2)
         {
            if(_loc8_)
            {
               _loc15_ = Math.abs(this.getTileHeightInternal(param4,_loc12_) - this.getTileHeightInternal(param3,_loc12_));
               if(_loc15_ != 1)
               {
                  _loc8_ = 0;
               }
               else
               {
                  _loc8_ = this.getTileHeightInternal(param4,_loc12_) - this.getTileHeightInternal(param3,_loc12_);
               }
            }
            if(!_loc9_ && this.getTileHeightInternal(param4,_loc12_) < param7)
            {
               _loc9_ = true;
            }
            _loc12_++;
         }
         var _loc13_:int = 0;
         var _loc14_:int = param5;
         if(_loc8_)
         {
            _loc13_ = param1 - 1;
            _loc14_ = param2 + 1;
         }
         _loc12_ = param1 - 1;
         while(_loc12_ >= _loc13_)
         {
            _loc15_ = Math.abs(this.getTileHeightOriginal(param4,_loc12_) - this.getTileHeightOriginal(param3,_loc12_));
            if(_loc15_ == 1)
            {
               _loc10_ = true;
            }
            _loc12_--;
         }
         _loc12_ = param2;
         while(_loc12_ < _loc14_)
         {
            _loc15_ = Math.abs(this.getTileHeightOriginal(param4,_loc12_) - this.getTileHeightOriginal(param3,_loc12_));
            if(_loc15_ == 1)
            {
               _loc11_ = true;
            }
            _loc12_++;
         }
         return new RoomStairData(_loc8_,_loc10_,_loc11_,_loc9_);
      }
      
      private function extractFloorPlane(param1:Array, param2:Boolean) : Boolean
      {
         var _loc18_:Boolean = false;
         var _loc19_:Boolean = false;
         var _loc20_:Boolean = false;
         var _loc21_:Boolean = false;
         if(param1 == null || this.var_123 == null || param1 == this.var_123)
         {
            return false;
         }
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:* = null;
         if(param1.length > this.var_123.length)
         {
            return false;
         }
         var _loc6_:int = param1.length;
         if(_loc6_ == 0)
         {
            return false;
         }
         var _loc7_:int = this.getHeightMapWidth(param1);
         if(_loc7_ == 0)
         {
            return false;
         }
         var _loc8_:RoomFloorRectangle = this.findFloorRectangle(param1,_loc7_,_loc6_);
         if(_loc8_ == null)
         {
            return false;
         }
         var _loc9_:Number = _loc8_.right - _loc8_.left;
         var _loc10_:Number = _loc8_.bottom - _loc8_.top;
         var _loc11_:Number = _loc8_.altitude;
         var _loc12_:Number = _loc8_.left - 0.5;
         var _loc13_:Number = _loc8_.top - 0.5;
         var _loc14_:RoomStairData = this.getHorizontalStairInfo(_loc8_.left,_loc8_.right,_loc8_.top,_loc8_.top - 1,_loc7_,_loc6_,_loc11_);
         var _loc15_:RoomStairData = this.getHorizontalStairInfo(_loc8_.left,_loc8_.right,_loc8_.bottom - 1,_loc8_.bottom,_loc7_,_loc6_,_loc11_);
         var _loc16_:RoomStairData = this.getVerticalStairInfo(_loc8_.top,_loc8_.bottom,_loc8_.left,_loc8_.left - 1,_loc7_,_loc6_,_loc11_);
         var _loc17_:RoomStairData = this.getVerticalStairInfo(_loc8_.top,_loc8_.bottom,_loc8_.right - 1,_loc8_.right,_loc7_,_loc6_,_loc11_);
         if(_loc14_.stairHeight)
         {
            if(_loc14_.stairHeight > 0)
            {
               _loc18_ = false;
               _loc19_ = true;
            }
            else
            {
               _loc18_ = true;
               _loc19_ = false;
            }
            this.addFloor(new Vector3d(_loc12_ + _loc9_,_loc13_ + 0.34,_loc11_ + _loc14_.stairHeight / 4 * 2),new Vector3d(-_loc9_,0,0),new Vector3d(0,-0.34,0),_loc17_.border || !_loc14_.neighbourStairMax,_loc16_.border || !_loc14_.neighbourStairMin,_loc19_,_loc18_,0,0,0,0,false,true);
            this.addFloor(new Vector3d(_loc12_ + _loc9_,_loc13_ + 0.67,_loc11_ + _loc14_.stairHeight / 4),new Vector3d(-_loc9_,0,0),new Vector3d(0,-0.33,0),_loc17_.border || !_loc14_.neighbourStairMax,_loc16_.border || !_loc14_.neighbourStairMin,_loc19_,_loc18_,0,0,0,0,false,true);
         }
         if(_loc15_.stairHeight)
         {
            if(_loc15_.stairHeight < 0)
            {
               _loc18_ = false;
               _loc19_ = true;
            }
            else
            {
               _loc18_ = true;
               _loc19_ = false;
            }
            this.addFloor(new Vector3d(_loc12_ + _loc9_,_loc13_ + _loc10_,_loc11_ + _loc15_.stairHeight / 4),new Vector3d(-_loc9_,0,0),new Vector3d(0,-0.33,0),_loc17_.border || !_loc15_.neighbourStairMax,_loc16_.border || !_loc15_.neighbourStairMin,_loc19_,_loc18_,0,0,0,0,false,true);
         }
         if(_loc16_.stairHeight)
         {
            if(_loc16_.stairHeight > 0)
            {
               _loc20_ = false;
               _loc21_ = true;
            }
            else
            {
               _loc20_ = true;
               _loc21_ = false;
            }
            this.addFloor(new Vector3d(_loc12_ + 0.34,_loc13_ + _loc10_,_loc11_ + _loc16_.stairHeight / 4 * 2),new Vector3d(-0.34,0,0),new Vector3d(0,-_loc10_,0),_loc21_,_loc20_,_loc15_.border || !_loc16_.neighbourStairMax,_loc14_.border || !_loc16_.neighbourStairMin,0,0,0,0,true,false);
            this.addFloor(new Vector3d(_loc12_ + 0.67,_loc13_ + _loc10_,_loc11_ + _loc16_.stairHeight / 4),new Vector3d(-0.33,0,0),new Vector3d(0,-_loc10_,0),_loc21_,_loc20_,_loc15_.border || !_loc16_.neighbourStairMax,_loc14_.border || !_loc16_.neighbourStairMin,0,0,0,0,true,false);
         }
         if(_loc17_.stairHeight)
         {
            if(_loc17_.stairHeight < 0)
            {
               _loc20_ = false;
               _loc21_ = true;
            }
            else
            {
               _loc20_ = true;
               _loc21_ = false;
            }
            this.addFloor(new Vector3d(_loc12_ + _loc9_,_loc13_ + _loc10_,_loc11_ + _loc17_.stairHeight / 4),new Vector3d(-0.33,0,0),new Vector3d(0,-_loc10_,0),_loc21_,_loc20_,_loc15_.border || !_loc17_.neighbourStairMax,_loc14_.border || !_loc17_.neighbourStairMin,0,0,0,0,true,false);
         }
         _loc4_ = _loc8_.top;
         while(_loc4_ < _loc8_.bottom)
         {
            _loc5_ = param1[_loc4_];
            _loc3_ = _loc8_.left;
            while(_loc3_ < _loc8_.right)
            {
               _loc5_[_loc3_] = -1;
               _loc3_++;
            }
            _loc4_++;
         }
         var _loc22_:* = 0;
         var _loc23_:* = 0;
         var _loc24_:* = 0;
         var _loc25_:* = 0;
         if(_loc16_.stairHeight || _loc16_.neighbourStair)
         {
            _loc23_ = 0.65;
         }
         if(_loc17_.stairHeight || _loc17_.neighbourStair)
         {
            _loc22_ = 0.3;
         }
         if(_loc14_.stairHeight || _loc14_.neighbourStair)
         {
            _loc25_ = 0.65;
         }
         if(_loc15_.stairHeight || _loc15_.neighbourStair)
         {
            _loc24_ = 0.3;
         }
         this.addFloor(new Vector3d(_loc12_ + _loc9_,_loc13_ + _loc10_,_loc11_),new Vector3d(-_loc9_,0,0),new Vector3d(0,-_loc10_,0),_loc17_.border && param2,_loc16_.border && param2,_loc15_.border && param2,_loc14_.border && param2,_loc22_,_loc23_,_loc24_,_loc25_,false,false);
         return true;
      }
      
      private function addFloor(param1:IVector3d, param2:IVector3d, param3:IVector3d, param4:Boolean, param5:Boolean, param6:Boolean, param7:Boolean, param8:Number, param9:Number, param10:Number, param11:Number, param12:Boolean, param13:Boolean) : void
      {
         var _loc18_:Number = NaN;
         var _loc19_:Number = NaN;
         var _loc20_:Number = NaN;
         var _loc14_:RoomPlaneData = this.addPlane(RoomPlaneData.const_313,param1,param2,param3);
         var _loc15_:IVector3d = param1;
         var _loc16_:* = null;
         var _loc17_:* = null;
         if(_loc14_)
         {
            _loc18_ = const_730 * this.var_1133;
            _loc19_ = _loc18_;
            if(this.var_1133 > 1)
            {
               _loc19_ = const_730;
            }
            if(param8 > 0)
            {
               _loc14_.addMask(0,0,param8 - 0.02,param3.length);
            }
            if(param9 > 0)
            {
               _loc14_.addMask(param2.length - param9,0,param9,param3.length);
            }
            if(param10 > 0)
            {
               _loc14_.addMask(0,0,param2.length,param10 - 0.02);
            }
            if(param11 > 0)
            {
               _loc14_.addMask(0,param3.length - param11,param2.length,param11);
            }
            if(param6)
            {
               if(param10 > 0 || param13)
               {
                  _loc15_ = Vector3d.sum(param1,Vector3d.product(param3,param10 / param3.length));
                  _loc20_ = _loc19_;
               }
               else
               {
                  _loc15_ = param1;
                  _loc20_ = _loc18_;
               }
               _loc16_ = this.addPlane(RoomPlaneData.const_313,_loc15_,new Vector3d(0,0,-_loc20_),param2);
               if(_loc16_ != null)
               {
                  if(param8 > 0)
                  {
                     _loc16_.addMask(0,0,_loc18_,param8);
                  }
                  if(param9 > 0)
                  {
                     _loc16_.addMask(0,param2.length - param9,_loc18_,param9);
                  }
               }
            }
            if(param7)
            {
               if(param11 > 0 || param13)
               {
                  _loc15_ = Vector3d.sum(param1,Vector3d.sum(param2,Vector3d.product(param3,1 - param11 / param3.length)));
                  _loc20_ = _loc19_;
               }
               else
               {
                  _loc15_ = Vector3d.sum(param1,Vector3d.sum(param2,param3));
                  _loc20_ = _loc18_;
               }
               _loc16_ = this.addPlane(RoomPlaneData.const_313,_loc15_,new Vector3d(0,0,-_loc20_),Vector3d.product(param2,-1));
               if(_loc16_ != null)
               {
                  if(param9 > 0)
                  {
                     _loc16_.addMask(0,0,_loc18_,param9);
                  }
                  if(param8 > 0)
                  {
                     _loc16_.addMask(0,param2.length - param8,_loc18_,param8);
                  }
               }
            }
            if(param4)
            {
               if(param8 > 0 || param12)
               {
                  _loc15_ = Vector3d.sum(param1,Vector3d.sum(param3,Vector3d.product(param2,param8 / param2.length)));
                  _loc20_ = _loc19_;
               }
               else
               {
                  _loc15_ = Vector3d.sum(param1,param3);
                  _loc20_ = _loc18_;
               }
               _loc17_ = this.addPlane(RoomPlaneData.const_313,_loc15_,new Vector3d(0,0,-_loc20_),Vector3d.product(param3,-1));
               if(_loc17_ != null)
               {
                  if(param11 > 0)
                  {
                     _loc17_.addMask(0,0,_loc18_,param11);
                  }
                  if(param10 > 0)
                  {
                     _loc17_.addMask(0,param3.length - param10,_loc18_,param10);
                  }
               }
            }
            if(param5)
            {
               if(param9 > 0 || param12)
               {
                  _loc15_ = Vector3d.sum(param1,Vector3d.product(param2,1 - param9 / param2.length));
                  _loc20_ = _loc19_;
               }
               else
               {
                  _loc15_ = Vector3d.sum(param1,param2);
                  _loc20_ = _loc18_;
               }
               _loc17_ = this.addPlane(RoomPlaneData.const_313,_loc15_,new Vector3d(0,0,-_loc20_),param3);
               if(_loc17_ != null)
               {
                  if(param10 > 0)
                  {
                     _loc17_.addMask(0,0,_loc18_,param10);
                  }
                  if(param11 > 0)
                  {
                     _loc17_.addMask(0,param3.length - param11,_loc18_,param11);
                  }
               }
            }
         }
      }
      
      public function initializeFromXML(param1:XML) : Boolean
      {
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:int = 0;
         var _loc10_:* = null;
         var _loc11_:Number = NaN;
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc14_:int = 0;
         var _loc15_:* = null;
         if(param1 == null)
         {
            return false;
         }
         this.reset();
         this.resetFloorHoles();
         if(!XMLValidator.checkRequiredAttributes(param1.tileMap[0],["width","height","wallHeight"]))
         {
            return false;
         }
         var _loc2_:int = parseInt(param1.tileMap.@width);
         var _loc3_:int = parseInt(param1.tileMap.@height);
         var _loc4_:Number = parseFloat(param1.tileMap.@wallHeight);
         this.initializeTileMap(_loc2_,_loc3_);
         var _loc5_:XMLList = param1.tileMap.tileRow;
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_.length())
         {
            _loc7_ = _loc5_[_loc6_];
            _loc8_ = _loc7_.tile;
            _loc9_ = 0;
            while(_loc9_ < _loc8_.length())
            {
               _loc10_ = _loc8_[_loc9_];
               _loc11_ = parseFloat(_loc10_.@height);
               this.setTileHeight(_loc9_,_loc6_,_loc11_);
               _loc9_++;
            }
            _loc6_++;
         }
         if(param1.holeMap.length() > 0)
         {
            _loc12_ = param1.holeMap[0];
            _loc13_ = _loc12_.hole;
            _loc14_ = 0;
            while(_loc14_ < _loc13_.length())
            {
               _loc15_ = _loc13_[_loc14_];
               if(XMLValidator.checkRequiredAttributes(_loc15_,["id","x","y","width","height"]))
               {
                  this.addFloorHole(_loc15_.@id,_loc15_.@x,_loc15_.@y,_loc15_.@width,_loc15_.@height);
               }
               _loc14_++;
            }
            this.initializeHoleMap();
         }
         this.wallHeight = _loc4_;
         this.initializeFromTileData();
         return true;
      }
      
      private function addPlane(param1:int, param2:IVector3d, param3:IVector3d, param4:IVector3d, param5:Array = null) : RoomPlaneData
      {
         if(param3.length == 0 || param4.length == 0)
         {
            return null;
         }
         var _loc6_:RoomPlaneData = new RoomPlaneData(param1,param2,param3,param4,param5);
         this.var_162.push(_loc6_);
         return _loc6_;
      }
      
      public function getXML() : XML
      {
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:int = 0;
         var _loc10_:Number = NaN;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc13_:int = 0;
         var _loc14_:* = null;
         var _loc1_:XML = <tileMap width="{this.var_234}" height="{this._height}" wallHeight="{this.var_1681}"/>;
         var _loc2_:int = 0;
         while(_loc2_ < this._height)
         {
            _loc7_ = <tileRow/>;
            _loc8_ = this._tileMatrixOriginal[_loc2_];
            _loc9_ = 0;
            while(_loc9_ < this.var_234)
            {
               _loc10_ = _loc8_[_loc9_];
               _loc11_ = <tile height="{_loc10_}"/>;
               _loc7_.appendChild(_loc11_);
               _loc9_++;
            }
            _loc1_.appendChild(_loc7_);
            _loc2_++;
         }
         var _loc3_:XML = <holeMap/>;
         var _loc4_:int = 0;
         while(_loc4_ < this.var_352.length)
         {
            _loc12_ = this.var_352.getWithIndex(_loc4_);
            if(_loc12_ != null)
            {
               _loc13_ = this.var_352.getKey(_loc4_);
               _loc14_ = <hole id="{_loc13_}" x="{_loc12_.x}" y="{_loc12_.y}" width="{_loc12_.width}" height="{_loc12_.height}"/>;
               _loc3_.appendChild(_loc14_);
            }
            _loc4_++;
         }
         var _loc5_:XML = <roomData/>;
         _loc5_.appendChild(_loc1_);
         _loc5_.appendChild(_loc3_);
         var _loc6_:XML = <dimensions minX="{this.minX}" maxX="{this.maxX}" minY="{this.minY}" maxY="{this.maxY}"/>;
         _loc5_.appendChild(_loc6_);
         return _loc5_;
      }
      
      public function getPlaneLocation(param1:int) : IVector3d
      {
         if(param1 < 0 || param1 >= this.planeCount)
         {
            return null;
         }
         var _loc2_:RoomPlaneData = this.var_162[param1] as RoomPlaneData;
         if(_loc2_ != null)
         {
            return _loc2_.loc;
         }
         return null;
      }
      
      public function getPlaneNormal(param1:int) : IVector3d
      {
         if(param1 < 0 || param1 >= this.planeCount)
         {
            return null;
         }
         var _loc2_:RoomPlaneData = this.var_162[param1] as RoomPlaneData;
         if(_loc2_ != null)
         {
            return _loc2_.normal;
         }
         return null;
      }
      
      public function getPlaneLeftSide(param1:int) : IVector3d
      {
         if(param1 < 0 || param1 >= this.planeCount)
         {
            return null;
         }
         var _loc2_:RoomPlaneData = this.var_162[param1] as RoomPlaneData;
         if(_loc2_ != null)
         {
            return _loc2_.leftSide;
         }
         return null;
      }
      
      public function getPlaneRightSide(param1:int) : IVector3d
      {
         if(param1 < 0 || param1 >= this.planeCount)
         {
            return null;
         }
         var _loc2_:RoomPlaneData = this.var_162[param1] as RoomPlaneData;
         if(_loc2_ != null)
         {
            return _loc2_.rightSide;
         }
         return null;
      }
      
      public function getPlaneNormalDirection(param1:int) : IVector3d
      {
         if(param1 < 0 || param1 >= this.planeCount)
         {
            return null;
         }
         var _loc2_:RoomPlaneData = this.var_162[param1] as RoomPlaneData;
         if(_loc2_ != null)
         {
            return _loc2_.normalDirection;
         }
         return null;
      }
      
      public function getPlaneSecondaryNormals(param1:int) : Array
      {
         var _loc3_:* = null;
         var _loc4_:int = 0;
         if(param1 < 0 || param1 >= this.planeCount)
         {
            return null;
         }
         var _loc2_:RoomPlaneData = this.var_162[param1] as RoomPlaneData;
         if(_loc2_ != null)
         {
            _loc3_ = [];
            _loc4_ = 0;
            while(_loc4_ < _loc2_.secondaryNormalCount)
            {
               _loc3_.push(_loc2_.getSecondaryNormal(_loc4_));
               _loc4_++;
            }
            return _loc3_;
         }
         return null;
      }
      
      public function getPlaneType(param1:int) : int
      {
         if(param1 < 0 || param1 >= this.planeCount)
         {
            return RoomPlaneData.const_1341;
         }
         var _loc2_:RoomPlaneData = this.var_162[param1] as RoomPlaneData;
         if(_loc2_ != null)
         {
            return _loc2_.type;
         }
         return RoomPlaneData.const_1341;
      }
      
      public function getPlaneMaskCount(param1:int) : int
      {
         if(param1 < 0 || param1 >= this.planeCount)
         {
            return 0;
         }
         var _loc2_:RoomPlaneData = this.var_162[param1] as RoomPlaneData;
         if(_loc2_ != null)
         {
            return _loc2_.maskCount;
         }
         return 0;
      }
      
      public function getPlaneMaskLeftSideLoc(param1:int, param2:int) : Number
      {
         if(param1 < 0 || param1 >= this.planeCount)
         {
            return -1;
         }
         var _loc3_:RoomPlaneData = this.var_162[param1] as RoomPlaneData;
         if(_loc3_ != null)
         {
            return _loc3_.getMaskLeftSideLoc(param2);
         }
         return -1;
      }
      
      public function getPlaneMaskRightSideLoc(param1:int, param2:int) : Number
      {
         if(param1 < 0 || param1 >= this.planeCount)
         {
            return -1;
         }
         var _loc3_:RoomPlaneData = this.var_162[param1] as RoomPlaneData;
         if(_loc3_ != null)
         {
            return _loc3_.getMaskRightSideLoc(param2);
         }
         return -1;
      }
      
      public function getPlaneMaskLeftSideLength(param1:int, param2:int) : Number
      {
         if(param1 < 0 || param1 >= this.planeCount)
         {
            return -1;
         }
         var _loc3_:RoomPlaneData = this.var_162[param1] as RoomPlaneData;
         if(_loc3_ != null)
         {
            return _loc3_.getMaskLeftSideLength(param2);
         }
         return -1;
      }
      
      public function getPlaneMaskRightSideLength(param1:int, param2:int) : Number
      {
         if(param1 < 0 || param1 >= this.planeCount)
         {
            return -1;
         }
         var _loc3_:RoomPlaneData = this.var_162[param1] as RoomPlaneData;
         if(_loc3_ != null)
         {
            return _loc3_.getMaskRightSideLength(param2);
         }
         return -1;
      }
      
      public function addFloorHole(param1:int, param2:int, param3:int, param4:int, param5:int) : void
      {
         this.removeFloorHole(param1);
         var _loc6_:RoomFloorHole = new RoomFloorHole(param2,param3,param4,param5);
         this.var_352.add(param1,_loc6_);
      }
      
      public function removeFloorHole(param1:int) : void
      {
         this.var_352.remove(param1);
      }
      
      public function resetFloorHoles() : void
      {
         this.var_352.reset();
      }
      
      private function initializeHoleMap() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:* = null;
         var _loc5_:* = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         _loc2_ = 0;
         while(_loc2_ < this._height)
         {
            _loc3_ = this.var_595[_loc2_];
            _loc1_ = 0;
            while(_loc1_ < this.var_234)
            {
               _loc3_[_loc1_] = false;
               _loc1_++;
            }
            _loc2_++;
         }
         var _loc4_:int = 0;
         while(_loc4_ < this.var_352.length)
         {
            _loc5_ = this.var_352.getWithIndex(_loc4_);
            if(_loc5_ != null)
            {
               _loc6_ = _loc5_.x;
               _loc7_ = _loc5_.x + _loc5_.width - 1;
               _loc8_ = _loc5_.y;
               _loc9_ = _loc5_.y + _loc5_.height - 1;
               _loc6_ = _loc6_ < 0 ? 0 : int(_loc6_);
               _loc7_ = _loc7_ >= this.var_234 ? int(this.var_234 - 1) : int(_loc7_);
               _loc8_ = _loc8_ < 0 ? 0 : int(_loc8_);
               _loc9_ = _loc9_ >= this._height ? int(this._height - 1) : int(_loc9_);
               _loc2_ = _loc8_;
               while(_loc2_ <= _loc9_)
               {
                  _loc3_ = this.var_595[_loc2_];
                  _loc1_ = _loc6_;
                  while(_loc1_ <= _loc7_)
                  {
                     _loc3_[_loc1_] = true;
                     _loc1_++;
                  }
                  _loc2_++;
               }
            }
            _loc4_++;
         }
      }
   }
}
