package com.sulake.habbo.room.messages
{
   import com.sulake.room.messages.RoomObjectUpdateMessage;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomObjectRoomMaskUpdateMessage extends RoomObjectUpdateMessage
   {
      
      public static const const_620:String = "RORMUM_ADD_MASK";
      
      public static const const_769:String = "RORMUM_ADD_MASK";
      
      public static const const_1901:String = "door";
      
      public static const const_565:String = "window";
      
      public static const const_312:String = "hole";
       
      
      private var _type:String = "";
      
      private var var_2901:String = "";
      
      private var var_2899:String = "";
      
      private var var_2900:Vector3d = null;
      
      private var var_2898:String = "window";
      
      public function RoomObjectRoomMaskUpdateMessage(param1:String, param2:String, param3:String = null, param4:IVector3d = null, param5:String = "window")
      {
         super(null,null);
         this._type = param1;
         this.var_2901 = param2;
         this.var_2899 = param3;
         if(param4 != null)
         {
            this.var_2900 = new Vector3d(param4.x,param4.y,param4.z);
         }
         this.var_2898 = param5;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get maskId() : String
      {
         return this.var_2901;
      }
      
      public function get maskType() : String
      {
         return this.var_2899;
      }
      
      public function get maskLocation() : IVector3d
      {
         return this.var_2900;
      }
      
      public function get maskCategory() : String
      {
         return this.var_2898;
      }
   }
}
