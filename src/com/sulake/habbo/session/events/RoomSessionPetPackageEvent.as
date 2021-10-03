package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionPetPackageEvent extends RoomSessionEvent
   {
      
      public static const const_526:String = "RSOPPE_OPEN_PET_PACKAGE_REQUESTED";
      
      public static const const_625:String = "RSOPPE_OPEN_PET_PACKAGE_RESULT";
       
      
      private var var_238:int = -1;
      
      private var var_1234:int = -1;
      
      private var var_1870:int = -1;
      
      private var _color:String = "";
      
      private var var_2026:int = 0;
      
      private var var_1813:String = null;
      
      public function RoomSessionPetPackageEvent(param1:String, param2:IRoomSession, param3:int, param4:int, param5:int, param6:String, param7:int, param8:String, param9:Boolean = false, param10:Boolean = false)
      {
         super(param1,param2,param9,param10);
         this.var_238 = param3;
         this.var_1234 = param4;
         this.var_1870 = param5;
         this._color = param6;
         this.var_2026 = param7;
         this.var_1813 = param8;
      }
      
      public function get objectId() : int
      {
         return this.var_238;
      }
      
      public function get petType() : int
      {
         return this.var_1234;
      }
      
      public function get breed() : int
      {
         return this.var_1870;
      }
      
      public function get color() : String
      {
         return this._color;
      }
      
      public function get nameValidationStatus() : int
      {
         return this.var_2026;
      }
      
      public function get nameValidationInfo() : String
      {
         return this.var_1813;
      }
   }
}
