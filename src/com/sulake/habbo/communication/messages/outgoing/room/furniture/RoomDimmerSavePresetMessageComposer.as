package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class RoomDimmerSavePresetMessageComposer implements IMessageComposer
   {
       
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var var_2689:int;
      
      private var var_2688:int;
      
      private var var_2687:String;
      
      private var var_2686:int;
      
      private var var_2685:Boolean;
      
      public function RoomDimmerSavePresetMessageComposer(param1:int, param2:int, param3:String, param4:int, param5:Boolean, param6:int = 0, param7:int = 0)
      {
         super();
         this._roomId = param6;
         this._roomCategory = param7;
         this.var_2689 = param1;
         this.var_2688 = param2;
         this.var_2687 = param3;
         this.var_2686 = param4;
         this.var_2685 = param5;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2689,this.var_2688,this.var_2687,this.var_2686,int(this.var_2685)];
      }
      
      public function dispose() : void
      {
      }
   }
}
